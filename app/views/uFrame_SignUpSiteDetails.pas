unit uFrame_SignUpSiteDetails;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Math.Vectors,

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
  FMX.Controls3D,
  FMX.Layers3D,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo,

  System.Skia,
  FMX.Skia,

  uFrameInterface,
  uUtilities,
  uDataModule_Main;

type
  TFrame_SignUpSiteDetails = class(TFrame, IFrameController)
    layWelcomeBack: TLayout;
    lblWelcomeBack: TLabel;
    lblContinueToYourSite: TLabel;
    Layout5: TLayout;
    lblSiteAddress: TLabel;
    laySiteAddress: TRectangle;
    edtSiteAddress: TEdit;
    btnContinue: TRectangle;
    lblButtonContinue: TLabel;
    layLogo: TLayout;
    layLogoGhost: TLayout;
    imgLogoGhost: TImage;
    lblLogoGhost: TLabel;
    imgLogoGhostPro: TSkSvg;
    Layout1: TLayout;
    Label1: TLabel;
    Rectangle1: TRectangle;
    Layout3D1: TLayout3D;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Memo1: TMemo;
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

{ TFrame_SignUpSiteDetails }

procedure TFrame_SignUpSiteDetails.FrameShow;
begin

end;

procedure TFrame_SignUpSiteDetails.SetFrameInterface(const aFrameInterface: IFrameInterface);
begin
  FFrameInterface := aFrameInterface;
end;

end.
