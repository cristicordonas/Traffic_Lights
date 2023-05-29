//------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Facultatea IESC
// Proiect     : Laborator ED
// Modul       : ck_rst_tb
// Autor       : Cordonaș Cristian
// Data        : Apr. 29, 2023
//------------------------------------------------------------------------------

`timescale 100ms/100ms

module ck_rst_tb #(
parameter CK_SEMIPERIOD = 'd10        // semi-perioada semnalului de ceas
)(
output reg              clk         , // ceas
output reg              rst_n         // reset asincron activ 0
);  

initial 
begin
  clk = 1'b0;               // valoare initiala 0
  forever #CK_SEMIPERIOD    // valoare complementata la fiecare semi-perioada
    clk = ~clk;
end

initial begin
  rst_n <= 1'b1;    // initial inactiv
  @(posedge clk);
  rst_n <= 1'b0;    // activare sincrona
  @(posedge clk);
  @(posedge clk);
  rst_n <= 1'b1;    // inactivare dupa doua perioade de ceas
  @(posedge clk);   // ramane inactiv pentru totdeauna
end

endmodule // ck_rst_tb
