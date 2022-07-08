module Round (data_in,previous_key,round,round_key,data_out);
  input [0:127] data_in,previous_key;
  input [0:3]round;
  output [0:127]round_key,data_out;
  wire [0:127] temp1,temp2,temp3;
  
 
    sub_bytes S (data_in,temp1);
    shift_rows R (temp1,temp2);
    mix_columns M (temp2,temp3);
  key_maker K (round_key, previous_key,round);
  Add_round_key A (temp3,round_key,data_out);
  
endmodule
    //data_in = 128'h003C6E471F4E22740E081B3154590B1A;
    //data_in = 128'h63eb9fa0c02f9392ab30afc720cb2ba2;
//data_in = 128'h632fafa2c0302ba0abcb9f9220eb93c7;