unit uFrame_SignUpSiteDetails;

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
  TFrame_SignUpSiteDetails = class(TFrame, IFrameController)
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
