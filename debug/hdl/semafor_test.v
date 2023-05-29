//------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Facultatea IESC
// Proiect     : Laborator ED
// Modul       : semafor_test
// Autor       : Cordonaș Cristian
// Data        : Apr. 29, 2023
//------------------------------------------------------------------------------

`timescale 1s/1s

module semafor_test;
wire   clk            ;
wire   rst_n          ;
reg    buton          ;
wire   semafor_masini ;
wire   semafor_pietoni;

ck_rst_tb #(
.CK_SEMIPERIOD ('d5)
) i_ck_rst_tb (
.clk    (clk   ),
.rst_n  (rst_n )
);

initial begin
  buton <= 1'bx;
  @(negedge rst_n);
  buton <= 1'b0;
  @(posedge rst_n);
  @(posedge clk);
  buton <= 1'b1;
  #1;
  buton <= 1'b0;
  #3;
  buton <= 1'b1;
  #1;
  buton <= 1'b0;
  #20;
  buton <= 1'b1;
  #1;
  buton <= 1'b0;
  #10;
  buton <= 1'b1;
  #1;
  buton <= 1'b0;
  #5;
  buton <= 1'b1;
  #3;
  buton <= 1'b0;
  #30;
  buton <= 1'b1;
  #1;
  buton <= 1'b0;
  #22;
  buton <= 1'b1;
  #1;
  buton <= 1'b0;
  #100;
  $display ("%M %0t INFO: Final simulare.", $time);
  $stop;
end

semafor i_semafor(
.clk              (clk            ),
.rst_n            (rst_n          ),
.buton            (buton          ),
.semafor_masini   (semafor_masini ),
.semafor_pietoni  (semafor_pietoni) 
);

endmodule // semafor_test
