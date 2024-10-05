module JAM (CLK, RST, W, J, Cost, MatchCount, MinCost, Valid);
input CLK;
input RST;
input [6:0] Cost;
output reg [2:0] W; //row
output reg [2:0] J; //column
output reg [3:0] MatchCount;
output reg [9:0] MinCost;
output reg Valid;


reg [2:0] array [0:7] , array_num , array_num_1, array_min , min_temp ;
reg [6:0] array_cost [0:7] ;
reg [3:0] cout ;


integer i;
reg state , next_state , ok  ;
parameter fetch=1'b0 , next=1'b1 ;
reg [1:0] process ;



// FSM1

always @(*)
begin
    case(state)
        fetch:
            next_state = (ok==1'b1) ? next : fetch ;
        next:
            next_state = (ok==1'b1) ? fetch : next ;
    endcase
end

always @(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        state <= fetch ;
    end
    else
    begin
        state <= next_state ;
    end
end


always @(posedge CLK or posedge RST)
begin

    if (RST)
    begin

        for(i=0 ; i<=7 ; i=i+1)
        begin
            array_cost[i] <= 7'd0 ;
            array[i] <= i;
        end
        W <= 3'd0 ;
        J <= 3'd0 ;

    end
    else if (state==fetch)
    begin
        W <= cout[2:0] ;
        J <= array[cout[2:0]] ;
        array_cost[cout[2:0]] <= Cost ;
    end
    else if (state==next)
    begin
        W <= W ;
        J <= J ;
        for (i=0 ; i<=7 ; i=i+1)
        begin
            array_cost[i] <= array_cost[i] ;
        end
        if (process==2'd2)
        begin
            array[array_num] <= array[array_min] ;
            array[array_min] <= array[array_num] ;
        end
        else if (process==2'd3)
        begin
            for (i=0 ; i<array_num_1 ; i=i+1)
            begin
                array[array_num + 1 + i ] <= array[7-i] ;
            end
        end
        else
        begin
            for (i=0 ; i<=7 ; i=i+1)
            begin
                array[i] <= array[i] ;
            end
        end
    end
    else
    begin
        for(i=0 ; i<=7 ; i=i+1)
        begin
            array[i] <= array[i] ;
            array_cost[i] <= array_cost[i] ;
        end
    end

end

always @(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        MinCost <= 10'd1023 ;
        MatchCount <= 4'd0 ;
    end
    else if (state==next)
    begin

        if (process==2'd3)
        begin
            if (MinCost>(array_cost[0] + array_cost[1] + array_cost[2] + array_cost[3] + array_cost[4] + array_cost[5] + array_cost[6] + array_cost[7]))
            begin
                MinCost <= array_cost[0] + array_cost[1] + array_cost[2] + array_cost[3] + array_cost[4] + array_cost[5] + array_cost[6] + array_cost[7] ;
                MatchCount <= 4'd1 ;
            end
            else if (MinCost==(array_cost[0] + array_cost[1] + array_cost[2] + array_cost[3] + array_cost[4] + array_cost[5] + array_cost[6] + array_cost[7]))
            begin
                MinCost <= MinCost ;
                MatchCount <= MatchCount + 4'd1 ;
            end
            else
            begin
                MinCost <= MinCost ;
                MatchCount <= MatchCount ;
            end
        end
        else
        begin
            MinCost <= MinCost ;
            MatchCount <= MatchCount ;
        end

    end
    else
    begin
        MinCost <= MinCost ;
        MatchCount <= MatchCount ;
    end
end

always @(posedge CLK or posedge RST)
begin

    if (RST)
    begin
        array_num <= 3'd0 ;
        array_num_1 <= 3'd0 ;
    end
    else if (state==next)
    begin
        if (process==2'd0)
        begin
            array_num <= (array[7]>array[6]) ? 3'd6 :
                      ((array[6]>array[5])&&(array[7]<=array[6])) ? 3'd5 :
                      ((array[5]>array[4])&&(array[6]<=array[5])&&(array[7]<=array[6])) ? 3'd4 :
                      ((array[4]>array[3])&&(array[5]<=array[4])&&(array[6]<=array[5])&&(array[7]<=array[6])) ? 3'd3 :
                      ((array[3]>array[2])&&(array[4]<=array[3])&&(array[5]<=array[4])&&(array[6]<=array[5])&&(array[7]<=array[6])) ? 3'd2 :
                      ((array[2]>array[1])&&(array[3]<=array[2])&&(array[4]<=array[3])&&(array[5]<=array[4])&&(array[6]<=array[5])&&(array[7]<=array[6])) ? 3'd1 :
                      ((array[1]>array[0])&&(array[2]<=array[1])&&(array[3]<=array[2])&&(array[4]<=array[3])&&(array[5]<=array[4])&&(array[6]<=array[5])&&(array[7]<=array[6])) ? 3'd0 : 3'd7 ;

            array_num_1 <= (array[7]>array[6]) ? 3'd1 :
                        ((array[6]>array[5])&&(array[7]<=array[6])) ? 3'd2 :
                        ((array[5]>array[4])&&(array[6]<=array[5])&&(array[7]<=array[6])) ? 3'd3 :
                        ((array[4]>array[3])&&(array[5]<=array[4])&&(array[6]<=array[5])&&(array[7]<=array[6])) ? 3'd4 :
                        ((array[3]>array[2])&&(array[4]<=array[3])&&(array[5]<=array[4])&&(array[6]<=array[5])&&(array[7]<=array[6])) ? 3'd5 :
                        ((array[2]>array[1])&&(array[3]<=array[2])&&(array[4]<=array[3])&&(array[5]<=array[4])&&(array[6]<=array[5])&&(array[7]<=array[6])) ? 3'd6 :
                        ((array[1]>array[0])&&(array[2]<=array[1])&&(array[3]<=array[2])&&(array[4]<=array[3])&&(array[5]<=array[4])&&(array[6]<=array[5])&&(array[7]<=array[6])) ? 3'd7 : 3'd0 ;
        end
        else
        begin
            array_num <= array_num ;
            array_num_1 <= array_num_1 ;
        end
    end
    else
    begin
        array_num <= 3'd0 ;
        array_num <= 3'd0 ;
    end

end


always @(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        cout <= 4'd0 ;
        process <= 2'd0 ;
    end
    else if (state==fetch)
    begin
        if (cout==4'd9)
        begin
            cout <= 4'd0 ;
        end
        else
        begin
            cout <= cout + 4'd1 ;
        end
        process <= 2'd0 ;
    end
    else if (state==next)
    begin

        if (process==2'd0)
        begin
            process <= process + 2'd1 ;
            cout <= 4'd7 ;
        end
        else if (process==2'd1)
        begin
            if (cout>array_num)
            begin
                process <= process ;
                cout <= cout - 4'd1 ;
            end
            else
            begin
                process <= process + 2'd1 ;
                cout <= 4'd0 ;
            end
        end
        else
        begin
            process <= process + 2'd1 ;
            cout <= 4'd0 ;
        end
    end
    else
    begin
        cout <= 4'b0 ;
        process <= 2'd0 ;
    end
end


always @(posedge CLK or posedge RST)
begin

    if (RST)
    begin
        ok <= 1'b0;
    end
    else if (state==fetch)
    begin
        if (cout==4'd8)
        begin
            ok <= 1'b1 ;
        end
        else
        begin
            ok <= 1'b0 ;
        end
    end
    else if (state==next)
    begin
        if (process==2'd2)
        begin
            ok <= 1'b1 ;
        end
        else
        begin
            ok <= 1'b0 ;
        end
    end
    else
    begin
        ok <= 1'b0 ;
    end
end


always @(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        array_min <= 3'd0 ;
        min_temp <= 3'd7 ;
    end
    else if (state==next)
    begin
        if (process==2'd1)
        begin
            if (array_num==3'd7)
            begin
                array_min <= 3'd7 ;
                min_temp <= 3'd7 ;
            end
            else
            begin
                if (cout>array_num)
                begin
                    if ((array[cout]<=min_temp)&&(array[cout]>array[array_num]))
                    begin
                        array_min <= cout ;
                        min_temp <= array[cout] ;
                    end
                    else
                    begin
                        array_min <= array_min ;
                        min_temp <= min_temp ;
                    end
                end
                else
                begin
                    array_min <= array_min ;
                    min_temp <= min_temp ;
                end
            end
        end
        else
        begin
            array_min <= array_min ;
            min_temp <= min_temp ;
        end
    end
    else
    begin
        array_min <= 3'd0 ;
        min_temp <= 3'd7 ;
    end
end

always @(posedge CLK or posedge RST)
begin
    if (RST)
    begin
        Valid <= 1'b0 ;
    end
    else if(state==next)
    begin
        if (process==2'd3)
        begin
            Valid <= ((array_num==3'd7)&&(array_min==3'd7)) ? 1'b1 : 1'b0	;
        end
        else
        begin
            Valid <= Valid ;
        end
    end
    else
    begin
        Valid <= Valid ;
    end
end

endmodule
