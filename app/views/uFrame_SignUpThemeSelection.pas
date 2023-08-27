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
    layPreviewThemeCasper: TRectangle;
    layPreviewBrowserThemeCasper: TLayout;
    imgPreviewBrowserDot1ThemeCasper: TSkSvg;
    imgPreviewBrowserDot3ThemeCasper: TSkSvg;
    imgPreviewBrowserDot2ThemeCasper: TSkSvg;
    layThemeCasper: TLayout;
    layBottomThemeCasper: TLayout;
    lblBottomNameThemeCasper: TLabel;
    lblBottomTypeThemeCasper: TLabel;
    imgPreviewThemeCasper: TSkAnimatedImage;
    layThemeHeadline: TLayout;
    layPreviewThemeHeadline: TRectangle;
    layPreviewBrowserThemeHeadline: TLayout;
    imgPreviewBrowserDot1ThemeHeadline: TSkSvg;
    imgPreviewBrowserDot3ThemeHeadline: TSkSvg;
    imgPreviewBrowserDot2ThemeHeadline: TSkSvg;
    imgPreviewThemeHeadline: TSkAnimatedImage;
    layBottomThemeHeadline: TLayout;
    lblBottomNameThemeHeadline: TLabel;
    lblBottomTypeThemeHeadline: TLabel;
    layThemeEdition: TLayout;
    layPreviewThemeEdition: TRectangle;
    layPreviewBrowserThemeEdition: TLayout;
    imgPreviewBrowserDot1ThemeEdition: TSkSvg;
    imgPreviewBrowserDot3ThemeEdition: TSkSvg;
    imgPreviewBrowserDot2ThemeEdition: TSkSvg;
    imgPreviewThemeEdition: TSkAnimatedImage;
    layBottomThemeEdition: TLayout;
    lblBottomNameThemeEdition: TLabel;
    lblBottomTypeThemeEdition: TLabel;
    layThemeSolo: TLayout;
    layPreviewThemeSolo: TRectangle;
    layPreviewBrowserThemeSolo: TLayout;
    imgPreviewBrowserDot1ThemeSolo: TSkSvg;
    imgPreviewBrowserDot3ThemeSolo: TSkSvg;
    imgPreviewBrowserDot2ThemeSolo: TSkSvg;
    imgPreviewThemeSolo: TSkAnimatedImage;
    layBottomThemeSolo: TLayout;
    lblBottomNameThemeSolo: TLabel;
    lblBottomTypeThemeSolo: TLabel;
    layThemeTaste: TLayout;
    layPreviewThemeTaste: TRectangle;
    layPreviewBrowserThemeTaste: TLayout;
    imgPreviewBrowserDot1ThemeTaste: TSkSvg;
    imgPreviewBrowserDot3ThemeTaste: TSkSvg;
    imgPreviewBrowserDot2ThemeTaste: TSkSvg;
    imgPreviewThemeTaste: TSkAnimatedImage;
    layBottomThemeTaste: TLayout;
    lblBottomNameThemeTaste: TLabel;
    lblBottomTypeThemeTaste: TLabel;
    layThemeEpisode: TLayout;
    layPreviewThemeEpisode: TRectangle;
    layPreviewBrowserThemeEpisode: TLayout;
    imgPreviewBrowserDot1ThemeEpisode: TSkSvg;
    imgPreviewBrowserDot3ThemeEpisode: TSkSvg;
    imgPreviewBrowserDot2ThemeEpisode: TSkSvg;
    imgPreviewThemeEpisode: TSkAnimatedImage;
    layBottomThemeEpisode: TLayout;
    lblBottomNameThemeEpisode: TLabel;
    lblBottomTypeThemeEpisode: TLabel;
    layPreviewTransparentThemeCasper: TRectangle;
    btnThemeCasper: TLayout;
    btnPreviewThemeCasper: TRectangle;
    lblPreviewThemeCasper: TLabel;
    btnThemeHeadline: TLayout;
    btnThemeEdition: TLayout;
    btnThemeSolo: TLayout;
    btnThemeTaste: TLayout;
    btnThemeEpisode: TLayout;
    btnPreviewThemeEdition: TRectangle;
    lblPreviewThemeEdition: TLabel;
    btnPreviewThemeEpisode: TRectangle;
    lblPreviewThemeEpisode: TLabel;
    btnPreviewThemeHeadline: TRectangle;
    lblPreviewThemeHeadline: TLabel;
    btnPreviewThemeSolo: TRectangle;
    lblPreviewThemeSolo: TLabel;
    btnPreviewThemeTaste: TRectangle;
    lblPreviewThemeTaste: TLabel;
    layPreviewTransparentThemeEdition: TRectangle;
    layPreviewTransparentThemeEpisode: TRectangle;
    layPreviewTransparentThemeHeadline: TRectangle;
    layPreviewTransparentThemeSolo: TRectangle;
    layPreviewTransparentThemeTaste: TRectangle;
    btnTempWelcomeBack: TButton;
    layThemeDigest: TLayout;
    btnThemeDigest: TLayout;
    layBottomThemeDigest: TLayout;
    lblBottomNameThemeDigest: TLabel;
    lblBottomTypeThemeDigest: TLabel;
    layPreviewThemeDigest: TRectangle;
    layPreviewBrowserThemeDigest: TLayout;
    imgPreviewBrowserDot1ThemeDigest: TSkSvg;
    imgPreviewBrowserDot3ThemeDigest: TSkSvg;
    imgPreviewBrowserDot2ThemeDigest: TSkSvg;
    imgPreviewThemeDigest: TSkAnimatedImage;
    layPreviewTransparentThemeDigest: TRectangle;
    btnPreviewThemeDigest: TRectangle;
    lblPreviewThemeDigest: TLabel;
    layThemeBulletin: TLayout;
    btnThemeBulletin: TLayout;
    layBottomThemeBulletin: TLayout;
    lblBottomNameThemeBulletin: TLabel;
    lblBottomTypeThemeBulletin: TLabel;
    layPreviewThemeBulletin: TRectangle;
    layPreviewBrowserThemeBulletin: TLayout;
    imgPreviewBrowserDot1ThemeBulletin: TSkSvg;
    imgPreviewBrowserDot3ThemeBulletin: TSkSvg;
    imgPreviewBrowserDot2ThemeBulletin: TSkSvg;
    imgPreviewThemeBulletin: TSkAnimatedImage;
    layPreviewTransparentThemeBulletin: TRectangle;
    btnPreviewThemeBulletin: TRectangle;
    lblPreviewThemeBulletin: TLabel;
    layThemeAlto: TLayout;
    btnThemeAlto: TLayout;
    layBottomThemeAlto: TLayout;
    lblBottomNameThemeAlto: TLabel;
    lblBottomTypeThemeAlto: TLabel;
    layPreviewThemeAlto: TRectangle;
    layPreviewBrowserThemeAlto: TLayout;
    imgPreviewBrowserDot1ThemeAlto: TSkSvg;
    imgPreviewBrowserDot3ThemeAlto: TSkSvg;
    imgPreviewBrowserDot2ThemeAlto: TSkSvg;
    imgPreviewThemeAlto: TSkAnimatedImage;
    layPreviewTransparentThemeAlto: TRectangle;
    btnPreviewThemeAlto: TRectangle;
    lblPreviewThemeAlto: TLabel;
    layThemeDope: TLayout;
    btnThemeDope: TLayout;
    layPreviewThemeDope: TRectangle;
    layPreviewBrowserThemeDope: TLayout;
    imgPreviewBrowserDot1ThemeDope: TSkSvg;
    imgPreviewBrowserDot3ThemeDope: TSkSvg;
    imgPreviewBrowserDot2ThemeDope: TSkSvg;
    imgPreviewThemeDope: TSkAnimatedImage;
    layPreviewTransparentThemeDope: TRectangle;
    layBottomThemeDope: TLayout;
    lblBottomNameThemeDope: TLabel;
    lblBottomTypeThemeDope: TLabel;
    btnPreviewThemeDope: TRectangle;
    lblPreviewThemeDope: TLabel;
    layThemeWave: TLayout;
    btnThemeWave: TLayout;
    layBottomThemeWave: TLayout;
    lblBottomNameThemeWave: TLabel;
    lblBottomTypeThemeWave: TLabel;
    layPreviewThemeWave: TRectangle;
    layPreviewBrowserThemeWave: TLayout;
    imgPreviewBrowserDot1ThemeWave: TSkSvg;
    imgPreviewBrowserDot3ThemeWave: TSkSvg;
    imgPreviewBrowserDot2ThemeWave: TSkSvg;
    imgPreviewThemeWave: TSkAnimatedImage;
    layPreviewTransparentThemeWave: TRectangle;
    btnPreviewThemeWave: TRectangle;
    lblPreviewThemeWave: TLabel;
    layThemeEdge: TLayout;
    btnThemeEdge: TLayout;
    layPreviewThemeEdge: TRectangle;
    layPreviewBrowserThemeEdge: TLayout;
    imgPreviewBrowserDot1ThemeEdge: TSkSvg;
    imgPreviewBrowserDot3ThemeEdge: TSkSvg;
    imgPreviewBrowserDot2ThemeEdge: TSkSvg;
    imgPreviewThemeEdge: TSkAnimatedImage;
    layPreviewTransparentThemeEdge: TRectangle;
    layBottomThemeEdge: TLayout;
    lblBottomNameThemeEdge: TLabel;
    lblBottomTypeThemeEdge: TLabel;
    btnPreviewThemeEdge: TRectangle;
    lblPreviewThemeEdge: TLabel;
    layThemeDawn: TLayout;
    btnThemeDawn: TLayout;
    layPreviewThemeDawn: TRectangle;
    layPreviewBrowserThemeDawn: TLayout;
    imgPreviewBrowserDot1ThemeDawn: TSkSvg;
    imgPreviewBrowserDot3ThemeDawn: TSkSvg;
    imgPreviewBrowserDot2ThemeDawn: TSkSvg;
    imgPreviewThemeDawn: TSkAnimatedImage;
    layPreviewTransparentThemeDawn: TRectangle;
    layBottomThemeDawn: TLayout;
    lblBottomNameThemeDawn: TLabel;
    lblBottomTypeThemeDawn: TLabel;
    btnPreviewThemeDawn: TRectangle;
    lblPreviewThemeDawn: TLabel;
    layThemeEase: TLayout;
    btnThemeEase: TLayout;
    layPreviewThemeEase: TRectangle;
    layPreviewBrowserThemeEase: TLayout;
    imgPreviewBrowserDot1ThemeEase: TSkSvg;
    imgPreviewBrowserDot3ThemeEase: TSkSvg;
    imgPreviewBrowserDot2ThemeEase: TSkSvg;
    imgPreviewThemeEase: TSkAnimatedImage;
    layPreviewTransparentThemeEase: TRectangle;
    layBottomThemeEase: TLayout;
    lblBottomNameThemeEase: TLabel;
    lblBottomTypeThemeEase: TLabel;
    btnPreviewThemeEase: TRectangle;
    lblPreviewThemeEase: TLabel;
    layThemeJournal: TLayout;
    btnThemeJournal: TLayout;
    layPreviewThemeJournal: TRectangle;
    layPreviewBrowserThemeJournal: TLayout;
    imgPreviewBrowserDot1ThemeJournal: TSkSvg;
    imgPreviewBrowserDot3ThemeJournal: TSkSvg;
    imgPreviewBrowserDot2ThemeJournal: TSkSvg;
    imgPreviewThemeJournal: TSkAnimatedImage;
    layPreviewTransparentThemeJournal: TRectangle;
    layBottomThemeJournal: TLayout;
    lblBottomNameThemeJournal: TLabel;
    lblBottomTypeThemeJournal: TLabel;
    btnPreviewThemeJournal: TRectangle;
    lblPreviewThemeJournal: TLabel;
    procedure FrameResize(Sender: TObject);
    procedure btnThemeMouseEnter(Sender: TObject);
    procedure btnThemeMouseLeave(Sender: TObject);
    procedure btnTempWelcomeBackClick(Sender: TObject);
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

procedure TFrame_SignUpThemeSelection.btnTempWelcomeBackClick(Sender: TObject);
begin
    FFrameInterface.ShowFrame('WelcomeBack', False);
end;

procedure TFrame_SignUpThemeSelection.btnThemeMouseEnter(Sender: TObject);
begin
  var ThemeName := String(TControl(Sender).Name).Replace('btn','');
  TControl(FindComponent('btnPreview' + ThemeName)).Visible := True;
  TControl(FindComponent('layPreviewTransparent' + ThemeName)).Visible := True;
end;

procedure TFrame_SignUpThemeSelection.btnThemeMouseLeave(Sender: TObject);
begin
  var ThemeName := String(TControl(Sender).Name).Replace('btn','');
  TControl(FindComponent('btnPreview' + ThemeName)).Visible := False;
  TControl(FindComponent('layPreviewTransparent' + ThemeName)).Visible := False;
end;

procedure TFrame_SignUpThemeSelection.FrameResize(Sender: TObject);
begin
  var GridMargins := 0.0;
  if (VertScrollBox1.Width > 1200) then
    GridMargins := (VertScrollBox1.Width - 1200) / 2;
  GridLayout1.Margins.Left := GridMargins;
  GridLayout1.Margins.Right := GridMargins;

  GridLayout1.ItemWidth := (GridLayout1.Width - 3) / 3;
  GridLayout1.ItemHeight := GridLayout1.ItemWidth * 1.33333333333333333333333333;
end;

procedure TFrame_SignUpThemeSelection.FrameShow;
begin
  btnPreviewThemeCasper.Visible := False;
  layPreviewTransparentThemeCasper.Visible := False;

  btnPreviewThemeHeadline.Visible := False;
  layPreviewTransparentThemeHeadline.Visible := False;

  btnPreviewThemeEdition.Visible := False;
  layPreviewTransparentThemeEdition.Visible := False;

  btnPreviewThemeSolo.Visible := False;
  layPreviewTransparentThemeSolo.Visible := False;

  btnPreviewThemeTaste.Visible := False;
  layPreviewTransparentThemeTaste.Visible := False;

  btnPreviewThemeEpisode.Visible := False;
  layPreviewTransparentThemeEpisode.Visible := False;

  btnPreviewThemeDigest.Visible := False;
  layPreviewTransparentThemeDigest.Visible := False;

  btnPreviewThemeBulletin.Visible := False;
  layPreviewTransparentThemeBulletin.Visible := False;

  btnPreviewThemeAlto.Visible := False;
  layPreviewTransparentThemeAlto.Visible := False;

  btnPreviewThemeDope.Visible := False;
  layPreviewTransparentThemeDope.Visible := False;

  btnPreviewThemeWave.Visible := False;
  layPreviewTransparentThemeWave.Visible := False;

  btnPreviewThemeEdge.Visible := False;
  layPreviewTransparentThemeEdge.Visible := False;

  btnPreviewThemeDawn.Visible := False;
  layPreviewTransparentThemeDawn.Visible := False;

  btnPreviewThemeEase.Visible := False;
  layPreviewTransparentThemeEase.Visible := False;

  btnPreviewThemeJournal.Visible := False;
  layPreviewTransparentThemeJournal.Visible := False;
end;

procedure TFrame_SignUpThemeSelection.SetFrameInterface(const aFrameInterface: IFrameInterface);
begin
  FFrameInterface := aFrameInterface;
end;

end.
