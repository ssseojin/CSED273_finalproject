`timescale 1ns / 1ps

module adder_tb;

    reg [3:0] x;
    reg [3:0] y;
    reg c_in;
    wire [3:0] out;
    wire c_out;

    // Instantiate the adder module
    adder uut (
        .x(x),
        .y(y),
        .c_in(c_in),
        .out(out),
        .c_out(c_out)
    );

    integer i, j, k;

    initial begin
        // Initialize inputs
        x = 0;
        y = 0;
        c_in = 0;

        // Test all combinations of x, y, and c_in
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                    x = i;
                    y = j;
                    c_in = 0;
                    #10; // Wait for some time to observe the output
                    $display("x = %b, y = %b, c_in = %b, out = %b, c_out = %b", x, y, c_in, out, c_out);
            end
        end
        
        // End the simulation
        $finish;
    end

endmodule
