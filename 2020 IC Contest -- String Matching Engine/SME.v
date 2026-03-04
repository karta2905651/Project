module SME(clk,
           reset,
           chardata,
           isstring,
           ispattern,
           valid,
           match,
           match_index);
input clk;
input reset;
input [7:0] chardata;
input isstring;
input ispattern;
output reg match;
output reg [4:0] match_index;
output reg valid;
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
reg [271:0] string_reg , pattern_reg;
reg [5:0] string_cout , pattern_cout , pattern_cout_reg , cout ;
reg isstring_reg , ispattern_reg ;

reg [33:0] match_reg , mi_reg ;
reg [5:0] match_num ;

wire [8:0] string_shift , pattern_shift ;
wire [5:0] match_index_w ;
wire ok ;

integer i ;

// FSM
reg [2:0] state , next_state ;
parameter access = 3'd0 , shift = 3'd1 , word_compare = 3'd2 , wordshift = 3'd3 , decide = 3'd4 ;

always@(*)
begin
    case (state)
        access :
            next_state = ((isstring == 1'b0) && (ispattern == 1'b0)) ? shift : access ;
        shift :
            if ((mi_reg != 34'd0) && (ispattern_reg))
            begin
                next_state = (pattern_cout == 6'd33) ? word_compare : shift ;
            end
            else
            begin
                next_state = word_compare ;
            end
        word_compare :
            if (mi_reg == 34'd0)
            begin
                next_state = ((match_num == pattern_cout) || (cout == pattern_cout)) ? decide : word_compare ;
            end
            else
            begin
                next_state = ((match_num == pattern_cout) || ((cout == pattern_cout) && (pattern_cout == (pattern_cout_reg - 6'd1)))) ? decide :
                    ((cout == pattern_cout) && (pattern_cout <= 6'd34)) ? wordshift : word_compare ;
            end
        wordshift :
            next_state = shift ;
        decide:
            next_state = access ;
        default :
            next_state = access ;
    endcase
end

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        state <= access ;
    end
    else
    begin
        state <= next_state ;
    end
end



// string_reg
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        string_reg <= 272'd0 ;
    end
    else
    begin
        if (state == access)
        begin
            if (isstring)
            begin
                string_reg[7:0] <= string_reg[15:8] ;
                string_reg[15:8] <= string_reg[23:16] ;
                string_reg[23:16] <= string_reg[31:24] ;
                string_reg[31:24] <= string_reg[39:32] ;
                string_reg[39:32] <= string_reg[47:40] ;
                string_reg[47:40] <= string_reg[55:48] ;
                string_reg[55:48] <= string_reg[63:56] ;
                string_reg[63:56] <= string_reg[71:64] ;
                string_reg[71:64] <= string_reg[79:72] ;
                string_reg[79:72] <= string_reg[87:80] ;
                string_reg[87:80] <= string_reg[95:88] ;
                string_reg[95:88] <= string_reg[103:96] ;
                string_reg[103:96] <= string_reg[111:104] ;
                string_reg[111:104] <= string_reg[119:112] ;
                string_reg[119:112] <= string_reg[127:120] ;
                string_reg[127:120] <= string_reg[135:128] ;
                string_reg[135:128] <= string_reg[143:136] ;
                string_reg[143:136] <= string_reg[151:144] ;
                string_reg[151:144] <= string_reg[159:152] ;
                string_reg[159:152] <= string_reg[167:160] ;
                string_reg[167:160] <= string_reg[175:168] ;
                string_reg[175:168] <= string_reg[183:176] ;
                string_reg[183:176] <= string_reg[191:184] ;
                string_reg[191:184] <= string_reg[199:192] ;
                string_reg[199:192] <= string_reg[207:200] ;
                string_reg[207:200] <= string_reg[215:208] ;
                string_reg[215:208] <= string_reg[223:216] ;
                string_reg[223:216] <= string_reg[231:224] ;
                string_reg[231:224] <= string_reg[239:232] ;
                string_reg[239:232] <= string_reg[247:240] ;
                string_reg[247:240] <= string_reg[255:248] ;
                string_reg[255:248] <= string_reg[263:256] ;
                string_reg[263:256] <= chardata ;
                string_reg[271:264] <= 8'd0 ;
            end
            else
            begin
                string_reg <= string_reg ;
            end
        end
        else if (state == shift)
        begin
            string_reg <= (isstring_reg) ? (string_reg >> string_shift) : string_reg ;
        end
        else
        begin
            string_reg <= string_reg ;
        end
    end
end


assign string_shift = (string_cout == 6'd32) ? 9'd0 : {(6'd32 - string_cout) , 3'd0} ;


// string_cout
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        string_cout <= 6'd0 ;
    end
    else
    begin
        if (state == access)
        begin
            if (isstring)
            begin
                string_cout <= string_cout + 6'd1 ;
            end
            else
            begin
                string_cout <= (ispattern && (~isstring_reg)) ? cout : string_cout ;
            end
        end
        else if (state == decide)
        begin
            string_cout <= 6'd0 ;
        end
        else
        begin
            string_cout <= string_cout ;
        end
    end
end


// match_reg
always @(*)
begin
    for (i=0 ; i<=33 ; i=i+1)
    begin
        if ((string_reg[(i*8) +: 8] == 8'd0) && (pattern_reg[(i*8) +: 8] == 8'd0))
        begin
            match_reg[i] = 1'b0 ;
        end
        else
        begin
            if (pattern_reg[(i*8) +: 8] == 8'd46)
            begin
                match_reg[i] = (string_reg[(i*8) +: 8] == 8'd0) ? 1'b0 : 1'b1 ;
            end
            else if ((pattern_reg[(i*8) +: 8] == 8'd36) || (pattern_reg[(i*8) +: 8] == 8'd94))
            begin
                match_reg[i] = ((string_reg[(i*8) +: 8] == 8'd0) || (string_reg[(i*8) +: 8] == 8'd32)) ? 1'b1 : 1'b0 ;
            end
            else if (pattern_reg[(i*8) +: 8] == 8'd42)
            begin
                match_reg[i] = (string_reg[(i*8) +: 8] == 8'd0) ? 1'b0 : 1'b1 ;
            end
            else
            begin
                match_reg[i] = ((string_reg[(i*8) +: 8] == pattern_reg[(i*8) +: 8])) ? 1'b1 : 1'b0 ;
            end
        end
    end
end


// mi_reg
always @(*)
begin
    for (i=0 ; i<=33 ; i=i+1)
    begin
        mi_reg[i] = (pattern_reg[(i*8) +: 8] == 8'd42) ? 1'b1 : 1'b0 ;
    end
end


// match_num
always @(*)
begin
    match_num = 0 ;
    for (i = 0; i <= 33; i = i + 1)
    begin
        match_num = match_num + match_reg[i] ;
    end
end


// isstring_reg
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        isstring_reg <= 1'b0 ;
    end
    else
    begin
        if (state == access)
        begin
            isstring_reg <= (isstring) ? 1'b1 : isstring_reg ;
        end
        else
        begin
            isstring_reg <= 1'b0 ;
        end
    end
end



// pattern_reg
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        pattern_reg <= 272'd0 ;
    end
    else
    begin
        if (state == access)
        begin
            if (ispattern)
            begin
                pattern_reg[7:0] <= pattern_reg[15:8];
                pattern_reg[15:8] <= pattern_reg[23:16];
                pattern_reg[23:16] <= pattern_reg[31:24];
                pattern_reg[31:24] <= pattern_reg[39:32];
                pattern_reg[39:32] <= pattern_reg[47:40];
                pattern_reg[47:40] <= pattern_reg[55:48];
                pattern_reg[55:48] <= pattern_reg[63:56];
                pattern_reg[63:56] <= pattern_reg[71:64];
                pattern_reg[71:64] <= pattern_reg[79:72];
                pattern_reg[79:72] <= pattern_reg[87:80];
                pattern_reg[87:80] <= pattern_reg[95:88];
                pattern_reg[95:88] <= pattern_reg[103:96];
                pattern_reg[103:96] <= pattern_reg[111:104];
                pattern_reg[111:104] <= pattern_reg[119:112];
                pattern_reg[119:112] <= pattern_reg[127:120];
                pattern_reg[127:120] <= pattern_reg[135:128];
                pattern_reg[135:128] <= pattern_reg[143:136];
                pattern_reg[143:136] <= pattern_reg[151:144];
                pattern_reg[151:144] <= pattern_reg[159:152];
                pattern_reg[159:152] <= pattern_reg[167:160];
                pattern_reg[167:160] <= pattern_reg[175:168];
                pattern_reg[175:168] <= pattern_reg[183:176];
                pattern_reg[183:176] <= pattern_reg[191:184];
                pattern_reg[191:184] <= pattern_reg[199:192];
                pattern_reg[199:192] <= pattern_reg[207:200];
                pattern_reg[207:200] <= pattern_reg[215:208];
                pattern_reg[215:208] <= pattern_reg[223:216];
                pattern_reg[223:216] <= pattern_reg[231:224];
                pattern_reg[231:224] <= pattern_reg[239:232];
                pattern_reg[239:232] <= pattern_reg[247:240];
                pattern_reg[247:240] <= pattern_reg[255:248];
                pattern_reg[255:248] <= pattern_reg[263:256];
                pattern_reg[263:256] <= pattern_reg[271:264] ;
                pattern_reg[271:264] <= chardata ;
            end
            else
            begin
                pattern_reg <= pattern_reg ;
            end
        end
        else if (state == shift)
        begin
            if (mi_reg != 34'd0)
            begin
                if (ispattern_reg)
                begin
                    pattern_reg <= (mi_reg[33]) ? {8'd42 , pattern_reg[271:8]} :
                                (mi_reg[32]) ? {pattern_reg[271:264] , 8'd42 , pattern_reg[263:8]} :
                                (mi_reg[31]) ? {pattern_reg[271:256] , 8'd42 , pattern_reg[255:8]} :
                                (mi_reg[30]) ? {pattern_reg[271:248] , 8'd42 , pattern_reg[247:8]} :
                                (mi_reg[29]) ? {pattern_reg[271:240] , 8'd42 , pattern_reg[239:8]} :
                                (mi_reg[28]) ? {pattern_reg[271:232] , 8'd42 , pattern_reg[231:8]} :
                                (mi_reg[27]) ? {pattern_reg[271:224] , 8'd42 , pattern_reg[223:8]} :
                                (mi_reg[26]) ? {pattern_reg[271:216] , 8'd42 , pattern_reg[215:8]} :
                                (mi_reg[25]) ? {pattern_reg[271:208] , 8'd42 , pattern_reg[207:8]} :
                                (mi_reg[24]) ? {pattern_reg[271:200] , 8'd42 , pattern_reg[199:8]} :
                                (mi_reg[23]) ? {pattern_reg[271:192] , 8'd42 , pattern_reg[191:8]} :
                                (mi_reg[22]) ? {pattern_reg[271:184] , 8'd42 , pattern_reg[183:8]} :
                                (mi_reg[21]) ? {pattern_reg[271:176] , 8'd42 , pattern_reg[175:8]} :
                                (mi_reg[20]) ? {pattern_reg[271:168] , 8'd42 , pattern_reg[167:8]} :
                                (mi_reg[19]) ? {pattern_reg[271:160] , 8'd42 , pattern_reg[159:8]} :
                                (mi_reg[18]) ? {pattern_reg[271:152] , 8'd42 , pattern_reg[151:8]} :
                                (mi_reg[17]) ? {pattern_reg[271:144] , 8'd42 , pattern_reg[143:8]} :
                                (mi_reg[16]) ? {pattern_reg[271:136] , 8'd42 , pattern_reg[135:8]} :
                                (mi_reg[15]) ? {pattern_reg[271:128] , 8'd42 , pattern_reg[127:8]} :
                                (mi_reg[14]) ? {pattern_reg[271:120] , 8'd42 , pattern_reg[119:8]} :
                                (mi_reg[13]) ? {pattern_reg[271:112] , 8'd42 , pattern_reg[111:8]} :
                                (mi_reg[12]) ? {pattern_reg[271:104] , 8'd42 , pattern_reg[103:8]} :
                                (mi_reg[11]) ? {pattern_reg[271:96] , 8'd42 , pattern_reg[95:8]} :
                                (mi_reg[10]) ? {pattern_reg[271:88] , 8'd42 , pattern_reg[87:8]} :
                                (mi_reg[9]) ? {pattern_reg[271:80] , 8'd42 , pattern_reg[79:8]} :
                                (mi_reg[8]) ? {pattern_reg[271:72] , 8'd42 , pattern_reg[71:8]} :
                                (mi_reg[7]) ? {pattern_reg[271:64] , 8'd42 , pattern_reg[63:8]} :
                                (mi_reg[6]) ? {pattern_reg[271:56] , 8'd42 , pattern_reg[55:8]} :
                                (mi_reg[5]) ? {pattern_reg[271:48] , 8'd42 , pattern_reg[47:8]} :
                                (mi_reg[4]) ? {pattern_reg[271:40] , 8'd42 , pattern_reg[39:8]} :
                                (mi_reg[3]) ? {pattern_reg[271:32] , 8'd42 , pattern_reg[31:8]} :
                                (mi_reg[2]) ? {pattern_reg[271:24] , 8'd42 , pattern_reg[23:8]} :
                                (mi_reg[1]) ? {pattern_reg[271:16] , 8'd42 , pattern_reg[15:8]} :
                                (mi_reg[0]) ? {pattern_reg[271:8] , 8'd42} : pattern_reg ;
                end
                else
                begin
                    pattern_reg <= pattern_reg >> pattern_shift ;
                end
            end
            else
            begin
                pattern_reg <= pattern_reg >> pattern_shift ;
            end
        end
        else if (state == word_compare)
        begin
            pattern_reg <= ((match_num == pattern_cout) || (cout == pattern_cout)) ? pattern_reg : pattern_reg << 8 ;
        end
        else if (state == wordshift)
        begin
            pattern_reg <= (mi_reg[33]) ? pattern_reg << 8 :
                        (mi_reg[32]) ? { pattern_reg[271:264] , pattern_reg[263:0] << 8 } :
                        (mi_reg[31]) ? { pattern_reg[271:256] , pattern_reg[255:0] << 8 } :
                        (mi_reg[30]) ? { pattern_reg[271:248] , pattern_reg[247:0] << 8 } :
                        (mi_reg[29]) ? { pattern_reg[271:240] , pattern_reg[239:0] << 8 } :
                        (mi_reg[28]) ? { pattern_reg[271:232] , pattern_reg[231:0] << 8 } :
                        (mi_reg[27]) ? { pattern_reg[271:224] , pattern_reg[223:0] << 8 } :
                        (mi_reg[26]) ? { pattern_reg[271:216] , pattern_reg[215:0] << 8 } :
                        (mi_reg[25]) ? { pattern_reg[271:208] , pattern_reg[207:0] << 8 } :
                        (mi_reg[24]) ? { pattern_reg[271:200] , pattern_reg[199:0] << 8 } :
                        (mi_reg[23]) ? { pattern_reg[271:192] , pattern_reg[191:0] << 8 } :
                        (mi_reg[22]) ? { pattern_reg[271:184] , pattern_reg[183:0] << 8 } :
                        (mi_reg[21]) ? { pattern_reg[271:176] , pattern_reg[175:0] << 8 } :
                        (mi_reg[20]) ? { pattern_reg[271:168] , pattern_reg[167:0] << 8 } :
                        (mi_reg[19]) ? { pattern_reg[271:160] , pattern_reg[159:0] << 8 } :
                        (mi_reg[18]) ? { pattern_reg[271:152] , pattern_reg[151:0] << 8 } :
                        (mi_reg[17]) ? { pattern_reg[271:144] , pattern_reg[143:0] << 8 } :
                        (mi_reg[16]) ? { pattern_reg[271:136] , pattern_reg[135:0] << 8 } :
                        (mi_reg[15]) ? { pattern_reg[271:128] , pattern_reg[127:0] << 8 } :
                        (mi_reg[14]) ? { pattern_reg[271:120] , pattern_reg[119:0] << 8 } :
                        (mi_reg[13]) ? { pattern_reg[271:112] , pattern_reg[111:0] << 8 } :
                        (mi_reg[12]) ? { pattern_reg[271:104] , pattern_reg[103:0] << 8 } :
                        (mi_reg[11]) ? { pattern_reg[271:96] , pattern_reg[95:0] << 8 } :
                        (mi_reg[10]) ? { pattern_reg[271:88] , pattern_reg[87:0] << 8 } :
                        (mi_reg[9]) ? { pattern_reg[271:80] , pattern_reg[79:0] << 8 } :
                        (mi_reg[8]) ? { pattern_reg[271:72] , pattern_reg[71:0] << 8 } :
                        (mi_reg[7]) ? { pattern_reg[271:64] , pattern_reg[63:0] << 8 } :
                        (mi_reg[6]) ? { pattern_reg[271:56] , pattern_reg[55:0] << 8 } :
                        (mi_reg[5]) ? { pattern_reg[271:48] , pattern_reg[47:0] << 8 } :
                        (mi_reg[4]) ? { pattern_reg[271:40] , pattern_reg[39:0] << 8 } :
                        (mi_reg[3]) ? { pattern_reg[271:32] , pattern_reg[31:0] << 8 } :
                        (mi_reg[2]) ? { pattern_reg[271:24] , pattern_reg[23:0] << 8 } :
                        (mi_reg[1]) ? { pattern_reg[271:16] , pattern_reg[15:0] << 8 } :
                        (mi_reg[0]) ? { pattern_reg[271:8] , pattern_reg[7:0] << 8 } : pattern_reg ;
        end
        else if (state == decide)
        begin
            pattern_reg <= 256'd0 ;
        end
        else
        begin
            pattern_reg <= pattern_reg ;
        end
    end
end



// pattern_cout
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        pattern_cout <= 6'd0 ;
    end
    else
    begin
        if (state == access)
        begin
            if (ispattern)
            begin
                pattern_cout <= pattern_cout + 6'd1 ;
            end
            else
            begin
                pattern_cout <= pattern_cout ;
            end
        end
        else if (state == shift)
        begin
            if (mi_reg != 34'd0)
            begin
                if (ispattern_reg)
                begin
                    pattern_cout <= pattern_cout + 6'd1 ;
                end
                else
                begin
                    pattern_cout <= pattern_cout ;
                end
            end
            else
            begin
                pattern_cout <= pattern_cout ;
            end
        end
        else if (state == wordshift)
        begin
            pattern_cout <= pattern_cout - 6'd1 ;
        end
        else if (state == decide)
        begin
            pattern_cout <= 6'd0 ;
        end
        else
        begin
            pattern_cout <= pattern_cout ;
        end
    end
end


// pattern_cout_reg
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        pattern_cout_reg <= 6'd0 ;
    end
    else
    begin
        if (state == access)
        begin
            pattern_cout_reg <= pattern_cout ;
        end
        else
        begin
            pattern_cout_reg <= pattern_cout_reg ;
        end
    end
end


assign pattern_shift = {(6'd34 - pattern_cout) , 3'd0} ;


// ispattern_reg
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        ispattern_reg <= 1'b0 ;
    end
    else
    begin
        if (state == access)
        begin
            ispattern_reg <= (ispattern) ? 1'b1 : ispattern_reg ;
        end
        else if (state == shift)
        begin
            ispattern_reg <= ispattern_reg ;
        end
        else
        begin
            ispattern_reg <= 1'b0 ;
        end
    end
end


// cout
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        cout <= 6'd0 ;
    end
    else
    begin
        if (state == word_compare)
        begin
            if (pattern_reg[7:0] == 8'd94)
            begin
                cout <= ((match_num == pattern_cout) || (cout == pattern_cout)) ? cout - 6'd1  : cout - 6'd2 ;
            end
            else
            begin
                cout <= ((match_num == pattern_cout) || (cout == pattern_cout)) ? cout : cout - 6'd1 ;
            end
        end
        else if (state == shift)
        begin
            cout <= 6'd34 ;
        end
        else if (state == decide)
        begin
            cout <= string_cout ;
        end
        else
        begin
            cout <= cout ;
        end
    end
end


// valid
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        valid <= 1'b0 ;
    end
    else
    begin
        if (state == decide)
        begin
            valid <= 1'b1 ;
        end
        else
        begin
            valid <= 1'b0 ;
        end
    end
end


// match
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        match <= 1'b0 ;
    end
    else
    begin
        if (state == decide)
        begin
            match <= (match_num == pattern_cout) ? 1'b1 : 1'b0 ;
        end
        else
        begin
            match <= 1'b0 ;
        end
    end
end


assign match_index_w = 6'd33 - cout ;


// match_index
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        match_index <= 5'd0 ;
    end
    else
    begin
        if (state == decide)
        begin
            match_index <= match_index_w[4:0] ;
        end
        else
        begin
            match_index <= 5'd0 ;
        end
    end
end

endmodule
