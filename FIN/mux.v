



//module mux4x1(
//    input [3:0] data0,
//    input [3:0] data1,
//    input [3:0] data2,
//    input [3:0] data3,
//    input [1:0] sel,
//    output [3:0] out
//);

//    assign out[3]= ~sel[1]&~sel[0]&data0[3] | ~sel[1]&sel[0]&data1[3] | sel[1]&~sel[0]&data2[3] | sel[1]&sel[0]&data3[3];
//    assign out[2]= ~sel[1]&~sel[0]&data0[2] | ~sel[1]&sel[0]&data1[2] | sel[1]&~sel[0]&data2[2] | sel[1]&sel[0]&data3[2];
//    assign out[1]= ~sel[1]&~sel[0]&data0[1] | ~sel[1]&sel[0]&data1[1] | sel[1]&~sel[0]&data2[1] | sel[1]&sel[0]&data3[1];
//    assign out[0]= ~sel[1]&~sel[0]&data0[0] | ~sel[1]&sel[0]&data1[0] | sel[1]&~sel[0]&data2[0] | sel[1]&sel[0]&data3[0];

//endmodule


//module quadmux4x1_16(
//    input [15:0] data0,
//    input [15:0] data1,
//    input [15:0] data2,
//    input [15:0] data3,
//    input [1:0] sel,
//    output [15:0] out
//);
//    // mux4x1(1111,1011,0001,0010,sel,out[15:12])
//    // mux4x1(1111,1100,1110,1110,sel,out[11:8])
//    // mux4x1(1111,1101,0001,0001,sel,out[7:4])
//    // mux4x1(1111,1110,1010,1010,sel,out[3:0])
//    mux4x1(data0[15:12],data1[15:12],data2[15:12],data3[15:12],sel,out[15:12]);
//    mux4x1(data0[11:8],data1[11:8],data2[11:8],data3[11:8],sel,out[11:8]);
//    mux4x1(data0[7:4],data1[7:4],data2[7:4],data3[7:4],sel,out[7:4]);
//    mux4x1(data0[3:0],data1[3:0],data2[3:0],data3[3:0],sel,out[3:0]);

//endmodule


////module mux8x1(
////    input[15:0] data0,
////    input[15:0] data1,
////    input[15:0] data2,
////    input[15:0] data3,
////    input[15:0] data4,
////    input[15:0] data5,
////    input[15:0] data6,
////    input[15:0] data7,

////    input [2:0] sel,
////    output [15:0] out

////);
////    wire [15:0]result1,result2;
    
////    mux4x1_16(data0,data1,data2,data3,sel[1:0],result1);
////    mux4x1_16(data4,data5,data6,data7,sel[1:0],result2);
////    mux2X1(resutl1,result2,sel[2],out);

////endmodule

//module mux2X1(
//    input[15:0] data0,
//    input[15:0] data1,
//    input sel,
//    output[15:0] out
//);
//    assign out[0]= ~sel&data0[0] | sel&data1[0];
//    assign out[1]= ~sel&data0[1] | sel&data1[1];
//    assign out[2]= ~sel&data0[2] | sel&data1[2];
//    assign out[3]= ~sel&data0[3] | sel&data1[3];
//    assign out[4]= ~sel&data0[4] | sel&data1[4];
//    assign out[5]= ~sel&data0[5] | sel&data1[5];
//    assign out[6]= ~sel&data0[6] | sel&data1[6];
//    assign out[7]= ~sel&data0[7] | sel&data1[7];
//    assign out[8]= ~sel&data0[8] | sel&data1[8];
//    assign out[9]= ~sel&data0[9] | sel&data1[9];
//    assign out[10]= ~sel&data0[10] | sel&data1[10];
//    assign out[11]= ~sel&data0[11] | sel&data1[11];
//    assign out[12]= ~sel&data0[12] | sel&data1[12];
//    assign out[13]= ~sel&data0[13] | sel&data1[13];
//    assign out[14]= ~sel&data0[14] | sel&data1[14];
//    assign out[15]= ~sel&data0[15] | sel&data1[15];

//endmodule

// //
// parameter init = 3'b000;
//     parameter rasp = 3'b001; // Round and Score Print
//     parameter bawp = 3'b010; // Black and White Print
//     parameter p1_turn = 3'b011;
//     parameter p2_turn = 3'b100;
//     parameter matchresult_print = 3'b101;
//     parameter gameresult_print = 3'b110;
// //


module whattoprint(
    input [2:0]state,
    input [3:0]round,win,lose,p1_black, p1_white, p2_black, p2_white,
    input [1:0]gameresult,matchresult,
    output [15:0]out
);

wire [15:0] data0,data1,data2,data3,data4,data5,data6,data7;

assign data0=16'b0001101000011111; //init

//assign data1={round,1111,win,lose};//rasp
    assign data1[15]=round[3];
    assign data1[14]=round[2];
    assign data1[13]=round[1];
    assign data1[12]=round[0];
    assign data1[11]=1;
    assign data1[10]=1;
    assign data1[9]=1;
    assign data1[8]=1;
    assign data1[7]=win[3];
    assign data1[6]=win[2];
    assign data1[5]=win[1];
    assign data1[4]=win[0];
    assign data1[3]=lose[3];
    assign data1[2]=lose[2];
    assign data1[1]=lose[1];
    assign data1[0]=lose[0];

//assign data2={p1balck,p1white,p2black,p2white};
    assign data2[15]=p1_black[3];
    assign data2[14]=p1_black[2];
    assign data2[13]=p1_black[1];
    assign data2[12]=p1_black[0];
    assign data2[11]=p1_white[3];
    assign data2[10]=p1_white[2];
    assign data2[9]=p1_white[1];
    assign data2[8]=p1_white[0];
    assign data2[7]=p2_black[3];
    assign data2[6]=p2_black[2];
    assign data2[5]=p2_black[1];
    assign data2[4]=p2_black[0];
    assign data2[3]=p2_white[3];
    assign data2[2]=p2_white[2];
    assign data2[1]=p2_white[1];
    assign data2[0]=p2_white[0];

assign data3=16'b0001111111111111;//p1 turn
assign data4=16'b0010111111111111;

assign data5[15]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&1 | matchresult[1]&~matchresult[0]&0 | matchresult[1]&matchresult[0]&0;
assign data5[14]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&0 | matchresult[1]&~matchresult[0]&0 | matchresult[1]&matchresult[0]&0;
assign data5[13]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&1 | matchresult[1]&~matchresult[0]&0 | matchresult[1]&matchresult[0]&1;
assign data5[12]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&1 | matchresult[1]&~matchresult[0]&1 | matchresult[1]&matchresult[0]&0;
assign data5[11]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&1 | matchresult[1]&~matchresult[0]&1 | matchresult[1]&matchresult[0]&1;
assign data5[10]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&1 | matchresult[1]&~matchresult[0]&1 | matchresult[1]&matchresult[0]&1;
assign data5[9]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&0 | matchresult[1]&~matchresult[0]&1 | matchresult[1]&matchresult[0]&1;
assign data5[8]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&0 | matchresult[1]&~matchresult[0]&0 | matchresult[1]&matchresult[0]&0;
assign data5[7]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&1 | matchresult[1]&~matchresult[0]&0 | matchresult[1]&matchresult[0]&0;
assign data5[6]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&1 | matchresult[1]&~matchresult[0]&0 | matchresult[1]&matchresult[0]&0;
assign data5[5]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&0 | matchresult[1]&~matchresult[0]&0 | matchresult[1]&matchresult[0]&0;
assign data5[4]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&1 | matchresult[1]&~matchresult[0]&1 | matchresult[1]&matchresult[0]&1;
assign data5[3]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&1 | matchresult[1]&~matchresult[0]&1 | matchresult[1]&matchresult[0]&1;
assign data5[2]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&1 | matchresult[1]&~matchresult[0]&0 | matchresult[1]&matchresult[0]&0;
assign data5[1]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&1 | matchresult[1]&~matchresult[0]&1 | matchresult[1]&matchresult[0]&1;
assign data5[0]= ~matchresult[1]&~matchresult[0]&1 | ~matchresult[1]&matchresult[0]&0 | matchresult[1]&~matchresult[0]&0 | matchresult[1]&matchresult[0]&0;


assign data6[15]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&0 | gameresult[1]&gameresult[0]&0;
assign data6[14]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&0 | gameresult[1]&~gameresult[0]&0 | gameresult[1]&gameresult[0]&0;
assign data6[13]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&0 | gameresult[1]&gameresult[0]&1;
assign data6[12]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&1 | gameresult[1]&gameresult[0]&0;
assign data6[11]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&1 | gameresult[1]&gameresult[0]&1;
assign data6[10]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&1 | gameresult[1]&gameresult[0]&1;
assign data6[9]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&0 | gameresult[1]&~gameresult[0]&1 | gameresult[1]&gameresult[0]&1;
assign data6[8]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&0 | gameresult[1]&~gameresult[0]&0 | gameresult[1]&gameresult[0]&0;
assign data6[7]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&1 | gameresult[1]&gameresult[0]&1;
assign data6[6]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&1 | gameresult[1]&gameresult[0]&1;
assign data6[5]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&1 | gameresult[1]&gameresult[0]&1;
assign data6[4]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&1 | gameresult[1]&gameresult[0]&1;
assign data6[3]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&1 | gameresult[1]&gameresult[0]&1;
assign data6[2]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&1 | gameresult[1]&gameresult[0]&1;
assign data6[1]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&1 | gameresult[1]&gameresult[0]&1;
assign data6[0]= ~gameresult[1]&~gameresult[0]&1 | ~gameresult[1]&gameresult[0]&1 | gameresult[1]&~gameresult[0]&1 | gameresult[1]&gameresult[0]&1;


assign out[0]= ~state[2]&~state[1]&~state[0]&data0[0] | ~state[2]&~state[1]&state[0]&data1[0] | ~state[2]&state[1]&~state[0]&data2[0] | ~state[2]&state[1]&state[0]&data3[0] | state[2]&~state[1]&~state[0]&data4[0] | state[2]&~state[1]&state[0]&data5[0] | state[2]&state[1]&~state[0]&data6[0];
assign out[1]= ~state[2]&~state[1]&~state[0]&data0[1] | ~state[2]&~state[1]&state[0]&data1[1] | ~state[2]&state[1]&~state[0]&data2[1] | ~state[2]&state[1]&state[0]&data3[1] | state[2]&~state[1]&~state[0]&data4[1] | state[2]&~state[1]&state[0]&data5[1] | state[2]&state[1]&~state[0]&data6[1];
assign out[2]= ~state[2]&~state[1]&~state[0]&data0[2] | ~state[2]&~state[1]&state[0]&data1[2] | ~state[2]&state[1]&~state[0]&data2[2] | ~state[2]&state[1]&state[0]&data3[2] | state[2]&~state[1]&~state[0]&data4[2] | state[2]&~state[1]&state[0]&data5[2] | state[2]&state[1]&~state[0]&data6[2];
assign out[3]= ~state[2]&~state[1]&~state[0]&data0[3] | ~state[2]&~state[1]&state[0]&data1[3] | ~state[2]&state[1]&~state[0]&data2[3] | ~state[2]&state[1]&state[0]&data3[3] | state[2]&~state[1]&~state[0]&data4[3] | state[2]&~state[1]&state[0]&data5[3] | state[2]&state[1]&~state[0]&data6[3];
assign out[4]= ~state[2]&~state[1]&~state[0]&data0[4] | ~state[2]&~state[1]&state[0]&data1[4] | ~state[2]&state[1]&~state[0]&data2[4] | ~state[2]&state[1]&state[0]&data3[4] | state[2]&~state[1]&~state[0]&data4[4] | state[2]&~state[1]&state[0]&data5[4] | state[2]&state[1]&~state[0]&data6[4];
assign out[5]= ~state[2]&~state[1]&~state[0]&data0[5] | ~state[2]&~state[1]&state[0]&data1[5] | ~state[2]&state[1]&~state[0]&data2[5] | ~state[2]&state[1]&state[0]&data3[5] | state[2]&~state[1]&~state[0]&data4[5] | state[2]&~state[1]&state[0]&data5[5] | state[2]&state[1]&~state[0]&data6[5];
assign out[6]= ~state[2]&~state[1]&~state[0]&data0[6] | ~state[2]&~state[1]&state[0]&data1[6] | ~state[2]&state[1]&~state[0]&data2[6] | ~state[2]&state[1]&state[0]&data3[6] | state[2]&~state[1]&~state[0]&data4[6] | state[2]&~state[1]&state[0]&data5[6] | state[2]&state[1]&~state[0]&data6[6];
assign out[7]= ~state[2]&~state[1]&~state[0]&data0[7] | ~state[2]&~state[1]&state[0]&data1[7] | ~state[2]&state[1]&~state[0]&data2[7] | ~state[2]&state[1]&state[0]&data3[7] | state[2]&~state[1]&~state[0]&data4[7] | state[2]&~state[1]&state[0]&data5[7] | state[2]&state[1]&~state[0]&data6[7];
assign out[8]= ~state[2]&~state[1]&~state[0]&data0[8] | ~state[2]&~state[1]&state[0]&data1[8] | ~state[2]&state[1]&~state[0]&data2[8] | ~state[2]&state[1]&state[0]&data3[8] | state[2]&~state[1]&~state[0]&data4[8] | state[2]&~state[1]&state[0]&data5[8] | state[2]&state[1]&~state[0]&data6[8];
assign out[9]= ~state[2]&~state[1]&~state[0]&data0[9] | ~state[2]&~state[1]&state[0]&data1[9] | ~state[2]&state[1]&~state[0]&data2[9] | ~state[2]&state[1]&state[0]&data3[9] | state[2]&~state[1]&~state[0]&data4[9] | state[2]&~state[1]&state[0]&data5[9] | state[2]&state[1]&~state[0]&data6[9];
assign out[10]= ~state[2]&~state[1]&~state[0]&data0[10] | ~state[2]&~state[1]&state[0]&data1[10] | ~state[2]&state[1]&~state[0]&data2[10] | ~state[2]&state[1]&state[0]&data3[10] | state[2]&~state[1]&~state[0]&data4[10] | state[2]&~state[1]&state[0]&data5[10] | state[2]&state[1]&~state[0]&data6[10];
assign out[11]= ~state[2]&~state[1]&~state[0]&data0[11] | ~state[2]&~state[1]&state[0]&data1[11] | ~state[2]&state[1]&~state[0]&data2[11] | ~state[2]&state[1]&state[0]&data3[11] | state[2]&~state[1]&~state[0]&data4[11] | state[2]&~state[1]&state[0]&data5[11] | state[2]&state[1]&~state[0]&data6[11];
assign out[12]= ~state[2]&~state[1]&~state[0]&data0[12] | ~state[2]&~state[1]&state[0]&data1[12] | ~state[2]&state[1]&~state[0]&data2[12] | ~state[2]&state[1]&state[0]&data3[12] | state[2]&~state[1]&~state[0]&data4[12] | state[2]&~state[1]&state[0]&data5[12] | state[2]&state[1]&~state[0]&data6[12];
assign out[13]= ~state[2]&~state[1]&~state[0]&data0[13] | ~state[2]&~state[1]&state[0]&data1[13] | ~state[2]&state[1]&~state[0]&data2[13] | ~state[2]&state[1]&state[0]&data3[13] | state[2]&~state[1]&~state[0]&data4[13] | state[2]&~state[1]&state[0]&data5[13] | state[2]&state[1]&~state[0]&data6[13];
assign out[14]= ~state[2]&~state[1]&~state[0]&data0[14] | ~state[2]&~state[1]&state[0]&data1[14] | ~state[2]&state[1]&~state[0]&data2[14] | ~state[2]&state[1]&state[0]&data3[14] | state[2]&~state[1]&~state[0]&data4[14] | state[2]&~state[1]&state[0]&data5[14] | state[2]&state[1]&~state[0]&data6[14];
assign out[15]= ~state[2]&~state[1]&~state[0]&data0[15] | ~state[2]&~state[1]&state[0]&data1[15] | ~state[2]&state[1]&~state[0]&data2[15] | ~state[2]&state[1]&state[0]&data3[15] | state[2]&~state[1]&~state[0]&data4[15] | state[2]&~state[1]&state[0]&data5[15] | state[2]&state[1]&~state[0]&data6[15];


endmodule
