unit uAPI;

interface

uses
  System.SysUtils,
  System.Classes,
  System.UITypes,
  System.JSON,
  System.Net.HttpClient,

  FMX.Graphics,

  REST.Types,
  REST.Client,

  Data.Bind.Components,
  Data.Bind.ObjectScope,

  uUtilities, System.ImageList, FMX.ImgList;

type
  TAdminSite = record
    title: String;
    description: String;
    logo_url: String;
    logo: TBitmap;
    accent_color: TAlphaColor;
    locale: String;
    url: String;
    version: String;
    procedure Clear;
  end;
  TdmAPI = class(TDataModule)
    RESTClientAdmin: TRESTClient;
    reqAdminSession: TRESTRequest;
    resAdminSession: TRESTResponse;
    reqAdminSite: TRESTRequest;
    resAdminSite: TRESTResponse;
    ImageList: TImageList;
  private
    { Private declarations }
    AdminAPISession: String;
    AdminAPISessionExpiry: TDateTime;
  public
    { Public declarations }
    AdminSite: TAdminSite;

    function Login(username, password: String): boolean;
    procedure SetAdminSite(AdminURL: String);
  end;

var
  dmAPI: TdmAPI;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdmAPI }

procedure TdmAPI.SetAdminSite(AdminURL: String);
  function StringToAlphaColor(const AString: string): TAlphaColor;
  var
    myRec: TAlphaColorRec;
  begin
    myRec.A := StrToInt('$' + Copy(AString, 2, 2));
    myRec.R := StrToInt('$' + Copy(AString, 5, 2));
    myRec.G := StrToInt('$' + Copy(AString, 7, 2));
    myRec.B := StrToInt('$' + Copy(AString, 9, 2));
    Result := myRec.Color;
  end;
begin
  AdminSite.Clear;
  RESTClientAdmin.BaseURL := AdminURL;

  try
    reqAdminSite.Execute;
    if (resAdminSite.StatusCode = 200) then
    begin
      var AdminSiteJSON := TJsonObject.ParseJSONValue(resAdminSite.Content);
      var AdminSiteObj := AdminSiteJSON.GetValue<TJsonObject>('site');

      AdminSite.title := AdminSiteObj.GetValue<String>('title');
      AdminSite.description := AdminSiteObj.GetValue<String>('description');
      AdminSite.logo_url := AdminSiteObj.GetValue<String>('logo');
      if ((AdminSite.logo_url.Contains('.')) and (AdminSite.logo_url.Length > 1)) then
        AdminSite.logo := DownloadImageFromURL(AdminSite.logo_url)
      else
        AdminSite.logo := ImageList.Source.Items[ImageList.Source.IndexOf('logo')].MultiResBitmap[0].Bitmap;
      AdminSite.accent_color := StringToAlphaColor(AdminSiteObj.GetValue<String>('accent_color').Replace('#','$FF'));
      AdminSite.locale := AdminSiteObj.GetValue<String>('locale');
      AdminSite.url := AdminSiteObj.GetValue<String>('url');
      AdminSite.version := AdminSiteObj.GetValue<String>('version');

      AdminSiteObj.Free;
    end;
  except

  end;
end;

function TdmAPI.Login(username, password: String): boolean;
begin
  Result := False;
  reqAdminSession.Params.ClearAndResetID;
  AdminAPISession := '';
  AdminAPISessionExpiry := NOW;
  var MyBody := TJsonObject.Create;

  try
    try
      MyBody.AddPair('username',username);
      MyBody.AddPair('password',password);

      reqAdminSession.AddBody(MyBody);

      reqAdminSession.Execute;
    finally
      if (resAdminSession.StatusCode = 200) or ((resAdminSession.StatusCode = 201)) then
      begin
        AdminAPISession := resAdminSession.Cookies.First.Value;
        AdminAPISessionExpiry := resAdminSession.Cookies.First.Expires;
        Result := True;
      end;
      MyBody.Free;
    end;
  except
    MyBody.Free;
  end;

end;

{ TAdminSite }

procedure TAdminSite.Clear;
begin
  if Assigned(Self.logo) then
    Self.logo.Free; // I'm not sure if this is needed or not, but I'm doing it just in case.
  Self := Default(TAdminSite);
end;

end.
