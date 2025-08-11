unit frmTest_u;      //w510 h362 88,49

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Math, Buttons,dmComlearning_u, MPlayer;

type
  TfrmTest = class(TForm)
    Panel1: TPanel;
    redOutPut: TRichEdit;
    pnlTrue: TPanel;
    btnTrue: TButton;
    pnlFalse: TPanel;
    btnFalse: TButton;
    pnlType: TPanel;
    edtConcept: TEdit;
    pnlBackButton: TPanel;
    btnNextDefinition: TButton;
    btbNext: TBitBtn;
    pnlMultiChoice: TPanel;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    chk4: TCheckBox;
    pnlBack1: TPanel;
    mpcorrectanswer: TMediaPlayer;
    pnlEndTest: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblUserScore: TLabel;
    Label3: TLabel;
    label2: TLabel;
    lblTestAvg: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    BitBtn1: TBitBtn;
    btbReTest: TBitBtn;
    Panel7: TPanel;
    lblMessage: TLabel;
    Panel4: TPanel;
    Label1: TLabel;
    btbBack: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btbBackClick(Sender: TObject);
    procedure btbNextClick(Sender: TObject);
    procedure btnTrueClick(Sender: TObject);
    procedure btnFalseClick(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure chk3Click(Sender: TObject);
    procedure chk4Click(Sender: TObject);
    procedure btnNextDefinitionClick(Sender: TObject);
    procedure btbReTestClick(Sender: TObject);

  private
    { Private declarations }
  public
  procedure correctanswer;
  procedure resetComponents;
  procedure CheckiftestisOver;
  procedure generateNextQuestion;
  procedure randomSelect;
    { Public declarations }
  end;

var
tFile:textfile;
 arrMultiChoice:array[1..4] of string;
 iRandom,iScore,iRandomSelect,iRandomType,iMultipleChoiceAns,iCQuestionsAnswered:integer;
  frmTest: TfrmTest;
  sline:string;
  bTrueNfalseAns,bRepeated:boolean;

implementation
uses
frmstudy_u;

{$R *.dfm}

procedure TfrmTest.btnFalseClick(Sender: TObject);  //btnfalse
begin
if bTrueNfalseAns=false then
begin
 Inc(iScore);
correctanswer;
end;
resetComponents;
CheckiftestisOver;

if iCQuestionsAnswered<frmStudy.iCount then
begin
generateNextQuestion;
end;


end;

procedure TfrmTest.btbNextClick(Sender: TObject);  //BTNNEXT MULTIPLE CHOICE
begin

if (iMultipleChoiceAns=1) and (chk1.Checked) then     //CHECK IF THEY GOT THE QUETION RIGHT
begin
Inc(iScore);
correctanswer;
end
else
if (iMultipleChoiceAns=2) and (chk2.Checked) then
begin
Inc(iScore);
correctanswer;
end
else
if (iMultipleChoiceAns=3) and (chk3.Checked) then
begin
 Inc(iScore);
 correctanswer;
end
else
if (iMultipleChoiceAns=4) and (chk4.Checked) then
begin
 Inc(iScore);
 correctanswer;
end;

resetComponents;
CheckiftestisOver;

if iCQuestionsAnswered<frmStudy.iCount then
begin
generateNextQuestion;
end;

end;

procedure TfrmTest.btbReTestClick(Sender: TObject);
begin
pnlEndTest.Top:=336;
pnlEndTest.Left:=88;
 btbNext.Visible:=false;
 pnlTrue.Visible:=false;
 pnlFalse.Visible:=false;
 pnlMultiChoice.Visible:=false;
 pnlType.Visible:=false;
 redOutPut.Clear;

 Reset(tFile);
 iScore:=0;
 iCQuestionsAnswered:=0;
generateNextQuestion;
end;

procedure TfrmTest.btnNextDefinitionClick(Sender: TObject);       //BTNTYPE CONCEPT QUESTION
var
sConcept:string;
begin
sConcept:=edtConcept.Text;

if UpperCase(sConcept)=UpperCase(Copy(sline,1,Pos('#',sline)-1)) then
begin
 Inc(iScore);
correctanswer;
end;

resetComponents;
CheckiftestisOver;

if iCQuestionsAnswered<frmStudy.iCount then
begin
generateNextQuestion;
end;
end;


procedure TfrmTest.btnTrueClick(Sender: TObject);      //btnTrue
begin
if bTrueNfalseAns=true then
begin
 Inc(iScore);
correctanswer;
end;
resetComponents;
CheckiftestisOver;

if iCQuestionsAnswered<frmStudy.iCount then
begin
generateNextQuestion;
end;


end;

procedure TfrmTest.CheckiftestisOver;     //CEHCKS IF THE TEST HAS REACHED ITS MAX
var
bfound:boolean;
rPercentage,rSum,rAvg:real;
iTestNum,iContentid,ic:integer;
begin
bfound:=false;
redOutPut.Lines.Clear;
Inc(iCQuestionsAnswered);

if iCQuestionsAnswered=frmStudy.iCount then
begin
rPercentage:= strtofloat(floattostrf(((iScore/frmStudy.iCount)*100),ffFixed,6,2));
with dmComLearning do
begin
tblTests.Last;
iTestNum:=tblTests['testnum']+1;

   tblContent.First;
   while not (tblContent.Eof) and (bfound=false) do
   begin
   if (tblContent['section']=frmStudy.sSection) and (tblContent['userid']=frmStudy.iUserSection) then
   begin
     iContentid:= tblContent['contentid'];
     bfound:=true;
   end
   else
   begin
   tblContent.Next;
   end;
end;
   tblTests.Last;                                   //CHECKS THAT DATES MATCH UP
   if (Now<tblTests['testdate']) then
   begin
    ShowMessage('check your date settings test discarded');
   end
   else
   begin
    tblTests.Insert;
  tblTests['testnum'] :=iTestNum;
  tblTests['contentid']:=tblContent['contentid'];
  tblTests['score']:=rPercentage;
  tblTests['testdate']:= strtodate(copy(DateToStr(now),1,10));
  tbltests['userid']:=frmStudy.iUserid;
  tblTests.Post;
  tblTests.Refresh;
   end;



  lblUserScore.Caption:=FloatToStrf(rPercentage,ffFixed,6,2)+'%';

  tblTests.First;                           //Gets test avg
  while not tblTests.Eof do
  begin
  if tblTests['contentid']=iContentid then
  begin
  rSum:=rSum+tblTests['score'];
  Inc(ic);
  end;
    tblTests.Next;
  end;
  rAvg:=rSum/ic;

  lblTestAvg.Caption:=FloatToStrf(rAvg,ffFixed,6,2)+'%';

  if rPercentage<40 then  //DISPLAYES A MOTIVATIONAL MESSAGE
  begin
  lblMessage.Caption:='Hard work pays off remember that';
  end
  else
  if rPercentage<80 then
  begin
     lblMessage.Caption:='good but could be better. keep up the hardwork';
  end
  else
  begin
   lblMessage.Caption:='EXECELLENT. You truely are a star';
  end; //DISPLAYES A MOTIVATIONAL MESSAGE


end;
pnlEndTest.Top:=88;
pnlEndTest.Left:=49;
 ShowMessage(IntToStr(iScore)+'/'+inttostr(frmStudy.iCount));
  CloseFile(tFile);

end;

end;

procedure TfrmTest.chk1Click(Sender: TObject);
begin                                            //CHK1 VALIDATION ENSURES NOT MORE THAN ONE CHECKBOX CAN BE CLCKED AT A TIME
if chk1.Checked=true then
 begin
 chk2.Visible:=false;
  chk3.Visible:=false;
   chk4.Visible:=false;
 end
 else
 begin
   chk2.Visible:=true;
  chk3.Visible:=true;
   chk4.Visible:=true;
 end;
end;

procedure TfrmTest.chk2Click(Sender: TObject);
begin               //CHK2 VALIDATION ENSURES NOT MORE THAN ONE CHECKBOX CAN BE CLCKED AT A TIME

if chk2.Checked=true then
 begin
 chk1.Visible:=false;
  chk3.Visible:=false;
   chk4.Visible:=false;
 end
 else
 begin
   chk1.Visible:=true;
  chk3.Visible:=true;
   chk4.Visible:=true;
 end;

end;

procedure TfrmTest.chk3Click(Sender: TObject);
begin               //CHK3 VALIDATION ENSURES NOT MORE THAN ONE CHECKBOX CAN BE CLCKED AT A TIME

if chk3.Checked=true then
 begin
 chk1.Visible:=false;
  chk2.Visible:=false;
   chk4.Visible:=false;
 end
 else
 begin
   chk1.Visible:=true;
  chk2.Visible:=true;
   chk4.Visible:=true;
 end;
end;

procedure TfrmTest.chk4Click(Sender: TObject);
begin               //CHK4 VALIDATION ENSURES NOT MORE THAN ONE CHECKBOX CAN BE CLCKED AT A TIME

if chk4.Checked=true then
 begin
 chk1.Visible:=false;
  chk3.Visible:=false;
   chk2.Visible:=false;
 end
 else
 begin
   chk1.Visible:=true;
  chk3.Visible:=true;
   chk2.Visible:=true;
 end;

end;

procedure TfrmTest.correctanswer;    //gives a visual indication of an answer being correct
begin
 mpcorrectanswer.FileName:='correctanswer.mp3';     //DISPLAY ans sound
  mpcorrectanswer.Open;
  mpcorrectanswer.Play;

end;

procedure TfrmTest.btbBackClick(Sender: TObject);
begin     //Back button sends to study page
pnlEndTest.Top:=336;
pnlEndTest.Left:=88;
 frmTest.Hide;
 frmStudy.Show;
 btbNext.Visible:=false;
 pnlTrue.Visible:=false;
 pnlFalse.Visible:=false;
 pnlMultiChoice.Visible:=false;
 pnlType.Visible:=false;
 //CloseFile(tFile);
 redOutPut.Clear;


end;

procedure TfrmTest.FormShow(Sender: TObject);      //WHEN THE FORM SHOWS
begin
 pnlTrue.Top:=60;
 pnlTrue.Left:=88;
 pnlFalse.Top:=60;
 pnlFalse.Left:=274;

 btbNext.Top:=135;
 btbNext.Left:=406;
 pnlMultiChoice.Top:=32;
 pnlMultiChoice.Left:=24;

 pnltype.Top:=65;
 pnlType.Left:=80;

 iScore:=0;
 iCQuestionsAnswered:=0;

 AssignFile(tFile,'test.txt');
 Reset(tfile);

generateNextQuestion;

end;

//#######################################################################################
procedure TfrmTest.generateNextQuestion;
var
i:integer;
begin
bTrueNfalseAns:=false;

 iMultipleChoiceAns:=Random(4)+1;
 iRandomType:=Random(2)+1;
 iRandomSelect:=Random(frmStudy.iCount)+1;
  iRandom:= Random(3)+1;

 Readln(tFile,sline);



for i := 1 to 4 do //intitializing array
  begin
    arrMultiChoice[i]:= ' ';
  end;


 with dmcomlearning do

  if iRandom=1 then
  begin
   pnlTrue.Visible:=true;   //makes true or false components visible
   pnlFalse.Visible:=true;

   if iRandomType=1 then
   begin
   redOutPut.Lines.Add('Does this concept match this definition?'+#13+Copy(sline,1,Pos('#',sline)-1));
   randomSelect;
  redOutPut.Lines.Add(tblContent['definition']);

  if tblContent['concept']=Copy(sline,1,Pos('#',sline)-1) then
  begin
   bTrueNfalseAns:=true;
  end;       //checking if the two match

   end  //show concept
   else
   begin
     redOutPut.Lines.Add('Does this definition match this concept?'+#13+Copy(sline,Pos('#',sline)+1));
     randomSelect;
 redOutPut.Lines.Add(tblContent['Concept']);

   if tblContent['definition']=Copy(sline,Pos('#',sline)+1) then
  begin
   bTrueNfalseAns:=true;
  end;  //checking if the two match

   end;
  end //if random =1 //TRUE AND FALSE

 //**************************************
  else
  if iRandom=2 then
  begin
   pnlType.Visible:=true;//makes type question components visible
      redOutPut.Lines.Add('Type the concept that matches this defintion :'+#13+Copy(sline,Pos('#',sline)+1));
  end  //if random =2  //TYPE CONCEPT

 //***********************************
  else
  begin
  pnlMultiChoice.Visible:=true;//makes multiple choice component visible
  btbNext.Visible:=true;

  if iMultipleChoiceAns=1 then   //choosing which rgbcheckbox will be the corect answer
  begin
  chk1.Caption:= Copy(sline,1,Pos('#',sline)-1);
  arrMultiChoice[1]:= Copy(sline,1,Pos('#',sline)-1);
 redOutPut.Lines.Add('Which concept matches this definition?'+#13+Copy(sline,Pos('#',sline)+1));
  repeat
    bRepeated:=false;                                    //CHK1.CHK2
   iRandomSelect:=Random(frmStudy.iCount)+1;
   randomSelect;
   chk2.Caption:=tblContent['concept'];
   for i :=  1 to 4 do
     begin
       if arrMultiChoice[i]=tblContent['concept'] then
       begin
       bRepeated:=true;
       end; //if its repeated
     end; //i loop
  until (bRepeated=false);
  arrMultiChoice[2]:=tblContent['concept'];

    repeat                                       //CHK1.CHK3
    bRepeated:=false;
   iRandomSelect:=Random(frmStudy.iCount)+1;
   randomSelect;
   chk3.Caption:=tblContent['concept'];
   for i :=  1 to 4 do
     begin
       if arrMultiChoice[i]=tblContent['concept'] then
       begin
       bRepeated:=true;
       end; //if its repeated
     end; //i loop
  until (bRepeated=false);
   arrMultiChoice[3]:=tblContent['concept'];

     repeat                           //CHK1.CHK4
    bRepeated:=false;
   iRandomSelect:=Random(frmStudy.iCount)+1;
   randomSelect;
   chk4.Caption:=tblContent['concept'];
   for i :=  1 to 4 do
     begin
       if arrMultiChoice[i]=tblContent['concept'] then
       begin
       bRepeated:=true;
       end; //if its repeated
     end; //i loop
  until (bRepeated=false);
  arrMultiChoice[4]:=tblContent['concept'];

  end //CHK1
 //*****************************************************************************
  else
   if iMultipleChoiceAns=2 then
  begin
  redOutPut.Lines.Add('Which concept matches this definition?'+#13+Copy(sline,Pos('#',sline)+1));
   chk2.Caption:= Copy(sline,1,Pos('#',sline)-1);
  arrMultiChoice[1]:= Copy(sline,1,Pos('#',sline)-1);

  repeat
    bRepeated:=false;                                    //CHK2.CHK1
   iRandomSelect:=Random(frmStudy.iCount)+1;
   randomSelect;
   chk1.Caption:=tblContent['concept'];
   for i :=  1 to 4 do
     begin
       if arrMultiChoice[i]=tblContent['concept'] then
       begin
       bRepeated:=true;
       end; //if its repeated
     end; //i loop
  until (bRepeated=false);
  arrMultiChoice[2]:=tblContent['concept'];

    repeat                                       //CHK2.CHK3
    bRepeated:=false;
   iRandomSelect:=Random(frmStudy.iCount)+1;
   randomSelect;
   chk3.Caption:=tblContent['concept'];
   for i :=  1 to 4 do
     begin
       if arrMultiChoice[i]=tblContent['concept'] then
       begin
       bRepeated:=true;
       end; //if its repeated
     end; //i loop
  until (bRepeated=false);
   arrMultiChoice[3]:=tblContent['concept'];

     repeat                           //CHK2.CHK4
    bRepeated:=false;
   iRandomSelect:=Random(frmStudy.iCount)+1;
   randomSelect;
   chk4.Caption:=tblContent['concept'];
   for i :=  1 to 4 do
     begin
       if arrMultiChoice[i]=tblContent['concept'] then
       begin
       bRepeated:=true;
       end; //if its repeated
     end; //i loop
  until (bRepeated=false);
  arrMultiChoice[4]:=tblContent['concept'];


 end //CHK2
//******************************************************************************
  else
   if iMultipleChoiceAns=3 then
  begin
  redOutPut.Lines.Add('Which concept matches this definition?'+#13+Copy(sline,Pos('#',sline)+1));
    chk3.Caption:= Copy(sline,1,Pos('#',sline)-1);
  arrMultiChoice[1]:= Copy(sline,1,Pos('#',sline)-1);

  repeat
    bRepeated:=false;                                    //CHK3.CHK1
   iRandomSelect:=Random(frmStudy.iCount)+1;
   randomSelect;
   chk1.Caption:=tblContent['concept'];
   for i :=  1 to 4 do
     begin
       if arrMultiChoice[i]=tblContent['concept'] then
       begin
       bRepeated:=true;
       end; //if its repeated
     end; //i loop
  until (bRepeated=false);
  arrMultiChoice[2]:=tblContent['concept'];

    repeat                                       //CHK3.CHK2
    bRepeated:=false;
   iRandomSelect:=Random(frmStudy.iCount)+1;
   randomSelect;
   chk2.Caption:=tblContent['concept'];
   for i :=  1 to 4 do
     begin
       if arrMultiChoice[i]=tblContent['concept'] then
       begin
       bRepeated:=true;
       end; //if its repeated
     end; //i loop
  until (bRepeated=false);
   arrMultiChoice[3]:=tblContent['concept'];

     repeat                           //CHK3.CHK4
    bRepeated:=false;
   iRandomSelect:=Random(frmStudy.iCount)+1;
   randomSelect;
   chk4.Caption:=tblContent['concept'];
   for i :=  1 to 4 do
     begin
       if arrMultiChoice[i]=tblContent['concept'] then
       begin
       bRepeated:=true;
       end; //if its repeated
     end; //i loop
  until (bRepeated=false);
  arrMultiChoice[4]:=tblContent['concept'];




   end  //CHK3
 //*****************************************************************************
  else
  begin
redOutPut.Lines.Add('Which concept matches this definition?'+#13+Copy(sline,Pos('#',sline)+1));
     chk4.Caption:= Copy(sline,1,Pos('#',sline)-1);
  arrMultiChoice[1]:= Copy(sline,1,Pos('#',sline)-1);

  repeat
    bRepeated:=false;                                    //CHK4.CHK1
   iRandomSelect:=Random(frmStudy.iCount)+1;
   randomSelect;
   chk1.Caption:=tblContent['concept'];
   for i :=  1 to 4 do
     begin
       if arrMultiChoice[i]=tblContent['concept'] then
       begin
       bRepeated:=true;
       end; //if its repeated
     end; //i loop
  until (bRepeated=false);
  arrMultiChoice[2]:=tblContent['concept'];

    repeat                                       //CHK4.CHK3
    bRepeated:=false;
   iRandomSelect:=Random(frmStudy.iCount)+1;
   randomSelect;
   chk3.Caption:=tblContent['concept'];
   for i :=  1 to 4 do
     begin
       if arrMultiChoice[i]=tblContent['concept'] then
       begin
       bRepeated:=true;
       end; //if its repeated
     end; //i loop
  until (bRepeated=false);
   arrMultiChoice[3]:=tblContent['concept'];

     repeat                           //CHK4.CHK2
    bRepeated:=false;
   iRandomSelect:=Random(frmStudy.iCount)+1;
   randomSelect;
   chk2.Caption:=tblContent['concept'];
   for i :=  1 to 4 do
     begin
       if arrMultiChoice[i]=tblContent['concept'] then
       begin
       bRepeated:=true;
       end; //if its repeated
     end; //i loop
  until (bRepeated=false);
  arrMultiChoice[4]:=tblContent['concept'];




  end;//CHK4

  end; //if random =3

  //end; //end of with dmcomlearning




end;


//######################################################################################

procedure TfrmTest.randomSelect;   //chooses randomly from database
 var
 iC:integer;
begin
with dmComLearning do
begin
iC:=0;
tblContent.First;
if (tblContent['section']=frmStudy.sSection) and (tblContent['userid']=frmStudy.iUserSection) then
begin
Inc(ic);
end;//if the record was found and matches criteria

while (not tblContent.Eof) and (ic<iRandomSelect)  do
begin
tblcontent.Next;
if (tblContent['section']=frmStudy.sSection) and (tblContent['userid']=frmStudy.iUserSection) then
begin
Inc(ic);
end;//if the record was found and matches criteria
end;//while

end; //  with

end;





procedure TfrmTest.resetComponents;  //RESETS COMPONENTS BETWEEN QUESTIONS
begin
edtConcept.Text:='Enter Concept';
chk1.Checked:=false;
chk2.Checked:=false;
chk3.Checked:=false;
chk4.Checked:=false;
btbNext.Visible:=false;
 pnlTrue.Visible:=false;
 pnlFalse.Visible:=false;
 pnlMultiChoice.Visible:=false;
 pnlType.Visible:=false;
end;

end.
