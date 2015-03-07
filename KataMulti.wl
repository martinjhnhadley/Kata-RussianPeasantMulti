(* ::Package:: *)

BeginPackage["KataMulti`"]

kataBasic::usage="kataBasic[int1,int2] calculates the product of int1 and int2";
kataFancy::usage="kataFancy[int2,int2] provides a graphical visualisation of the Kata Russian Peasant Multiplication Method";
foo;
kataExporter::usage="kataExporter[int1,int2,filepath] exports an animated GIF of the Kata multiplication method for int1 and int2 to filepath";
Begin["`Private`"]

foo=2;

kataBasic[no1_Integer,no2_Integer]:=Block[{multiPart={},odds={},sign={}},
sign=Sign[no1]*Sign[no2];
multiPart=NestWhileList[{IntegerPart[1/2*#[[1]]],2*#[[2]]}&,Abs@{no1,no2},#[[1]]>1&];
odds=Cases[multiPart,{a_,_}/;OddQ[a]];
sign*Total@odds[[All,2]]
]

kataFormatter[content_]:=Pane[content,{500,200},ImageSizeAction->"ResizeToFit",Alignment->Center];

kataFancy[no1_,no2_]:=Block[{multiPart=1,odds={},sign={}},
sign=Sign[no1]*Sign[no2];
multiPart=NestWhileList[{IntegerPart[1/2*#[[1]]],2*#[[2]]}&,Abs@{no1,no2},#[[1]]>1&];
odds=Flatten@Position[multiPart,{a_,_}/;OddQ[a]];
ListAnimate[
kataFormatter/@
{
Row[{no1,"x",no2}],Grid[multiPart],
Grid[multiPart,ItemStyle->{Automatic,Normal@SparseArray[Thread[odds->Black],{Length[multiPart]},Red]}],
Grid[multiPart[[odds]]],
Column[multiPart[[odds,2]]],
sign*Total[multiPart[[odds,2]]]
}
]
]

kataExporter[no1_,no2_,filepath_]:=Block[{multiPart=1,odds={},sign={}},
sign=Sign[no1]*Sign[no2];
multiPart=NestWhileList[{IntegerPart[1/2*#[[1]]],2*#[[2]]}&,Abs@{no1,no2},#[[1]]>1&];
odds=Flatten@Position[multiPart,{a_,_}/;OddQ[a]];
Export[filepath,
kataFormatter/@
{
Row[{no1,"x",no2}],Grid[multiPart],
Grid[multiPart,ItemStyle->{Automatic,Normal@SparseArray[Thread[odds->Black],{Length[multiPart]},Red]}],
Grid[multiPart[[odds]]],
Column[multiPart[[odds,2]]],
sign*Total[multiPart[[odds,2]]]
},
"DisplayDurations"->1
]
]

End[]

EndPackage[]
