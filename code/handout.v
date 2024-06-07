// handout p1(cardselect, handout_p1_pulse, resetn, p1_handcard, p1_card);

module handout(
    input [8:0] cardselect,
    input handout_pulse,
    input resetn,
    output [3:0] handcard,
    output [8:0] card 
);
    // 16:4 encoder로 cardselect한거 handcard 4비트로 변환
    // handcard D FF로 저장
    // card T FF로 저장 -> 초기화를 어떻게하지 ..? reset이 다르게 되는 버전의 FF를 만들어줘야함
    wire [15:0] i;
    assign i = {7'b0, cardselect};
    wire [3:0] handcard_input;

    encoder encoder0(i, handcard_input);
    handcard handcard0(handcard_input, handout_pulse, resetn, handcard);
    card card0(cardselect, handout_pulse, reset_n, card);

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

