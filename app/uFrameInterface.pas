unit uFrameInterface;

interface

type
  IFrameInterface = interface
    ['{E7F0ABB0-5A10-4FA5-81CE-8627F536FBD2}']
    procedure ShowFrame(aName: String; bShowNavigation: Boolean = True);
    procedure LogInfo(sString: String);
  end;

  IFrameController = interface
    ['{5498E3C5-8BF3-4B86-937D-323FD2C2306D}']
    procedure SetFrameInterface(const aFrameInterface: IFrameInterface);
  end;

implementation

end.
