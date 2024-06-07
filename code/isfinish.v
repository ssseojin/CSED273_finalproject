//  ?¼?š´?“œ ??‚˜ê³? ?Š¹?Œ¨ ?™•? •?‚¬?Š”ì§? ?™•?¸

module isfinish(
    input [3:0] round,
    input [3:0] win, // p1 ?Š¹
    input [3:0] lose, // p1 ?Œ¨
    output fin, [1:0]printwinner
);   
    //  ?‚¨?? ?¼?š´?“œê°? ?Š¹?Œ¨?— ?˜?–¥?´ ?—†?„ ?•Œ
    // <=>
    wire [1:0]winner;
    wire [3:0] nine;
    assign nine[3]=1;
    assign nine[2]=0;
    assign nine[1]=0;
    assign nine[0]=1;
    // win > lose + (9 - round)ë©? p1?Š¹ ?™•? •
    
    wire [3:0]l9r, _9r, w9r, wr;
    wire carry1, carry2;
    wire [1:0]checkwin, checklose;
    
    subtractor leftround (nine, round, _9r);
    adder iswin(lose, _9r, 0, l9r, carry2);
    
    magnitude_comparator compare1( win,l9r,checkwin);//->?¸ë¨?ï¿? ï¿½ëœ‘ ï¿½ê²™ï§ï¿½ å¯ƒê³Œ?‚µï¿½ë¿‰ ï¿½ëµ²ï¿½ì”ª fin è­°ê³—? ™

    // lose > win + (9 - round)ï§ï¿½ p2ï¿½ë“… ï¿½ì†—ï¿½ì ™
    adder islose( win,_9r,0, w9r, carry2 );
    magnitude_comparator compare2(lose, w9r,checklose);//->ë­ê? ?” ?°ì§? ê²°ê³¼?— ?”°?¼ fin ì¡°ì •
    // ??¸ê°?
    assign fin=(checkwin[1]&~checkwin[0])|(checklose[1]&~checklose[0])|(round[3]&~round[2]&~round[1]&round[0]);
    //?Š¹?ì¶œë ¥
    magnitude_comparator compare3(win,lose, winner);//win?´ ?¬ë©? 10?œ¼ë¡? 1?Š¹ë¦?//loseê°? ?¬ë©? 11ë¡? 2?Š¹ë¦?//ë¬´ìŠ¹ë¶?ë©? 01
    assign printwinner[1]=fin&winner[1];
    assign printwinner[0]=fin&winner[0];
    // arithmetic operator ?“°ë©? ?•ˆ?˜?‹ˆê¹? Lab5?— 4-bit adder ëª¨ë“ˆ + magnitude comparator ëª¨ë“ˆ ?“°ê¸?

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



module subtractor(
    input [3:0] a,
    input [3:0] b,
    output [3:0] out
);

    wire borrow;
    
    assign borrow = ~(a[0] ^ b[0]);
    assign out[0] = a[0] ^ b[0];
    
    assign out[1] = (a[1] & ~b[1] & ~borrow) | (~a[1] & b[1] & borrow);
    assign out[2] = (a[2] & ~b[2] & ~borrow & ~a[1]) | (~a[2] & b[2] & (borrow | a[1])) | (a[2] & b[2] & borrow & ~a[1]);
    assign out[3] = (a[3] & ~b[3] & ~borrow & ~a[2]) | (~a[3] & b[3] & (borrow | a[2])) | (a[3] & b[3] & borrow & ~a[2]);

endmodule



