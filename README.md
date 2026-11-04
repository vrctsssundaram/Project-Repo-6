# VectorMAC-4

Four-lane signed 16-bit dot-product engine with 40-bit bias and 32-bit saturation.

## Features

- Four signed multiplications and accumulation
- Guard-bit protection for extreme bias values
- Registered result with ready/valid backpressure

## Run

```sh
make test
make synth
```

Design sources are in `rtl/`, directed tests in `tb/`, and interface, architecture, testing and measured results in `docs/`.

**Scope:** Not timed to a particular DSP fabric or clock frequency; fixed-point scaling and rounding are not implemented.

Project owner: Sundaram S S.
