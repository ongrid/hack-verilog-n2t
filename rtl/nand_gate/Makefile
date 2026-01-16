# Module files
TOP = nand_gate
SRC = $(TOP).sv
TB  = $(TOP)_tb.sv
SIM = $(TOP)_sim
VCD = $(TOP).vcd

# tool names
IVERILOG = iverilog
VVP      = vvp
VERILATOR = verilator

# targets
all: sim

# Compile: Create simulator executable from source files
$(SIM): $(SRC) $(TB)
	$(IVERILOG) -g2012 -o $@ $^
#	                      ↑   ↑
#	                      |   └── $^ = all dependencies (nand_gate.sv nand_gate_tb.sv)
#	                      └────── $@ = target name (nand_gate_sim)

# Run simulation
sim: $(SIM)
	$(VVP) $(SIM)

# Run Verilator linting
lint:
	$(VERILATOR) --lint-only --timing -Wno-fatal $(SRC) $(TB)

# Remove all generated files
clean:
	rm -f $(SIM) $(VCD)

.PHONY: all sim lint clean
