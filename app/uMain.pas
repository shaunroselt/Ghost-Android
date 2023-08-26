unit uMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.JSON,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Edit,
  FMX.TabControl,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.MultiView,
  FMX.ListBox,

  System.Skia,
  FMX.Skia,

  uFrameInterface,
  uAPI,

  uFrame_WelcomeBack,
  uFrame_SignIn;

type
  TfrmMain = class(TForm, IFrameInterface)
    Memo1: TMemo;
    Splitter1: TSplitter;
    MultiView: TMultiView;
    MultiViewScrollBox: TVertScrollBox;
    layNavAllTools: TLayout;
    btnAllTools: TRectangle;
    imgAllTools: TSkSvg;
    lblAllTools: TLabel;
    layNavTesting: TLayout;
    btnTesting: TRectangle;
    imgTesting: TSkSvg;
    lblTesting: TLabel;
    layNavTestingMore: TLayout;
    layNavTestingMoreExpandCollapse: TLayout;
    btnTestingMoreExpandCollapse: TRectangle;
    imgTestingMoreMoreExpandCollapse: TSkSvg;
    lblTestingMoreExpandCollapse: TLabel;
    imgConvertersExpandCollapseIcon: TSkSvg;
    layNavTesting1: TLayout;
    btnTesting1: TRectangle;
    lblTesting1: TLabel;
    layNavTesting3: TLayout;
    btnTesting3: TRectangle;
    lblTesting3: TLabel;
    layNavTesting2: TLayout;
    btnTesting2: TRectangle;
    lblTesting2: TLabel;
    layNavSettings: TLayout;
    Layout9: TLayout;
    Image2: TImage;
    Label9: TLabel;
    SkSvg1: TSkSvg;
    Layout10: TLayout;
    Rectangle6: TRectangle;
    SkSvg2: TSkSvg;
    Label12: TLabel;
    Layout11: TLayout;
    Rectangle8: TRectangle;
    SkSvg3: TSkSvg;
    Label13: TLabel;
    Layout12: TLayout;
    Rectangle9: TRectangle;
    SkSvg4: TSkSvg;
    Label15: TLabel;
    Layout13: TLayout;
    Rectangle10: TRectangle;
    SkSvg5: TSkSvg;
    Label16: TLabel;
    Layout14: TLayout;
    Rectangle11: TRectangle;
    SkSvg6: TSkSvg;
    Label17: TLabel;
    RoundRect1: TRoundRect;
    imgSettings: TSkSvg;
    RoundRect2: TRoundRect;
    SkSvg7: TSkSvg;
    Image3: TImage;
    LayoutContainer: TLayout;
    layDashboards: TScrollBox;
    layAllToolsGrid: TFlowLayout;
    btnAllToolsTesting: TButton;
    Label18: TLabel;
    Label19: TLabel;
    Rectangle12: TRectangle;
    SkSvg8: TSkSvg;
    layAllToolsHidden: TFlowLayout;
    edtSearchAllTools: TEdit;
    SearchEditButton1: TSearchEditButton;
    layTesting: TLayout;
    Label41: TLabel;
    memTesting: TMemo;
    Button14: TButton;
    laySettings: TScrollBox;
    layFontFamily: TRectangle;
    cbFontFamily: TComboBox;
    imgFontFamily: TSkSvg;
    layFontFamilyTitleDescription: TLayout;
    lblFontFamilyTitle: TLabel;
    lblFontFamilyDescription: TLabel;
    layLanguage: TRectangle;
    cbLanguage: TComboBox;
    imgLanguage: TSkSvg;
    layLanguageTitleDescription: TLayout;
    lblLanguageTitle: TLabel;
    lblLanguageDescription: TLabel;
    layLineNumbers: TRectangle;
    imgLineNumbers: TSkSvg;
    layLineNumbersTitleDescription: TLayout;
    lblLineNumbersTitle: TLabel;
    lblLineNumbersDescription: TLabel;
    SwitchLineNumbers: TSwitch;
    lblSwitchLineNumbers: TLabel;
    layTheme: TRectangle;
    cbTheme: TComboBox;
    imgTheme: TSkSvg;
    layThemeTitleDescription: TLayout;
    lblThemeTitle: TLabel;
    lblThemeDescription: TLabel;
    layWordWrap: TRectangle;
    imgWordWrap: TSkSvg;
    layWordWrapTitleDescription: TLayout;
    lblWordWrapTitle: TLabel;
    lblWordWrapDescription: TLabel;
    SwitchWordWrap: TSwitch;
    lblSwitchWordWrap: TLabel;
    lblTopSettings: TLabel;
    layChangeLog: TScrollBox;
    layMemoChangeLog: TRectangle;
    memChangeLog: TMemo;
    lblChangeLog: TLabel;
    RoundRect3: TRoundRect;
    Label24: TLabel;
    StyleBook1: TStyleBook;
    procedure btnNavItemMouseEnter(Sender: TObject);
    procedure btnNavItemMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
    procedure btnAllToolsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowFrame(aName: String; bShowNavigation: Boolean = True);
    procedure LogInfo(sString: String);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.RoundRect1Click(Sender: TObject);
begin
  ShowFrame('Settings', True);
end;

procedure TfrmMain.ShowFrame(aName: String; bShowNavigation: Boolean);
var
  aFrameController: IFrameController;
begin
  aName := 'lay' + aName;
  for var I := 0 to LayoutContainer.Children.Count-1 do // Loop through all frames and hide them
    TControl(LayoutContainer.Children.Items[I]).Visible := False;

  var cmpFrameLayoutName := FindComponent(aName); // Find the selected frame
  if (cmpFrameLayoutName <> nil) then
  begin
    TControl(cmpFrameLayoutName).Visible := True; // Show the selected frame
    if (cmpFrameLayoutName is TFrame) then // Check if the frame is a TFrame
    begin
      if Supports(TFrame(cmpFrameLayoutName), IFrameController, aFrameController) then
        aFrameController.FrameShow; // Call FrameShow Event if it's a Frame

      var OnResizeEvent := TNotifyEvent(TFrame(cmpFrameLayoutName).OnResize);
      var NilEvent := TNotifyEvent(nil);
      if (TMethod(OnResizeEvent) <> TMethod(NilEvent)) then
        TFrame(cmpFrameLayoutName).OnResize(nil); // Call onResize Event if it's a Frame

      MultiView.Visible := bShowNavigation;
    end;
  end else ShowMessage('This frame is not available');
end;

procedure TfrmMain.btnAllToolsClick(Sender: TObject);
begin
  ShowFrame('Dashboards', True);
end;

procedure TfrmMain.btnNavItemMouseEnter(Sender: TObject);
begin
  TShape(Sender).Fill.Kind := TBrushKind.Solid;
  TShape(Sender).Fill.Color := $FFF3F4F6;
end;

procedure TfrmMain.btnNavItemMouseLeave(Sender: TObject);
begin
  TShape(Sender).Fill.Kind := TBrushKind.None;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
  procedure CreateFrame(aFrame: TFrame; FrameName: String);
    var aFrameController: IFrameController;
  begin
    aFrame.Name := 'lay' + FrameName;
    aFrame.Visible := False;
    aFrame.Parent := LayoutContainer;
    aFrame.Align := TAlignLayout.Client;
    if Supports(aFrame, IFrameController, aFrameController) then
      aFrameController.SetFrameInterface(self);
  end;
begin
  CreateFrame(TFrame_WelcomeBack.Create(Self),'WelcomeBack');
  CreateFrame(TFrame_SignIn.Create(Self),'SignIn');

  ShowFrame('WelcomeBack', False);

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  dmAPI.AdminSite.Clear;
end;

procedure TfrmMain.LogInfo(sString: String);
begin
  Memo1.Lines.Add(sString);
end;

end.
