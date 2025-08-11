unit frmSearch_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls, Buttons,dmComLearning_u,Validation_u;

type
  TfrmSearch = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    cmbSubjects: TComboBox;
    chkFilter: TCheckBox;
    cmbGrade: TComboBox;
    edtsearch: TEdit;
    Panel3: TPanel;
    btnSearch: TButton;
    Panel4: TPanel;
    Button4: TButton;
    Panel7: TPanel;
    Panel5: TPanel;
    btnSaveTest: TButton;
    Panel6: TPanel;
    Button3: TButton;
    Panel8: TPanel;
    dgbContent: TDBGrid;
    Panel9: TPanel;
    btnReport: TButton;
    Panel10: TPanel;
    Button7: TButton;
    btbBack: TBitBtn;
    btbHelp: TBitBtn;
    Panel11: TPanel;
    btnView: TButton;
    Panel12: TPanel;
    Button8: TButton;
    Panel13: TPanel;
    btnReset: TButton;
    Panel14: TPanel;
    Button9: TButton;
    procedure btbBackClick(Sender: TObject);
    procedure btbHelpClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure btnSaveTestClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
objv:Tvalidation;
  frmSearch: TfrmSearch;

implementation
 uses frmwelcome_u,frmLogin_u,frmstudy_u;
{$R *.dfm}

procedure TfrmSearch.btbHelpClick(Sender: TObject);
var
tFile:textfile;
sline :string;
begin //search help button

if FileExists('searchhelp.txt') then
begin
AssignFile(tFile,'searchhelp.txt');
Reset(tFile);

while not Eof(tFile) do     //displaying textfile
begin
Readln(tFile,sline);          //DISPLAYS INFO FROM THE HELP TEXTFILE
ShowMessage(sline);
end;//while not eof

CloseFile(tFile);
end
else
begin
ShowMessage('file does not exist');
end;


end;

procedure TfrmSearch.btbBackClick(Sender: TObject);  //BTNBACK : MOVES TO WELCOME
begin
frmSearch.Hide;
frmWelcome.Show;
end;

procedure TfrmSearch.btnViewClick(Sender: TObject);
var                                                     //BTN VIEW RECORD
scontentid:string;
begin
scontentid:=InputBox('View record','what is the content id of the record you want to view','');

if (objv.CheckEmpty(scontentid)=false) and (objv.ValidNumber(sContentid)=true) then
begin

 with dmComLearning do
begin
 if tblContent.Locate('contentid',strtoint(scontentid),[])=true  then       //if the content id exists
 begin
 tblContent.Locate('contentid',strtoint(scontentid),[]);
 ShowMessage(tblContent['concept']+':'+#13+tblContent['definition']);    //DISPLAYS A SELECTED RECORDS CONCEPT AND DEFINITION
 end
 else
 begin
  ShowMessage('the contentid you searched for doesnt exist');
 end;
end; //with dmcomlearning

end
else
begin
 ShowMessage('invalid contentid');     //ERROR MESSAGE
end;
end;

procedure TfrmSearch.btnSaveTestClick(Sender: TObject);     //BTN SAVE TESTS :SAVES A SET TO THE USERS STUDY PAGE SO THEY CAN TEST THEMSELVES ON THAT SET
var        //save section to test
sContentid,sSubject:string;
iuserid:integer;
tFile:textfile;
sline:string;
begin
iUserId:= StrToInt(Copy(frmWelcome.lblusername.Caption,pos('#',frmWelcome.lblusername.Caption)+1));
sContentid:=InputBox('Save a record','What is the content id of the record you want to save','');

with dmComLearning do
begin

if (objv.CheckEmpty(sContentid)=false) and (objv.ValidNumber(sContentid)=true)  then     //VALIDATION : BLANK FIELDS AND INVALID NUMBERS
begin
if tblContent.Locate('contentid',StrToInt(sContentid),[])=true then
begin
tblUsers.Locate('userid',iuserid,[]);
tblContent.Locate('contentid',StrToInt(sContentid),[]);
sSubject:=copy(tblContent['subject'],1,1);

if Pos(sSubject,tblUsers['subjects'])=0 then      //VALIDATION :DOES THIS USER DO THIS SUBJECT
begin
ShowMessage('You can not save this set becuase you do not do this subject');
end
else
if tblContent['userid']<>iUserId then
begin

frmStudy.lstSection.Items.Add(tblContent['section']+'#'+inttostr(tblContent['userid']));
ShowMessage('set saved you will be able to view it in your study page');

end
else
begin
ShowMessage('This content belongs to you');   //ERROR MESSAGE
end;//content belongs to this user
end
else
begin
 ShowMessage('contentid you serached does not exist'); //ERROR MESSAGE
end;
end //valid contentid
else
begin
ShowMessage('invalid contentid');
end;//invalid cotentid
end;//with dmcomlearning
end;//end of save button


procedure TfrmSearch.btnSearchClick(Sender: TObject); //BTN SEARCH : DISPLAYS ALL RECORDS THAT MATCH SELECTED CRITERIA
var
sConcept,sSubject,sGrade:string;

begin
 sConcept:=edtsearch.Text;
 if cmbSubjects.ItemIndex>=0 then     //checking if somethig is selected in grade combobox
 begin
  sSubject:=cmbSubjects.Text;
 end;

 if cmbGrade.ItemIndex>=0 then     //checking if somethig is selected in grade combobox
 begin
 sGrade:= cmbGrade.text;
 end;



  with dmComLearning do begin
 if chkFilter.Checked then      //CHECKING IF IT WAS FILTERED
 begin

 if (cmbSubjects.ItemIndex<0) and (cmbGrade.ItemIndex<0) then
 begin
ShowMessage('please select a grade or subject to filter or disable filter'); //ERROR MESSAGE
 end
 else
 if cmbGrade.ItemIndex<0 then   //NO GRADE FILTER SELECTED
 begin
   qryComLearning.Close;
  qryComLearning.SQL.Clear;
  qryComLearning.SQL.Add('Select contentid,concept,subject from tblcontent where subject="'+sSubject+'" AND concept like "%'+sConcept+'%" ');
  qryComLearning.Open;
 end
 else
 if cmbSubjects.ItemIndex<0 then  //NO SUBJECT FILTER SELECTED
 begin
   qryComLearning.Close;
  qryComLearning.SQL.Clear;
  qryComLearning.SQL.Add('Select contentid,concept,subject   from tblcontent,tbluser where tblcontent.userid=tbluser.userid and grade='+sGrade+' and concept like "%'+sConcept+'%" ');
  qryComLearning.Open;
 end
 else
 begin
      qryComLearning.Close;
  qryComLearning.SQL.Clear;
  qryComLearning.SQL.Add('Select contentid,concept,subject  from tblcontent,tbluser where tblcontent.userid=tbluser.userid and grade='+sGrade+' and subject="'+sSubject+'" and concept like "%'+sConcept+'%" ');
  qryComLearning.Open;
 end;

 end
 else
 begin

 dmComLearning.tblContent.Open;
   qryComLearning.Close;
  qryComLearning.SQL.Clear;
  qryComLearning.SQL.Add('Select contentid,concept,subject  from tblcontent where concept like "%'+sConcept+'%"');
  qryComLearning.Open;

 end; //if search filter is enabled
end; //if filter enabled
 end;

procedure TfrmSearch.btnReportClick(Sender: TObject);       //BTNREPORT :ALLOWS USER TO PROVIDE FEED BACK ON CONTENT
var
tfile:textfile;
sline,sContentid:string;
begin
sContentid:=InputBox('Report','Contentid of the concept you want to report ','');

if (objv.CheckEmpty(sContentid)=true) or (objv.ValidNumber(sContentid)=false) then
begin
 ShowMessage('invalid contentid');
end
else
if dmComLearning.tblContent.Locate('contentid',StrToInt(sContentid),[])=false then
begin
ShowMessage('the contentid you searched does not exist');
end
else
begin
dmComLearning.tblContent.Locate('contentid',StrToInt(sContentid),[]);
 sline:=InputBox('REPORT','why are you reporting this record','');

 if objv.CheckEmpty(sline)=true then    //VALIDATION : BLANK FIELDS
 begin
  ShowMessage('report discarded');
 end
 else
 begin
 AssignFile(tfile,'Reports.txt');
 Append(tfile);
 Writeln(tfile,sContentid+'#'+sline);
 CloseFile(tfile);
  ShowMessage('Thank you for your help, making this platform a better space');
 end;
end;
end;

procedure TfrmSearch.btnResetClick(Sender: TObject);
var
suserid:string;
begin                        //resets the dgbgrid
with dmComLearning do
begin
suserid:=Copy(frmWelcome.lblusername.Caption,pos('#',frmWelcome.lblusername.Caption)+1);

 qryComLearning.Close;
  qryComLearning.SQL.Clear;
  qryComLearning.SQL.Add('Select contentid,concept,subject from tblcontent where userid<>'+suserid+'');
  qryComLearning.Open;
end;
end;

end.
