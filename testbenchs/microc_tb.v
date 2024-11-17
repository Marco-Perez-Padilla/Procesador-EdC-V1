`timescale 1 ns / 10 ps
module microc_tb;

// declaración de variables
  reg test_clk, test_reset, test_s_inc, test_s_inm, test_we3, test_wez;
  reg [2:0] test_Op;
  wire [5:0] test_Opcode;
  wire test_z;
// instanciación del camino de datos
  microc camino(test_Opcode, test_z, test_clk, test_reset, test_s_inc, test_s_inm, test_we3, test_wez, test_Op);

// generación de reloj clk
  always
  begin
    test_clk = 1;
    #10;
    test_clk = 0;
    #10;
  end

// Reseteo y configuración de salidas del testbench
initial
begin
  $dumpfile("data/microc_tb.vcd");
  $dumpvars;
  // ... señal de reset
  test_reset = 1'b1;
  #5;
  test_reset = 1'b0;
end

// jmp, jnz, jz: s_inc = 0, we3 = 0 s_inm = x, wez = 0, Op = xxx 
// nop: s_inc = 1, we3 = 1, s_inm = x, wez = 1, Op = xxx (tmb casos de jnz y jz una vez se cumple la condición)
// li : s_inc = 1, we3 = 0, s_inm = 1, wez = 1, Op = xxx
// aritmetico-logicas : s_inc = 1, we3 = 1, s_inm = 0, wez = 1, Op = ### Opcode correspondiente de la operación

// Bloque simulación señales control por ciclo
initial @(posedge test_clk, negedge test_reset)
begin
  #5;
  // jmp Start
  test_s_inc = 1'b0;
  test_we3 = 1'b0;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b0;
  test_Op = 3'b000; // Don't care
  #20;
  // li  0, R2
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b1; 
  test_wez = 1'b0;
  test_Op = 3'b000; // Don't care
  #20;
  // li  2, R1
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b1; 
  test_wez = 1'b0;
  test_Op = 3'b000; // Don't care
  #20;
  // li  4, R3
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b1; 
  test_wez = 1'b0;
  test_Op = 3'b000; // Don't care
  #20;
  // li  1, R4
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b1; 
  test_wez = 1'b0;
  test_Op = 3'b000; // Don't care
  #20;
  // add R2, R3, R2
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b0;
  test_Op = 3'b010; // Add
  #20;
  // sub R1, R4, R1
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b1;
  test_Op = 3'b011; // Sub
  #20;
  // jnz Iter
  test_s_inc = 1'b0;
  test_we3 = 1'b0;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b0;
  test_Op = 3'b000; // Don't care
  #20;
  // add R2, R3, R2
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b0;
  test_Op = 3'b010; // Add
  #20;
  // sub R1, R4, R1
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b1;
  test_Op = 3'b011; // Sub
  #20;
  // jnz Iter
  test_s_inc = 1'b1;
  test_we3 = 1'b0;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b0;
  test_Op = 3'b000; // Don't care
  #20;
  // jmp Fin
  test_s_inc = 1'b0;
  test_we3 = 1'b0;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b0;
  test_Op = 3'b000; // Don't care
  #20;
  $finish;
end

endmodule
