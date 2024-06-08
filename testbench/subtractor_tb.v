`timescale 1ns / 1ps

module subtractor_tb;

    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] out;

    // Instantiate the subtractor module
    subtractor uut (
        .a(a),
        .b(b),
        .out(out)
    );

    integer i, j;

    initial begin
        // Initialize inputs
        a = 0;
        b = 0;

        // Test all combinations of a and b
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                a = i;
                b = j;
                #10; // Wait for some time to observe the output
                $display("a = %b, b = %b, out = %b", a, b, out);
            end
        end
        
        // End the simulation
        $finish;
    end

endmodule
