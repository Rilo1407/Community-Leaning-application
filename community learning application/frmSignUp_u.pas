unit frmSignUp_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, jpeg, frmLogin_u,dmComLearning_u,Validation_u,
  ComCtrls;

type
  TfrmSignUp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    imgBackground: TImage;
    Panel6: TPanel;
    btbLogin: TBitBtn;
    btbSignUp: TBitBtn;
    Label1: TLabel;
    Panel7: TPanel;
    edtName: TEdit;
    lblname: TLabel;
    edtSurname: TEdit;
    lblsurname: TLabel;
    Panel9: TPanel;
    lstGrade: TListBox;
    Panel8: TPanel;
    lblpass: TLabel;
    edtPassword: TEdit;
    lblgrade: TLabel;
    Label7: TLabel;
    Panel10: TPanel;
    btbHelp: TBitBtn;
    Label5: TLabel;
    pgcSubjects: TPageControl;
    tbs1: TTabSheet;
    Panel12: TPanel;
    tbs2: TTabSheet;
    Panel13: TPanel;
    tbs3: TTabSheet;
    Panel14: TPanel;
    chkIT: TCheckBox;
    chkPhysics: TCheckBox;
    chkEnglish: TCheckBox;
    chkLifeScience: TCheckBox;
    chkHistory: TCheckBox;
    chkAccounting: TCheckBox;
    chkBussiness: TCheckBox;
    chkZulu: TCheckBox;
    chkGeography: TCheckBox;
    CHKTechnology: TCheckBox;
    chkCAT: TCheckBox;
    chkUrdu: TCheckBox;
    procedure btbLoginClick(Sender: TObject);
    procedure btbSignUpClick(Sender: TObject);
    procedure btbHelpClick(Sender: TObject);

  private
    { Private declarations }
  public
 function fullyVerified(sline:string;sName:string;bGrade:boolean;sPassword:string;sSurname:string):boolean;
    { Public declarations }
  end;

var
  frmSignUp: TfrmSignUp;
    objv:Tvalidation;

implementation


{$R *.dfm}

procedure TfrmSignUp.btbLoginClick(Sender: TObject);
begin    //login button
frmSignUp.Hide;
frmLogin.Show;
end;

procedure TfrmSignUp.btbSignUpClick(Sender: TObject);
var
sName,sSurname,sPassword,sUserName,sLine,sSubject:string;
iGrade,iuserid,iCL:integer;
bGrade:boolean;
begin //signUp button
bGrade:=true;
sLine :='';                    //Extraction of details
sName:=edtName.Text;
sSurname:=edtSurname.Text;
sPassword:=edtPassword.Text;
iCL:=0;

if lstGrade.ItemIndex=-1 then     //checking if grade has been extracted
begin
bGrade:=false;
end
else
begin
  iGrade:= strtoint(lstGrade.Items[lstGrade.ItemIndex]);
end;

if chkEnglish.Checked=True then       //Extracting subjects
begin
 if iCL=0 then
 begin
 sLine:= sLine+'E';
 Inc(iCL);
 end
 else
 begin
  sLine:= sLine+','+'E';
 Inc(iCL);
 end;
end; //english

if chkIT.Checked=True then
begin
 if iCL=0 then
 begin
 sLine:= sLine+'I';
 Inc(iCL);
 end
 else
 begin
  sLine:= sLine+','+'I';
 Inc(iCL);
 end;
end; //IT

if chkPhysics.Checked=True then
begin
 if iCL=0 then
 begin
 sLine:= sLine+'P';
 Inc(iCL);
 end
 else
 begin
 sLine:= sLine+','+'P';
 Inc(iCL);
 end;
end;   //physics

if chkLifeScience.Checked=True then
begin
 if iCL=0 then
 begin
 sLine:= sLine+'L';
 Inc(iCL);
 end
 else
 begin
  sLine:= sLine+','+'L';
 Inc(iCL);
 end;
end;//life science


if CHKTechnology.Checked=True then
begin
 if iCL=0 then
 begin
 sLine:= sLine+'T';
 Inc(iCL);
 end
 else
 begin
  sLine:= sLine+','+'T';
 Inc(iCL);
 end;
end;//TECH


if chkAccounting.Checked=True then
begin
 if iCL=0 then
 begin
 sLine:= sLine+'A';
 Inc(iCL);
 end
 else
 begin
  sLine:= sLine+','+'A';
 Inc(iCL);
 end;
end;//Accounting


if chkHistory.Checked=True then
begin
 if iCL=0 then
 begin
 sLine:= sLine+'H';
 Inc(iCL);
 end
 else
 begin
  sLine:= sLine+','+'H';
 Inc(iCL);
 end;
end;//HISTORY


if chkBussiness.Checked=True then
begin
 if iCL=0 then
 begin
 sLine:= sLine+'B';
 Inc(iCL);
 end
 else
 begin
  sLine:= sLine+','+'B';
 Inc(iCL);
 end;
end;//BUSINESS STUDIES


if chkCAT.Checked=True then
begin
 if iCL=0 then
 begin
 sLine:= sLine+'C';
 Inc(iCL);
 end
 else
 begin
  sLine:= sLine+','+'C';
 Inc(iCL);
 end;
end;//CAT


if chkUrdu.Checked=True then
begin
 if iCL=0 then
 begin
 sLine:= sLine+'U';
 Inc(iCL);
 end
 else
 begin
  sLine:= sLine+','+'U';
 Inc(iCL);
 end;
end;//URDU


if chkZulu.Checked=True then
begin
 if iCL=0 then
 begin
 sLine:= sLine+'Z';
 Inc(iCL);
 end
 else
 begin
  sLine:= sLine+','+'Z';
 Inc(iCL);
 end;
end;//ZULU


if chkGeography.Checked=True then
begin
 if iCL=0 then
 begin
 sLine:= sLine+'G';
 Inc(iCL);
 end
 else
 begin
  sLine:= sLine+','+'G';
 Inc(iCL);
 end;
end;//GEOGRAPHY
    //end of ifelse checking subjects

if fullyVerified(sline,sName,bGrade,sPassword,sSurname)=true then    //CHECKING IF DETAILS ARE VAILD
begin

if (iCL<3) OR (iCL>8) then                        //VERIFIES NUMBER OF SUBJECTS FOR STUDENST
begin
ShowMessage('you have a minimum of 3 subjects and a maximum of 8 subjects');
end
else
begin
with dmComLearning do
begin
tblUsers.Last;
iuserid:=tblUsers['userid']+1;
sSubject:=sLine;


tblUsers.Insert;

tblUsers['userid']:=iuserid;
tblUsers['name']:=sName;          //Inserting user into system
tblUsers['surname']:=sSurname;
tblUsers['password']:=sPassword;
tblUsers['grade']:=iGrade;
tblUsers['subjects']:=sSubject;

tblUsers.Post;
tblUsers.Refresh;


sUserName:= sName[1]+sSurname[1]+Copy(sName,2); //creates Username
end;  //with dmComLearning



ShowMessage('Your Username is '+sUserName);
frmSignUp.Hide;
frmLogin.Show;
end; //if subject count is okay


end;//if fully verified
end;//end of signUp



procedure TfrmSignUp.btbHelpClick(Sender: TObject);
var
tFile:textfile;
sline :string;
begin //help button

if FileExists('SignUpHelp.txt') then
begin
AssignFile(tFile,'SignUpHelp.txt');
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

end; //end of help button




function TfrmSignUp.fullyVerified(sline, sName: string; bGrade: boolean;    //VALIDATION
  sPassword, sSurname: string): boolean;
begin  //checking if everthing is filled in
Result:=true;
if (objv.CheckEmpty(sline)=True) or (objv.CheckEmpty(sName)=true) or (objv.CheckEmpty(sPassword)=true) or (objv.CheckEmpty(sSurname)=true) or (bGrade=false) then //CHECKS IF THE FIELDS ARE EMPTY
begin
 Result:= false;
 ShowMessage('Please check that you have all information filled in');
end;

if (objv.ValidString(sName)=false) or (objv.ValidString(sSurname)=false)  then //VALIDATES NAME ND SURNAME
begin
 Result:=false;
 ShowMessage('Please check you have entered your correct name and surname');
end;

WITH dmComLearning do     //Checks for users with similar data
begin

tblUsers.First;
while not tblUsers.Eof do
begin                         //IF TWO USERS DATA ARE SIMILAR
if (sName=tblUsers['name']) and (copy(sSurname,1,1)=copy(tblUsers['surname'],1,1)) and (sPassword=tblUsers['password']) then
begin
 Result:=false;
 ShowMessage('Cannot create an account try using a different password');
end;
  tblUsers.Next;
end;
end;//dmcom



end;







end.
