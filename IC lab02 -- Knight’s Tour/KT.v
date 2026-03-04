module KT( clk, rst_n, in_valid, in_x, in_y, move_num, priority_num, out_valid, out_x, out_y, move_out);
input clk,rst_n;
input in_valid;
input [2:0] in_x,in_y;
input [4:0] move_num;
input [2:0] priority_num;
output  out_valid;
output  [2:0] out_x,out_y;
output  [4:0] move_out;
// ===========================================================================================================
reg [2:0] x_reg [0:24] ;
reg [2:0] y_reg [0:24] ;

reg signed [3:0] x_vector , y_vector ;

reg [2:0] priority_num_reg ;
reg [4:0] cout , move_num_reg ;
reg [2:0] cout_priority , pre_move_cout ;
reg in_valid_reg ;
reg [24:0] match_w ;

// ===========================================================================================================
wire ok , match ;

wire [4:0] previous_move , sec_previous_move ;
wire signed [3:0] next_x , next_y ;
wire signed [3:0] previous_move_x_vec , previous_move_y_vec ;
wire [2:0] pre_cout_priority , direction ;

integer i ;

//FSM
parameter access = 3'd0 , move = 3'd1 , move_back = 3'd2 , move_on = 3'd3 , done = 3'd4 ;

reg [2:0] state , next_state ;

always @(*)
begin
    case (state)
        access :
            next_state = (in_valid_reg && (cout == move_num_reg)) ? move : access ;
        move :
            next_state = ((cout_priority == 3'd7) && match) ? move_back :
                (!match) ? move_on :
                    move ;
        move_on :
            next_state = (move_num_reg == 5'd24) ? done : move ;
        move_back :
            next_state = (pre_cout_priority == 3'd7) ? move_back : move ;
        done :
            next_state = (cout == 5'd24) ? access : done ;
        default:
            next_state = access ;
    endcase
end

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        state <= access ;
    end
    else
    begin
        state <= next_state ;
    end
end

//=====================================================================

// cout
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        cout <= 5'd0 ;
    end
    else
    begin
        if (state == access)
        begin
            if (in_valid)
            begin
                cout <= cout + 5'd1 ;
            end
            else
            begin
                if (in_valid_reg && (cout == move_num_reg))
                begin
                    cout <= 5'd0 ;
                end
                else
                begin
                    cout <= cout ;
                end
            end
        end
        else if (state == move)
        begin
            cout <= 5'd0 ;
        end
        else if ((state == move_on) || (state == move_back))
        begin
            cout <= 5'd0 ;
        end
        else
        begin
            cout <= (cout == 5'd24) ? 5'd0 : cout + 5'd1 ;
        end
    end
end

// cout_priority
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        cout_priority <= 3'd0 ;
    end
    else
    begin
        if (state == move)
        begin
            if (match)
            begin
                cout_priority <= cout_priority + 3'd1 ;
            end
            else
            begin
                cout_priority <= cout_priority ;
            end
        end
        else if (state == move_on)
        begin
            cout_priority <= 3'd0 ;
        end
        else if (state == move_back)
        begin
            cout_priority <= pre_cout_priority + 3'd1 ;
        end
        else
        begin
            cout_priority <= cout_priority ;
        end
    end
end


assign pre_cout_priority = pre_move_cout - priority_num_reg ;
assign direction = priority_num_reg + cout_priority ;


// DECODER_x
always @(*)
begin
    case (direction)
        3'd0:
            x_vector = 4'd15 ;
        3'd1 :
            x_vector = 4'd1 ;
        3'd2 :
            x_vector = 4'd2 ;
        3'd3 :
            x_vector = 4'd2 ;
        3'd4 :
            x_vector = 4'd1 ;
        3'd5 :
            x_vector = 4'd15 ;
        3'd6 :
            x_vector = 4'd14 ;
        3'd7 :
            x_vector = 4'd14 ;
    endcase
end


// DECODER_y
always @(*)
begin
    case (direction)
        3'd0:
            y_vector = 4'd2 ;
        3'd1 :
            y_vector = 4'd2 ;
        3'd2 :
            y_vector = 4'd1 ;
        3'd3 :
            y_vector = 4'd15 ;
        3'd4 :
            y_vector = 4'd14 ;
        3'd5 :
            y_vector = 4'd14 ;
        3'd6 :
            y_vector = 4'd15 ;
        3'd7 :
            y_vector = 4'd1 ;
    endcase
end


// ENCODER
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        pre_move_cout <= 3'd0 ;
    end
    else
    begin
        case ({previous_move_x_vec , previous_move_y_vec})
            {4'd15 , 4'd2}:
                pre_move_cout <= 3'd0 ;
            {4'd1 , 4'd2} :
                pre_move_cout <= 3'd1 ;
            {4'd2 , 4'd1} :
                pre_move_cout <= 3'd2 ;
            {4'd2 , 4'd15} :
                pre_move_cout <= 3'd3 ;
            {4'd1 , 4'd14} :
                pre_move_cout <= 3'd4 ;
            {4'd15 , 4'd14} :
                pre_move_cout <= 3'd5 ;
            {4'd14 , 4'd15} :
                pre_move_cout <= 3'd6 ;
            {4'd14 , 4'd1} :
                pre_move_cout <= 3'd7 ;
        endcase
    end

end


// previous_move
assign previous_move = move_num_reg - 5'd1 ;

// sec_previous_move
assign sec_previous_move = move_num_reg - 5'd2 ;

// sec_previous_move_vector
assign previous_move_x_vec = x_reg[previous_move] - x_reg[sec_previous_move] ;
assign previous_move_y_vec = y_reg[previous_move] - y_reg[sec_previous_move] ;

// next_x next_y
assign next_x = {1'b0 , x_reg[previous_move]} + x_vector ;
assign next_y = {1'b0 , y_reg[previous_move]} + y_vector ;


// match
always @(*)
begin
    for( i=0 ; i<=24 ; i=i+1 )
    begin
        match_w[i] = ((next_x < 4'd0) || (next_x > 4'd4) || (next_y < 4'd0) || (next_y > 4'd4) || ((next_x == x_reg[i]) && (next_y == y_reg[i]))) ? 1'b1 : 1'b0 ;
    end
end

assign match = (match_w == 25'd0) ? 1'b0 : 1'b1 ;


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


// x_reg
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        for (i=0 ; i<=24 ; i=i+1)
        begin
            x_reg[i] <= 3'd7 ;
        end
    end
    else
    begin
        if (state == access)
        begin
            if (in_valid)
            begin
                x_reg[cout] <= in_x ;
            end
            else
            begin
                for (i=0 ; i<=24 ; i=i+1)
                begin
                    x_reg[i] <= x_reg[i] ;
                end
            end
        end
        else if (state == move_on)
        begin
            x_reg[move_num_reg] <= next_x[2:0] ;
        end
        else if (state == move_back)
        begin
            x_reg[previous_move] <= 3'd7 ;
        end
        else if (state == done)
        begin
            x_reg[24] <= 3'd7 ;
            for (i=0 ; i<=23 ; i=i+1)
            begin
                x_reg[i] <= x_reg[i+1] ;
            end
        end
        else
        begin
            for (i=0 ; i<=24 ; i=i+1)
            begin
                x_reg[i] <= x_reg[i] ;
            end
        end
    end
end


// y_reg
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        for (i=0 ; i<=24 ; i=i+1)
        begin
            y_reg[i] <= 3'd7 ;
        end
    end
    else
    begin
        if (state == access)
        begin
            if (in_valid)
            begin
                y_reg[cout] <= in_y ;
            end
            else
            begin
                for (i=0 ; i<=24 ; i=i+1)
                begin
                    y_reg[i] <= y_reg[i] ;
                end
            end
        end
        else if (state == move_on)
        begin
            y_reg[move_num_reg] <= next_y[2:0] ;
        end
        else if (state == move_back)
        begin
            y_reg[previous_move] <= 3'd7 ;
        end
        else if (state == done)
        begin
            y_reg[24] <= 3'd7 ;
            for (i=0 ; i<=23 ; i=i+1)
            begin
                y_reg[i] <= y_reg[i+1] ;
            end
        end
        else
        begin
            for (i=0 ; i<=24 ; i=i+1)
            begin
                y_reg[i] <= y_reg[i] ;
            end
        end
    end
end


// priority_num_reg
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        priority_num_reg <= 3'd0 ;
    end
    else
    begin
        if (state == access)
        begin
            if (in_valid)
            begin
                priority_num_reg <= (cout == 5'd0) ? priority_num : priority_num_reg ;
            end
            else
            begin
                priority_num_reg <= priority_num_reg ;
            end
        end
        else
        begin
            priority_num_reg <= priority_num_reg ;
        end
    end
end


// move_num_reg
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        move_num_reg <= 5'd0 ;
    end
    else
    begin
        if (state == access)
        begin
            if (in_valid)
            begin
                move_num_reg <= (cout == 5'd0) ? move_num : move_num_reg ;
            end
            else
            begin
                move_num_reg <= move_num_reg ;
            end
        end
        else if (state == move_on)
        begin
            move_num_reg <= move_num_reg + 5'd1 ;
        end
        else if (state == move_back)
        begin
            move_num_reg <= move_num_reg - 5'd1 ;
        end
        else
        begin
            move_num_reg <= move_num_reg ;
        end
    end
end



assign out_valid = (state == done) ? 1'b1 : 1'b0 ;
assign out_x = (state == done) ? x_reg[0] : 3'd0 ;
assign out_y = (state == done) ? y_reg[0] : 3'd0 ;
assign move_out = (state == done) ? cout + 5'd1 : 5'd0 ;
assign ok = 1'b0 ;


endmodule

