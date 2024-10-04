`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2024 17:10:24
// Design Name: 
// Module Name: ALU_tb
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

module ALU_tb();
    // Input signals
    reg [2:0] opcode;
    reg [7:0] operand1, operand2;
    // Output signals
    wire [15:0] result;
    wire flagC;
    wire flagZ;
    
    // Temporary variable
    reg [2:0] count;
    
    // Instantiate DUT (Device Under Test)
    ALU_8bit dut (
        .opcode(opcode),
        .operand1(operand1),
        .operand2(operand2),
        .result(result),
        .flagC(flagC),
        .flagZ(flagZ)
    );

    // Testbench initialization and stimulus
    initial begin
        operand1 = 8'hAA; // Set operand1 to hexadecimal A (decimal 10)
        operand2 = 8'h55; // Set operand2 to hexadecimal 5 (decimal 5)

        for (count = 0; count < 8; count = count + 1) begin
            opcode = count;
            #100; // Wait 100 time units before changing opcode
        end
        // End the simulation
        $finish;
    end 
endmodule

