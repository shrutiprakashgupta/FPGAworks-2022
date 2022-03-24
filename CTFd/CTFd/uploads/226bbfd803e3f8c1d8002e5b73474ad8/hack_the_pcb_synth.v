/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* top =  1  *)
(* src = "/home/work/extra/hack_the_pcb.v:1" *)
module hack_the_pcb(key, unlock);
  wire _0_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _1_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  wire _29_;
  wire _2_;
  wire _30_;
  wire _31_;
  wire _3_;
  wire _4_;
  wire _5_;
  wire _6_;
  wire _7_;
  wire _8_;
  wire _9_;
  (* src = "/home/work/extra/hack_the_pcb.v:2" *)
  input [7:0] key;
  (* src = "/home/work/extra/hack_the_pcb.v:3" *)
  output [18:0] unlock;
  INVX1 _32_ (
    .A(key[7]),
    .Y(_0_)
  );
  NAND2X1 _33_ (
    .A(key[6]),
    .B(_0_),
    .Y(_1_)
  );
  INVX1 _34_ (
    .A(key[5]),
    .Y(_2_)
  );
  NAND2X1 _35_ (
    .A(key[4]),
    .B(_2_),
    .Y(_3_)
  );
  NOR2X1 _36_ (
    .A(key[2]),
    .B(key[3]),
    .Y(_4_)
  );
  AND2X2 _37_ (
    .A(key[1]),
    .B(key[0]),
    .Y(_5_)
  );
  NAND2X1 _38_ (
    .A(_4_),
    .B(_5_),
    .Y(_6_)
  );
  NOR3X1 _39_ (
    .A(_1_),
    .B(_3_),
    .C(_6_),
    .Y(unlock[0])
  );
  INVX1 _40_ (
    .A(key[6]),
    .Y(_7_)
  );
  AND2X2 _41_ (
    .A(key[4]),
    .B(key[5]),
    .Y(_8_)
  );
  NAND3X1 _42_ (
    .A(_0_),
    .B(_7_),
    .C(_8_),
    .Y(_9_)
  );
  INVX1 _43_ (
    .A(key[2]),
    .Y(_10_)
  );
  NOR2X1 _44_ (
    .A(key[3]),
    .B(_10_),
    .Y(_11_)
  );
  NOR2X1 _45_ (
    .A(key[1]),
    .B(key[0]),
    .Y(_12_)
  );
  NAND2X1 _46_ (
    .A(_12_),
    .B(_11_),
    .Y(_13_)
  );
  NOR2X1 _47_ (
    .A(_9_),
    .B(_13_),
    .Y(unlock[1])
  );
  NOR2X1 _48_ (
    .A(key[7]),
    .B(_7_),
    .Y(_14_)
  );
  NAND2X1 _49_ (
    .A(_8_),
    .B(_14_),
    .Y(_15_)
  );
  NOR2X1 _50_ (
    .A(_15_),
    .B(_13_),
    .Y(unlock[2])
  );
  NOR2X1 _51_ (
    .A(_6_),
    .B(_15_),
    .Y(unlock[4])
  );
  NAND2X1 _52_ (
    .A(_4_),
    .B(_12_),
    .Y(_16_)
  );
  NOR2X1 _53_ (
    .A(_16_),
    .B(_9_),
    .Y(unlock[5])
  );
  INVX1 _54_ (
    .A(key[0]),
    .Y(_17_)
  );
  NOR2X1 _55_ (
    .A(key[1]),
    .B(_17_),
    .Y(_18_)
  );
  NAND2X1 _56_ (
    .A(_4_),
    .B(_18_),
    .Y(_19_)
  );
  NOR2X1 _57_ (
    .A(_9_),
    .B(_19_),
    .Y(unlock[6])
  );
  AND2X2 _58_ (
    .A(_17_),
    .B(key[1]),
    .Y(_20_)
  );
  NAND2X1 _59_ (
    .A(_11_),
    .B(_20_),
    .Y(_21_)
  );
  NOR2X1 _60_ (
    .A(_15_),
    .B(_21_),
    .Y(unlock[7])
  );
  NOR2X1 _61_ (
    .A(key[4]),
    .B(_2_),
    .Y(_22_)
  );
  NAND2X1 _62_ (
    .A(_14_),
    .B(_22_),
    .Y(_23_)
  );
  NAND2X1 _63_ (
    .A(_11_),
    .B(_18_),
    .Y(_24_)
  );
  NOR2X1 _64_ (
    .A(_23_),
    .B(_24_),
    .Y(unlock[8])
  );
  NAND3X1 _65_ (
    .A(key[1]),
    .B(_17_),
    .C(_4_),
    .Y(_25_)
  );
  NOR3X1 _66_ (
    .A(_1_),
    .B(_3_),
    .C(_25_),
    .Y(unlock[9])
  );
  NAND3X1 _67_ (
    .A(key[2]),
    .B(key[3]),
    .C(_5_),
    .Y(_26_)
  );
  NOR3X1 _68_ (
    .A(_1_),
    .B(_3_),
    .C(_26_),
    .Y(unlock[13])
  );
  AND2X2 _69_ (
    .A(_10_),
    .B(key[3]),
    .Y(_27_)
  );
  NAND2X1 _70_ (
    .A(_18_),
    .B(_27_),
    .Y(_28_)
  );
  NOR2X1 _71_ (
    .A(_23_),
    .B(_28_),
    .Y(unlock[11])
  );
  NOR2X1 _72_ (
    .A(_9_),
    .B(_24_),
    .Y(unlock[12])
  );
  NAND2X1 _73_ (
    .A(_5_),
    .B(_11_),
    .Y(_29_)
  );
  NOR2X1 _74_ (
    .A(key[4]),
    .B(key[5]),
    .Y(_30_)
  );
  NAND2X1 _75_ (
    .A(_30_),
    .B(_14_),
    .Y(_31_)
  );
  NOR2X1 _76_ (
    .A(_29_),
    .B(_31_),
    .Y(unlock[14])
  );
  NOR2X1 _77_ (
    .A(_25_),
    .B(_15_),
    .Y(unlock[15])
  );
  NOR2X1 _78_ (
    .A(_9_),
    .B(_28_),
    .Y(unlock[16])
  );
  NOR2X1 _79_ (
    .A(_19_),
    .B(_23_),
    .Y(unlock[17])
  );
  NOR2X1 _80_ (
    .A(_9_),
    .B(_29_),
    .Y(unlock[18])
  );
  assign { unlock[10], unlock[3] } = { unlock[13], unlock[13] };
endmodule
