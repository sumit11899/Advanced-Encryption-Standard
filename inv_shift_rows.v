module inv_shift_rows(
  input [0:127] data_in,
  output reg [0:127] data_out
);
always @*
begin

data_out[0:7] = data_in[0:7];
data_out[8:15] = data_in[104:111];
data_out[16:23] = data_in[80:87];
data_out[24:31] = data_in[56:63];

data_out[32:39] = data_in[32:39];
data_out[40:47] = data_in[8:15];
data_out[48:55] = data_in[112:119];
data_out[56:63] = data_in[88:95];

data_out[64:71] = data_in[64:71];
data_out[72:79] = data_in[40:47];
data_out[80:87] = data_in[16:23];
data_out[88:95] = data_in[120:127];

data_out[96:103] = data_in[96:103];
data_out[104:111] = data_in[72:79];
data_out[112:119] = data_in[48:55];
data_out[120:127] = data_in[24:31];
end
endmodule