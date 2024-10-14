### currently debugging

# Single-cycle-RISC-V
single cycle RISCV 
* Working on branch instruction 

![Screenshot 2024-08-27 101534](https://github.com/user-attachments/assets/95fdc484-bc4e-4fc7-8855-0a7ce4a83634)



##  Program Counter (PC)
*  This block holds the address of the current instruction being executed.
*  The value of the PC is updated to point to the next instruction address at each clock cycle.

##  Adder1 (PC + 4)
*  Adder1: Adds 4 to the current PC value
* This block computes the address of the next instruction by adding 4 to the current PC value.
* This is used for normal sequential execution of instructions.

##  Instruction Memory (IMEM)
* Instruction Memory: Fetches instruction
* This block retrieves the instruction stored at the address specified by the PC.
* The instruction is used by the processor to determine the operation to perform.
  
##  Immediate Generator (ImmGen)
* Immediate Generator: Extracts and extends immediate values
* This block extracts the immediate value from the instruction and extends it to a 32-bit value.
* Used in ALU operations involving immediate values, like I-type instructions.

##  Shift (SHIFT)
* Shift: Shifts the immediate value left by a specified number of bits
* This block performs a logical left shift on the immediate value, often used in branch calculations.

##  Register File (REG_FILE)
* Register File: Stores and retrieves register values
* This block provides storage for the 32 general-purpose registers of the RISC-V processor.
* It supports two simultaneous reads and one write, used in various ALU operations.

 ## MUX2
* MUX2: Selects between register data and immediate value for ALU input
* This multiplexer selects between the second operand from the register file or the immediate value based on the ALUsrc control signal.

## ALU Control (ALU_CTRL)
ALU Control: Generates control signals for ALU operations
This block decodes the instruction's funct3, funct7, and aluop fields to generate control signals for the ALU.

##  ALU
* ALU: Arithmetic Logic Unit
* Performs arithmetic and logical operations based on the control signals provided by the ALU control unit.
* Supports operations like addition, subtraction, AND, OR, and comparison.

##  Data Memory (DMEM)
 * Data Memory: Reads/Writes data
 * This block allows the processor to read from and write to memory during load and store operations.

## MUX3
* MUX3: Selects between ALU result and memory data for writing back to the register
* This multiplexer selects between the output of the ALU and the data read from memory based on the MemtoReg control signal.

 ## Control Unit (CTRL)
* Control Unit: Generates control signals for the datapath
* This block decodes the instruction opcode and generates the appropriate control signals to direct the flow of data through the processor.

## Adder2 (PC + Offset)
* Adder2: Computes branch target address
* Adds the sign-extended immediate value (offset) to the current PC value to compute the target address for branch instructions.

## AND Gate (ANDD)
* AND Gate: Branch decision logic
* Produces a branch decision signal by ANDing the Zero flag from the ALU with the Branch control signal.
* If both are true, the processor will branch to the target address.

## MUX1 
* MUX1: Selects between PC + 4 and branch target address
* This multiplexer selects the next value of the PC based on whether a branch is taken.

###  References
Computer Organization and Design RISC-V Edition
by David A. Patterson, John L. Hennessy


