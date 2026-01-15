# Hack Computer in SystemVerilog

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Status: WIP](https://img.shields.io/badge/Status-Work%20In%20Progress-orange.svg)]()
[![HDL: SystemVerilog](https://img.shields.io/badge/HDL-SystemVerilog-blue.svg)]()
[![Simulator: Icarus Verilog](https://img.shields.io/badge/Simulator-Icarus%20Verilog-green.svg)](http://iverilog.icarus.com/)

> 🚧 **Work in Progress** — This project is under active development.

A complete implementation of the **Hack computer** from the [Nand2Tetris](https://www.nand2tetris.org/) course, built using industry-standard open-source HDL tools.

## 🎯 Project Goal

Build the complete Hack computer architecture from first principles — starting with a NAND gate and progressing through combinational logic, sequential circuits, ALU, memory, and finally a working 16-bit CPU — all in synthesizable SystemVerilog.

## 🚀 Quick Start

### Prerequisites

- **Icarus Verilog** (iverilog) - For simulation
- **Make** - Build automation
- **GTKWave** (optional) - For viewing waveforms

### Installation

#### Ubuntu/Debian
```bash
sudo apt-get update
sudo apt-get install -y iverilog gtkwave make
```

#### macOS
```bash
brew install icarus-verilog gtkwave
```

#### Windows
Use [WSL2](https://docs.microsoft.com/en-us/windows/wsl/) with Ubuntu and follow Ubuntu instructions.

### Running Tests

```bash
# Run all module tests
make sim

# Run a specific module test
cd rtl/nand_gate
make sim

# View waveforms (after running tests)
gtkwave nand_gate.vcd
```

## 📁 Project Structure

```
hack-verilog-n2t/
├── rtl/                    # RTL source files
│   └── nand_gate/         # NAND gate implementation
│       ├── nand_gate.sv   # Module source
│       ├── nand_gate_tb.sv # Testbench
│       └── Makefile       # Build script
├── docs/                   # Documentation
│   ├── README.md          # Documentation index
│   ├── module-specs.md    # Module specifications
│   ├── testing.md         # Testing strategy
│   └── templates/         # Module templates
├── .github/workflows/     # CI/CD configuration
├── Makefile               # Top-level build script
└── README.md              # This file
```

## 📚 Roadmap

### Part 1: Hardware
- [x] NAND Gate
- [ ] Basic Gates (NOT, AND, OR, XOR)
- [ ] Multiplexers & Demultiplexers
- [ ] Multi-bit Variants (16-bit)
- [ ] Adders (HalfAdder, FullAdder, Add16)
- [ ] ALU
- [ ] Flip-Flops & Registers
- [ ] RAM (8, 64, 512, 4K, 16K)
- [ ] Program Counter
- [ ] Hack CPU
- [ ] Hack Computer

### Part 2: Software (Future)
- [ ] Assembler
- [ ] VM Translator
- [ ] Compiler
- [ ] Operating System

## 📖 References

### Original Course
- **Nand2Tetris** — [nand2tetris.org](https://www.nand2tetris.org/)
- **Coursera** — [Part 1](https://www.coursera.org/learn/build-a-computer) | [Part 2](https://www.coursera.org/learn/nand2tetris2)

### Similar Projects
| Project | Description |
|---------|-------------|
| [nand2tetris-verilog](https://github.com/AeroX2/nand2tetris-verilog) | Verilog implementation |
| [FPGA-Nand2Tetris](https://github.com/penberg/FPGA-Nand2Tetris) | FPGA synthesis |
| [n2t-wasm](https://github.com/nickmass/n2t-wasm) | WebAssembly emulator |

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! This is a learning project, so suggestions for improvement are appreciated.

**Before contributing**, please:
1. Read [CONTRIBUTING.md](CONTRIBUTING.md) for coding standards and workflow
2. Check [docs/module-specs.md](docs/module-specs.md) for module specifications
3. Review [docs/testing.md](docs/testing.md) for testing requirements

### Quick Contribution Guide

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes following the coding standards
4. Test thoroughly: `make sim`
5. Commit with clear messages: `git commit -m "feat: add XOR gate"`
6. Push and create a Pull Request

## 📄 License

This project is [MIT](LICENSE) licensed.

## 🙏 Acknowledgments

- **Noam Nisan** and **Shimon Schocken** for creating the Nand2Tetris course
