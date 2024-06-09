

module blackandwhite(
    input [8:0] p_card, 
    output [2:0] p_black, 
    output [2:0] p_white 
);
    wire [4:0]white;
    count blackcount({p_card[0], p_card[2], p_card[4], p_card[6], p_card[8]}, p_black);

    assign white[4]=p_card[1];
    assign white[3]=p_card[3];
    assign white[2]=p_card[5];
    assign white[1]=p_card[7];
    assign white[0]=0;

    count whitecount(white, p_white);


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
    plus p(cnt_p1, cnt_p2, count);

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
