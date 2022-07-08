module  Add_round_key  (data_in ,key,data_out );
  input [0:127] data_in,key;
  output[0:127] data_out;
  
  assign data_out = data_in^key ;
endmodule
//ba 75 f4 7a 84 a4 8d 32 e8 8d 06 0e 1b 40 7d 5d

  
  