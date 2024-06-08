`timescale 1ns / 1ps

module isfinish_tb;

    reg [3:0] round;
    reg [3:0] win;
    reg [3:0] lose;
    wire fin;
    wire [1:0] printwinner;

    // Instantiate the isfinish module
    isfinish uut (
        .round(round),
        .win(win),
        .lose(lose),
        .fin(fin),
        .printwinner(printwinner)
    );

    integer i, j, k;

    initial begin
        // Initialize inputs
        round = 0;
        win = 0;
        lose = 0;

        // Test all combinations of round, win, and lose
        for (i = 0; i < 9; i = i + 1) begin
            for (j = 0; j < 9; j = j + 1) begin
                for (k = 0; k < i-j; k = k + 1) begin
                    round = i;
                    win = j;
                    lose = k;
                    #10; // Wait for some time to observe the output
                    $display("round = %d, win = %d, lose = %d, fin = %b, printwinner = %b", round, win, lose, fin, printwinner);
                end
            end
        end
        
        // End the simulation
        $finish;
    end

endmodule