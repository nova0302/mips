
//`include "defines.sv"
//`define RTL_SIM

module led_test
`ifdef RTL_SIM
  #(parameter NUM_COUNT = 5)
`else
   #(parameter NUM_COUNT = 50000000)
`endif
   (
    input             CLOCK_50,
    input [1:0]       KEY,
    output wire [7:0] LED
    );



   int                count_r, count_n;
   logic [7:0]        LED_r, LED_n;
   wire               rst_n = KEY[0];
   assign LED = LED_r;
   always_ff @(posedge CLOCK_50 or negedge rst_n)
     if(!rst_n)
       count_r <= 0;
     else
       count_r <= count_n;

   always_comb
     if(count_r == NUM_COUNT)
       count_n = 0;
     else
       count_n = count_r + 1;


   always_ff @(posedge CLOCK_50 or negedge rst_n)
     if(!rst_n)
       LED_r <= 0;
     else
       LED_r <= LED_n;

   always_comb
     if(count_r == NUM_COUNT)
       LED_n = ~LED_r;
     else
       LED_n = LED_r;



endmodule // led
