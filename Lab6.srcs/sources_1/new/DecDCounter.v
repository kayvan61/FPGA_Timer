`timescale 1ns / 1ps

module DecDCounter(
input clk,
    input ld,
    input [3:0] ldVal,
    input en,
    input res,
    output reg[3:0] out,
    output tc,
    output isZ
    );
    
    reg [3:0]counter;
        reg tcBuff;
        
        initial begin 
            counter <= 'd9;
            out <= 'd9;
        end 
        
        assign tc = tcBuff;//counter[3] & ~counter[2] & ~counter[1] & counter[0];
        assign isZ = counter == 0;
        
        always@(posedge(clk)) begin
            if(res) begin
                counter = ldVal;
            end 
            else if(ld) begin
                counter = ldVal;
            end
            else if(en) begin
                counter = counter - 1;
            end
            if(counter > 'd9) begin
                counter = 'd9;
                out = 'd9;
            end
            tcBuff = counter == 'd0;
            out = counter;
        end
endmodule
