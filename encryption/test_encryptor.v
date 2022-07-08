module test;
 
  

  	 
  reg [0:127]plain_text,key;
 // reg [0:3]round;
  wire [0:127] cipher_text,key_out;
  integer i;
  
  
AES_main A  (plain_text,key,cipher_text,key_out);
  
  initial begin
plain_text = 128'h54776F204F6E65204E696E652054776F;
    key=128'h5468617473206D79204B756E67204675;
  

    
    
    #2;
    for(i=0; i<127; i=i+8) begin
      $write("%h ", cipher_text[i+:8]);
      //$write("%h",round_key[i+:8]);
      
        end
  end
endmodule