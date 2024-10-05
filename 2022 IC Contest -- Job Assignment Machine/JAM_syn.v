/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Mon Jan  8 17:01:28 2024
/////////////////////////////////////////////////////////////


module JAM_DW01_add_11 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;
  assign SUM[8] = carry[8];

  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module JAM_DW01_add_8 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;
  assign SUM[8] = carry[8];

  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module JAM_DW01_add_7 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;
  assign SUM[9] = carry[9];

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module JAM_DW01_add_4 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;
  assign SUM[8] = carry[8];

  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module JAM_DW01_add_1 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;
  assign SUM[8] = carry[8];

  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [9:1] carry;
  assign SUM[9] = carry[9];

  CMPR32X2 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR3X1 U2 ( .A(A[4]), .B(B[4]), .C(carry[4]), .Y(SUM[4]) );
  NAND3X1 U3 ( .A(n2), .B(n3), .C(n4), .Y(carry[5]) );
  NAND2X1 U4 ( .A(carry[4]), .B(A[4]), .Y(n2) );
  NAND2X1 U5 ( .A(B[4]), .B(A[4]), .Y(n3) );
  NAND2X1 U6 ( .A(B[4]), .B(carry[4]), .Y(n4) );
  XOR2X1 U7 ( .A(B[6]), .B(A[6]), .Y(n5) );
  XOR2X1 U8 ( .A(carry[6]), .B(n5), .Y(SUM[6]) );
  NAND3X1 U9 ( .A(n6), .B(n7), .C(n8), .Y(carry[7]) );
  NAND2X1 U10 ( .A(B[6]), .B(carry[6]), .Y(n6) );
  NAND2X1 U11 ( .A(A[6]), .B(carry[6]), .Y(n7) );
  NAND2X1 U12 ( .A(A[6]), .B(B[6]), .Y(n8) );
  XOR2XL U13 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N201, N202, N203, N204, N205, N206, N207, N208, N209, n1057, n1058,
         n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068,
         n1069, n1070, n1071, n1072, n1073, state, ok, next_state,
         \array[0][2] , \array[0][1] , \array[0][0] , \array[1][2] ,
         \array[1][1] , \array[1][0] , \array[2][2] , \array[2][1] ,
         \array[2][0] , \array[3][2] , \array[3][1] , \array[3][0] ,
         \array[4][2] , \array[4][1] , \array[4][0] , \array[5][2] ,
         \array[5][1] , \array[5][0] , \array[6][2] , \array[6][1] ,
         \array[6][0] , \array[7][2] , \array[7][1] , \array[7][0] ,
         \array_cost[0][6] , \array_cost[0][5] , \array_cost[0][4] ,
         \array_cost[0][3] , \array_cost[0][2] , \array_cost[0][1] ,
         \array_cost[0][0] , \array_cost[1][6] , \array_cost[1][5] ,
         \array_cost[1][4] , \array_cost[1][3] , \array_cost[1][2] ,
         \array_cost[1][1] , \array_cost[1][0] , \array_cost[2][6] ,
         \array_cost[2][5] , \array_cost[2][4] , \array_cost[2][3] ,
         \array_cost[2][2] , \array_cost[2][1] , \array_cost[2][0] ,
         \array_cost[3][6] , \array_cost[3][5] , \array_cost[3][4] ,
         \array_cost[3][3] , \array_cost[3][2] , \array_cost[3][1] ,
         \array_cost[3][0] , \array_cost[4][6] , \array_cost[4][5] ,
         \array_cost[4][4] , \array_cost[4][3] , \array_cost[4][2] ,
         \array_cost[4][1] , \array_cost[4][0] , \array_cost[5][6] ,
         \array_cost[5][5] , \array_cost[5][4] , \array_cost[5][3] ,
         \array_cost[5][2] , \array_cost[5][1] , \array_cost[5][0] ,
         \array_cost[6][6] , \array_cost[6][5] , \array_cost[6][4] ,
         \array_cost[6][3] , \array_cost[6][2] , \array_cost[6][1] ,
         \array_cost[6][0] , \array_cost[7][6] , \array_cost[7][5] ,
         \array_cost[7][4] , \array_cost[7][3] , \array_cost[7][2] ,
         \array_cost[7][1] , \array_cost[7][0] , N220, N221, N222, N747, N748,
         N749, N750, N751, N752, N753, N754, N755, N756, N885, N886, N887,
         N888, N889, N890, N891, N892, N893, N894, N1079, N1080, N1081, N1082,
         N1083, N1084, N1085, N1086, N1087, N1088, N1095, N1096, N1097, n266,
         n267, n269, n270, n271, n276, n277, n279, n281, n282, n285, n287,
         n290, n295, n296, n297, n299, n301, n302, n304, n307, n308, n309,
         n312, n313, n315, n316, n319, n320, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n343, n346, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n362, n363, n364,
         n365, n372, n374, n376, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n390, n391, n392, n393, n394, n397, n399,
         n400, n401, n402, n403, n405, n406, n408, n410, n412, n413, n415,
         n418, n419, n422, n424, n426, n428, n430, n431, n434, n436, n439,
         n442, n444, n445, n446, n449, n451, n452, n453, n454, n455, n456,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n474, n475, n478, n480, n481, n483, n485, n486, n487, n488,
         n490, n491, n493, n494, n496, n497, n499, n500, n501, n502, n504,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n520, n523, n525, n526, n527, n529, n530, n531, n532,
         n533, n534, n535, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n556, n557,
         n559, n560, n561, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n579, n580, n582, n584, n585,
         n586, n587, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n611, n612, n614, n616, n621, n625, n627, n628, n629, n630,
         n631, n632, n633, n635, n636, n637, n638, n639, n640, n641, n644,
         n646, n647, n648, n649, n650, n651, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n717, n719, n720, n721, n723, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, n820,
         n821, n822, n823, n824, n825, n826, n827, n828, n829, n830, n831,
         n832, n833, N882, N881, N880, N879, N878, N877, N876, N875, N873,
         N872, N871, N870, N869, N868, N867, N866, N865, N862, N861, N860,
         N859, N858, N857, N856, N855, N852, N851, N850, N849, N848, N847,
         N846, N845, N843, N842, N841, N840, N839, N838, N837, N836, N744,
         N743, N742, N741, N740, N739, N738, N737, N735, N734, N733, N732,
         N731, N730, N729, N728, N727, N724, N723, N722, N721, N720, N719,
         N718, N717, N714, N713, N712, N711, N710, N709, N708, N707, N705,
         N704, N703, N702, N701, N700, N699, N698, n834, n835, n836, n837,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898,
         n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909,
         n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n926, n927, n928, n929, n930, n931,
         n932, n933, n934, n935, n936, n937, n938, n939, n940, n941, n942,
         n943, n944, n945, n946, n947, n948, n949, n950, n951, n952, n953,
         n954, n955, n956, n957, n958, n959, n960, n961, n962, n963, n964,
         n965, n966, n967, n968, n969, n970, n971, n972, n973, n974, n975,
         n976, n977, n978, n979, n980, n981, n982, n983, n984, n985, n986,
         n987, n988, n989, n990, n991, n992, n993, n994, n995, n996, n997,
         n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007,
         n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017,
         n1018, n1019, n1020, n1021, n1022, n1023, n1028, n1029, n1030, n1031,
         n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1045,
         n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053;
  wire   [1:0] process;
  wire   [9:1] \add_6_root_r829/carry ;
  wire   [9:1] \add_5_root_r829/carry ;
  wire   [9:1] \add_4_root_r829/carry ;
  wire   [8:1] \add_3_root_r829/carry ;
  wire   [9:1] \add_4_root_add_0_root_add_99_7/carry ;
  wire   [9:1] \add_5_root_add_0_root_add_99_7/carry ;
  wire   [9:1] \add_6_root_add_0_root_add_99_7/carry ;
  wire   [8:1] \add_3_root_add_0_root_add_99_7/carry ;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  JAM_DW01_add_11 add_2_root_add_0_root_add_99_7 ( .A({1'b0, 1'b0, N843, N842, 
        N841, N840, N839, N838, N837, N836}), .B({1'b0, 1'b0, N862, N861, N860, 
        N859, N858, N857, N856, N855}), .CI(1'b0), .SUM({
        SYNOPSYS_UNCONNECTED__0, n1053, n1052, n1051, n1050, n1049, n1048, 
        n1047, n1046, n1045}) );
  JAM_DW01_add_8 add_1_root_add_0_root_add_99_7 ( .A({1'b0, 1'b0, N882, N881, 
        N880, N879, N878, N877, N876, N875}), .B({1'b0, 1'b0, N852, N851, N850, 
        N849, N848, N847, N846, N845}), .CI(1'b0), .SUM({
        SYNOPSYS_UNCONNECTED__1, N873, N872, N871, N870, N869, N868, N867, 
        N866, N865}) );
  JAM_DW01_add_7 add_0_root_add_0_root_add_99_7 ( .A({1'b0, N873, N872, N871, 
        N870, N869, N868, N867, N866, N865}), .B({1'b0, n1053, n1052, n1051, 
        n1050, n1049, n1048, n1047, n1046, n1045}), .CI(1'b0), .SUM({N894, 
        N893, N892, N891, N890, N889, N888, N887, N886, N885}) );
  JAM_DW01_add_4 add_2_root_r829 ( .A({1'b0, 1'b0, N705, N704, N703, N702, 
        N701, N700, N699, N698}), .B({1'b0, 1'b0, N744, N743, N742, N741, N740, 
        N739, N738, N737}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED__2, n1041, 
        n1040, n1039, n1038, n1037, n1036, n1035, n1034, n1033}) );
  JAM_DW01_add_1 add_1_root_r829 ( .A({1'b0, 1'b0, N724, N723, N722, N721, 
        N720, N719, N718, N717}), .B({1'b0, 1'b0, N714, N713, N712, N711, N710, 
        N709, N708, N707}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED__3, N735, 
        N734, N733, N732, N731, N730, N729, N728, N727}) );
  JAM_DW01_add_0 add_0_root_r829 ( .A({1'b0, n1041, n1040, n1039, n1038, n1037, 
        n1036, n1035, n1034, n1033}), .B({1'b0, N735, N734, N733, N732, N731, 
        N730, N729, N728, N727}), .CI(1'b0), .SUM({N756, N755, N754, N753, 
        N752, N751, N750, N749, N748, N747}) );
  DFFRX1 ok_reg ( .D(N1085), .CK(CLK), .RN(n879), .Q(ok) );
  DFFSX1 \min_temp_reg[0]  ( .D(n833), .CK(CLK), .SN(n877), .Q(n659), .QN(n954) );
  DFFSX1 \min_temp_reg[1]  ( .D(n732), .CK(CLK), .SN(n877), .QN(n729) );
  DFFRX1 \array_num_1_reg[0]  ( .D(n686), .CK(CLK), .RN(n878), .Q(n837), .QN(
        n720) );
  DFFRX1 state_reg ( .D(next_state), .CK(CLK), .RN(n879), .Q(state) );
  DFFRX1 \array_num_1_reg[1]  ( .D(n678), .CK(CLK), .RN(n883), .QN(n670) );
  DFFRX1 \array_cost_reg[2][6]  ( .D(n766), .CK(CLK), .RN(n879), .Q(
        \array_cost[2][6] ) );
  DFFRX1 \array_cost_reg[1][6]  ( .D(n759), .CK(CLK), .RN(n883), .Q(
        \array_cost[1][6] ) );
  DFFRX1 \array_cost_reg[0][6]  ( .D(n753), .CK(CLK), .RN(n881), .Q(
        \array_cost[0][6] ) );
  DFFRX1 \array_cost_reg[7][6]  ( .D(n801), .CK(CLK), .RN(n884), .Q(
        \array_cost[7][6] ) );
  DFFRX1 \array_cost_reg[5][6]  ( .D(n787), .CK(CLK), .RN(n884), .Q(
        \array_cost[5][6] ) );
  DFFRX1 \array_reg[0][0]  ( .D(n734), .CK(CLK), .RN(n878), .Q(\array[0][0] ), 
        .QN(n668) );
  DFFRX1 \array_cost_reg[7][5]  ( .D(n802), .CK(CLK), .RN(n883), .Q(
        \array_cost[7][5] ) );
  DFFRX1 \array_cost_reg[2][5]  ( .D(n767), .CK(CLK), .RN(n879), .Q(
        \array_cost[2][5] ) );
  DFFRX1 \array_cost_reg[0][5]  ( .D(n808), .CK(CLK), .RN(n882), .Q(
        \array_cost[0][5] ) );
  DFFRX1 \array_cost_reg[1][5]  ( .D(n760), .CK(CLK), .RN(n883), .Q(
        \array_cost[1][5] ) );
  DFFRX1 \array_cost_reg[5][5]  ( .D(n788), .CK(CLK), .RN(n884), .Q(
        \array_cost[5][5] ) );
  DFFRX1 \array_cost_reg[7][4]  ( .D(n803), .CK(CLK), .RN(n885), .Q(
        \array_cost[7][4] ) );
  DFFRX1 \array_cost_reg[2][4]  ( .D(n768), .CK(CLK), .RN(n879), .Q(
        \array_cost[2][4] ) );
  DFFRX1 \array_cost_reg[0][4]  ( .D(n754), .CK(CLK), .RN(n881), .Q(
        \array_cost[0][4] ) );
  DFFRX1 \array_cost_reg[1][4]  ( .D(n761), .CK(CLK), .RN(n883), .Q(
        \array_cost[1][4] ) );
  DFFRX1 \array_cost_reg[5][4]  ( .D(n789), .CK(CLK), .RN(n884), .Q(
        \array_cost[5][4] ) );
  DFFRX1 \array_cost_reg[7][3]  ( .D(n804), .CK(CLK), .RN(n885), .Q(
        \array_cost[7][3] ) );
  DFFRX1 \array_cost_reg[1][3]  ( .D(n762), .CK(CLK), .RN(n883), .Q(
        \array_cost[1][3] ) );
  DFFRX1 \array_cost_reg[0][3]  ( .D(n755), .CK(CLK), .RN(n881), .Q(
        \array_cost[0][3] ) );
  DFFRX1 \array_cost_reg[2][3]  ( .D(n769), .CK(CLK), .RN(n880), .Q(
        \array_cost[2][3] ) );
  DFFRX1 \array_cost_reg[5][3]  ( .D(n790), .CK(CLK), .RN(n884), .Q(
        \array_cost[5][3] ) );
  DFFRX1 \array_cost_reg[7][2]  ( .D(n805), .CK(CLK), .RN(n885), .Q(
        \array_cost[7][2] ) );
  DFFRX1 \array_cost_reg[0][2]  ( .D(n756), .CK(CLK), .RN(n881), .Q(
        \array_cost[0][2] ) );
  DFFRX1 \array_cost_reg[1][2]  ( .D(n763), .CK(CLK), .RN(n884), .Q(
        \array_cost[1][2] ) );
  DFFRX1 \array_cost_reg[2][2]  ( .D(n770), .CK(CLK), .RN(n880), .Q(
        \array_cost[2][2] ) );
  DFFRX1 \array_cost_reg[5][2]  ( .D(n791), .CK(CLK), .RN(n884), .Q(
        \array_cost[5][2] ) );
  DFFRX1 \array_reg[4][1]  ( .D(n820), .CK(CLK), .RN(n883), .Q(\array[4][1] ), 
        .QN(n698) );
  DFFRX1 \array_reg[1][1]  ( .D(n811), .CK(CLK), .RN(n883), .Q(\array[1][1] ), 
        .QN(n689) );
  DFFRX1 \array_cost_reg[7][1]  ( .D(n806), .CK(CLK), .RN(n885), .Q(
        \array_cost[7][1] ) );
  DFFRX1 \array_cost_reg[0][1]  ( .D(n757), .CK(CLK), .RN(n881), .Q(
        \array_cost[0][1] ) );
  DFFRX1 \array_cost_reg[2][1]  ( .D(n771), .CK(CLK), .RN(n880), .Q(
        \array_cost[2][1] ) );
  DFFRX1 \array_reg[0][1]  ( .D(n831), .CK(CLK), .RN(n878), .Q(\array[0][1] ), 
        .QN(n660) );
  DFFRX1 \array_cost_reg[1][1]  ( .D(n764), .CK(CLK), .RN(n884), .Q(
        \array_cost[1][1] ) );
  DFFRX1 \array_cost_reg[5][1]  ( .D(n792), .CK(CLK), .RN(n884), .Q(
        \array_cost[5][1] ) );
  DFFRX1 \array_cost_reg[6][0]  ( .D(n800), .CK(CLK), .RN(n881), .Q(
        \array_cost[6][0] ) );
  DFFRX1 \array_reg[1][2]  ( .D(n810), .CK(CLK), .RN(n883), .Q(\array[1][2] ), 
        .QN(n688) );
  DFFRX1 \array_reg[0][2]  ( .D(n733), .CK(CLK), .RN(n878), .Q(\array[0][2] ), 
        .QN(n677) );
  DFFRX1 \array_num_1_reg[2]  ( .D(n685), .CK(CLK), .RN(n878), .Q(n835), .QN(
        n719) );
  DFFRX1 \process_reg[1]  ( .D(N1084), .CK(CLK), .RN(n882), .Q(process[1]), 
        .QN(n834) );
  DFFRX1 \process_reg[0]  ( .D(N1083), .CK(CLK), .RN(n882), .Q(process[0]), 
        .QN(n836) );
  DFFRX1 \array_reg[6][0]  ( .D(n827), .CK(CLK), .RN(n878), .Q(\array[6][0] ), 
        .QN(n705) );
  DFFRX1 \array_reg[2][0]  ( .D(n815), .CK(CLK), .RN(n882), .Q(\array[2][0] ), 
        .QN(n693) );
  DFFRX1 \array_cost_reg[6][6]  ( .D(n794), .CK(CLK), .RN(n880), .Q(
        \array_cost[6][6] ) );
  DFFRX1 \array_cost_reg[3][6]  ( .D(n773), .CK(CLK), .RN(n885), .Q(
        \array_cost[3][6] ) );
  DFFRX1 \array_cost_reg[4][6]  ( .D(n780), .CK(CLK), .RN(n880), .Q(
        \array_cost[4][6] ) );
  DFFRX1 \array_reg[4][0]  ( .D(n821), .CK(CLK), .RN(n878), .Q(\array[4][0] ), 
        .QN(n699) );
  DFFRX1 \array_cost_reg[6][5]  ( .D(n795), .CK(CLK), .RN(n881), .Q(
        \array_cost[6][5] ) );
  DFFRX1 \array_cost_reg[4][5]  ( .D(n781), .CK(CLK), .RN(n880), .Q(
        \array_cost[4][5] ) );
  DFFRX1 \array_cost_reg[3][5]  ( .D(n774), .CK(CLK), .RN(n885), .Q(
        \array_cost[3][5] ) );
  DFFRX1 \array_cost_reg[6][4]  ( .D(n796), .CK(CLK), .RN(n881), .Q(
        \array_cost[6][4] ) );
  DFFRX1 \array_cost_reg[4][4]  ( .D(n782), .CK(CLK), .RN(n880), .Q(
        \array_cost[4][4] ) );
  DFFRX1 \array_cost_reg[3][4]  ( .D(n775), .CK(CLK), .RN(n885), .Q(
        \array_cost[3][4] ) );
  DFFRX1 \array_cost_reg[6][3]  ( .D(n797), .CK(CLK), .RN(n881), .Q(
        \array_cost[6][3] ) );
  DFFRX1 \array_cost_reg[3][3]  ( .D(n776), .CK(CLK), .RN(n885), .Q(
        \array_cost[3][3] ) );
  DFFRX1 \array_cost_reg[4][3]  ( .D(n783), .CK(CLK), .RN(n880), .Q(
        \array_cost[4][3] ) );
  DFFRX1 \array_cost_reg[6][2]  ( .D(n798), .CK(CLK), .RN(n881), .Q(
        \array_cost[6][2] ) );
  DFFRX1 \array_cost_reg[3][2]  ( .D(n777), .CK(CLK), .RN(n885), .Q(
        \array_cost[3][2] ) );
  DFFRX1 \array_cost_reg[4][2]  ( .D(n784), .CK(CLK), .RN(n880), .Q(
        \array_cost[4][2] ) );
  DFFRX1 \array_reg[5][1]  ( .D(n823), .CK(CLK), .RN(n883), .Q(\array[5][1] ), 
        .QN(n701) );
  DFFRX1 \array_cost_reg[6][1]  ( .D(n799), .CK(CLK), .RN(n881), .Q(
        \array_cost[6][1] ) );
  DFFRX1 \array_cost_reg[4][1]  ( .D(n785), .CK(CLK), .RN(n880), .Q(
        \array_cost[4][1] ) );
  DFFRX1 \array_cost_reg[3][1]  ( .D(n778), .CK(CLK), .RN(n885), .Q(
        \array_cost[3][1] ) );
  DFFRX1 \array_reg[3][2]  ( .D(n816), .CK(CLK), .RN(n883), .Q(\array[3][2] ), 
        .QN(n694) );
  DFFRX1 \array_num_reg[1]  ( .D(n752), .CK(CLK), .RN(n882), .Q(N208), .QN(
        n717) );
  DFFRX1 \cout_reg[1]  ( .D(N1080), .CK(CLK), .RN(n878), .Q(N202), .QN(n723)
         );
  DFFRX1 \array_cost_reg[4][0]  ( .D(n786), .CK(CLK), .RN(n880), .Q(
        \array_cost[4][0] ) );
  DFFRX1 \array_cost_reg[2][0]  ( .D(n772), .CK(CLK), .RN(n880), .Q(
        \array_cost[2][0] ) );
  DFFRX1 \array_cost_reg[7][0]  ( .D(n807), .CK(CLK), .RN(n885), .Q(
        \array_cost[7][0] ) );
  DFFRX1 \array_cost_reg[0][0]  ( .D(n758), .CK(CLK), .RN(n881), .Q(
        \array_cost[0][0] ) );
  DFFRX1 \array_cost_reg[5][0]  ( .D(n793), .CK(CLK), .RN(n884), .Q(
        \array_cost[5][0] ) );
  DFFSX1 \MinCost_reg[1]  ( .D(n746), .CK(CLK), .SN(n876), .QN(n663) );
  DFFRX1 \W_reg[2]  ( .D(n679), .CK(CLK), .RN(n879), .Q(n1057), .QN(n671) );
  DFFRX1 Valid_reg ( .D(n730), .CK(CLK), .RN(n885), .Q(n1073), .QN(n669) );
  DFFRX1 \MatchCount_reg[3]  ( .D(n735), .CK(CLK), .RN(n882), .Q(n1063), .QN(
        n667) );
  DFFRX1 \J_reg[0]  ( .D(n680), .CK(CLK), .RN(n879), .Q(n1062), .QN(n672) );
  DFFRX1 \J_reg[1]  ( .D(n681), .CK(CLK), .RN(n879), .Q(n1061), .QN(n673) );
  DFFRX1 \J_reg[2]  ( .D(n682), .CK(CLK), .RN(n879), .Q(n1060), .QN(n674) );
  DFFRX1 \W_reg[0]  ( .D(n683), .CK(CLK), .RN(n879), .Q(n1059), .QN(n675) );
  DFFRX1 \W_reg[1]  ( .D(n684), .CK(CLK), .RN(n879), .Q(n1058), .QN(n676) );
  DFFRX1 \MatchCount_reg[2]  ( .D(n738), .CK(CLK), .RN(n882), .QN(n709) );
  DFFRX1 \MatchCount_reg[1]  ( .D(n736), .CK(CLK), .RN(n882), .QN(n710) );
  DFFRX1 \MatchCount_reg[0]  ( .D(n943), .CK(CLK), .RN(n882), .QN(n711) );
  DFFRX1 \array_cost_reg[1][0]  ( .D(n765), .CK(CLK), .RN(n946), .Q(
        \array_cost[1][0] ) );
  DFFRX1 \array_cost_reg[3][0]  ( .D(n779), .CK(CLK), .RN(n946), .Q(
        \array_cost[3][0] ) );
  DFFRX1 \array_reg[2][2]  ( .D(n813), .CK(CLK), .RN(n946), .Q(\array[2][2] ), 
        .QN(n691) );
  DFFSX1 \array_reg[5][2]  ( .D(n822), .CK(CLK), .SN(n946), .Q(\array[5][2] ), 
        .QN(n700) );
  DFFSX1 \array_reg[1][0]  ( .D(n812), .CK(CLK), .SN(n946), .Q(\array[1][0] ), 
        .QN(n690) );
  DFFSX1 \array_reg[6][2]  ( .D(n825), .CK(CLK), .SN(n946), .Q(\array[6][2] ), 
        .QN(n703) );
  DFFSX1 \array_reg[6][1]  ( .D(n826), .CK(CLK), .SN(n946), .Q(\array[6][1] ), 
        .QN(n704) );
  DFFSX1 \array_reg[3][0]  ( .D(n818), .CK(CLK), .SN(n946), .Q(\array[3][0] ), 
        .QN(n696) );
  DFFSX1 \array_reg[2][1]  ( .D(n814), .CK(CLK), .SN(n946), .Q(\array[2][1] ), 
        .QN(n692) );
  DFFSX1 \array_reg[5][0]  ( .D(n824), .CK(CLK), .SN(n946), .Q(\array[5][0] ), 
        .QN(n702) );
  DFFSX1 \MinCost_reg[9]  ( .D(n748), .CK(CLK), .SN(n946), .Q(n1064), .QN(n661) );
  DFFSX1 \MinCost_reg[8]  ( .D(n739), .CK(CLK), .SN(n946), .Q(n1065), .QN(n666) );
  DFFSX1 \MinCost_reg[7]  ( .D(n740), .CK(CLK), .SN(n946), .Q(n1066), .QN(n665) );
  DFFSX1 \MinCost_reg[6]  ( .D(n741), .CK(CLK), .SN(n946), .Q(n1067), .QN(n712) );
  DFFSX1 \MinCost_reg[5]  ( .D(n742), .CK(CLK), .SN(n946), .Q(n1068), .QN(n664) );
  DFFSX1 \MinCost_reg[4]  ( .D(n743), .CK(CLK), .SN(n946), .Q(n1069), .QN(n713) );
  DFFSX1 \MinCost_reg[3]  ( .D(n744), .CK(CLK), .SN(n946), .Q(n1070), .QN(n714) );
  DFFSX1 \MinCost_reg[2]  ( .D(n745), .CK(CLK), .SN(n946), .Q(n1071), .QN(n715) );
  DFFSX1 \MinCost_reg[0]  ( .D(n747), .CK(CLK), .SN(n946), .Q(n1072), .QN(n662) );
  DFFSXL \min_temp_reg[2]  ( .D(n731), .CK(CLK), .SN(n946), .Q(n1029), .QN(
        n728) );
  DFFRXL \cout_reg[3]  ( .D(N1082), .CK(CLK), .RN(n946), .Q(n1016), .QN(n721)
         );
  DFFRX2 \cout_reg[2]  ( .D(N1081), .CK(CLK), .RN(n946), .Q(N203), .QN(n903)
         );
  DFFRX2 \cout_reg[0]  ( .D(N1079), .CK(CLK), .RN(n946), .Q(N201), .QN(n902)
         );
  DFFSX2 \array_reg[7][2]  ( .D(n828), .CK(CLK), .SN(n946), .Q(\array[7][2] ), 
        .QN(n706) );
  DFFRX2 \array_num_reg[2]  ( .D(n809), .CK(CLK), .RN(n946), .Q(N209), .QN(
        n941) );
  DFFSX2 \array_reg[7][1]  ( .D(n829), .CK(CLK), .SN(n946), .Q(\array[7][1] ), 
        .QN(n707) );
  DFFSX2 \array_reg[7][0]  ( .D(n830), .CK(CLK), .SN(n946), .Q(\array[7][0] ), 
        .QN(n708) );
  DFFRX2 \array_min_reg[2]  ( .D(n832), .CK(CLK), .RN(n946), .Q(N206), .QN(
        n923) );
  DFFSX2 \array_reg[3][1]  ( .D(n817), .CK(CLK), .SN(n946), .Q(\array[3][1] ), 
        .QN(n695) );
  DFFRX2 \array_min_reg[1]  ( .D(n750), .CK(CLK), .RN(n946), .Q(N205), .QN(
        n921) );
  DFFSX2 \array_reg[4][2]  ( .D(n819), .CK(CLK), .SN(n946), .Q(\array[4][2] ), 
        .QN(n697) );
  DFFRX2 \array_num_reg[0]  ( .D(n751), .CK(CLK), .RN(n946), .Q(N207), .QN(
        n940) );
  DFFRX2 \array_min_reg[0]  ( .D(n749), .CK(CLK), .RN(n946), .Q(N204), .QN(
        n922) );
  NAND2X4 U519 ( .A(n856), .B(n312), .Y(n320) );
  OA21X4 U520 ( .A0(n312), .A1(MatchCount[2]), .B0(n313), .Y(n307) );
  NAND4X2 U521 ( .A(n322), .B(n323), .C(n324), .D(n325), .Y(n312) );
  ADDFXL U522 ( .A(\array_cost[0][1] ), .B(\array_cost[4][1] ), .CI(
        \add_6_root_r829/carry [1]), .CO(\add_6_root_r829/carry [2]), .S(N718)
         );
  ADDFXL U523 ( .A(\array_cost[2][1] ), .B(\array_cost[6][1] ), .CI(
        \add_5_root_r829/carry [1]), .CO(\add_5_root_r829/carry [2]), .S(N708)
         );
  ADDFXL U524 ( .A(\array_cost[1][3] ), .B(\array_cost[3][3] ), .CI(
        \add_4_root_r829/carry [3]), .CO(\add_4_root_r829/carry [4]), .S(N740)
         );
  ADDFXL U525 ( .A(\array_cost[5][3] ), .B(\array_cost[7][3] ), .CI(
        \add_3_root_r829/carry [3]), .CO(\add_3_root_r829/carry [4]), .S(N701)
         );
  ADDFXL U526 ( .A(\array_cost[2][3] ), .B(\array_cost[6][3] ), .CI(
        \add_5_root_r829/carry [3]), .CO(\add_5_root_r829/carry [4]), .S(N710)
         );
  ADDFXL U527 ( .A(\array_cost[1][2] ), .B(\array_cost[3][2] ), .CI(
        \add_4_root_r829/carry [2]), .CO(\add_4_root_r829/carry [3]), .S(N739)
         );
  ADDFXL U528 ( .A(\array_cost[5][2] ), .B(\array_cost[7][2] ), .CI(
        \add_3_root_r829/carry [2]), .CO(\add_3_root_r829/carry [3]), .S(N700)
         );
  ADDFXL U529 ( .A(\array_cost[2][2] ), .B(\array_cost[6][2] ), .CI(
        \add_5_root_r829/carry [2]), .CO(\add_5_root_r829/carry [3]), .S(N709)
         );
  ADDFXL U530 ( .A(\array_cost[2][4] ), .B(\array_cost[6][4] ), .CI(
        \add_5_root_r829/carry [4]), .CO(\add_5_root_r829/carry [5]), .S(N711)
         );
  ADDFXL U531 ( .A(\array_cost[2][5] ), .B(\array_cost[6][5] ), .CI(
        \add_5_root_r829/carry [5]), .CO(\add_5_root_r829/carry [6]), .S(N712)
         );
  NOR2X1 U532 ( .A(n717), .B(n940), .Y(n936) );
  XOR2X1 U533 ( .A(\array_cost[3][0] ), .B(\array_cost[7][0] ), .Y(N836) );
  OAI211X1 U534 ( .A0(n977), .A1(n1029), .B0(n627), .C0(n628), .Y(n297) );
  NOR3X1 U535 ( .A(N207), .B(n941), .C(n1028), .Y(n525) );
  INVX1 U536 ( .A(n717), .Y(n1028) );
  NOR2X2 U537 ( .A(n921), .B(n922), .Y(n917) );
  NOR3X2 U538 ( .A(n922), .B(n923), .C(N205), .Y(n530) );
  NOR3X2 U539 ( .A(n921), .B(n923), .C(n922), .Y(n599) );
  NOR3X2 U540 ( .A(n922), .B(n921), .C(N206), .Y(n481) );
  OAI221X4 U541 ( .A0(n403), .A1(\array[3][1] ), .B0(n691), .B1(n1030), .C0(
        n405), .Y(n290) );
  OAI211XL U542 ( .A0(n704), .A1(\array[7][1] ), .B0(\array[7][0] ), .C0(n705), 
        .Y(n415) );
  NOR2X2 U543 ( .A(n904), .B(n902), .Y(n898) );
  AOI211XL U544 ( .A0(n723), .A1(n1028), .B0(N207), .C0(n902), .Y(n657) );
  INVX6 U545 ( .A(RST), .Y(n946) );
  OAI22X1 U546 ( .A0(n941), .A1(n931), .B0(N209), .B1(n930), .Y(N1096) );
  OAI22X1 U547 ( .A0(n901), .A1(n903), .B0(N203), .B1(n900), .Y(N1086) );
  OAI22X1 U548 ( .A0(n939), .A1(n941), .B0(N209), .B1(n938), .Y(N1095) );
  INVX16 U549 ( .A(n711), .Y(MatchCount[0]) );
  INVX16 U550 ( .A(n710), .Y(MatchCount[1]) );
  INVX16 U551 ( .A(n709), .Y(MatchCount[2]) );
  BUFX12 U552 ( .A(n1058), .Y(W[1]) );
  BUFX12 U553 ( .A(n1059), .Y(W[0]) );
  BUFX12 U554 ( .A(n1060), .Y(J[2]) );
  BUFX12 U555 ( .A(n1061), .Y(J[1]) );
  BUFX12 U556 ( .A(n1062), .Y(J[0]) );
  BUFX12 U557 ( .A(n1063), .Y(MatchCount[3]) );
  BUFX12 U558 ( .A(n1073), .Y(Valid) );
  BUFX12 U559 ( .A(n1057), .Y(W[2]) );
  BUFX12 U560 ( .A(n1064), .Y(MinCost[9]) );
  BUFX12 U561 ( .A(n1065), .Y(MinCost[8]) );
  BUFX12 U562 ( .A(n1066), .Y(MinCost[7]) );
  BUFX12 U563 ( .A(n1068), .Y(MinCost[5]) );
  BUFX12 U564 ( .A(n1070), .Y(MinCost[3]) );
  BUFX12 U565 ( .A(n1071), .Y(MinCost[2]) );
  INVX16 U566 ( .A(n663), .Y(MinCost[1]) );
  BUFX12 U567 ( .A(n1069), .Y(MinCost[4]) );
  BUFX12 U568 ( .A(n1072), .Y(MinCost[0]) );
  BUFX12 U569 ( .A(n1067), .Y(MinCost[6]) );
  OAI22X1 U570 ( .A0(n903), .A1(n893), .B0(N203), .B1(n892), .Y(N1087) );
  OR2XL U571 ( .A(n312), .B(MatchCount[1]), .Y(n855) );
  AND2X2 U572 ( .A(n855), .B(n862), .Y(n313) );
  OAI21X1 U573 ( .A0(n711), .A1(n858), .B0(n320), .Y(n862) );
  AND2X2 U574 ( .A(\array_cost[1][0] ), .B(\array_cost[3][0] ), .Y(
        \add_4_root_r829/carry [1]) );
  OAI21XL U575 ( .A0(n307), .A1(n667), .B0(n308), .Y(n735) );
  AND2X2 U576 ( .A(n335), .B(n322), .Y(n860) );
  BUFX4 U577 ( .A(n319), .Y(n874) );
  XOR2X1 U578 ( .A(\array_cost[3][0] ), .B(\array_cost[1][0] ), .Y(N737) );
  OR2X2 U579 ( .A(n874), .B(n316), .Y(n856) );
  OAI21XL U580 ( .A0(n326), .A1(n333), .B0(n343), .Y(n341) );
  INVX1 U581 ( .A(n320), .Y(n857) );
  INVX1 U582 ( .A(n320), .Y(n942) );
  AND2XL U583 ( .A(\array_cost[7][0] ), .B(\array_cost[3][0] ), .Y(
        \add_3_root_add_0_root_add_99_7/carry [1]) );
  OAI2BB2XL U584 ( .B0(n942), .B1(n715), .A0N(N887), .A1N(n874), .Y(n745) );
  OAI2BB2XL U585 ( .B0(n942), .B1(n662), .A0N(N885), .A1N(n874), .Y(n747) );
  NOR2X1 U586 ( .A(n874), .B(n316), .Y(n858) );
  NOR2X4 U587 ( .A(n312), .B(n1017), .Y(n316) );
  XOR2X1 U588 ( .A(N750), .B(n714), .Y(n859) );
  XOR2X1 U589 ( .A(\array_cost[7][0] ), .B(\array_cost[5][0] ), .Y(N698) );
  OAI2BB2XL U590 ( .B0(n942), .B1(n712), .A0N(N891), .A1N(n874), .Y(n741) );
  OAI2BB2XL U591 ( .B0(n942), .B1(n661), .A0N(N894), .A1N(n874), .Y(n748) );
  AND2XL U592 ( .A(\array_cost[5][0] ), .B(\array_cost[6][0] ), .Y(
        \add_4_root_add_0_root_add_99_7/carry [1]) );
  AND2X2 U593 ( .A(\array_cost[5][0] ), .B(\array_cost[7][0] ), .Y(
        \add_3_root_r829/carry [1]) );
  ADDFXL U594 ( .A(\array_cost[0][3] ), .B(\array_cost[4][3] ), .CI(
        \add_6_root_r829/carry [3]), .CO(\add_6_root_r829/carry [4]), .S(N720)
         );
  XOR2X1 U595 ( .A(\array_cost[4][0] ), .B(\array_cost[0][0] ), .Y(N717) );
  AND2XL U596 ( .A(\array_cost[0][0] ), .B(\array_cost[2][0] ), .Y(
        \add_6_root_add_0_root_add_99_7/carry [1]) );
  AND2X2 U597 ( .A(\array_cost[0][0] ), .B(\array_cost[4][0] ), .Y(
        \add_6_root_r829/carry [1]) );
  ADDFXL U598 ( .A(\array_cost[0][2] ), .B(\array_cost[4][2] ), .CI(
        \add_6_root_r829/carry [2]), .CO(\add_6_root_r829/carry [3]), .S(N719)
         );
  NOR3X1 U599 ( .A(n860), .B(n861), .C(n1017), .Y(n319) );
  AO22X1 U600 ( .A0(n330), .A1(n336), .B0(N755), .B1(n666), .Y(n335) );
  AND2XL U601 ( .A(n661), .B(N756), .Y(n861) );
  XOR2X1 U602 ( .A(\array_cost[4][0] ), .B(\array_cost[1][0] ), .Y(N845) );
  NAND2XL U603 ( .A(n316), .B(MatchCount[0]), .Y(n309) );
  AND2XL U604 ( .A(\array_cost[1][0] ), .B(\array_cost[4][0] ), .Y(
        \add_5_root_add_0_root_add_99_7/carry [1]) );
  ADDFXL U605 ( .A(\array_cost[1][1] ), .B(\array_cost[3][1] ), .CI(
        \add_4_root_r829/carry [1]), .CO(\add_4_root_r829/carry [2]), .S(N738)
         );
  ADDFXL U606 ( .A(\array_cost[5][1] ), .B(\array_cost[7][1] ), .CI(
        \add_3_root_r829/carry [1]), .CO(\add_3_root_r829/carry [2]), .S(N699)
         );
  ADDFXL U607 ( .A(\array_cost[1][4] ), .B(\array_cost[3][4] ), .CI(
        \add_4_root_r829/carry [4]), .CO(\add_4_root_r829/carry [5]), .S(N741)
         );
  ADDFXL U608 ( .A(\array_cost[0][4] ), .B(\array_cost[4][4] ), .CI(
        \add_6_root_r829/carry [4]), .CO(\add_6_root_r829/carry [5]), .S(N721)
         );
  ADDFXL U609 ( .A(\array_cost[5][4] ), .B(\array_cost[7][4] ), .CI(
        \add_3_root_r829/carry [4]), .CO(\add_3_root_r829/carry [5]), .S(N702)
         );
  ADDFXL U610 ( .A(\array_cost[1][5] ), .B(\array_cost[3][5] ), .CI(
        \add_4_root_r829/carry [5]), .CO(\add_4_root_r829/carry [6]), .S(N742)
         );
  ADDFXL U611 ( .A(\array_cost[0][5] ), .B(\array_cost[4][5] ), .CI(
        \add_6_root_r829/carry [5]), .CO(\add_6_root_r829/carry [6]), .S(N722)
         );
  ADDFXL U612 ( .A(\array_cost[5][5] ), .B(\array_cost[7][5] ), .CI(
        \add_3_root_r829/carry [5]), .CO(\add_3_root_r829/carry [6]), .S(N703)
         );
  ADDFXL U613 ( .A(\array_cost[2][6] ), .B(\array_cost[6][6] ), .CI(
        \add_5_root_r829/carry [6]), .CO(N714), .S(N713) );
  ADDFXL U614 ( .A(\array_cost[0][6] ), .B(\array_cost[4][6] ), .CI(
        \add_6_root_r829/carry [6]), .CO(N724), .S(N723) );
  ADDFXL U615 ( .A(\array_cost[1][6] ), .B(\array_cost[3][6] ), .CI(
        \add_4_root_r829/carry [6]), .CO(N744), .S(N743) );
  ADDFXL U616 ( .A(\array_cost[5][6] ), .B(\array_cost[7][6] ), .CI(
        \add_3_root_r829/carry [6]), .CO(N705), .S(N704) );
  NOR2X1 U617 ( .A(n513), .B(n999), .Y(n515) );
  OAI21X1 U618 ( .A0(n518), .A1(n837), .B0(n295), .Y(n442) );
  INVX3 U619 ( .A(n875), .Y(n1020) );
  OAI21X1 U620 ( .A0(n835), .A1(n837), .B0(n518), .Y(n513) );
  NOR2X1 U621 ( .A(n523), .B(N207), .Y(n475) );
  NAND2X1 U622 ( .A(n864), .B(n875), .Y(n445) );
  OAI32XL U623 ( .A0(MatchCount[2]), .A1(n710), .A2(n309), .B0(n709), .B1(n313), .Y(n738) );
  OA21XL U624 ( .A0(n703), .A1(\array[5][2] ), .B0(n424), .Y(n281) );
  OAI21XL U625 ( .A0(n700), .A1(\array[4][2] ), .B0(n418), .Y(n358) );
  OAI221XL U626 ( .A0(n406), .A1(\array[4][1] ), .B0(n694), .B1(\array[4][2] ), 
        .C0(n408), .Y(n363) );
  NAND2X1 U627 ( .A(n670), .B(n719), .Y(n518) );
  CLKBUFX3 U628 ( .A(state), .Y(n875) );
  NOR2X2 U629 ( .A(n1005), .B(n940), .Y(n446) );
  CLKINVX1 U630 ( .A(n694), .Y(n1030) );
  NOR2X1 U631 ( .A(n670), .B(n719), .Y(n586) );
  NOR3BXL U632 ( .AN(n362), .B(n271), .C(n269), .Y(n277) );
  OAI21XL U633 ( .A0(\array[1][1] ), .A1(n410), .B0(n692), .Y(n400) );
  NOR3X1 U634 ( .A(n921), .B(n923), .C(N204), .Y(n563) );
  CLKINVX1 U635 ( .A(n723), .Y(n1012) );
  NOR2X1 U636 ( .A(n723), .B(n902), .Y(n648) );
  NOR2X1 U637 ( .A(n1012), .B(n902), .Y(n374) );
  NOR3X2 U638 ( .A(process[0]), .B(process[1]), .C(n1020), .Y(n266) );
  NOR2X1 U639 ( .A(n875), .B(n903), .Y(n380) );
  NOR3X1 U640 ( .A(n717), .B(n941), .C(n940), .Y(n296) );
  OAI21X1 U641 ( .A0(process[1]), .A1(process[0]), .B0(n875), .Y(n351) );
  CLKINVX1 U642 ( .A(n548), .Y(n988) );
  INVX3 U643 ( .A(n494), .Y(n999) );
  CLKINVX1 U644 ( .A(n515), .Y(n991) );
  CLKINVX1 U645 ( .A(n499), .Y(n992) );
  NAND2X1 U646 ( .A(n493), .B(n989), .Y(n548) );
  CLKINVX1 U647 ( .A(n295), .Y(n1017) );
  NAND2X1 U648 ( .A(n493), .B(n494), .Y(n485) );
  NOR2X1 U649 ( .A(n611), .B(n1008), .Y(n593) );
  CLKINVX1 U650 ( .A(n463), .Y(n987) );
  CLKINVX1 U651 ( .A(n456), .Y(n980) );
  CLKINVX1 U652 ( .A(n459), .Y(n974) );
  CLKINVX1 U653 ( .A(n464), .Y(n972) );
  CLKINVX1 U654 ( .A(n469), .Y(n970) );
  CLKINVX1 U655 ( .A(n468), .Y(n984) );
  NOR2X2 U656 ( .A(n1023), .B(n1000), .Y(n494) );
  CLKINVX1 U657 ( .A(n431), .Y(n1023) );
  CLKINVX1 U658 ( .A(n527), .Y(n964) );
  CLKINVX1 U659 ( .A(n501), .Y(n963) );
  CLKINVX1 U660 ( .A(n449), .Y(n959) );
  NOR2X1 U661 ( .A(n442), .B(n1000), .Y(n499) );
  NOR2X1 U662 ( .A(n1023), .B(n1020), .Y(n295) );
  NOR2X1 U663 ( .A(n513), .B(n1004), .Y(n493) );
  CLKINVX1 U664 ( .A(n587), .Y(n1005) );
  CLKINVX1 U665 ( .A(n866), .Y(n1004) );
  AOI32X1 U666 ( .A0(n431), .A1(n1008), .A2(n513), .B0(n514), .B1(n515), .Y(
        n508) );
  CLKINVX1 U667 ( .A(n531), .Y(n1001) );
  CLKINVX1 U668 ( .A(n478), .Y(n961) );
  NOR2X1 U669 ( .A(n1009), .B(n991), .Y(n597) );
  CLKINVX1 U670 ( .A(n514), .Y(n1003) );
  CLKINVX1 U671 ( .A(n557), .Y(n965) );
  NAND3X1 U672 ( .A(n596), .B(n595), .C(n989), .Y(n611) );
  CLKINVX1 U673 ( .A(n607), .Y(n968) );
  INVX3 U674 ( .A(n475), .Y(n1008) );
  CLKINVX1 U675 ( .A(n428), .Y(n957) );
  NAND3BX1 U676 ( .AN(n493), .B(n1002), .C(n431), .Y(n486) );
  CLKINVX1 U677 ( .A(n445), .Y(n1022) );
  CLKINVX1 U678 ( .A(n584), .Y(n989) );
  CLKINVX1 U679 ( .A(n641), .Y(n1006) );
  OA21X2 U680 ( .A0(n866), .A1(n621), .B0(n1022), .Y(n304) );
  NAND2BX1 U681 ( .AN(n621), .B(n304), .Y(n302) );
  NAND2X1 U682 ( .A(n621), .B(n304), .Y(n301) );
  NOR2X1 U683 ( .A(n1023), .B(n866), .Y(n452) );
  CLKBUFX3 U684 ( .A(n384), .Y(n868) );
  NAND2BX1 U685 ( .AN(n385), .B(n1020), .Y(n384) );
  CLKBUFX3 U686 ( .A(n365), .Y(n865) );
  NAND2X1 U687 ( .A(n381), .B(n1015), .Y(n365) );
  CLKINVX1 U688 ( .A(n625), .Y(n1018) );
  CLKINVX1 U689 ( .A(n353), .Y(n1021) );
  CLKBUFX3 U690 ( .A(n876), .Y(n885) );
  CLKBUFX3 U691 ( .A(n876), .Y(n884) );
  CLKBUFX3 U692 ( .A(n877), .Y(n883) );
  CLKBUFX3 U693 ( .A(n877), .Y(n882) );
  CLKBUFX3 U694 ( .A(n876), .Y(n881) );
  CLKBUFX3 U695 ( .A(n876), .Y(n880) );
  CLKBUFX3 U696 ( .A(n877), .Y(n879) );
  CLKBUFX3 U697 ( .A(n876), .Y(n878) );
  INVX1 U698 ( .A(N1086), .Y(n977) );
  OAI21XL U699 ( .A0(N1086), .A1(n979), .B0(n638), .Y(n635) );
  OAI22XL U700 ( .A0(N1096), .A1(n985), .B0(N1095), .B1(n977), .Y(n638) );
  CLKINVX1 U701 ( .A(n297), .Y(n955) );
  NAND2X1 U702 ( .A(n955), .B(n875), .Y(n348) );
  INVXL U703 ( .A(N1087), .Y(n985) );
  NAND2X1 U704 ( .A(n875), .B(n297), .Y(n349) );
  OAI211XL U705 ( .A0(N1087), .A1(n986), .B0(N1088), .C0(n637), .Y(n636) );
  OA21XL U706 ( .A0(n979), .A1(N1086), .B0(n983), .Y(n637) );
  CLKINVX1 U707 ( .A(n631), .Y(n978) );
  INVXL U708 ( .A(N1095), .Y(n979) );
  INVXL U709 ( .A(N1096), .Y(n986) );
  NOR3BXL U710 ( .AN(n332), .B(n333), .C(n334), .Y(n324) );
  NOR4X1 U711 ( .A(n326), .B(n327), .C(n328), .D(n329), .Y(n325) );
  NAND2X1 U712 ( .A(n330), .B(n331), .Y(n327) );
  CLKINVX1 U713 ( .A(N1097), .Y(n983) );
  CLKINVX1 U714 ( .A(N1088), .Y(n982) );
  NAND2X1 U715 ( .A(n864), .B(N1096), .Y(n463) );
  NAND2X1 U716 ( .A(n864), .B(N1095), .Y(n456) );
  OAI22XL U717 ( .A0(n967), .A1(n463), .B0(n599), .B1(n464), .Y(n603) );
  OAI22XL U718 ( .A0(n967), .A1(n456), .B0(n599), .B1(n459), .Y(n598) );
  XNOR2X1 U719 ( .A(N748), .B(MinCost[1]), .Y(n332) );
  NAND2X1 U720 ( .A(N221), .B(n864), .Y(n464) );
  NAND2X1 U721 ( .A(N220), .B(n864), .Y(n459) );
  NAND2X1 U722 ( .A(N222), .B(n864), .Y(n469) );
  OAI22XL U723 ( .A0(n967), .A1(n468), .B0(n599), .B1(n469), .Y(n614) );
  NAND2X1 U724 ( .A(N1097), .B(n864), .Y(n468) );
  OAI22X1 U725 ( .A0(n1020), .A1(n549), .B0(n550), .B1(n445), .Y(n527) );
  NOR2X1 U726 ( .A(n530), .B(n551), .Y(n550) );
  OAI22XL U727 ( .A0(n518), .A1(n837), .B0(n552), .B1(n553), .Y(n549) );
  OAI22XL U728 ( .A0(n1001), .A1(n1009), .B0(n999), .B1(n548), .Y(n553) );
  NOR2X2 U729 ( .A(n834), .B(n836), .Y(n431) );
  AOI21X1 U730 ( .A0(n516), .A1(n517), .B0(n1020), .Y(n501) );
  OAI21XL U731 ( .A0(n504), .A1(n525), .B0(n864), .Y(n516) );
  OAI21XL U732 ( .A0(n518), .A1(n837), .B0(n520), .Y(n517) );
  OAI221XL U733 ( .A0(n1001), .A1(n1007), .B0(n523), .B1(n999), .C0(n507), .Y(
        n520) );
  NAND2X1 U734 ( .A(n515), .B(n446), .Y(n507) );
  OAI221X1 U735 ( .A0(n1005), .A1(n992), .B0(n442), .B1(n1002), .C0(n474), .Y(
        n449) );
  OAI21XL U736 ( .A0(n458), .A1(n475), .B0(n1022), .Y(n474) );
  NOR2X1 U737 ( .A(N209), .B(n1028), .Y(n587) );
  CLKBUFX3 U738 ( .A(n454), .Y(n866) );
  NOR2X1 U739 ( .A(n1005), .B(N207), .Y(n454) );
  CLKINVX1 U740 ( .A(n518), .Y(n1000) );
  INVX3 U741 ( .A(n446), .Y(n1002) );
  NOR2X1 U742 ( .A(n446), .B(n475), .Y(n514) );
  NOR2X2 U743 ( .A(n518), .B(n1023), .Y(n531) );
  OAI211X1 U744 ( .A0(n442), .A1(n1008), .B0(n496), .C0(n497), .Y(n478) );
  OAI21XL U745 ( .A0(n481), .A1(n867), .B0(n1022), .Y(n496) );
  OAI21XL U746 ( .A0(n493), .A1(n1003), .B0(n499), .Y(n497) );
  NOR2X1 U747 ( .A(n356), .B(n976), .Y(n270) );
  CLKINVX1 U748 ( .A(n363), .Y(n995) );
  NAND2BX1 U749 ( .AN(n269), .B(n354), .Y(n360) );
  NAND2X1 U750 ( .A(n270), .B(n387), .Y(n354) );
  OAI21X1 U751 ( .A0(n442), .A1(n1010), .B0(n579), .Y(n557) );
  CLKINVX1 U752 ( .A(n551), .Y(n1010) );
  AOI32X1 U753 ( .A0(n499), .A1(n580), .A2(n990), .B0(n1022), .B1(n582), .Y(
        n579) );
  CLKINVX1 U754 ( .A(n513), .Y(n990) );
  NAND2X1 U755 ( .A(n586), .B(n446), .Y(n596) );
  OA21XL U756 ( .A0(n551), .A1(n606), .B0(n607), .Y(n592) );
  AOI32X1 U757 ( .A0(n608), .A1(n1009), .A2(n515), .B0(n431), .B1(n513), .Y(
        n606) );
  OAI21XL U758 ( .A0(n867), .A1(n609), .B0(n835), .Y(n608) );
  OA21XL U759 ( .A0(n475), .A1(n611), .B0(n989), .Y(n609) );
  NOR2X1 U760 ( .A(n1003), .B(n867), .Y(n565) );
  NAND2X1 U761 ( .A(n281), .B(n994), .Y(n271) );
  CLKINVX1 U762 ( .A(n358), .Y(n994) );
  AND3X2 U763 ( .A(n399), .B(n401), .C(n387), .Y(n356) );
  AO21X1 U764 ( .A0(n392), .A1(n400), .B0(n393), .Y(n401) );
  CLKINVX1 U765 ( .A(n453), .Y(n996) );
  CLKINVX1 U766 ( .A(n461), .Y(n997) );
  CLKINVX1 U767 ( .A(n466), .Y(n998) );
  NAND2X1 U768 ( .A(n992), .B(n616), .Y(n607) );
  OAI21XL U769 ( .A0(n599), .A1(n296), .B0(n1022), .Y(n616) );
  NAND3X1 U770 ( .A(n607), .B(n835), .C(n515), .Y(n591) );
  NAND3X1 U771 ( .A(n866), .B(n837), .C(n586), .Y(n595) );
  NOR3X1 U772 ( .A(n475), .B(n866), .C(n446), .Y(n534) );
  CLKINVX1 U773 ( .A(n867), .Y(n1007) );
  OAI22X1 U774 ( .A0(n442), .A1(n1004), .B0(n444), .B1(n445), .Y(n428) );
  NOR2X1 U775 ( .A(n434), .B(n446), .Y(n444) );
  CLKINVX1 U776 ( .A(n563), .Y(n966) );
  CLKINVX1 U777 ( .A(n525), .Y(n1009) );
  AOI21X1 U778 ( .A0(n835), .A1(n837), .B0(n586), .Y(n584) );
  NOR2X1 U779 ( .A(n1020), .B(n633), .Y(n625) );
  NAND3X1 U780 ( .A(n875), .B(n629), .C(n633), .Y(n641) );
  NAND2X1 U781 ( .A(\array[2][2] ), .B(n290), .Y(n287) );
  OAI21XL U782 ( .A0(n655), .A1(N201), .B0(n1019), .Y(N1079) );
  NOR2X1 U783 ( .A(n1006), .B(n1020), .Y(n655) );
  NAND2X1 U784 ( .A(\array[1][1] ), .B(n410), .Y(n392) );
  CLKINVX1 U785 ( .A(n458), .Y(n958) );
  NOR3X1 U786 ( .A(N205), .B(N204), .C(N206), .Y(n621) );
  OA21XL U787 ( .A0(n1020), .A1(n629), .B0(n1019), .Y(n639) );
  CLKINVX1 U788 ( .A(n266), .Y(n1019) );
  CLKINVX1 U789 ( .A(n434), .Y(n956) );
  CLKINVX1 U790 ( .A(n481), .Y(n960) );
  CLKINVX1 U791 ( .A(n504), .Y(n962) );
  OAI21XL U792 ( .A0(n875), .A1(n648), .B0(n649), .Y(n385) );
  CLKINVX1 U793 ( .A(n649), .Y(n1015) );
  CLKBUFX3 U794 ( .A(n378), .Y(n863) );
  NAND2X1 U795 ( .A(n648), .B(n1015), .Y(n378) );
  CLKBUFX3 U796 ( .A(n372), .Y(n873) );
  NAND2X1 U797 ( .A(n374), .B(n1015), .Y(n372) );
  CLKINVX1 U798 ( .A(n599), .Y(n967) );
  NOR2X1 U799 ( .A(N201), .B(n1012), .Y(n381) );
  CLKBUFX3 U800 ( .A(n379), .Y(n871) );
  NAND2X1 U801 ( .A(n380), .B(n381), .Y(n379) );
  CLKBUFX3 U802 ( .A(n382), .Y(n870) );
  NAND2X1 U803 ( .A(n380), .B(n374), .Y(n382) );
  CLKINVX1 U804 ( .A(n380), .Y(n1014) );
  NAND3X1 U805 ( .A(n875), .B(n1018), .C(n296), .Y(n350) );
  NAND2X1 U806 ( .A(n875), .B(n351), .Y(n353) );
  OAI21X1 U807 ( .A0(n296), .A1(n1020), .B0(n1018), .Y(n299) );
  CLKINVX1 U808 ( .A(n648), .Y(n1013) );
  CLKBUFX3 U809 ( .A(n946), .Y(n877) );
  CLKBUFX3 U810 ( .A(n946), .Y(n876) );
  NOR3BXL U811 ( .AN(n629), .B(n625), .C(n630), .Y(n628) );
  AOI32XL U812 ( .A0(N1087), .A1(n978), .A2(n729), .B0(n635), .B1(n636), .Y(
        n627) );
  OAI221XL U813 ( .A0(n723), .A1(n348), .B0(n921), .B1(n349), .C0(n350), .Y(
        n750) );
  OAI221XL U814 ( .A0(n902), .A1(n348), .B0(n922), .B1(n349), .C0(n350), .Y(
        n749) );
  OAI221XL U815 ( .A0(n903), .A1(n348), .B0(n923), .B1(n349), .C0(n350), .Y(
        n832) );
  CLKINVX1 U816 ( .A(N202), .Y(n904) );
  OAI221XL U817 ( .A0(n977), .A1(n297), .B0(n728), .B1(n955), .C0(n299), .Y(
        n731) );
  OAI221XL U818 ( .A0(n985), .A1(n297), .B0(n729), .B1(n955), .C0(n299), .Y(
        n732) );
  OAI221XL U819 ( .A0(n982), .A1(n297), .B0(n955), .B1(n954), .C0(n299), .Y(
        n833) );
  NOR2XL U820 ( .A(n728), .B(N1086), .Y(n631) );
  NOR4X1 U821 ( .A(n659), .B(n631), .C(n632), .D(n982), .Y(n630) );
  NOR2XL U822 ( .A(n729), .B(N1087), .Y(n632) );
  XNOR2X1 U823 ( .A(N750), .B(n714), .Y(n333) );
  OAI211X1 U824 ( .A0(MinCost[1]), .A1(n945), .B0(n346), .C0(n343), .Y(n340)
         );
  CLKINVX1 U825 ( .A(N748), .Y(n945) );
  OAI21XL U826 ( .A0(n662), .A1(n323), .B0(n332), .Y(n346) );
  AOI22X1 U827 ( .A0(n331), .A1(n338), .B0(N753), .B1(n712), .Y(n337) );
  OAI2BB2XL U828 ( .B0(n339), .B1(n334), .A0N(n664), .A1N(N752), .Y(n338) );
  AOI32X1 U829 ( .A0(n340), .A1(n341), .A2(n944), .B0(N751), .B1(n713), .Y(
        n339) );
  CLKINVX1 U830 ( .A(n328), .Y(n944) );
  NAND4BX1 U831 ( .AN(n309), .B(n667), .C(MatchCount[1]), .D(MatchCount[2]), 
        .Y(n308) );
  AOI32X1 U832 ( .A0(N749), .A1(n859), .A2(n715), .B0(n714), .B1(N750), .Y(
        n343) );
  OAI2BB2XL U833 ( .B0(n337), .B1(n329), .A0N(n665), .A1N(N754), .Y(n336) );
  INVX3 U834 ( .A(Cost[0]), .Y(n953) );
  INVX3 U835 ( .A(Cost[1]), .Y(n952) );
  INVX3 U836 ( .A(Cost[2]), .Y(n951) );
  INVX3 U837 ( .A(Cost[3]), .Y(n950) );
  INVX3 U838 ( .A(Cost[4]), .Y(n949) );
  INVX3 U839 ( .A(Cost[6]), .Y(n947) );
  OAI2BB2XL U840 ( .B0(n953), .B1(n863), .A0N(\array_cost[3][0] ), .A1N(n863), 
        .Y(n779) );
  OAI2BB2XL U841 ( .B0(n952), .B1(n863), .A0N(\array_cost[3][1] ), .A1N(n863), 
        .Y(n778) );
  OAI2BB2XL U842 ( .B0(n951), .B1(n863), .A0N(\array_cost[3][2] ), .A1N(n863), 
        .Y(n777) );
  OAI2BB2XL U843 ( .B0(n950), .B1(n863), .A0N(\array_cost[3][3] ), .A1N(n863), 
        .Y(n776) );
  OAI2BB2XL U844 ( .B0(n949), .B1(n863), .A0N(\array_cost[3][4] ), .A1N(n863), 
        .Y(n775) );
  OAI2BB2XL U845 ( .B0(n947), .B1(n863), .A0N(\array_cost[3][6] ), .A1N(n863), 
        .Y(n773) );
  OAI2BB2XL U846 ( .B0(n953), .B1(n868), .A0N(\array_cost[7][0] ), .A1N(n868), 
        .Y(n807) );
  OAI2BB2XL U847 ( .B0(n952), .B1(n868), .A0N(\array_cost[7][1] ), .A1N(n868), 
        .Y(n806) );
  OAI2BB2XL U848 ( .B0(n951), .B1(n868), .A0N(\array_cost[7][2] ), .A1N(n868), 
        .Y(n805) );
  OAI2BB2XL U849 ( .B0(n950), .B1(n868), .A0N(\array_cost[7][3] ), .A1N(n868), 
        .Y(n804) );
  OAI2BB2XL U850 ( .B0(n949), .B1(n868), .A0N(\array_cost[7][4] ), .A1N(n868), 
        .Y(n803) );
  OAI2BB2XL U851 ( .B0(n947), .B1(n868), .A0N(\array_cost[7][6] ), .A1N(n868), 
        .Y(n801) );
  OAI2BB2XL U852 ( .B0(n953), .B1(n870), .A0N(\array_cost[5][0] ), .A1N(n870), 
        .Y(n793) );
  OAI2BB2XL U853 ( .B0(n952), .B1(n870), .A0N(\array_cost[5][1] ), .A1N(n870), 
        .Y(n792) );
  OAI2BB2XL U854 ( .B0(n951), .B1(n870), .A0N(\array_cost[5][2] ), .A1N(n870), 
        .Y(n791) );
  OAI2BB2XL U855 ( .B0(n950), .B1(n870), .A0N(\array_cost[5][3] ), .A1N(n870), 
        .Y(n790) );
  OAI2BB2XL U856 ( .B0(n949), .B1(n870), .A0N(\array_cost[5][4] ), .A1N(n870), 
        .Y(n789) );
  OAI2BB2XL U857 ( .B0(n947), .B1(n870), .A0N(\array_cost[5][6] ), .A1N(n870), 
        .Y(n787) );
  OAI2BB2XL U858 ( .B0(n953), .B1(n873), .A0N(\array_cost[1][0] ), .A1N(n873), 
        .Y(n765) );
  OAI2BB2XL U859 ( .B0(n952), .B1(n873), .A0N(\array_cost[1][1] ), .A1N(n873), 
        .Y(n764) );
  OAI2BB2XL U860 ( .B0(n951), .B1(n873), .A0N(\array_cost[1][2] ), .A1N(n873), 
        .Y(n763) );
  OAI2BB2XL U861 ( .B0(n950), .B1(n873), .A0N(\array_cost[1][3] ), .A1N(n873), 
        .Y(n762) );
  OAI2BB2XL U862 ( .B0(n949), .B1(n873), .A0N(\array_cost[1][4] ), .A1N(n873), 
        .Y(n761) );
  OAI2BB2XL U863 ( .B0(n947), .B1(n873), .A0N(\array_cost[1][6] ), .A1N(n873), 
        .Y(n759) );
  OAI2BB2XL U864 ( .B0(n953), .B1(n869), .A0N(\array_cost[6][0] ), .A1N(n869), 
        .Y(n800) );
  OAI2BB2XL U865 ( .B0(n952), .B1(n869), .A0N(\array_cost[6][1] ), .A1N(n869), 
        .Y(n799) );
  OAI2BB2XL U866 ( .B0(n951), .B1(n869), .A0N(\array_cost[6][2] ), .A1N(n869), 
        .Y(n798) );
  OAI2BB2XL U867 ( .B0(n950), .B1(n869), .A0N(\array_cost[6][3] ), .A1N(n869), 
        .Y(n797) );
  OAI2BB2XL U868 ( .B0(n949), .B1(n869), .A0N(\array_cost[6][4] ), .A1N(n869), 
        .Y(n796) );
  OAI2BB2XL U869 ( .B0(n947), .B1(n869), .A0N(\array_cost[6][6] ), .A1N(n869), 
        .Y(n794) );
  OAI2BB2XL U870 ( .B0(n953), .B1(n871), .A0N(\array_cost[4][0] ), .A1N(n871), 
        .Y(n786) );
  OAI2BB2XL U871 ( .B0(n952), .B1(n871), .A0N(\array_cost[4][1] ), .A1N(n871), 
        .Y(n785) );
  OAI2BB2XL U872 ( .B0(n951), .B1(n871), .A0N(\array_cost[4][2] ), .A1N(n871), 
        .Y(n784) );
  OAI2BB2XL U873 ( .B0(n950), .B1(n871), .A0N(\array_cost[4][3] ), .A1N(n871), 
        .Y(n783) );
  OAI2BB2XL U874 ( .B0(n949), .B1(n871), .A0N(\array_cost[4][4] ), .A1N(n871), 
        .Y(n782) );
  OAI2BB2XL U875 ( .B0(n947), .B1(n871), .A0N(\array_cost[4][6] ), .A1N(n871), 
        .Y(n780) );
  OAI2BB2XL U876 ( .B0(n953), .B1(n872), .A0N(\array_cost[2][0] ), .A1N(n872), 
        .Y(n772) );
  OAI2BB2XL U877 ( .B0(n952), .B1(n872), .A0N(\array_cost[2][1] ), .A1N(n872), 
        .Y(n771) );
  OAI2BB2XL U878 ( .B0(n951), .B1(n872), .A0N(\array_cost[2][2] ), .A1N(n872), 
        .Y(n770) );
  OAI2BB2XL U879 ( .B0(n950), .B1(n872), .A0N(\array_cost[2][3] ), .A1N(n872), 
        .Y(n769) );
  OAI2BB2XL U880 ( .B0(n949), .B1(n872), .A0N(\array_cost[2][4] ), .A1N(n872), 
        .Y(n768) );
  OAI2BB2XL U881 ( .B0(n947), .B1(n872), .A0N(\array_cost[2][6] ), .A1N(n872), 
        .Y(n766) );
  INVX3 U882 ( .A(Cost[5]), .Y(n948) );
  OAI2BB2XL U883 ( .B0(n948), .B1(n863), .A0N(\array_cost[3][5] ), .A1N(n863), 
        .Y(n774) );
  OAI2BB2XL U884 ( .B0(n948), .B1(n868), .A0N(\array_cost[7][5] ), .A1N(n868), 
        .Y(n802) );
  OAI2BB2XL U885 ( .B0(n948), .B1(n870), .A0N(\array_cost[5][5] ), .A1N(n870), 
        .Y(n788) );
  OAI2BB2XL U886 ( .B0(n948), .B1(n869), .A0N(\array_cost[6][5] ), .A1N(n869), 
        .Y(n795) );
  OAI2BB2XL U887 ( .B0(n948), .B1(n871), .A0N(\array_cost[4][5] ), .A1N(n871), 
        .Y(n781) );
  OAI2BB2XL U888 ( .B0(n948), .B1(n872), .A0N(\array_cost[2][5] ), .A1N(n872), 
        .Y(n767) );
  OAI2BB2XL U889 ( .B0(n865), .B1(n953), .A0N(\array_cost[0][0] ), .A1N(n865), 
        .Y(n758) );
  OAI2BB2XL U890 ( .B0(n865), .B1(n952), .A0N(\array_cost[0][1] ), .A1N(n865), 
        .Y(n757) );
  OAI2BB2XL U891 ( .B0(n865), .B1(n951), .A0N(\array_cost[0][2] ), .A1N(n865), 
        .Y(n756) );
  OAI2BB2XL U892 ( .B0(n865), .B1(n950), .A0N(\array_cost[0][3] ), .A1N(n865), 
        .Y(n755) );
  OAI2BB2XL U893 ( .B0(n865), .B1(n949), .A0N(\array_cost[0][4] ), .A1N(n865), 
        .Y(n754) );
  OAI2BB2XL U894 ( .B0(n865), .B1(n947), .A0N(\array_cost[0][6] ), .A1N(n865), 
        .Y(n753) );
  OAI2BB2XL U895 ( .B0(n873), .B1(n948), .A0N(\array_cost[1][5] ), .A1N(n873), 
        .Y(n760) );
  OAI2BB2XL U896 ( .B0(n865), .B1(n948), .A0N(\array_cost[0][5] ), .A1N(n865), 
        .Y(n808) );
  OAI22XL U897 ( .A0(n710), .A1(n862), .B0(n309), .B1(MatchCount[1]), .Y(n736)
         );
  OAI2BB2XL U898 ( .B0(n942), .B1(n713), .A0N(N889), .A1N(n874), .Y(n743) );
  OAI2BB2XL U899 ( .B0(n857), .B1(n714), .A0N(N888), .A1N(n874), .Y(n744) );
  OAI2BB2XL U900 ( .B0(n857), .B1(n666), .A0N(N893), .A1N(n874), .Y(n739) );
  OAI2BB2XL U901 ( .B0(n857), .B1(n664), .A0N(N890), .A1N(n874), .Y(n742) );
  OAI2BB2XL U902 ( .B0(n857), .B1(n665), .A0N(N892), .A1N(n874), .Y(n740) );
  OAI2BB2XL U903 ( .B0(n857), .B1(n663), .A0N(N886), .A1N(n874), .Y(n746) );
  XOR2X1 U904 ( .A(N755), .B(n666), .Y(n330) );
  XNOR2X1 U905 ( .A(N751), .B(n713), .Y(n328) );
  CLKINVX1 U906 ( .A(n315), .Y(n943) );
  AOI221XL U907 ( .A0(n316), .A1(n711), .B0(MatchCount[0]), .B1(n858), .C0(
        n874), .Y(n315) );
  XNOR2X1 U908 ( .A(N754), .B(n665), .Y(n329) );
  OAI22XL U909 ( .A0(n674), .A1(n1020), .B0(n875), .B1(n977), .Y(n682) );
  XOR2X1 U910 ( .A(N753), .B(n712), .Y(n331) );
  XNOR2X1 U911 ( .A(N752), .B(n664), .Y(n334) );
  XOR2X1 U912 ( .A(N756), .B(n661), .Y(n322) );
  OAI22XL U913 ( .A0(n673), .A1(n1020), .B0(n875), .B1(n985), .Y(n681) );
  OAI22XL U914 ( .A0(n689), .A1(n428), .B0(n957), .B1(n436), .Y(n811) );
  AOI222XL U915 ( .A0(n431), .A1(\array[7][1] ), .B0(n972), .B1(n956), .C0(
        n987), .C1(n434), .Y(n436) );
  OAI22XL U916 ( .A0(n688), .A1(n428), .B0(n957), .B1(n430), .Y(n810) );
  AOI222XL U917 ( .A0(n431), .A1(\array[7][2] ), .B0(n974), .B1(n956), .C0(
        n434), .C1(n980), .Y(n430) );
  XNOR2X1 U918 ( .A(N749), .B(n715), .Y(n326) );
  OAI22XL U919 ( .A0(n701), .A1(n527), .B0(n964), .B1(n538), .Y(n823) );
  AOI221XL U920 ( .A0(n530), .A1(n987), .B0(n531), .B1(\array[7][1] ), .C0(
        n539), .Y(n538) );
  OAI22XL U921 ( .A0(n530), .A1(n464), .B0(n540), .B1(n999), .Y(n539) );
  AOI221XL U922 ( .A0(n534), .A1(n541), .B0(n988), .B1(\array[3][1] ), .C0(
        n542), .Y(n540) );
  OAI222XL U923 ( .A0(n968), .A1(n600), .B0(n601), .B1(n591), .C0(n707), .C1(
        n592), .Y(n829) );
  AOI221XL U924 ( .A0(n867), .A1(\array[4][1] ), .B0(n593), .B1(\array[3][1] ), 
        .C0(n602), .Y(n601) );
  AOI221XL U925 ( .A0(n551), .A1(n461), .B0(n597), .B1(n1031), .C0(n603), .Y(
        n600) );
  OAI22XL U926 ( .A0(n689), .A1(n595), .B0(n692), .B1(n596), .Y(n602) );
  OAI22XL U927 ( .A0(n694), .A1(n478), .B0(n961), .B1(n480), .Y(n816) );
  AOI221XL U928 ( .A0(n481), .A1(n980), .B0(n974), .B1(n960), .C0(n483), .Y(
        n480) );
  OAI222XL U929 ( .A0(n1002), .A1(n996), .B0(n700), .B1(n485), .C0(n706), .C1(
        n486), .Y(n483) );
  OAI222XL U930 ( .A0(n968), .A1(n589), .B0(n590), .B1(n591), .C0(n706), .C1(
        n592), .Y(n828) );
  AOI221XL U931 ( .A0(n867), .A1(\array[4][2] ), .B0(n593), .B1(n1030), .C0(
        n594), .Y(n590) );
  AOI221XL U932 ( .A0(n551), .A1(n453), .B0(n597), .B1(\array[5][2] ), .C0(
        n598), .Y(n589) );
  OAI22XL U933 ( .A0(n688), .A1(n595), .B0(n691), .B1(n596), .Y(n594) );
  OAI22XL U934 ( .A0(n698), .A1(n501), .B0(n509), .B1(n963), .Y(n820) );
  AOI221XL U935 ( .A0(n504), .A1(n987), .B0(n972), .B1(n962), .C0(n510), .Y(
        n509) );
  OAI222XL U936 ( .A0(n997), .A1(n1008), .B0(n701), .B1(n507), .C0(n707), .C1(
        n508), .Y(n510) );
  OAI22XL U937 ( .A0(n695), .A1(n478), .B0(n961), .B1(n487), .Y(n817) );
  AOI221XL U938 ( .A0(n481), .A1(n987), .B0(n972), .B1(n960), .C0(n488), .Y(
        n487) );
  OAI222XL U939 ( .A0(n1002), .A1(n997), .B0(n701), .B1(n485), .C0(n707), .C1(
        n486), .Y(n488) );
  OAI22XL U940 ( .A0(n700), .A1(n527), .B0(n964), .B1(n529), .Y(n822) );
  AOI221XL U941 ( .A0(n530), .A1(n980), .B0(n531), .B1(\array[7][2] ), .C0(
        n532), .Y(n529) );
  OAI22XL U942 ( .A0(n530), .A1(n459), .B0(n533), .B1(n999), .Y(n532) );
  AOI221XL U943 ( .A0(n534), .A1(n535), .B0(n988), .B1(n1030), .C0(n537), .Y(
        n533) );
  OAI22XL U944 ( .A0(n691), .A1(n449), .B0(n959), .B1(n451), .Y(n813) );
  AOI221XL U945 ( .A0(n452), .A1(\array[7][2] ), .B0(n453), .B1(n866), .C0(
        n455), .Y(n451) );
  OAI22XL U946 ( .A0(n456), .A1(n958), .B0(n458), .B1(n459), .Y(n455) );
  OAI22XL U947 ( .A0(n697), .A1(n501), .B0(n502), .B1(n963), .Y(n819) );
  AOI221XL U948 ( .A0(n504), .A1(n980), .B0(n974), .B1(n962), .C0(n506), .Y(
        n502) );
  OAI222XL U949 ( .A0(n996), .A1(n1008), .B0(n700), .B1(n507), .C0(n706), .C1(
        n508), .Y(n506) );
  OAI22XL U950 ( .A0(n704), .A1(n557), .B0(n965), .B1(n567), .Y(n826) );
  AOI221XL U951 ( .A0(n494), .A1(n568), .B0(n531), .B1(\array[7][1] ), .C0(
        n569), .Y(n567) );
  OAI22XL U952 ( .A0(n692), .A1(n548), .B0(n866), .B1(n570), .Y(n568) );
  OAI22XL U953 ( .A0(n463), .A1(n966), .B0(n563), .B1(n464), .Y(n569) );
  OAI22XL U954 ( .A0(n692), .A1(n449), .B0(n959), .B1(n460), .Y(n814) );
  AOI221XL U955 ( .A0(n452), .A1(\array[7][1] ), .B0(n461), .B1(n866), .C0(
        n462), .Y(n460) );
  OAI22XL U956 ( .A0(n463), .A1(n958), .B0(n458), .B1(n464), .Y(n462) );
  OAI22XL U957 ( .A0(n703), .A1(n557), .B0(n965), .B1(n559), .Y(n825) );
  AOI221XL U958 ( .A0(n494), .A1(n560), .B0(n531), .B1(\array[7][2] ), .C0(
        n561), .Y(n559) );
  OAI22XL U959 ( .A0(n691), .A1(n548), .B0(n866), .B1(n564), .Y(n560) );
  OAI22XL U960 ( .A0(n456), .A1(n966), .B0(n563), .B1(n459), .Y(n561) );
  XOR2X1 U961 ( .A(n662), .B(N747), .Y(n323) );
  OAI222XL U962 ( .A0(n979), .A1(n301), .B0(n302), .B1(n973), .C0(n677), .C1(
        n304), .Y(n733) );
  INVXL U963 ( .A(N220), .Y(n973) );
  OAI222XL U964 ( .A0(n986), .A1(n301), .B0(n302), .B1(n971), .C0(n660), .C1(
        n304), .Y(n831) );
  INVXL U965 ( .A(N221), .Y(n971) );
  OAI222XL U966 ( .A0(n968), .A1(n604), .B0(n605), .B1(n591), .C0(n708), .C1(
        n592), .Y(n830) );
  AOI221XL U967 ( .A0(n867), .A1(\array[4][0] ), .B0(n593), .B1(\array[3][0] ), 
        .C0(n612), .Y(n605) );
  AOI221XL U968 ( .A0(n551), .A1(n466), .B0(n597), .B1(\array[5][0] ), .C0(
        n614), .Y(n604) );
  OAI22XL U969 ( .A0(n690), .A1(n595), .B0(n693), .B1(n596), .Y(n612) );
  OAI22XL U970 ( .A0(n705), .A1(n557), .B0(n965), .B1(n572), .Y(n827) );
  AOI221XL U971 ( .A0(n494), .A1(n573), .B0(n531), .B1(\array[7][0] ), .C0(
        n574), .Y(n572) );
  OAI22XL U972 ( .A0(n693), .A1(n548), .B0(n866), .B1(n575), .Y(n573) );
  OAI22XL U973 ( .A0(n468), .A1(n966), .B0(n563), .B1(n469), .Y(n574) );
  OAI22XL U974 ( .A0(n693), .A1(n449), .B0(n959), .B1(n465), .Y(n815) );
  AOI221XL U975 ( .A0(n452), .A1(\array[7][0] ), .B0(n466), .B1(n866), .C0(
        n467), .Y(n465) );
  OAI22XL U976 ( .A0(n468), .A1(n958), .B0(n458), .B1(n469), .Y(n467) );
  OAI22XL U977 ( .A0(n699), .A1(n501), .B0(n511), .B1(n963), .Y(n821) );
  AOI221XL U978 ( .A0(n504), .A1(n984), .B0(n970), .B1(n962), .C0(n512), .Y(
        n511) );
  OAI222XL U979 ( .A0(n998), .A1(n1008), .B0(n702), .B1(n507), .C0(n708), .C1(
        n508), .Y(n512) );
  OAI22XL U980 ( .A0(n690), .A1(n428), .B0(n957), .B1(n439), .Y(n812) );
  AOI222XL U981 ( .A0(n431), .A1(\array[7][0] ), .B0(n970), .B1(n956), .C0(
        n984), .C1(n434), .Y(n439) );
  OAI22XL U982 ( .A0(n696), .A1(n478), .B0(n961), .B1(n490), .Y(n818) );
  AOI221XL U983 ( .A0(n481), .A1(n984), .B0(n970), .B1(n960), .C0(n491), .Y(
        n490) );
  OAI222XL U984 ( .A0(n1002), .A1(n998), .B0(n702), .B1(n485), .C0(n708), .C1(
        n486), .Y(n491) );
  OAI22XL U985 ( .A0(n702), .A1(n527), .B0(n964), .B1(n543), .Y(n824) );
  AOI221XL U986 ( .A0(n530), .A1(n984), .B0(n531), .B1(\array[7][0] ), .C0(
        n544), .Y(n543) );
  OAI22XL U987 ( .A0(n530), .A1(n469), .B0(n545), .B1(n999), .Y(n544) );
  AOI221XL U988 ( .A0(n534), .A1(n546), .B0(n988), .B1(\array[3][0] ), .C0(
        n547), .Y(n545) );
  OAI222XL U989 ( .A0(n301), .A1(n983), .B0(n302), .B1(n969), .C0(n668), .C1(
        n304), .Y(n734) );
  INVXL U990 ( .A(N222), .Y(n969) );
  OAI22XL U991 ( .A0(n672), .A1(n1020), .B0(n875), .B1(n982), .Y(n680) );
  ADDFXL U992 ( .A(\array_cost[5][2] ), .B(\array_cost[6][2] ), .CI(
        \add_4_root_add_0_root_add_99_7/carry [2]), .CO(
        \add_4_root_add_0_root_add_99_7/carry [3]), .S(N877) );
  ADDFXL U993 ( .A(\array_cost[5][6] ), .B(\array_cost[6][6] ), .CI(
        \add_4_root_add_0_root_add_99_7/carry [6]), .CO(N882), .S(N881) );
  ADDFXL U994 ( .A(\array_cost[5][1] ), .B(\array_cost[6][1] ), .CI(
        \add_4_root_add_0_root_add_99_7/carry [1]), .CO(
        \add_4_root_add_0_root_add_99_7/carry [2]), .S(N876) );
  ADDFXL U995 ( .A(\array_cost[5][3] ), .B(\array_cost[6][3] ), .CI(
        \add_4_root_add_0_root_add_99_7/carry [3]), .CO(
        \add_4_root_add_0_root_add_99_7/carry [4]), .S(N878) );
  ADDFXL U996 ( .A(\array_cost[5][4] ), .B(\array_cost[6][4] ), .CI(
        \add_4_root_add_0_root_add_99_7/carry [4]), .CO(
        \add_4_root_add_0_root_add_99_7/carry [5]), .S(N879) );
  ADDFXL U997 ( .A(\array_cost[5][5] ), .B(\array_cost[6][5] ), .CI(
        \add_4_root_add_0_root_add_99_7/carry [5]), .CO(
        \add_4_root_add_0_root_add_99_7/carry [6]), .S(N880) );
  OAI31XL U998 ( .A0(n991), .A1(n719), .A2(n514), .B0(n556), .Y(n552) );
  OAI21XL U999 ( .A0(n867), .A1(n525), .B0(n494), .Y(n556) );
  ADDFXL U1000 ( .A(\array_cost[1][2] ), .B(\array_cost[4][2] ), .CI(
        \add_5_root_add_0_root_add_99_7/carry [2]), .CO(
        \add_5_root_add_0_root_add_99_7/carry [3]), .S(N847) );
  ADDFXL U1001 ( .A(\array_cost[1][6] ), .B(\array_cost[4][6] ), .CI(
        \add_5_root_add_0_root_add_99_7/carry [6]), .CO(N852), .S(N851) );
  ADDFXL U1002 ( .A(\array_cost[7][2] ), .B(\array_cost[3][2] ), .CI(
        \add_3_root_add_0_root_add_99_7/carry [2]), .CO(
        \add_3_root_add_0_root_add_99_7/carry [3]), .S(N838) );
  ADDFXL U1003 ( .A(\array_cost[7][6] ), .B(\array_cost[3][6] ), .CI(
        \add_3_root_add_0_root_add_99_7/carry [6]), .CO(N843), .S(N842) );
  ADDFXL U1004 ( .A(\array_cost[1][1] ), .B(\array_cost[4][1] ), .CI(
        \add_5_root_add_0_root_add_99_7/carry [1]), .CO(
        \add_5_root_add_0_root_add_99_7/carry [2]), .S(N846) );
  ADDFXL U1005 ( .A(\array_cost[7][1] ), .B(\array_cost[3][1] ), .CI(
        \add_3_root_add_0_root_add_99_7/carry [1]), .CO(
        \add_3_root_add_0_root_add_99_7/carry [2]), .S(N837) );
  ADDFXL U1006 ( .A(\array_cost[1][3] ), .B(\array_cost[4][3] ), .CI(
        \add_5_root_add_0_root_add_99_7/carry [3]), .CO(
        \add_5_root_add_0_root_add_99_7/carry [4]), .S(N848) );
  ADDFXL U1007 ( .A(\array_cost[7][3] ), .B(\array_cost[3][3] ), .CI(
        \add_3_root_add_0_root_add_99_7/carry [3]), .CO(
        \add_3_root_add_0_root_add_99_7/carry [4]), .S(N839) );
  ADDFXL U1008 ( .A(\array_cost[1][4] ), .B(\array_cost[4][4] ), .CI(
        \add_5_root_add_0_root_add_99_7/carry [4]), .CO(
        \add_5_root_add_0_root_add_99_7/carry [5]), .S(N849) );
  ADDFXL U1009 ( .A(\array_cost[7][4] ), .B(\array_cost[3][4] ), .CI(
        \add_3_root_add_0_root_add_99_7/carry [4]), .CO(
        \add_3_root_add_0_root_add_99_7/carry [5]), .S(N840) );
  ADDFXL U1010 ( .A(\array_cost[1][5] ), .B(\array_cost[4][5] ), .CI(
        \add_5_root_add_0_root_add_99_7/carry [5]), .CO(
        \add_5_root_add_0_root_add_99_7/carry [6]), .S(N850) );
  ADDFXL U1011 ( .A(\array_cost[7][5] ), .B(\array_cost[3][5] ), .CI(
        \add_3_root_add_0_root_add_99_7/carry [5]), .CO(
        \add_3_root_add_0_root_add_99_7/carry [6]), .S(N841) );
  ADDFXL U1012 ( .A(\array_cost[0][2] ), .B(\array_cost[2][2] ), .CI(
        \add_6_root_add_0_root_add_99_7/carry [2]), .CO(
        \add_6_root_add_0_root_add_99_7/carry [3]), .S(N857) );
  ADDFXL U1013 ( .A(\array_cost[0][6] ), .B(\array_cost[2][6] ), .CI(
        \add_6_root_add_0_root_add_99_7/carry [6]), .CO(N862), .S(N861) );
  ADDFXL U1014 ( .A(\array_cost[0][1] ), .B(\array_cost[2][1] ), .CI(
        \add_6_root_add_0_root_add_99_7/carry [1]), .CO(
        \add_6_root_add_0_root_add_99_7/carry [2]), .S(N856) );
  ADDFXL U1015 ( .A(\array_cost[0][3] ), .B(\array_cost[2][3] ), .CI(
        \add_6_root_add_0_root_add_99_7/carry [3]), .CO(
        \add_6_root_add_0_root_add_99_7/carry [4]), .S(N858) );
  ADDFXL U1016 ( .A(\array_cost[0][4] ), .B(\array_cost[2][4] ), .CI(
        \add_6_root_add_0_root_add_99_7/carry [4]), .CO(
        \add_6_root_add_0_root_add_99_7/carry [5]), .S(N859) );
  ADDFXL U1017 ( .A(\array_cost[0][5] ), .B(\array_cost[2][5] ), .CI(
        \add_6_root_add_0_root_add_99_7/carry [5]), .CO(
        \add_6_root_add_0_root_add_99_7/carry [6]), .S(N860) );
  OAI2BB1X1 U1018 ( .A0N(\array[4][1] ), .A1N(n406), .B0(\array[3][1] ), .Y(
        n408) );
  NOR2X1 U1019 ( .A(\array[3][0] ), .B(n699), .Y(n406) );
  NOR3X1 U1020 ( .A(n269), .B(n271), .C(n402), .Y(n387) );
  OAI211X1 U1021 ( .A0(\array[2][2] ), .A1(n694), .B0(n357), .C0(n290), .Y(
        n402) );
  AOI2BB1X1 U1022 ( .A0N(n697), .A1N(n1030), .B0(n995), .Y(n357) );
  OAI21XL U1023 ( .A0(n941), .A1(n351), .B0(n386), .Y(n809) );
  OAI21XL U1024 ( .A0(n271), .A1(n360), .B0(n1021), .Y(n386) );
  CLKINVX1 U1025 ( .A(n388), .Y(n976) );
  OAI211X1 U1026 ( .A0(n677), .A1(\array[1][2] ), .B0(n387), .C0(n390), .Y(
        n388) );
  AOI211X1 U1027 ( .A0(n391), .A1(n392), .B0(n393), .C0(n394), .Y(n390) );
  AND2X2 U1028 ( .A(n399), .B(n400), .Y(n391) );
  OAI21XL U1029 ( .A0(n717), .A1(n351), .B0(n359), .Y(n752) );
  OAI21XL U1030 ( .A0(n277), .A1(n360), .B0(n1021), .Y(n359) );
  OAI221XL U1031 ( .A0(n584), .A1(n585), .B0(n719), .B1(n523), .C0(n1007), .Y(
        n580) );
  AOI21X1 U1032 ( .A0(n586), .A1(n587), .B0(n446), .Y(n585) );
  OAI211X1 U1033 ( .A0(n903), .A1(N209), .B0(n656), .C0(n721), .Y(n629) );
  OAI2BB2XL U1034 ( .B0(n657), .B1(n658), .A0N(N209), .A1N(n903), .Y(n656) );
  NOR2X1 U1035 ( .A(n723), .B(n1028), .Y(n658) );
  OAI22XL U1036 ( .A0(n940), .A1(n351), .B0(n352), .B1(n353), .Y(n751) );
  NOR3BXL U1037 ( .AN(n354), .B(n355), .C(n356), .Y(n352) );
  OAI32X1 U1038 ( .A0(n269), .A1(n357), .A2(n358), .B0(n281), .B1(n269), .Y(
        n355) );
  AOI221XL U1039 ( .A0(n867), .A1(\array[5][2] ), .B0(n565), .B1(\array[7][2] ), .C0(n566), .Y(n564) );
  OAI22XL U1040 ( .A0(n697), .A1(n1008), .B0(n694), .B1(n1002), .Y(n566) );
  AOI221XL U1041 ( .A0(n867), .A1(n1031), .B0(n565), .B1(\array[7][1] ), .C0(
        n571), .Y(n570) );
  OAI22XL U1042 ( .A0(n698), .A1(n1008), .B0(n695), .B1(n1002), .Y(n571) );
  OAI221XL U1043 ( .A0(n419), .A1(n1031), .B0(n697), .B1(\array[5][2] ), .C0(
        n422), .Y(n418) );
  OAI2BB1X1 U1044 ( .A0N(n1031), .A1N(n419), .B0(\array[4][1] ), .Y(n422) );
  NOR2X1 U1045 ( .A(\array[4][0] ), .B(n702), .Y(n419) );
  OAI2BB2XL U1046 ( .B0(n670), .B1(n266), .A0N(n266), .A1N(n267), .Y(n678) );
  OAI21XL U1047 ( .A0(n993), .A1(n269), .B0(n270), .Y(n267) );
  CLKINVX1 U1048 ( .A(n271), .Y(n993) );
  AOI221XL U1049 ( .A0(n867), .A1(\array[5][0] ), .B0(n565), .B1(\array[7][0] ), .C0(n576), .Y(n575) );
  OAI22XL U1050 ( .A0(n699), .A1(n1008), .B0(n696), .B1(n1002), .Y(n576) );
  NOR2X1 U1051 ( .A(n999), .B(n703), .Y(n453) );
  OAI21XL U1052 ( .A0(n719), .A1(n266), .B0(n276), .Y(n685) );
  OAI21XL U1053 ( .A0(n277), .A1(n975), .B0(n266), .Y(n276) );
  CLKINVX1 U1054 ( .A(n270), .Y(n975) );
  AO21X1 U1055 ( .A0(\array[3][1] ), .A1(n403), .B0(n692), .Y(n405) );
  NOR2BX1 U1056 ( .AN(n693), .B(n696), .Y(n403) );
  NOR2X1 U1057 ( .A(n999), .B(n704), .Y(n461) );
  NOR2X1 U1058 ( .A(n999), .B(n705), .Y(n466) );
  OAI22XL U1059 ( .A0(n720), .A1(n266), .B0(n279), .B1(n1019), .Y(n686) );
  AOI211X1 U1060 ( .A0(n281), .A1(n282), .B0(n269), .C0(n976), .Y(n279) );
  OAI21XL U1061 ( .A0(n995), .A1(n285), .B0(n994), .Y(n282) );
  AOI2BB2X1 U1062 ( .B0(n287), .B1(n1030), .A0N(\array[4][2] ), .A1N(n290), 
        .Y(n285) );
  OAI2BB1X2 U1063 ( .A0N(\array[7][2] ), .A1N(n412), .B0(n413), .Y(n269) );
  OAI21XL U1064 ( .A0(n412), .A1(\array[7][2] ), .B0(n703), .Y(n413) );
  OAI21XL U1065 ( .A0(n707), .A1(\array[6][1] ), .B0(n415), .Y(n412) );
  CLKINVX1 U1066 ( .A(n701), .Y(n1031) );
  OAI221XL U1067 ( .A0(n701), .A1(\array[6][1] ), .B0(n700), .B1(\array[6][2] ), .C0(n426), .Y(n424) );
  OAI22XL U1068 ( .A0(n705), .A1(\array[5][0] ), .B0(n704), .B1(n1031), .Y(
        n426) );
  NAND2X1 U1069 ( .A(n941), .B(n1028), .Y(n523) );
  OAI22XL U1070 ( .A0(n701), .A1(n1008), .B0(n698), .B1(n1002), .Y(n542) );
  OAI22XL U1071 ( .A0(n700), .A1(n1008), .B0(n697), .B1(n1002), .Y(n537) );
  OAI22XL U1072 ( .A0(n702), .A1(n1008), .B0(n699), .B1(n1002), .Y(n547) );
  CLKBUFX3 U1073 ( .A(n500), .Y(n867) );
  NOR2X1 U1074 ( .A(n523), .B(n940), .Y(n500) );
  CLKBUFX3 U1075 ( .A(n526), .Y(n864) );
  NOR2X1 U1076 ( .A(n834), .B(process[0]), .Y(n526) );
  OAI31XL U1077 ( .A0(N207), .A1(n941), .A2(n717), .B0(n966), .Y(n582) );
  OAI22XL U1078 ( .A0(n703), .A1(n1007), .B0(n706), .B1(n867), .Y(n535) );
  OAI22XL U1079 ( .A0(n705), .A1(n1007), .B0(n708), .B1(n867), .Y(n546) );
  OAI22XL U1080 ( .A0(n704), .A1(n1007), .B0(n707), .B1(n867), .Y(n541) );
  AOI221XL U1081 ( .A0(n660), .A1(\array[1][1] ), .B0(n677), .B1(\array[1][2] ), .C0(n981), .Y(n394) );
  CLKINVX1 U1082 ( .A(n397), .Y(n981) );
  OAI211X1 U1083 ( .A0(\array[1][1] ), .A1(n660), .B0(n668), .C0(\array[1][0] ), .Y(n397) );
  NOR3X2 U1084 ( .A(N204), .B(n921), .C(N206), .Y(n458) );
  NOR2X1 U1085 ( .A(n836), .B(process[1]), .Y(n633) );
  OAI32X1 U1086 ( .A0(n1014), .A1(n1016), .A2(n1013), .B0(n721), .B1(n644), 
        .Y(N1082) );
  AOI22X1 U1087 ( .A0(n1006), .A1(n646), .B0(n647), .B1(n385), .Y(n644) );
  NAND2X1 U1088 ( .A(n381), .B(n903), .Y(n646) );
  NAND3X1 U1089 ( .A(n363), .B(n290), .C(n364), .Y(n362) );
  OAI22XL U1090 ( .A0(n691), .A1(n694), .B0(\array[4][2] ), .B1(n1030), .Y(
        n364) );
  OR2X1 U1091 ( .A(n693), .B(\array[1][0] ), .Y(n410) );
  NAND3X1 U1092 ( .A(n863), .B(n1019), .C(n650), .Y(N1081) );
  AOI22X1 U1093 ( .A0(n651), .A1(n1006), .B0(n1013), .B1(n380), .Y(n650) );
  XNOR2X1 U1094 ( .A(n381), .B(n903), .Y(n651) );
  NOR3X2 U1095 ( .A(N205), .B(n922), .C(N206), .Y(n434) );
  NOR3X2 U1096 ( .A(N204), .B(n923), .C(N205), .Y(n504) );
  NOR3X2 U1097 ( .A(n940), .B(n941), .C(n1028), .Y(n551) );
  OAI211X1 U1098 ( .A0(n641), .A1(n653), .B0(n654), .C0(n1019), .Y(N1080) );
  NAND3X1 U1099 ( .A(n647), .B(n1020), .C(n653), .Y(n654) );
  AO21X1 U1100 ( .A0(n1012), .A1(n902), .B0(n374), .Y(n653) );
  NAND2X1 U1101 ( .A(n691), .B(\array[1][2] ), .Y(n399) );
  OAI32X1 U1102 ( .A0(n1011), .A1(n1017), .A2(n967), .B0(n669), .B1(n295), .Y(
        n730) );
  CLKINVX1 U1103 ( .A(n296), .Y(n1011) );
  OAI211X1 U1104 ( .A0(process[0]), .A1(n639), .B0(n641), .C0(n445), .Y(N1083)
         );
  NOR2X1 U1105 ( .A(\array[1][2] ), .B(n691), .Y(n393) );
  AOI2BB2X1 U1106 ( .B0(n639), .B1(n640), .A0N(n864), .A1N(n633), .Y(N1084) );
  NAND2X1 U1107 ( .A(process[1]), .B(n875), .Y(n640) );
  NAND2X1 U1108 ( .A(n903), .B(n1020), .Y(n649) );
  CLKBUFX3 U1109 ( .A(n376), .Y(n872) );
  NAND3X1 U1110 ( .A(n902), .B(n1012), .C(n1015), .Y(n376) );
  OAI21XL U1111 ( .A0(n721), .A1(n865), .B0(n445), .Y(N1085) );
  CLKBUFX3 U1112 ( .A(n383), .Y(n869) );
  NAND3X1 U1113 ( .A(n902), .B(n1012), .C(n380), .Y(n383) );
  NAND3X1 U1114 ( .A(n903), .B(n1016), .C(n374), .Y(n647) );
  OAI21XL U1115 ( .A0(n671), .A1(n1020), .B0(n1014), .Y(n679) );
  XNOR2X1 U1116 ( .A(n1020), .B(ok), .Y(next_state) );
  OAI22XL U1117 ( .A0(n675), .A1(n1020), .B0(n875), .B1(n902), .Y(n683) );
  OAI22XL U1118 ( .A0(n676), .A1(n1020), .B0(n875), .B1(n723), .Y(n684) );
  XOR2X1 U1119 ( .A(\array_cost[2][0] ), .B(\array_cost[0][0] ), .Y(N855) );
  XOR2X1 U1120 ( .A(\array_cost[6][0] ), .B(\array_cost[5][0] ), .Y(N875) );
  AND2X1 U1121 ( .A(\array_cost[2][0] ), .B(\array_cost[6][0] ), .Y(
        \add_5_root_r829/carry [1]) );
  XOR2X1 U1122 ( .A(\array_cost[6][0] ), .B(\array_cost[2][0] ), .Y(N707) );
  NOR2X1 U1123 ( .A(n904), .B(N201), .Y(n899) );
  NOR2X1 U1124 ( .A(n902), .B(N202), .Y(n896) );
  NOR2X1 U1125 ( .A(N201), .B(N202), .Y(n895) );
  AO22X1 U1126 ( .A0(\array[5][0] ), .A1(n896), .B0(\array[4][0] ), .B1(n895), 
        .Y(n886) );
  AOI221XL U1127 ( .A0(\array[6][0] ), .A1(n899), .B0(\array[7][0] ), .B1(n898), .C0(n886), .Y(n889) );
  AO22X1 U1128 ( .A0(\array[1][0] ), .A1(n896), .B0(\array[0][0] ), .B1(n895), 
        .Y(n887) );
  AOI221XL U1129 ( .A0(\array[2][0] ), .A1(n899), .B0(\array[3][0] ), .B1(n898), .C0(n887), .Y(n888) );
  OAI22XL U1130 ( .A0(n903), .A1(n889), .B0(N203), .B1(n888), .Y(N1088) );
  AO22X1 U1131 ( .A0(\array[5][1] ), .A1(n896), .B0(\array[4][1] ), .B1(n895), 
        .Y(n890) );
  AOI221XL U1132 ( .A0(\array[6][1] ), .A1(n899), .B0(\array[7][1] ), .B1(n898), .C0(n890), .Y(n893) );
  AO22X1 U1133 ( .A0(\array[1][1] ), .A1(n896), .B0(\array[0][1] ), .B1(n895), 
        .Y(n891) );
  AOI221XL U1134 ( .A0(\array[2][1] ), .A1(n899), .B0(\array[3][1] ), .B1(n898), .C0(n891), .Y(n892) );
  AO22X1 U1135 ( .A0(\array[5][2] ), .A1(n896), .B0(\array[4][2] ), .B1(n895), 
        .Y(n894) );
  AOI221XL U1136 ( .A0(\array[6][2] ), .A1(n899), .B0(\array[7][2] ), .B1(n898), .C0(n894), .Y(n901) );
  AO22X1 U1137 ( .A0(\array[1][2] ), .A1(n896), .B0(\array[0][2] ), .B1(n895), 
        .Y(n897) );
  AOI221XL U1138 ( .A0(\array[2][2] ), .A1(n899), .B0(\array[3][2] ), .B1(n898), .C0(n897), .Y(n900) );
  NOR2X1 U1139 ( .A(n921), .B(N204), .Y(n918) );
  NOR2X1 U1140 ( .A(n922), .B(N205), .Y(n915) );
  NOR2X1 U1141 ( .A(N204), .B(N205), .Y(n914) );
  AO22X1 U1142 ( .A0(\array[5][0] ), .A1(n915), .B0(\array[4][0] ), .B1(n914), 
        .Y(n905) );
  AOI221XL U1143 ( .A0(\array[6][0] ), .A1(n918), .B0(\array[7][0] ), .B1(n917), .C0(n905), .Y(n908) );
  AO22X1 U1144 ( .A0(\array[1][0] ), .A1(n915), .B0(\array[0][0] ), .B1(n914), 
        .Y(n906) );
  AOI221XL U1145 ( .A0(\array[2][0] ), .A1(n918), .B0(\array[3][0] ), .B1(n917), .C0(n906), .Y(n907) );
  OAI22XL U1146 ( .A0(n923), .A1(n908), .B0(N206), .B1(n907), .Y(N222) );
  AO22X1 U1147 ( .A0(\array[5][1] ), .A1(n915), .B0(\array[4][1] ), .B1(n914), 
        .Y(n909) );
  AOI221XL U1148 ( .A0(\array[6][1] ), .A1(n918), .B0(\array[7][1] ), .B1(n917), .C0(n909), .Y(n912) );
  AO22X1 U1149 ( .A0(\array[1][1] ), .A1(n915), .B0(\array[0][1] ), .B1(n914), 
        .Y(n910) );
  AOI221XL U1150 ( .A0(\array[2][1] ), .A1(n918), .B0(\array[3][1] ), .B1(n917), .C0(n910), .Y(n911) );
  OAI22XL U1151 ( .A0(n923), .A1(n912), .B0(N206), .B1(n911), .Y(N221) );
  AO22X1 U1152 ( .A0(\array[5][2] ), .A1(n915), .B0(\array[4][2] ), .B1(n914), 
        .Y(n913) );
  AOI221XL U1153 ( .A0(\array[6][2] ), .A1(n918), .B0(\array[7][2] ), .B1(n917), .C0(n913), .Y(n920) );
  AO22X1 U1154 ( .A0(\array[1][2] ), .A1(n915), .B0(\array[0][2] ), .B1(n914), 
        .Y(n916) );
  AOI221XL U1155 ( .A0(\array[2][2] ), .A1(n918), .B0(\array[3][2] ), .B1(n917), .C0(n916), .Y(n919) );
  OAI22XL U1156 ( .A0(n920), .A1(n923), .B0(N206), .B1(n919), .Y(N220) );
  NOR2X1 U1157 ( .A(n717), .B(N207), .Y(n937) );
  NOR2X1 U1158 ( .A(n940), .B(N208), .Y(n934) );
  NOR2X1 U1159 ( .A(N207), .B(N208), .Y(n933) );
  AO22X1 U1160 ( .A0(\array[5][0] ), .A1(n934), .B0(\array[4][0] ), .B1(n933), 
        .Y(n924) );
  AOI221XL U1161 ( .A0(\array[6][0] ), .A1(n937), .B0(\array[7][0] ), .B1(n936), .C0(n924), .Y(n927) );
  AO22X1 U1162 ( .A0(\array[1][0] ), .A1(n934), .B0(\array[0][0] ), .B1(n933), 
        .Y(n925) );
  AOI221XL U1163 ( .A0(\array[2][0] ), .A1(n937), .B0(\array[3][0] ), .B1(n936), .C0(n925), .Y(n926) );
  OAI22XL U1164 ( .A0(n941), .A1(n927), .B0(N209), .B1(n926), .Y(N1097) );
  AO22X1 U1165 ( .A0(\array[5][1] ), .A1(n934), .B0(\array[4][1] ), .B1(n933), 
        .Y(n928) );
  AOI221XL U1166 ( .A0(\array[6][1] ), .A1(n937), .B0(\array[7][1] ), .B1(n936), .C0(n928), .Y(n931) );
  AO22X1 U1167 ( .A0(\array[1][1] ), .A1(n934), .B0(\array[0][1] ), .B1(n933), 
        .Y(n929) );
  AOI221XL U1168 ( .A0(\array[2][1] ), .A1(n937), .B0(\array[3][1] ), .B1(n936), .C0(n929), .Y(n930) );
  AO22X1 U1169 ( .A0(\array[5][2] ), .A1(n934), .B0(\array[4][2] ), .B1(n933), 
        .Y(n932) );
  AOI221XL U1170 ( .A0(\array[6][2] ), .A1(n937), .B0(\array[7][2] ), .B1(n936), .C0(n932), .Y(n939) );
  AO22X1 U1171 ( .A0(\array[1][2] ), .A1(n934), .B0(\array[0][2] ), .B1(n933), 
        .Y(n935) );
  AOI221XL U1172 ( .A0(\array[2][2] ), .A1(n937), .B0(\array[3][2] ), .B1(n936), .C0(n935), .Y(n938) );
endmodule

