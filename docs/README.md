# Documentation

This directory contains technical documentation for the Hack Computer implementation.

## 📚 Contents

- [Architecture Overview](architecture.md) - High-level system architecture
- [Module Specifications](module-specs.md) - Detailed module specifications
- [Testing Strategy](testing.md) - Testing approach and guidelines
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

### Layer 1: Logic Gates
- NAND (primitive)
- NOT, AND, OR, XOR (from NAND)
- Multiplexers and Demultiplexers

### Layer 2: Arithmetic
- Half Adder
- Full Adder
- 16-bit Adder
- Incrementer
- ALU (Arithmetic Logic Unit)

### Layer 3: Sequential Logic
- Data Flip-Flop (DFF)
- Bit register
- Multi-bit registers
- Program Counter

### Layer 4: Memory
- RAM8, RAM64, RAM512, RAM4K, RAM16K
- ROM32K

### Layer 5: Computer
- CPU
- Memory
- Complete Hack Computer

## 📖 References

### Primary Reference
- **Nand2Tetris Course**: https://www.nand2tetris.org/
- **Course Book**: "The Elements of Computing Systems" by Noam Nisan and Shimon Schocken

### HDL Resources
- **SystemVerilog IEEE 1800-2017**: https://ieeexplore.ieee.org/document/8299595
- **Icarus Verilog**: http://iverilog.icarus.com/
- **GTKWave**: http://gtkwave.sourceforge.net/

### Similar Projects
- [nand2tetris-verilog](https://github.com/AeroX2/nand2tetris-verilog)
- [FPGA-Nand2Tetris](https://github.com/penberg/FPGA-Nand2Tetris)

## 🔍 Finding Your Way

- **New to the project?** Start with [CONTRIBUTING.md](../CONTRIBUTING.md)
- **Adding a module?** Check [module-specs.md](module-specs.md)
- **Writing tests?** See [testing.md](testing.md)
- **Understanding architecture?** Read [architecture.md](architecture.md)
