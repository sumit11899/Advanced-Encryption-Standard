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
