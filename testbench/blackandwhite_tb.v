`timescale 1ns / 1ps

module blackandwhite_tb;

    reg [9:0] p_card;
    wire [2:0] p_black;
    wire [2:0] p_white;

    // ?¸?¤?´?¤?
    blackandwhite uut (
        .p_card(p_card),
        .p_black(p_black),
        .p_white(p_white)
    );

    initial begin
        // ??¤?¸ ěź??´?¤: ?? Ľ ę°ě ëł?ę˛˝íęł? ę˛°ęłźëĽ? ëŞ¨ë?°ë§?
        $monitor("time=%0d, p_card=%d, p_black=%0d, p_white=%0d", $time, p_card, p_black, p_white);

        // ę°? ??¤?¸ ë˛Ąí°? ???´ ëŞ¨ë ?¸ěś?
        p_card = 10'b0000000000; #10;  // 0 ?ěš´ë, 0 ë°ąěš´? (p_black=000, p_white=000)
        p_card = 10'b1111111111; #10;  // 5 ?ěš´ë, 5 ë°ąěš´? (p_black=101, p_white=101)
        p_card = 10'b1010101010; #10;  // 3 ?ěš´ë, 2 ë°ąěš´? (p_black=011, p_white=010)
        
        p_card = 10'b1000000000; #10;
        p_card = 10'b0100000000; #10;
        p_card = 10'b1011101110; #10;
        p_card = 10'b1110101011; #10;

        // ?ëŽŹë ?´? ě˘ëŁ
        //
    end

endmodule

module count_tb;

    reg [4:0] in;
    wire [2:0] count;

    // ?¸?¤?´?¤?
    count uut (
        .in(in),
        .count(count)
    );

    initial begin
        // ??¤?¸ ěź??´?¤: ?? Ľ ę°ě ëł?ę˛˝íęł? ę˛°ęłźëĽ? ëŞ¨ë?°ë§?
        $monitor("time=%0d, in=%b, count=%b", $time, in, count);

        // ę°? ??¤?¸ ë˛Ąí°? ???´ ëŞ¨ë ?¸ěś?
        in = 5'b00000; #10;  // 0ę°? (count=000)
        in = 5'b11111; #10;  // 5ę°? (count=101)
        in = 5'b10101; #10;  // 3ę°? (count=011)

        // ?ëŽŹë ?´? ě˘ëŁ
        $finish;
    end

endmodule
