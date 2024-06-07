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
        // Initialize inputs
        p1_handcard = 4'b0000; p2_handcard = 4'b0000;
        #10; // Wait for 10 time units
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 01 (Draw)

        p1_handcard = 4'b0010; p2_handcard = 4'b0001;
        #10;
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10 (P1 Wins)

        p1_handcard = 4'b0100; p2_handcard = 4'b1000;
        #10;
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11 (P2 Wins)

        p1_handcard = 4'b0111; p2_handcard = 4'b0111;
        #10;
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 01 (Draw)

        p1_handcard = 4'b1111; p2_handcard = 4'b0000;
        #10;
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 10 (P1 Wins)

        p1_handcard = 4'b0000; p2_handcard = 4'b1111;
        #10;
        $display("P1: %b, P2: %b, Result: %b", p1_handcard, p2_handcard, matchresult); // Expected: 11 (P2 Wins)

        // Add more test cases as needed

        $finish; // End the simulation
    end
endmodule
