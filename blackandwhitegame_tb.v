`timescale 1ns / 1ps

module baw_main_tb;

    // Inputs
    reg clk;
    reg btnCenter;
    reg btnTop;
    reg btnBottom;
    reg btnLeft;
    reg btnRight;
    reg [15:0] sw;

    // Outputs
    wire [0:3] ssSel;
    wire [7:0] ssDisp;
    wire [15:0] led;

    // Instantiate the Unit Under Test (UUT)
    baw_main uut (
        .clk(clk),
        .btnCenter(btnCenter),
        .btnTop(btnTop),
        .btnBottom(btnBottom),
        .btnLeft(btnLeft),
        .btnRight(btnRight),
        .sw(sw),
        .ssSel(ssSel),
        .ssDisp(ssDisp),
        .led(led)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        btnCenter = 0;
        btnTop = 0;
        btnBottom = 0;
        btnLeft = 0;
        btnRight = 0;
        sw = 0;

        // Wait for 100 ns for global reset to finish
        #100;

        // Add stimulus here
        // Initial state: init
        btnCenter = 1; #10; btnCenter = 0; // Move to rasp state
        #10;
//////
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;

        sw = 16'b00100000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;

        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;

        sw = 16'b00010000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;

        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
/////////////////////////////////

        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;

        sw = 16'b00000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;

        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;

        sw = 16'b00001000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;

        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
//////////
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;

        sw = 16'b00000000100000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;

        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;

        sw = 16'b00000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;

        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
//////////////
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;

        sw = 16'b00000001000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;

        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;

        sw = 16'b00100000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;

        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
/////////////
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;

        sw = 16'b01000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;

        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;

        sw = 16'b01000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;

        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
/////////
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;

        sw = 16'b00000100000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;

        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;

        sw = 16'b00000100000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;

        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
//////////
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;

        sw = 16'b00010000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;

        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;

        sw = 16'b00000000100000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;

        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
///////
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;

        sw = 16'b00000100000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;

        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;

        sw = 16'b00000000010000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;

        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;

        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
//////






        // Add further state transitions and test cases as needed
        // btnBottom = 1; #10; btnBottom = 0; // Move to init state
        // #10;

        // End simulation
        $finish;
    end

    // Clock generation
    always #5 clk = ~clk; // 10ns period clock

endmodule
