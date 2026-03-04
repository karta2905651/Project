module CONVEX(
           input CLK,
           input RST,
           input [4:0] PT_XY,
           output reg READ_PT,
           output reg [9:0] DROP_XY,
           output reg DROP_V );

reg [9:0] point_X [0:12] ;
reg [9:0] point_Y [0:12] ;
reg [4:0] counter , counter1 ;

wire ok ;
wire [10:0] B_x_first , B_x_behind , B_y_first , B_y_behind ;
wire signed [10:0] A_x , A_y ;
wire signed [10:0] B_x , B_y ;
wire [10:0] abs_ax , abs_bx ;
wire signed [21:0] cross_product ;
wire L_R_Wire , l_s_Wire , change ;


reg [2:0] state , next_state ;
parameter init = 3'd0 , find_less_point = 3'd1 , sorting = 3'd2 , decide = 3'd3 , add_new = 3'd4 ;

integer i ;

reg [10:0] center_x , center_y ;
reg [10:0] P1_x , P1_y ;
reg [10:0] P2_x , P2_y ;
reg [3:0] last_position ;
reg [11:0] shift_sig ;



// FSM
always@(*)
begin
    case(state)
        init:
            next_state = (counter1 == 5'd15) ? find_less_point : init ;
        find_less_point:
            next_state = (counter == last_position) ? sorting : find_less_point ;
        sorting:
            next_state = (counter[3:0] == last_position - 5'd1) ? decide : sorting ;
        decide:
            next_state = ((counter == last_position) && (counter1 == 5'd0) && L_R_Wire) ? add_new : decide ;
        add_new:
            next_state = (counter == 5'd5) ? find_less_point : add_new ;
        default :
            next_state = init ;
    endcase
end


always@(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        state <= init ;
    end
    else
    begin
        state <= next_state ;
    end
end



// READ_PT
always@(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        READ_PT <= 1'b0 ;
    end
    else
    begin
        if (state == init)
        begin
            if (counter >= 5'd15)
            begin
                READ_PT <= 1'b0 ;
            end
            else
            begin
                READ_PT <= 1'b1 ;
            end
        end
        else if (state == add_new)
        begin
            READ_PT <= (counter == 5'd0) ? 1'b1 : 1'b0 ;
        end
        else
        begin
            READ_PT <= 1'b0 ;
        end
    end
end


// counter
always@(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        counter <= 5'd0 ;
    end
    else
    begin
        if (state == init)
        begin
            if (READ_PT)
            begin
                counter <= counter + 5'd1 ;
            end
            else
            begin
                if (counter == 5'd16)
                begin
                    counter <= 5'd1 ;
                end
                else
                begin
                    counter <= counter ;
                end
            end
        end
        else if (state == find_less_point)
        begin
            if (counter == last_position)
            begin
                counter <= 5'd1 ;
            end
            else
            begin
                counter <= counter + 5'd1 ;
            end
        end
        else if (state == sorting)
        begin
            if (counter[3:0] == last_position - 5'd1)
            begin
                counter <= 5'd0 ;
            end
            else if (counter1[3:0] == last_position)
            begin
                counter <= counter + 5'd1 ;
            end
            else
            begin
                counter <= counter ;
            end
        end
        else if (state == decide)
        begin
            if (counter1 == 5'd1)
            begin
                counter <= counter ;
            end
            else if (counter1 == 5'd2)
            begin
                if (counter == 5'd0)
                begin
                    counter <= counter ;
                end
                else
                begin
                    counter <= counter - 5'd1 ;
                end
            end
            else
            begin
                if (counter == last_position)
                begin
                    counter <= (L_R_Wire) ? 5'd0 : counter ;
                end
                else
                begin
                    counter <= (L_R_Wire) ? counter + 5'd1 : counter ;
                end
            end
        end
        else
        begin
            if (counter == 5'd5)
            begin
                counter <= 5'd1 ;
            end
            else
            begin
                counter <= counter + 5'd1 ;
            end
        end
    end
end


// counter1
always @(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        counter1 <= 5'd0 ;
    end
    else
    begin
        if (state == init)
        begin
            if (counter == 5'd16)
            begin
                counter1 <= 5'd1 ;
            end
            else
            begin
                counter1 <= counter ;
            end
        end
        else if (state == find_less_point)
        begin
            counter1 <= 5'd2 ;
        end
        else if (state == sorting)
        begin
            if (counter1[3:0] < last_position)
            begin
                counter1 <= counter1 + 5'd1 ;
            end
            else
            begin
                if (counter[3:0] == last_position - 5'd1)
                begin
                    counter1 <= 5'd0 ;
                end
                else
                begin
                    counter1 <= counter + 5'd2 ;
                end
            end
        end
        else if (state == decide)
        begin
            if (counter1 == 5'd0)
            begin
                counter1 <= (~L_R_Wire) ? 5'd1 : 5'd0 ;
            end
            else
            begin
                counter1 <= (counter1 == 5'd2) ? 5'd0 : counter1 + 5'd1 ;
            end
        end
        else
        begin
            counter1 <= 5'd1 ;
        end
    end
end


// point_X
always @(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        for ( i=0 ; i<=12 ; i=i+1 )
        begin
            point_X[i] <= 10'd0 ;
        end
    end
    else
    begin
        if (state == init)
        begin
            if (counter1[4:2] <= 3'd3)
            begin
                point_X[counter1[4:2]] <= {point_X[counter1[4:2]][4:0] , point_Y[counter1[4:2]][9:5]} ;
            end
            else
            begin
                for ( i=0 ; i<=12 ; i=i+1 )
                begin
                    point_X[i] <= point_X[i] ;
                end
            end
        end
        else if (state == find_less_point)
        begin
            point_X[0] <= ((point_Y[0] > point_Y[counter]) || ((point_Y[0] == point_Y[counter]) && (point_X[0] > point_X[counter]))) ? point_X[counter] : point_X[0] ;
            point_X[counter] <= ((point_Y[0] > point_Y[counter]) || ((point_Y[0] == point_Y[counter]) && (point_X[0] > point_X[counter]))) ? point_X[0] : point_X[counter] ;
        end
        else if (state == sorting)
        begin
            point_X[counter] <= (change) ? point_X[counter1] : point_X[counter] ;
            point_X[counter1] <= (change) ? point_X[counter] : point_X[counter1] ;
        end
        else if (state == decide)
        begin
            if (counter1 == 5'd1)
            begin
                for (i=0 ; i<12 ; i=i+1)
                begin
                    point_X[i] <= (shift_sig[i]) ? point_X[i+1] : point_X[i] ;
                end
                point_X[12] <= 10'd0 ;
            end
            else
            begin
                for ( i=0 ; i<=12 ; i=i+1 )
                begin
                    point_X[i] <= point_X[i] ;
                end
            end
        end
        else
        begin
            if (counter == 5'd1)
            begin
                for ( i=0 ; i<12 ; i=i+1 )
                begin
                    point_X[i+1] <= point_X[i] ;
                end
            end
            else if (counter >= 5'd2)
            begin
                point_X[0] <= {point_X[0][4:0] , point_Y[0][9:5]} ;
            end
        end
    end
end


// point_Y
always @(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        for ( i=0 ; i<=12 ; i=i+1 )
        begin
            point_Y[i] <= 10'd0 ;
        end
    end
    else
    begin
        if (state == init)
        begin
            if (counter1[4:2] <= 3'd3)
            begin
                point_Y[counter1[4:2]] <= {point_Y[counter1[4:2]][4:0] , PT_XY} ;
            end
            else
            begin
                for ( i=0 ; i<=12 ; i=i+1 )
                begin
                    point_Y[i] <= point_Y[i] ;
                end
            end
        end
        else if (state == find_less_point)
        begin
            point_Y[0] <= ((point_Y[0] > point_Y[counter]) || ((point_Y[0] == point_Y[counter]) && (point_X[0] > point_X[counter]))) ? point_Y[counter] : point_Y[0] ;
            point_Y[counter] <= ((point_Y[0] > point_Y[counter]) || ((point_Y[0] == point_Y[counter]) && (point_X[0] > point_X[counter]))) ? point_Y[0] : point_Y[counter] ;
        end
        else if (state == sorting)
        begin
            point_Y[counter] <= (change) ? point_Y[counter1] : point_Y[counter] ;
            point_Y[counter1] <= (change) ? point_Y[counter] : point_Y[counter1] ;
        end
        else if (state == decide)
        begin
            if (counter1 == 5'd2)
            begin
                for (i=0 ; i<12 ; i=i+1)
                begin
                    point_Y[i] <= (shift_sig[i]) ? point_Y[i+1] : point_Y[i] ;
                end
                point_Y[12] <= 10'd0 ;
            end
            else
            begin
                for ( i=0 ; i<=12 ; i=i+1 )
                begin
                    point_Y[i] <= point_Y[i] ;
                end
            end
        end
        else
        begin
            if (counter == 5'd1)
            begin
                for ( i=0 ; i<12 ; i=i+1 )
                begin
                    point_Y[i+1] <= point_Y[i] ;
                end
            end
            else if (counter >= 5'd2)
            begin
                point_Y[0] <= {point_Y[0][4:0] , PT_XY} ;
            end
        end
    end
end



// center_x,center_y
always @(*)
begin
    if (state == sorting)
    begin
        center_x = point_X[0] ;
        center_y = point_Y[0] ;
    end
    else if (state == decide)
    begin
        if (counter[3:0] == last_position)
        begin
            center_x = point_X[0] ;
            center_y = point_Y[0] ;
        end
        else
        begin
            center_x = point_X[counter + 5'd1] ;
            center_y = point_Y[counter + 5'd1] ;
        end
    end
    else
    begin
        center_x = 11'd0 ;
        center_y = 11'd0 ;
    end
end



// P1_x,P1_y
always @(*)
begin
    if (state == sorting)
    begin
        P1_x = point_X[counter] ;
        P1_y = point_Y[counter] ;
    end
    else if (state == decide)
    begin
        if (counter[3:0] == last_position)
        begin
            P1_x = point_X[1] ;
            P1_y = point_Y[1] ;
        end
        else if (counter[3:0] == (last_position - 4'd1))
        begin
            P1_x = point_X[0] ;
            P1_y = point_Y[0] ;
        end
        else
        begin
            P1_x = point_X[counter + 5'd2] ;
            P1_y = point_Y[counter + 5'd2] ;
        end
    end
    else
    begin
        P1_x = 11'd0 ;
        P1_y = 11'd0 ;
    end
end



// P2_x,P2_y
always @(*)
begin
    if (state == sorting)
    begin
        P2_x = point_X[counter1] ;
        P2_y = point_Y[counter1] ;
    end
    else if (state == decide)
    begin
        P2_x = point_X[counter] ;
        P2_y = point_Y[counter] ;
    end
    else
    begin
        P2_x = 11'd0 ;
        P2_y = 11'd0 ;
    end
end



// 外積計算
assign A_x = P1_x - center_x ;
assign A_y = P1_y - center_y ;

assign B_x_first = (state == sorting) ? P2_x : center_x ;
assign B_x_behind = (state == sorting) ? center_x : P2_x ;

assign B_y_first = (state == sorting) ? P2_y : center_y ;
assign B_y_behind = (state == sorting) ? center_y : P2_y ;

assign B_x = B_x_first - B_x_behind ;
assign B_y = B_y_first - B_y_behind ;

assign abs_ax = (A_x[10]) ? ~A_x + 11'd1 : A_x ;
assign abs_bx = (B_x[10]) ? ~B_x + 11'd1 : B_x ;

assign cross_product = A_x * B_y - B_x * A_y ;

assign L_R_Wire = (cross_product < $signed(22'd0)) ? 1'b1 : 1'b0 ;
assign l_s_Wire = (abs_ax > abs_bx) ? 1'b1 : 1'b0 ;

assign change = (cross_product == $signed(22'd0)) ? l_s_Wire : L_R_Wire ;


// last_position
always @(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        last_position <= 4'd0 ;
    end
    else
    begin
        last_position <= (point_X[3] == 10'd0)? 4'd2 :
                      (point_X[4] == 10'd0) ? 4'd3 :
                      (point_X[5] == 10'd0) ? 4'd4 :
                      (point_X[6] == 10'd0) ? 4'd5 :
                      (point_X[7] == 10'd0) ? 4'd6 :
                      (point_X[8] == 10'd0) ? 4'd7 :
                      (point_X[9] == 10'd0) ? 4'd8 :
                      (point_X[10] == 10'd0) ? 4'd9 :
                      (point_X[11] == 10'd0) ? 4'd10 :
                      (point_X[12] == 10'd0) ? 4'd11: 4'd12 ;
    end
end



// shift_sig
always @(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        shift_sig <= 12'd0 ;
    end
    else
    begin
        if (state == decide)
        begin
            if ((counter1 == 5'd0) && (~L_R_Wire))
            begin
                if (counter == last_position)
                begin
                    shift_sig <= 12'b111111111111 ;
                end
                else
                begin
                    shift_sig <= (counter == 5'd0)? 12'b111111111110 :
                              (counter == 5'd1) ? 12'b111111111100 :
                              (counter == 5'd2) ? 12'b111111111000 :
                              (counter == 5'd3) ? 12'b111111110000 :
                              (counter == 5'd4) ? 12'b111111100000 :
                              (counter == 5'd5) ? 12'b111111000000 :
                              (counter == 5'd6) ? 12'b111110000000 :
                              (counter == 5'd7) ? 12'b111100000000 :
                              (counter == 5'd8) ? 12'b111000000000 :
                              (counter == 5'd9) ? 12'b110000000000 :
                              (counter == 5'd10) ? 12'b100000000000 : 12'd0 ;
                end

            end
            else
            begin
                shift_sig <= shift_sig ;
            end
        end
        else
        begin
            shift_sig <= 12'd0 ;
        end
    end
end



// DROP_V
always @(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        DROP_V <= 1'b0 ;
    end
    else
    begin
        if (state == decide)
        begin
            DROP_V <= (counter1 != 5'd0) ? 1'b1 : 1'b0 ;
        end
        else
        begin
            DROP_V <= 1'b0 ;
        end
    end
end



// DROP_XY
always @(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        DROP_XY <= 10'd0 ;
    end
    else
    begin
        if (state == decide)
        begin
            if (counter1 == 5'd1)
            begin
                if (counter == last_position)
                begin
                    DROP_XY <= point_X[0] ;
                end
                else
                begin
                    DROP_XY <= point_X[counter + 5'd1] ;
                end
            end
            else if (counter1 == 5'd2)
            begin
                if (counter == last_position)
                begin
                    DROP_XY <= point_Y[0] ;
                end
                else
                begin
                    DROP_XY <= point_Y[counter + 5'd1] ;
                end
            end
            else
            begin
                DROP_XY <= 10'd0 ;
            end
        end
    end
end


endmodule
