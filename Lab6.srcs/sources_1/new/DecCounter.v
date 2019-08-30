`timescale 1ns / 1ps

module DecCounter(
    input clk,
    input ld,
    input [3:0] ldVal,
    input en,
    input res,
    output reg[3:0] out,
    output tc,
    output isN
    );
    
    reg [3:0]counter;
    reg tcBuff;
    
    initial begin 
        counter <= 4'b0;
        out <= 4'b0;
    end 
    
    assign tc = tcBuff;//counter[3] & ~counter[2] & ~counter[1] & counter[0];
    assign isN = counter == 'd9;
    
    always@(posedge(clk)) begin
        if(res) begin
            counter = ldVal;
        end 
        else if(ld) begin
            counter = ldVal;
        end
        else if(en) begin
            counter = counter + 1;
        end
        if(counter > 4'd9) begin
            counter = 0;
            out = 0;
        end 
        tcBuff = (counter == 4'd9);
        out = counter;
    end
endmodule
