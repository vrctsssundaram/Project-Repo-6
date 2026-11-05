# Technical design

Four signed 16×16 products are sign-extended and summed with a signed 40-bit bias. A combinational arithmetic stage feeds a one-entry registered output stage. Input ready is deasserted whenever the output stage is occupied and the consumer is not ready.

The arithmetic path uses four signed 16×16 products, a signed 40-bit bias and integer saturation to 32 bits. Lane zero occupies bits 15:0.

Further optimization may pipeline multipliers and the reduction tree after timing measurements.
