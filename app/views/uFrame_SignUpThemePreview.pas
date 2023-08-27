unit uFrame_SignUpThemePreview;

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
  uAPI, System.Skia, FMX.Skia, FMX.WebBrowser;

type
  TFrame_SignUpThemePreview = class(TFrame, IFrameController)
    Layout1: TLayout;
    lblYouCanAlwaysChangeThisLater: TLabel;
    btnStartWithTheme: TRectangle;
    lblStartWithTheme: TLabel;
    Rectangle1: TRectangle;
    SkSvg1: TSkSvg;
    btnThemeCasper: TLayout;
    layPreviewTheme: TRectangle;
    layPreviewBrowserTheme: TLayout;
    imgPreviewBrowserDot1Theme: TSkSvg;
    imgPreviewBrowserDot3Theme: TSkSvg;
    imgPreviewBrowserDot2Theme: TSkSvg;
    WebPreviewTheme: TWebBrowser;
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

{ TFrame_SignUpThemePreview }

procedure TFrame_SignUpThemePreview.FrameShow;
begin

end;

procedure TFrame_SignUpThemePreview.SetFrameInterface(const aFrameInterface: IFrameInterface);
begin
  FFrameInterface := aFrameInterface;
end;

end.
