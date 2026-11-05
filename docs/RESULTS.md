# Verification record

Date: 05 November 2026
Source revision tested: `d1fabe75200a09f19b839bbfa3c0bf8770a73606`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-6/actions/runs/41902477043
Hosted generic synthesis: https://github.com/vrctsssundaram/Project-Repo-6/actions/runs/41902476701

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | signed four-lane dot product, stalls, saturation, extreme positive/negative 40-bit biases |
| Generic Yosys synthesis | **PASS**; 8,551 technology-independent cells |

**Evidence:** Tool-reported Icarus Verilog regression and Yosys synthesis results for the source revision cited above.
