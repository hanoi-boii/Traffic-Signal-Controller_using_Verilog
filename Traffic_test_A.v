`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2021 23:00:44
// Design Name: 
// Module Name: Traffic_test_A
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


module Traffic_Test;

  reg NS_VEHICLE_DETECT;
  reg EW_VEHICLE_DETECT;
  wire NS_RED;
  wire NS_YELLOW;
  wire NS_GREEN;
  wire EW_RED;
  wire EW_YELLOW;
  wire EW_GREEN;
  reg clk;
  wire[4:0] count1;
  wire[3:0] count2;
  wire[1:0] count3;

  nsCounter clock1(clk, count1); 	 // Count a total of 32 seconds
  ewCounter clock2(clk, count2); 	 // Counts a total of 16 seconds
  yellowCounter clock3(clk, count3); // Counts a total of 4 seconds

  Traffic CORE (count1, count2, count3, NS_VEHICLE_DETECT, EW_VEHICLE_DETECT, NS_RED, NS_YELLOW, NS_GREEN, EW_RED, EW_YELLOW, EW_GREEN);

  initial begin

    clk = 0;
    NS_VEHICLE_DETECT = 0;
    EW_VEHICLE_DETECT = 0;

    $display("  NS | EW ");
    $display("R Y G R Y G ");
    $monitor("%h %h %h %h %h %h", NS_RED, NS_YELLOW, NS_GREEN, EW_RED, EW_YELLOW, EW_GREEN);

    #1000 $finish;
  end

  always begin
    #1 clk = ~clk;
  end
endmodule
