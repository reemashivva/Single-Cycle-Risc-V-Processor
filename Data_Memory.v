`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2025 10:17:34 AM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input clk,
    input reset,
    input Memread,
    input Memwrite,
    input [31:0] read_address,
    input [31:0] Write_data,
    output [31:0] MemData_out
    );
    reg [31:0] D_Memory[63:0];
    integer k;
    
    assign MemData_out = (Memread)? D_Memory[read_address]:32'b00;
    
   /*always @(posedge clk) begin
    D_Memory[17] = 56;
    D_Memory[15] = 65;
    end*/
    
    
    
    always @(posedge clk or posedge reset)
    begin
    if (reset) begin
    for (k=0; k<64; k=k+1) begin
    D_Memory[k] = 32'b00;
    end
    end
    else if (Memwrite) 
    begin
    D_Memory[read_address] = Write_data;
    end
    end
    
    
endmodule
