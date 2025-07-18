`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2024 16:32:51
// Design Name: 
// Module Name: ALU_8bit
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

module ALU_8bit(
    input [2:0] opcode,
    input [7:0] operand1, operand2,
    output reg [15:0] result,
    output reg flagC,
    output reg flagZ
);

    parameter [2:0] Add  = 3'b000,
                    Sub  = 3'b001,
                    Mul  = 3'b010,
                    And  = 3'b011,
                    Or   = 3'b100,
                    Nand = 3'b101,
                    Nor  = 3'b110,
                    Xor  = 3'b111;

    always @(*) begin
        // Default values to avoid latches
        flagC = 1'b0;
        flagZ = 1'b0;
        result = 16'b0;

        case(opcode)
            Add: begin
                // Perform 9-bit addition to correctly detect carry
                result = {1'b0, operand1} + {1'b0, operand2};
                flagC = result[8]; // carry
                flagZ = (result == 16'b0);
            end

            Sub: begin
                // Correct subtraction to detect borrow
                result = operand1 - operand2;
                flagC = (operand1 < operand2); // Indicates a borrow
                flagZ = (result == 16'b0);
            end

            Mul: begin
                result = operand1 * operand2;
                flagZ = (result == 16'b0);
                flagC = 1'b0; // No carry flag for multiplication in this context
            end

            And: begin
                result = operand1 & operand2;
                flagZ = (result == 16'b0);
                flagC = 1'b0; // No carry flag for AND operation
            end

            Or: begin
                result = operand1 | operand2;
                flagZ = (result == 16'b0);
                flagC = 1'b0; // No carry flag for OR operation
            end

            Nand: begin
                result = ~(operand1 & operand2);
                flagZ = (result == 16'b0);
                flagC = 1'b0; // No carry flag for NAND operation
            end

            Nor: begin
                result = ~(operand1 | operand2);
                flagZ = (result == 16'b0);
                flagC = 1'b0; // No carry flag for NOR operation
            end

            Xor: begin
                result = operand1 ^ operand2;
                flagZ = (result == 16'b0);
                flagC = 1'b0; // No carry flag for XOR operation
            end

            default: begin
                result = 16'b0;
                flagC = 1'b0;
                flagZ = 1'b0;
            end
        endcase
    end
endmodule

