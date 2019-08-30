`timescale 1ns / 1ps

module FourBitUpCounter(
    input clk,
    input en,
    input ld,
    input [15:0]ldVal,
    input res,
    output [15:0] out
    );
    
    wire tc1, tc2, tc3, tc4;
    wire isN1, isN2, isN3, isN4;
    
    DecCounter num0(clk, ld, ldVal[3:0], en & ~(isN1&isN2&isN3&isN4), res, out[3:0], tc1, isN1);
    DecCounter num1(clk, ld, ldVal[7:4], en&tc1 & ~(isN1&isN2&isN3&isN4), res, out[7:4], tc2, isN2);
    DecCounter num2(clk, ld, ldVal[11:8], en&tc2&tc1 & ~(isN1&isN2&isN3&isN4), res, out[11:8], tc3, isN3);
    DecCounter num3(clk, ld, ldVal[15:12], en&tc3&tc1&tc2 & ~(isN1&isN2&isN3&isN4), res, out[15:12], tc4, isN4);
    
endmodule
