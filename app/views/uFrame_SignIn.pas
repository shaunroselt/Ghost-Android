unit uFrame_SignIn;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Edit,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.Layouts,

  uFrameInterface,
  uUtilities,
  uAPI;

type
  TFrame_SignIn = class(TFrame, IFrameController)
    laySignIn: TLayout;
    layLogo: TLayout;
    imgLogoSignIn: TImage;
    lblTitleSignIn: TLabel;
    Layout8: TLayout;
    lblEmailAddress: TLabel;
    layEmailAddress: TRectangle;
    edtEmailAddress: TEdit;
    btnSignIn: TRectangle;
    lblButtonSignIn: TLabel;
    Layout7: TLayout;
    lblPassword: TLabel;
    layPassword: TRectangle;
    edtPassword: TEdit;
    btnForgotPassword: TLabel;
    LinePassword: TLine;
    btnTempWelcomeBack: TButton;
    procedure btnSignInClick(Sender: TObject);
    procedure btnTempWelcomeBackClick(Sender: TObject);
    procedure btnForgotPasswordMouseEnter(Sender: TObject);
    procedure btnForgotPasswordMouseLeave(Sender: TObject);
    procedure btnSignInMouseEnter(Sender: TObject);
    procedure btnSignInMouseLeave(Sender: TObject);
    procedure EditOnFocus(Sender: TObject; var ACanFocus: Boolean);
    procedure EditOnFocusExit(Sender: TObject);
  private
    { Private declarations }
    FFrameInterface: IFrameInterface;
  public
    { Public declarations }
    procedure SetFrameInterface(const aFrameInterface: IFrameInterface);
    procedure FrameShow();
  end;

implementation

{$R *.fmx}

{ TFrame_SignIn }

procedure TFrame_SignIn.btnForgotPasswordMouseEnter(Sender: TObject);
begin
  btnForgotPassword.TextSettings.FontColor := TAlphaColors.Black;
end;

procedure TFrame_SignIn.btnForgotPasswordMouseLeave(Sender: TObject);
begin
  btnForgotPassword.TextSettings.FontColor := $FF707B8B;
end;

procedure TFrame_SignIn.btnSignInClick(Sender: TObject);
begin
  var LoginSuccess := dmAPI.Login(edtEmailAddress.Text, edtPassword.Text);
  FFrameInterface.LogInfo('================================================');
  if (LoginSuccess) then
  begin
    FFrameInterface.LogInfo('Login successful');
    FFrameInterface.ShowFrame('Dashboards', True);
  end else
    FFrameInterface.LogInfo('Login failed');
end;

procedure TFrame_SignIn.btnSignInMouseEnter(Sender: TObject);
begin
  btnSignIn.Fill.Color := IncreaseOpacity(dmAPI.AdminSite.accent_color, 9);
  btnSignIn.Stroke.Color := IncreaseOpacity(dmAPI.AdminSite.accent_color, 9);
end;

procedure TFrame_SignIn.btnSignInMouseLeave(Sender: TObject);
begin
  btnSignIn.Fill.Color := dmAPI.AdminSite.accent_color;
  btnSignIn.Stroke.Color := dmAPI.AdminSite.accent_color;
end;

procedure TFrame_SignIn.btnTempWelcomeBackClick(Sender: TObject);
begin
    FFrameInterface.ShowFrame('WelcomeBack', False);
end;

procedure TFrame_SignIn.EditOnFocus(Sender: TObject; var ACanFocus: Boolean);
begin
  var SiteAddressContainer := TRectangle(TEdit(Sender).ParentControl);
  SiteAddressContainer.Stroke.Color := $FF7C8B9A;
end;

procedure TFrame_SignIn.EditOnFocusExit(Sender: TObject);
begin
  var SiteAddressContainer := TRectangle(TEdit(Sender).ParentControl);
  SiteAddressContainer.Stroke.Color := $FFDBE3E7;
end;

procedure TFrame_SignIn.FrameShow;
begin
  edtEmailAddress.Text := '';
  edtPassword.Text := '';
  {$IFDEF DEBUG}
    edtEmailAddress.Text := 'Me@ShaunRoselt.com';
    edtPassword.Text := '';
  {$ENDIF}

  imgLogoSignIn.Bitmap := dmAPI.AdminSite.logo;
  lblTitleSignIn.Text := 'Sign in to ' + dmAPI.AdminSite.title + '.';
  btnSignIn.Fill.Color := dmAPI.AdminSite.accent_color;
  btnSignIn.Stroke.Color := dmAPI.AdminSite.accent_color;
end;

procedure TFrame_SignIn.SetFrameInterface(const aFrameInterface: IFrameInterface);
begin
  FFrameInterface := aFrameInterface;
end;

end.
