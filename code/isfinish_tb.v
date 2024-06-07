//isfinish tb// by gpt
module tb_isfinish;
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

    initial begin
        // Test case 1: ?•„ì§? ?¼?š´?“œê°? ?‚¨?•„?ˆ?Œ
        round = 4'b0001; // Round 2
        win = 4'b0000;   // Win 0
        lose = 4'b0001;  // Lose 2
        #10;
        $display("round = %b, win = %b, lose = %b, fin = %b, printwinner = %b", round, win, lose, fin, printwinner);
        // Expected output: fin = 0, printwinner = 00

        // Test case 2: p1?´ ?Š¹ë¦¬ë?? ?™•? •ì§??Œ
        round = 4'b1001; // Round 4
        win = 4'b0000;   // Win 0
        lose = 4'b1000;  // Lose 4
        #10;
        $display("round = %b, win = %b, lose = %b, fin = %b, printwinner = %b", round, win, lose, fin, printwinner);
        // Expected output: fin = 1, printwinner = 10

        // Test case 3: p2?´ ?Š¹ë¦¬ë?? ?™•? •ì§??Œ
        round = 4'b1010; // Round 6
        win = 4'b0000;   // Win 2
        lose = 4'b1010;  // Lose 6
        #10;
        $display("round = %b, win = %b, lose = %b, fin = %b, printwinner = %b", round, win, lose, fin, printwinner);
        // Expected output: fin = 1, printwinner = 11

        // Test case 4: ë¬´ìŠ¹ë¶?
        round = 4'b0010; // Round 2
        win = 4'b0010;   // Win 5
        lose = 4'b0000;  // Lose 5
        #10;
        $display("round = %b, win = %b, lose = %b, fin = %b, printwinner = %b", round, win, lose, fin, printwinner);
        // Expected output: fin = 1, printwinner = 01

        // Test case 5: ?¼?š´?“œê°? ??‚¬ì§?ë§? ?Š¹?Œ¨ê°? ?™•? •?˜ì§? ?•Š?Œ
        round = 4'b0100; // Round 8
        win = 4'b0100;   // Win 4
        lose = 4'b0000;  // Lose 4
        #10;
        $display("round = %b, win = %b, lose = %b, fin = %b, printwinner = %b", round, win, lose, fin, printwinner);
        // Expected output: fin = 0, printwinner = 00
    end
endmodule
