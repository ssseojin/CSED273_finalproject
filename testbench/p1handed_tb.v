`timescale 1ns / 1ps

module p1handed_tb;

    // Inputs
    reg [2:0] state;

    // Outputs
    wire p1handed;

    // Instantiate the Unit Under Test (UUT)
    p1handed uut (
        .state(state),
        .p1handed(p1handed)
    );

    initial begin
        // Initialize Inputs
        state = 3'b000;

        // Wait for 50 ns for global reset to finish
        #50;

        // Add stimulus here
        state = 3'b000; #10;
        $display("state: %b, p1handed: %b", state, p1handed);

        state = 3'b001; #10;
        $display("state: %b, p1handed: %b", state, p1handed);

        state = 3'b010; #10;
        $display("state: %b, p1handed: %b", state, p1handed);

        state = 3'b011; #10;
        $display("state: %b, p1handed: %b", state, p1handed);

        state = 3'b100; #10;
        $display("state: %b, p1handed: %b", state, p1handed);

        state = 3'b101; #10;
        $display("state: %b, p1handed: %b", state, p1handed);

        state = 3'b110; #10;
        $display("state: %b, p1handed: %b", state, p1handed);

        state = 3'b111; #10;
        $display("state: %b, p1handed: %b", state, p1handed);

        // Finish simulation
        $finish;
    end

    // Clock generation (optional, if needed)
    always #5 state[0] = ~state[0];

endmodule
