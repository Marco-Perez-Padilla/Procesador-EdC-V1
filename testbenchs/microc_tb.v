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
    #40;
    test_clk = 0;
    #40;
  end

// Reseteo y configuración de salidas del testbench
initial
begin
  $dumpfile("data/microc_tb.vcd");
  $dumpvars;
  // ... señal de reset
  test_reset = 1'b1;
  #10;
  test_reset = 1'b0;
end

// jmp: s_inc = 0, we3 = 1 s_inm = x, wez = 1, Op = xxx
// nop: s_inc = 1, we3 = 1, s_inm = x, wez = 1, Op = xxx
// li : s_inc = 1, we3 = 0, s_inm = 1, wez = 1, Op = xxx
// aritmetico-logicas : s_inc = 1, we3 = 1, s_inm = 0, wez = 1, Op = Sí importa pero está dentro de la alu
// jnz : s_inc = 0, we3 = 1, s_inm = x, wez = 0, Op = xxx
// jz : s_inc = 0, we3 = 1, s_inm = x, wez = 0, Op = xxx

// Bloque simulación señales control por ciclo
initial @(posedge test_clk, posedge test_reset)
begin
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b0;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b1;
  test_Op = 3'b000; // Don't care
  #40;
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b1;
  test_Op = 3'b000; // Don't care
  #40;
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b1;
  test_Op = 3'b000; // Don't care
  #40;
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b1;
  test_Op = 3'b000; // Don't care
  #40;
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b1;
  test_Op = 3'b000; // Don't care
  #40;
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b1;
  test_we3 = 1'b0;
  test_s_inm = 1'b1; 
  test_wez = 1'b1;
  test_Op = 3'b000; // Don't care
  #40;
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b1;
  test_we3 = 1'b0;
  test_s_inm = 1'b1; 
  test_wez = 1'b1;
  test_Op = 3'b000; // Don't care
  #40;
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b1;
  test_we3 = 1'b0;
  test_s_inm = 1'b1; 
  test_wez = 1'b1;
  test_Op = 3'b000; // Don't care
  #40;
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b1;
  test_we3 = 1'b0;
  test_s_inm = 1'b1; 
  test_wez = 1'b1;
  test_Op = 3'b000; // Don't care
  #40;
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b1;
  test_Op = 3'b000; // Don't care
  #40;
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b1;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b1;
  test_Op = 3'b000; // Don't care
  #40;
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b0;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b0;
  test_Op = 3'b000; // Don't care
  #40;
  // retardos y señales para ejecutar primera instrucción (ciclo 1)
  test_s_inc = 1'b0;
  test_we3 = 1'b1;
  test_s_inm = 1'b0; // Don't care
  test_wez = 1'b1;
  test_Op = 3'b000; // Don't care
  #40;
  $finish;
end

endmodule
