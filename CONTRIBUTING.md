# Contributing to Hack Verilog (Nand2Tetris)

Thank you for your interest in contributing to this project! This guide will help you get started.

## 🚀 Getting Started

### Prerequisites

- **Icarus Verilog** (iverilog) - For simulation
- **GTKWave** (optional) - For viewing waveforms
- **Make** - Build automation
- **Git** - Version control

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
Use [WSL2](https://docs.microsoft.com/en-us/windows/wsl/) with Ubuntu and follow the Ubuntu instructions.

### Setting Up Your Development Environment

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/hack-verilog-n2t.git
   cd hack-verilog-n2t
   ```
3. Add upstream remote:
   ```bash
   git remote add upstream https://github.com/ongrid/hack-verilog-n2t.git
   ```
4. Verify the installation:
   ```bash
   make sim
   ```

## 📝 Coding Standards

### SystemVerilog Style Guide

#### 1. **File Naming**
- Module files: `module_name.sv`
- Testbench files: `module_name_tb.sv`
- Use lowercase with underscores for multi-word names

#### 2. **Module Structure**
```systemverilog
// ============================================================================
// Module Name - Brief description
// ============================================================================
// Detailed description of what this module does
// 
// Inputs:
//   - input_name: description
// Outputs:
//   - output_name: description
// ============================================================================

module module_name (
    input  logic       clk,        // Clock signal
    input  logic       rst_n,      // Active-low reset
    input  logic [N:0] data_in,    // Input data
    output logic [M:0] data_out    // Output data
);

    // Internal signals (if any)
    logic intermediate_signal;

    // Combinational logic
    always_comb begin
        // ...
    end

    // Sequential logic
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset logic
        end else begin
            // Normal operation
        end
    end

endmodule
```

#### 3. **Naming Conventions**
- **Modules**: `snake_case` (e.g., `nand_gate`, `full_adder`)
- **Signals**: `snake_case` (e.g., `data_in`, `carry_out`)
- **Parameters**: `UPPER_CASE` (e.g., `WIDTH`, `DEPTH`)
- **Active-low signals**: suffix with `_n` (e.g., `rst_n`, `cs_n`)
- **Clock signals**: `clk` or `clk_<domain>`
- **Reset signals**: `rst`, `rst_n`, or `reset`

#### 4. **Indentation and Spacing**
- Use **4 spaces** for indentation (no tabs)
- One blank line between logical sections
- Align port declarations and signal assignments for readability
- Maximum line length: **100 characters**

#### 5. **Comments**
- Use `//` for single-line comments
- Use `/* */` for multi-line comments
- Add header comments to every module explaining its purpose
- Comment complex logic, but avoid stating the obvious
- Include truth tables or state diagrams where applicable

#### 6. **Best Practices**
- Use `logic` instead of `wire` and `reg` in SystemVerilog
- Use `always_comb` for combinational logic
- Use `always_ff` for sequential logic
- Avoid mixing blocking (`=`) and non-blocking (`<=`) assignments
- Use non-blocking (`<=`) for sequential logic
- Use blocking (`=`) for combinational logic
- Prefer parameterized designs for reusability
- Include assertions where appropriate

### Testbench Standards

#### 1. **Structure**
Every module must have a corresponding testbench that:
- Tests all input combinations (for small modules)
- Tests edge cases and corner cases
- Generates VCD waveforms
- Reports PASS/FAIL status
- Uses `$display` for clear output

#### 2. **Testbench Template**
```systemverilog
// ============================================================================
// Testbench for Module Name
// ============================================================================

`timescale 1ns/1ps

module module_name_tb;

    // Signals
    logic clk;
    logic rst_n;
    logic [N:0] input_signal;
    logic [M:0] output_signal;

    // Instantiate DUT
    module_name dut (
        .clk    (clk),
        .rst_n  (rst_n),
        .input  (input_signal),
        .output (output_signal)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100MHz clock
    end

    // Waveform generation
    initial begin
        $dumpfile("module_name.vcd");
        $dumpvars(0, module_name_tb);
    end

    // Test stimulus
    initial begin
        integer errors = 0;

        // Initialize
        rst_n = 0;
        input_signal = 0;
        #20 rst_n = 1;

        // Test cases
        // ...

        // Summary
        $display("============================================");
        if (errors == 0) begin
            $display("ALL TESTS PASSED!");
        end else begin
            $display("TESTS FAILED: %0d errors", errors);
        end
        $display("============================================");

        #10;
        $finish;
    end

endmodule
```

#### 3. **Test Coverage**
- Test all input combinations for small modules
- Test boundary conditions
- Test reset behavior
- Test timing relationships for sequential circuits
- Verify outputs match expected values

### Makefile Standards

Each module directory should contain a Makefile with:
```makefile
# Module configuration
TOP = module_name
SRC = $(TOP).sv
TB  = $(TOP)_tb.sv
SIM = $(TOP)_sim
VCD = $(TOP).vcd

# Tool configuration
IVERILOG = iverilog
VVP      = vvp

# Targets
all: sim

$(SIM): $(SRC) $(TB)
	$(IVERILOG) -g2012 -o $@ $^

sim: $(SIM)
	$(VVP) $(SIM)

clean:
	rm -f $(SIM) $(VCD)

.PHONY: all sim clean
```

## 🔄 Development Workflow

### Adding a New Module

1. Create a new directory under `rtl/`:
   ```bash
   mkdir rtl/your_module
   cd rtl/your_module
   ```

2. Create the module file (`your_module.sv`)
3. Create the testbench (`your_module_tb.sv`)
4. Create the Makefile (copy from existing module and adapt)
5. Test locally:
   ```bash
   make sim
   ```
6. View waveforms (optional):
   ```bash
   gtkwave your_module.vcd
   ```

### Submitting Changes

1. Create a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes following the coding standards

3. Test your changes:
   ```bash
   make sim      # Run all tests
   make clean    # Clean up
   ```

4. Commit with clear messages:
   ```bash
   git add .
   git commit -m "feat: add XOR gate implementation"
   ```

5. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

6. Open a Pull Request on GitHub

### Commit Message Format

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `test`: Adding or modifying tests
- `refactor`: Code refactoring
- `style`: Code style changes (formatting)
- `ci`: CI/CD changes
- `chore`: Maintenance tasks

**Examples:**
```
feat(gates): add OR gate implementation
fix(nand): correct truth table in comments
docs(readme): add installation instructions
test(alu): add edge case tests
```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
make sim

# Run specific module test
cd rtl/nand_gate
make sim

# Clean all build artifacts
make clean
```

### Writing Tests

- Every module must have comprehensive tests
- Tests should be deterministic and repeatable
- Use meaningful test names and descriptions
- Report clear PASS/FAIL status
- Generate VCD files for debugging

## 📚 Documentation

### Required Documentation

1. **Module Headers**: Every module must have a header comment block
2. **Inline Comments**: Explain complex logic
3. **Truth Tables**: Include for gates and combinational logic
4. **State Diagrams**: Include for state machines
5. **README Updates**: Update main README when adding major features

### Documentation Style

- Use clear, concise language
- Provide examples where helpful
- Reference Nand2Tetris course materials when relevant
- Explain *why*, not just *what*

## 🐛 Reporting Issues

When reporting issues, please include:

1. **Description**: Clear description of the problem
2. **Steps to Reproduce**: How to reproduce the issue
3. **Expected Behavior**: What should happen
4. **Actual Behavior**: What actually happens
5. **Environment**: OS, tool versions
6. **Logs**: Relevant error messages or logs

## 💡 Questions?

- Open an issue for questions
- Check existing issues and pull requests
- Reference [Nand2Tetris](https://www.nand2tetris.org/) course materials

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to the Hack Computer project! 🎉
