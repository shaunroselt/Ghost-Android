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
  uAPI;

type
  TFrame_SignIn = class(TFrame, IFrameController)
    Layout1: TLayout;
    Layout6: TLayout;
    imgSignInLogo: TImage;
    lblSignInTitle: TLabel;
    Layout8: TLayout;
    Label11: TLabel;
    Rectangle5: TRectangle;
    edtEmailAddress: TEdit;
    btnSignIn: TRectangle;
    Label14: TLabel;
    Layout7: TLayout;
    Label8: TLabel;
    Rectangle7: TRectangle;
    edtPassword: TEdit;
    Label10: TLabel;
    Line1: TLine;
    procedure btnSignInClick(Sender: TObject);
  private
    { Private declarations }
    FFrameInterface: IFrameInterface;
  public
    { Public declarations }
    procedure SetFrameInterface(const aFrameInterface: IFrameInterface);
  end;

implementation

{$R *.fmx}

{ TFrame_SignIn }

procedure TFrame_SignIn.btnSignInClick(Sender: TObject);
begin
  FFrameInterface.ShowFrame('Dashboards', True);
end;

procedure TFrame_SignIn.SetFrameInterface(const aFrameInterface: IFrameInterface);
begin
  FFrameInterface := aFrameInterface;
end;

end.
