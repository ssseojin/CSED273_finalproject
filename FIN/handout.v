// handout p1(cardselect, handout_p1_pulse, resetn, p1_handcard, p1_card);

module handout(
    input [8:0] cardselect,
    input handout_pulse,
    input resetn,
    output [3:0] handcard,
    output [8:0] card 
);
    // 16:4 encoderë¡? cardselect?•œê±? handcard 4ë¹„íŠ¸ë¡? ë³??™˜
    // handcard D FFë¡? ???¥
    // card T FFë¡? ???¥ -> ì´ˆê¸°?™”ë¥? ?–´?–»ê²Œí•˜ì§? ..? reset?´ ?‹¤ë¥´ê²Œ ?˜?Š” ë²„ì „?˜ FFë¥? ë§Œë“¤?–´ì¤˜ì•¼?•¨
    wire [15:0] i;
    assign i[0] = cardselect[0];
    assign i[1] = cardselect[1];
    assign i[2] = cardselect[2];
    assign i[3] = cardselect[3];
    assign i[4] = cardselect[4];
    assign i[5] = cardselect[5];
    assign i[6] = cardselect[6];
    assign i[7] = cardselect[7];
    assign i[8] = cardselect[8];
    assign i[9] = 0;
    assign i[10] = 0;
    assign i[11] = 0;
    assign i[12] = 0;
    assign i[13] = 0;
    assign i[14] = 0;
    assign i[15] = 0;

    wire [3:0] handcard_input;

    encoder encoder0(i, handcard_input);
    handcard handcard0(handcard_input, handout_pulse, resetn, handcard);
    card card0(cardselect, handout_pulse, resetn, card);

endmodule

module encoder(
    input [15:0] i,
    output [3:0] a
);
    assign a[0] = i[1] | i[3] | i[5] | i[7] | i[9] | i[11] | i[13] | i[15];
    assign a[1] = i[2] | i[3] | i[6] | i[7] | i[10] | i[11] | i[14] | i[15];
    assign a[2] = i[4] | i[5] | i[6] | i[7] | i[12] | i[13] | i[14] | i[15];
    assign a[3] = i[8] | i[9] | i[10] | i[11] | i[12] | i[13] | i[14] | i[15];
    
endmodule

module card(
    input [8:0] t,
    input clk,
    input resetn,
    output [8:0] card
);
    wire [8:0] q, q_;

    edge_trigger_TFFp c0(t[0], clk, resetn, q[0], q_[0]);
    edge_trigger_TFFp c1(t[1], clk, resetn, q[1], q_[1]);
    edge_trigger_TFFp c2(t[2], clk, resetn, q[2], q_[2]);
    edge_trigger_TFFp c3(t[3], clk, resetn, q[3], q_[3]);
    edge_trigger_TFFp c4(t[4], clk, resetn, q[4], q_[4]);
    edge_trigger_TFFp c5(t[5], clk, resetn, q[5], q_[5]);
    edge_trigger_TFFp c6(t[6], clk, resetn, q[6], q_[6]);
    edge_trigger_TFFp c7(t[7], clk, resetn, q[7], q_[7]);
    edge_trigger_TFFp c8(t[8], clk, resetn, q[8], q_[8]);

    assign card = q;

endmodule

module handcard(
    input [3:0] d,
    input clk,
    input resetn,
    output [3:0] handcard
);
    wire [3:0] q, q_;
    edge_trigger_DFF handcard0(d[0], clk, resetn, q[0], q_[0]);
    edge_trigger_DFF handcard1(d[1], clk, resetn, q[1], q_[1]);
    edge_trigger_DFF handcard2(d[2], clk, resetn, q[2], q_[2]);
    edge_trigger_DFF handcard3(d[3], clk, resetn, q[3], q_[3]);
    
    assign handcard = q;

endmodule





//////////////////

