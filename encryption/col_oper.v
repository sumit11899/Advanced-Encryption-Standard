module col_oper(input[0:31] i, output reg[0:31] o);

reg [0:7] c0, c1, c2, c3;
reg [0:7] a0, a1, a2, a3;




always @ (*)
    begin
        a0[0:7] = i[0:7];
        a1[0:7] = i[8:15];
        a2[0:7] = i[16:23];
        a3[0:7] = i[24:31];
        
    if(a0[0] == 1)
       c0  = (a0 << 1) ^ 8'h1b;
    else
       c0 = (a0[0:7] << 1);

    if(a1[0] == 1)
        c1  = (a1[0:7] << 1) ^ 8'h1b;
    else
        c1 = (a1[0:7] << 1);

    if(a2[0] == 1)
        c2  = (a2[0:7] << 1) ^ 8'h1b;
    else
        c2 = (a2[0:7] << 1);

    if(a3[0] == 1)
        c3  = (a3[0:7] << 1) ^ 8'h1b;
    else
        c3 = (a3[0:7] << 1);

    end

always @ (*)

    begin
        
    o[0:7] = c0 ^ c1 ^ a1 ^ a2 ^ a3;
    o[8:15] = a0 ^ c1 ^ c2 ^ a2 ^ a3;
    o[16:23] = a0 ^ a1 ^ c2 ^ c3 ^ a3;
    o[24:31] = a0 ^ c0 ^ a1 ^ a2 ^ c3;

    end

endmodule
