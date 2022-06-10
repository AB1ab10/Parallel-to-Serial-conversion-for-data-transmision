`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module TOP(
    input [3:0] Din,
    input LD1,
    input LD2,
    input ck,
    input reset,
    input start,
    output VO,
    output OK,
    output out
    );
    
    reg[3:0] R1, R2;
    wire[7:0] inmux;
    wire[2:0] w;
    
    always @ (posedge ck)
        if(LD1) R1 <= Din;
            else R1 <= R1;
            
    always @ (posedge ck)
        if(LD2) R2 <= Din;
            else R2 <= R2;
    
    assign inmux = {R1, R2};
    assign out = inmux[w];
    
    controller AC(
        .start(start),
        .reset(reset),
        .ck(ck),
        .VO(VO),
        .OK(OK),
        .sel(w)
    );
                       
endmodule
