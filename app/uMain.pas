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
    MultiView: TMultiView;
    MultiViewScrollBox: TVertScrollBox;
    layNavDashboards: TLayout;
    btnNavDashboards: TRectangle;
    imgNavDashboards: TSkSvg;
    lblNavDashboards: TLabel;
    layNavTesting: TLayout;
    btnNavTesting: TRectangle;
    imgNavTesting: TSkSvg;
    lblNavTesting: TLabel;
    layNavPostsContainer: TLayout;
    layNavPosts: TLayout;
    btnNavPosts: TRectangle;
    imgNavPosts: TSkSvg;
    lblNavPosts: TLabel;
    imgNavPostsExpandCollapse: TSkSvg;
    layNavPostsDrafts: TLayout;
    btnNavPostsDrafts: TRectangle;
    lblNavPostsDrafts: TLabel;
    layNavPostsPublished: TLayout;
    btnNavPostsPublished: TRectangle;
    lblNavPostsPublished: TLabel;
    layNavPostsScheduled: TLayout;
    btnNavPostsScheduled: TRectangle;
    lblNavPostsScheduled: TLabel;
    layNavSettings: TLayout;
    Layout9: TLayout;
    Image2: TImage;
    Label9: TLabel;
    imgNavPostsAdd: TSkSvg;
    layNavViewSite: TLayout;
    btnNavViewSite: TRectangle;
    imgNavViewSite: TSkSvg;
    lblNavViewSite: TLabel;
    layNavMembers: TLayout;
    btnNavMembers: TRectangle;
    imgNavMembers: TSkSvg;
    lblNavMembers: TLabel;
    layNavTags: TLayout;
    btnNavTags: TRectangle;
    imgNavTags: TSkSvg;
    lblNavTags: TLabel;
    layNavPages: TLayout;
    btnNavPages: TRectangle;
    imgNavPages: TSkSvg;
    lblNavPages: TLabel;
    btnNavSettings: TRoundRect;
    imgNavSettings: TSkSvg;
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
    memTesting: TMemo;
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
    layNavMembersCount: TRoundRect;
    lblNavMembersCount: TLabel;
    StyleBook1: TStyleBook;
    layNavExplore: TLayout;
    btnNavExplore: TRectangle;
    imgNavExplore: TSkSvg;
    lblNavExplore: TLabel;
    Layout2: TLayout;
    Splitter1: TSplitter;
    procedure btnNavItemMouseEnter(Sender: TObject);
    procedure btnNavItemMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNavSettingsClick(Sender: TObject);
    procedure btnNavDashboardsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNavTestingClick(Sender: TObject);
    procedure btnNavViewSiteClick(Sender: TObject);
    procedure btnNavExploreClick(Sender: TObject);
    procedure btnNavPostsClick(Sender: TObject);
    procedure btnNavPagesClick(Sender: TObject);
    procedure btnNavTagsClick(Sender: TObject);
    procedure btnNavMembersClick(Sender: TObject);
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

procedure TfrmMain.btnNavSettingsClick(Sender: TObject);
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
    end;
    MultiView.Visible := bShowNavigation;
  end else ShowMessage('This frame is not available');
end;

procedure TfrmMain.btnNavDashboardsClick(Sender: TObject);
begin
  ShowFrame('Dashboards', True);
end;

procedure TfrmMain.btnNavExploreClick(Sender: TObject);
begin
  ShowFrame('Explore', True);
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

procedure TfrmMain.btnNavMembersClick(Sender: TObject);
begin
  ShowFrame('Members', True);
end;

procedure TfrmMain.btnNavPagesClick(Sender: TObject);
begin
  ShowFrame('Pages', True);
end;

procedure TfrmMain.btnNavPostsClick(Sender: TObject);
begin
  ShowFrame('Posts', True);
end;

procedure TfrmMain.btnNavTagsClick(Sender: TObject);
begin
  ShowFrame('Tags', True);
end;

procedure TfrmMain.btnNavTestingClick(Sender: TObject);
begin
  ShowFrame('Testing', True);
end;

procedure TfrmMain.btnNavViewSiteClick(Sender: TObject);
begin
  ShowFrame('ViewSite', True);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmAPI.AdminSite.Clear;
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
  layNavTesting.Visible := False;
  {$IFDEF DEBUG}
    layNavTesting.Visible := True;
  {$ENDIF}

  CreateFrame(TFrame_WelcomeBack.Create(Self),'WelcomeBack');
  CreateFrame(TFrame_SignIn.Create(Self),'SignIn');

  ShowFrame('WelcomeBack', False);
end;

procedure TfrmMain.LogInfo(sString: String);
begin
  memTesting.Lines.Add(sString);
end;

end.
