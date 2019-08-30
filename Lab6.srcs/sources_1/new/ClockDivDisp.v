`timescale 1ns / 1ps

module ClockDivDisp(
    input clk,
    output out
    );
    
    reg [31:0]COUNT = 32'b0;
        assign out = COUNT[10]; //10
        
        always@(posedge clk) begin
            COUNT = COUNT+1;
        end
endmodule
