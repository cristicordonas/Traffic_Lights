//------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Facultatea IESC
// Proiect     : Laborator ED
// Modul       : semafor
// Autor       : Cordonaș Cristian
// Data        : Apr. 29, 2023
//------------------------------------------------------------------------------

module semafor (
input   clk             , // semnal de ceas, 
input   rst_n           , // semnal de reset asincron activ 0
input   buton           , // buton pietoni
output  semafor_masini  ,
output  semafor_pietoni 
);

reg [1:0] stare_prezenta;
reg [1:0] stare_viitoare;
reg [8:0] counter       ;
reg buton_apasat        ;
reg ok1                 ;
reg ok2                 ;

// coduri stari (unice)
localparam stare1   = 2'b01;  //rosu pentru masini, verde pentru pietoni
localparam stare2   = 2'b10;  //verde pentru masini, rosu pentru pietoni
localparam stare3   = 2'b00;  //galben pentru masini, rosu pentru pietoni

initial begin
counter      <= 8'b0;
buton_apasat <= 1'b0;
ok1 <= 1'b0;
ok2 <= 1'b0;
end

always @(posedge clk)
counter <= counter + 1;

// modeleaza registrul de stare
always @(posedge clk or negedge rst_n)
if (~rst_n) begin
            stare_prezenta <= stare1;  // stare initiala
            counter        <= 8'b0;
end
else        stare_prezenta <= stare_viitoare;

// modeleaza circuitul combinational de stare
always @(*)
case (stare_prezenta)
stare1  : begin
          ok2 <= 1'b0;
          ok1 <= 1'b1;
          buton_apasat <= 1'b0;
          if (counter == 'd30) begin
              stare_viitoare <= stare3;
              counter <= 8'b0;
          end
          end
stare2  : begin
          ok1 <= 1'b0;
          ok2 <= 1'b1;
          if (buton && !buton_apasat) begin
              buton_apasat <= 1'b1;
              counter <= 8'b0;
          end
          else if (buton_apasat == 1'b1 && counter == 'd60) begin
                   counter        <= 8'b0;
                   stare_viitoare <= stare3;
          end
          end
stare3  : begin
          buton_apasat <= 1'b0;
          if (counter == 'd5) begin
              stare_viitoare <= stare1;
              counter        <= 8'b0;
              if(ok1)
                 stare_viitoare <= stare2;
              else if(ok2)
                 stare_viitoare <= stare1;
          end
          end
default : stare_viitoare <= stare1;
endcase

// modeleaza circuitul combinational de iesire
assign semafor_masini  = (stare_prezenta == stare2);
assign semafor_pietoni = (stare_prezenta == stare1);

endmodule // semafor

