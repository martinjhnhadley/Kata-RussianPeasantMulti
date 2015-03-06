(* ::Package:: *)

BeginPackage["KataMulti`"]

kataBasic::usage="kataBasic[int1,int2] calculates the product of int1 and int2";
kataFancy::usage="kataFancy[int2,int2] provides a graphical visualisation of the Kata Russian Peasant Multiplication Method";
foo;
Begin["`Private`"]

foo=2;

kataBasic[no1_Integer,no2_Integer]/;no2>0&&no1>0:=Block[{multiPart={},odds={}},
multiPart=NestWhileList[{IntegerPart[1/2*#[[1]]],2*#[[2]]}&,{no1,no2},#[[1]]>1&];
odds=Cases[multiPart,{a_,_}/;OddQ[a]];
Total@odds[[All,2]]
]

kataFormatter[content_]:=Pane[content,{500,200},ImageSizeAction->"ResizeToFit",Alignment->Center];

kataFancy[no1_,no2_]:=Block[{multiPart=1,odds={}},
multiPart=NestWhileList[{IntegerPart[1/2*#[[1]]],2*#[[2]]}&,{no1,no2},#[[1]]>1&];
odds=Flatten@Position[multiPart,{a_,_}/;OddQ[a]];
ListAnimate[
kataFormatter/@
{
Defer@TraditionalForm[no1*no2],Grid[multiPart],
Grid[multiPart,ItemStyle->{Automatic,Normal@SparseArray[Thread[odds->Black],{Length[multiPart]},Red]}],
Grid[multiPart[[odds]]],
Column[multiPart[[odds,2]]],
Total[multiPart[[odds,2]]]
}
]
]

End[]

EndPackage[]
