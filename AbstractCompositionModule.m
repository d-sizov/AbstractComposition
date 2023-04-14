(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* ::Input::Initialization:: *)
Clear@myDuplicateFreeQ
myDuplicateFreeQ[randomsamples_]:=DuplicateFreeQ[Sort/@Permutations/@randomsamples]


(* ::Input::Initialization:: *)
Clear@randomSamples
randomSamples[pts_,anglescount_,objcount_]/;anglescount>2:=Module[{res},
res={{1},{1}};
Do[If[Not@myDuplicateFreeQ@res,res=Table[RandomSample[pts,anglescount],{i,objcount}],Break[]],{i,1000}];
If[myDuplicateFreeQ@res,res,$Failed]
]
randomSamples[___]:=$Failed


(* ::Input::Initialization:: *)
Clear@gradientColorschemeQ
gradientColorschemeQ[name_]:=MemberQ[ColorData["Gradients"],name]


(* ::Input::Initialization:: *)
ClearAll[randomPolygons]
(*1*)randomPolygons[randomsamples_List,colorfun_]:=Module[{color},
color:=ReleaseHold[colorfun];
{color,Polygon[#]}&/@randomsamples
]

(*2*)randomPolygons[randomsamples_List,"RandomColors"]:=
randomPolygons[(*1*)randomsamples,Hold[RandomColor[]]]

(*3*)randomPolygons[randomsamples_List,colorslist:{_RGBColor..}]:=
randomPolygons[(*1*)randomsamples,Hold[RandomChoice[colorslist]]]

(*4*)randomPolygons[randomsamples_List,colorscheme_?gradientColorschemeQ]:=
randomPolygons[(*1*)randomsamples,Hold[ColorData[colorscheme]@RandomReal[]]]

(*5*)randomPolygons[randomsamples_List,"RandomColorscheme"]:=
randomPolygons[(*4*)randomsamples,RandomChoice[ColorData["Gradients"]]]

randomPolygons[___]:=$Failed


(* ::Input::Initialization:: *)
Clear@myGraphics
myGraphics[objs_List]:=Graphics@objs
myGraphics[___]:=$Failed


(* ::Input::Initialization:: *)
Clear@abstractCompositionInterface
abstractCompositionInterface[]:=DynamicModule[{
ll=ColorData["Gradients"],cl=Function[colordata,DensityPlot[x,{x,-1,2},{y,0,1},ColorFunction->(ColorData[colordata][#]&),ColorFunctionScaling->False,ImageSize->150,Axes->False,Frame->True,FrameTicks->False, AspectRatio->0.15]]/@ColorData["Gradients"],n=1,mode="\:0421\:043b\:0443\:0447\:0430\:0439\:043d\:044b\:0435 \:0446\:0432\:0435\:0442\:0430",figureType="\:0422\:0440\:0435\:0443\:0433\:043e\:043b\:044c\:043d\:0438\:043a\:0438",figureTypeToInteger,modeToArgument},

figureTypeToInteger[type_]:=type/.{"\:0422\:0440\:0435\:0443\:0433\:043e\:043b\:044c\:043d\:0438\:043a\:0438"->3,"\:0427\:0435\:0442\:044b\:0440\:0435\:0445\:0443\:0433\:043e\:043b\:044c\:043d\:0438\:043a\:0438"->4};
modeToArgument[mode_]:=mode/.{"\:0421\:043b\:0443\:0447\:0430\:0439\:043d\:044b\:0435 \:0446\:0432\:0435\:0442\:0430"->"RandomColors","\:0421\:043b\:0443\:0447\:0430\:0439\:043d\:0430\:044f \:043f\:0430\:043b\:0438\:0442\:0440\:0430"->"RandomColorscheme","\:0417\:0430\:0434\:0430\:043d\:043d\:0430\:044f \:043f\:0430\:043b\:0438\:0442\:0440\:0430"->ll[[n]],"\:0417\:0430\:0434\:0430\:043d\:043d\:044b\:0435 \:0446\:0432\:0435\:0442\:0430"->Pick[mycolors,chkboxesValues]};

res="";

Panel[
Grid[{

{Row[{Grid[{{"\:041a\:043e\:043b-\:0432\:043e \:0442\:043e\:0447\:0435\:043a ",Kpoints=10;Slider[Dynamic[Kpoints],{4,500,1},Appearance->"Labeled"]},
{"\:041a\:043e\:043b-\:0432\:043e \:0444\:0438\:0433\:0443\:0440 ",Kfig=4;Slider[Dynamic[Kfig],{4,100,1},Appearance->"Labeled"]}}],RadioButtonBar[Dynamic[figureType],{"\:0422\:0440\:0435\:0443\:0433\:043e\:043b\:044c\:043d\:0438\:043a\:0438","\:0427\:0435\:0442\:044b\:0440\:0435\:0445\:0443\:0433\:043e\:043b\:044c\:043d\:0438\:043a\:0438"},Appearance->"Vertical"]}]},

{Row[{RadioButtonBar[Dynamic[mode],{"\:0421\:043b\:0443\:0447\:0430\:0439\:043d\:044b\:0435 \:0446\:0432\:0435\:0442\:0430","\:0421\:043b\:0443\:0447\:0430\:0439\:043d\:0430\:044f \:043f\:0430\:043b\:0438\:0442\:0440\:0430","\:0417\:0430\:0434\:0430\:043d\:043d\:0430\:044f \:043f\:0430\:043b\:0438\:0442\:0440\:0430","\:0417\:0430\:0434\:0430\:043d\:043d\:044b\:0435 \:0446\:0432\:0435\:0442\:0430"},Appearance->"Vertical"],
Dynamic[
If[mode=="\:0417\:0430\:0434\:0430\:043d\:043d\:044b\:0435 \:0446\:0432\:0435\:0442\:0430",colorSelector[False],If[mode=="\:0417\:0430\:0434\:0430\:043d\:043d\:0430\:044f \:043f\:0430\:043b\:0438\:0442\:0440\:0430",PopupView[Row/@Transpose[{#<>" "&/@ll,cl}],Dynamic[n],FieldSize->{25,1.4}]," "]]
]},"               "]},
{Button["\:0421\:043e\:0437\:0434\:0430\:0442\:044c",res=Table[myGraphics@randomPolygons[randomSamples[RandomPoint[Rectangle[],Kpoints],figureTypeToInteger[figureType],Kfig],modeToArgument[mode]],12],ImageSize->770]},
{Dynamic@ExportRoutines`displayResults[res]},
{Dynamic@ExportRoutines`exportButton[res,"AbstractComposition_"<>mode]}
},Alignment->Left],
ImageSize->800
]
]
