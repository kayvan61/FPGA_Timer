`timescale 1ns / 1ps

module FourDigDown(
    input clk,
    input en,
    input ld,
    input [15:0]ldVal,
    input res,
    output [15:0] out
    );
    
    wire tc1, tc2, tc3;
    wire isZ1, isZ2, isZ3, isZ4;
    
    DecDCounter num0(clk, ld, ldVal[3:0], en & ~(isZ1&isZ2&isZ3&isZ4), res, out[3:0], tc1, isZ1);
    DecDCounter num1(clk, ld, ldVal[7:4], en&tc1 & ~(isZ1&isZ2&isZ3&isZ4), res, out[7:4], tc2, isZ2);
    DecDCounter num2(clk, ld, ldVal[11:8], en&tc2&tc1 & ~(isZ1&isZ2&isZ3&isZ4), res, out[11:8], tc3, isZ3);
    DecDCounter num3(clk, ld, ldVal[15:12], en&tc3&tc2&tc1 & ~(isZ1&isZ2&isZ3&isZ4), res, out[15:12], , isZ4);
    
endmodule
