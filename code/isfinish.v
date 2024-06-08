//  ?��?��?�� ?��?���? ?��?�� ?��?��?��?���? ?��?��

module isfinish(
    input [3:0] round,
    input [3:0] win, // p1 ?��
    input [3:0] lose, // p1 ?��
    output fin, [1:0]printwinner
);   
    //  ?��?? ?��?��?���? ?��?��?�� ?��?��?�� ?��?�� ?��
    // <=>
    wire [1:0]winner;
    wire [3:0] eight;
    assign eight[3]=1;
    assign eight[2]=0;
    assign eight[1]=0;
    assign eight[0]=0;
    // win > lose + (8 - round)�? p1?�� ?��?��
    
    wire [3:0]l8r, _8r, w8r, wr;
    wire carry1, carry2;
    wire [1:0]checkwin, checklose;
    
    subtractor leftround (eight, round, _8r);
    adder iswin(lose, _8r, 0, l8r, carry2);
    
    magnitude_comparator compare1( win,l8r,checkwin);//->?���?�? �뜑 �겙吏� 寃곌?���뿉 �뵲�씪 fin 議곗?��

    // lose > win + (8 - round)硫� p2�듅 �솗�젙
    adder islose( win,_8r,0, w8r, carry2 );
    magnitude_comparator compare2(lose, w8r,checklose);//->뭐�? ?�� ?���? 결과?�� ?��?�� fin 조정
    // ?��?���?
    assign fin=(checkwin[1]&~checkwin[0])|(checklose[1]&~checklose[0])|(round[3]&~round[2]&~round[1]&~round[0]);
    //?��?��출력
    
    //assign fin = round[3] & ~round[2] & ~round[1] & ~round[0];
    magnitude_comparator compare3(win,lose, winner);//win?�� ?���? 10?���? 1?���?//lose�? ?���? 11�? 2?���?//무승�?�? 01
    assign printwinner[1]=winner[1];
    assign printwinner[0]=winner[0];
    // arithmetic operator ?���? ?��?��?���? Lab5?�� 4-bit adder 모듈 + magnitude comparator 모듈 ?���?

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



//module subtractor(
//    input [3:0] a,
//    input [3:0] b,
//    output [3:0] out
//);

//    wire borrow;
    
//    assign borrow = ~(a[0] ^ b[0]);
//    assign out[0] = a[0] ^ b[0];
    
//    assign out[1] = (a[1] & ~b[1] & ~borrow) | (~a[1] & b[1] & borrow);
//    assign out[2] = (a[2] & ~b[2] & ~borrow & ~a[1]) | (~a[2] & b[2] & (borrow | a[1])) | (a[2] & b[2] & borrow & ~a[1]);
//    assign out[3] = (a[3] & ~b[3] & ~borrow & ~a[2]) | (~a[3] & b[3] & (borrow | a[2])) | (a[3] & b[3] & borrow & ~a[2]);

//endmodule


module subtractor(
    input [3:0] a,
    input [3:0] b,
    output [3:0] out
     
);
//    wire in_c;
//    assign in_c=0;
    wire out_c;
    wire [2:0] mid_c;

    // Full adder �ν��Ͻ� ����
    full_adder fa0 (a[0], ~b[0], 1, out[0], mid_c[0]);
    full_adder fa1 (a[1], ~b[1], mid_c[0], out[1], mid_c[1]);
    full_adder fa2 (a[2], ~b[2], mid_c[1], out[2], mid_c[2]);
    full_adder fa3 (a[3], ~b[3], mid_c[2], out[3], out_c);

endmodule

