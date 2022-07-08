module last_round (data_in,key,data_out);
  input [0:127] data_in,key;
  
  output [0:127]data_out;
  wire [0:127] temp1,temp2;
  
 inv_shift_rows R (data_in,temp1);
    inv_sub_bytes S (temp1,temp2);
     Add_round_key A (temp2,key,data_out);
  
  
  
endmodule
