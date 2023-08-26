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
  uAPI;

type
  TFrame_WelcomeBack = class(TFrame, IFrameController)
    Layout2: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Layout5: TLayout;
    Label4: TLabel;
    Rectangle3: TRectangle;
    edtSiteAddress: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    btnContinue: TRectangle;
    Label7: TLabel;
    Layout3: TLayout;
    Layout4: TLayout;
    Image1: TImage;
    Label1: TLabel;
    procedure btnContinueClick(Sender: TObject);
  private
    { Private declarations }
    FFrameInterface: IFrameInterface;
  public
    { Public declarations }
    procedure SetFrameInterface(const aFrameInterface: IFrameInterface);
  end;

implementation

{$R *.fmx}

procedure TFrame_WelcomeBack.btnContinueClick(Sender: TObject);
  function AlphaColorToString(const AColor: TAlphaColor): string;
  begin
    Result := '$' + IntToHex(TAlphaColorRec(AColor).A, 2) +
              IntToHex(TAlphaColorRec(AColor).R, 2) +
              IntToHex(TAlphaColorRec(AColor).G, 2) +
              IntToHex(TAlphaColorRec(AColor).B, 2);
  end;
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

procedure TFrame_WelcomeBack.SetFrameInterface(const aFrameInterface: IFrameInterface);
begin
  FFrameInterface := aFrameInterface;
end;

end.
