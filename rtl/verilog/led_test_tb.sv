//+++++++++++++++++++++++++++++++++++++++++++++++++
// Simple Program with ports
//+++++++++++++++++++++++++++++++++++++++++++++++++
//program simple(input CLOCK_50, led0, output logic rst_n);
//   //=================================================
//   // Initial block inside program block
//   //=================================================
//   initial begin
//     $monitor("@%0tns led0 = %0d",$time, led0);
//     rst_n = 0;
//     #20 rst_n = 1;
//     @ (posedge CLOCK_50);
//     repeat (100) @ (posedge CLOCK_50);
//     $finish;
//  end
//endprogram
`include "defines.sv"

module   led_test_tb;

   timeunit 1ns;
   timeprecision 1ns;

   localparam PERIOD = 10;
   localparam NUM_COUNT = 5;


   logic CLOCK_50;
   logic[1:0]  KEY;
   logic [7:0]LED;

   initial begin
      CLOCK_50 <= 1'b1;
      forever #(PERIOD/2) CLOCK_50 <= ~CLOCK_50;
   end

   always @(posedge CLOCK_50) begin
     $display("@%0tns count=%h LED = %H",$time, dut.count_r, LED);
     //$monitor("@%0tns count=%h LED = %0HH",$time, dut.count_r, LED);
   end

   initial begin
      KEY[0] = 0;
      #20 KEY[0] = 1;
      @ (posedge CLOCK_50);
      repeat (30) @ (posedge CLOCK_50);
      $finish;
   end
`ifdef RTL_SIM
   led_test  dut(.*);
`else
   led_test #(.NUM_COUNT(NUM_COUNT)) dut(.*);
`endif



endmodule // led_test_tb
