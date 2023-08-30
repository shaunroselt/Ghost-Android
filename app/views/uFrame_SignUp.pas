unit uFrame_SignUp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, System.Skia,
  System.Math.Vectors, FMX.Controls3D, FMX.Layers3D, FMX.Skia, FMX.Objects,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Edit;

type
  TFrame_SignUp = class(TFrame)
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
    Layout3D1: TLayout3D;
    Label5: TLabel;
    btnGetStartedHere: TLabel;
    layContainerEmailAddress: TLayout;
    lblEmailAddress: TLabel;
    layEmailAddress: TRectangle;
    edtEmailAddress: TEdit;
    layContainerPassword: TLayout;
    lblPassword: TLabel;
    layPassword: TRectangle;
    edtPassword: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
