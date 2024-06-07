`timescale 1ns / 1ps

module blackandwhite_tb;

    reg [9:0] p_card;
    wire [2:0] p_black;
    wire [2:0] p_white;

    // ?¸?Š¤?„´?Š¤?™”
    blackandwhite uut (
        .p_card(p_card),
        .p_black(p_black),
        .p_white(p_white)
    );

    initial begin
        // ?…Œ?Š¤?Š¸ ì¼??´?Š¤: ?…? ¥ ê°’ì„ ë³?ê²½í•˜ê³? ê²°ê³¼ë¥? ëª¨ë‹ˆ?„°ë§?
        $monitor("time=%0d, p_card=%d, p_black=%0d, p_white=%0d", $time, p_card, p_black, p_white);

        // ê°? ?…Œ?Š¤?Š¸ ë²¡í„°?— ???•´ ëª¨ë“ˆ ?˜¸ì¶?
        p_card = 10'b0000000000; #10;  // 0 ?‘ì¹´ë“œ, 0 ë°±ì¹´?“œ (p_black=000, p_white=000)
        p_card = 10'b1111111111; #10;  // 5 ?‘ì¹´ë“œ, 5 ë°±ì¹´?“œ (p_black=101, p_white=101)
        p_card = 10'b1010101010; #10;  // 3 ?‘ì¹´ë“œ, 2 ë°±ì¹´?“œ (p_black=011, p_white=010)
        
        p_card = 10'b1000000000; #10;
        p_card = 10'b0100000000; #10;
        p_card = 10'b1011101110; #10;
        p_card = 10'b1110101011; #10;

        // ?‹œë®¬ë ˆ?´?…˜ ì¢…ë£Œ
        //
    end

endmodule

module count_tb;

    reg [4:0] in;
    wire [2:0] count;

    // ?¸?Š¤?„´?Š¤?™”
    count uut (
        .in(in),
        .count(count)
    );

    initial begin
        // ?…Œ?Š¤?Š¸ ì¼??´?Š¤: ?…? ¥ ê°’ì„ ë³?ê²½í•˜ê³? ê²°ê³¼ë¥? ëª¨ë‹ˆ?„°ë§?
        $monitor("time=%0d, in=%b, count=%b", $time, in, count);

        // ê°? ?…Œ?Š¤?Š¸ ë²¡í„°?— ???•´ ëª¨ë“ˆ ?˜¸ì¶?
        in = 5'b00000; #10;  // 0ê°? (count=000)
        in = 5'b11111; #10;  // 5ê°? (count=101)
        in = 5'b10101; #10;  // 3ê°? (count=011)

        // ?‹œë®¬ë ˆ?´?…˜ ì¢…ë£Œ
        $finish;
    end

endmodule
