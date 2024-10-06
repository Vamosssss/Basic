localparam [1:0] SO = 0, S1 = 1, S2 = 2;

always @ (posedge clk, negedge rstn) 
  if(!rstn) curr_state <= 0;
else
  case(curr_state)
    S0 :              curr_state <= S1;
    S1 : if (go==1)   curr_state <= S2;
    S2 : if (back==1) curr_state <= S1;
    else if (done==1) curr_state <= S0;
  endcase

always @(*) begin
  status = 0;
  case(curr_state)
    S0 : status = 0;
    S1 : status = 1;
    S2 : status = 2;
  endcase
end
