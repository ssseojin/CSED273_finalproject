`timescale 1ns / 1ps

//FSM always�? ?��?��..?
//segment출력
//input output constraint만들�?

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

    //variable
    reg [2:0] state;
    reg [8:0] cardselect;

    wire reset_n;
    assign reset_n = ~state[2] & ~state[1] & ~state[0];

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

    assign scoreupdate_pulse = state[2] & ~state[1] & state[0]; // 101
    assign handout_p1_pulse = ~state[2] & state[1] & state[0]; // 011
    assign handout_p2_pulse = state[2] & ~state[1] & ~state[0];// 100
    
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
    // handcard handcard1(handcard_input, handout_p1_pulse, reset_n, p1_handcard);
    // card card1(cardselect, handout_p1_pulse, reset_n, p1_card);
    // handcard handcard2(handcard_input, handout_p2_pulse, reset_n, p2_handcard);
    // card card2(cardselect, handout_p2_pulse, reset_n, p2_card);
    
    //?��카드 ?��백여�? + (카드 ?��?���? ?���??)
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
                p1_handcard <= handcard_input;
                
            end
            p2_turn: begin
                cardselect <= sw[8:0]; 
                p2_handcard <= handcard_input;
                
            end
            default : cardselect <= 9'b0; // ?��?��?��?
        endcase
    end


    //output sevenseg
    //init state -> init 출력
    //rasp state -> round win lose 출력
    //bawp state -> p1black p1white p2black p2white 출력
    //p1_turn state -> player 출력
    //p2_turn state
    //matchresult state -> matchresult 출력
    //gameresult state -> gameresult 출력

    wire [15:0] graphics;
    whattoprint wp(state, round, win, lose, p1_black, p1_white, p2_black, p2_white, gameresult, matchresult, graphics);
    led_renderer renderer(graphics, clk, ssSel, ssDisp);

    //output led
    always @(posedge clk) begin
        case(state)
            bawp: begin
                led[13] = p1_handcard_isblack; // ?��백여�? 출력
                led[15] = p2_handcard_isblack;
                //led?�� ?��?���? ?���? ?��?��
            end
            p1_turn: begin
                led[8:0] = p1_card[8:0]; // p1_card 출력
            end
            p2_turn: begin
                led[8:0] = p2_card[8:0]; // p2_card 출력
            end
            default: begin
                led[15:0] = 16'b0000000000000000;
            end
        endcase
    end

    //initialize register
    initial begin
        state <= init;
    end


    //FSM
    always @(posedge clk) begin // * btnbottom 구현
        case(state)
            init: begin // init state
                if(btnCenter)
                    state <= rasp;
            end
            rasp: begin // Round and Score print state
                if(btnTop)
                    state <= bawp;
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
                end
                else if(btnBottom)
                    state <= init;
            end
            p2_turn: begin // p2_turn
                if(btnTop) begin
                    state <= bawp;
                    p2_card <= p2_card_;
                end
                else if(btnBottom)
                    state <= init;
            end
            matchresult_print: begin
                if(btnTop & finish == 1) // 게임 끝났을때 결과출력 state로
                    state <= matchresult_print;
                else if(btnTop & finish == 0) // 게임 안끝났을때 Round and Score Print state로
                    state <= rasp;
                else if(btnBottom)
                    state <= init;
            end
            gameresult_print: // 게임 끝일 때
                if(btnBottom)
                    state <= init;
        endcase
    end


endmodule