unit uUtilities;

interface

uses
  System.Classes,
  System.SysUtils,
  System.UITypes,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,

  FMX.Graphics;


function DownloadImageFromURL(URL: string): TBitmap;

function IncreaseOpacity(Color: TAlphaColor; Percentage: Single): TAlphaColor;
function AlphaColorToString(const AColor: TAlphaColor): string;

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

function IncreaseOpacity(Color: TAlphaColor; Percentage: Single): TAlphaColor;
begin
  Result := TAlphaColor(Round($FF * Percentage) shl 24 + Color and $FFFFFF);
end;

function AlphaColorToString(const AColor: TAlphaColor): string;
begin
  Result := '$' + IntToHex(TAlphaColorRec(AColor).A, 2) +
            IntToHex(TAlphaColorRec(AColor).R, 2) +
            IntToHex(TAlphaColorRec(AColor).G, 2) +
            IntToHex(TAlphaColorRec(AColor).B, 2);
end;

end.
