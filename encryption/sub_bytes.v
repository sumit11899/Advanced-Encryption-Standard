  
module sub_bytes(data_in, data_out);

  input [0:127]data_in;
  output [0:127]data_out;

  

sub_box s0(data_in[0:7], data_out[0:7]);
sub_box s1(data_in[8:15], data_out[8:15]);
sub_box s2(data_in[16:23], data_out[16:23]);
sub_box s3(data_in[24:31], data_out[24:31]);

sub_box s4(data_in[32:39], data_out[32:39]);
sub_box s5(data_in[40:47], data_out[40:47]);
sub_box s6(data_in[48:55], data_out[48:55]);
sub_box s7(data_in[56:63], data_out[56:63]);

sub_box s8(data_in[64:71], data_out[64:71]);
sub_box s9(data_in[72:79], data_out[72:79]);
sub_box s10(data_in[80:87], data_out[80:87]);
sub_box s11(data_in[88:95], data_out[88:95]);

sub_box s12(data_in[96:103], data_out[96:103]);
sub_box s13(data_in[104:111], data_out[104:111]);
sub_box s14(data_in[112:119], data_out[112:119]);
sub_box s15(data_in[120:127], data_out[120:127]);

endmodule