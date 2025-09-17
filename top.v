`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2025 07:13:06 AM
// Design Name: 
// Module Name: top
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


module top(

    input clk,
    input reset
    );
    wire [31:0] pc_out_wire,decode_wire,read_data1,regtomux,immgen_wire,muxtoALU,branch_target,pc_next_wire,pc_wire,WB_wire,WB_data_wire,read_data_wire;
    wire RegWrite,ALUSrc,zero,branch,MemtoReg,Memwrite,Memread;
    wire [1:0]ALUOp_wire;
    wire [3:0]ALUcontrol_wire;
    
Program_Counter PC1 (.clk(clk),.reset(reset),.PC_in(pc_wire),.PC_out(pc_out_wire)); 
   
PCplus4 PCplus41(.fromPC(pc_out_wire),.NextoPC(pc_next_wire));

InstructionMem InstructionMem1(.clk(clk),.reset(reset),.read_address(pc_out_wire),.instruction_out(decode_wire));  
 
Reg_file Reg_file1(.clk(clk),.reset(reset),.RegWrite(RegWrite),.Rs1(decode_wire[19:15]),.Rs2(decode_wire[24:20]),.Rd(decode_wire[11:7]),.Write_data(WB_data_wire),.Read_data1(read_data1),.Read_data2(regtomux));

ImmGen ImmGen1(.instruction(decode_wire),.imm_out(immgen_wire));

Control_Unit Control_Unit1(.opcode(decode_wire[6:0]),.Branch(branch),.MemRead(Memread),.MemToReg(MemtoReg),.ALUOp(ALUOp_wire),.MemWrite(Memwrite),.ALUSrc(ALUSrc),.RegWrite(RegWrite));

ALU_Control ALU_Control1(.ALUOp(ALUOp_wire),.fun7(decode_wire[31:25]),.fun3(decode_wire[14:12]),.ALUcontrol_Out(ALUcontrol_wire));

ALU_unit ALU_Unit1(.A(read_data1),.B(muxtoALU),.Control_in(ALUcontrol_wire),.Result(WB_wire),.zero(zero));

Mux1 Imm_MUX(.sel1(ALUSrc), .A1(regtomux),.B1(immgen_wire),.Mux1_out(muxtoALU));

Adder Branch_Adder(.PC(pc_out_wire),.offset(immgen_wire),.branch_target(branch_target));

Data_Memory Data_Memory1(.clk(clk),.reset(reset),.Memread(Memread),.Memwrite(Memwrite),.read_address(WB_wire),.Write_data(regtomux),.MemData_out(read_data_wire));

pc_mux PC_MUX(.pc_select(branch&zero), .pc_in(pc_next_wire),.pc_branch(branch_target),.pc_out(pc_wire));

Data_Mem_mux DataMem_MUX(.sel(MemtoReg), .input0(WB_wire),.input1(read_data_wire),.out(WB_data_wire));
endmodule



