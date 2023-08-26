unit uUtilities;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,

  FMX.Graphics;


function DownloadImageFromURL(URL: string): TBitmap;

implementation

function DownloadImageFromURL(URL: string): TBitmap;
begin
  Result := nil;
  if ((URL.Contains('.')) and (URL.Length > 1)) then
  begin
    var HTTP := THTTPClient.Create;
    var Stream := TMemoryStream.Create;
    try
      HTTP.Get(URL, Stream);
      Stream.Position := 0;
      Result := TBitmap.Create;
      Result.LoadFromStream(Stream);
    finally
      HTTP.Free;
      Stream.Free;
    end;
  end;
end;

end.
