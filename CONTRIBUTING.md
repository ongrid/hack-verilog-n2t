# Contributing to Hack Verilog (Nand2Tetris)

Thank you for your interest in contributing!

## 🚀 Getting Started

### Prerequisites

- **Icarus Verilog** (iverilog) - For simulation
- **Make** - Build automation
- **GTKWave** (optional) - For viewing waveforms

### Installation

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install -y iverilog gtkwave make
```

**macOS:**
```bash
brew install icarus-verilog gtkwave
```

**Windows:** Use [WSL2](https://docs.microsoft.com/en-us/windows/wsl/) with Ubuntu.

### Running Tests

```bash
# Run all tests
make sim

# Run specific module test
cd rtl/nand_gate
make sim
```

## 📝 Coding Standards

### File Naming
- Module: `module_name.sv`
- Testbench: `module_name_tb.sv`
- Use lowercase with underscores

### Module Style
```systemverilog
// Module header with description
module module_name (
    input  logic       clk,      // Clock
    input  logic [N:0] data_in,  // Input data
    output logic [M:0] data_out  // Output data
);
    // Implementation
endmodule
```

### Naming Conventions
- **Modules/Signals**: `snake_case` (e.g., `nand_gate`, `data_in`)
- **Parameters**: `UPPER_CASE` (e.g., `WIDTH`)
- **Active-low signals**: suffix with `_n` (e.g., `rst_n`)

### Best Practices
- Use `logic` instead of `wire`/`reg`
- Use `always_comb` for combinational logic
- Use `always_ff` for sequential logic
- 4 spaces for indentation (no tabs)
- Add header comments explaining module purpose
- Include truth tables for gates

### Testbenches
Every module must have a testbench that:
- Tests all input combinations (for small modules)
- Generates VCD waveforms (`$dumpfile`, `$dumpvars`)
- Reports PASS/FAIL status clearly
- Uses `===` for comparisons (catches X/Z values)

Example:
```systemverilog
`timescale 1ns/1ps

module module_name_tb;
    logic a, b, out;
    
    module_name dut (.a(a), .b(b), .out(out));
    
    initial begin
        $dumpfile("module_name.vcd");
        $dumpvars(0, module_name_tb);
        
        // Test cases with error checking
        integer errors = 0;
        a = 0; b = 0; #10;
        if (out !== expected) errors++;
        
        if (errors == 0) $display("PASS");
        else $display("FAIL: %0d errors", errors);
        $finish;
    end
endmodule
```

## 🔄 Workflow

1. **Fork** the repository
2. **Create a branch**: `git checkout -b feature/your-feature`
3. **Make changes** following coding standards
4. **Test**: `make sim`
5. **Commit**: `git commit -m "feat: add XOR gate"`
6. **Push**: `git push origin feature/your-feature`
7. **Open a Pull Request**

### Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):
- `feat`: New feature (e.g., `feat: add OR gate`)
- `fix`: Bug fix
- `docs`: Documentation changes
- `test`: Test changes
- `refactor`: Code refactoring

## 📚 Resources

- [Nand2Tetris Course](https://www.nand2tetris.org/)
- [Module Specifications](docs/module-specs.md)
- [Icarus Verilog](http://iverilog.icarus.com/)

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.
