`timescale 1ns / 1ps

module ClockDivDeb(
    input clk,
    output out
    );
    
        reg [31:0]COUNT = 32'b0;
        assign out = COUNT[15]; //15
        
        always@(posedge clk) begin
            COUNT = COUNT+1;
        end

    
endmodule
