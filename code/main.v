`timescale 1ns / 1ps

//06090923

module baw_main(
    input clk,
    input btnCenter,
    btnTop,
    btnBottom,
    btnLeft,
    btnRight,
    input [15:0] sw,
    output [0:3] ssSel,
    output [7:0] ssDisp,
    output reg[15:0] led
);

    //parameter
    parameter init = 3'b000;
    parameter rasp = 3'b001; // Round and Score Print
    parameter bawp = 3'b010; // Black and White Print
    parameter p1_turn = 3'b011;
    parameter p2_turn = 3'b100;
    parameter matchresult_print = 3'b101;
    parameter gameresult_print = 3'b110;
    parameter temp = 3'b111;
    
    //variable
    reg [2:0] state;
    reg [8:0] cardselect;

    wire resetn;
    assign resetn = (~state[2] & ~state[1] & ~state[0]);

    reg [8:0] p1_card, p2_card;
    reg [3:0] p1_handcard, p2_handcard;

    wire [3:0] round, win, lose;
    wire finish;
    wire [1:0] matchresult, gameresult;
    wire [3:0] p1_black, p1_white, p2_black, p2_white;


    //combinational logic
    blackandwhite p1_card_conversion(p1_card, p1_black, p1_white);
    blackandwhite p2_card_conversion(p2_card, p2_black, p2_white);
    compare comparator(p1_handcard, p2_handcard, matchresult);
    isfinish finish1(round, win, lose, finish, gameresult);

    //sequential logic
    wire scoreupdate_pulse;
    wire handout_p1_pulse;
    wire handout_p2_pulse;

    assign scoreupdate_pulse = (state[2] & ~state[1] & state[0]) | resetn; // 101
    assign handout_p1_pulse = ~(~state[2] & state[1] & state[0]); // 011
    assign handout_p2_pulse = ~(state[2] & ~state[1] & ~state[0]);// 100
    
    scoreupdate score(matchresult, scoreupdate_pulse, resetn, round, win, lose);


    // handout p1(cardselect, handout_p1_pulse, resetn, p1_handcard, p1_card);
    // handout p2(cardselect, handout_p2_pulse, resetn, p2_handcard, p2_card);

    wire [3:0] handcard_input;
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

    encoder ec(i, handcard_input);
    // handcard handcard1(handcard_input, handout_p1_pulse, resetn, p1_handcard);
    // card card1(cardselect, handout_p1_pulse, reset_n, p1_card);
    // handcard handcard2(handcard_input, handout_p2_pulse, resetn, p2_handcard);
    // card card2(cardselect, handout_p2_pulse, reset_n, p2_card);
    
    //?占쏙옙移대 ?占쏙옙諛깆э??? + (移대 ?占쏙옙?占쏙옙占??? ?占쏙옙占????)
    wire p1_handcard_isblack;
    wire p2_handcard_isblack;

    assign p1_handcard_isblack = p1_handcard[0];
    assign p2_handcard_isblack = p2_handcard[0];

    wire [8:0] p1_card_;
    assign p1_card_[0] = p1_card[0] & ~cardselect[0];
    assign p1_card_[1] = p1_card[1] & ~cardselect[1];
    assign p1_card_[2] = p1_card[2] & ~cardselect[2];
    assign p1_card_[3] = p1_card[3] & ~cardselect[3];
    assign p1_card_[4] = p1_card[4] & ~cardselect[4];
    assign p1_card_[5] = p1_card[5] & ~cardselect[5];
    assign p1_card_[6] = p1_card[6] & ~cardselect[6];
    assign p1_card_[7] = p1_card[7] & ~cardselect[7];
    assign p1_card_[8] = p1_card[8] & ~cardselect[8];
    wire [8:0] p2_card_;
    assign p2_card_[0] = p2_card[0] & ~cardselect[0];
    assign p2_card_[1] = p2_card[1] & ~cardselect[1];
    assign p2_card_[2] = p2_card[2] & ~cardselect[2];
    assign p2_card_[3] = p2_card[3] & ~cardselect[3];
    assign p2_card_[4] = p2_card[4] & ~cardselect[4];
    assign p2_card_[5] = p2_card[5] & ~cardselect[5];
    assign p2_card_[6] = p2_card[6] & ~cardselect[6];
    assign p2_card_[7] = p2_card[7] & ~cardselect[7];
    assign p2_card_[8] = p2_card[8] & ~cardselect[8];
    
    // switch handcard input
    always @(posedge clk) begin
        case (state)
            p1_turn: begin 
                cardselect <= sw[8:0]; // cardselect
                
            end
            p2_turn: begin
                cardselect <= sw[8:0]; 
            end
            // matchresult: begin
            //     p1_handcard <= 9'b0;
            //     p2_handcard <= 9'b0;
            // end
            default : cardselect <= 9'b0; // ?占쏙옙?占쏙옙?占쏙옙?
        endcase
    end


    //output sevenseg
    //init state -> init 異�
    //rasp state -> round win lose 異�
    //bawp state -> p1black p1white p2black p2white 異�
    //p1_turn state -> player 異�
    //p2_turn state
    //matchresult state -> matchresult 異�
    //gameresult state -> gameresult 異�

    wire [15:0] graphics;
    whattoprint wp(state, round, win, lose, p1_black, p1_white, p2_black, p2_white, gameresult, matchresult, graphics);
    led_renderer renderer(graphics, clk, ssSel, ssDisp);

    //output led
    always @(posedge clk) begin
        case(state)
            bawp: begin
                led[12] = ~p1_handcard_isblack;
                led[13] = p1_handcard_isblack; // ?占쏙옙諛깆э??? 異�
                led[14] = ~p2_handcard_isblack;
                led[15] = p2_handcard_isblack;
                led[11:0] = 12'b0;
                //led?占쏙옙 ?占쏙옙?占쏙옙占??? ?占쏙옙占??? ?占쏙옙?占쏙옙
            end
            p1_turn: begin
                led[8:0] = p1_card_[8:0]; // p1_card 異�
            end
            p2_turn: begin
                led[8:0] = p2_card_[8:0]; // p2_card 異�
            end
            default: begin
                led[15:14] = matchresult; 
                led[13:12] = gameresult;
                led[11] = finish;
                led[10] = scoreupdate_pulse;
                led[9] = resetn;
                led[3:0] = p1_handcard;
                led[7:4] = p2_handcard;
            end
        endcase
    end

    //initialize register
    initial begin
        state <= init;
    end


    //FSM
    always @(posedge clk) begin // * btnbottom 援ы
        case(state)
            init: begin // init state
                if(btnCenter) begin
                    state <= rasp;
                    p1_card <= 9'b111111111;
                    p2_card <= 9'b111111111;
                end
            end
            rasp: begin // Round and Score print state
                if(btnTop) begin
                    state <= bawp;
                    p1_handcard <= 4'b0000;
                    p2_handcard <= 4'b0000;
                end
                else if(btnBottom)
                    state <= init;
            end
            bawp: begin // Black and White print state
                if(btnCenter)
                    state <= matchresult_print;
                else if(btnLeft)
                    state <= p1_turn;
                    
                else if(btnRight)
                    state <= p2_turn;
                else if(btnBottom)
                    state <= init;
            end
            
            p1_turn: begin // p1_turn
                if(btnTop) begin
                    state <= bawp;
                    p1_card <= p1_card_;
                    p1_handcard <= handcard_input;
                end
                else if(btnBottom)
                    state <= init;
            end
            p2_turn: begin // p2_turn
                if(btnTop) begin
                    state <= bawp;
                    p2_card <= p2_card_;
                    p2_handcard <= handcard_input;
                end
                else if(btnBottom)
                    state <= init;
            end
            matchresult_print: begin
                if(btnLeft) begin// 寃 ?占쏙옙?占쏙옙?占쏙옙?占쏙옙 寃곌낵異� state占??
//                    state <= temp;

                     if(finish == 1) begin
                        state <= gameresult_print;
                    end
                    else begin
                        state <= rasp;
                    end
                    
                end
                else if(btnBottom)
                    state <= init;
            end
            gameresult_print:begin // 寃 ?占쏙옙?占쏙옙 ?占쏙옙
                if(btnBottom)
                    state <= init;
            end
//            temp: begin 
//            if(finish == 1) begin
//                        state <= gameresult_print;
//            end
//                    else begin
//                        state <= rasp;
//                    end
//            end
        endcase
    end


endmodule
