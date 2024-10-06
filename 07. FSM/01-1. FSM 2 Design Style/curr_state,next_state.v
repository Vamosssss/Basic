localparam [1:0] S0 = 0, S1 = 1, S2 = 2;

always @ (posedge clk, negedge rstn)
  if(!rstn) curr_state <=0;
else curr_state<= next_state;

always @(*) begin
  next_state = curr_state;
  case(curr_state)
    S0 : next_state = S1;
    S1 : if (go==1) next_state = S2;
    S2 : if (back==1) next_stae = S1;
    else if (done==1) next_state = S0;
  endcase
end

always @ (*) begin
  status = 0;
  case(curr_state)
    S0 : status = 0;
    S1 : status = 1;
    S2 : status = 2;
  endcase
end
