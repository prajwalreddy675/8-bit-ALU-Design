
module alu (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] ALU_Sel,
    output reg [7:0] ALU_Out,
    output reg Carry,
    output reg Zero,
    output reg Overflow
);

always @(*) begin
    Carry = 0;
    Zero = 0;
    Overflow = 0;
    ALU_Out = 0;

    case (ALU_Sel)

        3'b000: begin
            {Carry, ALU_Out} = A + B;
            Overflow = (~(A[7] ^ B[7])) &
                       (ALU_Out[7] ^ A[7]);
        end

        3'b001: begin
            ALU_Out = A - B;
            Overflow = (A[7] ^ B[7]) &
                       (ALU_Out[7] ^ A[7]);
        end

        3'b010: ALU_Out = A & B;
        3'b011: ALU_Out = A | B;
        3'b100: ALU_Out = A ^ B;
        3'b101: ALU_Out = ~A;
        3'b110: ALU_Out = A << 1;
        3'b111: ALU_Out = A >> 1;

        default: ALU_Out = 0;

    endcase

    Zero = (ALU_Out == 0);
end

endmodule