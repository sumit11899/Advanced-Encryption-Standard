
  
module inv_mix_columns(data_in,data_out);

input [0:127] data_in;
output [0:127] data_out;


    col_oper m1(data_in[0:31], data_out[0:31]);
    col_oper m2(data_in[32:63], data_out[32:63]);
    col_oper m3(data_in[64:95], data_out[64:95]);
    col_oper m4(data_in[96:127], data_out[96:127]);


endmodule
module col_oper(input[0:31] i, output reg[0:31] o);

wire[0:7] c0, c1, c2, c3;
wire [0:7] a0, a1, a2, a3;
  wire[0:7] b0, b1, b2, b3;
  wire[0:7] d0, d1, d2, d3;
  wire[0:7] e0, e1, e2, e3;


 assign       a0[0:7] = i[0:7];
  assign       a1[0:7] = i[8:15];
  assign       a2[0:7] = i[16:23];
   assign      a3[0:7] = i[24:31];
    mux_11 m0(a0,c0);
      mux_11 m1(a1,c1);
      mux_11 m2(a2,c2);
      mux_11 m3(a3,c3);  
  mux_9 m6(a0,b0);
  mux_9 m7(a1,b1);
  mux_9 m8(a2,b2);
  mux_9 m9(a3,b3);  
  mux_13 m10 (a0,d0);
  mux_13 m11(a1,d1);
  mux_13 m12(a2,d2);
  mux_13 m13(a3,d3);
  mux_14 m14(a0,e0);
  mux_14 m15(a1,e1);
  mux_14 m16(a2,e2);
  mux_14 m17(a3,e3);
    

always @ (*)

    begin
        
      o[0:7] = e0 ^ c1 ^d2 ^ b3;
      o[8:15] = b0 ^ e1 ^ c2 ^ d3;
      o[16:23] = d0 ^b1 ^ e2 ^ c3;
      o[24:31] = c0 ^ d1 ^ b2 ^ e3;

    end

endmodule

module mux_2 (data_in,data_out);
  input [0:7]data_in;
  output reg [0:7]data_out ;
  always @(*) begin
    if(data_in[0] == 1)
       data_out  = (data_in[0:7] << 1) ^ 8'h1b;
    else
       data_out = (data_in[0:7] << 1);
  end
endmodule

module mux_9(data_in,data_out);
  input[0:7] data_in;
  output [0:7]data_out;
  wire [0:7]temp ,temp1,temp2;
  
  mux_2 m1(data_in,temp);
  mux_2 m2(temp,temp1);
  mux_2 m3(temp1,temp2);
  assign data_out =data_in^temp2;
  
endmodule
module mux_11(data_in,data_out);
   input[0:7] data_in;
  output [0:7]data_out;
  wire [0:7] temp,temp1,temp2,temp3;
  
  mux_2 m1(data_in,temp);
  mux_2 m2(temp,temp1);
  assign temp2=temp1^data_in;
  mux_2 m3 (temp2,temp3);
  assign data_out=data_in^temp3;
endmodule

module mux_3(data_in,data_out );
  input[0:7] data_in;
  output [0:7]data_out;
  wire [0:7] temp;
  mux_2 m1(data_in,temp);
  assign data_out =data_in^temp;
endmodule

module mux_13(data_in,data_out);
   input[0:7] data_in;
  output [0:7]data_out;
  wire [0:7] temp,temp1,temp2,temp3;
  
  mux_2 m1(data_in,temp);
   assign temp1=temp^data_in;
  mux_2 m2(temp1,temp2);
 
  mux_2 m3 (temp2,temp3);
  assign data_out=data_in^temp3;
endmodule

module mux_14(data_in,data_out);
   input[0:7] data_in;
  output [0:7]data_out;
  wire [0:7] temp,temp1,temp2,temp3;
  
  mux_2 m1(data_in,temp);
   assign temp1=temp^data_in;
  mux_2 m2(temp1,temp2);
 assign temp3=temp2^data_in;
  mux_2 m3 (temp3,data_out);
  
endmodule

