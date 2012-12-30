unit UAVTransportService;

interface

uses
   SysUtils, Variants, Classes, ExtCtrls, UPNPLib_TLB;

type
  TAVTransportService = class
  private
    AVTransportService: IUPnPService;
    FstateOK:boolean;
    Timer:TTimer;
    Log:TStrings;
    RelativeTimePosition,TransportStatus,TransportState:string;
    procedure OnTimer(Sender:TObject);
    function IsPlaying:boolean;
    function IsPaused:boolean;
    procedure GetPositionInfo(var CurrentTRack, CurrentTrackDuration,
      CurrentTrackMetaData, CurrentTrackURI, RElativeTimePosition,
      AbsoluteTimePosition, RelativeCounterPosition,
      AbsoluteCounterPosition: string);
    procedure GetTransportInfo(var TransportState, TransportStatus,
      TransportPlaySpeed: string);
  public
    procedure SetAVTransportURI(InstanceId:integer;CurrentUri:string;CurrentURIMetaData:string);
    procedure Play;
    function GetState:string;
    constructor Create(Log:TStrings);
    procedure SetAVtransportservice(AVtransportservice:IUPnPService);
    destructor Destroy; override;
    procedure Pause;
    function GetPosition:string;
    function SetPosition(position:string):boolean;
    procedure Stop;
   function PlayStatus:integer;          // type TPlayStatus = (PSPlay,PSPaused,PSStop);
  end;

implementation

{ TAVTransportService }

uses WinSock;

constructor TAVTransportService.Create(Log:TStrings);
begin
  AVTransportService:=NIL;
  self.Log:=Log;
  Timer:=TTimer.Create(NIL);
  Timer.Interval:=2000;
  Timer.OnTimer:=OnTimer;
  Timer.Enabled:=true;
  FStateOK:=false;
end;

procedure TAVTransportService.SetAVTransportService(AVtransportservice: IUPnPService);
begin
  self.AVTransportService:=AVtransportservice;
end;

destructor TAVTransportService.Destroy;
begin
  Timer.Enabled:=false;
  if IsPlaying or IsPaused then Stop;
end;

function TAVTransportService.GetPosition: string;
begin
  result:=RelativeTimePosition;
end;

function TAVTransportService.GetState: string;
begin
  result:=  RelativeTimePosition+' ' +TransportStatus + ' ' + TransportState;
end;

function TAVTransportService.IsPaused: boolean;
begin
  result:= (TransportState = 'PAUSED_PLAYBACK') and (TransportStatus = 'OK');
end;

function TAVTransportService.IsPlaying: boolean;
begin
  result:= ((TransportState = 'PLAYING') or (TransportState = 'TRANSITIONING')) and (TransportStatus = 'OK');
end;

procedure TAVTransportService.OnTimer(Sender: TObject);
VAR dummy:string;
begin
  TransportStatus:='Not OK';
  if FStateOK then
(*  try
    RelativeTimePosition:=AVTransportService.QueryStateVariable('RelativeTimePosition');
    TransportStatus:=AVTransportService.QueryStateVariable('TransportStatus');
    TransportState:=AVTransportService.QueryStateVariable('TransportState');

  except end *)
  begin
    GetTransportInfo(TransportState,TransportStatus,dummy);
    GetPositionInfo(dummy,dummy,dummy,dummy,RelativeTimePosition,dummy,dummy,dummy);
  end;
end;

procedure TAVTransportService.GetTransportInfo(VAR TransportState,TransportStatus, TransportPlaySpeed:string);
VAR ovIn,ovOut : OleVariant;
begin
  ovIn:=VarArrayCreate([0, 0], varVariant);
  ovin[0]:=0;
  ovOut:=VarArrayCreate([0, 2], varVariant);
  try
    AVTransportService.InvokeAction('GetTransportInfo',ovIn,ovOut);
  except
    exit;
  end;
  TransportState:=ovOut[0];
  TransportStatus:=ovOut[1];
  TransportPlaySpeed:=ovOut[2];
end;

procedure TAVTransportService.GetPositionInfo(VAR CurrentTRack, CurrentTrackDuration, CurrentTrackMetaData, CurrentTrackURI, RElativeTimePosition, AbsoluteTimePosition, RelativeCounterPosition, AbsoluteCounterPosition:string);
VAR ovIn,ovOut : OleVariant;
begin
  ovIn:=VarArrayCreate([0, 0], varVariant);
  ovin[0]:=0;
  ovOut:=VarArrayCreate([0, 7], varVariant);
  try
    AVTransportService.InvokeAction('GetPositionInfo',ovIn,ovOut);
  except
    exit;
  end;
  CurrentTRack:=ovOut[0];
  CurrentTrackDuration:=ovOut[1];
  CurrentTrackMetaData:=ovOut[2];
  CurrentTrackURI:=ovOut[3];
  RElativeTimePosition:=ovOut[4];
  AbsoluteTimePosition:=ovOut[5];
  RelativeCounterPosition:=ovOut[6];
  AbsoluteCounterPosition:=ovOut[7];
end;

procedure TAVTransportService.Pause;
VAR ovIn,ovOut : OleVariant;
begin
  if IsPlaying then
  begin
    ovIn:=VarArrayCreate([0, 0], varVariant);
    ovin[0]:=0;
    ovOut:=null;
    try
      AVTransportService.InvokeAction('Pause',ovIn,ovOut);
    except end;
  end
  else if IsPaused then Play;
end;

function TAVTransportService.SetPosition(position:string):boolean;
VAR ovIn,ovOut : OleVariant;
begin
  result:=false;
  if isPaused then Play;
  if not IsPlaying then exit;
  ovIn:=VarArrayCreate([0, 2], varVariant);
  ovin[0]:=0;
  ovin[1]:='REL_TIME';
  ovin[2]:=position;
  ovOut:=null;
  try
    AVTransportService.InvokeAction('Seek',ovIn,ovOut);
    result:=true;
  except end;
end;

procedure TAVTransportService.Stop;
VAR ovIn,ovOut : OleVariant;
begin
  ovIn:=VarArrayCreate([0, 0], varVariant);
  ovin[0]:=0;
  ovOut:=null;
  try
    AVTransportService.InvokeAction('Stop',ovIn,ovOut);
  except end;
end;

procedure TAVTransportService.Play;
VAR ovIn,ovOut : OleVariant;
begin
   ovIn := VarArrayCreate([0, 1], varVariant);
   ovIn[0]:= 0;
   ovIn[1]:= '1';
   ovOut := null ;
   try
     AVTransportService.InvokeAction('Play',ovIn,ovOut);
     Log.Add('Play: OK');
     FStateOK:=true;
   except
     Log.Add('Error in Play');
     FStateOK:=false;
   end;
end;

function TAVTransportService.PlayStatus: integer;  // type TPlayStatus = (PSPlay,PSPaused,PSStop);
begin
  if TransportStatus='Not OK' then result:=3
  else result:=2;
  if IsPaused then result:=1;
  if IsPlaying then result:=0;
end;

// ip code code copied from http://www.delphigeist.com/2010/03/how-to-get-ip-address.html
function GetIPAddress: Integer;
var
  Buffer: array[0..255] of AnsiChar;
  RemoteHost: PHostEnt;
begin
  Winsock.GetHostName(@Buffer, 255);
  RemoteHost := Winsock.GetHostByName(Buffer);
  if RemoteHost = nil then
    Result := winsock.htonl($07000001) { 127.0.0.1 }
  else
    Result := longint(pointer(RemoteHost^.h_addr_list^)^);
    Result := Winsock.ntohl(Result);
end;// function GetIPAddress: Integer;

function GetIPAddressAsString: String;
var
  tempAddress: Integer;
  Buffer: array[0..3] of Byte absolute tempAddress;
begin
  tempAddress := GetIPAddress;
  Result := Format('%d.%d.%d.%d', [Buffer[3], Buffer[2], Buffer[1], Buffer[0]]);
end;// function GetIPAddressAsString: String;

procedure TAVTransportService.SetAVTransportURI(InstanceId: integer; CurrentUri, CurrentURIMetaData: string);
VAR ovIn,ovOut : OleVariant;
    procedure replacetext(from,too:string;VAR what:string);
    VAR s:string;
        p:integer;
    begin
      p:=pos(from,what);
      s:=Copy(what,1,p-1)+too+Copy(what,p+length(from));
      what:=s;
    end;
begin
   replaceText('127.0.0.1',GetIPAddressAsString,CurrentURI);
   ovIn := VarArrayCreate([0, 2], varVariant);
   ovIn[0]:= 0;
   ovIn[1]:= CurrentURI;
   ovIn[2]:= CurrentURIMetaData;
   ovOut := null;
   try
     AVTransportService.InvokeAction('SetAVTransportURI',ovIn,ovOut);
     Log.Add('SetAVTransportURI: OK');
   except
     Log.Add('Error in SetAVTransportURI');
   end;
end;


end.

