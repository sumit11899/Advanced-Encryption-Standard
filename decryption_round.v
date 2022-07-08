module Round (data_in,key,data_out);
  input [0:127] data_in,key;
  
  output [0:127]data_out;
  wire [0:127] temp1,temp2,temp3;
  
 inv_shift_rows R (data_in,temp1);
    inv_sub_bytes S (temp1,temp2);

    inv_mix_columns M (temp2,temp3);
         Add_round_key A (temp3,key,data_out);
  
  
endmodule
