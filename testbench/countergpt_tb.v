//by gpt
`timescale 1ns / 1ps

module counter_tb;

    // Inputs
    reg clk;
    reg resetn;

    // Outputs
    wire [3:0] count;

    // Instantiate the Unit Under Test (UUT)
    counter uut (
        .clk(clk),
        .resetn(resetn),
        .count(count)
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
        #10;  // 10ns 대기

        // Apply reset
        resetn = 0;  // 리셋 활성화
        #20;  // 20ns 대기
        resetn = 1;  // 리셋 비활성화
        #20;  // 20ns 대기

        // Observe counting
        #100;  // 100ns 동안 관찰

        // Apply another reset
        resetn = 0;  // 리셋 활성화
        #20;  // 20ns 대기
        resetn = 1;  // 리셋 비활성화
        #20;  // 20ns 대기

        // Observe counting
        #100;  // 100ns 동안 관찰

        // Finish simulation after sufficient time
        #200;  // 200ns 대기
        $finish;  // 시뮬레이션 종료
    end

    // Monitor the outputs
    initial begin
        $monitor("Time = %0t, clk = %b, resetn = %b, count = %b", $time, clk, resetn, count);
    end

endmodule
