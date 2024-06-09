`timescale 1ns / 1ps

module scoreupdate_tb;
    // Inputs
    reg [1:0] matchresult;
    reg clk;
    reg resetn;

    // Outputs
    wire [3:0] round;
    wire [3:0] win;
    wire [3:0] lose;

    // Instantiate the Unit Under Test (UUT)
    scoreupdate uut (
        .matchresult(matchresult),
        .clk(clk),
        .resetn(resetn),
        .round(round),
        .win(win),
        .lose(lose)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 ns period
    end

    // Test stimulus
    initial begin
        // Initialize Inputs
        matchresult = 2'b00;

        #10;

        // Reset the system

        #10;

        #10;

        // Case 1: matchresult = 2'b00 (No change expected)
        matchresult = 2'b00;
        
        #10;
      
        #10;

        // Case 2: matchresult = 2'b01 (No change expected)
        matchresult = 2'b01;
      
        #10;
        
        #10;

        // Case 3: matchresult = 2'b10 (Win increment expected)
        matchresult = 2'b10;
       
        #10;
       
        #10;

        // Case 4: matchresult = 2'b10 (Lose increment expected)
        matchresult = 2'b11;

        #10;
        
        #10;

        // Repeat the test to see the counting
        matchresult = 2'b10;  // Win incremen
        
        #10;
       
        #10;
        matchresult = 2'b10;  // Win increment
   
        #10;
      
        #10;

        matchresult = 2'b11;  // Lose increment
  
        #10;
      
        #10;
        matchresult = 2'b11;  // Lose increment
      
        #10;
      
        #10;

        // Reset the system again
   
        #10;
    
        #10;

        // Case 5: Continue counting after reset
        matchresult = 2'b10;  // Win increment
        #20;
        matchresult = 2'b11;  // Lose increment
        #20;

        // Final state
        $finish;
    end
endmodule
