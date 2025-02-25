/*
 * Copyright (c) 2024 William Wei
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_project (
    input  wire [15:0] ui_in,     // Dedicated inputs
    input  wire [7:0] uio_in,   // IOs: Input path
    
    output wire [7:0] uo_out,   // Dedicated outputs
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
if (In[15] == 1) uo_out = 8'b0000_1111;
    else if (In[14] == 1) assign uo_out = 8'b0000_1110;
    else if (In[13] == 1) assign uo_out = 8'b0000_1101;
    else if (In[12] == 1) assign uo_out = 8'b0000_1100;
    else if (In[11] == 1) assign uo_out = 8'b0000_1011;
    else if (In[10] == 1) assign uo_out = 8'b0000_1010;
    else if (In[9]  == 1) assign uo_out = 8'b0000_1001;
    else if (In[8]  == 1) assign uo_out = 8'b0000_1000;
    else if (In[7]  == 1) assign uo_out = 8'b0000_0111;
    else if (In[6]  == 1) assign uo_out = 8'b0000_0110;
    else if (In[5]  == 1) assign uo_out = 8'b0000_0101;
    else if (In[4]  == 1) assign uo_out = 8'b0000_0100;
    else if (In[3]  == 1) assign uo_out = 8'b0000_0011;
    else if (In[2]  == 1) assign uo_out = 8'b0000_0010;
    else if (In[1]  == 1) assign uo_out = 8'b0000_0001;
    else if (In[0]  == 1) assign uo_out = 8'b0000_0000;
    else assign uo_out = 8'b1111_0000; // Special case: all zeros

  //assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;
  assign uio_in = 0;

  // List all unused inputs to prevent warnings
wire _unused = &{uio_in, ena, clk, rst_n, 1'b0};

endmodule
