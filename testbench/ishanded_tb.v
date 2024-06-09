module tb_p1handed_p2handed;

    // Parameters
    reg [3:0] state;
    wire p1handed;
    wire p2handed;

    // Instantiate the p1handed module
    p1handed uut_p1handed (
        .state(state),
        .p1handed(p1handed)
    );

    // Instantiate the p2handed module
    p2handed uut_p2handed (
        .state(state),
        .p2handed(p2handed)
    );

    // Test all possible cases
    initial begin
        // Iterate over all possible values of state (4-bit wide: 16 combinations)
        for (state = 0; state < 16; state = state + 1) begin
            #10;  // Wait for 10 time units
            // Optionally print the state and output for debugging
            $display("State: %b, p1handed: %b, p2handed: %b", state, p1handed, p2handed);
        end
        $finish;  // End simulation
    end

endmodule
