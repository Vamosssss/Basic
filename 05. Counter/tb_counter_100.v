
`timescale 1ns / 1ps
module tb_counter_100;
reg clk , reset_n;
wire [6:0] o_cnt;
wire [6:0] o_cnt_always;

// clk gen
always
    #5 clk = ~clk;

initial begin

    reset_n <= 1;
    clk     <= 0;

# 100
    reset_n <= 0;
# 10
    reset_n <= 1;
# 10

# 2000

$finish;
end


counter_100 u_counter_100(
    .clk (clk),
    .reset_n (reset_n),
    .o_cnt(o_cnt),
    .o_cnt_always(o_cnt_always)
    );
endmodule
