module tb_alu;

reg [7:0] A, B;
reg [2:0] ALU_Sel;
wire [7:0] ALU_Out;
wire Carry;
wire Zero;
wire Overflow;

alu uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .Carry(Carry),
    .Zero(Zero),
    .Overflow(Overflow)
);
initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu);
    A = 8'd10;
    B = 8'd5;

    ALU_Sel = 3'b000; #10;
    $display("ADD: %d", ALU_Out);

    ALU_Sel = 3'b001; #10;
    $display("SUB: %d", ALU_Out);

    ALU_Sel = 3'b010; #10;
    $display("AND: %d", ALU_Out);

    ALU_Sel = 3'b011; #10;
    $display("OR: %d", ALU_Out);

    ALU_Sel = 3'b100; #10;
    $display("XOR: %d", ALU_Out);

    ALU_Sel = 3'b101; #10;
    $display("NOT: %d", ALU_Out);

    ALU_Sel = 3'b110; #10;
    $display("LEFT SHIFT: %d", ALU_Out);

    ALU_Sel = 3'b111; #10;
    $display("RIGHT SHIFT: %d", ALU_Out);
    A = 8'd127;
    B = 8'd1;
    ALU_Sel = 3'b000;
    #10;

  $display("Overflow Test:");
  $display("Result = %d", ALU_Out);
  $display("Overflow = %b", Overflow);
    $finish;
end

endmodule