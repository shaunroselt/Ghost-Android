unit uGhostIcons;

interface

uses System.RegularExpressions;

type
  TGhostIcon = record
    name: String;
    svg: String;
  end;

const
  GhostIconsArray: array[0..1] of TGhostIcon = (
    (
      name: 'chevron-down';
      svg: '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0' +
           ' 0 16 16">  <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5' +
           '.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/></svg>';
    ),
    (
      name: 'chevron-up';
      svg: '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0' +
           ' 16 16">  <path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 ' +
           '0 0 1-.708-.708l6-6z"/></svg>';
    )
  );

function GetGhostIcon(IconName: String): String;
function GetGhostIconPathData(IconName: String): String;

implementation

function GetGhostIconPathData(IconName: String): String;
// This function hasn't been tested on all the icons and might not work on all of them
begin
  Result := '';
  var Matches := TRegEx.Matches(GetGhostIcon(IconName), '<path\s+d="([^"]+)"');
  if Matches.Count > 0 then
  begin
    var Match: TMatch := Matches[0];
    var PathData := Match.Groups[1].Value;
    Result := PathData;
  end;
end;

function GetGhostIcon(IconName: String): String;
begin
  Result := '';
  for var bIcon in GhostIconsArray do
    if bIcon.name = IconName then
    begin
      Result := bIcon.svg;
      Exit;
    end;
end;

end.
