`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2025 07:03:54 AM
// Design Name: 
// Module Name: Mux3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Data_Mem_mux(
    input sel,
    input [31:0] input0,
    input [31:0] input1,
    output [31:0] out
    );
    assign out= (sel)?input1:input0;
endmodule
