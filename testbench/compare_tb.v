`timescale 1ns / 1ps

module compare_tb;
    reg [3:0] p1_handcard;
    reg [3:0] p2_handcard;
    wire [1:0] matchresult;

    // Instantiate the compare module
    compare uut (
        .p1_handcard(p1_handcard),
        .p2_handcard(p2_handcard),
        .matchresult(matchresult)
    );

    initial begin
    // p1이 0일때
        p1_handcard = 4'b0000; p2_handcard = 4'b0000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 01 
        p1_handcard = 4'b0000; p2_handcard = 4'b0001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0000; p2_handcard = 4'b0010;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0000; p2_handcard = 4'b0011;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0000; p2_handcard = 4'b0100;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0000; p2_handcard = 4'b0101;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0000; p2_handcard = 4'b0110;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0000; p2_handcard = 4'b0111;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0000; p2_handcard = 4'b1000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0000; p2_handcard = 4'b1001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11

    //  p1이 1
        p1_handcard = 4'b0001; p2_handcard = 4'b0000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10 
        p1_handcard = 4'b0001; p2_handcard = 4'b0001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 01
        p1_handcard = 4'b0001; p2_handcard = 4'b0010;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0001; p2_handcard = 4'b0011;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0001; p2_handcard = 4'b0100;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0001; p2_handcard = 4'b0101;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0001; p2_handcard = 4'b0110;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0001; p2_handcard = 4'b0111;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0001; p2_handcard = 4'b1000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0001; p2_handcard = 4'b1001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11

    //  p1이 2
        p1_handcard = 4'b0010; p2_handcard = 4'b0000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10 
        p1_handcard = 4'b0010; p2_handcard = 4'b0001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0010; p2_handcard = 4'b0010;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 01
        p1_handcard = 4'b0010; p2_handcard = 4'b0011;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0010; p2_handcard = 4'b0100;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0010; p2_handcard = 4'b0101;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0010; p2_handcard = 4'b0110;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0010; p2_handcard = 4'b0111;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0010; p2_handcard = 4'b1000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0010; p2_handcard = 4'b1001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11

    //  p1이 3
        p1_handcard = 4'b0011; p2_handcard = 4'b0000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10 
        p1_handcard = 4'b0011; p2_handcard = 4'b0001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0011; p2_handcard = 4'b0010;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0011; p2_handcard = 4'b0011;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected:01
        p1_handcard = 4'b0011; p2_handcard = 4'b0100;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0011; p2_handcard = 4'b0101;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0011; p2_handcard = 4'b0110;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0011; p2_handcard = 4'b0111;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0011; p2_handcard = 4'b1000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0011; p2_handcard = 4'b1001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11


    //  p1이 4
        p1_handcard = 4'b0100; p2_handcard = 4'b0000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10 
        p1_handcard = 4'b0100; p2_handcard = 4'b0001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0100; p2_handcard = 4'b0010;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0100; p2_handcard = 4'b0011;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected:10
        p1_handcard = 4'b0100; p2_handcard = 4'b0100;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 01
        p1_handcard = 4'b0100; p2_handcard = 4'b0101;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0100; p2_handcard = 4'b0110;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0100; p2_handcard = 4'b0111;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0100; p2_handcard = 4'b1000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0100; p2_handcard = 4'b1001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11


    //  p1이 5
        p1_handcard = 4'b0101; p2_handcard = 4'b0000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10 
        p1_handcard = 4'b0101; p2_handcard = 4'b0001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0101; p2_handcard = 4'b0010;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0101; p2_handcard = 4'b0011;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected:10
        p1_handcard = 4'b0101; p2_handcard = 4'b0100;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0101; p2_handcard = 4'b0101;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 01
        p1_handcard = 4'b0101; p2_handcard = 4'b0110;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0101; p2_handcard = 4'b0111;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0101; p2_handcard = 4'b1000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0101; p2_handcard = 4'b1001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11

    //  p1이 6
        p1_handcard = 4'b0110; p2_handcard = 4'b0000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10 
        p1_handcard = 4'b0110; p2_handcard = 4'b0001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0110; p2_handcard = 4'b0010;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0110; p2_handcard = 4'b0011;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected:10
        p1_handcard = 4'b0110; p2_handcard = 4'b0100;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0110; p2_handcard = 4'b0101;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0110; p2_handcard = 4'b0110;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 01
        p1_handcard = 4'b0110; p2_handcard = 4'b0111;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0110; p2_handcard = 4'b1000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0110; p2_handcard = 4'b1001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11

    //  p1이 7
        p1_handcard = 4'b0111; p2_handcard = 4'b0000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10 
        p1_handcard = 4'b0111; p2_handcard = 4'b0001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0111; p2_handcard = 4'b0010;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0111; p2_handcard = 4'b0011;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected:10
        p1_handcard = 4'b0111; p2_handcard = 4'b0100;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0111; p2_handcard = 4'b0101;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0111; p2_handcard = 4'b0110;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b0111; p2_handcard = 4'b0111;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 01
        p1_handcard = 4'b0111; p2_handcard = 4'b1000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11
        p1_handcard = 4'b0111; p2_handcard = 4'b1001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11

    //  p1이 8
        p1_handcard = 4'b1000; p2_handcard = 4'b0000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10 
        p1_handcard = 4'b1000; p2_handcard = 4'b0001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1000; p2_handcard = 4'b0010;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1000; p2_handcard = 4'b0011;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected:10
        p1_handcard = 4'b1000; p2_handcard = 4'b0100;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1000; p2_handcard = 4'b0101;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1000; p2_handcard = 4'b0110;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1000; p2_handcard = 4'b0111;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1000; p2_handcard = 4'b1000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 01
        p1_handcard = 4'b1000; p2_handcard = 4'b1001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11

    //  p1이 9
        p1_handcard = 4'b1001; p2_handcard = 4'b0000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10 
        p1_handcard = 4'b1001; p2_handcard = 4'b0001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1001; p2_handcard = 4'b0010;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1001; p2_handcard = 4'b0011;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected:10
        p1_handcard = 4'b1001; p2_handcard = 4'b0100;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1001; p2_handcard = 4'b0101;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1001; p2_handcard = 4'b0110;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1001; p2_handcard = 4'b0111;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1001; p2_handcard = 4'b1000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10
        p1_handcard = 4'b1001; p2_handcard = 4'b1001;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 01
        // Add more test cases as needed

        $finish; // End the simulation
    end
endmodule
