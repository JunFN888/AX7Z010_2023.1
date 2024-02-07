// ==============================================================
// Generated by Vitis HLS v2023.1
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module sobel_focus_xFGradientX3x3_0_0_s (
        ap_ready,
        t0_val,
        t2_val,
        m0_val,
        m2_val,
        b0_val,
        b2_val,
        ap_return
);


output   ap_ready;
input  [7:0] t0_val;
input  [7:0] t2_val;
input  [7:0] m0_val;
input  [7:0] m2_val;
input  [7:0] b0_val;
input  [7:0] b2_val;
output  [7:0] ap_return;

wire   [8:0] M00_fu_70_p3;
wire   [8:0] M01_fu_82_p3;
wire   [8:0] zext_ln61_1_fu_98_p1;
wire   [8:0] zext_ln61_fu_94_p1;
wire   [8:0] A00_fu_102_p2;
wire   [8:0] zext_ln62_1_fu_116_p1;
wire   [8:0] zext_ln62_fu_112_p1;
wire   [8:0] S00_fu_120_p2;
wire   [9:0] zext_ln60_fu_90_p1;
wire   [9:0] zext_ln59_fu_78_p1;
wire   [9:0] out_pix_5_fu_130_p2;
wire  signed [10:0] sext_ln66_fu_136_p1;
wire   [10:0] zext_ln62_2_fu_126_p1;
wire   [10:0] out_pix_6_fu_140_p2;
wire   [10:0] zext_ln61_2_fu_108_p1;
wire   [7:0] trunc_ln67_fu_146_p1;
wire   [7:0] add_ln69_1_fu_156_p2;
wire   [10:0] out_pix_fu_150_p2;
wire   [2:0] tmp_2_fu_176_p4;
wire   [0:0] tmp_fu_168_p3;
wire   [0:0] xor_ln72_fu_192_p2;
wire   [0:0] icmp_ln74_fu_186_p2;
wire   [0:0] or_ln72_fu_206_p2;
wire   [7:0] select_ln72_fu_198_p3;
wire   [7:0] add_ln69_fu_162_p2;

assign A00_fu_102_p2 = (zext_ln61_1_fu_98_p1 + zext_ln61_fu_94_p1);

assign M00_fu_70_p3 = {{m0_val}, {1'd0}};

assign M01_fu_82_p3 = {{m2_val}, {1'd0}};

assign S00_fu_120_p2 = (zext_ln62_1_fu_116_p1 + zext_ln62_fu_112_p1);

assign add_ln69_1_fu_156_p2 = (trunc_ln67_fu_146_p1 + t2_val);

assign add_ln69_fu_162_p2 = (add_ln69_1_fu_156_p2 + b2_val);

assign ap_ready = 1'b1;

assign or_ln72_fu_206_p2 = (tmp_fu_168_p3 | icmp_ln74_fu_186_p2);

assign out_pix_5_fu_130_p2 = (zext_ln60_fu_90_p1 - zext_ln59_fu_78_p1);

assign out_pix_6_fu_140_p2 = ($signed(sext_ln66_fu_136_p1) - $signed(zext_ln62_2_fu_126_p1));

assign out_pix_fu_150_p2 = (out_pix_6_fu_140_p2 + zext_ln61_2_fu_108_p1);

assign select_ln72_fu_198_p3 = ((xor_ln72_fu_192_p2[0:0] == 1'b1) ? 8'd255 : 8'd0);

assign sext_ln66_fu_136_p1 = $signed(out_pix_5_fu_130_p2);

assign tmp_2_fu_176_p4 = {{out_pix_fu_150_p2[10:8]}};

assign tmp_fu_168_p3 = out_pix_fu_150_p2[32'd10];

assign trunc_ln67_fu_146_p1 = out_pix_6_fu_140_p2[7:0];

assign xor_ln72_fu_192_p2 = (tmp_fu_168_p3 ^ 1'd1);

assign zext_ln59_fu_78_p1 = M00_fu_70_p3;

assign zext_ln60_fu_90_p1 = M01_fu_82_p3;

assign zext_ln61_1_fu_98_p1 = b2_val;

assign zext_ln61_2_fu_108_p1 = A00_fu_102_p2;

assign zext_ln61_fu_94_p1 = t2_val;

assign zext_ln62_1_fu_116_p1 = b0_val;

assign zext_ln62_2_fu_126_p1 = S00_fu_120_p2;

assign zext_ln62_fu_112_p1 = t0_val;

assign ap_return = ((or_ln72_fu_206_p2[0:0] == 1'b1) ? select_ln72_fu_198_p3 : add_ln69_fu_162_p2);

assign icmp_ln74_fu_186_p2 = (($signed(tmp_2_fu_176_p4) > $signed(3'd0)) ? 1'b1 : 1'b0);

endmodule //sobel_focus_xFGradientX3x3_0_0_s