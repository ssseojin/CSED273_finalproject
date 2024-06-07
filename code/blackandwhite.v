// blackandwhite : ?”Œ? ˆ?´?–´ ?‚¨??ì¹´ë“œ ì¤? ?‘ë°? ì¹´ë“œ ê°œìˆ˜ ê³„ì‚°?•˜?Š” ëª¨ë“ˆ

module blackandwhite(
    input [8:0] p_card, // 2ì§„ìˆ˜ 9ë¹„íŠ¸ , ê°? ?žë¦¿ìˆ˜ê°’ì´ ê·? ?žë¦¿ìˆ˜ ì¹´ë“œ ?œ ë¬? ?‘œ?˜„
    output [2:0] p_black, // ?‘ì¹´ë“œ ê°œìˆ˜ ì¶œë ¥
    output [2:0] p_white // ë°±ì¹´?“œ ê°œìˆ˜ ì¶œë ¥
);
    wire [4:0]white;
    count blackcount({p_card[0], p_card[2], p_card[4], p_card[6], p_card[8]}, p_black);
    // card 0 2 4 6 8 ì¤‘ì— 1ê°œìˆ˜ê°? ?‘ì¹´ë“œ ê°œìˆ˜

    assign white[4]=p_card[1];
    assign white[3]=p_card[3];
    assign white[2]=p_card[5];
    assign white[1]=p_card[7];
    assign white[0]=0;

    count whitecount(white, p_white);
    // card 1 3 5 7 ì¤‘ì— 1ê°œìˆ˜ê°? ë°±ì¹´?“œ ê°œìˆ˜


endmodule

module count(
    input [4:0] in,
    output [2:0] count
);
    wire [1:0] cnt_p1, cnt_p2;
    wire [2:0]in_w_0;
    assign in_w_0[2]= in[1];
    assign in_w_0[1]= in[0];
    assign in_w_0[0]= 0;
    
    count_ones pt1 (in[4:2], cnt_p1);
    count_ones pt2 (in_w_0, cnt_p2);
    //count_ones pt2 ({in[1:0],0 }, cnt_p2);
    plus p(cnt_p1, cnt_p2, count);

    // 5-bit count_ones module - 5ë¹„íŠ¸ ?ž…? ¥ë°›ì•„?„œ 1 ê°œìˆ˜ ?„¸?Š” ëª¨ë“ˆ

endmodule

module count_ones(
    input [2:0] in,
    output [1:0] ones
);
    assign ones[1] = (in[2] & in[1]) | (in[2] & in[0]) | (in[1] & in[0]);
    assign ones[0] = (in[2] & ~in[1] & ~in[0]) | (~in[2] & ~in[1] & in[0]) | (in[2] & in[1] & in[0]) | (~in[2] & in[1] & ~in[0]);

endmodule

module plus(
    input [1:0] pt1, pt2,
    output [2:0] count
);
    wire carry;
    half_adder ha (pt1[0], pt2[0], count[0], carry);
    full_adder fa (pt1[1], pt2[1], carry, count[1],count[2]);
   
endmodule

module half_adder(
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;
    assign carry = a & b;

endmodule

module full_adder(
    input a, b, cin,
    output sum, carry
);

    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (cin & a);

endmodule
