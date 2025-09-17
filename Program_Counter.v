`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 07:17:31 AM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
    input clk,
    input reset,
    input [31:0]PC_in,
    output reg [31:0]PC_out
    );
    always @(posedge clk or posedge reset)
    begin
    if (reset)begin
    PC_out <= 32'b00;
    end
    else begin
    PC_out<=PC_in;
    end
    end
    
endmodule
