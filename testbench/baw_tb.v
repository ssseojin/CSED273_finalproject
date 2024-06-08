`timescale 1ns / 1ps

module blackandwhite_tb;

    reg [8:0] p_card;
    wire [2:0] p_black;
    wire [2:0] p_white;

 
    blackandwhite uut (
        .p_card(p_card),
        .p_black(p_black),
        .p_white(p_white)
    );

    initial begin
        
        $monitor("time=%0d, p_card=%d, p_black=%0d, p_white=%0d", $time, p_card, p_black, p_white);
    //짝 홀
//홀 0개
    //0개 0개
        p_card = 9'b000000000; #10; 
    //1개 0개
        p_card = 9'b000000010; #10; 
        p_card = 9'b000001000; #10; 
        p_card = 9'b000100000; #10; 
        p_card = 9'b010000000; #10; 
    //2개 0개 
        p_card = 9'b000001010; #10; 
        p_card = 9'b000100010; #10; 
        p_card = 9'b010000010; #10; 
        p_card = 9'b000101000; #10; 
        p_card = 9'b010001000; #10; 
        p_card = 9'b010100000; #10;  
    //3개 0개
        p_card = 9'b000101010
        p_card = 9'b010001010
        p_card = 9'b010100010
        p_card = 9'b010101000
    //4개 0개
        p_card = 9'b010101010


//홀 1개
    //0개 1개
        p_card = 9'b000000001; #10;
        p_card = 9'b000000100; #10;
        p_card = 9'b000010000; #10;
        p_card = 9'b001000000; #10;
        p_card = 9'b100000000; #10;
    //1개 1개 
        p_card = 9'b000000011; #10;
        p_card = 9'b000000101; #10;
        p_card = 9'b000010001; #10;
        p_card = 9'b001000001; #10;
        p_card = 9'b100000001; #10;
        p_card = 9'b000000110; #10;
        p_card = 9'b000001010; #10;
        p_card = 9'b000010010; #10;
        p_card = 9'b000100010; #10;
        p_card = 9'b001000010; #10;
        p_card = 9'b010000010; #10;
        p_card = 9'b000010100; #10;
        p_card = 9'b000100100; #10;
        p_card = 9'b001000100; #10;
        p_card = 9'b010000100; #10;
        p_card = 9'b100000100; #10;
        p_card = 9'b000101000; #10;
        p_card = 9'b001001000; #10;
        p_card = 9'b010001000; #10;
        p_card = 9'b100001000; #10;
    //2개 1개 
        p_card = 9'b000000111; #10;
        p_card = 9'b000001011; #10;
        p_card = 9'b000010011; #10;
        p_card = 9'b000100011; #10;
        p_card = 9'b001000011; #10;
        p_card = 9'b100000011; #10;
        p_card = 9'b000000111; #10;
        p_card = 9'b000000110; #10;
        p_card = 9'b000010011; #10;
        p_card = 9'b000010101; #10;
        p_card = 9'b000011001; #10;
        p_card = 9'b000101001; #10;
        p_card = 9'b001001001; #10;
        p_card = 9'b010001001; #10;
        p_card = 9'b100001001; #10;
        p_card = 9'b000010110; #10;
        p_card = 9'b000011010; #10;
        p_card = 9'b000011100; #10;
        p_card = 9'b000101010; #10;
        p_card = 9'b000110010; #10;
        p_card = 9'b000111000; #10;
        p_card = 9'b001010010; #10;
        p_card = 9'b001100010; #10;
        p_card = 9'b001110000; #10;
        p_card = 9'b010010010; #10;
        p_card = 9'b010100010; #10;
        p_card = 9'b010110000; #10;
        p_card = 9'b100010010; #10;
        p_card = 9'b100100010; #10;
        p_card = 9'b100110000; #10;
    //3개 1개
        p_card = 9'b000001111; #10;
        p_card = 9'b000010111; #10;
        p_card = 9'b000011011; #10;
        p_card = 9'b000100111; #10;
        p_card = 9'b001000111; #10;
        p_card = 9'b100000111; #10;
        p_card = 9'b000001011; #10;
        p_card = 9'b000001101; #10;
        p_card = 9'b000010101; #10;
        p_card = 9'b000011101; #10;
        p_card = 9'b000100101; #10;
        p_card = 9'b000101101; #10;
        p_card = 9'b001001101; #10;
        p_card = 9'b010001101; #10;
        p_card = 9'b100001101; #10;
        p_card = 9'b001101001; #10;
        p_card = 9'b001110001; #10;
        p_card = 9'b001111000; #10;
        p_card = 9'b010101001; #10;
        p_card = 9'b010111000; #10;
        p_card = 9'b100101001; #10;
        p_card = 9'b100111000; #10;
        p_card = 9'b101000111; #10;
        p_card = 9'b110000111; #10;
        p_card = 9'b111000011; #10;
        p_card = 9'b111000101; #10;
        p_card = 9'b111001001; #10;
        p_card = 9'b111010001; #10;
        p_card = 9'b111100001; #10;
        p_card = 9'b111110000; #10;
    //4개 1개
        p_card = 9'b001011111; #10;
        p_card = 9'b010011111; #10;
        p_card = 9'b100011111; #10;
        p_card = 9'b010101111; #10;
        p_card = 9'b100101111; #10;
        p_card = 9'b110000111; #10;
        p_card = 9'b111010111; #10;
        p_card = 9'b111001011; #10;
        p_card = 9'b111100111; #10;
        p_card = 9'b111101011; #10;

//홀 2개
    //0개 2개
        p_card = 0'b000000101; #10;
        p_card = 0'b000001001; #10;
        p_card = 0'b000001010; #10;
        p_card = 0'b000010001; #10;
        p_card = 0'b000010010; #10;
        p_card = 0'b000100001; #10;
        p_card = 0'b000100010; #10;
        p_card = 0'b001000001; #10;
        p_card = 0'b001000010; #10;
        p_card = 0'b010000001; #10;
        p_card = 0'b010000010; #10;
        p_card = 0'b100000001; #10;
        p_card = 0'b100000010; #10;

    //1개 2개
        p_card = 0'b000001011; #10;
        p_card = 0'b000001101; #10;
        p_card = 0'b000001110; #10;
        p_card = 0'b000010011; #10;
        p_card = 0'b000010101; #10;
        p_card = 0'b000010110; #10;
        p_card = 0'b000011001; #10;
        p_card = 0'b000011010; #10;
        p_card = 0'b000011100; #10;
        p_card = 0'b000100011; #10;
        p_card = 0'b000100101; #10;
        p_card = 0'b000100110; #10;
        p_card = 0'b000101001; #10;
        p_card = 0'b000101010; #10;
        p_card = 0'b000101100; #10;
        p_card = 0'b000110001; #10;
        p_card = 0'b000110010; #10;
        p_card = 0'b000110100; #10;
        p_card = 0'b000111000; #10;
        p_card = 0'b001000011; #10;
        p_card = 0'b001000101; #10;
        p_card = 0'b001000110; #10;
        p_card = 0'b001001001; #10;
        p_card = 0'b001001010; #10;
        p_card = 0'b001001100; #10;
        p_card = 0'b001010001; #10;
        p_card = 0'b001010010; #10;
        p_card = 0'b001010100; #10;
        p_card = 0'b001011000; #10;
        p_card = 0'b001100001; #10;
    //2개 2개
        p_card = 0'b000001111; #10;
        p_card = 0'b000010111; #10;
        p_card = 0'b000011011; #10;
        p_card = 0'b000011101; #10;
        p_card = 0'b000011110; #10;
        p_card = 0'b000100111; #10;
        p_card = 0'b000101011; #10;
        p_card = 0'b000101101; #10;
        p_card = 0'b000101110; #10;
        p_card = 0'b000110011; #10;
        p_card = 0'b000110101; #10;
        p_card = 0'b000110110; #10;
        p_card = 0'b000111001; #10;
        p_card = 0'b000111010; #10;
        p_card = 0'b000111100; #10;
        p_card = 0'b001000111; #10;
        p_card = 0'b001001011; #10;
        p_card = 0'b001001101; #10;
        p_card = 0'b001001110; #10;
        p_card = 0'b001010011; #10;
        p_card = 0'b001010101; #10;
        p_card = 0'b001010110; #10;
        p_card = 0'b001011001; #10;
        p_card = 0'b001011010; #10;
        p_card = 0'b001011100; #10;
        p_card = 0'b001100011; #10;
        p_card = 0'b001100101; #10;
        p_card = 0'b001100110; #10;
        p_card = 0'b001101001; #10;
        p_card = 0'b001101010; #10;
        p_card = 0'b001101100; #10;
        p_card = 0'b001110001; #10;
        p_card = 0'b001110010; #10;
        p_card = 0'b001110100; #10;
        p_card = 0'b001111000; #10;
        p_card = 0'b010000111; #10;
        p_card = 0'b010001011; #10;
        p_card = 0'b010001101; #10;
        p_card = 0'b010001110; #10;
        p_card = 0'b010010011; #10;
        p_card = 0'b010010101; #10;
        p_card = 0'b010010110; #10;
        p_card = 0'b010011001; #10;
        p_card = 0'b010011010; #10;
        p_card = 0'b010011100; #10;
        p_card = 0'b010100011; #10;
        p_card = 0'b010100101; #10;
        p_card = 0'b010100110; #10;
        p_card = 0'b010101001; #10;
        p_card = 0'b010101010; #10;
        p_card = 0'b010101100; #10;
        p_card = 0'b010110001; #10;
        p_card = 0'b010110010; #10;
        p_card = 0'b010110100; #10;
        p_card = 0'b010111000; #10;
        p_card = 0'b011000011; #10;
        p_card = 0'b011000101; #10;
        p_card = 0'b011000110; #10;
        p_card = 0'b011001001; #10;
        p_card = 0'b011001010; #10;
        p_card = 0'b011001100; #10;
        p_card = 0'b011010001; #10;
        p_card = 0'b011010010; #10;
        p_card = 0'b011010100; #10;
        p_card = 0'b011011000; #10;
    //3개 2개
        p_card = 0'b000011111; #10;
        p_card = 0'b000101111; #10;
        p_card = 0'b000110111; #10;
        p_card = 0'b000111011; #10;
        p_card = 0'b000111101; #10;
        p_card = 0'b000111110; #10;
        p_card = 0'b001001111; #10;
        p_card = 0'b001010111; #10;
        p_card = 0'b001011011; #10;
        p_card = 0'b001011101; #10;
        p_card = 0'b001011110; #10;
        p_card = 0'b001100111; #10;
        p_card = 0'b001101011; #10;
        p_card = 0'b001101101; #10;
        p_card = 0'b001101110; #10;
        p_card = 0'b001110011; #10;
        p_card = 0'b001110101; #10;
        p_card = 0'b001110110; #10;
        p_card = 0'b001111001; #10;
        p_card = 0'b001111010; #10;
        p_card = 0'b001111100; #10;
        p_card = 0'b010000111; #10;
        p_card = 0'b010001011; #10;
        p_card = 0'b010001101; #10;
        p_card = 0'b010001110; #10;
        p_card = 0'b010010011; #10;
        p_card = 0'b010010101; #10;
        p_card = 0'b010010110; #10;
        p_card = 0'b010011001; #10;
        p_card = 0'b010011010; #10;
        p_card = 0'b010011100; #10;
        p_card = 0'b010100011; #10;
        p_card = 0'b010100101; #10;
        p_card = 0'b010100110; #10;
        p_card = 0'b010101001; #10;
        p_card = 0'b010101010; #10;
        p_card = 0'b010101100; #10;
        p_card = 0'b010110001; #10;
        p_card = 0'b010110010; #10;
        p_card = 0'b010110100; #10;
        p_card = 0'b010111000; #10;
    //4개 2개
        p_card = 0'b001011111; #10;
        p_card = 0'b010011111; #10;
        p_card = 0'b100011111; #10;
        p_card = 0'b010101111; #10;
        p_card = 0'b100101111; #10;
        p_card = 0'b110000111; #10;
        p_card = 0'b111010111; #10;
        p_card = 0'b111001011; #10;
        p_card = 0'b111100111; #10;
        p_card = 0'b111101011; #10;







        // ?��뮬레?��?�� 종료
        //
    end

endmodule

module count_tb;

    reg [4:0] in;
    wire [2:0] count;

    // ?��?��?��?��?��
    count uut (
        .in(in),
        .count(count)
    );

    initial begin
        // ?��?��?�� �??��?��: ?��?�� 값을 �?경하�? 결과�? 모니?���?
        $monitor("time=%0d, in=%b, count=%b", $time, in, count);

        // �? ?��?��?�� 벡터?�� ???�� 모듈 ?���?
        in = 5'b00000; #10;  // 0�? (count=000)
        in = 5'b11111; #10;  // 5�? (count=101)
        in = 5'b10101; #10;  // 3�? (count=011)

        // ?��뮬레?��?�� 종료
        $finish;
    end

endmodule
