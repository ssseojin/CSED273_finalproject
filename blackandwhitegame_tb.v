`timescale 1ns / 1ps

module baw_main_tb;

    // Inputs
    reg clk;//
    reg btnCenter;
    reg btnTop;
    reg btnBottom;
    reg btnLeft;
    reg btnRight;
    reg [15:0] sw;

    // Outputs
    wire [0:3] ssSel;//
    wire [7:0] ssDisp;
    wire [15:0] led;
    wire fin, reset;//
    wire [1:0] matchresult;//
    wire [3:0] round, win, lose;

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

    isfinish isfin(
        .fin(fin),
    );

    compare com(
        .matchresult(matchresult)
    );

    scoreupdat scoreup(
        .round(round),
        .win(win),
        .lose(lose),
        .resetn(resetn)
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
//////round 0
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00100000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00010000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
///////round1
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00001000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft =  1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
//////////roudn2
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00000000100000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
//////////round3
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00000001000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00100000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
/////////round4
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b01000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b01000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
/////////round5
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00000100000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00000100000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
//////////round6
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00010000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00000000100000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
///////round7
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00000100000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00000000010000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
//////round8
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00000100000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        sw = 16'b00000000010000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, reset, round, win, lose);
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
