module p1handed(
    input[2:0]state,
    output p1handed
);  
    wire p1handed, clk, d;
    assign clk = ~state[2]&~state[1]&state[0] | ~state[2]&state[1]&state[0];//p1turn에서 reset하면 초기화 P1handedr가 1로 유지 될지도..
    assign d= p1handed & ~state[0] | p1handed & state[2] | state[1] & state[0];

    edge_trigger_DFF p1handed_(d,clk, 0, p1handed, ~p1handed);


endmodule

module p2handed(
    input[2:0]state,
    output p2handed
);
    wire p2handed;
    assign clk = ~state[2]&~state[1]&state[0] | state[2]&~state[1]&~state[0];
    assign d= p2handed & state[1] | p2handed & ~state[0] | state[2] & ~state[1];
    edge_trigger_DFF p1handed_(d,clk, 0, p2handed, ~p2handed);

endmodule
