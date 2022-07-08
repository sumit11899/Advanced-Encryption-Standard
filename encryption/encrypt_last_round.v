module last_round (data_in,previous_key,round,round_key,data_out);
  input [0:127] data_in,previous_key;
  input [0:3]round;
  output [0:127]round_key,data_out;
  wire [0:127] temp1,temp2,temp3;
  
 
    sub_bytes S (data_in,temp1);
    shift_rows R (temp1,temp2);

  key_maker K (round_key, previous_key,round);
  Add_round_key A (temp2,round_key,data_out);
  
endmodule
