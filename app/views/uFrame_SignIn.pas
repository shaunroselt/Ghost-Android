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
  uDataModule_Main;

type
  TFrame_SignIn = class(TFrame, IFrameController)
    laySignIn: TLayout;
    layLogo: TLayout;
    imgLogoSignIn: TImage;
    lblTitleSignIn: TLabel;
    layContainerEmailAddress: TLayout;
    lblEmailAddress: TLabel;
    layEmailAddress: TRectangle;
    edtEmailAddress: TEdit;
    btnSignIn: TRectangle;
    lblButtonSignIn: TLabel;
    layContainerPassword: TLayout;
    lblPassword: TLabel;
    layPassword: TRectangle;
    edtPassword: TEdit;
    btnForgotPassword: TLabel;
    LinePassword: TLine;
    btnTempWelcomeBack: TButton;
    lblError: TLabel;
    procedure btnSignInClick(Sender: TObject);
    procedure btnTempWelcomeBackClick(Sender: TObject);
    procedure btnForgotPasswordMouseEnter(Sender: TObject);
    procedure btnForgotPasswordMouseLeave(Sender: TObject);
    procedure btnSignInMouseEnter(Sender: TObject);
    procedure btnSignInMouseLeave(Sender: TObject);
    procedure EditOnFocus(Sender: TObject; var ACanFocus: Boolean);
    procedure EditOnFocusExit(Sender: TObject);
    procedure btnForgotPasswordClick(Sender: TObject);
  private
    { Private declarations }
    FFrameInterface: IFrameInterface;
  public
    { Public declarations }
    procedure SetFrameInterface(const aFrameInterface: IFrameInterface);
    procedure FrameShow();
  end;

const
  USER_NOT_FOUND: String = 'User not found.';
  NEED_EMAIL_ADDRESS: String = 'We need your email address to reset your password!';
  FAILED_TO_SEND_EMAIL: String = 'Failed to send email. Reason: Email has been temporarily rejected.';

implementation

{$R *.fmx}

{ TFrame_SignIn }

procedure TFrame_SignIn.btnForgotPasswordClick(Sender: TObject);
begin
  if IsValidEmail(edtEmailAddress.Text) then
  begin
    layEmailAddress.Stroke.Color := $FFDBE3E7;
    lblError.Visible := False;
    var LoginRecord := dmMain.Login(edtEmailAddress.Text, edtPassword.Text);
    if (LoginRecord.success) then
    begin

    end else
    begin
      lblError.Text := LoginRecord.login_message;
      lblError.Visible := True;
    end;
  end else
  begin
    layEmailAddress.Stroke.Color := $FFF50B23;
    lblError.Text := NEED_EMAIL_ADDRESS;
    lblError.Visible := True;
  end;
end;

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
  var LoginRecord := dmMain.Login(edtEmailAddress.Text, edtPassword.Text);
  FFrameInterface.LogInfo('================================================');
  if (LoginRecord.success) then
  begin
    FFrameInterface.LogInfo('Login successful');
    FFrameInterface.UpdateMainForm;
    FFrameInterface.ShowFrame('Dashboards', True);
  end else
  begin
    FFrameInterface.LogInfo('Login failed');
    lblError.Text := LoginRecord.login_message;
    lblError.Visible := True;
    lblButtonSignIn.Text := '✖️Retry';
  end;
end;

procedure TFrame_SignIn.btnSignInMouseEnter(Sender: TObject);
begin
  var btnFillColor := IncreaseOpacity(dmMain.AdminSite.accent_color, 9);
  btnSignIn.Fill.Color := btnFillColor;
  btnSignIn.Stroke.Color := btnFillColor;
end;

procedure TFrame_SignIn.btnSignInMouseLeave(Sender: TObject);
begin
  btnSignIn.Fill.Color := dmMain.AdminSite.accent_color;
  btnSignIn.Stroke.Color := dmMain.AdminSite.accent_color;
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
  lblError.Visible := False;
  lblButtonSignIn.Text := 'Sign in →';
  edtEmailAddress.Text := '';
  edtPassword.Text := '';
  {$IFDEF DEBUG}
    edtEmailAddress.Text := 'Me@ShaunRoselt.com';
    edtPassword.Text := '';
  {$ENDIF}

  imgLogoSignIn.Bitmap := dmMain.AdminSite.logo;
  lblTitleSignIn.Text := 'Sign in to ' + dmMain.AdminSite.title + '.';
  btnSignIn.Fill.Color := dmMain.AdminSite.accent_color;
  btnSignIn.Stroke.Color := dmMain.AdminSite.accent_color;
end;

procedure TFrame_SignIn.SetFrameInterface(const aFrameInterface: IFrameInterface);
begin
  FFrameInterface := aFrameInterface;
end;

end.
