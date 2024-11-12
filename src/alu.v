module alu(output reg [7:0] S, output reg zero, input wire [7:0] A, B, input wire [2:0] Op);
  always @(A, B, Op)
  begin
    case (Op)              
      3'b000: S = A; 
      3'b001: S = ~A;
      3'b010: S = A + B;
      3'b011: S = A - B;
      3'b100: S = A & B;
      3'b101: S = A | B;
      3'b110: S = -A;
      3'b111: S = -B;
      default: S = 'bx; 
    endcase
    zero = ~(|S);
  end
endmodule
