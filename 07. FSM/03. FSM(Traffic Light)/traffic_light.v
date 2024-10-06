module traffic_light(
        input clk, rstn,
        output o_red, o_yellow, o_green
);

localparam RED=0, YELLOW=1, GREEN=2;

reg[1:0] curr_state;
reg[4:0] cnt;

always @(posedge clk, negedge rstn)
        if(!rstn) curr_state <= RED;
        else
                case(curr_state)
                        RED: if(cnt==29) curr_state<=YELLOW;
                        YELLOW: if(cnt==4) curr_state<=GREEN;
                        GREEN: if(cnt==19) curr_state<=RED;
        endcase

always @(posedge clk, negedge rstn)
        if(!rstn) cnt <=0;
        else
                case(curr_state)
                        RED:if (cnt==29) cnt<=0; else cnt<= cnt+1;
                         YELLOW:if (cnt==4) cnt<=0; else cnt<=cnt+1;
                        GREEN:if (cnt==19) cnt<=0; else cnt<= cnt+1;
        endcase

assign o_red = curr_state == RED;
assign o_yellow = curr_state == YELLOW;
assign o_green = curr_state == GREEN;

endmodule
