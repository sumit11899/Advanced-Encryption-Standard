
module AES_main (plain_text,key,cipher_text,key_out);
  input [0:127] plain_text,key;
  output [0:127]cipher_text,key_out;
  
  wire [0:127]temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9;
  wire[0:127]tempk1,tempk2,tempk3,tempk4,tempk5,tempk6,tempk7,tempk8,tempk9;
  
  Add_round_key A (plain_text,key,temp0);
  
  Round r1 (temp0,key,4'h1,tempk1,temp1);
  Round r2 (temp1,tempk1,4'h2,tempk2,temp2);
  Round r3 (temp2,tempk2,4'h3,tempk3,temp3);
  Round r4 (temp3,tempk3,4'h4,tempk4,temp4);
  Round r5 (temp4,tempk4,4'h5,tempk5,temp5);
  Round r6 (temp5,tempk5,4'h6,tempk6,temp6);
  Round r7 (temp6,tempk6,4'h7,tempk7,temp7);
  Round r8 (temp7,tempk7,4'h8,tempk8,temp8);
  Round r9 (temp8,tempk8,4'h9,tempk9,temp9);
  last_round r10 (temp9,tempk9,4'hA,key_out,cipher_text);
  
endmodule
  
