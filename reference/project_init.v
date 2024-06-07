`timescale 1ns / 1ps

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

module edge_trigger_DFF(input d, input clk, output q, output q_);   
    
    edge_trigger_JKFF DFF (d, ~d, clk, 1, q, q_);

endmodule

module edge_trigger_TFF(input t, input clk, input resetn, output q, output q_);   

    edge_trigger_JKFF TFF (t, t, clk, resetn, q, q_);

endmodule

// Counter(4-bit)
module counter(input clk, input resetn, output [3:0] count);

    wire [3:0] _count;
    edge_trigger_TFF count0 (1, clk, resetn, count[0], _count[0]);
    edge_trigger_TFF count1 (count[0], clk, resetn, count[1], _count[1]);
    edge_trigger_TFF count2 (count[1]&count[0], clk, resetn, count[2], _count[2]);
    edge_trigger_TFF count3 (count[2]&count[1]&count[0], clk, resetn, count[3], _count[3]);
    
endmodule

// IDLE
module idle(input clk, output reg [3:0] sel, output reg [6:0] disp);
    
    integer counter;
    wire [6:0] res1, res2, res3, res4;
 
    BCD_to_7segment sel0(
        .in(4'b1111),
        .Disp(res1)
    );
    
    BCD_to_7segment sel1(
        .in(4'b0001),
        .Disp(res2)
    );
    
    BCD_to_7segment sel2(
        .in(4'b1100),
        .Disp(res3)
    );
    
    BCD_to_7segment sel3(
        .in(4'b0001),
        .Disp(res4)
    );
    
    initial begin
        counter <= 0;
        sel <= 14;
        disp <= 7'b1111111;
     end
     
    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 100000) begin
          counter <= 0;
          case (sel)
            14: begin
              sel <= 13;
              disp <= res2;
            end
            13: begin
              sel <= 11;
              disp <= res3;
            end
            11: begin
              sel <= 7;
              disp <= res4;
            end
            7: begin
              sel <= 14;
              disp <= res1;
            end
          endcase
        end
      end
endmodule  

// MODE1_RUN
module mode1_run(
    input [3:0] in, 
    input [7:0] num1, num2, num3, num4, num5, num6,
    input sw_clk,
    input clk,
    input [2:0] state,
    output [3:0] count, output integer in_num,
    output reg [3:0] sel, output reg [6:0] disp
);
   
    integer counter;
    reg [7:0] ans;
    wire [3:0] temp1, temp2;
    reg [3:0] ttemp1, ttemp2;
    wire eq;
    reg count_clk;
    wire [6:0] res1, res2, res4;
    reg reset_n;
    wire x;
    
    // ���� �ڸ� ����
    _4bit_reg R1(.in(in), .clk(sw_clk), .q(temp1));
    // ���� �ڸ� ����
    _4bit_reg R2(.in(temp1), .clk(sw_clk), .q(temp2));
    // ����(ans)�� ��
    _8bit_comparator CMPR(.A({temp2, temp1}), .B(ans), .outEQ(eq));
    
    counter COUNT(.clk(count_clk), .resetn(state[1]|state[0]), .count(count));
 
    BCD_to_7segment sel0(.in(ttemp1), .Disp(res1));
    BCD_to_7segment sel1(.in(ttemp2), .Disp(res2));
    BCD_to_7segment sel3(.in(in_num/2), .Disp(res4));
    
    initial begin
        counter <= 0;
        sel <= 14;
        disp <= 7'b1111111;
        reset_n <= 0;
    end
    assign x = state[2]^state[1];
    always @(negedge sw_clk, posedge x) begin 
        if(x)
            in_num <= 0;
        else begin
            // ī���� Ŭ�� ����s
            if (in_num%2 == 0) begin  
                count_clk <= 0;
            end
            else if (in_num%2 == 1) begin
                count_clk <= eq;
            end
            
            if (in_num == 0) ans <= num1;
            else if (in_num == 2) ans <= num2;
            else if (in_num == 4) ans <= num3;
            else if (in_num == 6) ans <= num4;
            else if (in_num == 8) ans <= num5;
            else if (in_num == 10) ans <= num6;
            
            in_num <= in_num + 1;
            if (in_num%2 == 0)
                 ttemp2 <= temp1;
            else if (in_num%2 == 1) begin
                 ttemp2 <= temp2;
                 ttemp1 <= temp1;
            end
        end
        
    end
    
    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 100000) begin
            counter <= 0;
            case (sel)
                14: begin
                    sel <= 13;
                    disp <= res2;
                end
                13: begin
                    sel <= 7;
                    disp <= res4;
                end
                7: begin
                    sel <= 14;
                    if (in_num%2 == 1)
                        disp <= 7'b1111111;
                    else if (in_num%2 == 0)
                        disp <= res1;
                end
            endcase
        end
    end
    
endmodule

// MODE1_PRINT
module model1_print(input [3:0] cnt, input clk, output reg [3:0] sel, output reg [6:0] disp);

    integer counter;
    reg [3:0] bcd1, bcd2, bcd3;     // ssSel 4��°, 3��°, 2��° �ڸ� BCD
    wire [6:0] res1, res2, res3;    // ssSel 4��°, 3��°, 2��° �ڸ� 7segment

    BCD_to_7segment sel0(
        .in(bcd1),
        .Disp(res1)
    );
    
    BCD_to_7segment sel1(
        .in(bcd2),
        .Disp(res2)
    );
    
    BCD_to_7segment sel2(
        .in(bcd3),
        .Disp(res3)
    );
    
    initial begin
        counter <= 0;
        sel <= 14;
        disp <= 7'b1111111;
    end
    
    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 100000) begin
            counter <= 0;
            case (sel)
                14: begin
                    sel <= 13;
                    disp <= res2;
                end
                13: begin
                    sel <= 11;
                    disp <= res3;
                end
                11: begin
                    sel <= 14;
                    disp <= res1;
                end
            endcase
        end
    end
    
    always @(*) begin
        case (cnt)
            4'b0000: begin // 7th
                bcd3 <= 4'b0111;
                bcd2 <= 4'b1010;
                bcd1 <= 4'b1110;  
            end
            4'b0001: begin // 6th
                bcd3 <= 4'b0110;
                bcd2 <= 4'b1010;
                bcd1 <= 4'b1110;   
            end
            4'b0010: begin // 5th
                bcd3 <= 4'b0101;
                bcd2 <= 4'b1010;
                bcd1 <= 4'b1110;  
            end
            4'b0011: begin // 4th
                bcd3 <= 4'b0100;
                bcd2 <= 4'b1010;
                bcd1 <= 4'b1110;   
            end
            4'b0100: begin // 3rd
                bcd3 <= 4'b0011;
                bcd2 <= 4'b1101;
                bcd1 <= 4'b1100;   
            end
            4'b0101: begin // 2nd
                bcd3 <= 4'b0010;
                bcd2 <= 4'b1011;
                bcd1 <= 4'b1100;   
            end
            4'b0110: begin // 1st
                bcd3 <= 4'b0001;
                bcd2 <= 4'b0101;
                bcd1 <= 4'b1010;   
            end
        endcase
    end 
    
endmodule

// MODE2_RUN
module mode2_run(
    input sw_clk,     
    input clk,   
    input [3:0] bcd,
    input [2:0] state,
    output integer in_num,
    output [7:0] num1, num2, num3, num4, num5, num6,
    output reg [3:0] sel, output reg [6:0] disp
);
   
    integer counter;
    reg [3:0] temp1, temp2;
    wire [6:0] res1, res2, res4;
    reg reset_n;
    
    fullreg memory(bcd, sw_clk, num1, num2, num3, num4, num5, num6);
    
    BCD_to_7segment sel0(
        .in(temp1),
        .Disp(res1)
    );
    BCD_to_7segment sel1(
        .in(temp2),
        .Disp(res2)
    );
    BCD_to_7segment sel3(
        .in(in_num/2),
        .Disp(res4)
    );
    
    initial begin
        counter <= 0;
        sel <= 14;
        disp <= 7'b1111111;
    end
    
    always @(negedge sw_clk, posedge state[2]) begin
        if(state[2])
            in_num <= 0;
        else begin
            in_num <= in_num + 1;
            if (in_num%2 == 0)
                 temp2 <= num6[3:0];
            else if (in_num%2 == 1) begin
                 temp2 <= num6[7:4];
                 temp1 <= num6[3:0];
            end
        end
    end
    
    always @(posedge clk) begin
        
    
        counter <= counter + 1;
        if (counter == 100000) begin
            counter <= 0;
            case (sel)
                14: begin
                    sel <= 13;
                    disp <= res2;
                end
                13: begin
                    sel <= 7;
                    disp <= res4;
                end
                7: begin
                    sel <= 14;
                    if (in_num%2 == 1)
                        disp <= 7'b1111111;
                    else if (in_num%2 == 0)
                        disp <= res1;
                end
            endcase
        end
    end
    
endmodule

// MODE2_PRINT
module mode2_print(
    input clk,
    input [7:0] num1, num2, num3, num4, num5, num6,
    output reg [3:0] sel,
    output reg [6:0] disp
);

    integer counter, ncounter, i;
    wire [6:0] res1, res2;
    reg [7:0] ans;
 
    BCD_to_7segment sel0(
        .in(ans[3:0]),
        .Disp(res1)
    );
    
    BCD_to_7segment sel1(
        .in(ans[7:4]),
        .Disp(res2)
    );
    
    initial begin
        counter <= 0;
        ncounter <= 0;
        i <= 0;
        sel <= 14;
        disp <= 7'b1111111;
    end
    
    always @(posedge clk) begin
        ncounter <= ncounter + 1;
        if (ncounter == 100000000) begin
            ncounter <= 0;
            case (i)
                0: begin
                    i <= 1;
                    ans <= num1;
                end
                1: begin
                    i <= 2;
                    ans <= num2;
                end
                2: begin
                    i <= 3;
                    ans <= num3;
                end
                3: begin
                    i <= 4;
                    ans <= num4;
                end
                4: begin
                    i <= 5;
                    ans <= num5;
                end
                5: begin
                    i <= 0;
                    ans <= num6;
                end
            endcase
        end
    end
    
    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 100000) begin
            counter <= 0;
            case (sel)
                14: begin
                    sel <= 13;
                    disp <= res2;
                end
                13: begin
                    sel <= 14;
                    disp <= res1;
                end
            endcase
        end
    end

endmodule
    
// ABORT
module abort(input clk, output reg [3:0] sel, output reg [6:0] disp);

    integer counter;
    wire [6:0] res1, res2, res3;
 
    BCD_to_7segment sel0(
        .in(4'b1101),
        .Disp(res1)
    );
    
    BCD_to_7segment sel1(
        .in(4'b1101),
        .Disp(res2)
    );
    BCD_to_7segment sel2(
        .in(4'b1111),
        .Disp(res3)
    );
    
    initial begin
        counter <= 0;
        sel <= 14;
        disp <= 7'b1111111;
     end
     
    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 100000) begin
          counter <= 0;
          case (sel)
            14: begin
              sel <= 13;
              disp <= res2;
            end
            13: begin
              sel <= 11;
              disp <= res3;
            end
            11: begin
              sel <= 14;
              disp <= res1;
            end
          endcase
        end
      end
endmodule

// Main
module project_init(
    input btnCenter,    // RESET
    btnTop,             // ENTER
    btnBottom,          // ABORT
    btnLeft,            // MODE1
    btnRight,           // MODE2
    input clk,
    input wire [9:0] sw,
    output [3:0] ssSel,
    output [6:0] ssDisp,
    output ssDP 
);
    
    // State parameters
    parameter idle = 3'b000;
	parameter mode1_run = 3'b001;
	parameter mode1_print = 3'b010;
	parameter mode2_run = 3'b011;
	parameter mode2_print = 3'b100;
	parameter abort = 3'b101;
    	
	wire fsm_clk;
    reg [2:0] state;
    reg [3:0] bcd;
    wire [3:0] count, cnt_mode1, cnt_mode2;
    wire [7:0] num1, num2, num3, num4, num5, num6;
    wire [3:0] ssSel0, ssSel1, ssSel2, ssSel3, ssSel4, ssSel5;
    wire [6:0] ssDisp0 ,ssDisp1, ssDisp2, ssDisp3, ssDisp4, ssDisp5;
        
    assign fsm_clk = sw[0]|sw[1]|sw[2]|sw[3]|sw[4]|sw[5]|sw[6]|sw[7]|sw[8]|sw[9];
    assign ssSel[3] = ~((state==idle)&~ssSel0[3] | (state==mode1_run)&~ssSel1[3] | (state==mode1_print)&~ssSel2[3] | (state==mode2_run)&~ssSel3[3] | (state==mode2_print)&~ssSel4[3] | (state==abort)&~ssSel5[3]);
    assign ssSel[2] = ~((state==idle)&~ssSel0[2] | (state==mode1_run)&~ssSel1[2] | (state==mode1_print)&~ssSel2[2] | (state==mode2_run)&~ssSel3[2] | (state==mode2_print)&~ssSel4[2] | (state==abort)&~ssSel5[2]);
    assign ssSel[1] = ~((state==idle)&~ssSel0[1] | (state==mode1_run)&~ssSel1[1] | (state==mode1_print)&~ssSel2[1] | (state==mode2_run)&~ssSel3[1] | (state==mode2_print)&~ssSel4[1] | (state==abort)&~ssSel5[1]);
    assign ssSel[0] = ~((state==idle)&~ssSel0[0] | (state==mode1_run)&~ssSel1[0] | (state==mode1_print)&~ssSel2[0] | (state==mode2_run)&~ssSel3[0] | (state==mode2_print)&~ssSel4[0] | (state==abort)&~ssSel5[0]);
    assign ssDisp[6] = ~((state==idle)&~ssDisp0[6] | (state==mode1_run)&~ssDisp1[6] | (state==mode1_print)&~ssDisp2[6] | (state==mode2_run)&~ssDisp3[6] | (state==mode2_print)&~ssDisp4[6] | (state==abort)&~ssDisp5[6]);
    assign ssDisp[5] = ~((state==idle)&~ssDisp0[5] | (state==mode1_run)&~ssDisp1[5] | (state==mode1_print)&~ssDisp2[5] | (state==mode2_run)&~ssDisp3[5] | (state==mode2_print)&~ssDisp4[5] | (state==abort)&~ssDisp5[5]);
    assign ssDisp[4] = ~((state==idle)&~ssDisp0[4] | (state==mode1_run)&~ssDisp1[4] | (state==mode1_print)&~ssDisp2[4] | (state==mode2_run)&~ssDisp3[4] | (state==mode2_print)&~ssDisp4[4] | (state==abort)&~ssDisp5[4]);
    assign ssDisp[3] = ~((state==idle)&~ssDisp0[3] | (state==mode1_run)&~ssDisp1[3] | (state==mode1_print)&~ssDisp2[3] | (state==mode2_run)&~ssDisp3[3] | (state==mode2_print)&~ssDisp4[3] | (state==abort)&~ssDisp5[3]);
    assign ssDisp[2] = ~((state==idle)&~ssDisp0[2] | (state==mode1_run)&~ssDisp1[2] | (state==mode1_print)&~ssDisp2[2] | (state==mode2_run)&~ssDisp3[2] | (state==mode2_print)&~ssDisp4[2] | (state==abort)&~ssDisp5[2]);
    assign ssDisp[1] = ~((state==idle)&~ssDisp0[1] | (state==mode1_run)&~ssDisp1[1] | (state==mode1_print)&~ssDisp2[1] | (state==mode2_run)&~ssDisp3[1] | (state==mode2_print)&~ssDisp4[1] | (state==abort)&~ssDisp5[1]);
    assign ssDisp[0] = ~((state==idle)&~ssDisp0[0] | (state==mode1_run)&~ssDisp1[0] | (state==mode1_print)&~ssDisp2[0] | (state==mode2_run)&~ssDisp3[0] | (state==mode2_print)&~ssDisp4[0] | (state==abort)&~ssDisp5[0]);
    assign ssDP = 1;
   
    // Module
    idle state0(
        .clk(clk&(state == idle)),
        .sel(ssSel0),
        .disp(ssDisp0)      
        );
    
    mode1_run state1(
        .in(bcd),
        .num1(num1),
        .num2(num2),
        .num3(num3),
        .num4(num4),
        .num5(num5),
        .num6(num6),
        .sw_clk(fsm_clk&(state == mode1_run)),
        .clk(clk&(state == mode1_run)),
        .state(state),
        .count(count),
        .in_num(cnt_mode1),
        .sel(ssSel1),
        .disp(ssDisp1)
    );
    
    model1_print state2(
        .cnt(count),
        .clk(clk&(state == mode1_print)),
        .sel(ssSel2),
        .disp(ssDisp2)
    );
    
    mode2_run state3(
        .sw_clk(fsm_clk&(state == mode2_run)),
        .clk(clk&(state == mode2_run)),
        .bcd(bcd),
        .state(state),
        .in_num(cnt_mode2),
        .num1(num1),
        .num2(num2),
        .num3(num3),
        .num4(num4),
        .num5(num5),
        .num6(num6),
        .sel(ssSel3),
        .disp(ssDisp3)
    );
    
    mode2_print state4(
        .clk(clk&(state == mode2_print)),
        .num1(num1),
        .num2(num2),
        .num3(num3),
        .num4(num4),
        .num5(num5),
        .num6(num6),
        .sel(ssSel4),
        .disp(ssDisp4)
    );
    
    abort state5(
        .clk(clk&(state == abort)),
        .sel(ssSel5),
        .disp(ssDisp5)
    );
    
    // Initialization
    initial begin
        state <= idle;
    end
    
    // FSM
    always @(posedge clk) begin
        case (state)
            idle: begin
                if (btnLeft)
                    state <= mode1_run;
                else if (btnRight)
                    state <= mode2_run;
            end
            mode1_run: begin
                if (btnBottom | (btnTop & cnt_mode1 < 12) | cnt_mode1 > 12)
                    state <= abort;
                else if(btnTop)
                    state <= mode1_print;
            end
            mode1_print: begin
                if (btnCenter)
                    state <= idle;
            end
            mode2_run: begin
                if (btnBottom | (btnTop & cnt_mode2 != 12) | cnt_mode2 > 12)
                    state <= abort;
                else if(btnTop)
                    state <= mode2_print;
            end
            mode2_print: begin
                if (btnCenter)
                    state <= idle;
            end
            abort: begin
                if (btnCenter)
                    state <= idle;
            end
        endcase
    end
    
    
    // Input to BCD
    always @(*) begin
        case (sw)
            10'b0000000001: bcd <= 4'b0000; //0
            10'b0000000010: bcd <= 4'b0001; //1
            10'b0000000100: bcd <= 4'b0010; //2
            10'b0000001000: bcd <= 4'b0011; //3
            10'b0000010000: bcd <= 4'b0100; //4
            10'b0000100000: bcd <= 4'b0101; //5
            10'b0001000000: bcd <= 4'b0110; //6
            10'b0010000000: bcd <= 4'b0111; //7
            10'b0100000000: bcd <= 4'b1000; //8
            10'b1000000000: bcd <= 4'b1001; //9
        endcase
    end
    
endmodule
