# Verification record

Date: 04 November 2026
Source revision tested: `5bba19e9204754c2a9858b80043b45ab476c6422`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-6/actions/runs/41873467857

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | signed four-lane dot product, stalls, saturation, extreme positive/negative 40-bit biases |
| FPGA synthesis / utilization | **Not run** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.
