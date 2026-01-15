# Module Specifications

This document provides detailed specifications for each module in the Hack Computer implementation.

## 📋 Specification Format

Each module specification includes:
- **Purpose**: What the module does
- **Interface**: Input/output ports
- **Truth Table** or **Function**: Logical behavior
- **Implementation Notes**: Design considerations
- **Dependencies**: Required sub-modules
- **Test Requirements**: What must be tested

---

## 🔌 Logic Gates

### NAND Gate

**Status**: ✅ Implemented

**Purpose**: The fundamental building block. All other gates are built from NAND gates.

**Interface**:
```systemverilog
module nand_gate (
    input  logic a,    // First input
    input  logic b,    // Second input
    output logic out   // Output: NOT (a AND b)
);
```

**Truth Table**:
| a | b | out |
|---|---|-----|
| 0 | 0 | 1   |
| 0 | 1 | 1   |
| 1 | 0 | 1   |
| 1 | 1 | 0   |

**Function**: `out = ~(a & b)`

**Dependencies**: None (primitive)

**Test Requirements**:
- Test all 4 input combinations
- Verify correct output for each case

---

### NOT Gate

**Status**: ⏳ Planned

**Purpose**: Output the inverse of the input.

**Interface**:
```systemverilog
module not_gate (
    input  logic in,   // Input
    output logic out   // Output: NOT in
);
```

**Truth Table**:
| in | out |
|----|-----|
| 0  | 1   |
| 1  | 0   |

**Function**: `out = ~in`

**Implementation**: Can be built using a NAND gate with both inputs tied together.

**Dependencies**: `nand_gate`

**Test Requirements**:
- Test both input values
- Verify correct inversion

---

### AND Gate

**Status**: ⏳ Planned

**Purpose**: Output 1 if both inputs are 1.

**Interface**:
```systemverilog
module and_gate (
    input  logic a,    // First input
    input  logic b,    // Second input
    output logic out   // Output: a AND b
);
```

**Truth Table**:
| a | b | out |
|---|---|-----|
| 0 | 0 | 0   |
| 0 | 1 | 0   |
| 1 | 0 | 0   |
| 1 | 1 | 1   |

**Function**: `out = a & b`

**Implementation**: NAND followed by NOT.

**Dependencies**: `nand_gate`

**Test Requirements**:
- Test all 4 input combinations

---

### OR Gate

**Status**: ⏳ Planned

**Purpose**: Output 1 if at least one input is 1.

**Interface**:
```systemverilog
module or_gate (
    input  logic a,    // First input
    input  logic b,    // Second input
    output logic out   // Output: a OR b
);
```

**Truth Table**:
| a | b | out |
|---|---|-----|
| 0 | 0 | 0   |
| 0 | 1 | 1   |
| 1 | 0 | 1   |
| 1 | 1 | 1   |

**Function**: `out = a | b`

**Implementation**: De Morgan's Law: `a OR b = NOT(NOT a AND NOT b)`

**Dependencies**: `nand_gate`, `not_gate`

**Test Requirements**:
- Test all 4 input combinations

---

### XOR Gate

**Status**: ⏳ Planned

**Purpose**: Output 1 if inputs are different.

**Interface**:
```systemverilog
module xor_gate (
    input  logic a,    // First input
    input  logic b,    // Second input
    output logic out   // Output: a XOR b
);
```

**Truth Table**:
| a | b | out |
|---|---|-----|
| 0 | 0 | 0   |
| 0 | 1 | 1   |
| 1 | 0 | 1   |
| 1 | 1 | 0   |

**Function**: `out = a ^ b`

**Implementation**: `(a AND NOT b) OR (NOT a AND b)`

**Dependencies**: `and_gate`, `or_gate`, `not_gate`

**Test Requirements**:
- Test all 4 input combinations
- Verify XOR property (odd number of 1's)

---

## 🔀 Multiplexers

### 2-Way Multiplexer (MUX)

**Status**: ⏳ Planned

**Purpose**: Select one of two inputs based on a selector.

**Interface**:
```systemverilog
module mux (
    input  logic a,    // First input
    input  logic b,    // Second input
    input  logic sel,  // Selector
    output logic out   // Output: a if sel=0, b if sel=1
);
```

**Truth Table**:
| sel | out |
|-----|-----|
| 0   | a   |
| 1   | b   |

**Function**: `out = sel ? b : a`

**Implementation**: `(NOT sel AND a) OR (sel AND b)`

**Dependencies**: `and_gate`, `or_gate`, `not_gate`

**Test Requirements**:
- Test all combinations of a, b, sel
- Verify correct selection

---

### 2-Way Demultiplexer (DMUX)

**Status**: ⏳ Planned

**Purpose**: Route input to one of two outputs based on a selector.

**Interface**:
```systemverilog
module dmux (
    input  logic in,   // Input
    input  logic sel,  // Selector
    output logic a,    // Output 0
    output logic b     // Output 1
);
```

**Truth Table**:
| sel | a  | b  |
|-----|----|----|
| 0   | in | 0  |
| 1   | 0  | in |

**Function**: 
- `a = in & ~sel`
- `b = in & sel`

**Dependencies**: `and_gate`, `not_gate`

**Test Requirements**:
- Test all combinations of in and sel
- Verify routing is correct

---

## 🔢 Multi-Bit Variants

### 16-bit NOT

**Status**: ⏳ Planned

**Purpose**: 16-bit parallel NOT operation.

**Interface**:
```systemverilog
module not16 (
    input  logic [15:0] in,   // 16-bit input
    output logic [15:0] out   // 16-bit output
);
```

**Function**: `out[i] = ~in[i]` for all i

**Implementation**: 16 parallel NOT gates

**Dependencies**: `not_gate`

**Test Requirements**:
- Test with various 16-bit patterns
- Verify all bits are inverted

---

### 16-bit AND

**Status**: ⏳ Planned

**Interface**:
```systemverilog
module and16 (
    input  logic [15:0] a,    // 16-bit input A
    input  logic [15:0] b,    // 16-bit input B
    output logic [15:0] out   // 16-bit output
);
```

**Function**: `out[i] = a[i] & b[i]` for all i

**Implementation**: 16 parallel AND gates

**Dependencies**: `and_gate`

---

### 16-bit OR

**Status**: ⏳ Planned

**Interface**:
```systemverilog
module or16 (
    input  logic [15:0] a,    // 16-bit input A
    input  logic [15:0] b,    // 16-bit input B
    output logic [15:0] out   // 16-bit output
);
```

**Function**: `out[i] = a[i] | b[i]` for all i

**Implementation**: 16 parallel OR gates

**Dependencies**: `or_gate`

---

### 16-bit MUX

**Status**: ⏳ Planned

**Interface**:
```systemverilog
module mux16 (
    input  logic [15:0] a,    // 16-bit input A
    input  logic [15:0] b,    // 16-bit input B
    input  logic        sel,  // Selector
    output logic [15:0] out   // 16-bit output
);
```

**Function**: `out = sel ? b : a` (bitwise)

**Implementation**: 16 parallel MUX gates

**Dependencies**: `mux`

---

## ➕ Arithmetic

### Half Adder

**Status**: ⏳ Planned

**Purpose**: Add two single bits.

**Interface**:
```systemverilog
module half_adder (
    input  logic a,     // First input
    input  logic b,     // Second input
    output logic sum,   // Sum output
    output logic carry  // Carry output
);
```

**Truth Table**:
| a | b | sum | carry |
|---|---|-----|-------|
| 0 | 0 | 0   | 0     |
| 0 | 1 | 1   | 0     |
| 1 | 0 | 1   | 0     |
| 1 | 1 | 0   | 1     |

**Function**:
- `sum = a XOR b`
- `carry = a AND b`

**Dependencies**: `xor_gate`, `and_gate`

---

### Full Adder

**Status**: ⏳ Planned

**Purpose**: Add three single bits (including carry-in).

**Interface**:
```systemverilog
module full_adder (
    input  logic a,      // First input
    input  logic b,      // Second input
    input  logic c_in,   // Carry input
    output logic sum,    // Sum output
    output logic c_out   // Carry output
);
```

**Truth Table**:
| a | b | c_in | sum | c_out |
|---|---|------|-----|-------|
| 0 | 0 | 0    | 0   | 0     |
| 0 | 0 | 1    | 1   | 0     |
| 0 | 1 | 0    | 1   | 0     |
| 0 | 1 | 1    | 0   | 1     |
| 1 | 0 | 0    | 1   | 0     |
| 1 | 0 | 1    | 0   | 1     |
| 1 | 1 | 0    | 0   | 1     |
| 1 | 1 | 1    | 1   | 1     |

**Implementation**: Two half adders + OR gate

**Dependencies**: `half_adder`, `or_gate`

---

### 16-bit Adder

**Status**: ⏳ Planned

**Purpose**: Add two 16-bit numbers.

**Interface**:
```systemverilog
module add16 (
    input  logic [15:0] a,    // 16-bit input A
    input  logic [15:0] b,    // 16-bit input B
    output logic [15:0] out   // 16-bit sum
);
```

**Implementation**: Ripple-carry adder with 16 full adders

**Dependencies**: `half_adder`, `full_adder`

**Test Requirements**:
- Test zero + zero
- Test boundary values (0xFFFF, 0x0001)
- Test overflow conditions
- Test random values

---

## 🧮 ALU (Arithmetic Logic Unit)

**Status**: ⏳ Planned

**Purpose**: The computational heart of the CPU. Performs arithmetic and logical operations.

**Interface**:
```systemverilog
module alu (
    input  logic [15:0] x,     // 16-bit input X
    input  logic [15:0] y,     // 16-bit input Y
    input  logic        zx,    // Zero X
    input  logic        nx,    // Negate X
    input  logic        zy,    // Zero Y
    input  logic        ny,    // Negate Y
    input  logic        f,     // Function: 1=Add, 0=And
    input  logic        no,    // Negate output
    output logic [15:0] out,   // 16-bit output
    output logic        zr,    // Zero flag
    output logic        ng     // Negative flag
);
```

**Function**: Configurable operations based on control bits.

**Dependencies**: `add16`, `and16`, `not16`, `mux16`

**Test Requirements**:
- Test all 64 possible control bit combinations
- Verify flag outputs (zr, ng)
- Test arithmetic operations
- Test logical operations

---

## 📝 Notes

- All specifications follow the Nand2Tetris course
- Module interfaces may be extended with additional ports for debugging
- Parameterized versions may be created for flexibility
- All modules must be synthesizable
- All modules must have comprehensive testbenches

## 🔗 References

- [Nand2Tetris HDL Survival Guide](https://www.nand2tetris.org/hdl-survival-guide)
- [Project 1: Boolean Logic](https://www.nand2tetris.org/project01)
- [Project 2: Boolean Arithmetic](https://www.nand2tetris.org/project02)
