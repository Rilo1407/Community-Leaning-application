unit frmWelcome_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,math, jpeg, ExtCtrls, TeEngine, TeeProcs, Chart, StdCtrls, Buttons, frmSearch_u,frmStudy_u,dmcomLearning_u,Series,Validation_u;

type
  TfrmWelcome = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    imgDisplay1: TImage;
    Label2: TLabel;
    Panel5: TPanel;
    imgDisplay2: TImage;
    lblusername: TLabel;
    btbHelp: TBitBtn;
    Panel7: TPanel;
    Panel9: TPanel;
    chtProgress: TChart;
    Panel10: TPanel;
    Panel11: TPanel;
    btbStudy: TBitBtn;
    Panel12: TPanel;
    btbSearch: TBitBtn;
    Panel13: TPanel;
    imgDisplay3: TImage;
    Image4: TImage;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Panel14: TPanel;
    Label5: TLabel;
    lblName: TLabel;
    btnEditName: TButton;
    Panel15: TPanel;
    Label7: TLabel;
    lblSurname: TLabel;
    btnEditSurname: TButton;
    Panel8: TPanel;
    Label11: TLabel;
    lblPass: TLabel;
    btnEditPass: TButton;
    Label8: TLabel;
    btnFeedback: TButton;
    procedure btbSearchClick(Sender: TObject);
    procedure btbStudyClick(Sender: TObject);
    procedure btbHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditNameClick(Sender: TObject);
    procedure btnEditSurnameClick(Sender: TObject);
    procedure btnEditPassClick(Sender: TObject);
    procedure btnFeedbackClick(Sender: TObject);



  private
    { Private declarations }
  public
  function Validchange:boolean ;
    { Public declarations }
  end;

var
arrSubjectNames:array[1..20] of string;
arrSubjectAverage:array[1..20] of real;
arrSubjectSum:array[1..20] of real;
arrSubjectCounter:array[1..20] of integer;
ic:integer;
  frmWelcome: TfrmWelcome;
  iUserId:integer;
  sName:string;
  sSurname:string;
  sPassword:string;

  Bar:TBarSeries;//declare bar graph
  objv:Tvalidation;

implementation
uses
frmLogin_u;

{$R *.dfm}

procedure TfrmWelcome.btnFeedbackClick(Sender: TObject);     //BTN FEED BACK
Var
sLine:string;
tFeedbackfile:textfile;
begin
sLine:=InputBox('Feedback','How can we make our program better','');

if (objv.CheckEmpty(sLine)=true) then
begin
ShowMessage('Invalid input');
end
else
begin
AssignFile(tFeedbackfile,'Feedback.txt');
Append(tFeedbackfile);
sLine:=sLine+' #'+IntToStr(iUserId);
Writeln(tFeedbackfile,sLine);                           //ALLOWS USER TO SEND THEIR FEEDBACK
CloseFile(tFeedbackfile);
ShowMessage('Thank you for your feedback!');
end;
end;

procedure TfrmWelcome.btbStudyClick(Sender: TObject);      //BTNSTUDY
var
sUserId:STRING;

begin //move to study
sUserId:= Copy(lblusername.Caption,pos('#',lblusername.Caption)+1);

with dmComLearning do
begin
qryComLearning.Close;
  qryComLearning.SQL.Clear;             //SQL FOR STUDY PAGE
  qryComLearning.SQL.Add('Select contentid,concept,subject from tblcontent where [userid]='+sUserid+'');
  qryComLearning.Open;
end;
frmWelcome.Close;
frmStudy.show;
end;

procedure TfrmWelcome.btnEditNameClick(Sender: TObject);  //BTN CHANGE NAME
begin
sName:=InputBox('Name change','Enter a new name','');


if (objv.CheckEmpty(sName)=true) or (objv.ValidString(sName)=false) then       //Validation
begin
ShowMessageUser('Please enter a proper name');
end
else
if Validchange=true then
begin

with dmComLearning do
begin
tblUsers.Locate('userid',iUserId,[]);      //updating tblusers
tblUsers.Edit;
tblUsers['name']:=sName;
tblUsers.Post;
tblUsers.Refresh;

lblName.Caption:=sName;
lblusername.Caption:=Copy(sName,1,1)+sSurname[1]+Copy(sName,2)+'#'+IntToStr(iUserId);
end;
end;
end;//end of edtname

procedure TfrmWelcome.btnEditSurnameClick(Sender: TObject);  //BTN CHANGE SURNAME
begin
sSurname:=InputBox('Surname change','Enter a new Surname','');


if (objv.CheckEmpty(sSurname)=true) or (objv.ValidString(sSurname)=false) then       //Validation
begin
ShowMessageUser('Please enter a proper Surname');
end
else
if Validchange=true then
begin

with dmComLearning do
begin
tblUsers.Locate('userid',iUserId,[]);      //updating tblusers
tblUsers.Edit;
tblUsers['Surname']:=sSurname;
tblUsers.Post;
tblUsers.Refresh;

lblsurname.Caption:=sSurname;
lblusername.Caption:=Copy(sName,1,1)+sSurname[1]+Copy(sName,2)+'#'+IntToStr(iUserId);
end;
end;
end;// btn change surname


procedure TfrmWelcome.btnEditPassClick(Sender: TObject);  //BTNCHANE PASSWORD
begin
sPassword:=InputBox('Password change','Enter a new password','');

if (objv.CheckEmpty(sPassword)=true) then       //Validation
begin
ShowMessageUser('Please enter a proper Password');
end
else
if Validchange=true then
begin

with dmComLearning do
begin
tblUsers.Locate('userid',iUserId,[]);      //updating tblusers
tblUsers.Edit;
tblUsers['password']:=sPassword;
tblUsers.Post;
tblUsers.Refresh;

lblPass.Caption:=sPassword;

end;

end;

end;





procedure TfrmWelcome.FormShow(Sender: TObject);       //ON FORM SHOW
var
bFound:boolean;
sline,sCopy:string;
ipos,i:integer;
begin
//populate arrays   iCDeletedSections:=0;iCDeletedSections:=0;iCDeletedSections:=0;

iUserId:=StrToInt(Copy(frmWelcome.lblusername.Caption,pos('#',frmWelcome.lblusername.Caption)+1));
sName:=lblName.Caption;
sPassword:=lblPass.Caption;
sSurname:=lblSurname.Caption;
bFound:=false;
ic:=0;
with dmComLearning do
begin
  tblUsers.Locate('userid',iUserId,[]);
  for i := 0 to 20 do //initializing arrays
    begin
    arrSubjectSum[i]:=0;
     arrSubjectAverage[i]:=0;
     arrSubjectNames[i]:='';
     arrSubjectCounter[i]:=0;
    end;


sline:=tblUsers['subjects'] +',';     //counts amount of subjects and determines subjects
repeat
ipos:=Pos(',',sline);
sCopy:=Copy(sline,1,ipos-1);
if sCopy='E' then   //adding english to arrsubjectnames
begin
arrSubjectNames[ic]:='English';
end;
if sCopy='L'  then   //adds IT to arrSubjectnames
begin
arrSubjectNames[ic]:='Life Science';
end;
if sCopy='P'  then   //adds physics to arrSubjectnames
begin
arrSubjectNames[ic]:='Physics';
end;
if sCopy='I'  then   //adds Life Science to arrSubjectnames
begin
arrSubjectNames[ic]:='IT';
end;
if sCopy='T' then   //adding english to arrsubjectnames
begin
arrSubjectNames[ic]:='Technology';
end;
if sCopy='A'  then   //adds IT to arrSubjectnames
begin
arrSubjectNames[ic]:='Accounting';
end;
if sCopy='H'  then   //adds physics to arrSubjectnames
begin
arrSubjectNames[ic]:='History';
end;
if sCopy='B'  then   //adds Life Science to arrSubjectnames
begin
arrSubjectNames[ic]:='Business Studies';
end;
if sCopy='C' then   //adding english to arrsubjectnames
begin
arrSubjectNames[ic]:='CAT';
end;
if sCopy='U'  then   //adds IT to arrSubjectnames
begin
arrSubjectNames[ic]:='Urdu';
end;
if sCopy='Z'  then   //adds physics to arrSubjectnames
begin
arrSubjectNames[ic]:='Zulu';
end;
if sCopy='G'  then   //adds Life Science to arrSubjectnames
begin
arrSubjectNames[ic]:='Geography';
end;

Inc(ic);
Delete(sline,1,ipos);
until (Length(sline)=0);

tblTests.First;
while not tblTests.Eof do
begin
if tblTests['userid']=tblUsers['userid'] then
begin
 tblContent.Locate('contentid',tblTests['contentid'],[]);

   for i := 0 to ic-1 do //checks which subject this average is for
   begin
   if uppercase(arrSubjectNames[i])=uppercase(tblContent['subject']) then
   begin
   arrSubjectSum[i]:=arrSubjectsum[i]+tblTests['score'];
   arrsubjectcounter[i]:=arrsubjectcounter[i]+1;      //for average counts how many tests of that specific subject there were
   end;//if subject matches array subject
   end;  //for i

end; //if the test belomgs to them
tblTests.Next;
end; //while tests

for i := 0 to ic-1 do
begin

if arrSubjectCounter[i]<>0 then //if the icounter isnt zero :because if it is zero and you divide by it you'll get an error
begin
 arrSubjectAverage[i]:=strtofloat(floattostrf((arrSubjectSum[i] /arrSubjectCounter[i]),ffFixed,6,2));
end; //if ic not 0

end;  //for i

chtProgress.ClearChart;
Bar:=TBarSeries.Create(self);
for i :=  0 to ic-1 do
  begin
  Bar.AddBar(arrsubjectaverage[i], arrsubjectnames[i], random($ffffff));
  Bar.ParentChart:=chtProgress;
  end;

end;

end;


function TfrmWelcome.Validchange: boolean; //VALIDATES CHANGES TO USER DATA
begin
Result:=true;

WITH dmComLearning do     //Checks for users with similar data
begin

tblUsers.First;
while not tblUsers.Eof do
begin
if (sName=tblUsers['name']) and (copy(sSurname,1,1)=copy(tblUsers['surname'],1,1)) and (sPassword=tblUsers['password']) then
begin
 Result:=false;
 ShowMessage('Sorry Your details are too similar to another user');
end;
  tblUsers.Next;
end;
end;
end;

procedure TfrmWelcome.btbSearchClick(Sender: TObject);   //BTBSEARCH
var
suserid:string;
begin//move to search
frmSearch.edtsearch.Text:='Search for a concept';
with dmComLearning do
begin
suserid:=Copy(frmWelcome.lblusername.Caption,pos('#',frmWelcome.lblusername.Caption)+1);

 qryComLearning.Close;
  qryComLearning.SQL.Clear;
  qryComLearning.SQL.Add('Select contentid,concept,subject from tblcontent where userid<>'+suserid+'');
  qryComLearning.Open;
end;
frmWelcome.Hide;
frmSearch.show;
end;

procedure TfrmWelcome.btbHelpClick(Sender: TObject);
var
tFile:textfile;
sline :string;
begin //welcome help button

if FileExists('welcomehelp.txt') then
begin
AssignFile(tFile,'welcomehelp.txt');
Reset(tFile);

while not Eof(tFile) do     //displaying textfile
begin
Readln(tFile,sline);
ShowMessage(sline);
end;//while not eof

CloseFile(tFile);
end
else
begin
ShowMessage('file does not exist');
end;


end;

end.
