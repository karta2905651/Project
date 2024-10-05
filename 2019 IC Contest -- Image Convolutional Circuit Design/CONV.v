module  CONV(clk, reset, busy, ready, iaddr, idata, cwr, caddr_wr, cdata_wr, crd, caddr_rd, cdata_rd, csel);
input		  clk;
input		  reset;
input         ready;
input [19:0] cdata_rd;
input signed [19:0] idata;
output reg busy;
output reg cwr;
output reg crd;
output reg [11:0] iaddr;
output reg [11:0] caddr_wr;
output reg [19:0] cdata_wr;
output reg [11:0] caddr_rd;
output reg [2:0] csel;


parameter Layer_0 = 2'd0 , Max_pooling = 2'd1 , Flatten = 2'd2 , done = 2'd3 ;
parameter access = 1'b0 , dealing = 1'b1 ;


wire signed [19:0] LU , CU , RU , LC , CC , RC , LD , CD , RD  ;
wire signed [39:0] bias ;


reg got_it , process , process_delay , kernal0_1 , OK;
reg signed [39:0] conv_value ;
reg signed [19:0] ninepixel , idata_reg ;
reg signed [39:0] bias_0 ;
reg [11:0] iaddr_delay ;
reg [1:0] next_state , state ;
reg [5:0] row , col;



/////////////////////////////////////// FSM

always @(*)
begin

    case(state)
        Layer_0 :
            next_state = (OK) ? Max_pooling : Layer_0;
        Max_pooling :
            next_state = (OK) ? Flatten : Max_pooling ;
        Flatten :
            next_state = (OK) ? done : Flatten ;
        done :
            next_state = (OK) ? done : done ;
    endcase

end

always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        state <= Layer_0 ;
    end
    else
    begin
        state <= next_state ;
    end

end

//////////////////////////////////////////////



////// kernal0_1
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        kernal0_1 <= 1'b0 ;
    end
    else
    begin


        if (state == Layer_0)
        begin

            if (process == dealing)
            begin

                if (OK)
                begin
                    kernal0_1 <= 1'b0 ;
                end
                else
                begin
                    kernal0_1 <= (({row , col} == {6'd63 , 6'd63}) && (got_it == 1'b1)) ? 1'b1 : kernal0_1 ;
                end

            end
            else
            begin
                kernal0_1 <= kernal0_1 ;
            end

        end
        else if (state == Max_pooling)
        begin

            if (process == dealing)
            begin

                if (OK)
                begin
                    kernal0_1 <= 1'b0 ;
                end
                else
                begin
                    kernal0_1 <= (({row , col} == {6'd62 , 6'd62}) && (got_it == 1'b1)) ? 1'b1 : kernal0_1 ;
                end

            end
            else
            begin
                kernal0_1 <= kernal0_1 ;
            end

        end
        else if (state == Flatten)
        begin

            if (process == dealing)
            begin
                kernal0_1 <= (caddr_rd == 12'd1023) ? 1'b1 : kernal0_1 ;
            end
            else
            begin
                kernal0_1 <= kernal0_1 ;
            end

        end
        else
        begin
            kernal0_1 <= 1'b0 ;
        end

    end

end



///// 九宮格


assign  LU = (kernal0_1) ? 20'hFDB55 : 20'h0A89E ;
assign  CU = (kernal0_1) ? 20'h02992 : 20'h092D5 ;
assign  RU = (kernal0_1) ? 20'hFC994 : 20'h06D43 ;
assign  LC = (kernal0_1) ? 20'h050FD : 20'h01004 ;
assign  CC = (kernal0_1) ? 20'h02F20 : 20'hF8F71 ;
assign  RC = (kernal0_1) ? 20'h0202D : 20'hF6E54 ;
assign  LD = (kernal0_1) ? 20'h03BD7 : 20'hFA6D7 ;
assign  CD = (kernal0_1) ? 20'hFD369 : 20'hFC834 ;
assign  RD = (kernal0_1) ? 20'h05E68 : 20'hFAC19 ;
assign  bias = (kernal0_1) ? {4'hF , 20'hF7295 , 16'h0} : {4'h0 , 20'h01310 , 16'h0} ;




// idata_reg
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        idata_reg <= 20'd0 ;
    end
    else
    begin
        idata_reg <= (busy) ? idata : 1'b0 ;
    end
end


// iaddr_delay
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        iaddr_delay <= 12'd0 ;
    end
    else
    begin
        iaddr_delay <= iaddr ;
    end

end

// process_delay
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        process_delay <= 12'd0 ;
    end
    else
    begin
        process_delay <= process ;
    end

end

////// process
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        process <= access ;
    end
    else
    begin

        if (busy)
        begin

            if ((state == Layer_0) || (state == Max_pooling) || (state == Flatten))
            begin

                if (process == access)
                begin
                    process <= (got_it) ? dealing : process ;
                end
                else if (process == dealing)
                begin
                    process <= (got_it) ? access : process ;
                end
                else
                begin
                    process <= process ;
                end

            end
            else
            begin
                process <= process ;
            end

        end
        else
        begin
            process <= process ;
        end

    end
end



///// busy
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        busy <= 1'b0 ;
    end
    else
    begin

        if (ready==1'b1)
        begin
            busy <= 1'b1 ;
        end
        else
        begin

            if (state == done)
            begin
                busy <= 1'b0 ;
            end
            else
            begin
                busy <= busy ;
            end

        end

    end
end



///// col,row
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        col <= 6'd0 ;
        row <= 6'd0 ;
    end
    else
    begin

        case(state)

            Layer_0 :
            begin
                if (process == dealing)
                begin

                    if (got_it)
                    begin

                        if (row <= 6'd63)
                        begin

                            if (col < 6'd63)
                            begin
                                col <= col + 6'd1 ;
                                row <= row ;
                            end
                            else
                            begin
                                col <= 6'd0 ;
                                row <= row + 6'd1 ;
                            end

                        end
                        else
                        begin
                            col <= 6'd0 ;
                            row <= 6'd0 ;
                        end

                    end
                    else
                    begin
                        col <= col ;
                        row <= row ;
                    end

                end
                else
                begin
                    col <= col ;
                    row <= row ;
                end
            end

            Max_pooling :
            begin

                if (process == dealing)
                begin

                    if (got_it)
                    begin

                        if (row <= 6'd62)
                        begin

                            if (col < 6'd62)
                            begin
                                col <= col + 6'd2 ;
                                row <= row ;
                            end
                            else
                            begin
                                col <= 6'd0 ;
                                row <= row + 6'd2 ;
                            end

                        end
                        else
                        begin
                            col <= 6'd0 ;
                            row <= 6'd0 ;
                        end

                    end
                    else
                    begin
                        col <= col ;
                        row <= row ;
                    end

                end
                else
                begin
                    col <= col ;
                    row <= row ;
                end

            end

            Flatten :
            begin

                col <= 6'd0 ;
                row <= 6'd0 ;

            end

            done :
            begin

                col <= 6'd0 ;
                row <= 6'd0 ;

            end


        endcase

    end

end


////// OK
always @(*)
begin

    case(state)
        Layer_0 :
            OK = ((process == dealing) && ({got_it , kernal0_1} == {1'b1 , 1'b1}) && ({row , col} == {6'd63 , 6'd63})) ? 1'b1 : 1'b0 ;
        Max_pooling :
            OK = ((process == dealing) && ({got_it , kernal0_1} == {1'b1 , 1'b1}) && ({row , col} == {6'd62 , 6'd62})) ? 1'b1 : 1'b0 ;
        Flatten :
            OK = ((process == dealing) && (kernal0_1 == 1'b1) && (caddr_rd == 12'd1023)) ? 1'b1 : 1'b0 ;
        done :
            OK = 1'b0 ;
    endcase

end



/////// got_it
always @(*)
begin

    if (state == Layer_0)
    begin

        if (process == access)
        begin

            if (row == 6'd0)
            begin

                if (col == 6'd0)
                begin

                    if (iaddr == {row+6'd1 , col+6'd1})
                    begin
                        got_it = 1'b1 ;
                    end
                    else
                    begin
                        got_it = 1'b0 ;
                    end

                end
                else if (col == 6'd63)
                begin

                    if (iaddr == {row+6'd1 , col})
                    begin
                        got_it = 1'b1 ;
                    end
                    else
                    begin
                        got_it = 1'b0;
                    end

                end
                else
                begin

                    if (iaddr == {row+6'd1 , col+6'd1})
                    begin
                        got_it = 1'b1 ;
                    end
                    else
                    begin
                        got_it = 1'b0 ;
                    end

                end

            end
            else if (row == 6'd63)
            begin

                if (col == 6'd0)
                begin

                    if (iaddr == {row , col+6'd1})
                    begin
                        got_it = 1'b1 ;
                    end
                    else
                    begin
                        got_it = 1'b0 ;
                    end

                end
                else if (col == 6'd63)
                begin

                    if (iaddr == {row , col})
                    begin
                        got_it = 1'b1 ;
                    end
                    else
                    begin
                        got_it = 1'b0 ;
                    end

                end
                else
                begin
                    if (iaddr == {row , col+6'd1})
                    begin
                        got_it = 1'b1 ;
                    end
                    else
                    begin
                        got_it = 1'b0 ;
                    end

                end

            end
            else
            begin

                if (col == 6'd0)
                begin

                    if (iaddr == {row+6'd1 , col+6'd1})
                    begin
                        got_it = 1'b1 ;
                    end
                    else
                    begin
                        got_it = 1'b0 ;
                    end

                end
                else if (col == 6'd63)
                begin

                    if (iaddr == {row+6'd1 , col})
                    begin
                        got_it = 1'b1 ;
                    end
                    else
                    begin
                        got_it = 1'b0 ;
                    end

                end
                else
                begin

                    if (iaddr == {row+6'd1 , col+6'd1})
                    begin
                        got_it = 1'b1 ;
                    end
                    else
                    begin
                        got_it = 1'b0 ;
                    end

                end

            end

        end
        else
        begin
            got_it = (iaddr == iaddr_delay) ? 1'b1 : 1'b0 ;
        end

    end
    else if (state == Max_pooling)
    begin

        if (process == access)
        begin

            if (caddr_rd == {row+6'd1 , col+6'd1})
            begin
                got_it = 1'b1 ;
            end
            else
            begin
                got_it = 1'b0 ;
            end

        end
        else
        begin
            got_it = 1'b1 ;
        end

    end
    else if (state == Flatten)
    begin
        got_it = 1'b1 ;
    end
    else
    begin
        got_it = 1'b0 ;
    end

end



// conv_value
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        conv_value <= 40'd0 ;
    end
    else
    begin

        if (busy)
        begin

            if (state ==  Layer_0)
            begin

                if ((process == dealing) && (got_it == 1'b1))
                begin
                    conv_value <= 40'd0 ;
                end
                else
                begin
                    conv_value <= conv_value + bias_0 + (idata_reg * ninepixel) ;
                end

            end
            else if (state == Max_pooling)
            begin

                if (process == access)
                begin

                    if (caddr_rd == {row , col})
                    begin

                        conv_value <= {20'd0 , cdata_rd} ;

                    end
                    else
                    begin

                        conv_value <= ({20'd0 , cdata_rd} > conv_value) ? {20'd0 , cdata_rd} : conv_value ;

                    end

                end
                else
                begin

                    conv_value <= 40'd0 ;

                end

            end
            else
            begin

                conv_value <= 40'd0 ;

            end

        end
        else
        begin

            conv_value <= 40'd0 ;

        end

    end

end



///// iaddr
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        iaddr <= 12'd0 ;
    end
    else
    begin

        if (busy)
        begin

            if (state ==  Layer_0)
            begin

                if (process == access)
                begin

                    if (row == 6'd0)
                    begin

                        if (col == 6'd0)
                        begin

                            if (iaddr == {row , col})
                            begin
                                iaddr <= {row , col+6'd1} ;
                            end
                            else if (iaddr == {row , col+6'd1})
                            begin
                                iaddr <= {row+6'd1 , col} ;
                            end
                            else if (iaddr == {row+6'd1 , col})
                            begin
                                iaddr <= {row+6'd1 , col+6'd1} ;
                            end
                            else
                            begin
                                iaddr <= {row , col};
                            end

                        end
                        else if (col == 6'd63)
                        begin

                            if (iaddr == {row , col-6'd1})
                            begin
                                iaddr <= {row , col} ;
                            end
                            else if (iaddr == {row , col})
                            begin
                                iaddr <= {row+6'd1 , col-6'd1} ;
                            end
                            else if (iaddr == {row+6'd1 , col-6'd1})
                            begin
                                iaddr <= {row+6'd1 , col} ;
                            end
                            else
                            begin
                                iaddr <= {row , 6'd0} ;
                            end

                        end
                        else
                        begin

                            if (iaddr == {row , col-6'd1})
                            begin
                                iaddr <= {row , col} ;
                            end
                            else if (iaddr == {row , col})
                            begin
                                iaddr <= {row , col+6'd1} ;
                            end
                            else if (iaddr == {row , col+6'd1})
                            begin
                                iaddr <= {row+6'd1 , col-6'd1} ;
                            end
                            else if (iaddr == {row+6'd1 , col-6'd1})
                            begin
                                iaddr <= {row+6'd1 , col} ;
                            end
                            else if (iaddr == {row+6'd1 , col})
                            begin
                                iaddr <= {row+6'd1 , col+6'd1} ;
                            end
                            else
                            begin
                                iaddr <= {row , col} ;
                            end

                        end

                    end
                    else if (row == 6'd63)
                    begin

                        if (col == 6'd0)
                        begin

                            if (iaddr == {row-6'd1 , col})
                            begin
                                iaddr <= {row-6'd1 , col+6'd1} ;
                            end
                            else if (iaddr == {row-6'd1 , col+6'd1})
                            begin
                                iaddr <= {row , col} ;
                            end
                            else if (iaddr == {row , col})
                            begin
                                iaddr <= {row , col+6'd1} ;
                            end
                            else
                            begin
                                iaddr <= {row-6'd1 , col} ;
                            end

                        end
                        else if (col == 6'd63)
                        begin

                            if (iaddr == {row-6'd1 , col-6'd1})
                            begin
                                iaddr <= {row-6'd1 , col} ;
                            end
                            else if (iaddr == {row-6'd1 , col})
                            begin
                                iaddr <= {row , col-6'd1} ;
                            end
                            else if (iaddr == {row , col-6'd1})
                            begin
                                iaddr <= {row , col} ;
                            end
                            else
                            begin
                                iaddr <= {row+6'd1 , col+6'd1} ;
                            end

                        end
                        else
                        begin

                            if (iaddr == {row-6'd1 , col-6'd1})
                            begin
                                iaddr <= {row-6'd1 , col} ;
                            end
                            else if (iaddr == {row-6'd1 , col})
                            begin
                                iaddr <= {row-6'd1 , col+6'd1} ;
                            end
                            else if (iaddr == {row-6'd1 , col+6'd1})
                            begin
                                iaddr <= {row , col-6'd1} ;
                            end
                            else if (iaddr == {row , col-6'd1})
                            begin
                                iaddr <= {row , col} ;
                            end
                            else if (iaddr == {row , col})
                            begin
                                iaddr <= {row , col+6'd1} ;
                            end
                            else
                            begin
                                iaddr <= {row-6'd1 , col} ;
                            end

                        end

                    end
                    else
                    begin

                        if (col == 6'd0)
                        begin

                            if (iaddr == {row-6'd1 , col})
                            begin
                                iaddr <= {row-6'd1 , col+6'd1} ;
                            end
                            else if (iaddr == {row-6'd1 , col+6'd1})
                            begin
                                iaddr <= {row , col} ;
                            end
                            else if (iaddr == {row , col})
                            begin
                                iaddr <= {row , col+6'd1} ;
                            end
                            else if (iaddr == {row , col+6'd1})
                            begin
                                iaddr <= {row+6'd1 , col} ;
                            end
                            else if (iaddr == {row+6'd1 , col})
                            begin
                                iaddr <= {row+6'd1 , col+6'd1} ;
                            end
                            else
                            begin
                                iaddr <= {row-6'd1 , col} ;
                            end

                        end
                        else if (col == 6'd63)
                        begin

                            if (iaddr == {row-6'd1 , col-6'd1})
                            begin
                                iaddr <= {row-6'd1 , col} ;
                            end
                            else if (iaddr == {row-6'd1 , col})
                            begin
                                iaddr <= {row , col-6'd1} ;
                            end
                            else if (iaddr == {row , col-6'd1})
                            begin
                                iaddr <= {row , col} ;
                            end
                            else if (iaddr == {row , col})
                            begin
                                iaddr <= {row+6'd1 , col-6'd1} ;
                            end
                            else if (iaddr == {row+6'd1 , col-6'd1})
                            begin
                                iaddr <= {row+6'd1 , col} ;
                            end
                            else
                            begin
                                iaddr <= {row , col+6'd1} ;
                            end

                        end
                        else
                        begin

                            if (iaddr == {row-6'd1 , col-6'd1})
                            begin
                                iaddr <= {row-6'd1 , col} ;
                            end
                            else if (iaddr == {row-6'd1 , col})
                            begin
                                iaddr <= {row-6'd1 , col+6'd1} ;
                            end
                            else if (iaddr == {row-6'd1 , col+6'd1})
                            begin
                                iaddr <= {row , col-6'd1} ;
                            end
                            else if (iaddr == {row , col-6'd1})
                            begin
                                iaddr <= {row , col} ;
                            end
                            else if (iaddr == {row , col})
                            begin
                                iaddr <= {row , col+6'd1} ;
                            end
                            else if (iaddr == {row , col+6'd1})
                            begin
                                iaddr <= {row+6'd1 , col-6'd1} ;
                            end
                            else if (iaddr == {row+6'd1 , col-6'd1})
                            begin
                                iaddr <= {row+6'd1 , col} ;
                            end
                            else if (iaddr == {row+6'd1 , col})
                            begin
                                iaddr <= {row+6'd1 , col+6'd1} ;
                            end
                            else
                            begin
                                iaddr <= {row-6'd1 , col} ;
                            end

                        end

                    end

                end
                else
                begin
                    iaddr <= iaddr ;
                end

            end
            else
            begin
                iaddr <= 12'd0 ;
            end

        end
        else
        begin
            iaddr <= 12'd0 ;
        end

    end

end


///// ninepixel , bias_0
always @(*)
begin

    if (busy)
    begin

        if (state ==  Layer_0)
        begin

            if (process_delay == access)
            begin

                if (row == 6'd0)
                begin

                    if (col == 6'd0)
                    begin

                        if (iaddr_delay == {row , col})
                        begin
                            ninepixel = CC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col+6'd1})
                        begin
                            ninepixel = RC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row+6'd1 , col})
                        begin
                            ninepixel = CD ;
                            bias_0 = 40'd0 ;
                        end
                        else
                        begin
                            ninepixel = RD ;
                            bias_0 = bias ;
                        end

                    end
                    else if (col == 6'd63)
                    begin

                        if (iaddr_delay == {row , col-6'd1})
                        begin
                            ninepixel = LC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col})
                        begin
                            ninepixel = CC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row+6'd1 , col-6'd1})
                        begin
                            ninepixel = LD ;
                            bias_0 = 40'd0 ;
                        end
                        else
                        begin
                            ninepixel = CD ;
                            bias_0 = bias ;
                        end

                    end
                    else
                    begin

                        if (iaddr_delay == {row , col-6'd1})
                        begin
                            ninepixel = LC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col})
                        begin
                            ninepixel = CC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col+6'd1})
                        begin
                            ninepixel = RC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row+6'd1 , col-6'd1})
                        begin
                            ninepixel = LD ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row+6'd1 , col})
                        begin
                            ninepixel = CD ;
                            bias_0 = 40'd0 ;
                        end
                        else
                        begin
                            ninepixel = RD ;
                            bias_0 = bias ;
                        end

                    end

                end
                else if (row == 6'd63)
                begin

                    if (col == 6'd0)
                    begin

                        if (iaddr_delay == {row-6'd1 , col})
                        begin
                            ninepixel = CU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row-6'd1 , col+6'd1})
                        begin
                            ninepixel = RU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col})
                        begin
                            ninepixel = CC ;
                            bias_0 = 40'd0 ;
                        end
                        else
                        begin
                            ninepixel = RC ;
                            bias_0 = bias ;
                        end

                    end
                    else if (col == 6'd63)
                    begin

                        if (iaddr_delay == {row-6'd1 , col-6'd1})
                        begin
                            ninepixel = LU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row-6'd1 , col})
                        begin
                            ninepixel = CU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col-6'd1})
                        begin
                            ninepixel = LC ;
                            bias_0 = 40'd0 ;
                        end
                        else
                        begin
                            ninepixel = CC ;
                            bias_0 = bias ;
                        end

                    end
                    else
                    begin

                        if (iaddr_delay == {row-6'd1 , col-6'd1})
                        begin
                            ninepixel = LU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row-6'd1 , col})
                        begin
                            ninepixel = CU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row-6'd1 , col+6'd1})
                        begin
                            ninepixel = RU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col-6'd1})
                        begin
                            ninepixel = LC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col})
                        begin
                            ninepixel = CC ;
                            bias_0 = 40'd0 ;
                        end
                        else
                        begin
                            ninepixel = RC ;
                            bias_0 = bias ;
                        end

                    end

                end
                else
                begin

                    if (col == 6'd0)
                    begin

                        if (iaddr_delay == {row-6'd1 , col})
                        begin
                            ninepixel = CU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row-6'd1 , col+6'd1})
                        begin
                            ninepixel = RU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col})
                        begin
                            ninepixel = CC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col+6'd1})
                        begin
                            ninepixel = RC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row+6'd1 , col})
                        begin
                            ninepixel = CD ;
                            bias_0 = 40'd0 ;
                        end
                        else
                        begin
                            ninepixel = RD ;
                            bias_0 = bias ;
                        end

                    end
                    else if (col == 6'd63)
                    begin

                        if (iaddr_delay == {row-6'd1 , col-6'd1})
                        begin
                            ninepixel = LU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row-6'd1 , col})
                        begin
                            ninepixel = CU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col-6'd1})
                        begin
                            ninepixel = LC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col})
                        begin
                            ninepixel = CC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row+6'd1 , col-6'd1})
                        begin
                            ninepixel = LD ;
                            bias_0 = 40'd0 ;
                        end
                        else
                        begin
                            ninepixel = CD ;
                            bias_0 = bias ;
                        end

                    end
                    else
                    begin

                        if (iaddr_delay == {row-6'd1 , col-6'd1})
                        begin
                            ninepixel = LU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row-6'd1 , col})
                        begin
                            ninepixel = CU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row-6'd1 , col+6'd1})
                        begin
                            ninepixel = RU ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col-6'd1})
                        begin
                            ninepixel = LC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col})
                        begin
                            ninepixel = CC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row , col+6'd1})
                        begin
                            ninepixel = RC ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row+6'd1 , col-6'd1})
                        begin
                            ninepixel = LD ;
                            bias_0 = 40'd0 ;
                        end
                        else if (iaddr_delay == {row+6'd1 , col})
                        begin
                            ninepixel = CD ;
                            bias_0 = 40'd0 ;
                        end
                        else
                        begin
                            ninepixel = RD ;
                            bias_0 = bias ;
                        end

                    end

                end

            end
            else
            begin
                ninepixel = 20'd0 ;
                bias_0 = 40'd0 ;
            end

        end
        else
        begin
            ninepixel = 20'd0 ;
            bias_0 = 40'd0 ;
        end

    end
    else
    begin
        ninepixel = 20'd0 ;
        bias_0 = 40'd0 ;
    end

end





////// cwr , crd
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        cwr <= 1'b0 ;
        crd <= 1'b0 ;
    end
    else
    begin

        if (busy)
        begin

            if (state == Layer_0)
            begin

                if (process == dealing)
                begin
                    cwr <= (~got_it) ? 1'b1 : 1'b0 ;
                    crd <= 1'b0 ;
                end
                else
                begin
                    cwr <= 1'b0 ;
                    crd <= 1'b0 ;
                end

            end
            else if (state == Max_pooling)
            begin

                if (process == access)
                begin
                    cwr <= (got_it) ? 1'b1 : 1'b0 ;
                    crd <= (got_it) ? 1'b0 : 1'b1 ;
                    ;
                end
                else
                begin
                    cwr <= 1'b0 ;
                    crd <= (got_it) ? 1'b1 : 1'b0 ;
                end

            end
            else if (state == Flatten)
            begin

                if (process == access)
                begin
                    cwr <= (got_it) ? 1'b1 : 1'b0 ;
                    crd <= (got_it) ? 1'b0 : 1'b1 ;
                    ;
                end
                else
                begin
                    cwr <= 1'b0 ;
                    crd <= (got_it) ? 1'b1 : 1'b0 ;
                end

            end
            else
            begin
                cwr <= 1'b0 ;
                crd <= 1'b0 ;
            end

        end
        else
        begin
            cwr <= 1'b0 ;
            crd <= 1'b0 ;
        end

    end

end



////// cdata_wr
always @(*)
begin
    case(state)

        Layer_0 :
            cdata_wr = (conv_value[39]) ? 20'd0 : (conv_value[35:16] + {19'd0 , conv_value[15]}) ;
        Max_pooling :
            cdata_wr = conv_value[19:0] ;
        Flatten :
            cdata_wr = cdata_rd ;
        done :
            cdata_wr = 20'd0 ;

    endcase
end



////// caddr_rd
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        caddr_rd <= 12'd0 ;
    end
    else
    begin

        if (busy)
        begin

            if (state == Max_pooling)
            begin

                if (process == access)
                begin

                    if (crd)
                    begin

                        if (caddr_rd == {row , col})
                        begin
                            caddr_rd <= {row , col+6'd1} ;
                        end
                        else if (caddr_rd == {row , col+6'd1})
                        begin
                            caddr_rd <= {row+6'd1 , col} ;
                        end
                        else if (caddr_rd == {row+6'd1 , col})
                        begin
                            caddr_rd <= {row+6'd1 , col+6'd1} ;
                        end
                        else
                        begin

                            if (col == 6'd62)
                            begin
                                caddr_rd <= {row+6'd2 , col+6'd2} ;
                            end
                            else
                            begin
                                caddr_rd <= {row , col+6'd2} ;
                            end

                        end

                    end
                    else
                    begin
                        caddr_rd <= caddr_rd ;
                    end

                end
                else
                begin
                    caddr_rd <= caddr_rd ;
                end

            end
            else if (state == Flatten)
            begin

                if (process == dealing)
                begin
                    caddr_rd[9:0] <= caddr_rd[9:0] + 10'd1 ;
                    caddr_rd[11:10] <= caddr_rd[11:10] ;
                end
                else
                begin
                    caddr_rd <= caddr_rd  ;
                end

            end
            else
            begin
                caddr_rd <= 12'd0 ;
            end

        end
        else
        begin
            caddr_rd <= 12'd0 ;
        end

    end

end


////// caddr_wr
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        caddr_wr <= 12'd0 ;
    end
    else
    begin

        if (busy)
        begin

            if (state == Layer_0)
            begin
                caddr_wr <= {row , col} ;
            end
            else if (state == Max_pooling)
            begin
                caddr_wr <= {2'd0 ,row[5:1] , col[5:1]} ;
            end
            else if (state == Flatten)
            begin
                caddr_wr <= {caddr_rd[10:0] , kernal0_1 };
            end
            else
            begin
                caddr_wr <= 12'd0 ;
            end

        end
        else
        begin
            caddr_wr <= 12'd0 ;
        end


    end

end



////// csel
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        csel <= 3'd0 ;
    end
    else
    begin

        if (busy)
        begin

            if (state == Layer_0)
            begin

                csel <= {1'b0 , kernal0_1 , !kernal0_1};

            end
            else if (state == Max_pooling)
            begin

                if (process == access)
                begin
                    csel <= (got_it) ? {kernal0_1 , !kernal0_1 , !kernal0_1} : {1'b0 , kernal0_1 , !kernal0_1}  ;
                end
                else
                begin

                    if (OK)
                    begin
                        csel <= 3'd3 ;
                    end
                    else
                    begin
                        csel <= (got_it) ? {1'b0 , kernal0_1 , !kernal0_1} : {kernal0_1 , !kernal0_1 , !kernal0_1} ;
                    end

                end

            end
            else if (state == Flatten)
            begin

                if (process == access)
                begin
                    csel <= (got_it) ? 3'd5 : {kernal0_1 , !kernal0_1 , !kernal0_1}  ;
                end
                else
                begin

                    if (caddr_rd == 12'd1023)
                    begin
                        csel <= 3'd4 ;
                    end
                    else
                    begin
                        csel <= (got_it) ? {kernal0_1 , !kernal0_1 , !kernal0_1} : 3'd5 ;
                    end

                end

            end
            else
            begin
                csel <= 3'd0 ;
            end

        end
        else
        begin
            csel <= 3'd0 ;
        end

    end
end



endmodule


