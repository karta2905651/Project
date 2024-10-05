`timescale 1ns/10ps
module DT(
	input 			clk, 
	input			reset,
	output	reg		done ,
	output	reg		sti_rd ,
	output	reg 	[9:0]	sti_addr ,
	input		    [15:0]	sti_di,
	output	reg		res_wr ,
	output	reg		res_rd ,
	output	reg 	[13:0]	res_addr ,
	output	reg 	[7:0]	res_do,
	input		    [7:0]	res_di
	);


parameter fetch = 2'b00 , forward = 2'b01 , backward = 2'b10 , finish = 2'b11 ;
reg [1:0] state , next_state ;
reg ok ;
reg [3:0] cout ;
reg [13:0] i ;
reg [7:0] temp ;




// FSM
always@(*)begin
	case(state)
	fetch: next_state = (ok==1'b1)? forward : fetch ; 
	forward: next_state = (ok==1'b1)? backward : forward ; 
	backward: next_state = (ok==1'b1)? finish : backward ;
	endcase
end

always @(posedge clk or negedge reset) begin
	if (!reset) begin
		state <= fetch ;
	end
	else begin
		state <= next_state ;
	end
end

///////////////////////////////////



// ok
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		ok <= 1'b0 ;
	end
	else if(state==fetch)begin 
	    if ((sti_addr==10'd1023)&&(cout==4'd14)) begin
		    ok <= 1'b1 ;
		end
		else begin
			ok <= 1'b0 ;
		end
	end
	else if (state==forward) begin
	    if ((res_addr==14'd16254)&&(res_rd==1'b1)) begin
	    	ok <= 1'b1 ;
	    end
	    else begin
	    	ok <= 1'b0 ;
	    end
	end	
	else if (state==backward) begin
	    if ((res_addr==14'd129)&&(res_rd==1'b0)) begin
	    	ok <= 1'b1 ;
	    end
	    else begin
	    	ok <= 1'b0 ;
	    end
	end	
	else begin
		ok <= 1'b0 ;
	end
end



// sti_rd
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		sti_rd <= 1'b0 ;
	end
	else if (state==fetch) begin
		sti_rd <= 1'b1 ;
	end
	else begin
		sti_rd <= 1'b0 ;
	end
end



// sti_addr
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		sti_addr <= 10'b0 ;		
	end
	else if(state==fetch)begin
		if((sti_rd==1'b1)&&(cout==4'd15))begin
			sti_addr <= sti_addr + 10'd1 ;
		end
		else begin
			sti_addr <= sti_addr ;
		end
	end
	else begin
		sti_addr <= 10'b0 ;
	end
end







// res_rd
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		res_rd <= 1'b0 ;
	end
	else if(state==fetch) begin
		res_rd <= 1'b0 ;
	end
	else if(state==forward) begin		
		if (res_addr==i+14'd129) begin
			res_rd <= 1'b0 ;
		end
		else if ((res_addr==14'd16254)&&(res_rd==1'b0)) begin
			res_rd <= 1'b0 ;
		end
		else begin
			res_rd <= 1'b1 ;
		end
	end
	else if (state==backward) begin
	    if (res_addr==(14'd16125-i)+14'd129) begin
			res_rd <= 1'b0 ;
		end
		else if ((res_addr==14'd129)&&(res_rd==1'b0)) begin
			res_rd <= 1'b0 ;
		end
		else begin
			res_rd <= 1'b1 ;
		end	
	end
	else begin
		res_rd <= 1'b0 ;
	end
end



// res_addr
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		res_addr <= 14'd0 ;
	end
	else if(state==fetch)begin
		if (sti_rd==1'b1) begin
			res_addr <= { sti_addr , cout } ;
		end
		else begin
			res_addr <= 14'd0 ;
		end		
	end
	else if(state==forward)begin
		if (res_rd==1'b1) begin
			if (res_addr==i+14'd2) begin
				res_addr <= i + 14'd128 ;
			end
			else if (res_addr==i+14'd129) begin
				res_addr <= res_addr ;
			end
			else begin
				res_addr <= res_addr + 14'd1 ;
			end
		end
		else begin
			res_addr <= i ;
		end
	end
	else if (state==backward) begin
		if (res_rd==1'b1) begin
		    if (res_addr==(14'd16125-i)+14'd256) begin
		    	res_addr <= (14'd16125-i) + 14'd130 ;
		    end
		    else if (res_addr==(14'd16125-i)+14'd129) begin
				res_addr <= res_addr ;
			end
		    else begin
		    	res_addr <= res_addr - 14'd1 ;
		    end			
 		end
 		else begin
 			res_addr <= (14'd16125-i) +14'd258 ;
 		end
	end
	else begin
		res_addr <= 14'd0 ;
	end
end


// i
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		i <= 14'd0 ;
	end
	else if (state==forward) begin
		if (res_rd==1'b1) begin
			if ((res_addr==i+14'd129)&&(res_addr!=14'd16254)) begin
			    if (i[6:0]==7'd125) begin
			    	i <= i + 14'd3 ;
			    end
			    else begin
			    	i <= i + 14'd1 ;
			    end				
			end
			else if ((res_addr==i+14'd129)&&(res_addr==14'd16254)) begin
				i <= 14'd0 ;
			end
			else begin
				i <= i ;
			end
		end
		else begin
			i <= i ;
		end
	end
	else if (state==backward) begin
		if (res_rd==1'b1) begin
			if ((res_addr==(14'd16125-i)+14'd129)&&(res_addr!=14'd129)) begin
			    if (i[6:0]==7'd125) begin
			    	i <= i + 14'd3 ;
			    end
			    else begin
			    	i <= i + 14'd1 ;
			    end				
			end
			else if ((res_addr==(14'd16125-i)+14'd129)&&(res_addr==14'd129)) begin
				i <= 14'd0 ;
			end
			else begin
				i <= i ;
			end
		end
		else begin
			i <= i ;
		end
	end
	else begin
		i <= 14'd0 ; 
	end
end


// temp
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		temp <= 8'd0 ;
	end
	else if(state==forward)begin
		if (res_rd==1'b1) begin
			if (res_addr==i+14'd129) begin
				temp <= temp ;
			end
			else if (res_addr==i) begin
				temp <= res_di ;
			end
			else begin
				temp <= (res_di<=temp) ? res_di : temp ;
			end			
		end
		else begin
			temp <= 8'd0 ;
		end
	end
	else if (state==backward) begin
		if (res_rd==1'b1) begin
			if (res_addr==(14'd16125-i)+14'd129) begin
				temp <= temp ;
			end
			else if (res_addr==(14'd16125-i)+14'd258) begin
				temp <= res_di + 8'd1 ;
			end
			else begin
				temp <= ((res_di+8'd1)<=temp) ? res_di+8'd1 : temp ;
			end			
		end
		else begin
			temp <= 8'd0 ;
		end
	end
	else begin
		temp <= 8'd0 ;
	end
end



// res_wr,res_do
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		res_do <= 8'd0 ;
		res_wr <= 1'b0 ;
	end
	else if(state==fetch)begin
		if (sti_rd==1'b1) begin
			res_do[0] <= sti_di[4'd15-cout];
			res_wr <= 1'b1 ;
		end
		else begin
			res_do <= 8'd0 ;
			res_wr <= 1'b0 ;
		end		
	end
	else if (state==forward) begin
		if ((res_rd==1'b1)&&(res_addr==i+14'd129)) begin
			res_do <= (res_di==8'd1) ? temp+8'd1 : 8'd0 ;
			res_wr <= 1'b1 ;
		end
		else begin
			res_do <= 8'd0 ;
			res_wr <= 1'b0 ;
		end	
	end
	else if (state==backward) begin
		if ((res_rd==1'b1)&&(res_addr==(14'd16125-i)+14'd129)) begin
			res_do <= ((res_di!=8'd0)&&(res_di<temp)) ? res_di : ((res_di!=8'd0)&&(res_di>=temp)) ? temp : 8'd0 ;
			res_wr <= 1'b1 ;
		end
		else begin
			res_do <= 8'd0 ;
			res_wr <= 1'b0 ;
		end	
	end
	else begin
	    res_do <= 8'd0 ;
		res_wr <= 1'b0 ;
	end
end









// cout
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		cout <= 4'd0 ;
	end
	else if(state==fetch)begin
		if (cout==4'd15) begin
			cout <= 4'd0 ;
		end
		else begin
			if (sti_rd==1'b1) begin
				cout <= cout + 4'd1 ;
			end
			else begin
				cout <= cout ;
			end			
		end		
	end
	else begin
		cout <= 4'd0 ;
	end
end



// done
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		done <= 1'b0 ;
	end
	else if(state==finish)begin
		done <= 1'b1 ;
	end
	else begin
		done <= 1'b0 ;
	end
end










endmodule