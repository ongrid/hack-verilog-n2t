# Hack Computer in SystemVerilog

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Status: WIP](https://img.shields.io/badge/Status-Work%20In%20Progress-orange.svg)]()
[![HDL: SystemVerilog](https://img.shields.io/badge/HDL-SystemVerilog-blue.svg)]()
[![Simulator: Icarus Verilog](https://img.shields.io/badge/Simulator-Icarus%20Verilog-green.svg)](http://iverilog.icarus.com/)

> 🚧 **Work in Progress** — This project is under active development.

A complete implementation of the **Hack computer** from the [Nand2Tetris](https://www.nand2tetris.org/) course, built using industry-standard open-source HDL tools.

## 🎯 Project Goal

Build the complete Hack computer architecture from first principles — starting with a NAND gate and progressing through combinational logic, sequential circuits, ALU, memory, and finally a working 16-bit CPU — all in synthesizable SystemVerilog.

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

## 📄 License

This project is [MIT](LICENSE) licensed.

## 🙏 Acknowledgments

- **Noam Nisan** and **Shimon Schocken** for creating the Nand2Tetris course
