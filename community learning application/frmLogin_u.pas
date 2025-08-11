unit frmLogin_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons,frmWelcome_u,clsLogin_u,dmComLearning_u,math,
  pngimage,validation_u;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    imgBackground: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    pnlDisplay: TPanel;
    pnlBackEdits1: TPanel;
    lblUserName: TLabel;
    lblpasdword: TLabel;
    edtUserName: TEdit;
    edtPassword: TEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    btbBack: TBitBtn;
    pnlBackLnHbtn: TPanel;
    btbLogin: TBitBtn;
    BTBhelp: TBitBtn;
    blbAdminText: TLabel;
    imgView: TImage;
    procedure btbBackClick(Sender: TObject);
    procedure btbLoginClick(Sender: TObject);
    procedure BTBhelpClick(Sender: TObject);
    procedure btnAdminClicked (sender: Tobject);
    procedure imgViewMouseEnter(Sender: TObject);
    procedure imgViewMouseLeave(Sender: TObject);


  private
    { Private declarations }
  public

  end;

var
objv:Tvalidation;


  frmLogin: TfrmLogin;
  ObjLogin: TLogin;

  edtAdminLogin: TEdit;  //DYNAMIC EDITBOX
  btnAdminLogin : Tbutton;  //DYNAMIC BUTTON

implementation
uses frmSignUp_u,frmStudy_u,frmSearch_u,frmadmin_u;

{$R *.dfm}

procedure TfrmLogin.btbLoginClick(Sender: TObject);
var
arrCmbSection:array[1..100] of string;
iuserid,i,icsection:integer;
sUsername,sPassword,sCorrectUsername,sCorrectPass:string;
bCorrect,bfound,bRepeat:boolean;
begin  //Login  BUTTON
bfound:=false;
bCorrect:=false;                         //intialization
sUsername:=edtUserName.Text;
sPassword:=edtPassword.Text;



if (sUsername='admin') and (sPassword='admin') then
begin
lblUserName.Hide;
lblpasdword.Hide;
edtPassword.Hide;
edtUserName.Hide;
imgView.Hide;
btnAdminLogin:=TButton.Create(btbLogin);
edtAdminLogin:=TEdit.Create(btbLogin);

with edtAdminLogin do begin

 Top:=72;
 left:=126;               //DYNAMIC COMPONENT DETAILS
 height:=21;
 Width:=211;
 PasswordChar:='*';

 Parent:=pnlBackEdits1;
end;


with btnAdminLogin do
begin
Caption:='Admin Login';         //DYNAMIC COMPONENT DETAILS
Height:=33;
Width:=81;

top:=16;
left:=8;

Parent:=pnlBackLnHbtn;
OnClick:=frmLogin.btnAdminClicked;
end;  //with btn admin login


end //if not admin login
else
if (objv.CheckEmpty(sPassword)=true) or (objv.CheckEmpty(sUsername)=true) then  //if fields are blank
begin
pnlDisplay.Caption:='please full in all fields';
end
else
begin//fields fulled in

with dmComLearning do begin
tblUsers.First;
while not tblUsers.Eof do
begin
ObjLogin:=TLogin.create(tblUsers['name'],tblUsers['surname'],tblUsers['password']);

if ObjLogin.DetermineValidity(sUsername,sPassword)=true then begin   //checks if username and password are correct
bfound:=true;
bCorrect:=True;

ObjLogin.GenerateSubjects;
ObjLogin.SetUserId(tblUsers['userid']);

//**********                                           //populates the combobox used for tests
  tblContent.First;
  iCsection:=0;
  while not tblContent.Eof do
  begin
  bRepeat:=false;
   if tblContent['userid']=tblUsers['userid'] then
   begin

     for i := 1 to 100 do
     begin
     if tblContent['section']=arrCmbSection[i] then
     begin
      bRepeat:=true;
     end;
     end;//for i

   if bRepeat=false then
   begin
     Inc(iCsection);
     arrCmbSection[iCsection]:= tblContent['section'];
   end;
   end;
   tblContent.Next;
  end;//while

  for i := 1 to icsection do
    begin
 frmStudy.lstSection.Items.Add(arrCmbSection[i]+'#'+inttostr(tblUsers['userid']));
    end;


//**********
for i := 1 to 100 do
  begin
    frmStudy.arrDeletedSections[i]:='';
  end;
frmStudy.iCDeletedSections:=0;

tblContent.Last;
frmStudy.lblContentid.Caption:=tblContent['contentid'];
frmWelcome.lblName.Caption:= ObjLogin.GetName;
frmWelcome.lblSurname.Caption:= ObjLogin.GetSurname;
frmWelcome.lblPass.Caption:= ObjLogin.GetPass;
frmWelcome.lblusername.Caption:= sUsername+'#'+inttostr(tblUsers['userid']);

ShowMessage(ObjLogin.toString);
frmLogin.Hide;                                     //moves to welcome page
frmWelcome.Show;

end;

tblUsers.Next;
end;//while not Eof

tblContent.First;


if bfound=false then
begin
pnlDisplay.Caption:='wrong username or password';
end;//if user input is wrong

end;//with dmComlearning
end; //if else isblank
end; //end Determine Validity

procedure TfrmLogin.btnAdminClicked(sender: Tobject);  //DYNAMIC BUTTON CODE
var
sadmincode:string;
begin
sadmincode:=edtAdminLogin.Text;
if sadmincode='qwerty' then        //ADMIN LOGIN CODE
begin
frmLogin.Hide;
frmAdmin.Show;
end
else
begin
pnlDisplay.Caption:='incorrect admin code';  //ERROR MESSAGE
end;
end;






procedure TfrmLogin.btbBackClick(Sender: TObject);
begin //back to signup
frmLogin.Hide;              //MOVES BACK TO SIGNUP
frmSignUp.Show;
end;

procedure TfrmLogin.BTBhelpClick(Sender: TObject);    //DISPLAYS HELP TEXTFILE INFORMATION
var
tFile:textfile;
sline :string;
begin //help button

if FileExists('LoginHelp.txt') then
begin
AssignFile(tFile,'LoginHelp.txt');
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



procedure TfrmLogin.imgViewMouseEnter(Sender: TObject);          //MAKES CHRACTERS IN EDTPASSWORD VISIBLE
begin
edtPassword.PasswordChar:=#0;
end;

procedure TfrmLogin.imgViewMouseLeave(Sender: TObject);  //MAKES CHRACTERS IN EDTPASSWORD HIDDEN
begin
edtPassword.PasswordChar:='#';
end;

end.
