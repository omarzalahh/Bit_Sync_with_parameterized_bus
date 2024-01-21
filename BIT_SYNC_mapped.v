/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Sep 14 02:33:48 2022
/////////////////////////////////////////////////////////////


module CDC1 ( RST, CLK, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input RST, CLK;
  wire   \flip_flops[3][1] , \flip_flops[3][0] , \flip_flops[2][1] ,
         \flip_flops[2][0] , \flip_flops[1][1] , \flip_flops[1][0] ,
         \flip_flops[0][1] , \flip_flops[0][0] ;

  EDFFHQX1M \flip_flops_reg[3][0]  ( .D(ASYNC[3]), .E(RST), .CK(CLK), .Q(
        \flip_flops[3][0] ) );
  EDFFHQX1M \flip_flops_reg[3][1]  ( .D(\flip_flops[3][0] ), .E(RST), .CK(CLK), 
        .Q(\flip_flops[3][1] ) );
  EDFFHQX1M \flip_flops_reg[2][0]  ( .D(ASYNC[2]), .E(RST), .CK(CLK), .Q(
        \flip_flops[2][0] ) );
  EDFFHQX1M \flip_flops_reg[2][1]  ( .D(\flip_flops[2][0] ), .E(RST), .CK(CLK), 
        .Q(\flip_flops[2][1] ) );
  DFFRQX2M \flip_flops_reg[1][1]  ( .D(\flip_flops[1][0] ), .CK(CLK), .RN(RST), 
        .Q(\flip_flops[1][1] ) );
  DFFRQX2M \flip_flops_reg[0][1]  ( .D(\flip_flops[0][0] ), .CK(CLK), .RN(RST), 
        .Q(\flip_flops[0][1] ) );
  DFFRQX2M \flip_flops_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(RST), .Q(
        \flip_flops[1][0] ) );
  DFFRQX2M \flip_flops_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(RST), .Q(
        \flip_flops[0][0] ) );
  AND2X1M U7 ( .A(\flip_flops[3][1] ), .B(RST), .Y(SYNC[3]) );
  AND2X1M U8 ( .A(\flip_flops[2][1] ), .B(RST), .Y(SYNC[2]) );
  AND2X1M U9 ( .A(\flip_flops[1][1] ), .B(RST), .Y(SYNC[1]) );
  AND2X1M U10 ( .A(\flip_flops[0][1] ), .B(RST), .Y(SYNC[0]) );
endmodule

