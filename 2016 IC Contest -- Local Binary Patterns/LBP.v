module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);

input               clk;
input               reset;
input               gray_ready;
input      [7:0]    gray_data;

output reg [13:0]   gray_addr;
output reg          gray_req;
output reg [13:0]   lbp_addr;
output reg          lbp_valid;
output reg [7:0]    lbp_data;
output reg          finish;


wire lbp_data_1bit ;

reg [13:0] central ;
reg [7:0] lbp_c , lbp_p ;
reg [2:0] cout ;



// central
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        central <= 14'd129 ;
    end
    else
    begin

        if (gray_req)
        begin

            if (gray_addr == (central + 14'd129))
            begin

                if (central[6:0] == 7'd126 )
                begin
                    central <= central + 14'd3 ;
                end
                else
                begin
                    central <= central + 14'd1 ;
                end

            end
            else
            begin
                central <= central ;
            end

        end
        else
        begin
            central <= central ;
        end

    end

end



// gray_req
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        gray_req <= 1'b0 ;
    end
    else
    begin

        if (gray_ready)
        begin

            if (gray_addr == (central + 14'd129))
            begin
                gray_req <= 1'b0 ;
            end
            else
            begin
                gray_req <= 1'b1 ;
            end

        end
        else
        begin
            gray_req <= gray_req ;
        end

    end

end



// gray_addr
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        gray_addr <= 14'd129 ;
    end
    else
    begin

        if (gray_req)
        begin

            if (gray_addr == central)
            begin
                gray_addr <= central - 14'd129 ;
            end
            else if (gray_addr == (central - 14'd127))
            begin
                gray_addr <= central - 14'd1 ;
            end
            else if (gray_addr == (central - 14'd1))
            begin
                gray_addr <= central + 14'd1 ;
            end
            else if (gray_addr == (central + 14'd1))
            begin
                gray_addr <= central + 14'd127 ;
            end
            else
            begin
                gray_addr <= gray_addr + 14'd1 ;
            end

        end
        else
        begin
            gray_addr <= central ;
        end

    end

end



// lbp_c
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        lbp_c <= 8'd0 ;
    end
    else
    begin

        if (gray_req)
        begin

            if (gray_addr == central)
            begin
                lbp_c <= gray_data ;
            end
            else
            begin
                lbp_c <= lbp_c ;
            end

        end
        else
        begin
            lbp_c <= 8'd0 ;
        end

    end

end



// lbp_p
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        lbp_p <= 8'd0 ;
    end
    else
    begin

        if (gray_req)
        begin
            lbp_p <= gray_data ;
        end
        else
        begin
            lbp_p <= 8'd0 ;
        end

    end

end



// cout
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        cout <= 3'd0 ;
    end
    else
    begin

        if (gray_req)
        begin

            if ((gray_addr == central) || (gray_addr == (central - 14'd129)))
            begin
                cout <= 3'd0 ;
            end
            else
            begin
                cout <= cout + 3'd1 ;
            end

        end
        else
        begin
            cout <= 3'd0 ;
        end

    end

end




// lbp_addr
always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        lbp_addr <= 14'd0 ;
    end
    else
    begin

        if (gray_req)
        begin
            lbp_addr <= central ;
        end
        else
        begin
            lbp_addr <= lbp_addr ;
        end

    end

end

always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        lbp_data <= 6'd0 ;
    end
    else
    begin
        lbp_data[cout] <= lbp_data_1bit ;
    end

end

always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        lbp_valid <= 1'b0 ;
    end
    else
    begin
        lbp_valid <= (cout == 3'd7) ? 1'b1 : 1'b0 ;
    end

end

assign lbp_data_1bit = (lbp_p >= lbp_c) ? 1'b1 : 1'b0 ;


always @(posedge clk or posedge reset)
begin

    if (reset)
    begin
        finish <= 1'b0 ;
    end
    else
    begin
        finish <= ((central == 14'd16257) && (lbp_valid == 1'b1)) ? 1'b1 : finish ;
    end

end

// assign finish = 1'b0 ;

endmodule
