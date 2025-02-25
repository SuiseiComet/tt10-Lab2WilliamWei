/*
 * Copyright (c) 2024 William Wei
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_project (
    input  wire [15:0] ui_in,     // Dedicated inputs
    input  wire [7:0] uio_in,     
    
    output reg [7:0] uo_out,   // Dedicated outputs
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

always @(ena, ui_in) 
    begin
    if (ena == 1) 
        begin
            // All output pins must be assigned. If not used, assign to 0.
            if (ui_in[15] == 1) uo_out = 8'b00001111;
            else if (ui_in[14] == 1) uo_out = 8'b00001110;
            else if (ui_in[13] == 1) uo_out = 8'b00001101;
            else if (ui_in[12] == 1) uo_out = 8'b00001100;
            else if (ui_in[11] == 1) uo_out = 8'b00001011;
            else if (ui_in[10] == 1) uo_out = 8'b00001010;
            else if (ui_in[9]  == 1) uo_out = 8'b00001001;
            else if (ui_in[8]  == 1) uo_out = 8'b00001000;
            else if (ui_in[7]  == 1) uo_out = 8'b00000111;
            else if (ui_in[6]  == 1) uo_out = 8'b00000110;
            else if (ui_in[5]  == 1) uo_out = 8'b00000101;
            else if (ui_in[4]  == 1) uo_out = 8'b00000100;
            else if (ui_in[3]  == 1) uo_out = 8'b00000011;
            else if (ui_in[2]  == 1) uo_out = 8'b00000010;
            else if (ui_in[1]  == 1) uo_out = 8'b00000001;
            else if (ui_in[0]  == 1) uo_out = 8'b00000000;
            else uo_out = 8'b00000000;
        end
    else uo_out = 8'bzzzzzzzz;
end
    
  assign uio_out = 0;
  assign uio_oe  = 0;
  assign uio_in = 0;
    
  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
