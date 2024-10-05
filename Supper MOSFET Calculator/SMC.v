//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   2021 ICLAB Spring Course
//   Lab01          : Supper MOSFET Calculator (SMC)
//   Author         : Shiuan-Yun Ding (mirkat.ding@gmail.com)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   File Name   : SMC.v
//   Module Name : SMC
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

module SMC(
    // Input signals
    mode,
    W_0, V_GS_0, V_DS_0,
    W_1, V_GS_1, V_DS_1,
    W_2, V_GS_2, V_DS_2,
    W_3, V_GS_3, V_DS_3,
    W_4, V_GS_4, V_DS_4,
    W_5, V_GS_5, V_DS_5,   
    // Output signals
    out_n
);

//==================================
//   INPUT AND OUTPUT DECLARATION                         
//==================================
input [2:0] W_0, V_GS_0, V_DS_0;
input [2:0] W_1, V_GS_1, V_DS_1;
input [2:0] W_2, V_GS_2, V_DS_2;
input [2:0] W_3, V_GS_3, V_DS_3;
input [2:0] W_4, V_GS_4, V_DS_4;
input [2:0] W_5, V_GS_5, V_DS_5;
input [1:0] mode;
output [9:0] out_n;


//===================================
//   WIRE DECLARATION                         
//===================================
wire [9:0] ID_0 , gm_0;
wire [9:0] ID_1 , gm_1;
wire [9:0] ID_2 , gm_2;
wire [9:0] ID_3 , gm_3;
wire [9:0] ID_4 , gm_4;
wire [9:0] ID_5 , gm_5;

wire [9:0] ID_0_f, gm_0_f;
wire [9:0] ID_1_f, gm_1_f;
wire [9:0] ID_2_f, gm_2_f; 
wire [9:0] ID_3_f, gm_3_f;
wire [9:0] ID_4_f, gm_4_f;
wire [9:0] ID_5_f, gm_5_f;


//==================================
//   CURCUIT                          
//==================================

ID_gm_calculation D1 (
    // Input signals
    .W_0({ 7'd0 , W_0}), .V_GS_0({ 7'd0 , V_GS_0}), .V_DS_0({ 7'd0 , V_DS_0}),
    .W_1({ 7'd0 , W_1}), .V_GS_1({ 7'd0 , V_GS_1}), .V_DS_1({ 7'd0 , V_DS_1}),
    .W_2({ 7'd0 , W_2}), .V_GS_2({ 7'd0 , V_GS_2}), .V_DS_2({ 7'd0 , V_DS_2}),
    .W_3({ 7'd0 , W_3}), .V_GS_3({ 7'd0 , V_GS_3}), .V_DS_3({ 7'd0 , V_DS_3}),
    .W_4({ 7'd0 , W_4}), .V_GS_4({ 7'd0 , V_GS_4}), .V_DS_4({ 7'd0 , V_DS_4}),
    .W_5({ 7'd0 , W_5}), .V_GS_5({ 7'd0 , V_GS_5}), .V_DS_5({ 7'd0 , V_DS_5}),
    // Output signals
    .ID_0(ID_0), .gm_0(gm_0),
    .ID_1(ID_1), .gm_1(gm_1),
    .ID_2(ID_2), .gm_2(gm_2),
    .ID_3(ID_3), .gm_3(gm_3),
    .ID_4(ID_4), .gm_4(gm_4),
    .ID_5(ID_5), .gm_5(gm_5)   
);

sort D2 (
 // Input signals
    .ID_0(ID_0), .gm_0(gm_0),
    .ID_1(ID_1), .gm_1(gm_1),
    .ID_2(ID_2), .gm_2(gm_2),
    .ID_3(ID_3), .gm_3(gm_3),
    .ID_4(ID_4), .gm_4(gm_4),
    .ID_5(ID_5), .gm_5(gm_5),
    // Output signals
    .ID_0_f(ID_0_f), .gm_0_f(gm_0_f),
    .ID_1_f(ID_1_f), .gm_1_f(gm_1_f),
    .ID_2_f(ID_2_f), .gm_2_f(gm_2_f),
    .ID_3_f(ID_3_f), .gm_3_f(gm_3_f),
    .ID_4_f(ID_4_f), .gm_4_f(gm_4_f),
    .ID_5_f(ID_5_f), .gm_5_f(gm_5_f)
    );

max_min_calculation D7(
    // input signals
    .mode(mode),
    .ID_0_f(ID_0_f), .gm_0_f(gm_0_f),
    .ID_1_f(ID_1_f), .gm_1_f(gm_1_f),
    .ID_2_f(ID_2_f), .gm_2_f(gm_2_f),
    .ID_3_f(ID_3_f), .gm_3_f(gm_3_f),
    .ID_4_f(ID_4_f), .gm_4_f(gm_4_f),
    .ID_5_f(ID_5_f), .gm_5_f(gm_5_f),
    // output signals
    .out(out_n)
    );



endmodule


//================================================================
//   ID/gm CALCULATION BLOCK                        
//================================================================
module ID_gm_calculation(
    // Input signals
    W_0, V_GS_0, V_DS_0,
    W_1, V_GS_1, V_DS_1,
    W_2, V_GS_2, V_DS_2,
    W_3, V_GS_3, V_DS_3,
    W_4, V_GS_4, V_DS_4,
    W_5, V_GS_5, V_DS_5,
    // Output signals
    ID_0, gm_0,
    ID_1, gm_1,
    ID_2, gm_2,
    ID_3, gm_3,
    ID_4, gm_4,
    ID_5, gm_5   
);

//===================================
//   INPUT AND OUTPUT DECLARATION                         
//===================================
input [9:0] W_0, V_GS_0, V_DS_0;
input [9:0] W_1, V_GS_1, V_DS_1;
input [9:0] W_2, V_GS_2, V_DS_2;
input [9:0] W_3, V_GS_3, V_DS_3;
input [9:0] W_4, V_GS_4, V_DS_4;
input [9:0] W_5, V_GS_5, V_DS_5;
output [9:0] ID_0, gm_0;
output [9:0] ID_1, gm_1;
output [9:0] ID_2, gm_2;
output [9:0] ID_3, gm_3;
output [9:0] ID_4, gm_4;
output [9:0] ID_5, gm_5;  


//===================================
//   WIRE DECLARATION                         
//===================================
wire [9:0] Vov_0, W_Vds_0, W_Vov_0 ;
wire [9:0] Vov_1, W_Vds_1, W_Vov_1 ;
wire [9:0] Vov_2, W_Vds_2, W_Vov_2 ;
wire [9:0] Vov_3, W_Vds_3, W_Vov_3 ;
wire [9:0] Vov_4, W_Vds_4, W_Vov_4 ;
wire [9:0] Vov_5, W_Vds_5, W_Vov_5 ;

wire [9:0] W_Vov_Vds_0, shift1_2_0, Vds_0_0 ;
wire [9:0] W_Vov_Vds_1, shift1_2_1, Vds_0_1 ;
wire [9:0] W_Vov_Vds_2, shift1_2_2, Vds_0_2 ;
wire [9:0] W_Vov_Vds_3, shift1_2_3, Vds_0_3 ;
wire [9:0] W_Vov_Vds_4, shift1_2_4, Vds_0_4 ;
wire [9:0] W_Vov_Vds_5, shift1_2_5, Vds_0_5 ;

wire [9:0] Vov_shift_0 ;
wire [9:0] Vov_shift_1 ;
wire [9:0] Vov_shift_2 ;
wire [9:0] Vov_shift_3 ;
wire [9:0] Vov_shift_4 ;
wire [9:0] Vov_shift_5 ;

wire [9:0] W_Vov_shift_0, W_Vds_shift_0, W_Vov_Vds_shift_0 ;
wire [9:0] W_Vov_shift_1, W_Vds_shift_1, W_Vov_Vds_shift_1 ;
wire [9:0] W_Vov_shift_2, W_Vds_shift_2, W_Vov_Vds_shift_2 ;
wire [9:0] W_Vov_shift_3, W_Vds_shift_3, W_Vov_Vds_shift_3 ;
wire [9:0] W_Vov_shift_4, W_Vds_shift_4, W_Vov_Vds_shift_4 ;
wire [9:0] W_Vov_shift_5, W_Vds_shift_5, W_Vov_Vds_shift_5 ;

wire [9:0] a_0, b_0 ;
wire [9:0] a_1, b_1 ;
wire [9:0] a_2, b_2 ;
wire [9:0] a_3, b_3 ;
wire [9:0] a_4, b_4 ;
wire [9:0] a_5, b_5 ;

//======================
//      CIRCUIT                        
//======================

assign Vov_0 = V_GS_0 - 10'd1 ;
assign Vov_1 = V_GS_1 - 10'd1 ;
assign Vov_2 = V_GS_2 - 10'd1 ;
assign Vov_3 = V_GS_3 - 10'd1 ;
assign Vov_4 = V_GS_4 - 10'd1 ;
assign Vov_5 = V_GS_5 - 10'd1 ;

assign W_Vds_0 = V_DS_0*W_0 ;
assign W_Vds_1 = V_DS_1*W_1 ;
assign W_Vds_2 = V_DS_2*W_2 ;
assign W_Vds_3 = V_DS_3*W_3 ;
assign W_Vds_4 = V_DS_4*W_4 ;
assign W_Vds_5 = V_DS_5*W_5 ;

assign W_Vov_0 = Vov_0*W_0 ;
assign W_Vov_1 = Vov_1*W_1 ;
assign W_Vov_2 = Vov_2*W_2 ;
assign W_Vov_3 = Vov_3*W_3 ;
assign W_Vov_4 = Vov_4*W_4 ;
assign W_Vov_5 = Vov_5*W_5 ;

assign Vov_shift_0 = Vov_0<<1 ;
assign Vov_shift_1 = Vov_1<<1 ;
assign Vov_shift_2 = Vov_2<<1 ;
assign Vov_shift_3 = Vov_3<<1 ;
assign Vov_shift_4 = Vov_4<<1 ;
assign Vov_shift_5 = Vov_5<<1 ;

assign W_Vov_shift_0 = W_Vov_0<<1 ;
assign W_Vov_shift_1 = W_Vov_1<<1 ;
assign W_Vov_shift_2 = W_Vov_2<<1 ;
assign W_Vov_shift_3 = W_Vov_3<<1 ;
assign W_Vov_shift_4 = W_Vov_4<<1 ;
assign W_Vov_shift_5 = W_Vov_5<<1 ;

assign W_Vds_shift_0 = W_Vds_0<<1 ;
assign W_Vds_shift_1 = W_Vds_1<<1 ;
assign W_Vds_shift_2 = W_Vds_2<<1 ;
assign W_Vds_shift_3 = W_Vds_3<<1 ;
assign W_Vds_shift_4 = W_Vds_4<<1 ;
assign W_Vds_shift_5 = W_Vds_5<<1 ;

//===================================
//  CURRENT CALCULATION CIRCUIT                        
//===================================

// 0
assign W_Vov_Vds_0 = (Vov_0>V_DS_0) ? W_Vds_0 : W_Vov_0 ;
assign shift1_2_0 = (Vov_0>V_DS_0) ? Vov_shift_0 : Vov_0 ;
assign Vds_0_0 = (Vov_0>V_DS_0) ? V_DS_0 : 10'd0 ;
assign a_0 = shift1_2_0 - Vds_0_0 ;
assign b_0 = a_0 * W_Vov_Vds_0 ;
assign ID_0 = b_0 / 10'd3 ;

// 1
assign W_Vov_Vds_1 = (Vov_1>V_DS_1) ? W_Vds_1 : W_Vov_1 ;
assign shift1_2_1 = (Vov_1>V_DS_1) ? Vov_shift_1 : Vov_1 ;
assign Vds_0_1 = (Vov_1>V_DS_1) ? V_DS_1 : 10'd0 ;
assign a_1 = shift1_2_1 - Vds_0_1 ;
assign b_1 = a_1 * W_Vov_Vds_1 ;
assign ID_1 = b_1 / 10'd3 ;

// 2
assign W_Vov_Vds_2 = (Vov_2>V_DS_2) ? W_Vds_2 : W_Vov_2 ;
assign shift1_2_2 = (Vov_2>V_DS_2) ? Vov_shift_2 : Vov_2 ;
assign Vds_0_2 = (Vov_2>V_DS_2) ? V_DS_2 : 10'd0 ;
assign a_2 = shift1_2_2 - Vds_0_2 ;
assign b_2 = a_2 * W_Vov_Vds_2 ;
assign ID_2 = b_2 / 10'd3 ;

// 3
assign W_Vov_Vds_3 = (Vov_3>V_DS_3) ? W_Vds_3 : W_Vov_3 ;
assign shift1_2_3 = (Vov_3>V_DS_3) ? Vov_shift_3 : Vov_3 ;
assign Vds_0_3 = (Vov_3>V_DS_3) ? V_DS_3 : 10'd0 ;
assign a_3 = shift1_2_3 - Vds_0_3 ;
assign b_3 = a_3 * W_Vov_Vds_3 ;
assign ID_3 = b_3 / 10'd3 ;

// 4
assign W_Vov_Vds_4 = (Vov_4>V_DS_4) ? W_Vds_4 : W_Vov_4 ;
assign shift1_2_4 = (Vov_4>V_DS_4) ? Vov_shift_4 : Vov_4 ;
assign Vds_0_4 = (Vov_4>V_DS_4) ? V_DS_4 : 10'd0 ;
assign a_4 = shift1_2_4 - Vds_0_4 ;
assign b_4 = a_4 * W_Vov_Vds_4 ;
assign ID_4 = b_4 / 10'd3 ;

// 5
assign W_Vov_Vds_5 = (Vov_5>V_DS_5) ? W_Vds_5 : W_Vov_5 ;
assign shift1_2_5 = (Vov_5>V_DS_5) ? Vov_shift_5 : Vov_5 ;
assign Vds_0_5 = (Vov_5>V_DS_5) ? V_DS_5 : 10'd0 ;
assign a_5 = shift1_2_5 - Vds_0_5 ;
assign b_5 = a_5 * W_Vov_Vds_5 ;
assign ID_5 = b_5 / 10'd3 ;


//===================================
//  TRANSCONDUCTANCE CALCULATION CIRCUIT                        
//===================================

assign W_Vov_Vds_shift_0 = (Vov_0>V_DS_0) ? W_Vds_shift_0 : W_Vov_shift_0 ;
assign gm_0 = W_Vov_Vds_shift_0 / 10'd3 ; 

assign W_Vov_Vds_shift_1 = (Vov_1>V_DS_1) ? W_Vds_shift_1 : W_Vov_shift_1 ;
assign gm_1 = W_Vov_Vds_shift_1 / 10'd3 ;

assign W_Vov_Vds_shift_2 = (Vov_2>V_DS_2) ? W_Vds_shift_2 : W_Vov_shift_2 ;
assign gm_2 = W_Vov_Vds_shift_2 / 10'd3 ;

assign W_Vov_Vds_shift_3 = (Vov_3>V_DS_3) ? W_Vds_shift_3 : W_Vov_shift_3 ;
assign gm_3 = W_Vov_Vds_shift_3 / 10'd3 ;

assign W_Vov_Vds_shift_4 = (Vov_4>V_DS_4) ? W_Vds_shift_4 : W_Vov_shift_4 ;
assign gm_4 = W_Vov_Vds_shift_4 / 10'd3 ;

assign W_Vov_Vds_shift_5 = (Vov_5>V_DS_5) ? W_Vds_shift_5 : W_Vov_shift_5 ;
assign gm_5 = W_Vov_Vds_shift_5 / 10'd3 ;

endmodule



//================================================================
//   SORT BLOCK                        
//================================================================
module sort (
    // Input signals
    ID_0, gm_0,
    ID_1, gm_1,
    ID_2, gm_2,
    ID_3, gm_3,
    ID_4, gm_4,
    ID_5, gm_5,
    // Output signals
    ID_0_f, gm_0_f,
    ID_1_f, gm_1_f,
    ID_2_f, gm_2_f,
    ID_3_f, gm_3_f,
    ID_4_f, gm_4_f,
    ID_5_f, gm_5_f
);

//==================================
//   INPUT AND OUTPUT DECLARATION                         
//==================================
input [9:0] ID_0, gm_0;
input [9:0] ID_1, gm_1;
input [9:0] ID_2, gm_2;
input [9:0] ID_3, gm_3;
input [9:0] ID_4, gm_4;
input [9:0] ID_5, gm_5;
output [9:0] ID_0_f, gm_0_f;
output [9:0] ID_1_f, gm_1_f;
output [9:0] ID_2_f, gm_2_f;
output [9:0] ID_3_f, gm_3_f;
output [9:0] ID_4_f, gm_4_f;
output [9:0] ID_5_f, gm_5_f;    

//=======================
//   WIRE DECLARATION                         
//=======================
wire [9:0] maxS1_1, medS1_1, minS1_1 ;
wire [9:0] maxS1_2, medS1_2, minS1_2 ;
wire [9:0] gmaxS1_1, gmedS1_1, gminS1_1 ;
wire [9:0] gmaxS1_2, gmedS1_2, gminS1_2 ;


wire [9:0] minS2_1 ;
wire [9:0] maxS2_2, minS2_2 ;
wire [9:0] maxS2_3 ;
wire [9:0] gminS2_1 ;
wire [9:0] gmaxS2_2, gminS2_2 ;
wire [9:0] gmaxS2_3 ;

wire [9:0] maxS3, minS3 ;
wire [9:0] gmaxS3, gminS3 ;

//==================
//   SORT CIRCUIT                          
//==================

// STAGE 1
compare D3 (.a(ID_0),.b(ID_1),.c(ID_2),.max(maxS1_1),.med(medS1_1),.min(minS1_1));
compare D4 (.a(ID_3),.b(ID_4),.c(ID_5),.max(maxS1_2),.med(medS1_2),.min(minS1_2));
compare D5 (.a(gm_0),.b(gm_1),.c(gm_2),.max(gmaxS1_1),.med(gmedS1_1),.min(gminS1_1));
compare D6 (.a(gm_3),.b(gm_4),.c(gm_5),.max(gmaxS1_2),.med(gmedS1_2),.min(gminS1_2));

// STAGE 2
assign ID_0_f = (maxS1_1>maxS1_2) ? maxS1_1 : maxS1_2 ;
assign minS2_1 = (maxS1_1>maxS1_2) ? maxS1_2 : maxS1_1 ;

assign maxS2_2 = (medS1_1>medS1_2) ? medS1_1 : medS1_2 ;
assign minS2_2 = (medS1_1>medS1_2) ? medS1_2 : medS1_1 ;

assign maxS2_3 = (minS1_1>minS1_2) ? minS1_1 : minS1_2 ;
assign ID_5_f = (minS1_1>minS1_2) ? minS1_2 : minS1_1 ;

assign gm_0_f = (gmaxS1_1>gmaxS1_2) ? gmaxS1_1 : gmaxS1_2 ;
assign gminS2_1 = (gmaxS1_1>gmaxS1_2) ? gmaxS1_2 : gmaxS1_1 ;

assign gmaxS2_2 = (gmedS1_1>gmedS1_2) ? gmedS1_1 : gmedS1_2 ;
assign gminS2_2 = (gmedS1_1>gmedS1_2) ? gmedS1_2 : gmedS1_1 ;

assign gmaxS2_3 = (gminS1_1>gminS1_2) ? gminS1_1 : gminS1_2 ;
assign gm_5_f = (gminS1_1>gminS1_2) ? gminS1_2 : gminS1_1 ;

// STAGE 3
assign ID_1_f = (minS2_1>maxS2_2) ? minS2_1 : maxS2_2 ;
assign minS3 = (minS2_1>maxS2_2) ? maxS2_2 : minS2_1 ;

assign maxS3 = (minS2_2>maxS2_3) ? minS2_2 : maxS2_3 ;
assign ID_4_f = (minS2_2>maxS2_3) ? maxS2_3 : minS2_2 ;

assign gm_1_f = (gminS2_1>gmaxS2_2) ? gminS2_1 : gmaxS2_2 ;
assign gminS3 = (gminS2_1>gmaxS2_2) ? gmaxS2_2 : gminS2_1 ;

assign gmaxS3 = (gminS2_2>gmaxS2_3) ? gminS2_2 : gmaxS2_3 ;
assign gm_4_f = (gminS2_2>gmaxS2_3) ? gmaxS2_3 : gminS2_2 ;
// STAGE 4
assign ID_2_f = (maxS3>minS3) ? maxS3 : minS3 ;
assign ID_3_f = (maxS3>minS3) ? minS3 : maxS3 ;

assign gm_2_f = (gmaxS3>gminS3) ? gmaxS3 : gminS3 ;
assign gm_3_f = (gmaxS3>gminS3) ? gminS3 : gmaxS3 ;

endmodule



//================================================================
//   MAX/MIN CALCULATION BLOCK                        
//================================================================
module max_min_calculation(
    // input signals
    mode,
    ID_0_f, gm_0_f,
    ID_1_f, gm_1_f,
    ID_2_f, gm_2_f,
    ID_3_f, gm_3_f,
    ID_4_f, gm_4_f,
    ID_5_f, gm_5_f,
    // output signals
    out
    );

//==================================
//   INPUT AND OUTPUT DECLARATION                         
//==================================
input [1:0] mode;
input [9:0] ID_0_f, gm_0_f;
input [9:0] ID_1_f, gm_1_f;
input [9:0] ID_2_f, gm_2_f;
input [9:0] ID_3_f, gm_3_f;
input [9:0] ID_4_f, gm_4_f;
input [9:0] ID_5_f, gm_5_f;   
output [9:0] out ;


//=======================
//   WIRE DECLARATION                         
//=======================
wire [9:0] ID_n_0_S1, ID_n_1_S1, ID_n_2_S1 ;
wire [9:0] gm_n_0_S1, gm_n_1_S1, gm_n_2_S1 ;

wire [9:0] ID_a, ID_b, ID_c ;
wire [9:0] gm_a, gm_b, gm_c ;

wire [9:0] n0, n1, n2 ;

//=============================
//      OUTPUT CALCULATION                       
//=============================
assign ID_n_0_S1 = (mode[1]==1'b1) ? ID_0_f : ID_3_f ; 
assign ID_n_1_S1 = (mode[1]==1'b1) ? ID_1_f : ID_4_f ; 
assign ID_n_2_S1 = (mode[1]==1'b1) ? ID_2_f : ID_5_f ; 

assign gm_n_0_S1 = (mode[1]==1'b1) ? gm_0_f : gm_3_f ; 
assign gm_n_1_S1 = (mode[1]==1'b1) ? gm_1_f : gm_4_f ; 
assign gm_n_2_S1 = (mode[1]==1'b1) ? gm_2_f : gm_5_f ; 

assign ID_a = (ID_n_0_S1 << 1) + ID_n_0_S1 ;
assign ID_b = ID_n_1_S1 << 2 ;
assign ID_c = (ID_n_2_S1 << 2) + ID_n_2_S1 ;

assign n0 = (mode[0]==1'b1) ? ID_a : gm_n_0_S1 ;
assign n1 = (mode[0]==1'b1) ? ID_b : gm_n_1_S1 ;
assign n2 = (mode[0]==1'b1) ? ID_c : gm_n_2_S1 ;

assign out = n0 + n1 + n2 ;

endmodule


// //================================================================
// //   COMPARETER                        
// //================================================================
module compare (a,b,c,max,med,min);

input [9:0] a,b,c ;
output [9:0] max,med,min ;



assign max = ((a>=b)&&(a>=c)) ? a :
             ((b>=a)&&(b>=c)) ? b : c ;

assign min = ((a<=b)&&(a<=c)) ? a :
             ((b<=a)&&(b<=c)) ? b : c ;

assign med = (((max==a)&&(min==b)) || ((max==b)&&(min==a))) ? c :
             (((max==a)&&(min==c)) || ((max==c)&&(min==a))) ? b : a ;

endmodule 