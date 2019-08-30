module TimerTop(
    input clk,
    input en,
    input res,
    input load,
    input [1:0]mode,
    input [7:0] loadVal,
    output [3:0] an,
    output [6:0] sseg,
    output dp
    );
    
    wire [15:0] dispBuffer;
    wire [15:0] dispBufferUp;
    wire [15:0] dispBufferDown;
    wire [15:0] dispBufferUpLoad;
    wire [15:0] dispBufferDownLoad;
    wire [6:0] toDig1;
    wire [6:0] toDig2;
    wire [6:0] toDig3;
    wire [6:0] toDig4;
    wire enable;
    wire slow_clk_disp;
    wire slow_clk_counter;
    wire slow_clk_debounce;
    
    ClockDivCount cdc (clk, slow_clk_counter);
    ClockDivDisp cdd (clk, slow_clk_disp);
    ClockDivDeb cdb(clk, slow_clk_debounce);
    
    FlipFlop ff(slow_clk_debounce, en, enable);
    
    FourBitUpCounter upNoLoad(slow_clk_counter,enable,0,0,res,dispBufferUp);
    FourBitUpCounter upLoad(slow_clk_counter,enable,res,{loadVal, 8'b0},res,dispBufferUpLoad);
    FourDigDown downNoLoad(slow_clk_counter,enable,0,{8'b10011001, 8'b10011001},res,dispBufferDown);
    FourDigDown downLoad(slow_clk_counter,enable,res,{loadVal, 8'b0},res,dispBufferDownLoad);
    
    ModeMux mm(clk, res, mode, dispBufferUp, dispBufferUpLoad, dispBufferDown, dispBufferDownLoad, dispBuffer);   
    
    hexto7seg dig0(dispBuffer[3:0], toDig1);
    hexto7seg dig1(dispBuffer[7:4], toDig2);
    hexto7seg dig2(dispBuffer[11:8], toDig3);
    hexto7seg dig3(dispBuffer[15:12], toDig4);
 
    dispMux dm(slow_clk_disp, res, toDig1, toDig2, toDig3, toDig4, an, sseg);
    
    assign dp = an[2];
        
endmodule