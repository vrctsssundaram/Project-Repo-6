# Interface summary

| Signal | Meaning |
|---|---|
| `s_a[63:0], s_b[63:0]` | Four packed signed 16-bit input lanes |
| `s_bias[39:0]` | Signed accumulation offset |
| `s_valid, s_ready` | Input transfer handshake |
| `m_result[31:0]` | Signed saturating dot-product result |
| `m_valid, m_ready` | Output transfer handshake |
| `m_saturated` | Overflow/underflow was clamped |

One registered output stage with direct operand and result-ready interfaces.
