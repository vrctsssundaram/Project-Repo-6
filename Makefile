IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_vector_dot4 -o build/sim rtl/vector_dot4.sv tb/tb_vector_dot4.sv
	$(VVP) build/sim
