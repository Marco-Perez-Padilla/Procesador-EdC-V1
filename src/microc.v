module microc(output wire [5:0] Opcode, output wire z, input wire clk, reset, s_inc, s_inm, we3, wez, input wire [2:0] Op);
//Microcontrolador sin memoria de datos de un solo ciclo

  // Inicialización
  wire [15:0] opcode;
  wire [9:0] mem_dir, pc_dir, sum_result;
  wire [7:0] reg_alu_1, reg_alu_2, wd3, alu_result;
  wire zero; 

  // Obtengo el PC
  registro PC (mem_dir, clk, reset, pc_dir);
  // Obtengo el incremento
  sum suma_pc (sum_result, mem_dir, 10'b0000000001);
  // Obtengo el opcode de la instruccion
  memprog instruccion (opcode, clk, mem_dir);
  // Elijo entre saltar a la direccion o el incremento del PC
  mux2 #(10) mux_10_bit (pc_dir, opcode[9:0], mem_dir, s_inc);

  // Elijo entre el resultado de la alu y la constante inmediata
  mux2 #(8) mux_8_bit (wd3, alu_result, opcode[11:4], s_inm);
  // Hago la operacion correspondiente 
  alu ALU (alu_result, zero, reg_alu_1, reg_alu_2, Op);
  // Proceso el banco de registros
  regfile banco (reg_alu_1, reg_alu_2, clk, we3, opcode[11:8], opcode[7:4], opcode[3:0], wd3);
  // Almaceno en el ffd el zero
  ffd FFZ (clk, reset, zero, wez, z);

  // Asigno los 6 bits más significativos al Opcode
  assign Opcode = opcode[15:10];
endmodule
