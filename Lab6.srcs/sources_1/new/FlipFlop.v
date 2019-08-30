`timescale 1ns / 1ps

module FlipFlop(
    input clk,
    input in,
    output reg out
    );
    
    reg state = 1'b0;
    
    always@(posedge clk) begin
        if(in) begin 
            state = ~out;
        end
        else if(~in) begin
            out <= state;
        end
    end
    
endmodule
