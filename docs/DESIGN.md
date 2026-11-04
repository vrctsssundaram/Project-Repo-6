# Technical design

Four signed 16×16 products are sign-extended and summed with a signed 40-bit bias. A combinational arithmetic stage feeds a one-entry registered output stage. Input ready is deasserted whenever the output stage is occupied and the consumer is not ready.

The result saturates to the signed 32-bit interval. Inputs use packed little-lane ordering: lane zero resides in bits 15:0. This implementation does not scale, round or truncate fractional formats beyond integer saturation.

Further optimization may pipeline multipliers and the reduction tree after timing measurements.
