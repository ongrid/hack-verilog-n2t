# Module Specifications

Quick reference for Hack Computer modules. For detailed specifications, see the [Nand2Tetris course materials](https://www.nand2tetris.org/).

## 🔌 Logic Gates

| Module | Status | Built From | Reference |
|--------|--------|------------|-----------|
| NAND | ✅ Implemented | Primitive | [Project 1](https://www.nand2tetris.org/project01) |
| NOT | ⏳ Planned | NAND | [Project 1](https://www.nand2tetris.org/project01) |
| AND | ⏳ Planned | NAND, NOT | [Project 1](https://www.nand2tetris.org/project01) |
| OR | ⏳ Planned | NAND, NOT | [Project 1](https://www.nand2tetris.org/project01) |
| XOR | ⏳ Planned | AND, OR, NOT | [Project 1](https://www.nand2tetris.org/project01) |
| MUX | ⏳ Planned | AND, OR, NOT | [Project 1](https://www.nand2tetris.org/project01) |
| DMUX | ⏳ Planned | AND, NOT | [Project 1](https://www.nand2tetris.org/project01) |

## 🔢 Multi-Bit Variants

| Module | Status | Built From | Reference |
|--------|--------|------------|-----------|
| NOT16 | ⏳ Planned | NOT × 16 | [Project 1](https://www.nand2tetris.org/project01) |
| AND16 | ⏳ Planned | AND × 16 | [Project 1](https://www.nand2tetris.org/project01) |
| OR16 | ⏳ Planned | OR × 16 | [Project 1](https://www.nand2tetris.org/project01) |
| MUX16 | ⏳ Planned | MUX × 16 | [Project 1](https://www.nand2tetris.org/project01) |

## ➕ Arithmetic Units

| Module | Status | Built From | Reference |
|--------|--------|------------|-----------|
| Half Adder | ⏳ Planned | XOR, AND | [Project 2](https://www.nand2tetris.org/project02) |
| Full Adder | ⏳ Planned | Half Adder, OR | [Project 2](https://www.nand2tetris.org/project02) |
| Add16 | ⏳ Planned | Half Adder, Full Adder × 15 | [Project 2](https://www.nand2tetris.org/project02) |
| Inc16 | ⏳ Planned | Add16 | [Project 2](https://www.nand2tetris.org/project02) |
| ALU | ⏳ Planned | Add16, AND16, NOT16, MUX16 | [Project 2](https://www.nand2tetris.org/project02) |

## 🔄 Sequential Logic

| Module | Status | Built From | Reference |
|--------|--------|------------|-----------|
| DFF | ⏳ Planned | Primitive (clocked) | [Project 3](https://www.nand2tetris.org/project03) |
| Bit | ⏳ Planned | DFF, MUX | [Project 3](https://www.nand2tetris.org/project03) |
| Register | ⏳ Planned | Bit × 16 | [Project 3](https://www.nand2tetris.org/project03) |
| RAM8 | ⏳ Planned | Register × 8, MUX, DMUX | [Project 3](https://www.nand2tetris.org/project03) |
| RAM64 | ⏳ Planned | RAM8 × 8, MUX, DMUX | [Project 3](https://www.nand2tetris.org/project03) |
| RAM512 | ⏳ Planned | RAM64 × 8, MUX, DMUX | [Project 3](https://www.nand2tetris.org/project03) |
| RAM4K | ⏳ Planned | RAM512 × 8, MUX, DMUX | [Project 3](https://www.nand2tetris.org/project03) |
| RAM16K | ⏳ Planned | RAM4K × 4, MUX, DMUX | [Project 3](https://www.nand2tetris.org/project03) |
| PC | ⏳ Planned | Register, Inc16, MUX | [Project 3](https://www.nand2tetris.org/project03) |

## 💻 Computer Architecture

| Module | Status | Built From | Reference |
|--------|--------|------------|-----------|
| CPU | ⏳ Planned | ALU, PC, Register, Control Logic | [Project 5](https://www.nand2tetris.org/project05) |
| Memory | ⏳ Planned | RAM16K, Screen, Keyboard | [Project 5](https://www.nand2tetris.org/project05) |
| Computer | ⏳ Planned | CPU, Memory, ROM32K | [Project 5](https://www.nand2tetris.org/project05) |

## 📚 References

- **Nand2Tetris Course**: https://www.nand2tetris.org/
- **HDL Survival Guide**: https://www.nand2tetris.org/hdl-survival-guide
- **Course Book**: "The Elements of Computing Systems" by Nisan & Schocken
- **Appendix A**: [Boolean Logic](https://docs.wixstatic.com/ugd/44046b_f2c9e41f0b204a34ab78be0ae4953128.pdf)
- **Appendix B**: [Boolean Arithmetic and the ALU](https://docs.wixstatic.com/ugd/44046b_b2cad2eea33847869b86c541683551a7.pdf)
