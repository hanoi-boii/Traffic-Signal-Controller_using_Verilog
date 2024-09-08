`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2021 22:57:50
// Design Name: 
// Module Name: Traffic_main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Traffic
(
  input [4:0] nsCounter,
  input [3:0] ewCounter,
  input [1:0] yellowCounter,
  input NS_VEHICLE_DETECT,
  input EW_VEHICLE_DETECT,
  output reg NS_RED,
  output reg NS_YELLOW,
  output reg NS_GREEN,
  output reg EW_RED,
  output reg EW_YELLOW,
  output reg EW_GREEN
);

  initial begin
    NS_RED <= 0;
    NS_YELLOW <= 0;
    NS_GREEN <= 1;
    EW_RED <= 1;
    EW_YELLOW <= 0;
    EW_GREEN <= 0;
  end

  always @ (nsCounter) begin
    if (nsCounter == 31 & EW_VEHICLE_DETECT & NS_GREEN) begin
       NS_RED <= 0;
       NS_YELLOW <= 1;
       NS_GREEN <= 0;
       EW_RED <= 1;
       EW_YELLOW <= 0;
       EW_GREEN <= 0;
    end
  end

  always @ (ewCounter) begin
    if (ewCounter == 15 & EW_GREEN) begin
       NS_RED <= 1;
       NS_YELLOW <= 0;
       NS_GREEN <= 0;
       EW_RED <= 0;
       EW_YELLOW <= 1;
       EW_GREEN <= 0;
    end
  end

  always @ (yellowCounter) begin
    if (yellowCounter == 3 & NS_YELLOW) begin
       NS_RED <= 1;
       NS_YELLOW <= 0;
       NS_GREEN <= 0;
       EW_RED <= 0;
       EW_YELLOW <= 0;
       EW_GREEN <= 1;
    end

    if (yellowCounter == 3 & EW_YELLOW) begin
       NS_RED <= 0;
       NS_YELLOW <= 0;
       NS_GREEN <= 1;
       EW_RED <= 1;
       EW_YELLOW <= 0;
       EW_GREEN <= 0;
    end
  end
endmodule


module nsCounter
(
    input clk,
    output [4:0] count
);

  wire clk;
  reg[4:0] count;

  initial
    	count = 0;
  always @ ( negedge clk )
    		count[0] <= ~count[0];
  always @ ( negedge count[0] )
    		count[1] <= ~count[1];
  always @ ( negedge count[1] )
    		count[2] <= ~count[2];
  always @ ( negedge count[2] )
    		count[3] <= ~count[3];
  always @ ( negedge count[3] )
    		count[4] <= ~count[4];
endmodule


module ewCounter
(
    input clk,
    output [3:0] count
);

  wire clk;
  reg[3:0] count;

  initial
    	count = 0;
  always @ ( negedge clk )
    		count[0] <= ~count[0];
  always @ ( negedge count[0] )
    		count[1] <= ~count[1];
  always @ ( negedge count[1] )
    		count[2] <= ~count[2];
  always @ ( negedge count[2] )
    		count[3] <= ~count[3];
endmodule


module yellowCounter
(
  input clk,
 	output [1:0] count
);

  wire clk;
  reg[1:0] count;

  initial
    	count = 0;
  always @ ( negedge clk )
    		count[0] <= ~count[0];
  always @ ( negedge count[0] )
    		count[1] <= ~count[1];
endmodule

