`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2025 09:48:19 AM
// Design Name: 
// Module Name: Count_Unit
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


module Control_Unit(
    input [6:0]opcode,
    output reg Branch,
    output reg MemRead,
    output reg MemToReg,
    output reg [1:0]ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
    );
    
    always @(*) begin 
    
    case (opcode)
            7'b0110011:  // R-type 
            begin  {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10};end
            7'b0010011:   // I-type
            begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10};end
            7'b0000011:   // Load 
            begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 2'b00};end
            7'b0100011:   // Store 
            begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 2'b00};end
            7'b1100011:   // Branch 
            begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 2'b11};end  
            7'b1101111:   // Jump 
            begin  {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10};end
            7'b0110111:   // LUI
            begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10};end
            default: 
            begin {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00};end  
        endcase
        
        end
   
endmodule
