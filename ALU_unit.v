`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2025 10:01:52 AM
// Design Name: 
// Module Name: ALU_unit
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


module ALU_unit(
    input [31:0] A,
    input [31:0] B,
    input [3:0] Control_in,
    output reg [31:0]Result,
    output reg zero
    );
    
    always @(Control_in or A or B)
    begin 
    
    case (Control_in)
    4'b0000: Result = A + B;           		// ADD
    4'b0001: Result = A - B;           		// SUB
    4'b0010: Result = A & B;           		// AND
    4'b0011: Result = A | B;           		// OR
    4'b0100: Result = A ^ B;           		// XOR
    4'b0101: Result = A << B[4:0];     		// SLL (Shift Left Logical)
    4'b0110: Result = A >> B[4:0];     		// SRL (Shift Right Logical)
    4'b0111: Result = $signed(A) >>> B[4:0];    // SRA (Shift Right Arithmetic)
    4'b1000: Result =($signed(A) < $signed(B)) ? 32'b1 : 32'b0;
    default: Result = 32'b0;          		
    endcase
    
    zero = (Result == 32'b0) ? 1 : 0;
    end
    
endmodule
