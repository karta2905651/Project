//synopsys translate_off
`include "/home/lab911_1/Desktop/7112064123/ICLAB_05/RA1SH.v"
`include "/home/lab911_1/Desktop/7112064123/ICLAB_05/RA2SH.v"
//synopsys translate_on
module TMIP( clk, rst_n, in_valid, in_valid_2, image, img_size, template, action, out_valid, out_x, out_y, out_img_pos, out_value);
input clk;
input rst_n;
input in_valid;
input in_valid_2;
input signed [15:0] image;
input signed [15:0] template;
input [4:0] img_size;
input [1:0] action;
output reg out_valid;
output reg [3:0] out_x;
output reg [3:0] out_y;
output reg [7:0] out_img_pos;
output reg signed [39:0] out_value;


// wire
wire ok ;
wire [9:0] size_square ;
wire [4:0] size_1 , size_2 ;
wire [3:0] counter1_7_4_p1 , counter1_7_4_m1 , counter1_3_0_p1 , counter1_3_0_m1 ;
wire [39:0] value_w ;
wire [7:0] counter_imgpos , counter1_maxp ;
wire signed [16:0] bias ;



// reg
reg in_valid_reg ;

reg signed [15:0] img_buf ;
reg signed [15:0] temp_buf , temp_w ;

reg signed [15:0] template_reg [0:8] ;
reg [2:0] action_reg [0:7] ;

reg [4:0] img_size_reg , size_buf ;
reg [7:0] counter , counter1 , counter_w , max_position ;

reg signed [39:0] value ;


reg process , s2_valid ;
// integer
integer i ;


// FSM1
parameter fetch = 3'd0 , Delay = 3'd1 , action_exe = 3'd2 , done = 3'd3 , IDLE = 3'd4 , set = 3'd5;
reg [2:0] state , next_state ;

always @(*)
begin

    case (state)
        fetch :
            next_state = (in_valid_2 && (action == 2'd0)) ? Delay : fetch ;
        Delay :
            next_state = (action_reg[0] == 3'd5 && action_reg[1] == 3'd5 && img_size_reg == 5'd4) ? Delay : action_exe ;
        action_exe :
            next_state = ((action_reg[0] == 3'd4) && (counter1 == {size_1[3:0] , size_1[3:0]}) && (counter == 8'd0) && s2_valid) ? done :
                ((action_reg[0] == 3'd6) && (counter == {size_1[3:0] , size_1[4:1]}) && process) ? set :
                    ((action_reg[0] == 3'd7) && (counter == {size_1[3:0] , size_1[3:0]}) && process) ? set :
                        ((action_reg[0] == 3'd5) && (counter == {1'b0 , size_1[3:1] , 1'b0 , size_1[3:1]}) && process) ? set :
                            action_exe ;
        done :
            next_state = ((counter == 8'd1) && out_valid) ? IDLE : done ;
        IDLE :
            next_state = fetch ;
        set :
            next_state = ((img_size_reg == 5'd4 || (img_size_reg == 5'd8 && action_reg[0] == 3'd5)) && (action_reg[1] == 3'd5)) ? set : action_exe ;
        default :
            next_state = fetch ;
    endcase

end

always @(posedge clk or negedge rst_n)
begin

    if (!rst_n)
    begin
        state <= fetch ;
    end
    else
    begin
        state <= next_state ;
    end

end



// SRAM S1 Control wire
reg s1_ram_w_r , s1_ram_on , s1_ram_standby ;
reg [7:0] s1_ram_addr ;
reg signed [15:0] s1_sram_d ;

wire signed [15:0] s1_sram_dout ;

always @(*)
begin
    case(state)
        fetch :
        begin
            s1_ram_w_r = !in_valid_reg ;
            s1_ram_on = 1'b1 ;
            s1_ram_standby = 1'b0 ;
            s1_ram_addr = counter ;
            s1_sram_d = img_buf ;
        end
        action_exe :
        begin
            if (action_reg[0] == 3'd4)
            begin
                s1_ram_w_r = 1'b1 ;
                s1_ram_on = 1'b0 ;
                s1_ram_standby = 1'b0 ;
                s1_ram_addr = counter ;
                s1_sram_d = 16'd0 ;
            end
            else if (action_reg[0] == 3'd6)
            begin
                s1_ram_w_r = !process ;
                s1_ram_on = 1'b0 ;
                s1_ram_standby = 1'b0 ;
                s1_ram_addr = counter ;
                s1_sram_d = temp_buf ;
            end
            else
            begin
                s1_ram_w_r = !process ;
                s1_ram_on = process ;
                s1_ram_standby = 1'b0 ;
                s1_ram_addr = counter ;
                s1_sram_d = temp_buf ;
            end
        end
        default :
        begin
            s1_ram_w_r = 1'b1 ;
            s1_ram_on = 1'b1 ;
            s1_ram_standby = 1'b1 ;
            s1_ram_addr = 8'd0 ;
            s1_sram_d = 16'd0 ;
        end
    endcase
end

RA1SH S1(.Q(s1_sram_dout), .CLK(clk), .CEN(s1_ram_standby), .WEN(s1_ram_w_r), .A(s1_ram_addr), .D(s1_sram_d), .OEN(s1_ram_on));


// SRAM S2 Control wire
reg s2_ram_w_r , s2_ram_on , s2_ram_standby ;
reg [7:0] s2_ram_addr ;
reg signed [39:0] s2_sram_d ;

wire signed [39:0] s2_sram_dout ;

always @(*)
begin
    case(state)
        action_exe :
        begin
            s2_ram_w_r = (action_reg[0] == 3'd4) ? !s2_valid : 1'b1 ;
            s2_ram_on = (action_reg[0] == 3'd4) ? 1'b1 : 1'b1 ;
            s2_ram_standby = (action_reg[0] == 3'd4) ? 1'b0 : 1'b1 ;
            s2_ram_addr = (action_reg[0] == 3'd4) ? {out_y , out_x} : 8'd0 ;
            s2_sram_d = (action_reg[0] == 3'd4) ? value : 40'd0 ;
        end
        done :
        begin
            s2_ram_w_r = 1'b1 ;
            s2_ram_on = 1'b0 ;
            s2_ram_standby = 1'b0 ;
            s2_ram_addr = counter ;
            s2_sram_d = 40'd0 ;
        end
        default :
        begin
            s2_ram_w_r = 1'b1 ;
            s2_ram_on = 1'b1 ;
            s2_ram_standby = 1'b1 ;
            s2_ram_addr = 8'd0 ;
            s2_sram_d = 40'd0 ;
        end
    endcase
end

RA2SH S2(.Q(s2_sram_dout), .CLK(clk), .CEN(s2_ram_standby), .WEN(s2_ram_w_r), .A(s2_ram_addr), .D(s2_sram_d), .OEN(s2_ram_on));



// size_buf
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        size_buf <= 5'd0 ;
    end
    else
    begin
        size_buf <= img_size ;
    end
end



// img_size_reg
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        img_size_reg <= 5'd16 ;
    end
    else
    begin
        if (state == fetch)
        begin
            img_size_reg <= (in_valid_reg && (counter1 == 8'd0)) ? size_buf : img_size_reg ;
        end
        else if (state == IDLE)
        begin
            img_size_reg <= 5'd16 ;
        end
        else if (state == set)
        begin
            img_size_reg <= ((action_reg[0] == 3'd5) && (img_size_reg > 5'd4)) ? img_size_reg >>> 1 : img_size_reg;
        end
        else
        begin
            img_size_reg <= img_size_reg ;
        end
    end
end

assign size_square = img_size_reg * img_size_reg - 10'd1 ;
assign size_1 = img_size_reg - 5'd1 ;
assign size_2 = img_size_reg - 5'd2 ;

// in_valid_reg
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        in_valid_reg <= 1'b0 ;
    end
    else
    begin
        in_valid_reg <= in_valid ;
    end
end



// template_reg
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        for (i=0 ; i<=8 ; i=i+1)
        begin
            template_reg[i] <= 16'd0 ;
        end
    end
    else
    begin
        if (state == fetch)
        begin
            template_reg[counter1] <= (in_valid_reg) ? temp_buf : template_reg[counter1] ;
        end
        else
        begin
            for (i=0 ; i<=8 ; i=i+1)
            begin
                template_reg[i] <= template_reg[i] ;
            end
        end
    end
end


// action_reg
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        for (i=0 ; i<=7 ; i=i+1)
        begin
            action_reg[i] <= 3'd0 ;
        end
    end
    else
    begin
        if (state == fetch)
        begin
            action_reg[counter1] <= (in_valid_2) ? {1'b1 , action} : {1'b0 , 2'd0} ;
        end
        else if (state == set)
        begin
            action_reg[7] <= 3'd0 ;
            for (i=0 ; i<7 ; i=i+1)
            begin
                action_reg[i] <= action_reg[i+1] ;
            end
        end
        else if (state == Delay)
        begin
            action_reg[7] <= (img_size_reg == 5'd4 && action_reg[0] == 3'd5) ? 3'd0 : action_reg[7] ;
            for (i=0 ; i<7 ; i=i+1)
            begin
                action_reg[i] <= (img_size_reg == 5'd4 && action_reg[0] == 3'd5) ? action_reg[i+1] : action_reg[i] ;
            end
        end
        else
        begin
            for (i=0 ; i<=7 ; i=i+1)
            begin
                action_reg[i] <= action_reg[i] ;
            end
        end
    end
end



// img_buf
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        img_buf <= 16'd0 ;
    end
    else
    begin
        if (state == fetch)
        begin
            img_buf <= (in_valid) ? image : 16'd0 ;
        end
        else if (state == action_exe)
        begin
            if (action_reg[0] == 3'd6)
            begin
                img_buf <= (s2_valid) ? temp_buf : img_buf ;
            end
            else
            begin
                img_buf <= 16'd0 ;
            end
        end
        else
        begin
            img_buf <= 16'd0 ;
        end
    end
end


// temp_buf
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        temp_buf <= 16'd0 ;
    end
    else
    begin
        if (state == fetch)
        begin
            temp_buf <= (in_valid && (counter1 <= 8'd7)) ? template : 16'd0 ;
        end
        else if (state == action_exe)
        begin
            if (action_reg[0] == 3'd4)
            begin
                if (process)
                begin
                    temp_buf <= 16'd0 ;
                end
                else
                begin
                    temp_buf <= temp_w ;
                end
            end
            else if (action_reg[0] == 3'd6)
            begin
                temp_buf <= (s2_valid) ? s1_sram_dout : temp_buf ;
            end
            else if (action_reg[0] == 3'd7)
            begin
                temp_buf <= (counter1 == 8'd1) ? bias + 16'd50 : temp_buf ;
            end
            else
            begin
                if (process)
                begin
                    temp_buf <= 16'd0 ;
                end
                else
                begin
                    if (counter1 == 8'd0)
                    begin
                        temp_buf <= 16'd0 ;
                    end
                    else if (counter1 == 8'd1)
                    begin
                        temp_buf <= s1_sram_dout ;
                    end
                    else
                    begin
                        temp_buf <= (s1_sram_dout > temp_buf) ? s1_sram_dout : temp_buf ;
                    end
                end
            end
        end
        else
        begin
            temp_buf <= 16'd0 ;
        end
    end
end


assign bias = {s1_sram_dout[15] , s1_sram_dout[15:1]} ;

assign counter1_maxp = ((state == done) || ((state == action_exe) && (action_reg[0] == 3'd5))) ? max_position : counter1 ;

assign counter1_7_4_p1 = counter1_maxp[7:4] + 4'd1 ;
assign counter1_7_4_m1 = counter1_maxp[7:4] - 4'd1 ;
assign counter1_3_0_p1 = counter1_maxp[3:0] + 4'd1 ;
assign counter1_3_0_m1 = counter1_maxp[3:0] - 4'd1 ;


// counter_w、temp_w
always @(*)
begin
    if (counter1_maxp[7:4] == 4'd0)
    begin

        if (counter1_maxp[3:0] == 4'd0)
        begin

            if (counter_imgpos == {counter1_maxp[7:4] , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_3_0_p1} ;
                temp_w = template_reg[4] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_3_0_p1})
            begin
                counter_w = {counter1_7_4_p1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[5] ;
            end
            else if (counter_imgpos == {counter1_7_4_p1 , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_7_4_p1 , counter1_3_0_p1} ;
                temp_w = template_reg[7] ;
            end
            else
            begin
                counter_w = {counter1_maxp[7:4] , counter1_maxp[3:0]} ;
                temp_w = template_reg[8] ;
            end

        end
        else if ({1'b0 , counter1_maxp[3:0]} == size_1)
        begin

            if (counter_imgpos == {counter1_maxp[7:4] , counter1_3_0_m1})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_maxp[3:0]} ;
                temp_w = template_reg[3] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_7_4_p1 , counter1_3_0_m1} ;
                temp_w = template_reg[4] ;
            end
            else if (counter_imgpos == {counter1_7_4_p1 , counter1_3_0_m1})
            begin
                counter_w = {counter1_7_4_p1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[6] ;
            end
            else
            begin
                counter_w = {counter1_maxp[7:4] , 4'd0} ;
                temp_w = template_reg[7] ;
            end

        end
        else
        begin

            if (counter_imgpos == {counter1_maxp[7:4] , counter1_3_0_m1})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_maxp[3:0]} ;
                temp_w = template_reg[3] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_3_0_p1} ;
                temp_w = template_reg[4] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_3_0_p1})
            begin
                counter_w = {counter1_7_4_p1 , counter1_3_0_m1} ;
                temp_w = template_reg[5] ;
            end
            else if (counter_imgpos == {counter1_7_4_p1 , counter1_3_0_m1})
            begin
                counter_w = {counter1_7_4_p1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[6] ;
            end
            else if (counter_imgpos == {counter1_7_4_p1 , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_7_4_p1 , counter1_3_0_p1} ;
                temp_w = template_reg[7] ;
            end
            else
            begin
                counter_w = {counter1_maxp[7:4] , counter1_maxp[3:0]} ;
                temp_w = template_reg[8] ;
            end

        end

    end
    else if ({1'b0 , counter1_maxp[7:4]} == size_1)
    begin

        if (counter1_maxp[3:0] == 4'd0)
        begin

            if (counter_imgpos == {counter1_7_4_m1 , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_7_4_m1 , counter1_3_0_p1} ;
                temp_w = template_reg[1] ;
            end
            else if (counter_imgpos == {counter1_7_4_m1 , counter1_3_0_p1})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_maxp[3:0]} ;
                temp_w = template_reg[2] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_3_0_p1} ;
                temp_w = template_reg[4] ;
            end
            else
            begin
                counter_w = {counter1_7_4_m1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[5] ;
            end

        end
        else if ({1'b0 , counter1_maxp[3:0]} == size_1)
        begin

            if (counter_imgpos == {counter1_7_4_m1 , counter1_3_0_m1})
            begin
                counter_w = {counter1_7_4_m1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[0] ;
            end
            else if (counter_imgpos == {counter1_7_4_m1 , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_3_0_m1} ;
                temp_w = template_reg[1] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_3_0_m1})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_maxp[3:0]} ;
                temp_w = template_reg[3] ;
            end
            else
            begin
                counter_w = 8'd0 ;
                temp_w = template_reg[4] ;
            end

        end
        else
        begin

            if (counter_imgpos == {counter1_7_4_m1 , counter1_3_0_m1})
            begin
                counter_w = {counter1_7_4_m1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[0] ;
            end
            else if (counter_imgpos == {counter1_7_4_m1 , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_7_4_m1 , counter1_3_0_p1} ;
                temp_w = template_reg[1] ;
            end
            else if (counter_imgpos == {counter1_7_4_m1 , counter1_3_0_p1})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_3_0_m1} ;
                temp_w = template_reg[2] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_3_0_m1})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_maxp[3:0]} ;
                temp_w = template_reg[3] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_3_0_p1} ;
                temp_w = template_reg[4] ;
            end
            else
            begin
                counter_w = {counter1_7_4_m1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[5] ;
            end

        end

    end
    else
    begin

        if (counter1_maxp[3:0] == 4'd0)
        begin

            if (counter_imgpos == {counter1_7_4_m1 , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_7_4_m1 , counter1_3_0_p1} ;
                temp_w = template_reg[1] ;
            end
            else if (counter_imgpos == {counter1_7_4_m1 , counter1_3_0_p1})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_maxp[3:0]} ;
                temp_w = template_reg[2] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_3_0_p1} ;
                temp_w = template_reg[4] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_3_0_p1})
            begin
                counter_w = {counter1_7_4_p1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[5] ;
            end
            else if (counter_imgpos == {counter1_7_4_p1 , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_7_4_p1 , counter1_3_0_p1} ;
                temp_w = template_reg[7] ;
            end
            else
            begin
                counter_w = {counter1_7_4_m1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[8] ;
            end

        end
        else if ({1'b0 , counter1_maxp[3:0]} == size_1)
        begin

            if (counter_imgpos == {counter1_7_4_m1 , counter1_3_0_m1})
            begin
                counter_w = {counter1_7_4_m1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[0] ;
            end
            else if (counter_imgpos == {counter1_7_4_m1 , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_3_0_m1} ;
                temp_w = template_reg[1] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_3_0_m1})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_maxp[3:0]} ;
                temp_w = template_reg[3] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_7_4_p1 , counter1_3_0_m1} ;
                temp_w = template_reg[4] ;
            end
            else if (counter_imgpos == {counter1_7_4_p1 , counter1_3_0_m1})
            begin
                counter_w = {counter1_7_4_p1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[6] ;
            end
            else
            begin
                counter_w = {counter1_maxp[7:4] , 4'd0} ;
                temp_w = template_reg[7] ;
            end

        end
        else
        begin

            if (counter_imgpos == {counter1_7_4_m1 , counter1_3_0_m1})
            begin
                counter_w = {counter1_7_4_m1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[0] ;
            end
            else if (counter_imgpos == {counter1_7_4_m1 , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_7_4_m1 , counter1_3_0_p1} ;
                temp_w = template_reg[1] ;
            end
            else if (counter_imgpos == {counter1_7_4_m1 , counter1_3_0_p1})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_3_0_m1} ;
                temp_w = template_reg[2] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_3_0_m1})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_maxp[3:0]} ;
                temp_w = template_reg[3] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_maxp[7:4] , counter1_3_0_p1} ;
                temp_w = template_reg[4] ;
            end
            else if (counter_imgpos == {counter1_maxp[7:4] , counter1_3_0_p1})
            begin
                counter_w = {counter1_7_4_p1 , counter1_3_0_m1} ;
                temp_w = template_reg[5] ;
            end
            else if (counter_imgpos == {counter1_7_4_p1 , counter1_3_0_m1})
            begin
                counter_w = {counter1_7_4_p1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[6] ;
            end
            else if (counter_imgpos == {counter1_7_4_p1 , counter1_maxp[3:0]})
            begin
                counter_w = {counter1_7_4_p1 , counter1_3_0_p1} ;
                temp_w = template_reg[7] ;
            end
            else
            begin
                counter_w = {counter1_7_4_m1 , counter1_maxp[3:0]} ;
                temp_w = template_reg[8] ;
            end

        end

    end
end


assign counter_imgpos = (state == done) ? counter1 : counter ;


// counter
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        counter <= 8'd0 ;
    end
    else
    begin
        if (state == fetch)
        begin
            if (in_valid_reg)
            begin
                counter <= ({1'b0 , counter[3:0]} < size_1) ? counter + 8'd1 :
                        ({1'b0 , counter[3:0]} == size_1) ? {counter[7:4] + 4'd1 , 4'd0} :
                        8'd0 ;
            end
            else
            begin
                counter <= 8'd0 ;
            end
        end
        else if (state == action_exe)
        begin
            if (action_reg[0] == 3'd4)
            begin
                if (process)
                begin
                    counter <= counter ;
                end
                else
                begin
                    counter <= counter_w ;
                end
            end
            else if (action_reg[0] == 3'd6)
            begin
                if (process)
                begin
                    counter <= counter1 ;
                end
                else
                begin
                    counter <= (counter == counter1) ? {counter1[7:4] , (size_1[3:0] - counter1[3:0])} : counter ;
                end
            end
            else if (action_reg[0] == 3'd7)
            begin
                counter <= (counter1 == 8'd2) ? counter + 8'd1 : counter ;
            end
            else
            begin
                if (process)
                begin
                    counter <= (max_position[3:0] < size_2[3:0]) ? max_position + 8'd2 : {max_position[7:4] + 4'd2 , 4'd0} ;
                end
                else
                begin
                    counter <= (counter1 == 8'd0) ? {counter1_maxp[7:4] , counter1_3_0_p1} :
                            (counter1 == 8'd1) ? {counter1_7_4_p1 , counter1_maxp[3:0]} :
                            (counter1 == 8'd2) ? {counter1_7_4_p1 , counter1_3_0_p1} :
                            (counter1 == 8'd3) ? {1'b0 , counter1_maxp[7:5] , 1'b0 , counter1_maxp[3:1]} :
                            counter ;
                end
            end
        end
        else if (state == done)
        begin
            counter <= ({1'b0 , counter[3:0]} < size_1) ? counter + 8'd1 :
                    (({1'b0 , counter[3:0]} == size_1) && ({1'b0 , counter[7:4]} < size_1)) ? {counter[7:4] + 4'd1 , 4'd0} :
                    8'd0 ;
        end
        else
        begin
            counter <= 8'd0 ;
        end
    end
end



// counter1
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        counter1 <= 8'd0 ;
    end
    else
    begin
        if (state == fetch)
        begin
            counter1 <= (in_valid_reg && (counter1 < size_square)) ? counter1 + 8'd1 :
                     (in_valid_2) ? counter1 + 8'd1 : 8'd0 ;
        end
        else if (state == action_exe)
        begin
            if (action_reg[0] == 3'd4)
            begin
                if(process)
                begin
                    if ({1'b0 , counter1[3:0]} == size_1)
                    begin
                        if ({1'b0 , counter1[7:4]} == size_1)
                        begin
                            counter1 <= counter1 ;
                        end
                        else
                        begin
                            counter1 <= {counter1_7_4_p1 , 4'd0} ;
                        end
                    end
                    else
                    begin
                        if ({1'b0 , counter1[7:4]} == size_1)
                        begin
                            counter1 <= {counter1[7:4] , counter1_3_0_p1} ;
                        end
                        else
                        begin
                            counter1 <= {counter1[7:4] , counter1_3_0_p1} ;
                        end
                    end
                end
                else
                begin
                    counter1 <= counter1 ;
                end
            end
            else if (action_reg[0] == 3'd6)
            begin
                if (process && (counter == {counter1[7:4] , (size_1[3:0] - counter1[3:0])}))
                begin
                    if (counter1[7:4] < size_1[3:0])
                    begin
                        counter1 <= {(counter1[7:4]) + 4'd1 , counter1[3:0]} ;
                    end
                    else if (counter1[7:4] == size_1[3:0])
                    begin
                        counter1 <= {4'd0 , (counter1[3:0]) + 4'd1} ;
                    end
                    else
                    begin
                        counter1 <= counter1 + 8'd1 ;
                    end
                end
                else
                begin
                    counter1 <= counter1 ;
                end
            end
            else if (action_reg[0] == 3'd7)
            begin
                if (counter1 < 8'd2)
                begin
                    counter1 <= counter1 + 8'd1 ;
                end
                else
                begin
                    counter1 <= 8'd0 ;
                end
            end
            else if (action_reg[0] == 3'd5)
            begin
                if (counter1 < 8'd5)
                begin
                    counter1 <= counter1 + 8'd1 ;
                end
                else
                begin
                    counter1 <= 8'd0 ;
                end
            end
            else
            begin
                counter1 <= counter1 ;
            end
        end
        else if (state == done)
        begin
            if (max_position[3:0] == 4'd0)
            begin
                if (max_position[7:4] == 4'd0)
                begin
                    counter1 <= (counter == 8'd0) ? max_position : counter_w ;
                end
                else
                begin
                    counter1 <= (counter == 8'd0) ? {counter1_7_4_m1 , max_position[3:0]} : counter_w ;
                end
            end
            else
            begin
                if (max_position[7:4] == 4'd0)
                begin
                    counter1 <= (counter == 8'd0) ? {max_position[7:4] , counter1_3_0_m1} : counter_w ;
                end
                else
                begin
                    counter1 <= (counter == 8'd0) ? {counter1_7_4_m1 , counter1_3_0_m1} : counter_w ;
                end
            end
        end
        else
        begin
            counter1 <= 8'd0 ;
        end
    end
end



// process
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        process <= 1'b0 ;
    end
    else
    begin
        if (state == action_exe)
        begin
            if (action_reg[0] == 3'd4)
            begin
                if ({1'b0 , counter1[3:0]} == size_1)
                begin
                    if ({1'b0 , counter1[7:4]} == size_1)
                    begin
                        process <= (counter == counter1) ? 1'b1 : 1'b0 ;
                    end
                    else
                    begin
                        process <= (counter == {counter1_7_4_p1 , counter1[3:0]}) ? 1'b1 : 1'b0 ;
                    end
                end
                else
                begin
                    if ({1'b0 , counter1[7:4]} == size_1)
                    begin
                        process <= (counter == {counter1[7:4] , counter1_3_0_p1}) ? 1'b1 : 1'b0 ;
                    end
                    else
                    begin
                        process <= (counter == {counter1_7_4_p1 , counter1_3_0_p1}) ? 1'b1 : 1'b0 ;
                    end
                end
            end
            else if (action_reg[0] == 3'd6)
            begin
                if (process)
                begin
                    process <= (counter == {counter1[7:4] , (size_1[3:0] - counter1[3:0])}) ? process : 1'b0 ;
                end
                else
                begin
                    process <= (counter == counter1) ?  process : 1'b1 ;
                end
            end
            else if (action_reg[0] == 3'd7)
            begin
                process <= (counter1 == 8'd1) ? 1'b1 : 1'b0 ;
            end
            else
            begin
                process <= (counter1 == 8'd4) ? 1'b1 : 1'b0 ;
            end
        end
        else
        begin
            process <= 1'b0 ;
        end
    end
end



// value
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        value <= 40'd0 ;
    end
    else
    begin
        if (state == action_exe)
        begin
            if (action_reg[0] == 3'd4)
            begin
                if (process)
                begin
                    value <= value_w ;
                end
                else
                begin
                    if (counter1[3:0] == 4'd0)
                    begin
                        if (counter1[7:4] == 4'd0)
                        begin
                            value <= (counter == counter1) ? 40'd0 : value_w ;
                        end
                        else
                        begin
                            value <= (counter == {counter1_7_4_m1 , counter1[3:0]}) ? 40'd0 : value_w ;
                        end
                    end
                    else
                    begin
                        if (counter1[7:4] == 4'd0)
                        begin
                            value <= (counter == {counter1[7:4] , counter1_3_0_m1}) ? 40'd0 : value_w ;
                        end
                        else
                        begin
                            value <= (counter == {counter1_7_4_m1 , counter1_3_0_m1}) ? 40'd0 : value_w ;
                        end
                    end
                end
            end
            else
            begin
                value <= 40'd0 ;
            end
        end
        else
        begin
            value <= 40'd0 ;
        end
    end
end


// max_position
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        max_position <= 8'd0 ;
    end
    else
    begin
        if (state == action_exe)
        begin
            if (action_reg[0] == 3'd4)
            begin
                max_position <= (s2_valid && (value > out_value)) ? {out_y , out_x} : max_position ;
            end
            else if (action_reg[0] == 3'd5)
            begin
                if (process)
                begin
                    max_position <= (max_position[3:0] < size_2[3:0]) ? max_position + 8'd2 : {max_position[7:4] + 4'd2 , 4'd0} ;
                end
                else
                begin
                    max_position <= max_position ;
                end
            end
            else
            begin
                max_position <= max_position ;
            end
        end
        else if (state == IDLE || state == set)
        begin
            max_position <= 8'd0 ;
        end
        else
        begin
            max_position <= max_position ;
        end
    end
end



// s2_valid
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        s2_valid <= 1'b0 ;
    end
    else
    begin
        if (state == action_exe)
        begin
            if (action_reg[0] == 3'd4)
            begin
                s2_valid <= process ;
            end
            else if (action_reg[0] == 3'd6)
            begin
                s2_valid <= !process ;
            end
            else
            begin
                s2_valid <= 1'b0 ;
            end
        end
        else if (state == done)
        begin
            if (out_valid)
            begin
                if ({1'b0 , counter1_maxp[3:0]} == size_1)
                begin
                    if ({1'b0 , counter1_maxp[7:4]} == size_1)
                    begin
                        s2_valid <= (counter1 == max_position) ? 1'b1 : s2_valid ;
                    end
                    else
                    begin
                        s2_valid <= (counter1 == {counter1_7_4_p1 , max_position[3:0]}) ? 1'b1 : s2_valid ;
                    end
                end
                else
                begin
                    if ({1'b0 , counter1_maxp[7:4]} == size_1)
                    begin
                        s2_valid <= (counter1 == {max_position[7:4] , counter1_3_0_p1}) ? 1'b1 : s2_valid ;
                    end
                    else
                    begin
                        s2_valid <= (counter1 == {counter1_7_4_p1 , counter1_3_0_p1}) ? 1'b1 : s2_valid ;
                    end
                end
            end
            else
            begin
                s2_valid <= 1'b0 ;
            end
        end
        else
        begin
            s2_valid <= 1'b0 ;
        end
    end
end




// out_valid
always @(posedge clk or negedge rst_n)
begin

    if (!rst_n)
    begin
        out_valid <= 1'd0 ;
    end
    else
    begin
        if (state == done)
        begin
            out_valid <= ((counter == 8'd1) && !out_valid) ? 1'b1 :
                      ((counter == 8'd1) && out_valid) ? 1'b0 :
                      out_valid ;
        end
        else
        begin
            out_valid <= 1'b0 ;
        end
    end

end



// out_x
always @(posedge clk or negedge rst_n)
begin

    if (!rst_n)
    begin
        out_x <= 4'd0 ;
    end
    else
    begin
        if (state == action_exe)
        begin
            if (action_reg[0] == 3'd4)
            begin
                out_x <= (process) ? counter1[3:0] : 4'd0 ;
            end
            else
            begin
                out_x <= out_x ;
            end
        end
        else if (state == done)
        begin
            out_x <= ((counter == 8'd1) && out_valid) ? 4'd0 : max_position[7:4] ;
        end
        else
        begin
            out_x <= 4'd0 ;
        end
    end

end



// out_y
always @(posedge clk or negedge rst_n)
begin

    if (!rst_n)
    begin
        out_y <= 4'd0 ;
    end
    else
    begin
        if (state == action_exe)
        begin
            if (action_reg[0] == 3'd4)
            begin
                out_y <= (process) ? counter1[7:4] : 4'd0 ;
            end
            else
            begin
                out_y <= out_y ;
            end
        end
        else if (state == done)
        begin
            out_y <= ((counter == 8'd1) && out_valid) ? 4'd0 : max_position[3:0] ;
        end
        else
        begin
            out_y <= 4'd0 ;
        end
    end

end



// out_img_pos
always @(posedge clk or negedge rst_n)
begin

    if (!rst_n)
    begin
        out_img_pos <= 8'd0 ;
    end
    else
    begin
        if (state == done)
        begin
            out_img_pos <= (s2_valid) ? 8'd0 : counter1[7:4] * img_size_reg + {4'd0 , counter1[3:0]} ;
        end
        else
        begin
            out_img_pos <= 8'd0 ;
        end
    end

end


assign value_w = temp_buf * s1_sram_dout + value ;

// out_value
always @(posedge clk or negedge rst_n)
begin

    if (!rst_n)
    begin
        out_value <= 40'd0 ;
    end
    else
    begin
        if (state == action_exe)
        begin
            if (action_reg[0] == 3'd4)
            begin
                out_value <= (s2_valid && (value > out_value)) ? value : out_value ;
            end
            else
            begin
                out_value <= out_value ;
            end
        end
        else if (state == done)
        begin
            out_value <= ((counter == 8'd1) && out_valid) ? 40'd0 : s2_sram_dout ;
        end
        else if (state == set)
        begin
            out_value <= {1'b1 , 39'd0} ;
        end
        else
        begin
            out_value <= 40'd0 ;
        end
    end

end

endmodule
