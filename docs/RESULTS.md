# Verification record

Date: 04 November 2026
Source revision tested: `642a0859aa6d01ed902a5bdded1781c9bce4f5ed`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-6/actions/runs/41870375642

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | signed four-lane dot product, stalls and positive/negative saturation |
| FPGA synthesis / utilization | **Not run** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.
