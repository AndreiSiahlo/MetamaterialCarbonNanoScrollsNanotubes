Print["MetamaterialCarbonNanoScrollsNanotubes"];
Print["or"];
Print["Metamaterial(SemiconductorsV52p1886).m"];

Print[" ----------------------------------------------------"];
Print[" The Image of the Metamaterial of the paper  "];
Print[" Model of Metamaterial Based on Carbon NanoScrolls "];
Print[" and Carbon Nanotubes with Negative Refractive Index "];
Print[" /A.I.Siahlo, N.A.Poklonski, S.A.Vyrko and S.V.Ratkevich"];
Print[" //Semiconductors.- 2018.- V. 52, № 14.- P.1886 (4 pp.)."];
Print[" [DOI: 10.1134/S1063782618140294] "];
Print[" ----------------------------------------------------"];

Print[" I.1. The Input Parameters --------------"];
NumberScrollLayersp1 = 1; NumberScrollLayersp2 = 2;
NumberScrollLayersp = NumberScrollLayersp2;
Print["NumberScrollLayers=", NumberScrollLayersp];
n10 = 10; nNanotubep = n10;
Print["nNanotube=", nNanotubep];

nNanoscrollsXp = 3;
nNanoscrollsZp = 2;
nNanotubesYp = 3;
nNanotubesZp = 3;
Print["Along X-direction: nNanoscrollsX=", nNanoscrollsXp, 
  ",  Along Z-direction: nNanoscrollsZ=", nNanoscrollsZp];
Print["Along Y-direction: nNanotubesY=", nNanotubesYp, 
  ",  Along Z-direction: nNanotubesZ=", nNanotubesZp];
PhiRotPid2 = Pi/2;
L12d7nm = 12.709 nm;
RIn1d1nm = 1.1 nm;
L15nm = 15. nm; L1p = L15nm;
L1p = L15nm;
L1p = L12d7nm;
Spirale1RotAnglep = 0;
Spirale2RotAnglep = Pi;
NanoribbonLengthp = L1p;
Print[" The length of a carbon nanoribbons L1=", L1p/nm, "nm"];
RIn1p = RIn1d1nm;
Print["The Inner radius of nanoscrolls RIn1=", RIn1p/nm, "nm"];
Lw1nm = 1 nm; Lw12nm = 12. nm; 
Lw12nm = 12 nm; Lw60nm = 60 nm; Lw5nm = 5 nm;
Lwp = Lw5nm;
NanoscrollWidth = Lwp;
NanoribbonWidth = Lwp;
Print[" The carbon nanoscroll width w=", Lwp/nm, "nm"];
ShiftX0nm = 0 nm; ShiftY0nm = 0 nm;
Print[" I.5.The parameters for the visualisation"];
Nu10 = 40; Scale09 = 0.99;
ShowScrollSpirales = True;
ShowNanoscrollSingle = True;
ShowStructureProjections = True;
Print[" --------End Of The Input---------------"];

Print[" ----------------------------------------------------"];
ThisNotebookFileName = NotebookInformation[][[1, 2, 2]];
Print["ThisNotebookFileName = ", ThisNotebookFileName];
StructureNameNanoscrollsXZ = 
  StringJoin["NanocrollsX", ToString[nNanoscrollsXp], "Z", 
   ToString[nNanoscrollsZp]];
StructureNameNanotubesYZ = 
  StringJoin["NanotubesY", ToString[nNanotubesYp], "Z", 
   ToString[nNanotubesZp]];
StructureName = 
  StringJoin["Metamaterial", StructureNameNanoscrollsXZ, 
   StructureNameNanotubesYZ];
Print["StructureName=", StructureName];
Print["I.0.1 The Units (nm, meV, AA)"];
"nm=10^(-9)m;";
nm = 10^(-9) m;
AA = 10^(-10) m;
JJkgms = kg m^2/s^2;
Farad = Amper^2 s^4 kg^(-1) m^(-2);
Cl = Amper s;
Volt = m^2 kg/s^3/Amper;
"eV=JJ Electronp;";
JJ = eV/Electron;
meV = N[eV/1000];
Print["I.0.2. The physical constants"];
Print[" The interatomic distance aCC and the interlayer distance h"];
aCC142AA = 1.42 AA; aCCp = aCC142AA;
NatomsInCell2 = 2; NatomsInCellp = NatomsInCell2;
Print["NatomsInCell=", NatomsInCellp];
h335nm = 0.3354 nm; hp = h335nm;
Print["aCC=", aCCp/nm, "nm, h=", hp/nm, " nm"];
Print["I.0.3. The functions that will be used"];
frNanotubenn[n_, aCC_] := n 3 aCC/(2 Pi);
fSpiraleLen[NumberScrollLayersv_, PhiInv_, PhiOutv_, hv_] := 
  (1/(4 Pi) hv NumberScrollLayersv (-PhiInv Sqrt[1 + PhiInv^2] + 
             PhiOutv Sqrt[1 + PhiOutv^2] - ArcSinh[PhiInv] + 
             ArcSinh[PhiOutv]));
Print["fSpiraleLen[NumberScrollLayersv,PhiInv, PhiOutv, hv]=", 
  fSpiraleLen[NumberScrollLayersv, PhiInv, PhiOutv, hv]];
fPhiOutvsPhiInLh[NumberScrollLayersv_, PhiInv_, Lv_, hv_] := 
    Sqrt[4 Pi Lv/(NumberScrollLayersv hv) + PhiInv^2];
Print["fPhiOutvsPhiInLh[NumberScrollLayersv,PhiInv, Lv, hv]=", 
  fPhiOutvsPhiInLh[NumberScrollLayersv, PhiInv, Lv, hv]];
fPhivsRh[NumberScrollLayersv_, Rv_, hv_] := 
  Rv 2 Pi/(NumberScrollLayersv hv);
Print["fPhivsRh[NumberScrollLayersv, Rv, hv]=", 
  fPhivsRh[NumberScrollLayersv, Rv, hv] ];
fRvsPhih[NumberScrollLayersv_, Phiv_, 
   hv_] := (NumberScrollLayersv hv) Phiv/(2 Pi);
Print["fRvsPhih[NumberScrollLayersv,Phiv,hv]=", 
  fRvsPhih[NumberScrollLayersv, Phiv, hv] ];
fPhiOut1vsL1RIn1h[NumberScrollLayersv_, L1v_, RIn1v_, hv_] := 
    fPhiOutvsPhiInLh[NumberScrollLayersv, 
   fPhivsRh[NumberScrollLayersv, RIn1v, hv], L1v, hv];
Print["fPhiOut1vsL1RIn1h[NumberScrollLayersv, L1v, RIn1v, hv]=", 
  fPhiOut1vsL1RIn1h[NumberScrollLayersv, L1v, RIn1v, hv] ];
fPhiIn2[NumberScrollLayersv_, RIn1v_, hv_, dPhi12v_] := 
    fPhivsRh[NumberScrollLayersv, RIn1v, hv] + dPhi12v;
Print["fPhiIn2[NumberScrollLayersv, RIn1v, hv, dPhi12v]=", 
  fPhiIn2[NumberScrollLayersv, RIn1v, hv, dPhi12v] ];
fPhiOut2[NumberScrollLayersv_, L1v_, RIn1v_, hv_, dPhi12v_] := 
    fPhiOutvsPhiInLh[NumberScrollLayersv, 
   fPhiIn2[NumberScrollLayersv, RIn1v, hv, dPhi12v], L1v, hv];
rNanotubep = frNanotubenn[n10, aCCp];
rNanotubep = rNanotubep;
Print["rNanotube(", n, "," n, ")=", rNanotubep/nm, "nm"];
PhiIn1p = fPhivsRh[NumberScrollLayersp, RIn1p, hp];
PhiOut1p = fPhiOut1vsL1RIn1h[NumberScrollLayersp, L1p, RIn1p, hp];
Print["PhiIn1=", PhiIn1p/(2 Pi), "(2Pi),"];
Print["PhiOut1=",PhiOut1p/(2 Pi),"(2Pi)"];
PhiIn2p = PhiIn1p + Pi;
PhiOut2p = PhiOut1p + Pi;
Print["PhiIn2=", PhiIn2p/(2 Pi),"(2Pi)"];
Print["PhiOut2=",PhiOut2p/(2 Pi),"(2Pi)"];
ROut1p = fRvsPhih[NumberScrollLayersp, PhiOut1p, hp] ;
Print["RIn1=", RIn1p/nm, "nm,  ROut1=", ROut1p/nm, "nm"];
aScrollXZp = 2 ROut1p + hp + 2 rNanotubep;
Print[" The distance between the centrums of the NanoScrolls"];
Print["  in the XZ-plane aScrollXZ=", aScrollXZp/nm, "nm"];
aNanotubesXYp = 2 ROut1p + hp + 2 rNanotubep;
Print[" The distance between the centrums of the Nanotubes"];
Print["  in the XY-plane aNanotubesXY=", aNanotubesXYp/nm, "nm"];
NanotubeLengthXp = aScrollXZp (nNanoscrollsXp + 1);
Print["The Length of the Nanotubes along the X-axe:"];
Print[" NanotubeLengthX=",NanotubeLengthXp/nm, "nm"];
NanoscrollLengthYp = aNanotubesXYp (nNanotubesYp);
Print["The Length of the Nanoscrolls along the Y-axe:"];
Print["  NanoscrollLengthY=", NanoscrollLengthYp/nm, "nm"];
StructureLengthZp = nNanotubesZp aScrollXZp;
Print["The Length of the Structure along the Z-axe:"];
Print[" StructureLengthZ=", StructureLengthZp/nm, "nm"];

nm = 1.; m = 10^9 nm;

Print["Draw the spirales of a nanoscroll"];
Spirale1ScrollSingle = 
  ParametricPlot[{Cos[
      Phiv] (Phiv - 
   Spirale1RotAnglep)
     (NumberScrollLayersp hp)/(2 Pi)/nm Scale09, 
    Sin[Phiv] (Phiv - 
       Spirale1RotAnglep) (NumberScrollLayersp hp)/(2 Pi)/
      nm Scale09}, {Phiv, Spirale1RotAnglep + PhiIn1p, 
    Spirale1RotAnglep + PhiOut1p}, 
PlotRange -> {{-ROut1p/nm, ROut1p/nm }, 
              {-ROut1p/nm, ROut1p/nm }}, 
   PlotStyle -> {Black, Thick}, Axes -> True];

If[NumberScrollLayersp == 1,
  If[ShowScrollSpirales,
    Print["Show[Spirale1ScrollSingle]:"];
    Print[Show[Spirale1ScrollSingle]];
    ];
  ];
Spirale2ScrollSingle = 
  ParametricPlot[{Cos[
      Phiv] (Phiv - 
 Spirale2RotAnglep)
      (NumberScrollLayersp hp)/(2 Pi)/nm Scale09, 
    Sin[Phiv] (Phiv - 
       Spirale2RotAnglep) (NumberScrollLayersp hp)/(2 Pi)/
      nm Scale09}, {Phiv, Spirale2RotAnglep + PhiIn2p - Pi, 
    Spirale2RotAnglep + PhiOut2p - Pi}, 
PlotRange -> {{-ROut1p/nm, ROut1p/nm },
              {-ROut1p/nm, ROut1p/nm }}, 
   PlotStyle -> {Gray, Thick}, Axes -> True];
If[NumberScrollLayersp == 2,
  If[ShowScrollSpirales,
    Print["Show[{Spirale1ScrollSingle,Spirale2ScrollSingle}]:"];
    Print[Show[{Spirale1ScrollSingle, Spirale2ScrollSingle}]];];
  ];
Print[];
Print["Draw the spirales of the nanoscrolls of the structure:"];
Print["aScrollXZp=", aScrollXZp/nm, "nm"];
Print["aScrollXZp=2ROut1p+hp+2rNanotubep,"];
Print[" {2ROut1p,hp,2rNanotubep}=", {2 ROut1p, hp, 2 rNanotubep}];
tSpirale1Scroll = 
  Table[ParametricPlot[{aScrollXZp (iScrollX - nNanoscrollsXp) + 
      Cos[Phiv] (Phiv - 
         Spirale1RotAnglep) (NumberScrollLayersp hp)/(2 Pi) Scale09, 
     aScrollXZp (jScrollY - nNanoscrollsZp) + 
      Sin[Phiv] (Phiv - 
         Spirale1RotAnglep) (NumberScrollLayersp hp)/(2 Pi) 
       Scale09}, {Phiv, Spirale1RotAnglep + PhiIn1p, 
     Spirale1RotAnglep + PhiOut1p}, 
    PlotRange -> {{-(nNanoscrollsXp - 1) aScrollXZp - 1 ROut1p, 
       ROut1p }, {-(nNanoscrollsZp - 1) aScrollXZp - 1 ROut1p, 
       ROut1p }}, PlotStyle -> {Black, Thick}, 
    Axes -> True], {iScrollX, 1, nNanoscrollsXp}, {jScrollY, 1, 
    nNanoscrollsZp}];
If[ShowScrollSpirales,
  Print["Show[tSpirale1Scroll]:"];
  Print[Show[tSpirale1Scroll, ImageSize -> Large]];
  ];
tSpirale2Scroll = 
  Table[ParametricPlot[{aScrollXZp (iScrollX - nNanoscrollsXp) + 
      Cos[Phiv] (Phiv - 
         Spirale2RotAnglep) (NumberScrollLayersp hp)/(2 Pi) Scale09, 
     aScrollXZp (jScrollY - nNanoscrollsZp) + 
      Sin[Phiv] (Phiv - 
         Spirale2RotAnglep) (NumberScrollLayersp hp)/(2 Pi) 
       Scale09}, {Phiv, Spirale2RotAnglep + PhiIn2p - Pi, 
     Spirale2RotAnglep + PhiOut2p - Pi}, 
    PlotRange -> {{-(nNanoscrollsXp - 1) aScrollXZp - 1 ROut1p, 
       ROut1p }, {-(nNanoscrollsZp - 1) aScrollXZp - 1 ROut1p, 
       ROut1p }}, PlotStyle -> {Gray, Thick}, 
    Axes -> True], {iScrollX, 1, nNanoscrollsXp}, {jScrollY, 1, 
    nNanoscrollsZp}];
If[ShowScrollSpirales,
  If[NumberScrollLayersp == 1,
   Print["Show[tSpirale1Scroll]:"]; 
   Print[Show[tSpirale1Scroll, ImageSize -> Large]];
   ];
  If[NumberScrollLayersp == 2,
   Print["Show[tSpirale1Scroll,tSpirale2Scroll]:"]; 
   Print[Show[tSpirale1Scroll, tSpirale2Scroll, ImageSize -> Large]];
   ];
  ];
Print["Draw the Nanotubes of the structure:"];
nm = 1; m = 10^9 nm; N07 = 0.7;
tNanotubeYZ = 
  Table[ParametricPlot3D[{xv, 
     jNanotubeY aScrollXZp - aScrollXZp 0.5 + 
      Cos[Phiv] rNanotubep, (kNanotubeZ - 1) aScrollXZp + 
      Sin[Phiv] rNanotubep}, {Phiv, Spirale1RotAnglep + PhiIn1p, 
     Spirale1RotAnglep + PhiOut1p}, {xv, aScrollXZp 0.45, 
     NanotubeLengthXp - aScrollXZp 0.55}, PlotPoints -> 5, 
    PlotStyle -> {Gray, Thick}, 
    PlotRange -> {{-aScrollXZp N07, 
       NanotubeLengthXp + aScrollXZp N07}, {-aNanotubesXYp N07, 
       NanoscrollLengthYp + 
        aNanotubesXYp N07}, 
        {-aScrollXZp N07, 
         (nNanoscrollsZp)aScrollXZp + aScrollXZp N07}},
    ColorFunction -> Function[{x, y, z, u, v}, Gray], 
    ColorFunctionScaling -> False], {jNanotubeY, 1, 
    nNanotubesYp}, {kNanotubeZ, 1, nNanotubesZp}];
(*Print["The tNanotubeYZ:"];
Print[Show[tNanotubeYZ,ViewPoint->Front]];*)
nm = 1.; m = 10^9 nm; N01 = 0.01;
Print["Define all 3D-scrolls"];
Scroll13D00 = 
  ParametricPlot3D[{Cos[Phiv] (Phiv - Spirale1RotAnglep) 
     NumberScrollLayersp hp/(2 Pi), yv, 
    Sin[Phiv] (Phiv - Spirale1RotAnglep) 
     NumberScrollLayersp hp/(2 Pi)}, {Phiv, 
    Spirale1RotAnglep + PhiIn1p, Spirale1RotAnglep + PhiOut1p}, {yv, 
    0, NanoscrollLengthYp}, PlotPoints -> 5, 
   PlotStyle -> {Gray, Thick}, 
   PlotRange -> {{-ROut1p/nm, ROut1p /nm}, {-aScrollXZp N07, 
      NanoscrollLengthYp /nm}, {-ROut1p/nm, ROut1p/nm}},
      Axes -> True,
    ColorFunction -> Function[{x, y, z, u, v}, Gray], 
   ColorFunctionScaling -> False];
Scroll23D00 = 
  ParametricPlot3D[{Cos[Phiv] (Phiv - Spirale2RotAnglep) 
     NumberScrollLayersp hp/(2 Pi), yv, 
    Sin[Phiv] (Phiv - Spirale2RotAnglep) 
     NumberScrollLayersp hp/(2 Pi)}, {Phiv, 
    Spirale2RotAnglep + PhiIn2p - Pi, 
    Spirale2RotAnglep + PhiOut2p - Pi}, {yv, 0, NanoscrollLengthYp}, 
   PlotPoints -> 5, PlotStyle -> {Gray, Thick}, 
   PlotRange -> {{-ROut1p/nm, ROut1p /nm}, {-aScrollXZp N07, 
      NanoscrollLengthYp /nm}, {-ROut1p/nm, ROut1p/nm}},
      Axes -> True,
    ColorFunction -> Function[{x, y, z, u, v}, LightGray], 
   ColorFunctionScaling -> False];
If[NumberScrollLayersp == 1,
  If[ShowNanoscrollSingle,
    Print["Show[Scroll13D00]:"];
    Print[Show[Scroll13D00, ImageSize -> Small]];
    ];
  ];
If[NumberScrollLayersp == 2,
  If[ShowNanoscrollSingle,
   Print["Scroll13D00],Scroll23D00],Scroll13D00,Scroll23D00]:"];
    Print[Show[Scroll13D00, ImageSize -> Small], 
     Show[Scroll23D00, ImageSize -> Small], "              ", 
     Show[Scroll13D00, Scroll23D00, ImageSize -> Small]];
    ];
  ];

Print["Define tScroll13DXZ and tScrol23DXZ"];
tScroll13DXZ = 
  Table[ParametricPlot3D[{iNanoscrollX aScrollXZp/nm + 
      Cos[Phiv] (Phiv - Spirale1RotAnglep) 
       NumberScrollLayersp hp/nm/(2 Pi), 
     yv, -aScrollXZp/nm/2 + kNanoscrollZ aScrollXZp/nm + 
      Sin[Phiv] (Phiv - Spirale1RotAnglep) 
       NumberScrollLayersp hp/nm/(2 Pi)}, {Phiv, 
     Spirale1RotAnglep + PhiIn1p, 
     Spirale1RotAnglep + PhiOut1p}, 
     {yv, 0, NanoscrollLengthYp}, PlotPoints -> 5, 
    PlotStyle -> {Gray, Thick}, 
    PlotRange -> {{-aScrollXZp N07, 
       NanotubeLengthXp + aScrollXZp N07}, {-aNanotubesXYp N07, 
       NanoscrollLengthYp + 
        aNanotubesXYp N07}, 
        {-aScrollXZp N07, 
         (nNanoscrollsZp)aScrollXZp + aScrollXZp N07}},
          Axes -> True, 
    ColorFunction -> Function[{x, y, z, u, v}, Gray], 
    ColorFunctionScaling -> False], {iNanoscrollX, 1, 
    nNanoscrollsXp}, {kNanoscrollZ, 1, nNanoscrollsZp}];
tScroll23DXZ = 
  Table[ParametricPlot3D[{iNanoscrollX aScrollXZp/nm + 
      Cos[Phiv] (Phiv - Spirale2RotAnglep) 
       NumberScrollLayersp hp/nm/(2 Pi), 
     yv, -aScrollXZp/nm/2 + kNanoscrollZ aScrollXZp/nm + 
      Sin[Phiv] (Phiv - Spirale2RotAnglep) 
       NumberScrollLayersp hp/nm/(2 Pi)}, {Phiv, 
     Spirale2RotAnglep + PhiIn2p - Pi, 
     Spirale2RotAnglep + PhiOut2p - Pi}, 
     {yv, 0, NanoscrollLengthYp}, 
    PlotPoints -> 5, PlotStyle -> {Gray, Thick}, 
    PlotRange -> {{-aScrollXZp N07, 
       NanotubeLengthXp + aScrollXZp N07}, {-aNanotubesXYp N07, 
       NanoscrollLengthYp + 
        aNanotubesXYp N07}, {-aScrollXZp N07, 
        (nNanoscrollsZp)aScrollXZp + aScrollXZp N07}}, Axes -> True, 
    ColorFunction -> Function[{x, y, z, u, v}, LightGray], 
    ColorFunctionScaling -> False], {iNanoscrollX, 1, 
    nNanoscrollsXp}, {kNanoscrollZ, 1, nNanoscrollsZp}];
(*Print["Show[tScroll13DXZ,tScroll23DXZ]:"];
Print[Show[tScroll13DXZ,tScroll23DXZ,ImageSize->Medium]];*)
Print["    --------Show the Metamaterial:-----------"];
Print["    (Fig.4 of the paper"];
Print["     Model of Metamaterial Based on Carbon Nanoscrolls "];
Print["     and Carbon Nanotubes with Negative Refractive Index "];
Print["  / A.I.Siahlo, N.A.Poklonski, S.A.Vyrko and S.V.Ratkevich "];
Print["  //Semiconductors.- 2018. - V. 52, № 14.- P.1886 (4 pp.). )"];
Print[Show[tScroll13DXZ, tScroll23DXZ, tNanotubeYZ, 
   ImageSize -> Medium, 
   ViewPoint -> {StructureLengthZp 1000, StructureLengthZp 1000
     , StructureLengthZp 1000}]];
If[ShowStructureProjections,
      Print["   and its projections:"];
  Print[Show[tScroll13DXZ, tScroll23DXZ, tNanotubeYZ, 
    ImageSize -> Medium, ViewPoint -> Front], 
   Show[tScroll13DXZ, tScroll23DXZ, tNanotubeYZ, 
        ImageSize -> Medium, 
    ViewPoint -> Left]];
  Print[Show[tScroll13DXZ, tScroll23DXZ, tNanotubeYZ, 
    ImageSize -> Medium, ViewPoint -> Top]];
  ];
Print["The parameters of the metamaterial"];
Print["{nNanoscrollsXp,nNanotubesYp,nNanoscrollsZp,nNanotubesZp}:"];
Print["      ", {nNanoscrollsXp, nNanotubesYp, nNanoscrollsZp, 
   nNanotubesZp}];
StructureFigure = 
  Show[tScroll13DXZ, tScroll23DXZ, tNanotubeYZ, ImageSize -> Medium, 
   ViewPoint -> {StructureLengthZp 1000, StructureLengthZp 1000
     , StructureLengthZp 1000}];
StructureFigureFileName = 
  ToFileName[NotebookDirectory[], StringJoin[StructureName, ".jpg"]];
Print["StructureFigureFileName=", StructureFigureFileName];
Export[StructureFigureFileName, StructureFigure];
