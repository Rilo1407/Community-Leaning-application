program comlearning;

uses
  Forms,
  frmadmin_u in 'frmadmin_u.pas' {frmAdmin},
  frmSearch_u in 'frmSearch_u.pas' {frmSearch},
  frmStudy_u in 'frmStudy_u.pas' {frmStudy},
  frmTest_u in 'frmTest_u.pas' {frmTest},
  frmSignUp_u in 'frmSignUp_u.pas' {frmSignUp},
  frmLogin_u in 'frmLogin_u.pas' {frmLogin},
  frmWelcome_u in 'frmWelcome_u.pas' {frmWelcome},
  dmComLearning_u in 'dmComLearning_u.pas' {dmComLearning: TDataModule},
  clsLogin_u in 'clsLogin_u.pas',
  Validation_U in 'Validation_U.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.CreateForm(TfrmTest, frmTest);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmWelcome, frmWelcome);
  Application.CreateForm(TfrmStudy, frmStudy);
  Application.CreateForm(TfrmSearch, frmSearch);
  Application.CreateForm(TdmComLearning, dmComLearning);
  Application.Run;
end.
