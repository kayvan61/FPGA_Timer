`timescale 1ns / 1ps

module dispMux(
    input clk,
    input res,
    input [6:0] in0,
    input [6:0] in1,
    input [6:0] in2,
    input [6:0] in3,
    output reg [3:0] an,
    output reg [6:0] sseg
    );
    
    reg [1:0] cur;
    reg [1:0] next;
    
    //state trans
    always @(*) begin
        case(cur)
            2'b00: next = 2'b01;
            2'b01: next = 2'b10;
            2'b10: next = 2'b11;
            2'b11: next = 2'b00;
            default: begin next = 2'b00;
                cur = 2'b00;
                end
        endcase
    end
    
    always @(*) begin
        //mux
        case(cur)
            2'b00: sseg = in0;
            2'b01: sseg = in1;
            2'b10: sseg = in2;
            2'b11: sseg = in3;
            default: sseg = 16'b0;
        endcase
        //decoder
        case(cur)
            2'b00: an = 4'b1110;
            2'b01: an = 4'b1101;
            2'b10: an = 4'b1011;
            2'b11: an = 4'b0111;
            default: an = 4'b1111;
        endcase
        end
    
    always @(posedge clk or posedge res) begin
        if(res)
            cur <= 2'b00;
        else
            cur <= next;
    end
endmodule
