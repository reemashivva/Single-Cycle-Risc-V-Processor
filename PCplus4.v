`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2025 07:22:25 AM
// Design Name: 
// Module Name: PCplus4
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


module PCplus4(
    input [31:0] fromPC,
    output reg [31:0] NextoPC
    );
    always @ (*)begin
    NextoPC=4+fromPC;
    end
endmodule
