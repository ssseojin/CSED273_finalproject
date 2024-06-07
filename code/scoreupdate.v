// 라운드 끝나고 matchresult랑 클럭 입력되면
// round counter, win counter, lose counter 업데이트

// Lab6에 counter 모듈 쓰기

// round는 라운드 끝날때마다 1 추가
// p1 승이면 win counter 1 추가
// p2 승이면 lose counter 1 추가

module scoreupdate(
    input [1:0] matchresult,
    input clk,
    input resetn,
    output round,
    output win,
    output lose
);
    wire win_clk, lose_clk;

    assign win_clk = matchresult[0] & ~matchresult[1] & clk; // 10 승
    assign lose_clk = matchresult[0] & matchresult[1] & clk; // 11 패

    counter round(clk, resetn, round);
    counter win(win_clk, resetn, win);
    counter lose(lose_clk, resetn, lose);

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
       
    always @(posedge clk or negedge resetn) begin
        if(!resetn) begin
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
       
    always @(posedge clk or negedge resetn) begin
        if(!resetn) begin
            q = 1;
            q_ = 0;
        end
        else begin
            q = (j&~q | ~k&q);
            q_ = ~q;
        end
    end
    
endmodule



module edge_trigger_DFF(input d, input clk, output q, output q_);   
    
    edge_trigger_JKFF DFF (d, ~d, clk, 1, q, q_);

endmodule

module edge_trigger_DFFp(input d, input clk, output q, output q_);   
    
    edge_trigger_JKFFp DFFp (d, ~d, clk, 1, q, q_);

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
