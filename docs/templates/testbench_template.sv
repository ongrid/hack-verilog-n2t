// ============================================================================
// Testbench for [Module Name]
// ============================================================================
// This testbench:
// 1. [What it tests]
// 2. [Test coverage]
// 3. [Special considerations]
// ============================================================================

`timescale 1ns/1ps

module module_name_tb;

    // -------------------------------------------------------------------------
    // Signals
    // -------------------------------------------------------------------------
    logic       input_signal;     // Input signal
    logic       output_signal;    // Output from DUT

    // -------------------------------------------------------------------------
    // Instantiate Device Under Test (DUT)
    // -------------------------------------------------------------------------
    module_name dut (
        .input_signal  (input_signal),
        .output_signal (output_signal)
    );

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
        $display("Time\t Input\t Output\t Expected");
        $display("--------------------------------------------");

        // Initialize signals
        input_signal = 0;
        #5;

        // Test Case 1: [Description]
        input_signal = 1'b0;
        #10;
        $display("%0t\t %b\t %b\t %b", $time, input_signal, output_signal, 1'b1);
        if (output_signal !== 1'b1) begin
            $display("ERROR: Expected 1, got %b", output_signal);
            errors = errors + 1;
        end

        // Test Case 2: [Description]
        input_signal = 1'b1;
        #10;
        $display("%0t\t %b\t %b\t %b", $time, input_signal, output_signal, 1'b0);
        if (output_signal !== 1'b0) begin
            $display("ERROR: Expected 0, got %b", output_signal);
            errors = errors + 1;
        end

        // Add more test cases as needed...

        // -------------------------------------------------------------------------
        // Summary
        // -------------------------------------------------------------------------
        $display("============================================");
        if (errors == 0) begin
            $display("ALL TESTS PASSED!");
            $finish(0);
        end else begin
            $display("TESTS FAILED: %0d errors", errors);
            $finish(1);
        end
    end

endmodule
