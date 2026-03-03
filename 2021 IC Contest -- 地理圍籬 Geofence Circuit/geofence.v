//synopsys translate_off
`include "DW_sqrt.v"
//synopsys translate_on
module geofence ( clk,reset,X,Y,R,valid,is_inside);
input clk;
input reset;
input [9:0] X;
input [9:0] Y;
input [10:0] R;
output reg valid;
output reg is_inside;

reg [2:0] cout , cout1 ;
reg [2:0] state ;
reg [24:0] area_6 , area_3 ;
reg signed [11:0] r[0:5] , x[0:5] , y[0:5];
reg signed [11:0] a , b , x0_reg , y0_reg , x1_reg , y1_reg ;

wire signed [11:0] area_3_w1 , area_3_w2 ;
wire signed [11:0] s , c ;
wire signed [22:0] s_1 , s_2 , c_2 ;
wire signed [24:0] area_3w ;

parameter fetch=3'd0 , sort=3'd1 , compute=3'd2 , done=3'd3 , delay=3'd4 ;
integer i ;


// state,cout
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        cout <= 3'd0 ;
        state <= fetch ;
    end
    else if (state == fetch)
    begin
        if (cout >= 3'd5)
        begin
            cout <= 3'd1 ;
            state <= sort ;
        end
        else
        begin
            state <= state ;
            cout <= cout + 3'd1 ;
        end
    end
    else if (state == sort)
    begin
        if ((cout != 3'd4) && (cout1 >= 3'd5))
        begin
            cout <= cout + 3'd1 ;
            state <= state ;
        end
        else if ((cout == 3'd4) && (cout1 >= 3'd5))
        begin
            cout <= 3'd0 ;
            state <= compute ;
        end
        else
        begin
            cout <= cout ;
            state <= state ;
        end
    end
    else if (state == compute)
    begin
        if (cout > 3'd5)
        begin
            cout <= cout ;
            state <= done ;
        end
        else
        begin
            cout <= cout + 3'd1 ;
            state <= state ;
        end
    end
    else if (state == done)
    begin
        cout <= 3'd0 ;
        state <= delay ;
    end
    else if (state == delay)
    begin
        cout <= cout ;
        state <= fetch ;
    end
    else
    begin
        cout <= cout ;
        state <= state ;
    end
end

// cout1
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        cout1 <= 3'd2 ;
    end
    else if (state == sort)
    begin
        if ((cout != 3'd4) && (cout1 >= 3'd5))
        begin
            cout1 <= cout + 3'd2 ;
        end
        else if ((cout == 3'd4) && (cout1 >= 3'd5))
        begin
            cout1 <= 3'd2 ;
        end
        else
        begin
            cout1 <= cout1 + 3'd1 ;
        end
    end
    else
    begin
        cout1 <= cout1 ;
    end
end


// x,y,r
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        for(i = 0 ; i <= 5 ; i = i + 1)
        begin
            x[i] <= 12'd0 ;
            y[i] <= 12'd0 ;
            r[i] <= 12'd0 ;
        end
    end
    else if (state == fetch)
    begin
        x[cout] <= { 2'd0 , X } ;
        y[cout] <= { 2'd0 , Y } ;
        r[cout] <= { 1'b0 , R } ;
    end
    else if (state == sort)
    begin
        if ((((x[cout] - x[0]) * (y[cout1] - y[0])) - ((y[cout] - y[0]) *(x[cout1] - x[0]))) < $signed(24'd0))
        begin

            x[cout]  <= x[cout1] ;
            x[cout1] <= x[cout]  ;
            y[cout]  <= y[cout1] ;
            y[cout1] <= y[cout]  ;
            r[cout]  <= r[cout1] ;
            r[cout1] <= r[cout]  ;

        end
        else
        begin

            x[cout]  <= x[cout]  ;
            x[cout1] <= x[cout1] ;
            y[cout]  <= y[cout]  ;
            y[cout1] <= y[cout1] ;
            r[cout]  <= r[cout]  ;
            r[cout1] <= r[cout1] ;

        end
    end
    else
    begin
        for(i = 0 ; i <= 5 ; i = i + 1)
        begin

            x[i] <= x[i] ;
            y[i] <= y[i] ;
            r[i] <= r[i] ;

        end
    end
end


// area_6,area_3
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        area_6 <= 25'd0 ;
        area_3 <= 25'd0 ;
    end
    else if (state == compute)
    begin
        area_6 <= area_6 + ((x0_reg * y1_reg) - (x1_reg * y0_reg)) ;
        area_3 <= area_3 + area_3w ;
    end
    else if (state == done)
    begin
        area_6 <= area_6 ;
        area_3 <= area_3 ;
    end
    else
    begin
        area_6 <= 25'd0 ;
        area_3 <= 25'd0 ;
    end
end

// x0_reg , y0_reg
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        x0_reg <= 12'd0 ;
        y0_reg <= 12'd0 ;
    end
    else
    begin
        if (state == compute)
        begin
            if (cout > 3'd5)
            begin
                x0_reg <= 12'd0 ;
                y0_reg <= 12'd0 ;
            end
            else
            begin
                x0_reg <= x[cout] ;
                y0_reg <= y[cout] ;
            end
        end
        else
        begin
            x0_reg <= 12'd0 ;
            y0_reg <= 12'd0 ;
        end
    end
end

// x1_reg , y1_reg
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        x1_reg <= 12'd0 ;
        y1_reg <= 12'd0 ;
    end
    else
    begin
        if (state == compute)
        begin
            if (cout == 3'd5)
            begin
                x1_reg <= x[0] ;
                y1_reg <= y[0] ;
            end
            else if (cout > 3'd5)
            begin
                x1_reg <= 12'd0 ;
                y1_reg <= 12'd0 ;
            end
            else
            begin
                x1_reg <= x[cout + 3'd1] ;
                y1_reg <= y[cout + 3'd1] ;
            end
        end
        else
        begin
            x1_reg <= 12'd0 ;
            y1_reg <= 12'd0 ;
        end
    end
end

// a , b
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        a <= 12'd0 ;
        b <= 12'd0 ;
    end
    else
    begin
        if (state == compute)
        begin
            if (cout == 3'd5)
            begin
                a <= r[cout] ;
                b <= r[0] ;
            end
            else if (cout > 3'd5)
            begin
                a <= 12'd0 ;
                b <= 12'd0 ;
            end
            else
            begin
                a <= r[cout] ;
                b <= r[cout + 3'd1] ;
            end
        end
        else
        begin
            a <= 12'd0 ;
            b <= 12'd0 ;
        end
    end
end

// stage 1
assign c_2 = (x1_reg - x0_reg) * (x1_reg - x0_reg) + (y1_reg - y0_reg) * (y1_reg - y0_reg) ;

// stage 2
DW_sqrt #(23,0) D0 (.a(c_2) , .root(c)) ;

// stage 3
assign s = (a + b + c) >>> 1 ;

// stage 4
assign s_1 = s * (s - a) ;
assign s_2 = (s - b) * (s - c) ;

// stage 5
DW_sqrt #(23,0) D6(.a(s_1) , .root(area_3_w1)) ;
DW_sqrt #(23,0) D7(.a(s_2) , .root(area_3_w2)) ;

// stage 6
assign  area_3w = area_3_w1 * area_3_w2 ;



// valid , is_inside
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        valid <= 1'b0 ;
        is_inside <= 1'b0 ;
    end
    else if (state==done)
    begin
        valid <= 1'b1 ;
        is_inside <= (area_3 <= {area_6[24] , area_6[24:1]}) ? 1'b1 : 1'b0 ;
    end
    else
    begin
        valid <= 1'b0 ;
        is_inside <= 1'b0 ;
    end
end





endmodule


