`timescale 1ns / 1ps

module upSim(    );

    reg clk, en, res, load;
    reg[1:0] mode;
    reg[7:0] ldVal;
    wire [3:0]an;
    wire [6:0]sseg;
    wire dp;

 TimerTop t1(
    clk,
    en,
    res,
    load,
    mode,
    ldVal,
    an,
    sseg,
    dp
    );
 
 initial begin
    clk = 1'b0;
    en = 0;
    res = 1;
    load=0; 
    ldVal = 8'b10011001;
    mode = 2'b00;
    
    #50;
    res = 0;
    en = 1;
    #50 
    en = 0;
    
    #250000
    mode = 2'b01;
    res = 1;
    #50 
    res = 0;
    #250000
    mode = 2'b10;
    res = 1;
    #50 
    res = 0;    
    #250000
    res = 1;
    ldVal = 8'b00000001;
    #50 
    res = 0;    
    mode = 2'b11;
    
 end
 
 always begin
    #1 clk = ~clk;
 end
endmodule
