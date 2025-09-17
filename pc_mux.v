`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2025 07:01:22 AM
// Design Name: 
// Module Name: Mux2
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


module pc_mux(
    input [31:0] pc_in,       
    input [31:0] pc_branch,   
    input pc_select,          
    output reg[31:0] pc_out  
);
   always @(*) begin
        if (pc_select) begin
            pc_out = pc_branch;  
        end else begin
            pc_out = pc_in;      
        end
    end

endmodule
