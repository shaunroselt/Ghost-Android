unit uDataModule_SignUp;

interface

uses
  System.SysUtils,
  System.Classes,

  uDataModule_Themes;

type
  TSignUpData = record
    Theme: TGhostOfficialTheme;
    procedure ResetData();
  end;
  TdmSignUp = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Data: TSignUpData;
  end;

var
  dmSignUp: TdmSignUp;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TdmSignUp.DataModuleCreate(Sender: TObject);
begin
  Data.ResetData;
end;

{ TSignUpData }

procedure TSignUpData.ResetData;
begin
  Self.Theme := GetTheme('Casper');
end;

end.
