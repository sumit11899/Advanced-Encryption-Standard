
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

module first_word (key,round,data_out);
input [0:127] key;
input [0:3]round;
output [0:31] data_out;

wire [0:31] temp;
wire [0:31] temp1;
reg  [0:31] round_const;

always @(round)
case(round)

        4'h1: round_const= {8'h01, 8'h00, 8'h00, 8'h00};
        4'h2: round_const= {8'h02, 8'h00, 8'h00, 8'h00};
        4'h3: round_const= {8'h04, 8'h00, 8'h00, 8'h00};
        4'h4: round_const= {8'h08, 8'h00, 8'h00, 8'h00};
        4'h5: round_const= {8'h10, 8'h00, 8'h00, 8'h00};
        4'h6: round_const= {8'h20, 8'h00, 8'h00, 8'h00};
        4'h7: round_const= {8'h40, 8'h00, 8'h00, 8'h00};
        4'h8: round_const= {8'h80, 8'h00, 8'h00, 8'h00};
        4'h9: round_const= {8'h1B, 8'h00, 8'h00, 8'h00};
        4'hA: round_const= {8'h36, 8'h00, 8'h00, 8'h00};
        default : round_const= {8'h00, 8'h00, 8'h00, 8'h00};
endcase

circular_shift c(temp, key[96:127]); 
sub_box s1(temp[0:7], temp1[0:7]); 
sub_box s2(temp[8:15], temp1[8:15]);
sub_box s3(temp[16:23], temp1[16:23]);
sub_box s4(temp[24:31], temp1[24:31]);

assign data_out = temp1^round_const; 

endmodule


module circular_shift(data_out, data_in);

input [0:31] data_in;
output reg [0:31] data_out;

always@(data_in)
begin
data_out[0:23] = data_in[8:31];
data_out[24:31] = data_in[0:7];
end 

endmodule


module key_shedule (key0,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10);
input [0:127] key0;
output [0:127] key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;

key_maker k1(key1, key0,4'h1);
key_maker k2(key2, key1,4'h2);
key_maker k3(key3, key2,4'h3);
key_maker k4(key4, key3,4'h4);
key_maker k5(key5, key4,4'h5);
key_maker k6(key6, key5,4'h6);
key_maker k7(key7, key6,4'h7);
key_maker k8(key8, key7,4'h8);
key_maker k9(key9, key8,4'h9);
key_maker k10(key10, key9,4'hA);


endmodule