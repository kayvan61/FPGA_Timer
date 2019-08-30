`timescale 1ns / 1ps

module ModeMux(
    input clk,
    input res,
    input [1:0] mode,
    input [15:0] upBuf,
    input [15:0] upBufLd,
    input [15:0] downBuf,
    input [15:0] downBufLd,
    output reg [15:0] outBuf
    );
    
    reg [1:0] cur;
        reg [1:0] next;
        reg dbBit;
        
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
                2'b00: outBuf = upBuf;
                2'b01: outBuf = upBufLd;
                2'b10: outBuf = downBuf;
                2'b11: outBuf = downBufLd;
                default: outBuf = 16'b111111111111111;
            endcase
            end
        
        always @(posedge clk) begin
            cur <= mode;
        end
endmodule
