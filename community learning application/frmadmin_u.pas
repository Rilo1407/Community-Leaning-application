unit frmadmin_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, jpeg, ComCtrls, Buttons,dmComLearning_u,
  Spin;

type
  TfrmAdmin = class(TForm)
    pgcDbGrids: TPageControl;
    tbsUsers: TTabSheet;
    tbsContent: TTabSheet;
    tbsTests: TTabSheet;
    tbsQueries: TTabSheet;
    Panel5: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    DGBusers: TDBGrid;
    Panel26: TPanel;
    dgbContent: TDBGrid;
    Panel27: TPanel;
    dgbTests: TDBGrid;
    Panel28: TPanel;
    dgbQueries: TDBGrid;
    Panel2: TPanel;
    BtnDeleteUser: TButton;
    Panel3: TPanel;
    panel29: TPanel;
    btnDelete: TButton;
    btnDeleteSet: TButton;
    Panel30: TPanel;
    memdisplay: TMemo;
    redOutputFeedback: TRichEdit;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel35: TPanel;
    btnReadFeedback: TButton;
    spnstudent: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel34: TPanel;
    btnNameSortD: TButton;
    btnSurnameSortA: TButton;
    btnSortNameD: TButton;
    btnSurnameSortD: TButton;
    Panel33: TPanel;
    btnstudentS: TButton;
    Label4: TLabel;
    btnDeletetest: TButton;
    btnDeleteTestUser: TButton;
    btnDeleteTestContentid: TButton;
    btnDeleteTestdate: TButton;
    Panel36: TPanel;
    LBLdeletefromtests: TLabel;
    Panel37: TPanel;
    btntestsearch: TButton;
    spnTestsearch: TSpinEdit;
    Label5: TLabel;
    Panel1: TPanel;
    spncontentid: TSpinEdit;
    spncontentidsearch: TButton;
    Label6: TLabel;
    Panel6: TPanel;
    btnView: TButton;
    Panel7: TPanel;
    Panel10: TPanel;
    btnReports: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel4: TPanel;
    btnTopAchievers: TButton;
    btnLearnerAVg: TButton;
    btnRiskLearners: TButton;
    Panel12: TPanel;
    btnSubjectPreformance: TButton;
    Panel13: TPanel;
    Label13: TLabel;
    Panel14: TPanel;
    Label14: TLabel;
    Panel16: TPanel;
    lblDefinition: TLabel;
    Button1: TButton;
    btnAverage: TButton;
    btnMax: TButton;
    btnmin: TButton;
    Panel11: TPanel;
    btnSearchtestDate: TButton;
    dtpTest: TDateTimePicker;
    Panel15: TPanel;
    Label15: TLabel;
    redOutTest: TRichEdit;

    procedure pgcDbGridsChange(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDeleteSetClick(Sender: TObject);
    procedure btnTopAchieversClick(Sender: TObject);
    procedure btnRiskLearnersClick(Sender: TObject);
    procedure btnSubjectPreformanceClick(Sender: TObject);
    procedure btnSortNameDClick(Sender: TObject);
    procedure btnNameSortDClick(Sender: TObject);
    procedure btnSurnameSortDClick(Sender: TObject);
    procedure btnSurnameSortAClick(Sender: TObject);
    procedure btnstudentSClick(Sender: TObject);
    procedure btnDeletetestClick(Sender: TObject);
    procedure spncontentidsearchClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure btntestsearchClick(Sender: TObject);
    procedure btnLearnerAVgClick(Sender: TObject);
    procedure btnSearchtestDateClick(Sender: TObject);
    procedure btnReadFeedbackClick(Sender: TObject);
    procedure btnDeleteTestdateClick(Sender: TObject);
    procedure btnDeleteTestUserClick(Sender: TObject);
    procedure btnDeleteTestContentidClick(Sender: TObject);
    procedure btnMaxClick(Sender: TObject);
    procedure btnminClick(Sender: TObject);
    procedure btnAverageClick(Sender: TObject);
    procedure BtnDeleteUserClick(Sender: TObject);






  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmin: TfrmAdmin;

implementation

{$R *.dfm}


procedure TfrmAdmin.btnDeleteClick(Sender: TObject);
var                                                   //btnDelete
iUserid,iContentid2,iContentid:integer;
bNextRecordFound:boolean;
sSection:string;
begin    //deletes a single record from content tabel
bNextRecordFound:=false;

 with dmComLearning do begin
iContentid:=tblContent['contentid'];
sSection:=tblContent['section'];
iUserid:=tblContent['userid'];


tblContent.First;
while not tblContent.Eof and (bNextRecordFound=false) do
begin
if (tblContent['section']=sSection) and (tblContent['contentid']<>iContentid) and (tblContent['userid']=iUserid) then
begin
bNextRecordFound:=true;
iContentid2:=tblContent['contentid'];
end;
  tblContent.Next;
end;  //if there is another record in set


if bNextRecordFound=false then
begin


  tblTests.First;              //deletes tests
  while not tblTests.Eof do
  begin
    if tblTests['contentid']=iContentid then
    begin
     tblTests.Delete;
    end
    else
    begin
    tblTests.Next;
    end; //meets criteia
  end;//while

  tblTests.Refresh;
   ShowMessage('section :'+ssection+' deleted');

end   //if there is no contentid to replace the old contentid
else
begin

   tblTests.First;                  //updates tests
  while not tblTests.Eof do
  begin
    if tblTests['contentid']=icontentid then
    begin
     tblTests.edit;
     tblTests['contentid']:=iContentid2;
     tblTests.Post;
    end
    else
    begin
    tblTests.Next;
    end; //meets criteia
  end;//while

  tblTests.Refresh;


  ShowMessage('contentid '+inttostr(iContentid)+' deleted');
 end; //if is a contentid to replace the old contentid


   tblContent.Locate('contentid',iContentid,[]);
   tblContent.Delete;
 tblContent.Refresh;


end;//with dmco
end;//end btndelete

procedure TfrmAdmin.btnDeleteSetClick(Sender: TObject);
var                                                   //BTN DELETE SET
ssection:string;
iuserid :integer;

begin    //deletes an entire section from tabel
with dmComLearning do begin
iUserId:= tblcontent['userid'];
 ssection:=tblContent['section'];       //extraction of section to be deleted

  tblContent.First;
  while not tblContent.Eof do               //searches for tests linked to this section
  begin

  if (tblContent['userid']=iuserid) and (tblContent['section']=ssection) then
  begin

        tblTests.First;
        while not tblTests.Eof do
        begin

        if (tblTests['contentid']=tblContent['contentid'])  then
        begin
          tblTests.Delete;
        end
        else
        begin
        tblTests.Next;
        end; //if meets criteria

        end;  //while
        tblTests.Refresh;
      tblContent.Delete;
  end
  else
  begin
    tblContent.Next;
  end; //if meets criteria
  end; //while content
  tblContent.Refresh;

  ShowMessage('section :'+ssection+' sucessfully deleted');


end; //with dmcom
end;//end delete set

procedure TfrmAdmin.btnDeletetestClick(Sender: TObject);   //BTN DELETE TEST
begin
dmComLearning.tblTests.Delete;
dmComLearning.tblTests.Refresh;
end;

procedure TfrmAdmin.btnDeleteTestContentidClick(Sender: TObject); //btn Delete contentid
Var
icontentid:integer;                   //BTNDELETE CONTENTID
begin

with dmComLearning do
 begin

 icontentid:=tblcontent['contentid'];

 tblTests.First;
 while not tblTests.Eof do
 begin
   if  icontentid=tbltests['contentid'] then       //if meet criteria delete
   begin
    tblTests.Delete;
   end
   else
   begin
    tblTests.Next;
   end;   //if else
 end;  //while
tblTests.Refresh;

 end;  //with dmcomlearning
end;

procedure TfrmAdmin.btnDeleteTestdateClick(Sender: TObject);  //BtnDelete tests date
Var
dDate:tDatetime;
begin


with dmComLearning do
 begin
 dDate:=tbltests['testdate'];

 tblTests.First;
 while not tblTests.Eof do
 begin
   if  dDate=tbltests['testdate'] then       //if meet criteria delete
   begin
    tblTests.Delete;
   end
   else
   begin
    tblTests.Next;
   end;   //if else
 end;
tblTests.Refresh;

 end;  //with dmcomlearning

end;

procedure TfrmAdmin.btnDeleteTestUserClick(Sender: TObject);  //deletes a users tests
Var
iuserid:string;                                 //BTNDELETE USER ID
begin

with dmComLearning do
 begin
 iuserid:=tbltests['userid'];

 tblTests.First;
 while not tblTests.Eof do
 begin
   if  iuserid=tbltests['userid'] then       //if meet criteria delete
   begin
    tblTests.Delete;
   end
   else
   begin
    tblTests.Next;
   end;   //if else
 end;
tblTests.Refresh;

 end;  //with dmcomlearning


end;

procedure TfrmAdmin.BtnDeleteUserClick(Sender: TObject); //BtnDelete user
var
iUserid:integer;
begin
with dmComLearning do begin
iUserid:=tblUsers['userid'];

tblContent.First;
while NOT tblContent.Eof do
begin

if tblContent['userid']=iUserid then
begin

tbltests.First;
while not tblTests.Eof do
begin                         //deletes tests
  if (tblTests['contentid']=tblContent['contentid']) or (tblTests['userid']=iuserid) then
  begin
   tblTests.Delete;
  end
  else
  begin
   tblTests.Next;
  end; //if

end;//while
 tblTests.Refresh;

 tblContent.Delete;  //deletes content
end
else
begin
tblContent.Next;
end; //if criteria content

end;//while content
tblContent.Refresh;


tblUsers.Delete;
tblUsers.Refresh;
end; //dm com
end; //end delete user

procedure TfrmAdmin.btnLearnerAVgClick(Sender: TObject);  //BTNLEANER AVERAGES
begin
with dmComLearning do
begin
   qryComLearning.SQL.Clear;
   qryComLearning.close;
qryComLearning.SQL.Add('Select userid,format(avg(score),"0.00") as [learner average] from  tbltests group by userid ');
qryComLearning.open;
end;

end;

procedure TfrmAdmin.btnMaxClick(Sender: TObject);   //BTNMAX show highest scores for each test
begin
with dmComLearning do
begin
   qryComLearning.SQL.Clear;
   qryComLearning.close;
qryComLearning.SQL.Add('Select contentid, format(MAX(score),"0.00") as [highest testscore] from tbltests  group by contentid  ');
qryComLearning.open;
end;
end;

procedure TfrmAdmin.btnminClick(Sender: TObject);          //btnmin : show lowest scores for each test
begin
with dmComLearning do
begin
   qryComLearning.SQL.Clear;
   qryComLearning.close;
qryComLearning.SQL.Add('Select contentid, format(MIN(score),"0.00") as [lowest testscore] from tbltests  group by contentid ');
qryComLearning.open;
end;
end;

procedure TfrmAdmin.btnRiskLearnersClick(Sender: TObject);      //BTNrisk learners
begin

with dmComLearning do
begin
   qryComLearning.SQL.Clear;
   qryComLearning.close;
qryComLearning.SQL.Add('Select userid,format(avg(score),"0.00") as [learner average] from  tbltests group by userid having avg(score)<40  ');
qryComLearning.open;
end;

end;

procedure TfrmAdmin.btnSearchtestDateClick(Sender: TObject);        //Shows tests on a specifc date
var
ddate:tdatetime;
bfound:boolean;                  //BTN SEARCH TEST DATES
begin

 with dmComLearning do
begin
ddate:=dtpTest.DateTime;

if ddate>now then
begin
ShowMessage('invalid date range'); //error message
end
else
if tblTests.Locate('testdate',datetostr(ddate),[])=false then
begin
ShowMessage('No tests found on this date'); //error message 
end
else
begin

redOutTest.Clear;
redOutTest.Lines.Add('Tests on :'+DateToStr(ddate));
redOutTest.Lines.Add('TestNum'+'       '+'Score'+'       '+'Userid');


tblTests.First;
while not tblTests.Eof do
begin
 if tblTests['testdate']=datetostr(ddate) then
 begin

   redOutTest.Lines.Add(inttostr(tblTests['testnum'])+#9+'        '+inttostr(tblTests['score'])+#9+#9 +inttostr(tblTests['userid']));
 end;//if on that date
 tblTests.Next;
end; //while


end;
end;   //with dmCom



end;

procedure TfrmAdmin.btnSubjectPreformanceClick(Sender: TObject);  //Btn subject preformance
begin

with dmComLearning do
begin
   qryComLearning.SQL.Clear;
   qryComLearning.close;
qryComLearning.SQL.Add('Select tblcontent.subject,format(avg(score),"0.00") as [average]  from tbltests,tblcontent where tbltests.userid=tblcontent.userid group by tblcontent.subject ');
qryComLearning.open;
end;

end;

procedure TfrmAdmin.btnTopAchieversClick(Sender: TObject);//BTN TOP ACHEIVERS
begin
with dmComLearning do
begin
   qryComLearning.SQL.Clear;
   qryComLearning.close;
qryComLearning.SQL.Add('Select userid,format(avg(score),"0.00") as [learner average] from  tbltests group by userid having avg(score)>80 ');
qryComLearning.open;
end;

end;



procedure TfrmAdmin.btnViewClick(Sender: TObject);     //BTN VIEW RECORD
begin
lblDefinition.Visible:=true;
lblDefinition.Caption:=dmComLearning.tblContent['definition'];
end;

procedure TfrmAdmin.btnSurnameSortAClick(Sender: TObject);   //btnsortnamea
begin
dmComLearning.tblUsers.Sort:='surname ASC';
end;



procedure TfrmAdmin.btnAverageClick(Sender: TObject);    //btnAverage    show average scores for each test
begin
  with dmComLearning do
begin
   qryComLearning.SQL.Clear;
   qryComLearning.close;
qryComLearning.SQL.Add('Select contentid, format(AVG(score),"0.00") as [average testscore] from tbltests  group by contentid  ');
qryComLearning.open;
end;
end;



procedure TfrmAdmin.btnSortNameDClick(Sender: TObject);  //btnsortnamed
begin
dmComLearning.tblUsers.Sort:='name DESC';
end;



procedure TfrmAdmin.btnSurnameSortDClick(Sender: TObject);   //btnsortsurnamed
begin
dmComLearning.tblUsers.Sort:='surname DESC';
end;

procedure TfrmAdmin.btntestsearchClick(Sender: TObject);      //BTN TESTS SEARCH
 var
sTestNum:string;
begin
sTestNum:=IntToStr(spnTestsearch.Value);
with dmComLearning do
begin

if tblTests.Locate('testNum',StrToInt(sTestNum),[])=true then
begin
tblTests.Locate('testNum',StrToInt(sTestNum),[]);

end
else
begin
 ShowMessage('TestNum does not exist');
end;//user id non existant
end;//with dmcom
end;

procedure TfrmAdmin.btnNameSortDClick(Sender: TObject);   //btnsortdescending
begin
dmComLearning.tblUsers.Sort:='name ASC';
end;

procedure TfrmAdmin.btnReadFeedbackClick(Sender: TObject); //BTN FEEDBACK
var
tfile:textfile;
sline:string;
begin
redOutputFeedback.Lines.Clear;
redOutputFeedback.Lines.Add('Feedback # userid');
AssignFile(tfile,'Feedback.txt');
Reset(tfile);

while not Eof(tfile) do
begin
  Readln(tfile,sline);
  redOutputFeedback.Lines.Add(sline);
end;
CloseFile(tfile);

end;

procedure TfrmAdmin.btnReportsClick(Sender: TObject);   //BTN reports
var
tfile:textfile;
sline:string;
begin
memdisplay.Lines.Clear;
memdisplay.Lines.Add('Contentid # report');
AssignFile(tfile,'Reports.txt');
Reset(tfile);

while not Eof(tfile) do
begin
  Readln(tfile,sline);
  memdisplay.Lines.Add(sline);
end;
CloseFile(tfile);

end;

procedure TfrmAdmin.btnstudentSClick(Sender: TObject);      //btnSearchStudent
var
suserid:string;
begin
suserid:=IntToStr(spnstudent.Value);
with dmComLearning do
begin

if tblUsers.Locate('userid',StrToInt(suserid),[])=true then
begin
tblUsers.Locate('userid',StrToInt(suserid),[]);

end
else
begin
 ShowMessage('userid does not exist');
end;//user id non existant
end;//with dmcom
end;


//end delete set

procedure TfrmAdmin.pgcDbGridsChange(Sender: TObject);           //ON PAGE CHANGE
begin

if  pgcDbGrids.ActivePageIndex=3  then
begin

  with dmComLearning do
  begin
    qryComLearning.SQL.Clear;
    qryComLearning.Close;
    qryComLearning.SQL.Add('select * from tbluser') ;
      qryComLearning.Open;
  end;

end;

end;




procedure TfrmAdmin.spncontentidsearchClick(Sender: TObject); //BTN SEARCH CONTENT ID
var
scontentid:string;
begin
scontentid:=IntToStr(spncontentid.Value);
with dmComLearning do
begin

if tblContent.Locate('contentid',StrToInt(scontentid),[])=true then
begin
tblContent.Locate('contentid',StrToInt(scontentid),[]);

end
else
begin
 ShowMessage('contentid does not exist');
end;//user id non existant
end;//with dmcom
end;

end.
