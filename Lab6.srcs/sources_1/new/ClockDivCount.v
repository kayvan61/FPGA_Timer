`timescale 1ns / 1ps

module ClockDivCount(
    input clk,
    output out
    );
    reg [31:0]COUNT = 32'b0;
    assign out = COUNT[31]; //31
    
    always@(posedge clk) begin
        COUNT = COUNT+1;
        if(COUNT == 'd1000000) begin
            COUNT = 0;
            COUNT[31] = 1;
        end
        else begin
            COUNT[31] = 0;
        end
    end    
endmodule
