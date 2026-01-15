// ============================================================================
// NAND Gate - The fundamental building block for Nand2Tetris (Hack Computer)
// ============================================================================
// In Nand2Tetris, ALL other gates and chips are built from NAND gates.
// Truth Table:
//   a | b | out
//   --|---|----
//   0 | 0 |  1
//   0 | 1 |  1
//   1 | 0 |  1
//   1 | 1 |  0
// ============================================================================

module nand_gate (
    input  logic a,      // First input
    input  logic b,      // Second input
    output logic out     // Output: NOT (a AND b)
);

    // NAND = NOT AND
    assign out = ~(a & b);

endmodule
