
module mix_columns(data_in,data_out);

input [0:127] data_in;
output [0:127] data_out;


    col_oper m1(data_in[0:31], data_out[0:31]);
    col_oper m2(data_in[32:63], data_out[32:63]);
    col_oper m3(data_in[64:95], data_out[64:95]);
    col_oper m4(data_in[96:127], data_out[96:127]);


endmodule

