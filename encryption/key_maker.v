

module key_maker(round_key, previous_key,round);

input [0:127] previous_key;
input [0:3] round;
output reg [0:127] round_key; 
wire [0:31] g; 

first_word w (previous_key,round,g);
always@(g or previous_key)
begin
    
    round_key[0:31] = g ^ previous_key[0:31];
    round_key[32:63] = round_key[0:31] ^ previous_key[32:63];
    round_key[64:95] = round_key[32:63] ^ previous_key[64:95];
    round_key[96:127] = round_key[64:95] ^ previous_key[96:127];

end  

endmodule

