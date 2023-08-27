unit uFrame_SignUpThemeSelection;

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
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.Objects,

  System.Skia,
  FMX.Skia,

  uFrameInterface,
  uUtilities,
  uAPI;

type
  TFrame_SignUpThemeSelection = class(TFrame, IFrameController)
    VertScrollBox1: TVertScrollBox;
    layLogo: TLayout;
    layLogoGhost: TLayout;
    imgLogoGhost: TImage;
    lblLogoGhost: TLabel;
    imgLogoGhostPro: TSkSvg;
    lblChooseAStyleToStart: TLabel;
    lblYouCanAlwaysChangeThisLater: TLabel;
    layHeader: TLayout;
    GridLayout1: TGridLayout;
    laySiteAddress: TRectangle;
    Layout1: TLayout;
    SkSvg1: TSkSvg;
    SkSvg2: TSkSvg;
    SkSvg3: TSkSvg;
    Layout5: TLayout;
    Layout4: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    SkAnimatedImage1: TSkAnimatedImage;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    SkSvg4: TSkSvg;
    SkSvg5: TSkSvg;
    SkSvg6: TSkSvg;
    SkAnimatedImage2: TSkAnimatedImage;
    Layout6: TLayout;
    Label3: TLabel;
    Label4: TLabel;
    Layout7: TLayout;
    Rectangle2: TRectangle;
    Layout8: TLayout;
    SkSvg7: TSkSvg;
    SkSvg8: TSkSvg;
    SkSvg9: TSkSvg;
    SkAnimatedImage3: TSkAnimatedImage;
    Layout9: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    Layout10: TLayout;
    Rectangle3: TRectangle;
    Layout11: TLayout;
    SkSvg10: TSkSvg;
    SkSvg11: TSkSvg;
    SkSvg12: TSkSvg;
    SkAnimatedImage4: TSkAnimatedImage;
    Layout12: TLayout;
    Label7: TLabel;
    Label8: TLabel;
    Layout13: TLayout;
    Rectangle4: TRectangle;
    Layout14: TLayout;
    SkSvg13: TSkSvg;
    SkSvg14: TSkSvg;
    SkSvg15: TSkSvg;
    SkAnimatedImage5: TSkAnimatedImage;
    Layout15: TLayout;
    Label9: TLabel;
    Label10: TLabel;
    Layout16: TLayout;
    Rectangle5: TRectangle;
    Layout17: TLayout;
    SkSvg16: TSkSvg;
    SkSvg17: TSkSvg;
    SkSvg18: TSkSvg;
    SkAnimatedImage6: TSkAnimatedImage;
    Layout18: TLayout;
    Label11: TLabel;
    Label12: TLabel;
    procedure FrameResize(Sender: TObject);
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

{ TFrame_SignUpThemeSelection }

procedure TFrame_SignUpThemeSelection.FrameResize(Sender: TObject);
begin
  // Need to dynamically change width and height of the items
end;

procedure TFrame_SignUpThemeSelection.FrameShow;
begin

end;

procedure TFrame_SignUpThemeSelection.SetFrameInterface(const aFrameInterface: IFrameInterface);
begin
  FFrameInterface := aFrameInterface;
end;

end.
