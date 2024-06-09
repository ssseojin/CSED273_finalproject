// compare : ?��?��?��?���? ?�� 카드 ?��?��?�� ?��?�� 결정?��?�� 모듈

module compare(
    input [3:0] p1_handcard,
    input [3:0] p2_handcard,
    output [1:0] matchresult


);
    // 4-bit magnitude comparator�? 구현
    // matchresult 진리�?
    // 00
    // 01 draw
    // 10 p1?��
    // 11 p2?��
magnitude_comparator compare(p1_handcard, p2_handcard, matchresult);


    

endmodule

module onebit_cmp(
    input in_a, in_b,
    output [1:0]result

    );
     wire andab1, andab2;
    and(andab1, ~in_a,in_b);
    and(andab2, in_a,~in_b);
    or(result[1], andab1, andab2);

    or(result[0], ~in_a, in_b);


endmodule



/////?��?��
module magnitude_comparator(// 1비트?�� 비교?�� 결과 �??��???�� 최종 결과 ?���?. 01, 10,11�? ?��?��, 무승�? ?���? 
    input [3:0] input1,
    input [3:0] input2,
    output [1:0] matchresult); // 뭘까,

    wire [1:0] res_0, res_1,res_2,res_3;
    //1비트?�� 비교
    onebit_cmp cmp3(input1[3],input2[3],res_3);//?�� ?��?��리수
    onebit_cmp cmp2(input1[2],input2[2],res_2);
    onebit_cmp cmp1(input1[1],input2[1],res_1);
    onebit_cmp cmp0(input1[0],input2[0],res_0);//?�� ?��?? ?��리수


    //각자리수 비교
   assign matchresult[1] = res_3[1] | (~res_3[1] & res_3[0] & (res_2[1] | (~res_2[1] & res_2[0] & (res_1[1] | (~res_3[1] & res_1[0] & res_0[1])))));

assign matchresult[0]=(res_3[1]&res_3[0])|(~res_3[1]&res_3[0]&res_2[0]&(res_2[1]| (~res_2[1]&res_1[0]&(res_1[1]|(~res_1[1]&res_0[0])))));


endmodule