# Four-lane saturating MAC

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

**Architecture:** Four-lane signed integer MAC with 40-bit bias, 32-bit saturation and registered output.

Project owner: Sundaram S S.
