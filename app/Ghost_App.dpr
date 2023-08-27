program Ghost_App;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  uMain in 'uMain.pas' {frmMain},
  uAPI in 'uAPI.pas' {dmAPI: TDataModule},
  uUtilities in 'uUtilities.pas',
  uFrame_WelcomeBack in 'views\uFrame_WelcomeBack.pas' {Frame_WelcomeBack: TFrame},
  uFrame_SignIn in 'views\uFrame_SignIn.pas' {Frame_SignIn: TFrame},
  uFrameInterface in 'uFrameInterface.pas',
  uGhostIcons in 'uGhostIcons.pas',
  uFrame_SignUp in 'views\uFrame_SignUp.pas' {Frame_SignUp: TFrame};

{$R *.res}

begin
  GlobalUseSkia := True;

  // Enable Memory leaks detection for debug build
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmAPI, dmAPI);
  Application.Run;
end.
