/*
 * Copyright (c) 2024 William Wei
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_project (
    input  wire [15:0] ui_in,     // Dedicated inputs
    input  wire [7:0] uio_in,   // IOs: Input path
    
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
        else uo_out = 8'b00000000;
    end
    else uo_out = 8'bzzzzzzzz;
end
  assign uio_out = 0;
  assign uio_oe  = 0;
  assign uio_in = 0;

  // List all unused inputs to prevent warnings
wire _unused = &{uio_in, ena, clk, rst_n, 1'b0};

endmodule
