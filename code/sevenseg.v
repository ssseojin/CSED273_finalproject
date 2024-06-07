module bcd_to_7seg (
    input [3:0] bcd,
    output reg [7:0] seg
);

  always @(*) begin
    // dot, center, tl, bl, b, br, tr, t
    case (bcd)
      4'b0000: seg = 8'b11000000;  // 0
      4'b0001: seg = 8'b11111001;  // 1
      4'b0010: seg = 8'b10100100;  // 2
      4'b0011: seg = 8'b10110000;  // 3
      4'b0100: seg = 8'b10011001;  // 4
      4'b0101: seg = 8'b10010010;  // 5
      4'b0110: seg = 8'b10000010;  // 6
      4'b0111: seg = 8'b11111000;  // 7
      4'b1000: seg = 8'b10000000;  // 8
      4'b1001: seg = 8'b10010000;  // 9
      4'b1010: seg = 8'b10101011;  // N
      4'b1011: seg = 8'b10100001;  // D
      4'b1100: seg = 8'b10101111;  // R
      4'b1101: seg = 8'b10001000;  // A
      4'b1110: seg = 8'b10010101;  // W
      4'b1111: seg = 8'b11111111;  // off
      default: seg = 8'b11111111;
    endcase
  end
endmodule

module led_renderer (
    input [15:0] graphics,
    input clk,
    output reg[3:0] segSel,
    output reg[7:0] seg
);
  integer counter;
  wire [7:0] res0, res1, res2, res3;

  initial begin
    counter <= 0;
    segSel <= 14;
    seg <= 8'b11111111;
  end

  bcd_to_7seg pos0 (
      .bcd(graphics[3:0]),
      .seg(res0)
  );
  bcd_to_7seg pos1 (
      .bcd(graphics[7:4]),
      .seg(res1)
  );
  bcd_to_7seg pos2 (
      .bcd(graphics[11:8]),
      .seg(res2)
  );
  bcd_to_7seg pos3 (
      .bcd(graphics[15:12]),
      .seg(res3)
  );

  always @(posedge clk) begin
    counter <= counter + 1;
    if (counter == 100000) begin
      counter <= 0;
      case (segSel)
        14: begin
          segSel <= 13;
          seg <= res1;
        end
        13: begin
          segSel <= 11;
          seg <= res2;
        end
        11: begin
          segSel <= 7;
          seg <= res3;
        end
        7: begin
          segSel <= 14;
          seg <= res0;
        end
      endcase
    end
  end
endmodule



//output sevenseg
//init state -> init ì¶œë ¥
//rasp state -> round win lose ì¶œë ¥
//bawp state -> p1black p1white p2black p2white ì¶œë ¥, led?— ?ƒˆ?Š”ì§??—¬ë¶?, ?‘ë°±ì—¬ë¶? ì¶œë ¥
//p1_turn state -> player ì¶œë ¥, led?— p1_card ì¶œë ¥
//p2_turn state
//matchresult state -> matchresult ì¶œë ¥
//gameresult state -> gameresult ì¶œë ¥
