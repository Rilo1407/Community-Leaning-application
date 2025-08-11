unit frmStudy_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, jpeg, Buttons,dmcomLearning_u,validation_u,
  ComCtrls;

type
  TfrmStudy = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    Panel6: TPanel;
    Panel7: TPanel;
    btnEditRecord: TButton;
    Panel8: TPanel;
    btnAddSet: TButton;
    Panel9: TPanel;
    btnCreateSet: TButton;
    Panel10: TPanel;
    Panel5: TPanel;
    btnTest: TButton;
    Panel2: TPanel;
    btnFlashCards: TButton;
    Panel3: TPanel;
    btnDelete: TButton;
    Panel4: TPanel;
    btnDeleteSet: TButton;
    Panel11: TPanel;
    dgbContent: TDBGrid;
    Image1: TImage;
    btbHelp: TBitBtn;
    btbBack: TBitBtn;
    cmbSubject: TComboBox;
    lblContentid: TLabel;
    pnlflashCards: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    lblconcept: TLabel;
    Label1: TLabel;
    redOutput: TRichEdit;
    Label2: TLabel;
    btnClose: TButton;
    lstSection: TListBox;
    btnPrevious: TButton;
    btnNext: TButton;
    procedure btbBackClick(Sender: TObject);
    procedure btbHelpClick(Sender: TObject);
    procedure btnCreateSetClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDeleteSetClick(Sender: TObject);
    procedure btnAddSetClick(Sender: TObject);
    procedure btnEditRecordClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure btnFlashCardsClick(Sender: TObject);
    procedure redOutputMouseEnter(Sender: TObject);
    procedure redOutputMouseLeave(Sender: TObject);
    procedure btbPreviousClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);


  private
    { Private declarations }
  public
  arrDeletedSections:array [1..100] of string ;
  iCDeletedSections:integer;
  iUserid:integer;
  iCount,iUserSection:integer;
  sSection:string;
  procedure flashcardprocessing;
  procedure refreshdatabase;
  function checkSectionExists(sSection:string;iUserid2:integer):boolean;


    { Public declarations }
  end;

var
  frmStudy: TfrmStudy;
  iUserId,iFilePos,icsection:integer;
  objv:Tvalidation;
  tFile:textfile;
sline:string;



implementation
 uses frmwelcome_u,frmlogin_u,frmTest_u;
{$R *.dfm}

procedure TfrmStudy.btbHelpClick(Sender: TObject);

var
tFile:textfile;
sline :string;
begin //study help button

if FileExists('studyhelp.txt') then
begin
AssignFile(tFile,'studyhelp.txt');
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
end; //end study help


procedure TfrmStudy.btbBackClick(Sender: TObject);
begin //BTBNEXT: MOVES TO NEXT CONCEPT IN FLASHCARDS
frmStudy.Hide;
frmWelcome.Show;
end;

procedure TfrmStudy.btnFlashCardsClick(Sender: TObject);  //BTNFLASH CARDS
var
i,j:integer;
 tfile2:textfile;
 bDeleted:boolean;
begin
i:=0;
iCount:=0;
iFilePos:=1;
bDeleted:=false;
if lstSection.ItemIndex<0  then
begin
 ShowMessage('please select a section from the section listbox');
end
else
begin
 sSection:=Copy(lstSection.Items[lstSection.ItemIndex],1,Pos('#',lstSection.Items[lstSection.ItemIndex])-1);
 iUserSection:= strtoint(Copy( lstSection.Items[lstSection.ItemIndex]   ,Pos('#',      lstSection.Items[lstSection.ItemIndex]       )+1));//extraction from combobox
 with dmComLearning do begin                   // adding records to textfile

 for j := 1 to 100 do
   begin
     if  lstSection.Items[lstSection.ItemIndex] =arrDeletedSections[j]  then
     begin
     bDeleted:=true;
     end;
   end;  //checking if section deleted

 if bDeleted=false then
 begin
   tblContent.First;
  while not tblContent.Eof do
  begin
  if (tblContent['section']=sSection) and (tblContent['userid']=iUserSection) then
  begin
  Inc(iCount);
  end;
    tblContent.Next;
  end;           //finished findind amount of records records to textfile
 flashcardprocessing;

  lblconcept.Caption:= tblContent['concept'];
  pnlflashCards.Top:= 111;
  pnlflashCards.Left:= 99;
 end
 else
 begin
  ShowMessage('section no longer exists');
 end;                //non existant
 end;//with dmcomlearning
end;//section selected

end;



procedure TfrmStudy.btnDeleteClick(Sender: TObject);   //btnDelete
var
iNewContentId,iContentid2:integer;
bFound,bNextRecordFound:boolean;
sSection,sContentid:string;
begin    //deletes a single record from content tabel
bfound:=false;
bNextRecordFound:=false;

sContentid:=inputbox('Delete a single record','select the contentid of the record you want to delete','');


with dmComLearning do begin
if (objv.CheckEmpty(scontentid)=true) or (objv.ValidNumber(scontentid)=false) then       //VALIDATION
begin
ShowMessage('please enter a valid content id'); //ERROR MESSAGE
end  //END ifelse ivalid contentid
else
if (tblContent.Locate('contentid',strtoint(scontentid),[])=false) then
begin
ShowMessage('the contentid you searched does not exist'); //ERROR MESSAGE
end  //END ifelse non existant contentid
else
begin
tblContent.Locate('contentid',strtoint(scontentid),[]);
sSection:=tblContent['section'];
if tblContent['userid']=iuserid then  //checks if record belongs to this user
begin

tblContent.First;
while not tblContent.Eof and (bNextRecordFound=false) do
begin
if (tblContent['section']=sSection) and (tblContent['contentid']<>StrToInt(sContentid)) and (tblContent['userid']=iUserid) then
begin
bNextRecordFound:=true;
iContentid2:=tblContent['contentid'];
end;
  tblContent.Next;
end;  //if there is another record in set


if bNextRecordFound=false then
begin

  {qryComLearning.SQL.Clear;               //deletes tests
  qryComLearning.SQL.Add('delete from tbltests where [contentid]='+sContentid+'');
  qryComLearning.ExecSQL;}


  tblTests.First;
  while not tblTests.Eof do
  begin
    if tblTests['contentid']=StrToInt(sContentid) then
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
   Inc(iCDeletedSections);
   arrDeletedSections[iCDeletedSections]:=sSection+'#'+IntToStr(iUserid);

end   //if there is no contentid to replace the old contentid
else
begin

 { qryComLearning.SQL.Clear;               //updates tests
  qryComLearning.SQL.Add('Update tbltests set [contentid]='+inttostr(iContentid2)+' where [contentid]='+sContentid+'');
  qryComLearning.ExecSQL; }


   tblTests.First;
  while not tblTests.Eof do
  begin
    if tblTests['contentid']=StrToInt(sContentid) then
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





 end; //if is a contentid to replace the old contentid

 tblContent.Locate('contentid',StrToInt(sContentid),[]);
  tblContent.Delete;
  tblContent.Refresh;
  {qryComLearning.SQL.Clear;    //deletes content related to section
  qryComLearning.SQL.Add('delete from tblcontent where [contentid]='+sContentid+'');
  qryComLearning.ExecSQL;}
  refreshdatabase;



end
else
begin
ShowMessage('the contentid you tried to delete does not belong to you');  //ERROR MESSAGE
end;   //if record doesnt belong to this user
end;  //END ifelse non existant contentid
end;//with dmcom learning
end;//delete single record button



procedure TfrmStudy.btnDeleteSetClick(Sender: TObject);
var                                                   //BTN DELETE SET
ssection,scontentid:string;
 i:integer;
begin    //deletes an entire section from tabel

scontentid:=inputbox('Delete a single record','select the contentid of a record in the set you want to delete','');
with dmComLearning do begin

if (objv.CheckEmpty(scontentid)=true) or (objv.ValidNumber(scontentid)=false) then
begin
ShowMessage('please enter a valid content id');
end
else
if (tblContent.Locate('contentid',strtoint(scontentid),[])=false) then //if the contentid was located in this users specific library
begin
ShowMessage('contentid you searched does not exist');
end
else
begin
tblContent.Locate('contentid',strtoint(scontentid),[]);

if tblContent['userid']=iuserid then //if contentid belongs
begin

 ssection:=tblContent['section'];       //extraction of section to be deleted

  tblContent.First;
  while not tblContent.Eof do               //searches for tests linked to this section
  begin

  if (tblContent['userid']=iuserid) and (tblContent['section']=ssection) then
  begin

  tblTests.First;
  while not tblTests.Eof do
  begin

   if (tblTests['contentid']=tblContent['contentid']) then
   begin
   tblTests.Delete
   end
   else
   begin
   tblTests.Next;
   end; //meets criteria
  end;//while
  tblTests.Refresh;


  tblContent.Delete
  end
  else
  begin
      tblContent.Next;
  end; //if meets criteria

  end; //while
  tblContent.Refresh;
   Inc(iCDeletedSections);
   arrDeletedSections[iCDeletedSections]:=sSection+'#'+IntToStr(iUserid);


  refreshdatabase;


end
else
begin
ShowMessage('the contentid you tried to delete does not belong to you');
end;  //if contentid doesnt belong
end; //if the content id was located
end; //with dmcom
end;  //END DELETE SECTION



procedure TfrmStudy.btbPreviousClick(Sender: TObject);
begin                                                 //btbPREVIOUS
dec(iFilePos);

if iFilePos=0 then   //IF YOUR ON FIRST FLASH CARD AND YOU GO BACK YOU GET SET TO LAST FLASHCARD
begin
iFilePos:=iCount;
flashcardprocessing;
end
else
begin
flashcardprocessing;
end;
end;

procedure TfrmStudy.btnTestClick(Sender: TObject);
 var
 i:integer;
  tfile:textfile;
 sline:string;
 bfound,bDeleted:boolean;
begin //test button
bfound:=false;
bDeleted:=false;
if lstSection.ItemIndex<0 then  //
begin
ShowMessage('plaese choose a section to be tested on');
end   //DIDNT CHOOSE A SECTION
else
begin   //CHOOSE A SECTION
with dmComLearning do begin            //checking the amount of records being tested

   sSection:=Copy(lstSection.Items[lstSection.ItemIndex],1,Pos('#',lstSection.Items[lstSection.ItemIndex])-1);
   for i := 1 to 100 do
     begin
       if lstSection.Items[lstSection.ItemIndex]=arrDeletedSections[i] then
       begin
         bDeleted:=true;
       end;
     end;   //checkes if section deleted

   if bDeleted=false then
  begin


 iUserSection:= strtoint(Copy(lstSection.Items[lstSection.ItemIndex],Pos('#',lstSection.Items[lstSection.ItemIndex])+1));
  AssignFile(tFile,'test.txt');
  Rewrite(tfile);
 icount:=0;
  tblContent.First;
  while not tblContent.Eof do
  begin
  if (tblContent['section']=sSection) and (tblContent['userid']=iUserSection) then
  begin
  sline:=tblContent['concept']+'#'+tblContent['definition'];
  Writeln(tfile,sline);
  Inc(iCount);
  end;
    tblContent.Next;
  end;           //finished checking amount of records tested
CloseFile(tfile);

  if iCount<4 then
  begin
   ShowMessage('not enough study material to conduct a test you have to have at least 4 concepts in a study set');
  end     //if the records are less than 4
  else
  begin
  frmStudy.Hide;
  frmTest.Show;//moves to test page
  end;   //if the records are not less than 4


  end
  else
  begin
  ShowMessage('this section no longer exists');
  end;//error message



end;  //with dmcomlearning

end; //CHOOSE A SECTION
end; //test button end


function TfrmStudy.checkSectionExists(sSection: string;          //ChECKING SECTION EXISTS
  iUserid2: integer): boolean;
begin
Result:=false;
with dmComLearning do
begin
tblContent.First;
while not tblContent.Eof do          //if the section has been deleted
begin
 if (tblContent['section']=sSection) and (tblContent['userid']=iUserid2) then
  begin
   Result:=true;
  end;
  tblContent.Next
end;


end;//dmcom
end;



procedure TfrmStudy.btnCloseClick(Sender: TObject);  //btn close flashcards button
begin
pnlflashCards.Top:=10000;
pnlflashCards.Left:=10000;

end;



procedure TfrmStudy.btnNextClick(Sender: TObject);
begin
inc(iFilePos);

if iFilePos=iCount+1 then   //IF YOUR ON FIRST FLASH CARD AND YOU GO BACK YOU GET SET TO LAST FLASHCARD
begin
iFilePos:=1;
flashcardprocessing;
end
else
begin
flashcardprocessing;
end;
end;

procedure TfrmStudy.btnPreviousClick(Sender: TObject);
begin                                                 //btbPREVIOUS
dec(iFilePos);

if iFilePos=0 then   //IF YOUR ON FIRST FLASH CARD AND YOU GO BACK YOU GET SET TO LAST FLASHCARD
begin
iFilePos:=iCount;
flashcardprocessing;
end
else
begin
flashcardprocessing;
end;
end;

procedure TfrmStudy.btnEditRecordClick(Sender: TObject);       //btnedit record : allows user to change a selected record definition or concept
 var
 icontentid,iuserid:integer;
  scontentid,sdefinition,sconcept,sDorC,sSubject:string;
  bRepeat:boolean;

begin
 bRepeat:=false;
 scontentid:=inputbox('Add to a set','select the contentid of a record you want to edit','');
 iUserId:= StrToInt(Copy(frmWelcome.lblusername.Caption,pos('#',frmWelcome.lblusername.Caption)+1));

 with dmComLearning do begin
 if (objv.CheckEmpty(scontentid)=true) or (objv.ValidNumber(scontentid)=false) then //checking f the field is null
 begin
 ShowMessage('invalid contentid');
 end
 else
 if tblContent.Locate('contentid',strtoint(scontentid),[])=true then
 begin
  icontentid:=StrToInt(scontentid);
 tblContent.Locate('contentid',icontentid,[]);
 sSubject:=tblContent['subject'];

 if (tblContent['contentid']=icontentid) and (tblContent['userid']=iuserid) then      //the content id was found and it belongs to this specific user
 begin

 sDorC:=InputBox('editing content record '+IntToStr(icontentid),'Would you like to edit this records Concept  or Definition ','C / D');

 if (UpperCase(sDorC)='C') or (UpperCase(sDorC)='CONCEPT') then
 begin
  sconcept:=InputBox('enter a new concept','Old concept: '+tblContent['concept']+#13+'enter a new concept','');

 tblContent.First;
 while not tblcontent.Eof do
 begin
 if (sConcept=tblContent['concept']) and (iuserid=tblcontent['userid']) and (tblContent['subject']=sSubject)then
 begin
  bRepeat:=true;
 end;
   tblContent.Next;                                    //CHECKS IF THIS CONCEPT IS IDENTICAL TO ANOTHER OR ITS THE SAME
 end;

     if (objv.CheckEmpty(sconcept)=true) or (bRepeat=true) then       //checking if the user actually entered something
     begin
     ShowMessage('invalid input');
     end
     else
     begin
      tblContent.Edit;
      tblContent['concept']:=sconcept;
      tblContent.Post;
      tblContent.Refresh;
      refreshdatabase;
     end;

 end    // the user wants to edit the record's concept
 else
 if  (UpperCase(sDorC)='DEFINITION') or (UpperCase(sDorC)='D') then
 begin
 sdefinition:=InputBox('enter a new defintion','Old defintion: '+tblContent['definition']+#13+'enter a new definition','');


      if (objv.CheckEmpty(sdefinition)=true) then       //checking if the user actually entered something
     begin
     ShowMessage('invalid input');
     end
     else
     begin
      tblContent.Edit;
      tblContent['definition']:=sdefinition;
      tblContent.Post;
      tblContent.Refresh;
      refreshdatabase;
     end;

 end  // the user wants to edit the record's definition
 else
 begin
   ShowMessage('invalid input');
 end; //the user entered an invalid decision when choosing D OR C

 end
 else
 begin
 ShowMessage('the content id you searched was not found in you library');//the content id did not belong to this user
 end;

 end //if the content id was located
 else
 begin
   ShowMessage('the contentid you searched for doesnt exist');
 end;
 end;//dmcomlearning

end;   //edit record end


procedure TfrmStudy.btnAddSetClick(Sender: TObject);       //BTNADD TO SET
var
sSection,sDefinition,sConcept,scontinue,sSubject,sSearchcontentid:string;
 iContentid:integer;
bcontinue,bRepeat:boolean;
begin //adding terms to an existing set
bRepeat:=false;

with dmComLearning do begin
sSearchcontentid:=inputbox('Add to a set','select the contentid of a record in the set you want to add to','');
bcontinue:=false;
iContentid:=StrToInt(lblContentid.Caption);

if (objv.ValidNumber(sSearchcontentid)=false) or (objv.CheckEmpty(sSearchcontentid)=true) then
begin
showmessage('invalid contentid');       //error message
end
else
begin

if tblContent.Locate('contentid',StrToInt(sSearchcontentid),[])=true then       //if the content id is acuaclly valid
begin
tblContent.Locate('contentid',StrToInt(sSearchcontentid),[]);

if tblContent['userid']=iUserId then     //if the contentid belongs to this user
begin
sSection:=tblContent['section'];
sSubject:=tblContent['subject'];



repeat
sConcept:=   InputBox('Definition','what is the word you are defining','');

tblContent.First;
 while not tblcontent.Eof do
 begin
 if (sConcept=tblContent['concept']) and (iuserid=tblcontent['userid']) and (tblContent['subject']=sSubject)then
 begin
  bRepeat:=true;
 end;
   tblContent.Next;                                    //CHECKS IF THIS CONCEPT IS IDENTICAL TO ANOTHER
 end;

if (objv.CheckEmpty(sConcept)=false) and (bRepeat=false) then
begin
sDefinition:=InputBox('Section','define the word','');

  if (objv.CheckEmpty(sDefinition)=false) then
  begin

  Inc(iContentid);
  lblContentid.Caption:=IntToStr(iContentid);
  tblContent.Insert;
  tblContent['contentid']:=iContentid;
  tblContent['concept']:=sConcept;
  tblContent['definition']:=sDefinition;
  tblContent['section']:=sSection;
  tblContent['subject']:=sSubject;
  tblContent['userid']:=iUserId;
  tblContent.Post;
  tblContent.Refresh;

  refreshdatabase;


//##############################################################################################################
  scontinue:=InputBox(' Coninue? ','Would you like to add more to this set? ','Y/N');

if (UpperCase(scontinue)='Y') or (UpperCase(scontinue)='YES')then  //checking if they want to continue
begin
 bcontinue:=true;
end
else
if (UpperCase(scontinue)='N') or (UpperCase(scontinue)='NO') then
begin
bcontinue:=False;
end
else
begin
bcontinue:=false;
ShowMessage('Invalid in put');                    //ERROR MESSAGE IF THEY ENTERED ANYTHING BUT Y OR N
end;
//##############################################################################################################


  end  //definition not blank
  else
  begin
  bcontinue:=false;
  ShowMessage('You can not enter blank fields');
  end; //defintion blank

end   //concept not blank
else
begin
bcontinue:=false;
ShowMessage('You can not repeat concepts or enter blank fields');
end;//concept blank
until (bcontinue=false);    //untill user doesn't want to add more

end
else
begin
  ShowMessage('the content id you searched was not found in your library');
end;   //id not found in their library

end
else
begin
  ShowMessage('the contentid you searched does not exist');
end;  //id not found
end; //if content id valid
end;//with dmcomlearning
end;



procedure TfrmStudy.btnCreateSetClick(Sender: TObject); //BTN CREATE SET
var
sSection,sDefinition,sConcept,scontinue,sSubject:string;
 iContentid:integer;
bcontinue,bRepeat:boolean;
begin  //adding record(s) to tblContent
 bRepeat:=false;
if cmbSubject.ItemIndex<0 then   //checking if the user seleced a subject to create the set for
begin
ShowMessage('Please choose a subject from the combobox the create a set for');
end
else
begin                   //the user has picked a subject the set is foe

bcontinue:=false;
sSubject:=cmbSubject.Text;
sSection:=InputBox('Section','what is the title of the section you are doing','');
iContentid:=StrToInt(lblContentid.Caption);


with dmComLearning do
begin

 tblContent.First;                 //VALIDATION: CHECKING REPEATS
 while not tblcontent.Eof do
 begin
 if (uppercase(sSection)=uppercase(tblContent['section'])) and (iuserid=tblcontent['userid']) and (tblContent['subject']=sSubject)then
 begin
  bRepeat:=true;
 end;
   tblContent.Next;
 end;


if (objv.CheckEmpty(sSection)=true) or (bRepeat=true) then
begin
   showmessage('You can not repeat sections or enter blank fields');//ERROR MESSAGE
end
else
begin


repeat
sConcept:=   InputBox('Definition','what is the word you are defining','');

 tblContent.First;
 while not tblcontent.Eof do
 begin
 if (sConcept=tblContent['concept']) and (iuserid=tblcontent['userid']) and (tblContent['subject']=sSubject)then
 begin
  bRepeat:=true;
 end;
   tblContent.Next;                                    //CHECKS IF THIS CONCEPT IS IDENTICAL TO ANOTHER
 end;

if (objv.CheckEmpty(sConcept)=false) and (bRepeat=false) then
begin
sDefinition:=InputBox('Section','define the word','');

  if (objv.CheckEmpty(sDefinition)=false) then
  begin

  Inc(iContentid);                              //INSERTS INTO TBLCONTENT
  lblContentid.Caption:=IntToStr(iContentid);
  tblContent.Insert;
  tblContent['contentid']:=iContentid;
  tblContent['concept']:=sConcept;
  tblContent['definition']:=sDefinition;
  tblContent['section']:=sSection;
  tblContent['subject']:=sSubject;
  tblContent['userid']:=iUserId;
  tblContent.Post;
  tblContent.Refresh;

  refreshdatabase;


//##############################################################################################################
  scontinue:=InputBox(' Coninue? ','Would you like to add more to this set? ','Y/N');

if (UpperCase(scontinue)='Y') or (UpperCase(scontinue)='YES') then  //checking if they want to continue
begin
 bcontinue:=true;
end
else
if (UpperCase(scontinue)='N') or (UpperCase(scontinue)='NO') then
begin
bcontinue:=False;
lstSection.Items.Add(sSection+'#'+IntToStr(iUserid));
end
else
begin
bcontinue:=false;
ShowMessage('Invalid in put');      //ERROR MESSAGE IF THEY ENTERED ANYTHING BUT Y OR N
lstSection.Items.Add(sSection+'#'+IntToStr(iUserid));
end;
//##############################################################################################################


  end  //definition not blank
  else
  begin
  bcontinue:=false;
  ShowMessage('You can not enter blank fields');
  end; //defintion blank

end   //concept not blank
else
begin
bcontinue:=false;
ShowMessage('You can not repeat concepts or enter blank fields');
end;//concept blank
until (bcontinue=false); //run until they dont want to add to the set

end; //if section string blank or repeated
end;   //dmcomlearning
end;//cmbindex <0
end;//end<3

procedure TfrmStudy.flashcardprocessing;   //DOES PROCESSING FOR FLASHCARDS
var
i:integer;
begin
 with dmComLearning do
 begin
    tblContent.First;
        if (tblContent['section']=sSection) and (tblContent['userid']=iUserSection) then
       begin
       Inc(i);
       end;
   while not (tblContent.Eof) and (i<>iFilePos) do
   begin
     tblContent.Next;
       if (tblContent['section']=sSection) and (tblContent['userid']=iUserSection) then
       begin
       Inc(i);
       end;
   end;
   lblconcept.Caption:=tblContent['concept'];
 end;
end; //end btn creat set



procedure TfrmStudy.FormShow(Sender: TObject);     //on FORMSHOW
begin

iUserId:= StrToInt(Copy(frmWelcome.lblusername.Caption,pos('#',frmWelcome.lblusername.Caption)+1));
end;

 procedure TfrmStudy.redOutputMouseEnter(Sender: TObject);     //ON REDOUT MOUSE ENTER: DISPLAYS DEFINITION FOR FLASHCARDS
begin
redOutput.Lines.Add(dmComLearning.tblContent['definition']);
end;

procedure TfrmStudy.redOutputMouseLeave(Sender: TObject);      //REDOUT MOUSE LEAVE:CLEARS EDIT BOX
begin
redOutput.Lines.Clear;
end;

procedure TfrmStudy.refreshdatabase;  //PROCEDURE TO REFRESH DATABASE EVERTIME A CHANGE HAPPENS
 var
 suserid:string;
begin //refreshes database
sUserId:=Copy(frmWelcome.lblusername.Caption,pos('#',frmWelcome.lblusername.Caption)+1);
dgbContent.DataSource:=dmcomLearning.dsrComLearning;
dmComLearning.tblContent.Open;
with dmComLearning do
begin
qryComLearning.Close;
  qryComLearning.SQL.Clear;
  qryComLearning.SQL.Add('Select contentid,concept,subject from tblcontent where [userid]='+sUserid+'');
  qryComLearning.Open;
end;//dmcomlearning while

end;//refresh database end








end.
