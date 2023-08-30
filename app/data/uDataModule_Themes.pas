unit uDataModule_Themes;

interface

uses
  System.SysUtils,
  System.Classes;

type
  TGhostOfficialTheme = record
    name: String;
    category: String;
    url: String;
    previewUrl: String;
    ref: String;
    image: String;
  end;

  TdmThemes = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
    OfficialThemes: array[0..16] of TGhostOfficialTheme = (
      (
          name: 'Casper';
          category: 'Blog';
          previewUrl: 'https://demo.ghost.io/';
          ref: 'default';
          image: 'assets/img/themes/Casper.png';
      ), (
          name: 'Headline';
          category: 'News';
          url: 'https://github.com/TryGhost/Headline';
          previewUrl: 'https://headline.ghost.io';
          ref: 'TryGhost/Headline';
          image: 'assets/img/themes/Headline.png';
      ), (
          name: 'Edition';
          category: 'Newsletter';
          url: 'https://github.com/TryGhost/Edition';
          previewUrl: 'https://edition.ghost.io/';
          ref: 'TryGhost/Edition';
          image: 'assets/img/themes/Edition.png';
      ), (
          name: 'Solo';
          category: 'Blog';
          url: 'https://github.com/TryGhost/Solo';
          previewUrl: 'https://solo.ghost.io';
          ref: 'TryGhost/Solo';
          image: 'assets/img/themes/Solo.png';
      ), (
          name: 'Taste';
          category: 'Blog';
          url: 'https://github.com/TryGhost/Taste';
          previewUrl: 'https://taste.ghost.io';
          ref: 'TryGhost/Taste';
          image: 'assets/img/themes/Taste.png';
      ), (
          name: 'Episode';
          category: 'Podcast';
          url: 'https://github.com/TryGhost/Episode';
          previewUrl: 'https://episode.ghost.io';
          ref: 'TryGhost/Episode';
          image: 'assets/img/themes/Episode.png';
      ), (
          name: 'Digest';
          category: 'Newsletter';
          url: 'https://github.com/TryGhost/Digest';
          previewUrl: 'https://digest.ghost.io/';
          ref: 'TryGhost/Digest';
          image: 'assets/img/themes/Digest.png';
      ), (
          name: 'Bulletin';
          category: 'Newsletter';
          url: 'https://github.com/TryGhost/Bulletin';
          previewUrl: 'https://bulletin.ghost.io/';
          ref: 'TryGhost/Bulletin';
          image: 'assets/img/themes/Bulletin.png';
      ), (
          name: 'Alto';
          category: 'Blog';
          url: 'https://github.com/TryGhost/Alto';
          previewUrl: 'https://alto.ghost.io';
          ref: 'TryGhost/Alto';
          image: 'assets/img/themes/Alto.png';
      ), (
          name: 'Dope';
          category: 'Magazine';
          url: 'https://github.com/TryGhost/Dope';
          previewUrl: 'https://dope.ghost.io';
          ref: 'TryGhost/Dope';
          image: 'assets/img/themes/Dope.png';
      ), (
          name: 'Wave';
          category: 'Podcast';
          url: 'https://github.com/TryGhost/Wave';
          previewUrl: 'https://wave.ghost.io';
          ref: 'TryGhost/Wave';
          image: 'assets/img/themes/Wave.png';
      ), (
          name: 'Edge';
          category: 'Photography';
          url: 'https://github.com/TryGhost/Edge';
          previewUrl: 'https://edge.ghost.io';
          ref: 'TryGhost/Edge';
          image: 'assets/img/themes/Edge.png';
      ), (
          name: 'Dawn';
          category: 'Newsletter';
          url: 'https://github.com/TryGhost/Dawn';
          previewUrl: 'https://dawn.ghost.io/';
          ref: 'TryGhost/Dawn';
          image: 'assets/img/themes/Dawn.png';
      ), (
          name: 'Ease';
          category: 'Documentation';
          url: 'https://github.com/TryGhost/Ease';
          previewUrl: 'https://ease.ghost.io';
          ref: 'TryGhost/Ease';
          image: 'assets/img/themes/Ease.png';
      ), (
          name: 'Ruby';
          category: 'Magazine';
          url: 'https://github.com/TryGhost/Ruby';
          previewUrl: 'https://ruby.ghost.io';
          ref: 'TryGhost/Ruby';
          image: 'assets/img/themes/Ruby.png';
      ), (
          name: 'London';
          category: 'Photography';
          url: 'https://github.com/TryGhost/London';
          previewUrl: 'https://london.ghost.io';
          ref: 'TryGhost/London';
          image: 'assets/img/themes/London.png';
      ), (
          name: 'Journal';
          category: 'Newsletter';
          url: 'https://github.com/TryGhost/Journal';
          previewUrl: 'https://journal.ghost.io/';
          ref: 'TryGhost/Journal';
          image: 'assets/img/themes/Journal.png';
      )
    );


function GetTheme(ThemeName: String): TGhostOfficialTheme;

var
  dmThemes: TdmThemes;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


function GetTheme(ThemeName: String): TGhostOfficialTheme;
begin
  for var I in OfficialThemes do
    if (I.name = ThemeName) then
    begin
      Result := I;
      break;
    end;
end;

end.
