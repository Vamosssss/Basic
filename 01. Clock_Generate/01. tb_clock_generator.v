`timescale 1ns / 1ps

module tb_clock_generator;
reg clk;

// clk gen
always
    #5 clk = ~clk;

initial begin
    clk     <= 0;
# 100
$finish;
end

endmodule
