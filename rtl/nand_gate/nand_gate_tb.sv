// ============================================================================
// Testbench for NAND Gate
// ============================================================================
// This testbench:
// 1. Instantiates the NAND gate
// 2. Tests all 4 possible input combinations
// 3. Generates a VCD waveform file for visualization
// 4. Reports PASS/FAIL for each test case
// ============================================================================

`timescale 1ns/1ps  // Time unit / precision

module nand_gate_tb;

    // -------------------------------------------------------------------------
    // Signals
    // -------------------------------------------------------------------------
    logic a;        // Test input a
    logic b;        // Test input b
    logic out;      // Output from DUT (Device Under Test)

    // -------------------------------------------------------------------------
    // Instantiate the Device Under Test (DUT)
    // -------------------------------------------------------------------------
    nand_gate dut (
        .a   (a),
        .b   (b),
        .out (out)
    );

    // -------------------------------------------------------------------------
    // Waveform Generation
    // -------------------------------------------------------------------------
    initial begin
        // Create VCD file for waveform viewing
        $dumpfile("nand_gate.vcd");
        $dumpvars(0, nand_gate_tb);  // Dump all variables in this module
    end

    // -------------------------------------------------------------------------
    // Test Stimulus
    // -------------------------------------------------------------------------
    initial begin
        integer errors;
        errors = 0;

        $display("============================================");
        $display("NAND Gate Testbench");
        $display("============================================");
        $display("Time\t a\t b\t out\t Expected");
        $display("--------------------------------------------");

        // Test Case 1: a=0, b=0 -> out=1
        a = 0; b = 0;
        #10;
        $display("%0t\t %b\t %b\t %b\t 1", $time, a, b, out);
        if (out !== 1'b1) begin
            $display("ERROR: Expected 1, got %b", out);
            errors = errors + 1;
        end

        // Test Case 2: a=0, b=1 -> out=1
        a = 0; b = 1;
        #10;
        $display("%0t\t %b\t %b\t %b\t 1", $time, a, b, out);
        if (out !== 1'b1) begin
            $display("ERROR: Expected 1, got %b", out);
            errors = errors + 1;
        end

        // Test Case 3: a=1, b=0 -> out=1
        a = 1; b = 0;
        #10;
        $display("%0t\t %b\t %b\t %b\t 1", $time, a, b, out);
        if (out !== 1'b1) begin
            $display("ERROR: Expected 1, got %b", out);
            errors = errors + 1;
        end

        // Test Case 4: a=1, b=1 -> out=0
        a = 1; b = 1;
        #10;
        $display("%0t\t %b\t %b\t %b\t 0", $time, a, b, out);
        if (out !== 1'b0) begin
            $display("ERROR: Expected 0, got %b", out);
            errors = errors + 1;
        end

        // -------------------------------------------------------------------------
        // Summary
        // -------------------------------------------------------------------------
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
