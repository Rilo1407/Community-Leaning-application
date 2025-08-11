unit clsLogin_u;

interface
type
  TLogin = class(TObject)

  private
    fName:string;
    fSurname:string;
    fPassword:string;
    fUserid:integer;
  public
      constructor create (sName:string;sSurname:string;sPassword:string);
       Function DetermineValidity(sUsername:string;sPass:string):boolean;
       function GetName :string;
       function GetPass:string;
       Function GetSurname:string;
       Function toString:string;

       Procedure SetUserId(iUserid:integer);
       Procedure GenerateSubjects;


  end;

implementation
USES SysUtils,dmComlearning_u,frmsearch_u,frmstudy_u;
{ TLogin }

constructor TLogin.create(sName, sSurname ,sPassword: string);
begin
fName:=sName;
fPassword:= sPassword;
fSurname:= sSurname;
fUserid:=0;
end;

function TLogin.DetermineValidity(sUsername:string;sPass:string): boolean;
var
sUser:string;
begin
sUser:=fName[1]+fSurname[1]+Copy(fName,2);
if (sUser=sUsername) and (fPassword=sPass) then      //VALIDATION FOR LOGIN
begin
 Result:=true;
end
else
begin
Result:= false;
end;
end;


procedure TLogin.GenerateSubjects;
var
ipos:integer;
scopy:string;
begin
with dmComLearning do
begin

if Pos('E',tblUsers['subjects'])>0 then   //adding subjects to study combobox
begin
frmStudy.cmbSubject.Items.Add('English');  //adds english to study combobox
frmSearch.cmbSubjects.Items.Add('English');
end;
if Pos('I',tblUsers['subjects'])>0 then   //adds IT to study combobox
begin
frmStudy.cmbSubject.Items.Add('IT');
frmSearch.cmbSubjects.Items.Add('IT');
end;
if Pos('P',tblUsers['subjects'])>0 then   //adds physics to study combobox
begin
frmStudy.cmbSubject.Items.Add('Physics');
frmSearch.cmbSubjects.Items.Add('Physics');
end;
if Pos('L',tblUsers['subjects'])>0 then   //adds Life Science to study combobox
begin
frmStudy.cmbSubject.Items.Add('Life Science');
frmSearch.cmbSubjects.Items.Add('Life Science');
end;
if Pos('T',tblUsers['subjects'])>0 then   //adds Technology to study combobox
begin
frmStudy.cmbSubject.Items.Add('Technology');
frmSearch.cmbSubjects.Items.Add('Technology');
end;
if Pos('A',tblUsers['subjects'])>0 then   //adds Accounting to study combobox
begin
frmStudy.cmbSubject.Items.Add('Accounting');
frmSearch.cmbSubjects.Items.Add('Accounting');
end;
if Pos('H',tblUsers['subjects'])>0 then   //adds History to study combobox
begin
frmStudy.cmbSubject.Items.Add('History');
frmSearch.cmbSubjects.Items.Add('History');
end;
if Pos('B',tblUsers['subjects'])>0 then   //adds Business Studies to study combobox
begin
frmStudy.cmbSubject.Items.Add('Business Studies');
frmSearch.cmbSubjects.Items.Add('Business Studies');
end;
if Pos('C',tblUsers['subjects'])>0 then   //adds CAT to study combobox
begin
frmStudy.cmbSubject.Items.Add('CAT');
frmSearch.cmbSubjects.Items.Add('CAT');
end;
if Pos('U',tblUsers['subjects'])>0 then   //adds Urdu to study combobox
begin
frmStudy.cmbSubject.Items.Add('Urdu');
frmSearch.cmbSubjects.Items.Add('Urdu');
end;
if Pos('Z',tblUsers['subjects'])>0 then   //adds Zulu to study combobox
begin
frmStudy.cmbSubject.Items.Add('Zulu');
frmSearch.cmbSubjects.Items.Add('Zulu');
end;
if Pos('G',tblUsers['subjects'])>0 then   //adds Geography to study combobox
begin
frmStudy.cmbSubject.Items.Add('Geography');
frmSearch.cmbSubjects.Items.Add('Geography');
end;



end;//with dmcomlearning
end;

function TLogin.GetName: string;               //GETNAME
begin
Result:=fName;
end;

function TLogin.GetPass: string;             //GETPASS
begin
Result:=fPassword;
end;

function TLogin.GetSurname: string;         //GETSURNAME
begin
Result:=fSurname;
end;



procedure TLogin.SetUserId(iUserid: integer);      //Set Method
begin
fUserid:=iUserid;
end;

function TLogin.toString: string;          //TOSTRING
begin
Result:='Welcome back!'+#13+'User : '+IntToStr(fUserid)+' '+fName+' '+fSurname+#13+'We hope your learning experience with us will be a fruitful one'+ #13+'Pass :'+fPassword ;
end;

end.
