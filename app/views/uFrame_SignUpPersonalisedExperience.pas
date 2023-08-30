unit uFrame_SignUpPersonalisedExperience;

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
  uAPI, System.Skia, FMX.Memo.Types, System.Math.Vectors, FMX.Controls3D, FMX.Layers3D,
  FMX.ScrollBox, FMX.Memo, FMX.Skia;

type
  TFrame_SignUpPersonalisedExperience = class(TFrame, IFrameController)
    layWelcomeBack: TLayout;
    lblWelcomeBack: TLabel;
    lblContinueToYourSite: TLabel;
    btnContinue: TRectangle;
    lblButtonContinue: TLabel;
    layLogo: TLayout;
    layLogoGhost: TLayout;
    imgLogoGhost: TImage;
    lblLogoGhost: TLabel;
    imgLogoGhostPro: TSkSvg;
    Layout1: TLayout;
    Layout3D1: TLayout3D;
    Label5: TLabel;
    btnGetStartedHere: TLabel;
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

{ TFrame_SignUpPersonalisedExperience }

procedure TFrame_SignUpPersonalisedExperience.FrameShow;
begin

end;

procedure TFrame_SignUpPersonalisedExperience.SetFrameInterface(const aFrameInterface: IFrameInterface);
begin
  FFrameInterface := aFrameInterface;
end;

end.
