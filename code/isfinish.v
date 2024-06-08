//  ???� ?�?�窸? ?? ?�?�??�鴔? ?�?

module isfinish(
    input [3:0] round,
    input [3:0] win, // p1 ?
    input [3:0] lose, // p1 ?
    output fin, [1:0]printwinner
);   
    //  ??? ???�穈? ???� ?�?? ?�?� ?�
    // <=>
    wire [1:0]winner;
    wire [3:0] nine;
    assign nine[3]=1;
    assign nine[2]=0;
    assign nine[1]=0;
    assign nine[0]=1;
    // win > lose + (9 - round)諰? p1? ?�?�
    /*
    wire [3:0]l9r, _9r, w9r, wr;
    wire carry1, carry2;
    wire [1:0]checkwin, checklose;
    
    subtractor leftround (nine, round, _9r);
    adder iswin(lose, _9r, 0, l9r, carry2);
    
    magnitude_comparator compare1( win,l9r,checkwin);//->?諟?嚙? 嚙趟� 嚙赭�鴽蕭 撖�?嚙趟� 嚙趟結嚙趣 fin 霅國�?�

    // lose > win + (9 - round)鴽蕭 p2嚙趟� 嚙趣�嚙趣�
    adder islose( win,_9r,0, w9r, carry2 );
    magnitude_comparator compare2(lose, w9r,checklose);//->諨? ?� ?鴔? 窶國頃?� ?? fin 魽域�
    // ?�?穈?
    assign fin=(checkwin[1]&~checkwin[0])|(checklose[1]&~checklose[0])|(round[3]&~round[2]&~round[1]&round[0]);
    //??�黺
    */
    assign fin = round[3] & ~round[2] & ~round[1] & ~round[0];
    magnitude_comparator compare3(win,lose, winner);//win? ?諰? 10?諢? 1?謔?//lose穈? ?諰? 11諢? 2?謔?//諡渥賱?諰? 01
    assign printwinner[1]=winner[1];
    assign printwinner[0]=winner[0];
    // arithmetic operator ?諰? ?�?�?�篧? Lab5?� 4-bit adder 諈刺� + magnitude comparator 諈刺� ?篣?

endmodule

module adder(
    input [3:0] x,
    input [3:0] y,
    input c_in,             // Carry in
    output [3:0] out,
    output c_out            // Carry out
); 

    ////////////////////////
    wire c[3:0];

    assign c[0] = c_in;
    
    assign out[0] =  x[0] ^ y[0] ^ c[0];
    assign c[1] = (x[0] & y[0]) | (c[0] & (x[0] ^ y[0]));
    
     assign out[1] = x[1] ^ y[1] ^ c[1];
    assign c[2] = (x[1] & y[1]) | (c[1] & (x[1] ^ y[1]));

    assign out[2] = x[2] ^ y[2] ^ c[2];
    assign c[3] = (x[2] & y[2]) | (c[2] & (x[2] ^ y[2]));
    
    assign out[3] = x[3] ^ y[3] ^ c[3];
    assign c_out = (x[3] & y[3]) | (c[3] & (x[3] ^ y[3]));
    
    ////////////////////////

endmodule



// module subtractor(
//     input [3:0] a,
//     input [3:0] b,
//     output [3:0] out
// );

//     wire borrow;
    
//     assign borrow = ~(a[0] ^ b[0]);
//     assign out[0] = a[0] ^ b[0];
    
//     assign out[1] = (a[1] & ~b[1] & ~borrow) | (~a[1] & b[1] & borrow);
//     assign out[2] = (a[2] & ~b[2] & ~borrow & ~a[1]) | (~a[2] & b[2] & (borrow | a[1])) | (a[2] & b[2] & borrow & ~a[1]);
//     assign out[3] = (a[3] & ~b[3] & ~borrow & ~a[2]) | (~a[3] & b[3] & (borrow | a[2])) | (a[3] & b[3] & borrow & ~a[2]);

// endmodule

module subtractor(
    input [3:0] in_a,
    input [3:0] in_b,
    output [3:0] out_s
     
);
    input in_c;
    assign in_c=0;
    wire out_c;
    wire [2:0] mid_c;

    // Full adder 인스턴스 생성
    fullAdder fa0 (in_a[0], ~in_b[0], in_c, out_s[0], mid_c[0]);
    fullAdder fa1 (in_a[1], ~in_b[1], mid_c[0], out_s[1], mid_c[1]);
    fullAdder fa2 (in_a[2], ~in_b[2], mid_c[1], out_s[2], mid_c[2]);
    fullAdder fa3 (in_a[3], ~in_b[3], mid_c[2], out_s[3], out_c);

endmodule


