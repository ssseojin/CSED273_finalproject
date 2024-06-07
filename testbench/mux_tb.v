`timescale 1ns / 1ps

module whattoprint_tb;

    // Inputs
    reg [2:0] state;
    reg [3:0] round, win, lose, p1_black, p1_white, p2_black, p2_white;
    reg [1:0] gameresult, matchresult;

    // Outputs
    wire [15:0] out;

    // Instantiate the module
    whattoprint uut (
        .state(state),
        .round(round),
        .win(win),
        .lose(lose),
        .p1_black(p1_black),
        .p1_white(p1_white),
        .p2_black(p2_black),
        .p2_white(p2_white),
        .gameresult(gameresult),
        .matchresult(matchresult),
        .out(out)
    );

    // Initialize inputs
    initial begin
        state = 3'b000; // Example initial state
        round = 4'b0010; // Example values for round, win, lose, etc.
        win = 4'b1101;
        lose = 4'b1010;
        p1_black = 2'b10;
        p1_white = 2'b11;
        p2_black = 2'b01;
        p2_white = 2'b00;
        gameresult = 2'b10;
        matchresult = 2'b01;

        // Delay for stable output
        #10;

        // Display results
        $display("Output: %b", out);
    end

endmodule
