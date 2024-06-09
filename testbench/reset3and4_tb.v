//1에서 (p2승) reset //2에서 (p2승)reset

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
    wire fin, resetn;//
    wire [1:0] matchresult;//
    wire [3:0] round, win, lose, p1_handcard, p2_handcard;
    wire [3:0]state;
    wire scoreupdatepulse, winclk,loseclk;

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
    assign fin=uut.finish1.fin;
    assign matchresult=uut.comparator.matchresult;
    assign round=uut.score.round;
    assign win=uut.score.win;
    assign lose=uut.score.lose;
    assign resetn=uut.score.resetn;
    assign p1_handcard=uut.comparator.p1_handcard;
    assign p2_handcard=uut.comparator.p2_handcard;
    assign state=uut.state;
    assign scoreupdatepulse=uut.scoreupdate_pulse;
    assign winclk=uut.score.win2.clk;
    assign loseclk=uut.score.lose2.clk;
    
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
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        sw = 16'b00100000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        sw = 16'b00010000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
///////round1
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b00000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b00001000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnBottom = 1; #10; btnBottom = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
/////////////////////////////////////////////////////////reset 되어야함.



btnCenter = 1; #10; btnCenter = 0; // Move to rasp state
        #10;
//////round 0
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        sw = 16'b00100000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        sw = 16'b00010000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
///////round1
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b00000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b00001000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnLeft =  1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
//////////roudn2
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b00000000100000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b00000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnBottom = 1; #10; btnBottom = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
/////////////////////////////////////////////////////////reset 되어야함.



        btnCenter = 1; #10; btnCenter = 0; // Move to rasp state
        #10;
//////round 0
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        sw = 16'b00100000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        sw = 16'b00010000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
///////round1
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose, p1_handcard,p2_handcard);
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b00000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b00001000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnLeft =  1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
//////////roudn2
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b00000000100000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b00000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
//////////round3
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b00000001000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b00100000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnBottom = 1; #10; btnBottom = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
//////////round4
        btnTop = 1; #10; btnTop = 0; // Move to bawp state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Move to p1_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b01000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p1_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnRight = 1; #10; btnRight = 0; // Move to p2_turn state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        sw = 16'b01000000000000000; // Set switch value
        btnTop = 1; #10; btnTop = 0; // Return to bawp state with p2_turn action
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnCenter = 1; #10; btnCenter = 0; // Move to matchresult_print state
        #10;
        $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnLeft = 1; #10; btnLeft = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;
         $display("matchresult: %b, clk: %b, ssSel: %b, fin:&b, reset:%b, round:%b, win:%b,lose:%b", matchresult, clk, ssSel, fin, resetn, round, win, lose);
        btnBottom = 1; #10; btnBottom = 0; // Depending on finish signal, move to gameresult_print or rasp state
        #10;







        // Add further state transitions and test cases as needed
        // btnBottom = 1; #10; btnBottom = 0; // Move to init state
        // #10;

        // End simulation
        $finish;
    end

    // Clock generation
    always #5 clk = ~clk; // 10ns period clock

endmodule

