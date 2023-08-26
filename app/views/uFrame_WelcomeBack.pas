unit uFrame_WelcomeBack;

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
  TFrame_WelcomeBack = class(TFrame, IFrameController)
    layWelcomeBack: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Layout5: TLayout;
    lblSiteAddress: TLabel;
    laySiteAddress: TRectangle;
    edtSiteAddress: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    btnContinue: TRectangle;
    lblButtonContinue: TLabel;
    layLogo: TLayout;
    layLogoGhost: TLayout;
    imgLogoGhost: TImage;
    lblLogoGhost: TLabel;
    procedure btnContinueClick(Sender: TObject);
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

procedure TFrame_WelcomeBack.btnContinueClick(Sender: TObject);
begin
  dmAPI.SetAdminSite(edtSiteAddress.Text);
  FFrameInterface.ShowFrame('SignIn', False);

  FFrameInterface.LogInfo('================================================');
  FFrameInterface.LogInfo(dmAPI.AdminSite.title);
  FFrameInterface.LogInfo(dmAPI.AdminSite.description);
  FFrameInterface.LogInfo(dmAPI.AdminSite.logo_url);
  FFrameInterface.LogInfo(AlphaColorToString(dmAPI.AdminSite.accent_color));
  FFrameInterface.LogInfo(dmAPI.AdminSite.locale);
  FFrameInterface.LogInfo(dmAPI.AdminSite.url);
  FFrameInterface.LogInfo(dmAPI.AdminSite.version);
end;

procedure TFrame_WelcomeBack.EditOnFocus(Sender: TObject; var ACanFocus: Boolean);
begin
  var SiteAddressContainer := TRectangle(TEdit(Sender).ParentControl);
  SiteAddressContainer.Stroke.Color := $FF7C8B9A;
end;

procedure TFrame_WelcomeBack.EditOnFocusExit(Sender: TObject);
begin
  var SiteAddressContainer := TRectangle(TEdit(Sender).ParentControl);
  SiteAddressContainer.Stroke.Color := $FFDBE3E7;
end;

procedure TFrame_WelcomeBack.FrameShow;
begin
  edtSiteAddress.Text := '';
  {$IFDEF DEBUG}
    edtSiteAddress.Text := 'http://localhost:2368';
  {$ENDIF}
end;

procedure TFrame_WelcomeBack.SetFrameInterface(const aFrameInterface: IFrameInterface);
begin
  FFrameInterface := aFrameInterface;
end;

end.
