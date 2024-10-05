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


wire signed [11:0] area_3_0_w1 , area_3_0_w2 , area_3_1_w1 , area_3_1_w2 , area_3_2_w1 , area_3_2_w2 , area_3_3_w1 , area_3_3_w2 , area_3_4_w1 , area_3_4_w2 , area_3_5_w1 , area_3_5_w2 ;
wire signed [11:0] s0 , s1 , s2 , s3 , s4 , s5 , c0 , c1 , c2 , c3 , c4 , c5 ;
wire signed [22:0] s0_1 , s1_1 , s2_1 , s3_1 , s4_1 , s5_1 , s0_2 , s1_2 , s2_2 , s3_2 , s4_2 , s5_2 , c0_2 , c1_2 , c2_2 , c3_2 , c4_2 , c5_2 ;
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
        cout <= cout ;
        state <= done ;
    end
    else if (state == done)
    begin
        cout <= cout ;
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
        area_6 <= (((x[0] * y[1]) - (x[1] * y[0])) + ((x[1] * y[2]) - (x[2] * y[1])) + ((x[2] * y[3]) - (x[3] * y[2])) + ((x[3] * y[4]) - (x[4] * y[3])) + ((x[4] * y[5]) - (x[5] * y[4])) + ((x[5] * y[0]) - (x[0] * y[5]))) >>> 1 ;
        area_3 <= area_3w ;
    end
    else
    begin
        area_6 <= area_6 ;
        area_3 <= area_3 ;
    end
end

// stage 1
assign c0_2 = (x[1]-x[0])*(x[1]-x[0])+(y[1]-y[0])*(y[1]-y[0]) ;
assign c1_2 = (x[2]-x[1])*(x[2]-x[1])+(y[2]-y[1])*(y[2]-y[1]) ;
assign c2_2 = (x[3]-x[2])*(x[3]-x[2])+(y[3]-y[2])*(y[3]-y[2]) ;
assign c3_2 = (x[4]-x[3])*(x[4]-x[3])+(y[4]-y[3])*(y[4]-y[3]) ;
assign c4_2 = (x[5]-x[4])*(x[5]-x[4])+(y[5]-y[4])*(y[5]-y[4]) ;
assign c5_2 = (x[0]-x[5])*(x[0]-x[5])+(y[0]-y[5])*(y[0]-y[5]) ;

// stage 2
DW_sqrt #(23,0) D0 (.a(c0_2) , .root(c0)) ;
DW_sqrt #(23,0) D1 (.a(c1_2) , .root(c1)) ;
DW_sqrt #(23,0) D2 (.a(c2_2) , .root(c2)) ;
DW_sqrt #(23,0) D3 (.a(c3_2) , .root(c3)) ;
DW_sqrt #(23,0) D4 (.a(c4_2) , .root(c4)) ;
DW_sqrt #(23,0) D5 (.a(c5_2) , .root(c5)) ;

// stage 3
assign s0 = (r[0] + r[1] + c0)>>>1 ;
assign s1 = (r[1] + r[2] + c1)>>>1 ;
assign s2 = (r[2] + r[3] + c2)>>>1 ;
assign s3 = (r[3] + r[4] + c3)>>>1 ;
assign s4 = (r[4] + r[5] + c4)>>>1 ;
assign s5 = (r[5] + r[0] + c5)>>>1 ;

// stage 4
assign s0_1 = s0*(s0-r[0]) ;
assign s0_2 = (s0-r[1])*(s0-c0) ;

assign s1_1 = s1*(s1-r[1]) ;
assign s1_2 = (s1-r[2])*(s1-c1) ;

assign s2_1 = s2*(s2-r[2]) ;
assign s2_2 = (s2-r[3])*(s2-c2) ;

assign s3_1 = s3*(s3-r[3]) ;
assign s3_2 = (s3-r[4])*(s3-c3) ;

assign s4_1 = s4*(s4-r[4]) ;
assign s4_2 = (s4-r[5])*(s4-c4) ;

assign s5_1 = s5*(s5-r[5]) ;
assign s5_2 = (s5-r[0])*(s5-c5) ;


// stage 5
DW_sqrt #(23,0) D6(.a(s0_1) , .root(area_3_0_w1)) ;
DW_sqrt #(23,0) D7(.a(s0_2) , .root(area_3_0_w2)) ;

DW_sqrt #(23,0) D8(.a(s1_1) , .root(area_3_1_w1)) ;
DW_sqrt #(23,0) D9(.a(s1_2) , .root(area_3_1_w2)) ;

DW_sqrt #(23,0) D10(.a(s2_1) , .root(area_3_2_w1)) ;
DW_sqrt #(23,0) D11(.a(s2_2) , .root(area_3_2_w2)) ;

DW_sqrt #(23,0) D12(.a(s3_1) , .root(area_3_3_w1)) ;
DW_sqrt #(23,0) D13(.a(s3_2) , .root(area_3_3_w2)) ;

DW_sqrt #(23,0) D14(.a(s4_1) , .root(area_3_4_w1)) ;
DW_sqrt #(23,0) D15(.a(s4_2) , .root(area_3_4_w2)) ;

DW_sqrt #(23,0) D16(.a(s5_1) , .root(area_3_5_w1)) ;
DW_sqrt #(23,0) D17(.a(s5_2) , .root(area_3_5_w2)) ;

// stage 6
assign  area_3w = area_3_0_w1*area_3_0_w2 + area_3_1_w1*area_3_1_w2 + area_3_2_w1*area_3_2_w2 + area_3_3_w1*area_3_3_w2 + area_3_4_w1*area_3_4_w2 + area_3_5_w1*area_3_5_w2 ;



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
        is_inside <= (area_3 <= area_6) ? 1'b1 : 1'b0 ;
    end
    else
    begin
        valid <= 1'b0 ;
        is_inside <= 1'b0 ;
    end
end





endmodule


