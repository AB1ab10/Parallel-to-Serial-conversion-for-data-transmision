`timescale 1ns / 1ps



module test_controller();

reg ck_t , reset_t , start_t;
wire VO_t , OK_t;
wire[2:0] sel_t;

controller dut(
    .ck(ck_t),
    .reset(reset_t),
    .start(start_t),
    .VO(VO_t),
    .OK(OK_t),
    .sel(sel_t)
);

initial begin
    ck_t = 0;
    forever #5 ck_t = ~ck_t;
    end
    
initial begin
    reset_t = 1;
    start_t = 0;
    #10 start_t = 1;
    reset_t = 0;
    #10 start_t = 0;
    #100 $stop;
    end    
    
    

endmodule
