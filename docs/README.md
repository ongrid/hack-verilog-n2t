# Documentation

This directory contains technical documentation for the Hack Computer implementation.

## 📚 Contents

- [Module Specifications](module-specs.md) - Quick reference for all modules with links to Nand2Tetris resources
- [Development Guide](../CONTRIBUTING.md) - How to contribute

## 🗺️ Project Structure

```
hack-verilog-n2t/
├── rtl/                    # RTL source files
│   ├── nand_gate/         # NAND gate implementation
│   │   ├── nand_gate.sv   # Module source
│   │   ├── nand_gate_tb.sv # Testbench
│   │   └── Makefile       # Build script
│   └── [future modules]/  # Additional primitives
├── docs/                   # Documentation
├── .github/               # CI/CD workflows
├── Makefile               # Top-level build script
└── README.md              # Project overview
```

## 🎯 Hack Computer Architecture

The Hack computer is built hierarchically in layers:

1. **Logic Gates** - NAND (primitive), NOT, AND, OR, XOR, MUX, DMUX
2. **Arithmetic** - Half Adder, Full Adder, 16-bit Adder, Incrementer, ALU
3. **Sequential Logic** - DFF, Bit, Register, Program Counter
4. **Memory** - RAM8, RAM64, RAM512, RAM4K, RAM16K, ROM32K
5. **Computer** - CPU, Memory, Complete Hack Computer

## 📖 References

- **Nand2Tetris Course**: https://www.nand2tetris.org/
- **Course Book**: "The Elements of Computing Systems" by Noam Nisan and Shimon Schocken
- **SystemVerilog IEEE 1800-2017**: https://ieeexplore.ieee.org/document/8299595
- **Icarus Verilog**: http://iverilog.icarus.com/
