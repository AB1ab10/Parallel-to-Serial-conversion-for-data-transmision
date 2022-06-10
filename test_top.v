`timescale 1ns / 1ps



module test_top();

    reg[3:0] Din;
    reg LD1, LD2;
    reg ck, reset, start;
    wire out;
    
    TOP dut(
        Din,
        LD1, LD2,
        ck, reset, start,
        VO, OK,
        out
    );
   
   
   initial begin
    ck = 0;
    forever #5 ck = ~ck;
    end
    
    initial begin
         reset = 1;
  start = 0;
  Din = 4'b1100;
  #10 LD1 = 1;
  #10 LD1 = 0; Din = 4'b1010;
  #10 LD2 = 1;
  #10 LD2 = 0; 
  #10 start = 1;reset=0;
  #10 start = 0;
  #150 $stop;
  end 

endmodule
