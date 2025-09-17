Single-Cycle RISC-V Processor
A Verilog-based implementation of a single-cycle RISC-V processor that executes RV32I instructions in one clock cycle. This project is designed for educational and experimental purposes, demonstrating the fundamentals of processor design and the RISC-V ISA.
Features

RV32I ISA Support – Implements core integer instructions (arithmetic, logical, load/store, branch, jump).

Single-Cycle Datapath – Each instruction completes in a single clock cycle.

Harvard Architecture – Separate instruction and data memories.

Modular Design – Cleanly separated modules for Fetch, Decode, Execute, Memory, and Writeback.

Parameterizable Components – Easy to modify data width or memory size.

This project implements a Single-Cycle RISC-V Processor that supports the RV32I base instruction set. The processor is designed using Verilog HDL and follows a Harvard architecture, with separate instruction and data memories.

In a single-cycle design, each instruction is fetched, decoded, executed, and written back within one clock cycle. This makes the design simple and easy to understand but results in a longer clock period since the cycle time must accommodate the slowest instruction (e.g., load).

🔧 Key Features

RV32I Instruction Set – Implements arithmetic, logical, load/store, branch, and jump instructions.

Single-Cycle Datapath – No pipelining; CPI (Cycles Per Instruction) = 1 for all instructions.

Modular Design – Separated into Fetch, Decode, Execute, Memory, and Writeback stages.

Control Logic – Centralized control unit generates control signals based on instruction opcode.

Parameterizable Memory – Instruction and data memory sizes can be easily modified.

📐 Architecture Overview

Fetch: Program Counter (PC) selects instruction from Instruction Memory.

Decode: Control unit decodes instruction; register file outputs source operands.

Execute: ALU performs arithmetic/logical operation; branch/jump decision made.

Memory: Data memory accessed for loads and stores.

Writeback: Result written back to register file (ALU result, memory data, or PC+4).

- Add pipelining for better performance

- Support for RV32M (Multiply/Divide) instructions

- Support for exceptions & interrupts
