(*
 * (C) Copyright 2012 Ruud Ermers.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the GNU Lesser General Public License
 * (LGPL) version 2.1 which accompanies this distribution, and is available at
 * http://www.gnu.org/licenses/lgpl-2.1.html
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * Contributors:
 *     Ruud Ermers
 * History
     2012-12-28    1.0 Initial Release

   Usage:
    UUpnpDMC is a class that implements a DLNA DMC (Digital Media Controller)
    You can browse the available servers and renderers on your system.
    Once found, you can select an item from the server and play it on a renderer.
    Then you can pause, stop, play, seek that item

    You create a UUpnpDMC object by calling _create_, supplying an owner and a TStrings (not NIL) used as LOg
    You can search devices by _SearchDevices_
    Set _OnDeviceListChanged_ to receive notifaction on Devices available
    Then retrieve Servers and Renderers by inpecting _ServerCount_ and _GetServerName_ etc.
    Select a Server with _SetServerIndex_, the same for a Renderer
    Browse the Server tree with _BrowseRoot_ and subdirectories with _BrowseIndex_ go back with _Back_
    Inspect items with _GetItemName_ and _ItemCount_
    Select an item with _SetItemIndex_

    Now you can Play, Pause, Seek, SetPosition etc the item with the corresponding methods.
    You can retrieve information bij GetPosition and GetPlayStatus

   Notes:
    1. Tested with Delphi 2010
    2. You might test this with the supplied example
 *)
unit UUpnpDMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, ExtCtrls,Graphics, Controls, Forms, Generics.Collections,
  Dialogs,UPNPLib_TLB, StdCtrls, OleServer, ComObj, ActiveX, ComCtrls,xmldom, XMLIntf, msxmldom, XMLDoc, UAVTransportService;

type
  TDeviceListItem = class
    UPnPDevice:IUPnPDevice;
    constructor Create(IUPnPDevice:IUPnPDevice);
   end;
  TDevicelist = TList<TDeviceListItem>;
  TItemListItem = TDictionary<String,String>;
  TItemList = Tlist<TItemListItem>;

  TMediaRendererControl = class
  private
    RendererDevice:IUPnPDevice;
    AVTransport: TAVTransportService;
    mDuration:integer;
  public
    constructor Create;
    procedure SetRendererDevice(arenderer:IUPnPDevice);
    destructor Destroy; override;
    property Duration:integer read mDuration;
    procedure SetAVTransportURI(uri,meta,duration:string);
   end;
  TUpnpDMC = class
  private
    owner:TComponent;
    class var FLog:TStrings;
    RendererList: TDevicelist;
    ServerList: TDevicelist;
    ItemList:TItemList;
    FitemAsString:TStringList;
    FindDataServer,FindDataRenderer:integer;
    FRendererIndex,FServerIndex,FItemIndex:integer;
    ItemStack:TStack<integer>;
    class var FXMLDoc:TXMLDocument;
    UPnPDeviceFinder: TUPnPDeviceFinder;
    FCallback: IUPnPDeviceFinderCallback;
    FCallbackService:IUPnPServiceCallback;
    MediaRenderer:TMediaRendererControl;
    FOnDeviceListChanged: TNotifyEvent;
    procedure SetBrowseList(s: String);
    procedure Browse(StartIndex:integer);
    function GetDeviceListChanged:TNotifyEvent;
    procedure SetOnDeviceListChanged(const Value: TNotifyEvent);
    procedure DeviceAdded(lFindData: integer; const pDevice: IUPnPDevice);
    procedure DeviceRemoved(lFindData: integer; bstrUDN: string);
   public
    class property XMLDoc:TXMLDocument read FXMLDoc write FXMLDoc;
    class property Log:TStrings read FLog write FLog;
    constructor Create(aOwner:TComponent;aLog:TStrings);

    procedure SearchDevices;
    property OnDeviceListChanged:TNotifyEvent read GetDeviceListChanged write SetOnDeviceListChanged;

    function ServerCount:integer;
    procedure SetServerIndex(index:integer);
    function GetServerName(index:integer):string;
    function FindServer(name:string):integer;

    function RendererCount:integer;
    procedure SetRendererIndex(index:integer);
    function GetRendererName(index:integer):string;
    function FindRenderer(name:string):integer;

    function ItemCount:integer;
    procedure SetItemIndex(index:integer);
    function GetItemName(index:integer):string;
    function items:TStringList;
    function BrowseItems(index:integer):boolean;
    procedure BrowseItemsRoot;
    procedure Back;

    procedure PlayItem;
    procedure Stop;

    procedure Pause;
    procedure Play;

    function PlayStatus:integer;          // type TPlayStatus = (PSPlay,PSPaused,PSStop, Undefined=3);
    function GetPosition:integer;
    function SetPosition(position:integer):boolean;
    function GetItemDuration:integer;
    procedure Seek(amount:integer);
  end;

  function UpnpSecondsToTime(n:integer):string;

implementation

uses uComEnumerator;

function GetService(device:IUPnPDevice; service: string):IUPnPService;forward;
function UpnpTimeToSeconds(s:string):integer;forward;

var tempDevice : IUnknown;
    tempService: IUnknown;

type TCallback = class(TInterfacedObject, IUPnPDeviceFinderCallback, IUnknown)
  protected
    function DeviceAdded(lFindData: integer; const pDevice: IUPnPDevice): HRESULT;stdcall;
    function DeviceRemoved(lFindData: integer; const bstrUDN: widestring):HRESULT; stdcall;
    function SearchComplete(lFindData: integer): HRESULT; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
  public
    UpnpDMC:TUpnpDMC;
end;

TServiceCallback = class(TInterfacedObject, IUPnPServiceCallback)
  protected
    function StateVariableChanged(const pus: IUPnPService; pcwszStateVarName:PWideChar; vaValue: OleVariant): HResult; stdcall;
    function ServiceInstanceDied(const pus: IUPnPService): HResult; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
  end;

TPlayItem = class
  private
    mUri,mDuration:string;
    function GetDataFromId(Service:IUPnPService;id: string): string;
  public
    constructor Create(server:IUPnPDevice;item:TItemListItem);
  end;

function TCallback.DeviceAdded(lFindData: integer; const pDevice: IUPnPDevice):HRESULT;
begin
  UpnpDMC.DeviceAdded(lFindData,pDevice);
  result := S_OK;
end;


function TCallback.DeviceRemoved(lFindData: integer; const bstrUDN: widestring):HRESULT;
begin
  TUpnpDMC.Log.Add('Device removed: ' + bstrUDN);
  UpnpDMC.DeviceRemoved(lFindData,bstrUDN);
  result := S_OK;
end;

function TCallback.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  result := Inherited QueryInterface(IID, obj);
end;

function TCallback.SearchComplete(lFindData: integer): HRESULT;
begin
  TUpnpDMC.Log.Add('Search Complete');
  result := S_OK;
end;

function TServiceCallback.StateVariableChanged(const pus: IUPnPService;pcwszStateVarName: PWideChar; vaValue: OleVariant): HRESULT;
var
 output: string;
 varname: WideString;
 Value: string;
begin
  varname:=WideString(pcwszStateVarName);
  if VarType(vaValue)=varOleStr then
    Value := vaValue;
  output:='State changed: '+pus.Id +' VarName: '+varname+' Varianttype:'+VarTypeAsText(VarType(vaValue))+' Value '+Value;
  TUpnpDMC.Log.Add(output);
  result := S_OK;
end;

function TServiceCallback.ServiceInstanceDied(const pus: IUPnPService): HRESULT;
var
  output: string;
begin
  output:='Service died: '+pus.Id;
  TUpnpDMC.Log.Add(output);
  result := S_OK;
end;

function TServiceCallback.QueryInterface(const IID: TGUID; out Obj):
HResult;
begin
  result := Inherited QueryInterface(IID, obj);
end;

{ TDeviceListItem }

constructor TDeviceListItem.Create(IUPnPDevice: IUPnPDevice);
begin
  UPnPDevice:=IUPnPDevice;
end;

{ TMediaRenderer }

procedure TMediaRendererControl.SetRendererDevice(arenderer: IUPnPDevice);
VAR services: IUPnPServices;
    Iservice: IInterface;
    MyService:IUPnPService;
    s:string;
begin
  RendererDevice:=arenderer;
  MyService:=NIL;
  if RendererDevice<>NIL then
  begin
    services:=arenderer.Services;
    for Iservice in GetCOMEnumerator(services._NewEnum) do
    begin
      s:=(Iservice as IUPnPService).ServiceTypeIdentifier;
      TUpnpDMC.Log.Add('Service: '+s);
      if s = 'urn:schemas-upnp-org:service:AVTransport:1'
        then MyService:=IUPnPService(Iservice);
    end;
  end;
  if MyService = NIL then
     TUpnpDMC.Log.Add('AVTransport Not Found:');
   AVTransport.SetAVTransportService(MyService);
end;

constructor TMediaRendererControl.Create;
begin
  AVTransport:=TAVTransportService.Create(TUpnpDMC.Log);
  SetRendererDevice(NIL);
end;

{ TUpnpDMC }

procedure TUpnpDMC.Back;
begin
  if ItemStack.Count < 2 then exit;
  ItemStack.Pop;
  Browse(ItemStack.Pop);
  FItemIndex:=-1;
end;

procedure TUpnpDMC.Browse(StartIndex:integer);
VAR services: IUPnPServices;
    Iservice: IInterface;
    MyService:IUPnPService;
    ovIn,ovOut : OleVariant;
    s:string;
begin
  if (FServerIndex<0) or (FServerIndex>=ServerList.Count) then exit;
  ItemStack.Push(StartIndex);
  services:=ServerList[FServerIndex].UPnPDevice.Services;
  for Iservice in GetCOMEnumerator(services._NewEnum) do
  begin
    s:=(Iservice as IUPnPService).ServiceTypeIdentifier;
    TUpnpDMC.Log.Add('Service: '+s);
    if s = 'urn:schemas-upnp-org:service:ContentDirectory:1'
      then
        MyService:=IUPnPService(Iservice);
   end;

   //ContentBrowser.Items.Clear;
   ovIn := VarArrayCreate([0, 5], varVariant);
   ovIn[0]:= inttostr(StartIndex);
   ovIn[1]:= 'BrowseDirectChildren';
   ovIn[2]:= '';
   ovIn[3]:= 0;
   ovIn[4]:= 0;
   ovIn[5]:= '';
   ovOut := VarArrayCreate([0, 0], varVariant);
   MyService.InvokeAction('Browse', ovIn, ovOut);
   Log.Text:=ovOut[0];
   SetBrowseList(ovOut[0]);
end;

procedure TUpnpDMC.SetBrowseList(s:String);
    procedure AddNodes(ANode:IXMLNode);
    VAR i:integer;
        item:TItemListItem;
        child:IXMLNode;
        id:string;
    begin
      while ANode<>NIL do
      begin
      // do something with ANode
        id:=ANode.AttributeNodes['id'].Text;
        item:=TItemListItem.Create;
        item.add('id',id);
        for I:=0 to ANode.ChildNodes.Count-1 do
        begin
          child:=ANode.ChildNodes[i];
          item.Add(child.NodeName,child.Text);
        end;
        try
          item.Add('uri',ANode.Text);
        except
          item.add('uri','');
        end;
        item.Add('xml',ANode.XML);
        ItemList.Add(item);
        ANode := ANode.NextSibling;
      end;
    end;
VAR StartItemNode : IXMLNode;
begin
    XMLDoc.Active:=false;
    XMLDoc.LoadFromXML(s);
    XMLDoc.Active:=True;
    ItemList.Clear;
    StartItemNode := XMLDoc.DocumentElement.ChildNodes.FindNode('container') ;
    AddNodes(StartItemNode);
    StartItemNode := XMLDoc.DocumentElement.ChildNodes.FindNode('item') ;
    AddNodes(StartItemNode);
end;

procedure TUpnpDMC.SetItemIndex(index: integer);
begin
    FItemIndex:=index;
end;

function TUpnpDMC.BrowseItems(index: integer): boolean;
begin
  try
    Browse(StrToInt(ItemList[index]['id']));
    result:=true;
  except
    result:=false;
  end
end;

procedure TUpnpDMC.BrowseItemsRoot;
begin
  Browse(0);
end;

constructor TUpnpDMC.Create(aOwner:TComponent;aLog: TStrings);
begin
  Owner:=aOwner;
  Log:=aLog;
  tempDevice := TCallback.Create;
  OLECheck(tempDevice.QueryInterface(IUPnPDeviceFinderCallback,FCallback));
  (tempDevice as TCallBack).UpnpDMC:=self;
  tempService := TServiceCallback.Create;
  OLECheck(tempService.QueryInterface(IUPnPServiceCallback,FCallbackService));
  ServerList:=TDevicelist.Create;
  RendererList:=TDevicelist.Create;
  ItemList:=TItemList.Create;
  ItemStack:=TStack<integer>.Create;
  FitemAsString:=TStringList.Create;
  UPnPDeviceFinder:=TUPnPDeviceFinder.Create(Owner);
  XMLDoc:=TXMLDocument.Create(owner);
  MediaRenderer:=TMediaRendererControl.Create;
end;

procedure TUpnpDMC.DeviceAdded(lFindData: integer; const pDevice: IUPnPDevice);
begin
  if lFindData = FindDataServer then
    ServerList.Add(TDeviceListItem.Create(pDevice))
  else
    RendererList.Add(TDeviceListItem.Create(pDevice));
  if assigned(FOnDeviceListChanged) then OnDeviceListChanged(self);
end;

procedure TUpnpDMC.DeviceRemoved(lFindData: integer; bstrUDN: string);
    function find(list:TDevicelist;udn:string):integer;
    VAR i:integer;
    begin
      result:=-1;
      for i:=0 to list.Count-1 do with list[i] do
        if list[i].UPnPDevice.UniqueDeviceName = udn then result:=i;
    end;
VAR index:integer;
    list:TDevicelist;
begin
  if lFindData = FindDataServer then list:=ServerList
                                else list:=RendererList;
  index:=find(list,bstrUDN);
  if index>=0 then
  begin
    if list[index].UPnPDevice = MediaRenderer.RendererDevice then
      MediaRenderer.SetRendererDevice(NIL);
    list.Delete(index);
  end;
  if assigned(FOnDeviceListChanged) then OnDeviceListChanged(self);
end;

function TUpnpDMC.GetDeviceListChanged: TNotifyEvent;
begin
  result:=FOnDeviceListChanged;
end;

procedure TUpnpDMC.Seek(amount: integer);
VAR n:integer;
begin
  n:=GetPosition+amount;
  if n<0 then n:=0;
  if n>GetItemDuration then n:=GetItemDuration-1;
  SetPosition(n);
end;

function TUpnpDMC.GetItemDuration: integer;
begin
  result:=MediaRenderer.Duration;
end;

function TUpnpDMC.GetItemName(index: integer): string;
VAR id,title:string;
begin
  id:=ItemList[index].Items['id'];
  title:=ItemList[index].Items['dc:title'];
  result:=id+ ' ' +title;
end;

function TUpnpDMC.GetPosition: integer;
begin
  if (MediaRenderer.AVTransport.PlayStatus =3)  then result:=0
  else result:=UpnpTimeToSeconds(MediaRenderer.AVTransport.GetPosition);
end;

function TUpnpDMC.GetRendererName(index: integer): string;
begin
  result:=RendererList[index].UPnPDevice.FriendlyName;
end;

function TUpnpDMC.GetServerName(index: integer): string;
begin
    result:=ServerList[index].UPnPDevice.FriendlyName;
end;

function TUpnpDMC.ItemCount: integer;
begin
    result:=ItemList.Count;
end;

procedure TUpnpDMC.Pause;
begin
  MediaRenderer.AVTransport.Pause;
end;

procedure TUpnpDMC.Play;
begin
  MediaRenderer.AVTransport.Play;
end;

procedure TUpnpDMC.PlayItem;
VAR aPlayItem:TPlayItem;
    xml:string;
begin
  if (FRendererIndex<0) or (FRendererIndex>=RendererCount) then exit;
  if (FServerIndex<0) or (FServerIndex>=ServerCount) then exit;
  if (FItemIndex<0) or (FItemIndex>=ItemCount) then exit;
  MediaRenderer.AVTransport.Stop;
  aPlayItem:=TPlayItem.Create(ServerList[FServerIndex].UPnPDevice,ItemList[FItemIndex]);
  MediaRenderer.SetRendererDevice(RendererList[FRendererIndex].UPnPDevice);
  xml:=''; // ItemList[FItemIndex]['xml'];
  MediaRenderer.SetAVTransportURI(aPlayItem.mUri, xml,aPlayItem.mDuration);
  aPlayItem.Free;
  MediaRenderer.AVTransport.Play;
end;

function TUpnpDMC.PlayStatus: integer; type TPlayStatus = (PSPlay,PSPaused,PSStop);
begin
  result:= MediaRenderer.AVTransport.PlayStatus;
end;

function TUpnpDMC.RendererCount: integer;
begin
  result:=RendererList.Count;
end;

procedure TUpnpDMC.SearchDevices;
begin
  ServerList.clear;
  FindDataServer:=UPnPDeviceFinder.CreateAsyncFind('urn:schemas-upnp-org:device:MediaServer:1', 0, Fcallback);
  UPnPDeviceFinder.StartAsyncFind(FindDataServer);
  RendererList.Clear;
  FindDataRenderer:=UPnPDeviceFinder.CreateAsyncFind('urn:schemas-upnp-org:device:MediaRenderer:1', 0, Fcallback);
  UPnPDeviceFinder.StartAsyncFind(FindDataRenderer);
end;

function TUpnpDMC.ServerCount: integer;
begin
  Result:=ServerList.Count;
end;

procedure TUpnpDMC.SetOnDeviceListChanged(const Value: TNotifyEvent);
begin
  FOnDeviceListChanged := Value;
end;

function TUpnpDMC.SetPosition(position: integer): boolean;
begin
  result:=MediaRenderer.AVTransport.SetPosition(UpnpSecondsToTime(position));
end;

function TUpnpDMC.FindRenderer(name: string): integer;
VAR i:integer;
begin
  result:=-1;
  for i:=0 to RendererCount-1 do
    if RendererList[i].UPnPDevice.FriendlyName = name then
    begin
      result:=i;
      exit;
   end;
end;

procedure TUpnpDMC.SetRendererIndex(index: integer);
begin
  FRendererIndex:=index;
end;

function TUpnpDMC.FindServer(name: string): integer;
VAR i:integer;
begin
  result:=-1;
  for i:=0 to ServerCount-1 do
    if ServerList[i].UPnPDevice.FriendlyName = name then
    begin
      result:=i;
      exit;
   end;
end;

procedure TUpnpDMC.SetServerIndex(index: integer);
begin
  FServerIndex:=index;
end;

procedure TUpnpDMC.Stop;
begin
  MediaRenderer.AVTransport.Stop;
end;

function TUpnpDMC.items: TStringList;
VAR i:integer;
begin
  with FitemAsString do
  begin
    clear;
    for i:=0 to ItemCount-1 do
      Add(ItemList[i]['dc:title']);
  end;
  result:=FitemAsString;
end;

{ TPlayItem }

constructor TPlayItem.Create(server: IUPnPDevice; item: TItemListItem);
VAR services: IUPnPServices;
    Iservice: IInterface;
    MyService:IUPnPService;
    s:string;
begin
  services:=server.Services;
  for Iservice in GetCOMEnumerator(services._NewEnum) do
  begin
    s:=(Iservice as IUPnPService).ServiceTypeIdentifier;
    TUpnpDMC.Log.Add('Service: '+s);
    if s = 'urn:schemas-upnp-org:service:ContentDirectory:1'
      then begin
        MyService:=IUPnPService(Iservice);
        GetDataFromId(MyService,item['id']);
      end;
  end;
end;

function TPlayItem.GetDataFromId(Service:IUPnPService;id: string): string;
VAR ovIn,ovOut : OleVariant;
    s:string;
VAR ItemNode : IXMLNode;
begin
   ovIn := VarArrayCreate([0, 5], varVariant);
   ovIn[0]:= id;
   ovIn[1]:= 'BrowseMetadata';
   ovIn[2]:= 'upnp:album,upnp:artist,upnp:genre,upnp:title,res@size,res@duration,res@bitrate,res@sampleFrequency,res@bitsPerSample,res@nrAudioChannels,res@protocolInfo,res@protection,res@importUri';
   ovIn[3]:= 0;
   ovIn[4]:= 1;
   ovIn[5]:= '';
   ovOut := VarArrayCreate([0, 3], varVariant);
   Service.InvokeAction('Browse',ovIn,ovOut);
   s:=ovOut[0];
   TUpnpDMC.Log.Add(s);
   TUpnpDMC.XMLDoc.Active:=false;
   TUpnpDMC.XMLDoc.LoadFromXML(s);
   TUpnpDMC.XMLDoc.Active:=True;

   //TUpnpDMC.Log.Add(form4.XMLDoc.DocumentElement.ChildNodes[0].Text);
   ItemNode := TUpnpDMC.XMLDoc.DocumentElement.ChildNodes[0].ChildNodes.FindNode('res') ;
   mDuration:=ItemNode.AttributeNodes['duration'].Text;
   TUpnpDMC.Log.Add(ItemNode.Text);
   mUri:=ItemNode.Text;
end;

function GetService(device:IUPnPDevice; service: string):IUPnPService;
VAR services: IUPnPServices;
    Iservice: IInterface;
    s:string;
begin
  services:=device.Services;
  for Iservice in GetCOMEnumerator(services._NewEnum) do
  begin
    s:=(Iservice as IUPnPService).ServiceTypeIdentifier;
    if s = service then
        result:=IUPnPService(Iservice);
  end;
end;

destructor TMediaRendererControl.Destroy;
begin
  AVTransport.Free;
end;

procedure TMediaRendererControl.SetAVTransportURI(uri, meta,duration: string);
VAR s:string;
    p:integer;
begin
  try
    s:=duration;
    p:=pos('.',s);
    if p>0 then s:=Copy(s,1,p-1);
    mDuration:=UpnpTimeToSeconds(s);
  except
    mDuration:=0;
  end;
  AVTransport.SetAVTransportURI(0, uri,meta);
end;

function UpnpTimeToSeconds(s:string):integer;
VAR i,p:integer;
begin
  p:=0;
  result:=0;
  for i:=0 to length(s)-1 do if s[i]=':' then p:=i;
  try
    if p=0 then result:=StrToInt(s)
    else result:=60*UpnpTimeToSeconds(Copy(s,1,p-1))+StrToInt(Copy(s,p+1));
  except end;
end;

function UpnpSecondsToTime(n:integer):string;
    function TwoStr(n:integer):string;
    begin
      if n<10 then result:='0'+inttostr(n)
              else result:=inttostr(n)
    end;
  begin
    result:=TwoStr(n DIV 3600) + ':'+ TwoStr(n DIV 60 MOD 60) + ':'+TwoStr(n MOD 60);
  end;


end.

