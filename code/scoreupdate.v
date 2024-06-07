// ?¼?š´?“œ ??‚˜ê³? matchresult?‘ ?´?Ÿ­ ?…? ¥?˜ë©?
// round counter, win counter, lose counter ?—…?°?´?Š¸

// Lab6?— counter ëª¨ë“ˆ ?“°ê¸?

// round?Š” ?¼?š´?“œ ??‚ ?•Œë§ˆë‹¤ 1 ì¶”ê?
// p1 ?Š¹?´ë©? win counter 1 ì¶”ê?
// p2 ?Š¹?´ë©? lose counter 1 ì¶”ê?

module scoreupdate(
    input [1:0] matchresult,
    input clk,
    input resetn,
    output [3:0] round,
    output [3:0] win,
    output [3:0] lose
);
    wire win_clk, lose_clk;

    assign win_clk = ~matchresult[0] & matchresult[1] & clk; // 10 ?Š¹
    assign lose_clk = matchresult[0] & matchresult[1] & clk; // 11 ?Œ¨

    counter round2(clk, resetn, round);
    counter win2(win_clk, resetn, win);
    counter lose2(lose_clk, resetn, lose);

endmodule


// module edge_tirgger_JKFF(input j, input k, input clk, input resetn, output reg q, output reg q_); endmodule
// module edge_trigger_DFF(input d, input clk, output q, output q_); endmodule
// module edge_trigger_TFF(input t, input clk, input resetn, output q, output q_); endmodule
// module counter(input clk, input resetn, output[3:0] count); endmodule


// FF
module edge_trigger_JKFF(input j, input k, input clk, input resetn, output reg q, output reg q_);  
    
    initial begin
      q = 0;
      q_ = ~q;
    end
       
    always @(negedge clk or posedge resetn) begin
        if(resetn) begin
            q = 0;
            q_ = 1;
        end
        else begin
            q = (j&~q | ~k&q);
            q_ = ~q;
        end
    end
    
endmodule

module edge_trigger_JKFFp(input j, input k, input clk, input resetn, output reg q, output reg q_);  
    
    initial begin
      q = 0;
      q_ = ~q;
    end
       
    always @(negedge clk or posedge resetn) begin
        if(resetn) begin
            q = 1;
            q_ = 0;
        end
        else begin
            q = (j&~q | ~k&q);
            q_ = ~q;
        end
    end
    
endmodule



module edge_trigger_DFF(input d, input clk, input resetn, output q, output q_);   
    
    edge_trigger_JKFF DFF (d, ~d, clk, resetn, q, q_);

endmodule

module edge_trigger_TFF(input t, input clk, input resetn, output q, output q_);   

    edge_trigger_JKFF TFF (t, t, clk, resetn, q, q_);

endmodule

module edge_trigger_TFFp(input t, input clk, input resetn, output q, output q_);   

    edge_trigger_JKFFp TFF (t, t, clk, resetn, q, q_);

endmodule

// Counter(4-bit)
module counter(input clk, input resetn, output [3:0] count);

    wire [3:0] _count;
    edge_trigger_TFF count0 (1, clk, resetn, count[0], _count[0]);
    edge_trigger_TFF count1 (count[0], clk, resetn, count[1], _count[1]);
    edge_trigger_TFF count2 (count[1]&count[0], clk, resetn, count[2], _count[2]);
    edge_trigger_TFF count3 (count[2]&count[1]&count[0], clk, resetn, count[3], _count[3]);
    
endmodule
