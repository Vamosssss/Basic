`timescale 1ns / 1ps
module fsm_test(
    input                       clk,
    input                       reset_n,
        input                   i_run,
        output reg              o_done
    );
/////// Local Param. to define state ////////
localparam S_IDLE       = 2'b00;
localparam S_RUN        = 2'b01;
localparam S_DONE       = 2'b10;

/////// Type ////////
reg [1:0] c_state; // Current state  (F/F)
reg [1:0] n_state; // Next state (Variable in Combinational Logic)

wire      is_done = 1'b1; // TODO to use signal, if core's state is done. (to use next chapter.)

/////// Main ////////

// Step 1. always block to update state
always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
                c_state <= S_IDLE;
    end else begin
                c_state <= n_state;
    end
end

// Step 2. always block to compute n_state
//always @(c_state or i_run or is_done)
always @(*)
begin
        n_state = S_IDLE; // To prevent Latch.
        case(c_state)
        S_IDLE: if(i_run)
                                n_state = S_RUN;
        S_RUN : if(is_done)
                                n_state = S_DONE;
        S_DONE: n_state = S_IDLE;
        endcase
end

// Step 3.  always block to compute output
//always @(c_state)
always @(*) // always block to compute output
begin
        o_done = 0; // To prevent Latch.
        case(c_state)
        S_DONE: o_done = 1;
        endcase
end

endmodule
