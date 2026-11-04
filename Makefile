IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_vector_dot4 -o build/sim rtl/vector_dot4.sv tb/tb_vector_dot4.sv
	$(VVP) build/sim

YOSYS ?= yosys
.PHONY: synth
synth:
	mkdir -p build
	$(YOSYS) -Q -T -l build/synthesis.log -p 'read_verilog -sv rtl/vector_dot4.sv; hierarchy -check -top vector_dot4; synth -top vector_dot4; stat'
