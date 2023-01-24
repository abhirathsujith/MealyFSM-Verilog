`timescale 1ns/1ps
 module meallyy (din,reset,clk,y);
  output y;
  reg y;
  input din;
  input clk;
  input reset;
  reg [1:0] ps,ns;
  parameter s0 = 2'b00,
  s1 = 2'b01,s2 = 2'b10,s3 = 2'b11;
  always @(posedge clk )
    begin
      case(ps)
        s0: if (din == 1)
          begin
            ns = s1;
            y=0;
          end 
        else 
           begin
             ns = ps;
              y=0;
           end
        s1: if (din == 0)
          begin
            ns = s2;
            y=0;
          end 
        else 
           begin
             ns = ps;
              y=0;
           end
        s2: if (din == 1)
          begin
            ns = s3;
            y=0;
          end 
        else 
           begin
             ns = s0;
              y=0;
           end
        s3: if (din == 0)
          begin
            ns = s2;
            y=1;
          end 
        else 
           begin
             ns = s0;
              y=0;
           end
        default: ns = s0;
      endcase
    end
  always @(posedge clk)
    begin
      if(reset)
        ps<=s0;
      else
        ps<=ns;
    end
endmodule
