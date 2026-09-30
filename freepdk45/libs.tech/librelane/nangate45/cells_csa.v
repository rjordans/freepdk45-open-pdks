`define FA_CELL         FA_X1  
`define MUX2x1_CELL     MUX2_X1

// n-bit RCA using n FA instances
module rca #(parameter n=32) ( 
    input [n-1:0]     a, b,
    input             ci,
    output [n-1:0]    s,
    output            co
);
    wire [n:0] c;
    
    assign c[0] = ci;
    assign co = c[n];
    
    generate 
        genvar i;
        for(i=0; i<n; i=i+1) 
            `FA_CELL FA ( .COUT(c[i+1]), .CIN(c[i]), .A(a[i]), .B(b[i]), .SUM(s[i]) );
       endgenerate

endmodule

module csa8_4(
    input [7:0]     a, b,
    input             ci,
    output [7:0]    s,
    output            co
);

    wire co0, co10, co11;
    wire [3:0] s10, s11;
    rca #(4) A0  (.a(a[3:0]), .b(b[3:0]), .ci(ci), .co(co0), .s(s[3:0]) );
    rca #(4) A10  (.a(a[7:4]), .b(b[7:4]), .ci(1'b0), .co(co10), .s(s10) );
    rca #(4) A11  (.a(a[7:4]), .b(b[7:4]), .ci(1'b1), .co(co11), .s(s11) );
    `MUX2x1_CELL SMUX [3:0] ( .Z(s[7:4]), .A(s10), .B(s11), .S(co0) );
    `MUX2x1_CELL CMUX ( .Z(co), .A(co10), .B(co11), .S(co0) );

endmodule

module csa16_8( 
    input [15:0]     a, b,
    input             ci,
    output [15:0]    s,
    output            co
);

    wire co0, co10, co11;
    wire [7:0] s10, s11;

    rca #(8) A0  (.a(a[7:0]), .b(b[7:0]), .ci(ci), .co(co0), .s(s[7:0]) );
    rca #(8) A10  (.a(a[15:8]), .b(b[15:8]), .ci(1'b0), .co(co10), .s(s10) );
    rca #(8) A11  (.a(a[15:8]), .b(b[15:8]), .ci(1'b1), .co(co11), .s(s11) );
    `MUX2x1_CELL SMUX [7:0] ( .Z(s[15:8]), .A(s10), .B(s11), .S(co0) );
    `MUX2x1_CELL CMUX ( .Z(co), .A(co10), .B(co11), .S(co0) );

endmodule

module csa32_8x4( 
    input [31:0]     a, b,
    input             ci,
    output [31:0]    s,
    output            co
);
    wire         co0, co1, co2, co3;
    wire [3:1]     c0, c1;
    wire [7:0]     s0[3:1], s1[3:1];
    wire        lo, hi; 

    LOGIC0_X1 zero (.Z(lo));
    LOGIC1_X1 one (.Z(hi));


    csa8_4 A0  (.a(a[7:0]), .b(b[7:0]), .ci(ci), .co(co0), .s(s[7:0]) );
    
    csa8_4 A10  (.a(a[15:8]), .b(b[15:8]), .ci(lo), .co(c0[1]), .s(s0[1]) );
    csa8_4 A11  (.a(a[15:8]), .b(b[15:8]), .ci(hi), .co(c1[1]), .s(s1[1]) );
    `MUX2x1_CELL SMUX1 [7:0] ( .Z(s[15:8]), .A(s0[1]), .B(s1[1]), .S(co0) );
    `MUX2x1_CELL CMUX1 ( .Z(co1), .A(c0[1]), .B(c1[1]), .S(co0) );
    
    csa8_4 A20  (.a(a[23:16]), .b(b[23:16]), .ci(lo), .co(c0[2]), .s(s0[2]) );
    csa8_4 A21  (.a(a[23:16]), .b(b[23:16]), .ci(hi), .co(c1[2]), .s(s1[2]) );
    `MUX2x1_CELL SMUX2 [7:0] ( .Z(s[23:16]), .A(s0[2]), .B(s1[2]), .S(co1) );
    `MUX2x1_CELL CMUX2 ( .Z(co2), .A(c0[2]), .B(c1[2]), .S(co1) );

    csa8_4 A30  (.a(a[31:24]), .b(b[31:24]), .ci(lo), .co(c0[3]), .s(s0[3]) );
    csa8_4 A31  (.a(a[31:24]), .b(b[31:24]), .ci(hi), .co(c1[3]), .s(s1[3]) );
    `MUX2x1_CELL SMUX3 [7:0] ( .Z(s[31:24]), .A(s0[3]), .B(s1[3]), .S(co2) );
    `MUX2x1_CELL CMUX3 ( .Z(co), .A(c0[3]), .B(c1[3]), .S(co2) );
endmodule


// 32-bit Carry Select Adder 2x16rca
module csa32_16( 
    input [31:0]     a, b,
    input             ci,
    output [31:0]    s,
    output            co
);

    wire co0, co10, co11;
    wire [15:0] s10, s11;
    rca #(16) A0  (.a(a[15:0]), .b(b[15:0]), .ci(ci), .co(co0), .s(s[15:0]) );
    rca #(16) A10  (.a(a[31:16]), .b(b[31:16]), .ci(1'b0), .co(co10), .s(s10) );
    rca #(16) A11  (.a(a[31:16]), .b(b[31:16]), .ci(1'b1), .co(co11), .s(s11) );
    `MUX2x1_CELL SMUX [15:0] ( .Z(s[31:16]), .A(s10), .B(s11), .S(co0) );
    `MUX2x1_CELL CMUX ( .Z(co), .A(co10), .B(co11), .S(co0) );

endmodule

module csa32_8( 
    input [31:0]     a, b,
    input             ci,
    output [31:0]    s,
    output            co
);
    wire         co0, co1, co2, co3;
    wire [3:1]     c0, c1;
    wire [7:0]     s0[3:1], s1[3:1];
    wire        lo, hi; 

    LOGIC0_X1 zero (.Z(lo));
    LOGIC1_X1 one (.Z(hi));

    rca #(8) A0  (.a(a[7:0]), .b(b[7:0]), .ci(ci), .co(co0), .s(s[7:0]) );
    
    rca #(8) A10  (.a(a[15:8]), .b(b[15:8]), .ci(lo), .co(c0[1]), .s(s0[1]) );
    rca #(8) A11  (.a(a[15:8]), .b(b[15:8]), .ci(hi), .co(c1[1]), .s(s1[1]) );
    `MUX2x1_CELL SMUX1 [7:0] ( .Z(s[15:8]), .A(s0[1]), .B(s1[1]), .S(co0) );
    `MUX2x1_CELL CMUX1 ( .Z(co1), .A(c0[1]), .B(c1[1]), .S(co0) );
    
    rca #(8) A20  (.a(a[23:16]), .b(b[23:16]), .ci(lo), .co(c0[2]), .s(s0[2]) );
    rca #(8) A21  (.a(a[23:16]), .b(b[23:16]), .ci(hi), .co(c1[2]), .s(s1[2]) );
    `MUX2x1_CELL SMUX2 [7:0] ( .Z(s[23:16]), .A(s0[2]), .B(s1[2]), .S(co1) );
    `MUX2x1_CELL CMUX2 ( .Z(co2), .A(c0[2]), .B(c1[2]), .S(co1) );

    rca #(8) A30  (.a(a[31:24]), .b(b[31:24]), .ci(lo), .co(c0[3]), .s(s0[3]) );
    rca #(8) A31  (.a(a[31:24]), .b(b[31:24]), .ci(hi), .co(c1[3]), .s(s1[3]) );
    `MUX2x1_CELL SMUX3 [7:0] ( .Z(s[31:24]), .A(s0[3]), .B(s1[3]), .S(co2) );
    `MUX2x1_CELL CMUX3 ( .Z(co), .A(c0[3]), .B(c1[3]), .S(co2) );
endmodule

module csa64_16( 
    input [63:0]     a, b,
    input             ci,
    output [63:0]    s,
    output            co
);
    wire         co0, co1, co2, co3;
    wire [3:1]     c0, c1;
    wire [15:0]     s0[3:1], s1[3:1];
    wire        lo, hi; 

    LOGIC0_X1 zero (.Z(lo));
    LOGIC1_X1 one (.Z(hi));

    rca #(16) A0  (.a(a[15:0]), .b(b[15:0]), .ci(ci), .co(co0), .s(s[15:0]) );
    
    rca #(16) A10  (.a(a[31:16]), .b(b[31:16]), .ci(lo), .co(c0[1]), .s(s0[1]) );
    rca #(16) A11  (.a(a[31:16]), .b(b[31:16]), .ci(hi), .co(c1[1]), .s(s1[1]) );
    `MUX2x1_CELL SMUX1 [15:0] ( .Z(s[31:16]), .A(s0[1]), .B(s1[1]), .S(co0) );
    `MUX2x1_CELL CMUX1 ( .Z(co1), .A(c0[1]), .B(c1[1]), .S(co0) );
    
    rca #(16) A20  (.a(a[47:32]), .b(b[47:32]), .ci(lo), .co(c0[2]), .s(s0[2]) );
    rca #(16) A21  (.a(a[47:32]), .b(b[47:32]), .ci(hi), .co(c1[2]), .s(s1[2]) );
    `MUX2x1_CELL SMUX2 [15:0] ( .Z(s[47:32]), .A(s0[2]), .B(s1[2]), .S(co1) );
    `MUX2x1_CELL CMUX2 ( .Z(co2), .A(c0[2]), .B(c1[2]), .S(co1) );

    rca #(16) A30  (.a(a[63:48]), .b(b[63:48]), .ci(lo), .co(c0[3]), .s(s0[3]) );
    rca #(16) A31  (.a(a[63:48]), .b(b[63:48]), .ci(hi), .co(c1[3]), .s(s1[3]) );
    `MUX2x1_CELL SMUX3 [15:0] ( .Z(s[63:48]), .A(s0[3]), .B(s1[3]), .S(co2) );
    `MUX2x1_CELL CMUX3 ( .Z(co), .A(c0[2]), .B(c1[2]), .S(co2) );

endmodule

(* techmap_celltype = "$add" *)
module freepdk45_csa (A, B, Y);
    parameter A_SIGNED = 0;
    parameter B_SIGNED = 0;
    parameter A_WIDTH = 1;
    parameter B_WIDTH = 1;
    parameter Y_WIDTH = 1;

    (* force_downto *)
    input [A_WIDTH-1:0] A;
    (* force_downto *)
    input [B_WIDTH-1:0] B;
    (* force_downto *)
    output [Y_WIDTH-1:0] Y;

    (* force_downto *)
    wire [Y_WIDTH-1:0] CO;

    wire _TECHMAP_FAIL_ = (Y_WIDTH != 8) & (Y_WIDTH != 16) & (Y_WIDTH != 32) & (Y_WIDTH != 64);
 
    (* force_downto *)
    wire [Y_WIDTH-1:0] A_buf, B_buf;
    \$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) A_conv (.A(A), .Y(A_buf));
    \$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(Y_WIDTH)) B_conv (.A(B), .Y(B_buf));

    (* force_downto *)
    wire [Y_WIDTH-1:0] AA = A_buf;
    (* force_downto *)
    wire [Y_WIDTH-1:0] BB = B_buf; 
    
    generate 
        if (Y_WIDTH == 8)
            csa8_4 add8(.a(AA), .b(BB), .ci(1'b0), .s(Y));
        else if (Y_WIDTH == 16)
            csa16_8 add16(.a(AA), .b(BB), .ci(1'b0), .s(Y));
        else  if (Y_WIDTH == 32)
            csa32_16 add32(.a(AA), .b(BB), .ci(1'b0), .s(Y));
        else if (Y_WIDTH == 64)
            csa64_16 add64(.a(AA), .b(BB), .ci(1'b0), .s(Y));
    endgenerate

endmodule

(* techmap_celltype = "$sub" *)
module freepdk45_csa_sub (A, B, Y);
    parameter A_SIGNED = 0;
    parameter B_SIGNED = 0;
    parameter A_WIDTH = 1;
    parameter B_WIDTH = 1;
    parameter Y_WIDTH = 1;

    (* force_downto *)
    input [A_WIDTH-1:0] A;
    (* force_downto *)
    input [B_WIDTH-1:0] B;
    (* force_downto *)
    output [Y_WIDTH-1:0] Y;

    (* force_downto *)
    wire [Y_WIDTH-1:0] CO;

    wire _TECHMAP_FAIL_ = (Y_WIDTH != 8) & (Y_WIDTH != 16) & (Y_WIDTH != 32) & (Y_WIDTH != 64);
 
    (* force_downto *)
    wire [Y_WIDTH-1:0] A_buf, B_buf;
    \$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) A_conv (.A(A), .Y(A_buf));
    \$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(Y_WIDTH)) B_conv (.A(B), .Y(B_buf));

    (* force_downto *)
    wire [Y_WIDTH-1:0] AA = A_buf;
    (* force_downto *)
    wire [Y_WIDTH-1:0] BB = ~B_buf; 

    generate 
        if (Y_WIDTH == 8)
            csa8_4 add8(.a(AA), .b(BB), .ci(1'b1),  .s(Y));
        else if (Y_WIDTH == 16)
            csa16_8 add16(.a(AA), .b(BB), .ci(1'b1), .s(Y));
        else  if (Y_WIDTH == 32)
            csa32_16 add32(.a(AA), .b(BB), .ci(1'b1),.s(Y));
        else if (Y_WIDTH == 64)
            csa64_16 add32(.a(AA), .b(BB), .ci(1'b1), .s(Y));
    endgenerate

endmodule
