/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Mon Aug 26 15:52:01 2024
/////////////////////////////////////////////////////////////


module DT_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module DT_DW01_dec_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;

  CLKINVX1 U1 ( .A(n16), .Y(n1) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
  CLKINVX1 U3 ( .A(A[10]), .Y(n3) );
  CLKINVX1 U4 ( .A(A[11]), .Y(n4) );
  AO21X1 U5 ( .A0(n5), .A1(A[9]), .B0(n6), .Y(SUM[9]) );
  OAI2BB1X1 U6 ( .A0N(n7), .A1N(A[8]), .B0(n5), .Y(SUM[8]) );
  OAI2BB1X1 U7 ( .A0N(n8), .A1N(A[7]), .B0(n7), .Y(SUM[7]) );
  OAI2BB1X1 U8 ( .A0N(n9), .A1N(A[6]), .B0(n8), .Y(SUM[6]) );
  OAI2BB1X1 U9 ( .A0N(n10), .A1N(A[5]), .B0(n9), .Y(SUM[5]) );
  OAI2BB1X1 U10 ( .A0N(n11), .A1N(A[4]), .B0(n10), .Y(SUM[4]) );
  OAI2BB1X1 U11 ( .A0N(n12), .A1N(A[3]), .B0(n11), .Y(SUM[3]) );
  OAI2BB1X1 U12 ( .A0N(n13), .A1N(A[2]), .B0(n12), .Y(SUM[2]) );
  OAI2BB1X1 U13 ( .A0N(A[0]), .A1N(A[1]), .B0(n13), .Y(SUM[1]) );
  XOR2X1 U14 ( .A(A[13]), .B(n14), .Y(SUM[13]) );
  NOR2X1 U15 ( .A(A[12]), .B(n15), .Y(n14) );
  XNOR2X1 U16 ( .A(A[12]), .B(n15), .Y(SUM[12]) );
  OAI21XL U17 ( .A0(n1), .A1(n4), .B0(n15), .Y(SUM[11]) );
  NAND2X1 U18 ( .A(n1), .B(n4), .Y(n15) );
  OAI21XL U19 ( .A0(n6), .A1(n3), .B0(n16), .Y(SUM[10]) );
  NAND2X1 U20 ( .A(n6), .B(n3), .Y(n16) );
  NOR2X1 U21 ( .A(n5), .B(A[9]), .Y(n6) );
  OR2X1 U22 ( .A(n7), .B(A[8]), .Y(n5) );
  OR2X1 U23 ( .A(n8), .B(A[7]), .Y(n7) );
  OR2X1 U24 ( .A(n9), .B(A[6]), .Y(n8) );
  OR2X1 U25 ( .A(n10), .B(A[5]), .Y(n9) );
  OR2X1 U26 ( .A(n11), .B(A[4]), .Y(n10) );
  OR2X1 U27 ( .A(n12), .B(A[3]), .Y(n11) );
  OR2X1 U28 ( .A(n13), .B(A[2]), .Y(n12) );
  NAND2BX1 U29 ( .AN(A[1]), .B(SUM[0]), .Y(n13) );
endmodule


module DT_DW01_inc_1_DW01_inc_2 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module DT_DW01_inc_2_DW01_inc_3 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module DT_DW01_inc_3_DW01_inc_4 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  CMPR22X2 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  CMPR22X2 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  INVXL U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module DT_DW01_inc_4_DW01_inc_5 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd;
  wire   ok, N66, N67, \cout[3] , N73, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N98, N99, N100, N101, N102, N103, N104, N105, N106, N107,
         N110, N111, N112, N113, N114, N115, N116, N117, N118, N119, N120,
         N121, N122, N143, N144, N145, N146, N147, N148, N149, N150, N151,
         N152, N153, N154, N155, N161, N184, N186, N187, N188, N189, N190,
         N191, N192, N193, N194, N195, N196, N197, N219, N220, N221, N222,
         N224, N225, N226, N227, N228, N229, N230, N231, N232, N233, N234,
         N235, N236, N237, N238, N239, N240, N241, N242, N243, N290, N291,
         N292, N293, N294, N295, N297, N298, N299, N300, N301, N350, N351,
         N352, N353, N354, N355, N356, N357, N358, N359, N360, N361, N362,
         N363, N364, N365, N366, N367, N368, N369, N370, N371, N372, N373,
         N374, N375, N406, N407, N408, N409, N410, N411, N412, N413, N414,
         N415, N416, N417, N432, N433, N434, N435, N436, N437, N438, N439,
         N440, N441, N442, N443, N444, N445, N488, N489, N490, N491, N492,
         N493, N494, N495, N496, N497, N498, N499, N500, N501, N502, N503,
         N504, N505, N506, N507, N508, N509, N510, N511, N512, N513, N514,
         N515, N701, N781, N782, N783, N784, N785, N786, N787, N788, N789,
         N827, N828, N829, N830, N831, N832, N833, N834, N851, N872, N873,
         N874, N875, N876, N877, N878, N879, N928, N930, N950, N959, N974,
         N975, N976, N977, N990, n111, n114, n115, n117, n118, n120, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n152, n155, n157, n159, n160, n161, n162, n164, n165,
         n166, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, N347, N346, N345, N344, N343, N342, N341, N340,
         N339, N338, N337, N336, \add_192/A[8] , \add_192/A[9] ,
         \add_192/A[10] , \add_192/A[11] , \add_192/A[12] , \add_192/A[13] ,
         \r528/carry[2] , \r528/carry[3] , \r528/carry[4] , \r528/carry[5] ,
         \r528/carry[6] , \r528/carry[7] , \r528/carry[8] , \r528/carry[9] ,
         \r528/carry[10] , \r528/carry[11] , \r528/carry[12] ,
         \r528/carry[13] , \r516/carry[2] , \r516/carry[3] , \r516/carry[4] ,
         \r516/carry[5] , \r516/carry[6] , \r516/carry[7] , \r516/carry[8] ,
         \r516/carry[9] , \r516/carry[10] , \r516/carry[11] , \r516/carry[12] ,
         \r516/carry[13] , \r513/carry[2] , \r513/carry[3] , \r513/carry[4] ,
         \r513/carry[5] , \r513/carry[6] , \r513/carry[7] , \r513/carry[8] ,
         \r513/carry[9] , \r513/carry[10] , \r513/carry[11] , \r513/carry[12] ,
         \r513/carry[13] , n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602;
  wire   [1:0] state;
  wire   [1:0] next_state;
  wire   [13:0] i;
  wire   [7:0] temp;
  wire   [13:1] \add_192/carry ;
  wire   [13:1] \add_177/carry ;
  wire   [13:1] \add_176/carry ;
  wire   [13:1] \r527/carry ;
  wire   [14:0] \r515/carry ;
  wire   [13:1] \add_193/carry ;
  wire   [14:0] \sub_193/carry ;

  DFFRX4 \res_addr_reg[0]  ( .D(N432), .CK(clk), .RN(reset), .Q(res_addr[0]), 
        .QN(n138) );
  DFFRX4 \sti_addr_reg[0]  ( .D(N98), .CK(clk), .RN(n505), .Q(sti_addr[0]) );
  DFFRX4 \res_addr_reg[2]  ( .D(N434), .CK(clk), .RN(n506), .Q(res_addr[2]), 
        .QN(n136) );
  DFFRX4 \res_addr_reg[9]  ( .D(N441), .CK(clk), .RN(n504), .Q(res_addr[9]), 
        .QN(n129) );
  DFFRX4 \res_addr_reg[12]  ( .D(N444), .CK(clk), .RN(n504), .Q(res_addr[12]), 
        .QN(n126) );
  OAI211X2 U120 ( .A0(N701), .A1(n246), .B0(n222), .C0(n266), .Y(n241) );
  DFFRX1 ok_reg ( .D(N73), .CK(clk), .RN(reset), .Q(ok), .QN(n115) );
  DFFRX2 \res_do_reg[1]  ( .D(n445), .CK(clk), .RN(n504), .Q(res_do[1]) );
  DFFRX2 \res_do_reg[2]  ( .D(n444), .CK(clk), .RN(n505), .Q(res_do[2]) );
  DFFRX2 \res_do_reg[3]  ( .D(n443), .CK(clk), .RN(reset), .Q(res_do[3]) );
  DFFRX2 \res_do_reg[4]  ( .D(n442), .CK(clk), .RN(reset), .Q(res_do[4]) );
  DFFRX2 \res_do_reg[5]  ( .D(n441), .CK(clk), .RN(reset), .Q(res_do[5]) );
  DFFRX2 \res_do_reg[6]  ( .D(n440), .CK(clk), .RN(reset), .Q(res_do[6]) );
  DFFRX2 \res_do_reg[7]  ( .D(n439), .CK(clk), .RN(reset), .Q(res_do[7]) );
  DFFRX1 \cout_reg[3]  ( .D(N977), .CK(clk), .RN(n504), .Q(\cout[3] ), .QN(
        n162) );
  DFFRX1 \cout_reg[2]  ( .D(N976), .CK(clk), .RN(n506), .Q(n524), .QN(n164) );
  DFFRX1 \state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n504), .Q(state[0]), 
        .QN(n114) );
  DFFRX1 \state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n506), .Q(state[1]), 
        .QN(n111) );
  DFFRX1 \temp_reg[7]  ( .D(N834), .CK(clk), .RN(n504), .Q(temp[7]), .QN(n574)
         );
  DFFRX2 \temp_reg[6]  ( .D(N833), .CK(clk), .RN(n504), .Q(temp[6]), .QN(n155)
         );
  DFFRX2 \i_reg[13]  ( .D(n446), .CK(clk), .RN(n506), .Q(i[13]), .QN(n139) );
  DFFRX1 \temp_reg[3]  ( .D(N830), .CK(clk), .RN(reset), .Q(temp[3]), .QN(n572) );
  DFFRX1 \i_reg[12]  ( .D(n459), .CK(clk), .RN(n506), .Q(i[12]), .QN(n140) );
  DFFRX1 \temp_reg[1]  ( .D(N828), .CK(clk), .RN(n504), .Q(temp[1]), .QN(n160)
         );
  DFFRX1 \temp_reg[0]  ( .D(N827), .CK(clk), .RN(n504), .Q(temp[0]), .QN(n161)
         );
  DFFRX1 \i_reg[11]  ( .D(n447), .CK(clk), .RN(n505), .Q(i[11]), .QN(n141) );
  DFFRX1 \temp_reg[2]  ( .D(N829), .CK(clk), .RN(reset), .Q(temp[2]), .QN(n159) );
  DFFRX1 \i_reg[10]  ( .D(n448), .CK(clk), .RN(n505), .Q(i[10]), .QN(n142) );
  DFFRX1 \i_reg[9]  ( .D(n449), .CK(clk), .RN(n505), .Q(i[9]), .QN(n143) );
  DFFRX1 \i_reg[8]  ( .D(n450), .CK(clk), .RN(n505), .Q(i[8]), .QN(n144) );
  DFFRX1 \i_reg[7]  ( .D(n451), .CK(clk), .RN(n505), .Q(i[7]), .QN(n145) );
  DFFRX1 \i_reg[6]  ( .D(n452), .CK(clk), .RN(n506), .Q(N222), .QN(n146) );
  DFFRX1 \i_reg[5]  ( .D(n453), .CK(clk), .RN(n506), .Q(N221), .QN(n147) );
  DFFRX1 \i_reg[3]  ( .D(n455), .CK(clk), .RN(n506), .Q(N219), .QN(n149) );
  TLATNX1 \next_state_reg[0]  ( .D(N66), .GN(N990), .Q(next_state[0]) );
  TLATNX1 \next_state_reg[1]  ( .D(N67), .GN(N990), .Q(next_state[1]) );
  DFFRX2 \res_do_reg[0]  ( .D(N950), .CK(clk), .RN(n505), .Q(res_do[0]) );
  DFFRX1 \cout_reg[1]  ( .D(N975), .CK(clk), .RN(reset), .Q(n525), .QN(n165)
         );
  DFFRX1 \cout_reg[0]  ( .D(N974), .CK(clk), .RN(reset), .Q(n526), .QN(n166)
         );
  DFFRX1 \temp_reg[4]  ( .D(N831), .CK(clk), .RN(reset), .Q(temp[4]), .QN(n157) );
  DFFRX2 res_wr_reg ( .D(N959), .CK(clk), .RN(n505), .Q(res_wr) );
  DFFRX1 \i_reg[4]  ( .D(n454), .CK(clk), .RN(n506), .Q(N220), .QN(n148) );
  DFFRX4 \i_reg[1]  ( .D(n457), .CK(clk), .RN(reset), .Q(n464), .QN(n465) );
  DFFRX1 \i_reg[2]  ( .D(n456), .CK(clk), .RN(n505), .Q(n469), .QN(n462) );
  DFFRX2 res_rd_reg ( .D(N161), .CK(clk), .RN(reset), .Q(res_rd), .QN(n120) );
  DFFRX2 \res_addr_reg[1]  ( .D(N433), .CK(clk), .RN(reset), .Q(res_addr[1]), 
        .QN(n137) );
  DFFRX2 \sti_addr_reg[2]  ( .D(N100), .CK(clk), .RN(n504), .Q(sti_addr[2]) );
  DFFRX2 \sti_addr_reg[1]  ( .D(N99), .CK(clk), .RN(n506), .Q(sti_addr[1]), 
        .QN(n118) );
  DFFRX2 \sti_addr_reg[3]  ( .D(N101), .CK(clk), .RN(n506), .Q(sti_addr[3]) );
  DFFRX2 \sti_addr_reg[4]  ( .D(N102), .CK(clk), .RN(n505), .Q(sti_addr[4]) );
  DFFRX2 \sti_addr_reg[5]  ( .D(N103), .CK(clk), .RN(n505), .Q(sti_addr[5]) );
  DFFRX2 \sti_addr_reg[6]  ( .D(N104), .CK(clk), .RN(n506), .Q(sti_addr[6]) );
  DFFRX2 \sti_addr_reg[7]  ( .D(N105), .CK(clk), .RN(n506), .Q(sti_addr[7]) );
  DFFRX2 \sti_addr_reg[8]  ( .D(N106), .CK(clk), .RN(n506), .Q(sti_addr[8]) );
  DFFRX2 \sti_addr_reg[9]  ( .D(N107), .CK(clk), .RN(n506), .Q(sti_addr[9]) );
  DFFRX2 \res_addr_reg[6]  ( .D(N438), .CK(clk), .RN(n506), .Q(res_addr[6]), 
        .QN(n132) );
  DFFRX2 \res_addr_reg[3]  ( .D(N435), .CK(clk), .RN(n505), .Q(res_addr[3]), 
        .QN(n135) );
  DFFRX2 \res_addr_reg[4]  ( .D(N436), .CK(clk), .RN(n505), .Q(res_addr[4]), 
        .QN(n134) );
  DFFRX2 \res_addr_reg[5]  ( .D(N437), .CK(clk), .RN(n505), .Q(res_addr[5]), 
        .QN(n133) );
  DFFRX2 \res_addr_reg[13]  ( .D(N445), .CK(clk), .RN(n504), .Q(res_addr[13]), 
        .QN(n125) );
  DFFRX2 \res_addr_reg[7]  ( .D(N439), .CK(clk), .RN(n504), .Q(res_addr[7]), 
        .QN(n131) );
  DFFRX2 \res_addr_reg[8]  ( .D(N440), .CK(clk), .RN(n504), .Q(res_addr[8]), 
        .QN(n130) );
  DFFRX2 \res_addr_reg[10]  ( .D(N442), .CK(clk), .RN(n504), .Q(res_addr[10]), 
        .QN(n128) );
  DFFRX2 \res_addr_reg[11]  ( .D(N443), .CK(clk), .RN(n504), .Q(res_addr[11]), 
        .QN(n127) );
  DFFRX2 \i_reg[0]  ( .D(n458), .CK(clk), .RN(n505), .Q(N184), .QN(n152) );
  NAND4X2 U364 ( .A(n420), .B(n421), .C(n422), .D(n423), .Y(n223) );
  OAI222X1 U365 ( .A0(temp[6]), .A1(n559), .B0(n581), .B1(n559), .C0(temp[6]), 
        .C1(n581), .Y(n570) );
  OAI222X1 U366 ( .A0(N786), .A1(n552), .B0(N786), .B1(n558), .C0(n552), .C1(
        n558), .Y(n559) );
  OAI22X1 U367 ( .A0(n138), .A1(n487), .B0(n152), .B1(n488), .Y(n355) );
  AND2X2 U368 ( .A(\r516/carry[8] ), .B(\add_192/A[8] ), .Y(\r516/carry[9] )
         );
  OR2X1 U369 ( .A(n509), .B(\r515/carry [7]), .Y(\r515/carry [8]) );
  OR2X1 U370 ( .A(n462), .B(n465), .Y(\r515/carry [3]) );
  OR2X1 U371 ( .A(n147), .B(\r515/carry [5]), .Y(\r515/carry [6]) );
  XNOR2X1 U372 ( .A(i[13]), .B(n482), .Y(\add_192/A[13] ) );
  AND2X2 U373 ( .A(\r527/carry [3]), .B(N291), .Y(\r527/carry [4]) );
  CLKBUFX3 U374 ( .A(n202), .Y(n478) );
  CLKINVX1 U375 ( .A(n460), .Y(n601) );
  NAND3X1 U376 ( .A(n470), .B(n471), .C(n472), .Y(N832) );
  OR2X1 U377 ( .A(n243), .B(n552), .Y(n472) );
  NAND2X1 U378 ( .A(n318), .B(n319), .Y(N440) );
  AOI221XL U379 ( .A0(N224), .A1(n485), .B0(n486), .B1(N412), .C0(n321), .Y(
        n318) );
  CLKAND2X3 U380 ( .A(n217), .B(n218), .Y(n461) );
  CLKBUFX3 U381 ( .A(n469), .Y(n498) );
  CLKBUFX3 U382 ( .A(N219), .Y(n499) );
  CLKBUFX3 U383 ( .A(N220), .Y(n500) );
  CLKINVX1 U384 ( .A(n497), .Y(N488) );
  AOI32XL U385 ( .A0(n526), .A1(n117), .A2(n593), .B0(n230), .B1(n166), .Y(
        n234) );
  AO22XL U386 ( .A0(n526), .A1(n236), .B0(N230), .B1(n296), .Y(n352) );
  NAND3XL U387 ( .A(n460), .B(n526), .C(n230), .Y(n228) );
  NOR4XL U388 ( .A(n526), .B(n290), .C(n601), .D(n118), .Y(n289) );
  XNOR2X2 U389 ( .A(\r515/carry [10]), .B(n142), .Y(\add_192/A[10] ) );
  CLKXOR2X2 U390 ( .A(\r515/carry [9]), .B(n494), .Y(\add_192/A[9] ) );
  AND2X2 U391 ( .A(\r527/carry [5]), .B(N293), .Y(\r527/carry [6]) );
  AND2X2 U392 ( .A(\r527/carry [7]), .B(N295), .Y(\r527/carry [8]) );
  OA21XL U393 ( .A0(N789), .A1(n245), .B0(n223), .Y(n473) );
  NAND2X1 U394 ( .A(n476), .B(n477), .Y(N417) );
  NAND2X1 U395 ( .A(\add_192/A[13] ), .B(n475), .Y(n476) );
  NAND2BX1 U396 ( .AN(n530), .B(n540), .Y(n535) );
  BUFX4 U397 ( .A(n183), .Y(n463) );
  AND2XL U398 ( .A(\r516/carry[4] ), .B(N292), .Y(\r516/carry[5] ) );
  INVXL U399 ( .A(\r515/carry [8]), .Y(n479) );
  AND2XL U400 ( .A(n466), .B(\r527/carry [11]), .Y(\r527/carry [13]) );
  NAND2XL U401 ( .A(n474), .B(\r527/carry [13]), .Y(n477) );
  AND2X2 U402 ( .A(n467), .B(n468), .Y(n201) );
  OAI21XL U403 ( .A0(n491), .A1(n139), .B0(n201), .Y(n446) );
  AND2X2 U404 ( .A(\add_192/A[12] ), .B(\add_192/A[11] ), .Y(n466) );
  XNOR2X2 U405 ( .A(\r515/carry [11]), .B(n141), .Y(\add_192/A[11] ) );
  XOR2XL U406 ( .A(N291), .B(\r516/carry[3] ), .Y(N145) );
  AND2XL U407 ( .A(\r516/carry[3] ), .B(N291), .Y(\r516/carry[4] ) );
  AND2X2 U408 ( .A(\r516/carry[6] ), .B(N294), .Y(\r516/carry[7] ) );
  XOR2X1 U409 ( .A(\add_192/A[12] ), .B(\r516/carry[12] ), .Y(N154) );
  CLKINVX1 U410 ( .A(\r527/carry [13]), .Y(n475) );
  NAND2X1 U411 ( .A(N501), .B(n478), .Y(n467) );
  NAND2XL U412 ( .A(N515), .B(n461), .Y(n468) );
  OR2XL U413 ( .A(n148), .B(\r515/carry [4]), .Y(\r515/carry [5]) );
  NAND2X2 U414 ( .A(n480), .B(n481), .Y(\add_192/A[8] ) );
  AND2XL U415 ( .A(\r516/carry[5] ), .B(N293), .Y(\r516/carry[6] ) );
  NAND4X1 U416 ( .A(n357), .B(n358), .C(n359), .D(n360), .Y(n354) );
  INVX1 U417 ( .A(n498), .Y(n507) );
  OR2X1 U418 ( .A(n583), .B(n241), .Y(n470) );
  OR2XL U419 ( .A(n242), .B(n582), .Y(n471) );
  NAND2X4 U420 ( .A(n473), .B(n247), .Y(n242) );
  NAND2XL U421 ( .A(res_di[2]), .B(n159), .Y(n540) );
  OR2X1 U422 ( .A(n143), .B(\r515/carry [9]), .Y(\r515/carry [10]) );
  OR2X1 U423 ( .A(n142), .B(\r515/carry [10]), .Y(\r515/carry [11]) );
  XNOR2X1 U424 ( .A(n465), .B(n462), .Y(N290) );
  NAND2BX1 U425 ( .AN(n199), .B(n198), .Y(n183) );
  AND4X1 U426 ( .A(n248), .B(n249), .C(n250), .D(n251), .Y(n245) );
  CLKBUFX3 U427 ( .A(N184), .Y(n497) );
  NOR4X1 U428 ( .A(n431), .B(n432), .C(n433), .D(n434), .Y(n421) );
  XNOR2XL U429 ( .A(n134), .B(n500), .Y(n273) );
  XNOR2X1 U430 ( .A(n125), .B(N417), .Y(n260) );
  OAI21X1 U431 ( .A0(N788), .A1(n574), .B0(n571), .Y(N789) );
  CLKINVX1 U432 ( .A(\add_192/A[13] ), .Y(n474) );
  AND2XL U433 ( .A(\add_192/carry [11]), .B(\add_192/A[11] ), .Y(
        \add_192/carry [12]) );
  AND2XL U434 ( .A(\add_192/carry [10]), .B(\add_192/A[10] ), .Y(
        \add_192/carry [11]) );
  AND2XL U435 ( .A(\r527/carry [9]), .B(\add_192/A[9] ), .Y(\r527/carry [10])
         );
  AND2XL U436 ( .A(\r527/carry [10]), .B(\add_192/A[10] ), .Y(\r527/carry [11]) );
  AND2XL U437 ( .A(\r527/carry [11]), .B(\add_192/A[11] ), .Y(\r527/carry [12]) );
  AND2XL U438 ( .A(\r527/carry [6]), .B(N294), .Y(\r527/carry [7]) );
  AND2XL U439 ( .A(\r527/carry [4]), .B(N292), .Y(\r527/carry [5]) );
  XOR2XL U440 ( .A(\add_192/A[9] ), .B(\r516/carry[9] ), .Y(N151) );
  XNOR2X2 U441 ( .A(\r515/carry [12]), .B(n140), .Y(\add_192/A[12] ) );
  AND2X2 U442 ( .A(\r516/carry[2] ), .B(N290), .Y(\r516/carry[3] ) );
  NOR3XL U443 ( .A(n577), .B(n576), .C(n598), .Y(n293) );
  INVXL U444 ( .A(n223), .Y(n576) );
  XOR2XL U445 ( .A(N336), .B(\r516/carry[2] ), .Y(N144) );
  NOR2BX4 U446 ( .AN(n235), .B(n244), .Y(n243) );
  AND2XL U447 ( .A(\add_192/carry [12]), .B(\add_192/A[12] ), .Y(
        \add_192/carry [13]) );
  AND2XL U448 ( .A(n152), .B(n464), .Y(\r516/carry[2] ) );
  INVX1 U449 ( .A(N928), .Y(N930) );
  AND2XL U450 ( .A(n497), .B(n464), .Y(\r513/carry[2] ) );
  AND2XL U451 ( .A(n464), .B(N290), .Y(\r527/carry [3]) );
  NAND2XL U452 ( .A(n235), .B(n600), .Y(N959) );
  AND2XL U453 ( .A(n464), .B(n498), .Y(\add_176/carry [3]) );
  AND2XL U454 ( .A(n464), .B(N336), .Y(\add_193/carry [3]) );
  OR2XL U455 ( .A(n464), .B(n497), .Y(\r528/carry[2] ) );
  XOR2XL U456 ( .A(n498), .B(n464), .Y(N186) );
  AOI22XL U457 ( .A0(N490), .A1(n478), .B0(N504), .B1(n461), .Y(n213) );
  INVXL U458 ( .A(N785), .Y(n584) );
  INVXL U459 ( .A(N786), .Y(n582) );
  XNOR2XL U460 ( .A(n136), .B(N336), .Y(n371) );
  NOR3X1 U461 ( .A(n223), .B(n602), .C(n120), .Y(n198) );
  NOR2XL U462 ( .A(n159), .B(res_di[2]), .Y(n530) );
  NAND2BXL U463 ( .AN(N783), .B(temp[2]), .Y(n566) );
  AOI32XL U464 ( .A0(n196), .A1(n197), .A2(N872), .B0(n198), .B1(n238), .Y(
        n237) );
  NOR2XL U465 ( .A(n572), .B(res_di[3]), .Y(n538) );
  NAND2XL U466 ( .A(res_di[3]), .B(n572), .Y(n541) );
  INVXL U467 ( .A(n535), .Y(n553) );
  OAI2BB1XL U468 ( .A0N(res_di[1]), .A1N(n537), .B0(temp[1]), .Y(n536) );
  NOR3X1 U469 ( .A(n599), .B(n120), .C(n222), .Y(n196) );
  XNOR2XL U470 ( .A(n131), .B(N295), .Y(n362) );
  INVXL U471 ( .A(res_di[1]), .Y(n591) );
  INVXL U472 ( .A(res_di[3]), .Y(n587) );
  INVXL U473 ( .A(res_di[2]), .Y(n589) );
  XNOR2XL U474 ( .A(n132), .B(N294), .Y(n361) );
  XNOR2XL U475 ( .A(n133), .B(N293), .Y(n364) );
  INVXL U476 ( .A(res_di[0]), .Y(n592) );
  XNOR2XL U477 ( .A(n134), .B(N292), .Y(n363) );
  XNOR2XL U478 ( .A(n135), .B(N291), .Y(n365) );
  XOR2XL U479 ( .A(n138), .B(n152), .Y(n429) );
  XNOR2XL U480 ( .A(n138), .B(N488), .Y(n366) );
  XOR2XL U481 ( .A(n138), .B(n497), .Y(n403) );
  XNOR2XL U482 ( .A(n138), .B(n497), .Y(n384) );
  XNOR2XL U483 ( .A(n137), .B(n464), .Y(n367) );
  XOR2XL U484 ( .A(n137), .B(n464), .Y(n385) );
  XNOR2XL U485 ( .A(n138), .B(N488), .Y(n257) );
  NOR2X1 U486 ( .A(n111), .B(state[0]), .Y(n194) );
  XNOR2XL U487 ( .A(n135), .B(n499), .Y(n275) );
  XNOR2XL U488 ( .A(n138), .B(n497), .Y(n276) );
  XNOR2XL U489 ( .A(n137), .B(n464), .Y(n277) );
  XNOR2XL U490 ( .A(n136), .B(n498), .Y(n281) );
  NOR4XL U491 ( .A(n464), .B(n152), .C(n507), .D(n149), .Y(n219) );
  NOR2X1 U492 ( .A(state[0]), .B(state[1]), .Y(n460) );
  CLKBUFX3 U493 ( .A(n301), .Y(n488) );
  NOR4X2 U494 ( .A(n117), .B(n194), .C(n195), .D(N990), .Y(n187) );
  NAND2X1 U495 ( .A(n144), .B(n479), .Y(n480) );
  NAND2XL U496 ( .A(n495), .B(\r515/carry [8]), .Y(n481) );
  AND2XL U497 ( .A(\add_192/A[8] ), .B(\add_192/A[9] ), .Y(\add_192/carry [10]) );
  XOR2XL U498 ( .A(\add_192/A[8] ), .B(\r516/carry[8] ), .Y(N150) );
  XOR2XL U499 ( .A(n130), .B(\add_192/A[8] ), .Y(n374) );
  OR2XL U500 ( .A(\add_192/A[8] ), .B(\r527/carry [8]), .Y(\r527/carry [9]) );
  XOR2XL U501 ( .A(\add_192/A[9] ), .B(\add_192/A[8] ), .Y(N297) );
  XNOR2XL U502 ( .A(\r527/carry [8]), .B(\add_192/A[8] ), .Y(N412) );
  CLKINVX1 U503 ( .A(n542), .Y(n554) );
  CLKINVX1 U504 ( .A(n354), .Y(n577) );
  CLKBUFX3 U505 ( .A(n293), .Y(n489) );
  CLKBUFX3 U506 ( .A(n294), .Y(n490) );
  NOR2X1 U507 ( .A(n354), .B(n598), .Y(n294) );
  CLKBUFX3 U508 ( .A(n297), .Y(n485) );
  NOR2X1 U509 ( .A(n353), .B(n597), .Y(n297) );
  OAI33X1 U510 ( .A0(n245), .A1(N789), .A2(n598), .B0(n246), .B1(N701), .B2(
        n597), .Y(n244) );
  NAND2X1 U511 ( .A(N928), .B(n198), .Y(n184) );
  NOR3X1 U512 ( .A(n428), .B(n429), .C(n430), .Y(n422) );
  NOR4X1 U513 ( .A(n424), .B(n425), .C(n426), .D(n427), .Y(n423) );
  NOR3X1 U514 ( .A(n435), .B(n436), .C(n437), .Y(n420) );
  NOR2BX1 U515 ( .AN(n220), .B(n221), .Y(n217) );
  OAI33X1 U516 ( .A0(n222), .A1(n596), .A2(n599), .B0(n223), .B1(n224), .B2(
        n602), .Y(n220) );
  CLKINVX1 U517 ( .A(n225), .Y(n596) );
  NOR2BX1 U518 ( .AN(n217), .B(n218), .Y(n202) );
  AOI221XL U519 ( .A0(N370), .A1(n489), .B0(N356), .B1(n490), .C0(n320), .Y(
        n319) );
  NAND2X1 U520 ( .A(n306), .B(n307), .Y(N443) );
  AOI221XL U521 ( .A0(N373), .A1(n489), .B0(N359), .B1(n490), .C0(n308), .Y(
        n307) );
  AOI221XL U522 ( .A0(N227), .A1(n485), .B0(n486), .B1(N415), .C0(n309), .Y(
        n306) );
  NAND2X1 U523 ( .A(n310), .B(n311), .Y(N442) );
  AOI221XL U524 ( .A0(N372), .A1(n489), .B0(N358), .B1(n490), .C0(n312), .Y(
        n311) );
  AOI221XL U525 ( .A0(N226), .A1(n485), .B0(n486), .B1(N414), .C0(n313), .Y(
        n310) );
  NAND2X1 U526 ( .A(n302), .B(n303), .Y(N444) );
  AOI221XL U527 ( .A0(N374), .A1(n489), .B0(N360), .B1(n490), .C0(n304), .Y(
        n303) );
  AOI221XL U528 ( .A0(N228), .A1(n485), .B0(n486), .B1(N416), .C0(n305), .Y(
        n302) );
  NAND2X1 U529 ( .A(n314), .B(n315), .Y(N441) );
  AOI221XL U530 ( .A0(N371), .A1(n489), .B0(N357), .B1(n490), .C0(n316), .Y(
        n315) );
  AOI221XL U531 ( .A0(N225), .A1(n485), .B0(n486), .B1(N413), .C0(n317), .Y(
        n314) );
  NAND2X1 U532 ( .A(n330), .B(n331), .Y(N437) );
  AOI221XL U533 ( .A0(N367), .A1(n489), .B0(N353), .B1(n490), .C0(n332), .Y(
        n331) );
  AOI221XL U534 ( .A0(n501), .A1(n485), .B0(n486), .B1(N409), .C0(n333), .Y(
        n330) );
  NAND2X1 U535 ( .A(n334), .B(n335), .Y(N436) );
  AOI221XL U536 ( .A0(N366), .A1(n489), .B0(N352), .B1(n490), .C0(n336), .Y(
        n335) );
  AOI221XL U537 ( .A0(n500), .A1(n485), .B0(n486), .B1(N408), .C0(n337), .Y(
        n334) );
  NAND2X1 U538 ( .A(n338), .B(n339), .Y(N435) );
  AOI221XL U539 ( .A0(N365), .A1(n489), .B0(N351), .B1(n490), .C0(n340), .Y(
        n339) );
  AOI221XL U540 ( .A0(n499), .A1(n485), .B0(n486), .B1(N407), .C0(n341), .Y(
        n338) );
  NAND2X1 U541 ( .A(n342), .B(n343), .Y(N434) );
  AOI221XL U542 ( .A0(N364), .A1(n489), .B0(N350), .B1(n490), .C0(n344), .Y(
        n343) );
  AOI221XL U543 ( .A0(n498), .A1(n485), .B0(n486), .B1(N406), .C0(n345), .Y(
        n342) );
  NAND2X1 U544 ( .A(n326), .B(n327), .Y(N438) );
  AOI221XL U545 ( .A0(N368), .A1(n489), .B0(N354), .B1(n490), .C0(n328), .Y(
        n327) );
  AOI221XL U546 ( .A0(n502), .A1(n485), .B0(n486), .B1(N410), .C0(n329), .Y(
        n326) );
  NAND2X1 U547 ( .A(n322), .B(n323), .Y(N439) );
  AOI221XL U548 ( .A0(N369), .A1(n489), .B0(N355), .B1(n490), .C0(n324), .Y(
        n323) );
  AOI221XL U549 ( .A0(n145), .A1(n485), .B0(n486), .B1(N411), .C0(n325), .Y(
        n322) );
  NAND2X1 U550 ( .A(n291), .B(n292), .Y(N445) );
  AOI221XL U551 ( .A0(N375), .A1(n489), .B0(N361), .B1(n490), .C0(n295), .Y(
        n292) );
  AOI221XL U552 ( .A0(N229), .A1(n485), .B0(n486), .B1(N417), .C0(n299), .Y(
        n291) );
  NOR3X1 U553 ( .A(n256), .B(n257), .C(n258), .Y(n250) );
  NOR4X1 U554 ( .A(n252), .B(n253), .C(n254), .D(n255), .Y(n251) );
  NOR3X1 U555 ( .A(n263), .B(n264), .C(n265), .Y(n248) );
  NAND2X1 U556 ( .A(n346), .B(n347), .Y(N433) );
  AOI221XL U557 ( .A0(N363), .A1(n489), .B0(n465), .B1(n490), .C0(n348), .Y(
        n347) );
  AOI221XL U558 ( .A0(n464), .A1(n485), .B0(n486), .B1(n465), .C0(n349), .Y(
        n346) );
  NAND2X1 U559 ( .A(n350), .B(n351), .Y(N432) );
  AOI221XL U560 ( .A0(N362), .A1(n489), .B0(N488), .B1(n490), .C0(n352), .Y(
        n351) );
  AOI221XL U561 ( .A0(n497), .A1(n485), .B0(n486), .B1(n152), .C0(n355), .Y(
        n350) );
  NOR2X1 U562 ( .A(n196), .B(n198), .Y(n235) );
  NOR3X1 U563 ( .A(n365), .B(n366), .C(n367), .Y(n359) );
  NOR4X1 U564 ( .A(n361), .B(n362), .C(n363), .D(n364), .Y(n360) );
  NOR3X1 U565 ( .A(n372), .B(n373), .C(n374), .Y(n357) );
  CLKBUFX3 U566 ( .A(n200), .Y(n491) );
  AOI221XL U567 ( .A0(n223), .A1(n194), .B0(n222), .B1(n195), .C0(n221), .Y(
        n200) );
  CLKINVX1 U568 ( .A(n236), .Y(n600) );
  NAND4X2 U569 ( .A(n394), .B(n395), .C(n396), .D(n397), .Y(n222) );
  NOR3X1 U570 ( .A(n402), .B(n403), .C(n404), .Y(n396) );
  NOR4X1 U571 ( .A(n398), .B(n399), .C(n400), .D(n401), .Y(n397) );
  NOR3X1 U572 ( .A(n409), .B(n410), .C(n411), .Y(n394) );
  AND2X2 U573 ( .A(n196), .B(n197), .Y(n186) );
  AND3X2 U574 ( .A(n222), .B(n353), .C(n266), .Y(n296) );
  NAND4X1 U575 ( .A(n375), .B(n376), .C(n377), .D(n378), .Y(n353) );
  NOR3X1 U576 ( .A(n383), .B(n384), .C(n385), .Y(n377) );
  NOR4X1 U577 ( .A(n379), .B(n380), .C(n381), .D(n382), .Y(n378) );
  NOR3X1 U578 ( .A(n390), .B(n391), .C(n392), .Y(n375) );
  NOR2X1 U579 ( .A(n592), .B(n239), .Y(n197) );
  CLKINVX1 U580 ( .A(n496), .Y(n509) );
  CLKINVX1 U581 ( .A(n499), .Y(n508) );
  CLKINVX1 U582 ( .A(n195), .Y(n599) );
  CLKINVX1 U583 ( .A(n266), .Y(n597) );
  INVX3 U584 ( .A(n194), .Y(n602) );
  AND4X1 U585 ( .A(n267), .B(n268), .C(n269), .D(n270), .Y(n246) );
  NOR3X1 U586 ( .A(n282), .B(n283), .C(n284), .Y(n267) );
  NOR4X1 U587 ( .A(n278), .B(n279), .C(n280), .D(n281), .Y(n268) );
  NOR4X1 U588 ( .A(n271), .B(n272), .C(n273), .D(n274), .Y(n270) );
  CLKINVX1 U589 ( .A(n247), .Y(n598) );
  AND2X2 U590 ( .A(n438), .B(n460), .Y(n227) );
  CLKINVX1 U591 ( .A(n233), .Y(n593) );
  CLKBUFX3 U592 ( .A(n226), .Y(n484) );
  NOR2X1 U593 ( .A(n438), .B(n601), .Y(n226) );
  CLKBUFX3 U594 ( .A(reset), .Y(n504) );
  CLKBUFX3 U595 ( .A(reset), .Y(n505) );
  CLKBUFX3 U596 ( .A(reset), .Y(n506) );
  OAI222XL U597 ( .A0(n589), .A1(n241), .B0(n242), .B1(n588), .C0(n243), .C1(
        n159), .Y(N829) );
  CLKINVX1 U598 ( .A(N783), .Y(n588) );
  OAI222XL U599 ( .A0(n587), .A1(n241), .B0(n242), .B1(n586), .C0(n243), .C1(
        n572), .Y(N830) );
  CLKINVX1 U600 ( .A(N784), .Y(n586) );
  OAI222XL U601 ( .A0(n585), .A1(n241), .B0(n242), .B1(n584), .C0(n243), .C1(
        n157), .Y(N831) );
  OAI222XL U602 ( .A0(n557), .A1(n241), .B0(n242), .B1(n581), .C0(n243), .C1(
        n155), .Y(N833) );
  CLKINVX1 U603 ( .A(N787), .Y(n581) );
  OAI222XL U604 ( .A0(n580), .A1(n241), .B0(n242), .B1(n579), .C0(n243), .C1(
        n574), .Y(N834) );
  CLKINVX1 U605 ( .A(N788), .Y(n579) );
  OAI222XL U606 ( .A0(n591), .A1(n241), .B0(n242), .B1(n590), .C0(n243), .C1(
        n160), .Y(N828) );
  CLKINVX1 U607 ( .A(N782), .Y(n590) );
  OAI222XL U608 ( .A0(n592), .A1(n241), .B0(n242), .B1(res_di[0]), .C0(n243), 
        .C1(n161), .Y(N827) );
  CLKINVX1 U609 ( .A(n547), .Y(n555) );
  OAI221XL U610 ( .A0(n463), .A1(n574), .B0(n184), .B1(n580), .C0(n185), .Y(
        n439) );
  AOI22X1 U611 ( .A0(N879), .A1(n186), .B0(res_do[7]), .B1(n187), .Y(n185) );
  OAI221XL U612 ( .A0(n463), .A1(n155), .B0(n184), .B1(n557), .C0(n188), .Y(
        n440) );
  AOI22X1 U613 ( .A0(N878), .A1(n186), .B0(res_do[6]), .B1(n187), .Y(n188) );
  OAI221XL U614 ( .A0(n463), .A1(n552), .B0(n184), .B1(n583), .C0(n189), .Y(
        n441) );
  AOI22X1 U615 ( .A0(N877), .A1(n186), .B0(res_do[5]), .B1(n187), .Y(n189) );
  OAI221XL U616 ( .A0(n463), .A1(n157), .B0(n184), .B1(n585), .C0(n190), .Y(
        n442) );
  AOI22X1 U617 ( .A0(N876), .A1(n186), .B0(res_do[4]), .B1(n187), .Y(n190) );
  OAI221XL U618 ( .A0(n463), .A1(n572), .B0(n184), .B1(n587), .C0(n191), .Y(
        n443) );
  AOI22X1 U619 ( .A0(N875), .A1(n186), .B0(res_do[3]), .B1(n187), .Y(n191) );
  OAI221XL U620 ( .A0(n463), .A1(n159), .B0(n184), .B1(n589), .C0(n192), .Y(
        n444) );
  AOI22X1 U621 ( .A0(N874), .A1(n186), .B0(res_do[2]), .B1(n187), .Y(n192) );
  OAI221XL U622 ( .A0(n463), .A1(n160), .B0(n184), .B1(n591), .C0(n193), .Y(
        n445) );
  AOI22X1 U623 ( .A0(N873), .A1(n186), .B0(res_do[1]), .B1(n187), .Y(n193) );
  OAI21XL U624 ( .A0(res_di[0]), .A1(n239), .B0(N930), .Y(n199) );
  CLKINVX1 U625 ( .A(N781), .Y(n575) );
  OAI22XL U626 ( .A0(N930), .A1(n592), .B0(n199), .B1(n161), .Y(n238) );
  OAI2BB1X1 U627 ( .A0N(N851), .A1N(n236), .B0(n237), .Y(N950) );
  CLKINVX1 U628 ( .A(n543), .Y(n556) );
  CLKINVX1 U629 ( .A(res_di[6]), .Y(n557) );
  XNOR2X1 U630 ( .A(n125), .B(N155), .Y(n432) );
  XNOR2X1 U631 ( .A(n136), .B(N144), .Y(n434) );
  XNOR2X1 U632 ( .A(n129), .B(N151), .Y(n431) );
  XNOR2X1 U633 ( .A(n126), .B(N154), .Y(n433) );
  OAI21XL U634 ( .A0(n491), .A1(n149), .B0(n212), .Y(n455) );
  AOI22X1 U635 ( .A0(N491), .A1(n478), .B0(N505), .B1(n461), .Y(n212) );
  OAI21XL U636 ( .A0(n491), .A1(n507), .B0(n213), .Y(n456) );
  OAI21XL U637 ( .A0(n491), .A1(n141), .B0(n204), .Y(n447) );
  AOI22X1 U638 ( .A0(N499), .A1(n478), .B0(N513), .B1(n461), .Y(n204) );
  OAI21XL U639 ( .A0(n491), .A1(n142), .B0(n205), .Y(n448) );
  AOI22X1 U640 ( .A0(N498), .A1(n478), .B0(N512), .B1(n461), .Y(n205) );
  OAI21XL U641 ( .A0(n491), .A1(n143), .B0(n206), .Y(n449) );
  AOI22X1 U642 ( .A0(N497), .A1(n478), .B0(N511), .B1(n461), .Y(n206) );
  OAI21XL U643 ( .A0(n491), .A1(n144), .B0(n207), .Y(n450) );
  AOI22X1 U644 ( .A0(N496), .A1(n478), .B0(N510), .B1(n461), .Y(n207) );
  OAI21XL U645 ( .A0(n491), .A1(n145), .B0(n208), .Y(n451) );
  AOI22X1 U646 ( .A0(N495), .A1(n478), .B0(N509), .B1(n461), .Y(n208) );
  OAI21XL U647 ( .A0(n491), .A1(n148), .B0(n211), .Y(n454) );
  AOI22X1 U648 ( .A0(N492), .A1(n478), .B0(N506), .B1(n461), .Y(n211) );
  OAI21XL U649 ( .A0(n491), .A1(n147), .B0(n210), .Y(n453) );
  AOI22X1 U650 ( .A0(N493), .A1(n478), .B0(N507), .B1(n461), .Y(n210) );
  OAI21XL U651 ( .A0(n491), .A1(n146), .B0(n209), .Y(n452) );
  AOI22X1 U652 ( .A0(N494), .A1(n478), .B0(N508), .B1(n461), .Y(n209) );
  OAI21XL U653 ( .A0(n491), .A1(n140), .B0(n216), .Y(n459) );
  AOI22X1 U654 ( .A0(N500), .A1(n478), .B0(N514), .B1(n461), .Y(n216) );
  OAI21XL U655 ( .A0(n491), .A1(n465), .B0(n214), .Y(n457) );
  AOI22X1 U656 ( .A0(N489), .A1(n478), .B0(N503), .B1(n461), .Y(n214) );
  OAI21XL U657 ( .A0(n491), .A1(n152), .B0(n215), .Y(n458) );
  AOI22X1 U658 ( .A0(N488), .A1(n478), .B0(N502), .B1(n461), .Y(n215) );
  OAI22XL U659 ( .A0(n130), .A1(n487), .B0(n144), .B1(n488), .Y(n321) );
  CLKBUFX3 U660 ( .A(n300), .Y(n487) );
  NAND2X1 U661 ( .A(res_rd), .B(n356), .Y(n300) );
  OAI33X1 U662 ( .A0(n222), .A1(n578), .A2(n599), .B0(n223), .B1(n577), .B2(
        n602), .Y(n356) );
  CLKINVX1 U663 ( .A(n353), .Y(n578) );
  OAI22XL U664 ( .A0(n127), .A1(n487), .B0(n141), .B1(n488), .Y(n309) );
  OAI22XL U665 ( .A0(n128), .A1(n487), .B0(n142), .B1(n488), .Y(n313) );
  OAI22XL U666 ( .A0(n126), .A1(n487), .B0(n140), .B1(n488), .Y(n305) );
  OAI22XL U667 ( .A0(n129), .A1(n487), .B0(n143), .B1(n488), .Y(n317) );
  OAI22XL U668 ( .A0(n135), .A1(n487), .B0(n149), .B1(n488), .Y(n341) );
  OAI22XL U669 ( .A0(n136), .A1(n487), .B0(n507), .B1(n488), .Y(n345) );
  OAI22XL U670 ( .A0(n131), .A1(n487), .B0(n145), .B1(n488), .Y(n325) );
  OAI22XL U671 ( .A0(n133), .A1(n487), .B0(n147), .B1(n488), .Y(n333) );
  OAI22XL U672 ( .A0(n134), .A1(n487), .B0(n148), .B1(n488), .Y(n337) );
  OAI22XL U673 ( .A0(n132), .A1(n487), .B0(n146), .B1(n488), .Y(n329) );
  OAI22XL U674 ( .A0(n125), .A1(n487), .B0(n139), .B1(n488), .Y(n299) );
  NOR4X1 U675 ( .A(n259), .B(n260), .C(n261), .D(n262), .Y(n249) );
  XNOR2X1 U676 ( .A(n136), .B(N406), .Y(n262) );
  XNOR2X1 U677 ( .A(n129), .B(N413), .Y(n259) );
  XNOR2X1 U678 ( .A(n126), .B(N416), .Y(n261) );
  OAI22XL U679 ( .A0(n137), .A1(n487), .B0(n465), .B1(n488), .Y(n349) );
  NOR2X1 U680 ( .A(n140), .B(\r515/carry [12]), .Y(n482) );
  XNOR2X1 U681 ( .A(n126), .B(N300), .Y(n370) );
  NOR4X1 U682 ( .A(n368), .B(n369), .C(n370), .D(n371), .Y(n358) );
  XNOR2X1 U683 ( .A(n129), .B(N297), .Y(n368) );
  XNOR2X1 U684 ( .A(n125), .B(N301), .Y(n369) );
  XNOR2X1 U685 ( .A(n127), .B(N153), .Y(n436) );
  XNOR2X1 U686 ( .A(n127), .B(N415), .Y(n264) );
  XNOR2X1 U687 ( .A(n127), .B(N299), .Y(n373) );
  OAI31XL U688 ( .A0(n602), .A1(n576), .A2(n595), .B0(n393), .Y(N161) );
  CLKINVX1 U689 ( .A(n287), .Y(n595) );
  OAI211X1 U690 ( .A0(res_rd), .A1(n225), .B0(n222), .C0(n195), .Y(n393) );
  XNOR2X1 U691 ( .A(n125), .B(N122), .Y(n406) );
  NOR4X1 U692 ( .A(n405), .B(n406), .C(n407), .D(n408), .Y(n395) );
  XNOR2X1 U693 ( .A(n136), .B(N111), .Y(n408) );
  XNOR2X1 U694 ( .A(n129), .B(N118), .Y(n405) );
  XNOR2X1 U695 ( .A(n126), .B(N121), .Y(n407) );
  XNOR2X1 U696 ( .A(n128), .B(N152), .Y(n435) );
  XNOR2X1 U697 ( .A(n128), .B(N414), .Y(n263) );
  XNOR2X1 U698 ( .A(n128), .B(N298), .Y(n372) );
  AO22X1 U699 ( .A0(n236), .A1(sti_addr[8]), .B0(N242), .B1(n296), .Y(n304) );
  AO22X1 U700 ( .A0(n236), .A1(sti_addr[7]), .B0(N241), .B1(n296), .Y(n308) );
  AO22X1 U701 ( .A0(n236), .A1(sti_addr[6]), .B0(N240), .B1(n296), .Y(n312) );
  AO22X1 U702 ( .A0(n236), .A1(sti_addr[5]), .B0(N239), .B1(n296), .Y(n316) );
  AO22X1 U703 ( .A0(n236), .A1(sti_addr[3]), .B0(N237), .B1(n296), .Y(n324) );
  AO22X1 U704 ( .A0(n236), .A1(sti_addr[2]), .B0(N236), .B1(n296), .Y(n328) );
  AO22X1 U705 ( .A0(sti_addr[0]), .A1(n236), .B0(N234), .B1(n296), .Y(n336) );
  AO22X1 U706 ( .A0(n236), .A1(sti_addr[4]), .B0(N238), .B1(n296), .Y(n320) );
  AO22X1 U707 ( .A0(sti_addr[1]), .A1(n236), .B0(N235), .B1(n296), .Y(n332) );
  AO22X1 U708 ( .A0(\cout[3] ), .A1(n236), .B0(N233), .B1(n296), .Y(n340) );
  AO22X1 U709 ( .A0(n524), .A1(n236), .B0(N232), .B1(n296), .Y(n344) );
  AO22X1 U710 ( .A0(n236), .A1(sti_addr[9]), .B0(N243), .B1(n296), .Y(n295) );
  AO22X1 U711 ( .A0(n525), .A1(n236), .B0(N231), .B1(n296), .Y(n348) );
  CLKBUFX3 U712 ( .A(N221), .Y(n501) );
  XNOR2X1 U713 ( .A(n130), .B(N412), .Y(n265) );
  XNOR2X1 U714 ( .A(n130), .B(N150), .Y(n437) );
  XNOR2X1 U715 ( .A(n125), .B(N197), .Y(n387) );
  NOR4X1 U716 ( .A(n386), .B(n387), .C(n388), .D(n389), .Y(n376) );
  XNOR2X1 U717 ( .A(n136), .B(N186), .Y(n389) );
  XNOR2X1 U718 ( .A(n129), .B(N193), .Y(n386) );
  XNOR2X1 U719 ( .A(n126), .B(N196), .Y(n388) );
  XNOR2X1 U720 ( .A(n127), .B(N120), .Y(n410) );
  CLKBUFX3 U721 ( .A(N222), .Y(n502) );
  NAND4X1 U722 ( .A(n589), .B(n587), .C(n591), .D(n240), .Y(n239) );
  NOR4X1 U723 ( .A(res_di[7]), .B(res_di[6]), .C(res_di[5]), .D(res_di[4]), 
        .Y(n240) );
  CLKBUFX3 U724 ( .A(i[7]), .Y(n496) );
  XNOR2X1 U725 ( .A(n128), .B(N119), .Y(n409) );
  XNOR2X1 U726 ( .A(n131), .B(N149), .Y(n425) );
  XNOR2X1 U727 ( .A(n127), .B(N195), .Y(n391) );
  XNOR2X1 U728 ( .A(n131), .B(N411), .Y(n253) );
  XNOR2X1 U729 ( .A(i[13]), .B(n483), .Y(N347) );
  NOR2X1 U730 ( .A(n140), .B(\sub_193/carry [12]), .Y(n483) );
  CLKBUFX3 U731 ( .A(i[8]), .Y(n495) );
  XNOR2X1 U732 ( .A(n128), .B(N194), .Y(n390) );
  XNOR2X1 U733 ( .A(n132), .B(N148), .Y(n424) );
  XNOR2X1 U734 ( .A(n132), .B(N410), .Y(n252) );
  CLKINVX1 U735 ( .A(res_di[5]), .Y(n583) );
  CLKINVX1 U736 ( .A(res_di[4]), .Y(n585) );
  CLKINVX1 U737 ( .A(res_di[7]), .Y(n580) );
  XNOR2X1 U738 ( .A(n130), .B(N117), .Y(n411) );
  XNOR2X1 U739 ( .A(n133), .B(N147), .Y(n427) );
  CLKBUFX3 U740 ( .A(i[9]), .Y(n494) );
  XNOR2X1 U741 ( .A(n133), .B(N409), .Y(n255) );
  XNOR2X1 U742 ( .A(n131), .B(N116), .Y(n399) );
  XNOR2X1 U743 ( .A(n134), .B(N146), .Y(n426) );
  XNOR2X1 U744 ( .A(n130), .B(N192), .Y(n392) );
  XNOR2X1 U745 ( .A(n134), .B(N408), .Y(n254) );
  CLKBUFX3 U746 ( .A(i[10]), .Y(n493) );
  XNOR2X1 U747 ( .A(n132), .B(N115), .Y(n398) );
  XNOR2X1 U748 ( .A(n131), .B(N191), .Y(n380) );
  CLKBUFX3 U749 ( .A(i[11]), .Y(n492) );
  XNOR2X1 U750 ( .A(n133), .B(N114), .Y(n401) );
  XNOR2X1 U751 ( .A(n135), .B(N145), .Y(n428) );
  XNOR2X1 U752 ( .A(n135), .B(N407), .Y(n256) );
  XNOR2X1 U753 ( .A(n132), .B(N190), .Y(n379) );
  CLKBUFX3 U754 ( .A(i[12]), .Y(n503) );
  XNOR2X1 U755 ( .A(n134), .B(N113), .Y(n400) );
  XNOR2X1 U756 ( .A(n133), .B(N189), .Y(n382) );
  XNOR2X1 U758 ( .A(n135), .B(N112), .Y(n402) );
  XNOR2X1 U759 ( .A(n134), .B(N188), .Y(n381) );
  XNOR2X1 U760 ( .A(n137), .B(N143), .Y(n430) );
  XNOR2X1 U761 ( .A(n135), .B(N187), .Y(n383) );
  XNOR2X1 U762 ( .A(n137), .B(N110), .Y(n404) );
  AO22X1 U763 ( .A0(n484), .A1(sti_addr[9]), .B0(N87), .B1(n227), .Y(N107) );
  NOR2X2 U764 ( .A(n114), .B(state[1]), .Y(n195) );
  NOR2X1 U765 ( .A(n599), .B(n120), .Y(n266) );
  XNOR2X1 U766 ( .A(n137), .B(n465), .Y(n258) );
  NOR2X1 U767 ( .A(n120), .B(n602), .Y(n247) );
  NOR3X1 U768 ( .A(n275), .B(n276), .C(n277), .Y(n269) );
  NAND4X1 U769 ( .A(res_addr[2]), .B(res_addr[12]), .C(res_addr[13]), .D(
        res_addr[9]), .Y(n415) );
  NAND3X1 U770 ( .A(n412), .B(n413), .C(n414), .Y(n225) );
  NOR3X1 U771 ( .A(n135), .B(n133), .C(n137), .Y(n412) );
  NOR4X1 U772 ( .A(res_addr[7]), .B(res_addr[0]), .C(n132), .D(n134), .Y(n413)
         );
  NOR4X1 U773 ( .A(n415), .B(n128), .C(n127), .D(n130), .Y(n414) );
  XNOR2X1 U774 ( .A(n133), .B(n501), .Y(n274) );
  XNOR2X1 U775 ( .A(n131), .B(n496), .Y(n272) );
  XNOR2X1 U776 ( .A(n132), .B(n502), .Y(n271) );
  XNOR2X1 U777 ( .A(n126), .B(n503), .Y(n280) );
  XNOR2X1 U778 ( .A(n125), .B(i[13]), .Y(n279) );
  XNOR2X1 U779 ( .A(n130), .B(n495), .Y(n284) );
  XNOR2X1 U780 ( .A(n129), .B(n494), .Y(n278) );
  XNOR2X1 U781 ( .A(n127), .B(n492), .Y(n283) );
  XNOR2X1 U782 ( .A(n128), .B(n493), .Y(n282) );
  NOR4X1 U783 ( .A(res_addr[1]), .B(res_addr[13]), .C(res_addr[12]), .D(
        res_addr[11]), .Y(n417) );
  AND4X1 U784 ( .A(n416), .B(n417), .C(n418), .D(n419), .Y(n224) );
  NOR3X1 U785 ( .A(n138), .B(res_addr[10]), .C(n131), .Y(n416) );
  NOR3X1 U786 ( .A(res_addr[2]), .B(res_addr[4]), .C(res_addr[3]), .Y(n418) );
  NOR4X1 U787 ( .A(res_addr[9]), .B(res_addr[8]), .C(res_addr[6]), .D(
        res_addr[5]), .Y(n419) );
  AO22X1 U788 ( .A0(n484), .A1(sti_addr[8]), .B0(N86), .B1(n227), .Y(N106) );
  AO22X1 U789 ( .A0(n484), .A1(sti_addr[7]), .B0(N85), .B1(n227), .Y(N105) );
  NOR2X4 U790 ( .A(n601), .B(n117), .Y(n236) );
  AO22X1 U791 ( .A0(n484), .A1(sti_addr[6]), .B0(N84), .B1(n227), .Y(N104) );
  OAI222XL U792 ( .A0(n597), .A1(n225), .B0(n285), .B1(n286), .C0(n602), .C1(
        n287), .Y(N73) );
  NAND4X1 U793 ( .A(sti_addr[8]), .B(sti_addr[7]), .C(sti_addr[9]), .D(n288), 
        .Y(n286) );
  NAND4X1 U794 ( .A(sti_addr[2]), .B(sti_addr[0]), .C(sti_addr[3]), .D(n289), 
        .Y(n285) );
  AND3X2 U795 ( .A(sti_addr[6]), .B(sti_addr[4]), .C(sti_addr[5]), .Y(n288) );
  AO22X1 U796 ( .A0(n484), .A1(sti_addr[5]), .B0(N83), .B1(n227), .Y(N103) );
  CLKBUFX3 U797 ( .A(n298), .Y(n486) );
  NOR2X1 U798 ( .A(n602), .B(res_rd), .Y(n298) );
  OA21XL U799 ( .A0(n195), .A1(n194), .B0(n120), .Y(n221) );
  NAND4X1 U800 ( .A(n501), .B(n500), .C(n502), .D(n219), .Y(n218) );
  NAND2X1 U801 ( .A(n224), .B(n120), .Y(n287) );
  NAND2X1 U802 ( .A(n195), .B(n120), .Y(n301) );
  OAI33X1 U803 ( .A0(n601), .A1(n164), .A2(n594), .B0(n228), .B1(n524), .B2(
        n165), .Y(N976) );
  CLKINVX1 U804 ( .A(n231), .Y(n594) );
  NOR2X1 U805 ( .A(n290), .B(n166), .Y(n233) );
  NAND3X1 U806 ( .A(n524), .B(\cout[3] ), .C(n525), .Y(n290) );
  NAND2X1 U807 ( .A(n232), .B(n525), .Y(n231) );
  OA21XL U808 ( .A0(sti_rd), .A1(n233), .B0(n526), .Y(n232) );
  NOR2X1 U809 ( .A(n593), .B(n117), .Y(n438) );
  AO22X1 U810 ( .A0(n484), .A1(sti_addr[0]), .B0(N78), .B1(n227), .Y(N98) );
  AO22X1 U811 ( .A0(n484), .A1(sti_addr[3]), .B0(N81), .B1(n227), .Y(N101) );
  AO22X1 U812 ( .A0(n484), .A1(sti_addr[2]), .B0(N80), .B1(n227), .Y(N100) );
  AO22X1 U813 ( .A0(n484), .A1(sti_addr[4]), .B0(N82), .B1(n227), .Y(N102) );
  AO22X1 U814 ( .A0(n484), .A1(sti_addr[1]), .B0(N79), .B1(n227), .Y(N99) );
  OAI31XL U815 ( .A0(n228), .A1(n164), .A2(n165), .B0(n229), .Y(N977) );
  OAI211X1 U816 ( .A0(n230), .A1(n231), .B0(\cout[3] ), .C0(n460), .Y(n229) );
  NOR2X2 U817 ( .A(n114), .B(n111), .Y(N990) );
  NOR2X1 U818 ( .A(n117), .B(n233), .Y(n230) );
  OAI32X1 U819 ( .A0(n601), .A1(n165), .A2(n232), .B0(n525), .B1(n228), .Y(
        N975) );
  NOR2X1 U820 ( .A(n234), .B(n601), .Y(N974) );
  OAI22XL U821 ( .A0(state[0]), .A1(n115), .B0(ok), .B1(n599), .Y(N66) );
  OAI21XL U822 ( .A0(n599), .A1(n115), .B0(n602), .Y(N67) );
  XOR2X1 U823 ( .A(N347), .B(\add_193/carry [13]), .Y(N361) );
  AND2X1 U824 ( .A(\add_193/carry [12]), .B(N346), .Y(\add_193/carry [13]) );
  XOR2X1 U825 ( .A(N346), .B(\add_193/carry [12]), .Y(N360) );
  AND2X1 U826 ( .A(\add_193/carry [11]), .B(N345), .Y(\add_193/carry [12]) );
  XOR2X1 U827 ( .A(N345), .B(\add_193/carry [11]), .Y(N359) );
  AND2X1 U828 ( .A(\add_193/carry [10]), .B(N344), .Y(\add_193/carry [11]) );
  XOR2X1 U829 ( .A(N344), .B(\add_193/carry [10]), .Y(N358) );
  AND2X1 U830 ( .A(\add_193/carry [9]), .B(N343), .Y(\add_193/carry [10]) );
  XOR2X1 U831 ( .A(N343), .B(\add_193/carry [9]), .Y(N357) );
  AND2X1 U832 ( .A(\add_193/carry [8]), .B(N342), .Y(\add_193/carry [9]) );
  XOR2X1 U833 ( .A(N342), .B(\add_193/carry [8]), .Y(N356) );
  OR2X1 U834 ( .A(N341), .B(\add_193/carry [7]), .Y(\add_193/carry [8]) );
  XNOR2X1 U835 ( .A(\add_193/carry [7]), .B(N341), .Y(N355) );
  XNOR2X1 U836 ( .A(\sub_193/carry [12]), .B(n140), .Y(N346) );
  OR2X1 U837 ( .A(n141), .B(\sub_193/carry [11]), .Y(\sub_193/carry [12]) );
  XNOR2X1 U838 ( .A(\sub_193/carry [11]), .B(n141), .Y(N345) );
  OR2X1 U839 ( .A(n142), .B(\sub_193/carry [10]), .Y(\sub_193/carry [11]) );
  XNOR2X1 U840 ( .A(\sub_193/carry [10]), .B(n142), .Y(N344) );
  OR2X1 U841 ( .A(n143), .B(\sub_193/carry [9]), .Y(\sub_193/carry [10]) );
  XNOR2X1 U842 ( .A(\sub_193/carry [9]), .B(n143), .Y(N343) );
  AND2X1 U843 ( .A(\sub_193/carry [8]), .B(n144), .Y(\sub_193/carry [9]) );
  XOR2X1 U844 ( .A(n144), .B(\sub_193/carry [8]), .Y(N342) );
  OR2X1 U845 ( .A(n145), .B(\sub_193/carry [7]), .Y(\sub_193/carry [8]) );
  XNOR2X1 U846 ( .A(\sub_193/carry [7]), .B(n145), .Y(N341) );
  XOR2X1 U847 ( .A(\add_192/A[12] ), .B(\r527/carry [12]), .Y(N416) );
  XOR2X1 U848 ( .A(\add_192/A[11] ), .B(\r527/carry [11]), .Y(N415) );
  XOR2X1 U849 ( .A(\add_192/A[10] ), .B(\r527/carry [10]), .Y(N414) );
  XOR2X1 U850 ( .A(\add_192/A[9] ), .B(\r527/carry [9]), .Y(N413) );
  XOR2X1 U851 ( .A(N295), .B(\r527/carry [7]), .Y(N411) );
  XOR2X1 U852 ( .A(i[13]), .B(\add_177/carry [13]), .Y(N229) );
  AND2X1 U853 ( .A(\add_177/carry [12]), .B(n503), .Y(\add_177/carry [13]) );
  XOR2X1 U854 ( .A(n503), .B(\add_177/carry [12]), .Y(N228) );
  AND2X1 U855 ( .A(\add_177/carry [11]), .B(n492), .Y(\add_177/carry [12]) );
  XOR2X1 U856 ( .A(n492), .B(\add_177/carry [11]), .Y(N227) );
  AND2X1 U857 ( .A(\add_177/carry [10]), .B(n493), .Y(\add_177/carry [11]) );
  XOR2X1 U858 ( .A(n493), .B(\add_177/carry [10]), .Y(N226) );
  AND2X1 U859 ( .A(\add_177/carry [9]), .B(n494), .Y(\add_177/carry [10]) );
  XOR2X1 U860 ( .A(n494), .B(\add_177/carry [9]), .Y(N225) );
  AND2X1 U861 ( .A(n496), .B(n495), .Y(\add_177/carry [9]) );
  XOR2X1 U862 ( .A(n495), .B(n496), .Y(N224) );
  XOR2X1 U863 ( .A(i[13]), .B(\r528/carry[13] ), .Y(N501) );
  AND2X1 U864 ( .A(\r528/carry[12] ), .B(n503), .Y(\r528/carry[13] ) );
  XOR2X1 U865 ( .A(n503), .B(\r528/carry[12] ), .Y(N500) );
  AND2X1 U866 ( .A(\r528/carry[11] ), .B(n492), .Y(\r528/carry[12] ) );
  XOR2X1 U867 ( .A(n492), .B(\r528/carry[11] ), .Y(N499) );
  AND2X1 U868 ( .A(\r528/carry[10] ), .B(n493), .Y(\r528/carry[11] ) );
  XOR2X1 U869 ( .A(n493), .B(\r528/carry[10] ), .Y(N498) );
  AND2X1 U870 ( .A(\r528/carry[9] ), .B(n494), .Y(\r528/carry[10] ) );
  XOR2X1 U871 ( .A(n494), .B(\r528/carry[9] ), .Y(N497) );
  AND2X1 U872 ( .A(\r528/carry[8] ), .B(n495), .Y(\r528/carry[9] ) );
  XOR2X1 U873 ( .A(n495), .B(\r528/carry[8] ), .Y(N496) );
  AND2X1 U874 ( .A(\r528/carry[7] ), .B(n496), .Y(\r528/carry[8] ) );
  XOR2X1 U875 ( .A(n496), .B(\r528/carry[7] ), .Y(N495) );
  AND2X1 U876 ( .A(\r528/carry[6] ), .B(n502), .Y(\r528/carry[7] ) );
  XOR2X1 U877 ( .A(n502), .B(\r528/carry[6] ), .Y(N494) );
  AND2X1 U878 ( .A(\r528/carry[5] ), .B(n501), .Y(\r528/carry[6] ) );
  XOR2X1 U879 ( .A(n501), .B(\r528/carry[5] ), .Y(N493) );
  AND2X1 U880 ( .A(\r528/carry[4] ), .B(n500), .Y(\r528/carry[5] ) );
  XOR2X1 U881 ( .A(n500), .B(\r528/carry[4] ), .Y(N492) );
  AND2X1 U882 ( .A(\r528/carry[3] ), .B(n499), .Y(\r528/carry[4] ) );
  XOR2X1 U883 ( .A(n499), .B(\r528/carry[3] ), .Y(N491) );
  AND2X1 U884 ( .A(\r528/carry[2] ), .B(n498), .Y(\r528/carry[3] ) );
  XOR2X1 U885 ( .A(n498), .B(\r528/carry[2] ), .Y(N490) );
  XNOR2X1 U886 ( .A(n497), .B(n464), .Y(N489) );
  AND2X1 U887 ( .A(\add_193/carry [6]), .B(N340), .Y(\add_193/carry [7]) );
  XOR2X1 U888 ( .A(N340), .B(\add_193/carry [6]), .Y(N354) );
  AND2X1 U889 ( .A(\add_193/carry [5]), .B(N339), .Y(\add_193/carry [6]) );
  XOR2X1 U890 ( .A(N339), .B(\add_193/carry [5]), .Y(N353) );
  AND2X1 U891 ( .A(\add_193/carry [4]), .B(N338), .Y(\add_193/carry [5]) );
  XOR2X1 U892 ( .A(N338), .B(\add_193/carry [4]), .Y(N352) );
  AND2X1 U893 ( .A(\add_193/carry [3]), .B(N337), .Y(\add_193/carry [4]) );
  XOR2X1 U894 ( .A(N337), .B(\add_193/carry [3]), .Y(N351) );
  XOR2X1 U895 ( .A(N336), .B(n464), .Y(N350) );
  OR2X1 U896 ( .A(n146), .B(\sub_193/carry [6]), .Y(\sub_193/carry [7]) );
  XNOR2X1 U897 ( .A(\sub_193/carry [6]), .B(n146), .Y(N340) );
  OR2X1 U898 ( .A(n147), .B(\sub_193/carry [5]), .Y(\sub_193/carry [6]) );
  XNOR2X1 U899 ( .A(\sub_193/carry [5]), .B(n147), .Y(N339) );
  OR2X1 U900 ( .A(n148), .B(\sub_193/carry [4]), .Y(\sub_193/carry [5]) );
  XNOR2X1 U901 ( .A(\sub_193/carry [4]), .B(n148), .Y(N338) );
  OR2X1 U902 ( .A(n508), .B(\sub_193/carry [3]), .Y(\sub_193/carry [4]) );
  XNOR2X1 U903 ( .A(\sub_193/carry [3]), .B(n508), .Y(N337) );
  OR2X1 U904 ( .A(n507), .B(n465), .Y(\sub_193/carry [3]) );
  XNOR2X1 U905 ( .A(n465), .B(n507), .Y(N336) );
  XOR2X1 U906 ( .A(N294), .B(\r527/carry [6]), .Y(N410) );
  XOR2X1 U907 ( .A(N293), .B(\r527/carry [5]), .Y(N409) );
  XOR2X1 U908 ( .A(N292), .B(\r527/carry [4]), .Y(N408) );
  XOR2X1 U909 ( .A(N291), .B(\r527/carry [3]), .Y(N407) );
  XOR2X1 U910 ( .A(N336), .B(n464), .Y(N406) );
  XOR2X1 U911 ( .A(\add_192/A[13] ), .B(\add_192/carry [13]), .Y(N301) );
  XOR2X1 U912 ( .A(\add_192/A[12] ), .B(\add_192/carry [12]), .Y(N300) );
  XOR2X1 U913 ( .A(\add_192/A[11] ), .B(\add_192/carry [11]), .Y(N299) );
  XOR2X1 U914 ( .A(\add_192/A[10] ), .B(\add_192/carry [10]), .Y(N298) );
  XOR2X1 U915 ( .A(\add_192/A[13] ), .B(\r516/carry[13] ), .Y(N155) );
  AND2X1 U916 ( .A(\r516/carry[12] ), .B(\add_192/A[12] ), .Y(\r516/carry[13] ) );
  AND2X1 U917 ( .A(\r516/carry[11] ), .B(\add_192/A[11] ), .Y(\r516/carry[12] ) );
  XOR2X1 U918 ( .A(\add_192/A[11] ), .B(\r516/carry[11] ), .Y(N153) );
  OR2X1 U919 ( .A(n141), .B(\r515/carry [11]), .Y(\r515/carry [12]) );
  AND2X1 U920 ( .A(\r516/carry[10] ), .B(\add_192/A[10] ), .Y(\r516/carry[11] ) );
  XOR2X1 U921 ( .A(\add_192/A[10] ), .B(\r516/carry[10] ), .Y(N152) );
  AND2X1 U922 ( .A(\r516/carry[9] ), .B(\add_192/A[9] ), .Y(\r516/carry[10] )
         );
  OR2X1 U923 ( .A(N295), .B(\r516/carry[7] ), .Y(\r516/carry[8] ) );
  XNOR2X1 U924 ( .A(\r516/carry[7] ), .B(N295), .Y(N149) );
  XOR2X1 U925 ( .A(N294), .B(\r516/carry[6] ), .Y(N148) );
  XOR2X1 U926 ( .A(N293), .B(\r516/carry[5] ), .Y(N147) );
  XOR2X1 U927 ( .A(N292), .B(\r516/carry[4] ), .Y(N146) );
  XOR2X1 U928 ( .A(n464), .B(n152), .Y(N143) );
  AND2X1 U929 ( .A(\r515/carry [8]), .B(n144), .Y(\r515/carry [9]) );
  XNOR2X1 U930 ( .A(\r515/carry [7]), .B(n509), .Y(N295) );
  OR2X1 U931 ( .A(n146), .B(\r515/carry [6]), .Y(\r515/carry [7]) );
  XNOR2X1 U932 ( .A(\r515/carry [6]), .B(n146), .Y(N294) );
  XNOR2X1 U933 ( .A(\r515/carry [5]), .B(n147), .Y(N293) );
  XNOR2X1 U934 ( .A(\r515/carry [4]), .B(n148), .Y(N292) );
  OR2X1 U935 ( .A(n149), .B(\r515/carry [3]), .Y(\r515/carry [4]) );
  XNOR2X1 U936 ( .A(\r515/carry [3]), .B(n149), .Y(N291) );
  XOR2X1 U937 ( .A(i[13]), .B(\r513/carry[13] ), .Y(N122) );
  AND2X1 U938 ( .A(\r513/carry[12] ), .B(n503), .Y(\r513/carry[13] ) );
  XOR2X1 U939 ( .A(n503), .B(\r513/carry[12] ), .Y(N121) );
  AND2X1 U940 ( .A(\r513/carry[11] ), .B(n492), .Y(\r513/carry[12] ) );
  XOR2X1 U941 ( .A(n492), .B(\r513/carry[11] ), .Y(N120) );
  AND2X1 U942 ( .A(\r513/carry[10] ), .B(n493), .Y(\r513/carry[11] ) );
  XOR2X1 U943 ( .A(n493), .B(\r513/carry[10] ), .Y(N119) );
  AND2X1 U944 ( .A(\r513/carry[9] ), .B(n494), .Y(\r513/carry[10] ) );
  XOR2X1 U945 ( .A(n494), .B(\r513/carry[9] ), .Y(N118) );
  AND2X1 U946 ( .A(\r513/carry[8] ), .B(n495), .Y(\r513/carry[9] ) );
  XOR2X1 U947 ( .A(n495), .B(\r513/carry[8] ), .Y(N117) );
  OR2X1 U948 ( .A(n496), .B(\r513/carry[7] ), .Y(\r513/carry[8] ) );
  XNOR2X1 U949 ( .A(\r513/carry[7] ), .B(n496), .Y(N116) );
  AND2X1 U950 ( .A(\r513/carry[6] ), .B(n502), .Y(\r513/carry[7] ) );
  XOR2X1 U951 ( .A(n502), .B(\r513/carry[6] ), .Y(N115) );
  AND2X1 U952 ( .A(\r513/carry[5] ), .B(n501), .Y(\r513/carry[6] ) );
  XOR2X1 U953 ( .A(n501), .B(\r513/carry[5] ), .Y(N114) );
  AND2X1 U954 ( .A(\r513/carry[4] ), .B(n500), .Y(\r513/carry[5] ) );
  XOR2X1 U955 ( .A(n500), .B(\r513/carry[4] ), .Y(N113) );
  AND2X1 U956 ( .A(\r513/carry[3] ), .B(n499), .Y(\r513/carry[4] ) );
  XOR2X1 U957 ( .A(n499), .B(\r513/carry[3] ), .Y(N112) );
  AND2X1 U958 ( .A(\r513/carry[2] ), .B(n498), .Y(\r513/carry[3] ) );
  XOR2X1 U959 ( .A(n498), .B(\r513/carry[2] ), .Y(N111) );
  XOR2X1 U960 ( .A(n464), .B(n497), .Y(N110) );
  XOR2X1 U961 ( .A(i[13]), .B(\add_176/carry [13]), .Y(N197) );
  AND2X1 U962 ( .A(\add_176/carry [12]), .B(n503), .Y(\add_176/carry [13]) );
  XOR2X1 U963 ( .A(n503), .B(\add_176/carry [12]), .Y(N196) );
  AND2X1 U964 ( .A(\add_176/carry [11]), .B(n492), .Y(\add_176/carry [12]) );
  XOR2X1 U965 ( .A(n492), .B(\add_176/carry [11]), .Y(N195) );
  AND2X1 U966 ( .A(\add_176/carry [10]), .B(n493), .Y(\add_176/carry [11]) );
  XOR2X1 U967 ( .A(n493), .B(\add_176/carry [10]), .Y(N194) );
  AND2X1 U968 ( .A(\add_176/carry [9]), .B(n494), .Y(\add_176/carry [10]) );
  XOR2X1 U969 ( .A(n494), .B(\add_176/carry [9]), .Y(N193) );
  AND2X1 U970 ( .A(\add_176/carry [8]), .B(n495), .Y(\add_176/carry [9]) );
  XOR2X1 U971 ( .A(n495), .B(\add_176/carry [8]), .Y(N192) );
  AND2X1 U972 ( .A(\add_176/carry [7]), .B(n496), .Y(\add_176/carry [8]) );
  XOR2X1 U973 ( .A(n496), .B(\add_176/carry [7]), .Y(N191) );
  AND2X1 U974 ( .A(\add_176/carry [6]), .B(n502), .Y(\add_176/carry [7]) );
  XOR2X1 U975 ( .A(n502), .B(\add_176/carry [6]), .Y(N190) );
  AND2X1 U976 ( .A(\add_176/carry [5]), .B(n501), .Y(\add_176/carry [6]) );
  XOR2X1 U977 ( .A(n501), .B(\add_176/carry [5]), .Y(N189) );
  AND2X1 U978 ( .A(\add_176/carry [4]), .B(n500), .Y(\add_176/carry [5]) );
  XOR2X1 U979 ( .A(n500), .B(\add_176/carry [4]), .Y(N188) );
  AND2X1 U980 ( .A(\add_176/carry [3]), .B(n499), .Y(\add_176/carry [4]) );
  XOR2X1 U981 ( .A(n499), .B(\add_176/carry [3]), .Y(N187) );
  NOR2X1 U982 ( .A(n525), .B(n166), .Y(n519) );
  NOR2X1 U983 ( .A(n525), .B(n526), .Y(n518) );
  NOR2X1 U984 ( .A(n526), .B(n165), .Y(n516) );
  NOR2X1 U985 ( .A(n166), .B(n165), .Y(n515) );
  AO22X1 U986 ( .A0(sti_di[5]), .A1(n516), .B0(sti_di[4]), .B1(n515), .Y(n510)
         );
  AOI221XL U987 ( .A0(sti_di[6]), .A1(n519), .B0(sti_di[7]), .B1(n518), .C0(
        n510), .Y(n513) );
  AO22X1 U988 ( .A0(sti_di[1]), .A1(n516), .B0(sti_di[0]), .B1(n515), .Y(n511)
         );
  AOI221XL U989 ( .A0(sti_di[2]), .A1(n519), .B0(sti_di[3]), .B1(n518), .C0(
        n511), .Y(n512) );
  OA22X1 U990 ( .A0(n524), .A1(n513), .B0(n164), .B1(n512), .Y(n523) );
  AO22X1 U991 ( .A0(sti_di[13]), .A1(n516), .B0(sti_di[12]), .B1(n515), .Y(
        n514) );
  AOI221XL U992 ( .A0(sti_di[14]), .A1(n519), .B0(sti_di[15]), .B1(n518), .C0(
        n514), .Y(n521) );
  AO22X1 U993 ( .A0(sti_di[9]), .A1(n516), .B0(sti_di[8]), .B1(n515), .Y(n517)
         );
  AOI221XL U994 ( .A0(sti_di[10]), .A1(n519), .B0(sti_di[11]), .B1(n518), .C0(
        n517), .Y(n520) );
  OAI22XL U995 ( .A0(n521), .A1(n524), .B0(n164), .B1(n520), .Y(n522) );
  OAI2BB2XL U996 ( .B0(n523), .B1(n162), .A0N(n162), .A1N(n522), .Y(N851) );
  NOR2BX1 U997 ( .AN(res_di[7]), .B(temp[7]), .Y(n550) );
  NOR2BX1 U998 ( .AN(res_di[4]), .B(temp[4]), .Y(n544) );
  NAND2BX1 U999 ( .AN(res_di[4]), .B(temp[4]), .Y(n531) );
  NAND2BX1 U1000 ( .AN(n544), .B(n531), .Y(n542) );
  NAND2BX1 U1001 ( .AN(res_di[0]), .B(temp[0]), .Y(n528) );
  AOI2BB1X1 U1002 ( .A0N(n528), .A1N(res_di[1]), .B0(temp[1]), .Y(n527) );
  AOI211X1 U1003 ( .A0(res_di[1]), .A1(n528), .B0(n535), .C0(n527), .Y(n529)
         );
  OAI31XL U1004 ( .A0(n538), .A1(n530), .A2(n529), .B0(n541), .Y(n532) );
  NOR2X1 U1005 ( .A(n552), .B(res_di[5]), .Y(n547) );
  OAI211X1 U1006 ( .A0(n542), .A1(n532), .B0(n531), .C0(n555), .Y(n533) );
  NAND2X1 U1007 ( .A(res_di[5]), .B(n552), .Y(n543) );
  NOR2X1 U1008 ( .A(n557), .B(temp[6]), .Y(n549) );
  AOI21X1 U1009 ( .A0(n557), .A1(temp[6]), .B0(n549), .Y(n548) );
  AOI32X1 U1010 ( .A0(n533), .A1(n543), .A2(n548), .B0(temp[6]), .B1(n557), 
        .Y(n534) );
  OAI22XL U1011 ( .A0(res_di[7]), .A1(n574), .B0(n550), .B1(n534), .Y(N928) );
  NOR2BX1 U1012 ( .AN(res_di[0]), .B(temp[0]), .Y(n537) );
  OAI211X1 U1013 ( .A0(res_di[1]), .A1(n537), .B0(n536), .C0(n553), .Y(n539)
         );
  AOI31X1 U1014 ( .A0(n541), .A1(n540), .A2(n539), .B0(n538), .Y(n545) );
  AOI211X1 U1015 ( .A0(n545), .A1(n554), .B0(n544), .C0(n556), .Y(n546) );
  NOR3BXL U1016 ( .AN(n548), .B(n547), .C(n546), .Y(n551) );
  OAI32X1 U1017 ( .A0(n551), .A1(n550), .A2(n549), .B0(res_di[7]), .B1(n574), 
        .Y(N701) );
  NAND2BX1 U1018 ( .AN(N785), .B(temp[4]), .Y(n558) );
  NOR2BX1 U1019 ( .AN(N785), .B(temp[4]), .Y(n560) );
  OAI22XL U1020 ( .A0(n560), .A1(n552), .B0(N786), .B1(n560), .Y(n568) );
  OAI2BB2XL U1021 ( .B0(temp[0]), .B1(n575), .A0N(n160), .A1N(N782), .Y(n561)
         );
  OAI21XL U1022 ( .A0(N782), .A1(n160), .B0(n561), .Y(n564) );
  NOR2BX1 U1023 ( .AN(N783), .B(temp[2]), .Y(n562) );
  OAI22XL U1024 ( .A0(n562), .A1(n572), .B0(N784), .B1(n562), .Y(n563) );
  AOI2BB2X1 U1025 ( .B0(n564), .B1(n563), .A0N(n566), .A1N(n572), .Y(n565) );
  OAI221XL U1026 ( .A0(N784), .A1(n566), .B0(N784), .B1(n572), .C0(n565), .Y(
        n567) );
  OAI211X1 U1027 ( .A0(temp[6]), .A1(n581), .B0(n568), .C0(n567), .Y(n569) );
  AO22X1 U1028 ( .A0(n574), .A1(N788), .B0(n570), .B1(n569), .Y(n571) );
  DT_DW01_inc_0_DW01_inc_1 add_327 ( .A(temp), .SUM({N879, N878, N877, N876, 
        N875, N874, N873, N872}) );
  DT_DW01_dec_0 sub_199 ( .A(res_addr), .SUM({N375, N374, N373, N372, N371, 
        N370, N369, N368, N367, N366, N365, N364, N363, N362}) );
  DT_DW01_inc_1_DW01_inc_2 add_183 ( .A(res_addr), .SUM({N243, N242, N241, 
        N240, N239, N238, N237, N236, N235, N234, N233, N232, N231, N230}) );
  DT_DW01_inc_2_DW01_inc_3 add_107 ( .A(sti_addr), .SUM({N87, N86, N85, N84, 
        N83, N82, N81, N80, N79, N78}) );
  DT_DW01_inc_3_DW01_inc_4 r533 ( .A(res_di), .SUM({N788, N787, N786, N785, 
        N784, N783, N782, N781}) );
  DT_DW01_inc_4_DW01_inc_5 r529 ( .A({i[13], n503, n492, n493, n494, n495, 
        n496, n502, n501, n500, n499, n498, n464, n497}), .SUM({N515, N514, 
        N513, N512, N511, N510, N509, N508, N507, N506, N505, N504, N503, N502}) );
  DFFRX2 sti_rd_reg ( .D(n460), .CK(clk), .RN(reset), .Q(sti_rd), .QN(n117) );
  DFFRX2 done_reg ( .D(N990), .CK(clk), .RN(reset), .Q(done) );
  DFFRX2 \temp_reg[5]  ( .D(N832), .CK(clk), .RN(n504), .Q(temp[5]), .QN(n552)
         );
endmodule

