
module compare(
    input [3:0] p1_handcard,
    input [3:0] p2_handcard,
    output [1:0] matchresult
);
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

module magnitude_comparator(
    input [3:0] input1,
    input [3:0] input2,
    output [1:0] matchresult);

    wire [1:0] res_0, res_1,res_2,res_3;
    onebit_cmp cmp3(input1[3],input2[3],res_3);
    onebit_cmp cmp2(input1[2],input2[2],res_2);
    onebit_cmp cmp1(input1[1],input2[1],res_1);
    onebit_cmp cmp0(input1[0],input2[0],res_0);
   assign matchresult[1] = res_3[1] | (~res_3[1] & res_3[0] & (res_2[1] | (~res_2[1] & res_2[0] & (res_1[1] | (~res_3[1] & res_1[0] & res_0[1])))));

assign matchresult[0]=(res_3[1]&res_3[0])|(~res_3[1]&res_3[0]&res_2[0]&(res_2[1]| (~res_2[1]&res_1[0]&(res_1[1]|(~res_1[1]&res_0[0])))));


endmodule