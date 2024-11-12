VERILOG_COMPILER = iverilog        # Compilador de Verilog
SIMULATOR = vvp                    # Simulador de Verilog
FLAGS = -Wall                      # Banderas para iverilog

# Busca todos los archivos .v en las carpetas src de las subcarpetas
SOURCES = $(wildcard src/*.v) 

# Busca todos los testbenches en las carpetas testbench
TESTBENCHES = $(wildcard testbenchs/*.v)

# Nombre del archivo VCD que se generará
VCD_FILE = data/alu_tb.vcd  # Archivo de salida del cronograma

# Nombre del archivo de salida generado por iverilog
OBJ = bin/alu               # Este nombre puede ser genérico o específico según tu diseño

all: $(OBJ)

$(OBJ): $(SOURCES) $(TESTBENCHES)
	$(VERILOG_COMPILER) $(FLAGS) -o $(OBJ) $(TESTBENCHES) $(SOURCES)

simulate: $(OBJ)
	$(SIMULATOR) $(OBJ) -vcd $(VCD_FILE)

.PHONY: clean
clean:
	rm -f $(OBJ) 

