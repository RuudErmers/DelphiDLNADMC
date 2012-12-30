unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Generics.Collections,
  Dialogs, StdCtrls, UUpnpDMC, ExtCtrls, Spin;

type
  TFormMain = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    ServerListBox: TListBox;
    ItemListBox: TListBox;
    RendererListBox: TListBox;
    Button3: TButton;
    Button4: TButton;
    Button2: TButton;
    Timer1: TTimer;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ServerListBoxClick(Sender: TObject);
    procedure ItemListBoxClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RendererListBoxClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    UpnpDMC:TUpnpDMC;
    procedure ItemListUpdate;
    procedure OnDeviceListChanged(Sender:TObject);
    function FindItem(url: string): integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
begin
  UpnpDMC:=TUpnpDMC.Create(self,Memo1.Lines);
  UpnpDMC.OnDeviceListChanged:=OnDeviceListChanged;
end;

procedure TFormMain.OnDeviceListChanged(Sender:TObject);
VAR i:integer;
begin
  ServerListBox.Clear;
  for i:=0 to UpnpDMC.ServerCount-1 do
    ServerListBox.Items.Add(UpnpDMC.GetServerName(i));
  RendererListBox.Clear;
  for i:=0 to UpnpDMC.RendererCount-1 do
    RendererListBox.Items.Add(UpnpDMC.GetRendererName(i));
end;

procedure TFormMain.Button1Click(Sender: TObject);
begin
  UpnpDMC.SearchDevices;
end;

function TFormMain.FindItem(url:string):integer;
VAR sl:TStringList;
    i:integer;
begin
  sl:=UpnpDMC.Items;
  for i:=0 to sl.Count-1 do
    if pos(sl[i],url)>0 then begin result:=i; exit; end;
  result:=-1;
end;

procedure TFormMain.Button2Click(Sender: TObject);
VAR index:integer;
begin
  if UpnpDMC.ServerCount = 0 then exit;
  if UpnpDMC.RendererCount = 0 then exit;
  index:=UpnpDMC.FindServer(UpnpDMC.GetServerName(UpnpDMC.ServerCount-1));
  if index>=0 then UpnpDMC.SetServerIndex(index);
  index:=UpnpDMC.FindRenderer(UpnpDMC.GetRendererName(UpnpDMC.RendererCount-1));
  if index>=0 then UpnpDMC.SetRendererIndex(index);
  UpnpDMC.BrowseItemsRoot;
  ItemListUpdate;
  index:=FindItem('Videos');
  if index>=0 then UpnpDMC.BrowseItems(index);
  ItemListUpdate;
  index:=FindItem('All Videos');
  if index>=0 then UpnpDMC.BrowseItems(index);
  ItemListUpdate;
  UpnpDMC.SetItemIndex(0); // just the first movie
  UpnpDMC.PlayItem;
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
  UpnpDMC.Back;
  ItemListUpdate;
end;

procedure TFormMain.Button4Click(Sender: TObject);
begin
  UpnpDMC.PlayItem;
  Label1.Caption:=UpnpSecondsToTime(UpnpDMC.GetItemDuration);
end;

procedure TFormMain.Button5Click(Sender: TObject);
begin
  UpnpDMC.Stop;
end;

procedure TFormMain.Button6Click(Sender: TObject);
begin
  UpnpDMC.SetPosition(SpinEdit1.Value);
end;

procedure TFormMain.Button7Click(Sender: TObject);
begin
  UpnpDMC.Pause;
end;

procedure TFormMain.ServerListBoxClick(Sender: TObject);
begin
  if ServerListbox.ItemIndex>=0
  then
  begin
    UpnpDMC.SetServerIndex(ServerListbox.ItemIndex);
    UpnpDMC.BrowseItemsRoot;
    ItemListUpdate;
  end;
end;

procedure TFormMain.Timer1Timer(Sender: TObject);
VAR s:string;
begin
  case UpnpDMC.PlayStatus of
    0: s:='Playing';
    1: s:='Paused';
    2: s:='Stopped';
    else exit;
  end;
  Memo1.Text:=s + ' '+UpnpSecondsToTime(UpnpDMC.GetPosition);
end;

procedure TFormMain.RendererListBoxClick(Sender: TObject);
begin
  UpnpDMC.SetRendererIndex(RendererListBox.ItemIndex);
end;

procedure TFormMain.ItemListBoxClick(Sender: TObject);

begin
  if ItemListBox.ItemIndex>=0 then
    if UpnpDMC.BrowseItems(ItemListBox.ItemIndex) then
    begin
      ItemListUpdate;
      UpnpDMC.SetItemIndex(-1);
    end
    else
      UpnpDMC.SetItemIndex(ItemListBox.ItemIndex);
end;

procedure TFormMain.ItemListUpdate;
begin
  ItemListBox.Items.Assign(UpnpDMC.items);
end;

end.
