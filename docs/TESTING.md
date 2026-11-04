# Test procedure

Run `make test`; confirm `PASS` and successful hosted regression.

Checks include mixed positive/negative products, output stall with held result, positive saturation and negative saturation. Further qualification: random vector oracle, signed extrema, input throughput, synthesis, timing and power estimates.

Run `make synth` with Yosys installed to reproduce the generic RTL synthesis check. Hardware placement, timing and power remain separate.
