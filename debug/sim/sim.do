vlib work
vmap work work

vlog  ../../hdl/semafor.v
vlog  ../hdl/semafor_test.v
vlog  ../hdl/ck_rst_tb.v

vsim -novopt work.semafor_test 
do wave.do

run -all

