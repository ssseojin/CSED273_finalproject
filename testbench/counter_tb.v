`timescale 1ns / 1ps

module counter_tb;

    // Inputs
    reg clk;
    reg resetn;

    // Outputs
    wire [3:0] count;

    // Instantiate the Unit Under Test (UUT)
    counter uut (
        .clk(clk),
        .resetn(resetn),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns 주기
    end

    // Test vectors
    initial begin
        // Initialize inputs
        resetn = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Apply reset
        #10
        #10//1
        resetn = 1;
        #10;
        resetn = 0;
        #10;
        resetn = 1;
        #10;
        resetn = 0;
        #10;

        #10
        #10//1
        #10
        #10//2

        #10
        #10//1
        #10
        #10//2
        #10
        #10//3
        resetn = 1;
        #10;
        resetn = 0;
        #10;


        #10
        #10//1
        #10
        #10//2
        #10
        #10//3
        #10
        #10//4
        resetn = 1;
        #10;
        resetn = 0;
        #10;


        // resetn = 1;
        // #10;
        // resetn = 0;
        // #10;
        // resetn = 1;
        // #10;

        // // Wait and observe counting
        // #200;
        
        // // Apply another reset
        // resetn = 0;
        // #10;
        // resetn = 1;
        // #10;

        // Finish simulation after sufficient time
        #200;
        $finish;
    end

    // Monitor the outputs
    initial begin
        $monitor("Time = %0t, clk = %b, resetn = %b, count = %b", $time, clk, resetn, count);
    end

endmodule
