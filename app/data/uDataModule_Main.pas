unit uDataModule_Main;

interface

uses
  System.SysUtils,
  System.Classes,
  System.UITypes,
  System.JSON,
  System.Net.HttpClient,
  System.ImageList,
  System.Generics.Collections,

  FMX.Graphics,
  FMX.ImgList,

  REST.Types,
  REST.Client,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Data.DB,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Datasnap.DBClient,

  uUtilities;

type
  TAdminLogin = record
    success: boolean;
    login_message: String;
    login_type: String;
    status_code: Cardinal;
  end;
  TAdminSite = record
    title: String;
    description: String;
    logo_url: String;
    logo: TBitmap;
    icon_url: String;
    accent_color: TAlphaColor;
    locale: String;
    url: String;
    version: String;
    procedure Clear;
  end;

  TdmMain = class(TDataModule)
    RESTClientAdmin: TRESTClient;
    reqAdminSession: TRESTRequest;
    resAdminSession: TRESTResponse;
    reqAdminSite: TRESTRequest;
    resAdminSite: TRESTResponse;
    ImageList: TImageList;
    resAdminUsers: TRESTResponse;
    reqAdminUsers: TRESTRequest;
    tblAdminUsers: TClientDataSet;
    resAdminPosts: TRESTResponse;
    reqAdminPosts: TRESTRequest;
    tblAdminPosts: TClientDataSet;
  private
    { Private declarations }
    AdminAPISession: String;
    AdminAPISessionExpiry: TDateTime;
  public
    { Public declarations }
    AdminSite: TAdminSite;

    function Login(username, password: String): TAdminLogin;
    procedure SetAdminSite(AdminURL: String);

    function RefreshAdminUsers(): Boolean;
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdmAPI }

function TdmMain.RefreshAdminUsers: Boolean;
  procedure SetupClientDataSet();
  begin
    tblAdminUsers.Active := False;
    tblAdminUsers.DisableControls;
    try
      tblAdminUsers.FieldDefs.ClearAndResetID;
      tblAdminUsers.FieldDefs.Add('id', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('name', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('slug', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('email', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('profile_image', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('cover_image', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('bio', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('website', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('location', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('facebook', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('twitter', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('accessibility', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('status', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('meta_title', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('meta_description', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('tour', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('last_seen', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('comment_notifications', TFieldType.ftBoolean);
      tblAdminUsers.FieldDefs.Add('free_member_signup_notification', TFieldType.ftBoolean);
      tblAdminUsers.FieldDefs.Add('paid_subscription_started_notification', TFieldType.ftBoolean);
      tblAdminUsers.FieldDefs.Add('paid_subscription_canceled_notification', TFieldType.ftBoolean);
      tblAdminUsers.FieldDefs.Add('mention_notifications', TFieldType.ftBoolean);
      tblAdminUsers.FieldDefs.Add('milestone_notifications', TFieldType.ftBoolean);
      tblAdminUsers.FieldDefs.Add('donation_notifications', TFieldType.ftBoolean);
      tblAdminUsers.FieldDefs.Add('created_at', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('updated_at', TFieldType.ftString, 200);
      tblAdminUsers.FieldDefs.Add('url', TFieldType.ftString, 200);
      tblAdminUsers.CreateDataSet;
    finally
      tblAdminUsers.EnableControls;
    end;
  end;
begin
  Result := False;
  reqAdminUsers.Params.ClearAndResetID;

  try
    reqAdminUsers.Execute;
    if (resAdminSite.StatusCode = 200) then
    begin
        SetupClientDataSet;
        var AdminUsersJSON := TJSONObject.ParseJSONValue(resAdminUsers.Content);
        var AdminUsersArr := AdminUsersJSON.GetValue<TJSONArray>('users') as TJSONArray;

        tblAdminUsers.DisableControls;
        tblAdminUsers.Open;
        try
          for var I in AdminUsersArr do
          begin
            tblAdminUsers.Insert;

            tblAdminUsers.FieldByName('id').AsString := I.GetValue<String>('id');
            tblAdminUsers.FieldByName('name').AsString := I.GetValue<String>('name');
            tblAdminUsers.FieldByName('slug').AsString := I.GetValue<String>('slug');
            tblAdminUsers.FieldByName('email').AsString := I.GetValue<String>('email');
            tblAdminUsers.FieldByName('profile_image').AsString := I.GetValue<String>('profile_image');
            tblAdminUsers.FieldByName('cover_image').AsString := I.GetValue<String>('cover_image');
            tblAdminUsers.FieldByName('bio').AsString := I.GetValue<String>('bio');
            tblAdminUsers.FieldByName('website').AsString := I.GetValue<String>('website');
            tblAdminUsers.FieldByName('location').AsString := I.GetValue<String>('location');
            tblAdminUsers.FieldByName('facebook').AsString := I.GetValue<String>('facebook');
            tblAdminUsers.FieldByName('twitter').AsString := I.GetValue<String>('twitter');
            tblAdminUsers.FieldByName('accessibility').AsString := I.GetValue<String>('accessibility');
            tblAdminUsers.FieldByName('status').AsString := I.GetValue<String>('status');
            tblAdminUsers.FieldByName('meta_title').AsString := I.GetValue<String>('meta_title');
            tblAdminUsers.FieldByName('meta_description').AsString := I.GetValue<String>('meta_description');
            tblAdminUsers.FieldByName('tour').AsString := I.GetValue<String>('tour');
            tblAdminUsers.FieldByName('last_seen').AsString := I.GetValue<String>('last_seen');
            tblAdminUsers.FieldByName('comment_notifications').AsBoolean := I.GetValue<Boolean>('comment_notifications');
            tblAdminUsers.FieldByName('free_member_signup_notification').AsBoolean := I.GetValue<Boolean>('free_member_signup_notification');
            tblAdminUsers.FieldByName('paid_subscription_started_notification').AsBoolean := I.GetValue<Boolean>('paid_subscription_started_notification');
            tblAdminUsers.FieldByName('paid_subscription_canceled_notification').AsBoolean := I.GetValue<Boolean>('paid_subscription_canceled_notification');
            tblAdminUsers.FieldByName('mention_notifications').AsBoolean := I.GetValue<Boolean>('mention_notifications');
            tblAdminUsers.FieldByName('milestone_notifications').AsBoolean := I.GetValue<Boolean>('milestone_notifications');
            tblAdminUsers.FieldByName('donation_notifications').AsBoolean := I.GetValue<Boolean>('donation_notifications');
            tblAdminUsers.FieldByName('created_at').AsString := I.GetValue<String>('created_at');
            tblAdminUsers.FieldByName('updated_at').AsString := I.GetValue<String>('updated_at');
            tblAdminUsers.FieldByName('url').AsString := I.GetValue<String>('url');

            tblAdminUsers.Post;
          end;
        finally
          tblAdminUsers.EnableControls;
        end;



        AdminUsersJSON.Free;
    end;
  except

  end;
end;

procedure TdmMain.SetAdminSite(AdminURL: String);
  function StringToAlphaColor(const AString: string): TAlphaColor;
  var
    myRec: TAlphaColorRec;
  begin
    myRec.A := StrToInt('$' + Copy(AString, 2, 2));
    myRec.R := StrToInt('$' + Copy(AString, 4, 2));
    myRec.G := StrToInt('$' + Copy(AString, 6, 2));
    myRec.B := StrToInt('$' + Copy(AString, 8, 2));
    Result := myRec.Color;
  end;
begin
  AdminSite.Clear;
  RESTClientAdmin.BaseURL := AdminURL;

  try
    reqAdminSite.Execute;
    if (resAdminSite.StatusCode = 200) then
    begin
      var AdminSiteJSON: TJsonValue := TJsonObject.ParseJSONValue(resAdminSite.Content);
      var AdminSiteObj := AdminSiteJSON.GetValue<TJsonObject>('site');

      AdminSite.title := AdminSiteObj.GetValue<String>('title');
      AdminSite.description := AdminSiteObj.GetValue<String>('description');
      AdminSite.logo_url := AdminSiteObj.GetValue<String>('logo');
      if ((AdminSite.logo_url.Contains('.')) and (AdminSite.logo_url.Length > 1)) then
        AdminSite.logo := DownloadImageFromURL(AdminSite.logo_url)
      else
        AdminSite.logo := ImageList.Source.Items[ImageList.Source.IndexOf('logo')].MultiResBitmap[0].Bitmap;
      AdminSite.icon_url := AdminSiteObj.GetValue<String>('icon');
      AdminSite.accent_color := StringToAlphaColor(AdminSiteObj.GetValue<String>('accent_color').Replace('#','$FF'));
      AdminSite.locale := AdminSiteObj.GetValue<String>('locale');
      AdminSite.url := AdminSiteObj.GetValue<String>('url');
      AdminSite.version := AdminSiteObj.GetValue<String>('version');

      AdminSiteJSON.Free;
    end;
  except

  end;
end;

function TdmMain.Login(username, password: String): TAdminLogin;
begin
  Result.success := False;
  reqAdminSession.Params.ClearAndResetID;
  AdminAPISession := '';
  AdminAPISessionExpiry := NOW;
  var MyBody := TJSONObject.Create;
  try
    try
      MyBody.AddPair('username',username);
      MyBody.AddPair('password',password);

      reqAdminSession.AddBody(MyBody);

      reqAdminSession.Execute;

    finally
      MyBody.Free;
      Result.status_code := resAdminSession.StatusCode;
      if ((resAdminSession.StatusCode = 200) or (resAdminSession.StatusCode = 201)) then
      begin
        AdminAPISession := resAdminSession.Cookies.First.Value;
        AdminAPISessionExpiry := resAdminSession.Cookies.First.Expires;
        Result.success := True;
        Result.login_message := 'Cookie Session Created';
        Result.login_type := resAdminSession.Content;
      end;
      if ((resAdminSession.StatusCode = 401) or
          (resAdminSession.StatusCode = 403) or
          (resAdminSession.StatusCode = 404) or
          (resAdminSession.StatusCode = 429)) then
      begin
        // 401 = Access Denied
        // 403 = Authorization Failed
        // 404 = User Not Found
        // 429 = Too Many Login Attempts

        var AdminSessionJSON := TJSONObject.ParseJSONValue(resAdminSession.Content);
        var AdminSessionArr := AdminSessionJSON.GetValue<TJSONArray>('errors') as TJSONArray;

        Result.login_message := AdminSessionArr.Items[0].GetValue<String>('message');
        Result.login_type := AdminSessionArr.Items[0].GetValue<String>('type');

        AdminSessionJSON.Free;
      end;
    end;
  except
    MyBody.Free;
  end;

end;

{ TAdminSite }

procedure TAdminSite.Clear;
begin
  if Assigned(Self.logo) then    
    if ((Self.logo_url.Contains('.')) and (Self.logo_url.Length > 1)) then
      FreeAndNil(Self.logo);
  Self := Default(TAdminSite);
end;

end.
