`timescale 1ns/1ps

module scoreupdate_tb;

    // Inputs
    reg [1:0] matchresult;
    reg clk;
    reg resetn;

    // Outputs
    wire [3:0] round;
    wire [3:0] win;
    wire [3:0] lose;

    // Instantiate the Unit Under Test (UUT)
    scoreupdate uut (
        .matchresult(matchresult),
        .clk(clk),
        .resetn(resetn),
        .round(round),
        .win(win),
        .lose(lose)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns 주기의 클럭 신호 생성
    end

    // Test vectors
    initial begin
        // Initialize inputs
        resetn = 1;  // 리셋 비활성화 (active low)
        matchresult = 2'b00; // 매치 결과 초기화
        #10;  // 10ns 대기

        // Apply reset
        resetn = 0;  // 리셋 활성화
        #20;  // 20ns 대기
        resetn = 1;  // 리셋 비활성화
        #20;  // 20ns 대기

        // Change match result
        matchresult = 2'b10; // 매치 결과 설정
        #100;  // 100ns 동안 관찰

        // Change match result again
        matchresult = 2'b11; // 매치 결과 설정
        #100;  // 100ns 동안 관찰

        // Finish simulation after sufficient time
        #200;  // 200ns 대기
        $finish;  // 시뮬레이션 종료
    end

    // Monitor the outputs
    initial begin
        $monitor("Time = %0t, clk = %b, resetn = %b, round = %h, win = %h, lose = %h", $time, clk, resetn, round, win, lose);
    end

endmodule
