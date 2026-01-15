# Testing Strategy

This document outlines the testing approach for the Hack Computer implementation.

## 🎯 Testing Philosophy

**Every module must be thoroughly tested before integration.**

Our testing strategy follows these principles:

1. **Test-Driven Development**: Write tests first when possible
2. **Comprehensive Coverage**: Test all input combinations for small modules
3. **Edge Case Focus**: Explicitly test boundary conditions
4. **Clear Output**: Tests should clearly indicate PASS/FAIL
5. **Waveform Generation**: Always generate VCD files for debugging
6. **Automation**: All tests run automatically via Make

## 🧪 Test Types

### 1. Unit Tests

**Purpose**: Test individual modules in isolation.

**Scope**: Each `.sv` file has a corresponding `_tb.sv` testbench.

**Example**:
- Module: `nand_gate.sv`
- Testbench: `nand_gate_tb.sv`

**Requirements**:
- Test all input combinations (exhaustive for small modules)
- Test edge cases and boundary values
- Verify correct output
- Generate VCD waveforms
- Report pass/fail status

### 2. Integration Tests

**Purpose**: Test how modules work together.

**Scope**: Test composite modules built from primitives.

**Example**:
- Testing a 16-bit adder with multiple full adders
- Testing ALU with all sub-components

**Requirements**:
- Test realistic usage scenarios
- Verify data flow between components
- Test timing relationships (for sequential logic)

### 3. Regression Tests

**Purpose**: Ensure new changes don't break existing functionality.

**Scope**: All tests run on every commit via CI.

**Implementation**:
- GitHub Actions runs all testbenches
- Tests must pass before merging PRs

## 📝 Testbench Structure

### Standard Template

```systemverilog
// ============================================================================
// Testbench for [Module Name]
// ============================================================================
// Brief description of what this testbench does
// ============================================================================

`timescale 1ns/1ps

module module_name_tb;

    // -------------------------------------------------------------------------
    // Signals
    // -------------------------------------------------------------------------
    logic signal_name;
    logic [15:0] bus_signal;

    // -------------------------------------------------------------------------
    // Instantiate DUT (Device Under Test)
    // -------------------------------------------------------------------------
    module_name dut (
        .port_name (signal_name),
        // ... other ports
    );

    // -------------------------------------------------------------------------
    // Clock Generation (for sequential circuits)
    // -------------------------------------------------------------------------
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100MHz (10ns period)
    end

    // -------------------------------------------------------------------------
    // Waveform Generation
    // -------------------------------------------------------------------------
    initial begin
        $dumpfile("module_name.vcd");
        $dumpvars(0, module_name_tb);
    end

    // -------------------------------------------------------------------------
    // Test Stimulus
    // -------------------------------------------------------------------------
    initial begin
        integer errors;
        errors = 0;

        $display("============================================");
        $display("[Module Name] Testbench");
        $display("============================================");

        // Initialize signals
        // ...

        // Test Case 1
        // ...
        if (expected !== actual) begin
            $display("ERROR: Test Case 1 failed");
            errors = errors + 1;
        end

        // More test cases...

        // -------------------------------------------------------------------------
        // Summary
        // -------------------------------------------------------------------------
        $display("============================================");
        if (errors == 0) begin
            $display("ALL TESTS PASSED!");
        end else begin
            $display("TESTS FAILED: %0d errors", errors);
            $finish(1);  // Exit with error code
        end
        $display("============================================");

        #10;
        $finish;
    end

endmodule
```

## ✅ Test Coverage Goals

### Combinational Logic

**100% Input Coverage**: Test all possible input combinations.

**For gates** (2-input, 1-output):
- Test all 4 combinations (2² = 4)
- Example: AND gate with inputs {00, 01, 10, 11}

**For small modules** (≤ 4 inputs):
- Exhaustive testing is feasible
- Test all 2ⁿ combinations

**For larger modules** (> 4 inputs):
- Partition testing: Test representative cases from each partition
- Boundary value testing
- Random testing with known good values

### Sequential Logic

**State Coverage**: Exercise all states and transitions.

**Requirements**:
- Test reset behavior
- Test all state transitions
- Test timing relationships
- Test setup/hold violations (if applicable)

**Clock Edge Testing**:
- Verify correct edge sensitivity (posedge/negedge)
- Test behavior on both clock edges if relevant

### Arithmetic Units

**Test Cases**:
- **Zero tests**: 0 + 0, 0 - 0
- **Identity tests**: x + 0 = x, x * 1 = x
- **Overflow tests**: Maximum + 1
- **Underflow tests**: Minimum - 1
- **Sign boundary**: Test around 0 for signed numbers
- **Random tests**: Multiple random value pairs

## 🔍 Test Quality Metrics

### Pass Criteria

A test passes if:
1. All output values match expected values
2. All flags (zero, negative, etc.) are correct
3. Timing requirements are met (for sequential)
4. No X or Z values appear in outputs (unless expected)

### Fail Criteria

A test fails if:
1. Any output doesn't match expected value
2. Unexpected X or Z values
3. Timing violations
4. Simulation errors or warnings

### Error Reporting

**Good Error Message**:
```systemverilog
if (out !== expected) begin
    $display("ERROR [TC%0d]: a=%b b=%b expected=%b got=%b", 
             test_num, a, b, expected, out);
    errors = errors + 1;
end
```

**What to include**:
- Test case identifier
- Input values
- Expected output
- Actual output
- Clear indication it's an error

## 🚀 Running Tests

### Single Module Test

```bash
cd rtl/module_name
make sim
```

**Expected Output**:
```
============================================
[Module Name] Testbench
============================================
Time     Input    Output    Expected
--------------------------------------------
10       00       1         1        
20       01       1         1        
30       10       1         1        
40       11       0         0        
============================================
ALL TESTS PASSED!
============================================
```

### All Tests

```bash
make sim
```

**Expected Output**:
```
========================================
Running all testbenches
========================================

>>> rtl/nand_gate/
ALL TESTS PASSED!

>>> rtl/and_gate/
ALL TESTS PASSED!

========================================
All tests passed!
========================================
```

### Viewing Waveforms

```bash
cd rtl/module_name
make sim
gtkwave module_name.vcd
```

## 🛠️ Debugging Failed Tests

### Step 1: Read Error Messages

- Identify which test case failed
- Note the input values that caused failure
- Compare expected vs. actual output

### Step 2: Check Implementation

- Review module logic
- Verify port connections
- Check for typos or logic errors

### Step 3: View Waveforms

```bash
gtkwave module_name.vcd
```

- Visualize signal transitions
- Identify timing issues
- Spot glitches or metastability

### Step 4: Add Debug Signals

```systemverilog
initial begin
    $monitor("t=%0t a=%b b=%b out=%b", $time, a, b, out);
end
```

### Step 5: Isolate the Problem

- Create a minimal test case that reproduces the failure
- Test sub-components independently
- Use assertions to catch errors early

## 📊 CI/CD Integration

### GitHub Actions Workflow

Tests run automatically on:
- Every push to main/master
- Every pull request

**Workflow Steps**:
1. Checkout code
2. Install Icarus Verilog
3. Run `make sim`
4. Upload waveforms on failure

**See**: `.github/workflows/ci.yml`

### Pre-Commit Hooks

**Recommended** (optional):
```bash
# .git/hooks/pre-commit
#!/bin/bash
make sim
if [ $? -ne 0 ]; then
    echo "Tests failed. Commit aborted."
    exit 1
fi
```

Make executable:
```bash
chmod +x .git/hooks/pre-commit
```

## 🎓 Best Practices

### Do's ✅

- ✅ Write tests before or alongside implementation
- ✅ Test edge cases and boundary conditions
- ✅ Use meaningful variable names in testbenches
- ✅ Generate VCD files for all tests
- ✅ Report clear pass/fail status
- ✅ Use `$display` for human-readable output
- ✅ Comment your test cases
- ✅ Test reset behavior for sequential circuits
- ✅ Use `===` and `!==` for comparisons (catches X/Z)

### Don'ts ❌

- ❌ Don't skip writing tests
- ❌ Don't test only the "happy path"
- ❌ Don't ignore warnings
- ❌ Don't use blocking assignments in sequential logic
- ❌ Don't hardcode timing assumptions
- ❌ Don't leave debug code in final testbench
- ❌ Don't use `==` for comparisons (use `===`)
- ❌ Don't forget to test negative cases

## 📚 Examples

### Example 1: Simple Combinational (NAND Gate)

See: `rtl/nand_gate/nand_gate_tb.sv`

**Key Features**:
- Tests all 4 input combinations
- Clear pass/fail reporting
- VCD generation
- Readable output format

### Example 2: Multi-bit Bus (Future: 16-bit AND)

```systemverilog
// Test with specific patterns
a = 16'hFFFF; b = 16'h0000;
#10;
assert(out == 16'h0000) else errors++;

a = 16'hAAAA; b = 16'h5555;
#10;
assert(out == 16'h0000) else errors++;
```

### Example 3: Sequential Logic (Future: DFF)

```systemverilog
// Test reset
rst_n = 0; d = 1;
@(posedge clk); #1;
assert(q == 0) else errors++;

// Test normal operation
rst_n = 1; d = 1;
@(posedge clk); #1;
assert(q == 1) else errors++;
```

## 🔗 References

- [Icarus Verilog Documentation](http://iverilog.icarus.com/)
- [GTKWave Documentation](http://gtkwave.sourceforge.net/)
- [SystemVerilog Assertions](https://www.chipverify.com/systemverilog/systemverilog-assertions)
- [Verification Best Practices](https://verificationguide.com/)

---

**Remember**: Good tests are as important as good code. They give you confidence that your design works correctly!
