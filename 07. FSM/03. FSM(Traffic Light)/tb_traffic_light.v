module tb_traffic_light;
reg clk, rstn;
wire red, yellow, green;

initial begin
        clk=0;
        forever #5 clk = ~clk;
end

initial begin
        rstn = 1;
        #10 rstn =0;
        #20 rstn =1;
end
initial begin
        #1000
        $finish;
end

traffic_light u_traffic_light(
    clk,rstn,
    red, yellow, green
  );

endmodule
