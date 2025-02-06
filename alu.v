module ALU_8bit (
    input [7:0] InputA,  // First operand
    input [7:0] InputB,  // Second operand
    input [2:0] OpCode,  // Operation selector
    output reg [15:0] OutALU,  // Output result
    output reg COut  // Carry-out flag
);

always @(*) begin
    COut = 0; // Default carry-out value
    case (OpCode)
        3'b000: OutALU = InputA + InputB;  // Addition
        3'b001: OutALU = InputA - InputB;  // Subtraction
        3'b010: OutALU = InputA * InputB;  // Multiplication
        3'b011: OutALU = InputA << 1;  // Left shift (by 1 bit)
        3'b100: OutALU = InputA >> 1;  // Right shift (by 1 bit)
        3'b101: OutALU = InputA & InputB;  // Logical AND
        3'b110: OutALU = InputA | InputB;  // Logical OR
        3'b111: OutALU = InputA ^ InputB;  // Logical XOR
        default: OutALU = 16'b0;  // Default case
    endcase

    // Set carry-out for addition and subtraction
    if (OpCode == 3'b000 && (InputA + InputB) > 8'hFF)
        COut = 1;  // Carry out for addition
    else if (OpCode == 3'b001 && InputA < InputB)
        COut = 1;  // Borrow flag for subtraction
end

endmodule
