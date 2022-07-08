module AES_main (plain_text,key,cipher_text);
  output [0:127] plain_text;
  input [0:127]cipher_text,key;
  
  wire [0:127]temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9;
  wire [0:127]key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;
  
  Add_round_key A (cipher_text,key10,temp0);
  
  Round r1 (temp0,key9,temp1);
  Round r2 (temp1,key8,temp2);
  Round r3 (temp2,key7,temp3);
  Round r4 (temp3,key6,temp4);
  Round r5 (temp4,key5,temp5);
  Round r6 (temp5,key4,temp6);
  Round r7 (temp6,key3,temp7);
  Round r8 (temp7,key2,temp8);
  Round r9 (temp8,key1,temp9);
  last_round r10 (temp9,key,cipher_text);
  
endmodule
  
