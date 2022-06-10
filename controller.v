`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module controller(
    input start, reset,
    input ck,
    output VO,
    output OK,
    output [2:0] sel
    );
    
    parameter q0 = 3'b001 , q1 = 3'b010, q2 = 3'b100;
    
    reg[2:0] state, next_state;
    reg[3:0] counter;
    
    always @ (posedge ck)
        if(reset)
            state <= q0;
        else state <= next_state;
            
    always @ (*)
        case(state)
            q0 : if(start) next_state = q1;
                 else next_state = q0;
            q1 : if(numarator < 7) next_state = q1;
                 else next_state = q2;
            q2 : next_state = q2;
            default: next_state = q0;
            endcase
     
     always @ (posedge ck)
        if (reset)
            counter <= 0;
            else if(state == q1)
                counter <= counter + 1;
                else counter <= counter;      
      
      assign sel = 7 - counter;
      assign VO = (state == q1)?1:0;
      assign OK = (state == q2)?1:0;     
                       
endmodule
