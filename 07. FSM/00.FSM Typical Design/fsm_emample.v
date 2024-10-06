module fsm_example(
    input clk,
    input reset,
    input in,
    output reg out
);

    // 1. 상태 선언
    localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
    
    reg [1:0] present_state, next_state;

    // 2. 상태 전이 로직
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            present_state <= S0;  // 리셋 시 S0 상태로 전이
        end else begin
            present_state <= next_state;  // 다음 상태로 전이
        end
    end

    // 3. 다음 상태 결정 로직
    always @(*) begin
        case (present_state)
            S0: begin
                if (in) next_state = S1;
                else next_state = S0;
            end
            S1: begin
                if (in) next_state = S2;
                else next_state = S0;
            end
            S2: begin
                if (in) next_state = S0;
                else next_state = S1;
            end
            default: next_state = S0;  // 기본 상태
        endcase
    end

    // 4. 출력 로직 (Moore FSM)
    always @(*) begin
        case (present_state)
            S0: out = 0;
            S1: out = 1;
            S2: out = 0;
            default: out = 0;  // 기본 출력
        endcase
    end

endmodule
