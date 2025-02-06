`timescale 1ns / 1ps

module alu_tb;

// Declare testbench variables
reg [7:0] InputA, InputB;
reg [2:0] OpCode;
wire [15:0] OutALU;
wire COut;

// Instantiate ALU
alu uut (
    .OpCode(OpCode),
    .InputA(InputA),
    .InputB(InputB),
    .OutALU(OutALU),
    .COut(COut)
);

initial begin
    // Monitor changes in variables
    $monitor("Time=%0t | OpCode=%b | A=%d | B=%d | OutALU=%d | COut=%b", 
             $time, OpCode, InputA, InputB, OutALU, COut);

    // First test case: A = 45, B = 38
    InputA = 8'd45;
    InputB = 8'd38;

    // Test Addition (000)
    OpCode = 3'b000;
    #10;

    // Test Subtraction (001)
    OpCode = 3'b001;
    #10;

    // Test Logical OR (110)
    OpCode = 3'b110;
    #10;

    // Test Logical XOR (111)
    OpCode = 3'b111;
    #10;

    // Second test case: A = 49, B = 10
    InputA = 8'd49;
    InputB = 8'd10;

    // Test Multiplication (010)
    OpCode = 3'b010;
    #10;

    // Test Left Shift (011)
    OpCode = 3'b011;
    #10;

    // Test Right Shift (100)
    OpCode = 3'b100;
    #10;

    // Test Logical AND (101)
    OpCode = 3'b101;
    #10;

    // End simulation
    $finish;
end

endmodule
