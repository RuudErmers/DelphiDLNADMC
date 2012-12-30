unit UPNPLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 17244 $
// File generated on 20-12-2012 11:34:23 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\system32\upnp.dll (1)
// LIBID: {DB3442A7-A2E9-4A59-9CB5-F5C1A5D901E5}
// LCID: 0
// Helpfile: 
// HelpString: UPnP 1.0 Type Library (Control Point)
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// Errors:
//   Hint: Symbol 'Type' renamed to 'type_'
//   Error creating palette bitmap of (TUPnPDeviceFinder) : Server C:\Windows\system32\upnp.dll contains no icons
//   Error creating palette bitmap of (TUPnPDevices) : Server C:\Windows\system32\upnp.dll contains no icons
//   Error creating palette bitmap of (TUPnPDevice) : Server C:\Windows\system32\upnp.dll contains no icons
//   Error creating palette bitmap of (TUPnPServices) : Server C:\Windows\system32\upnp.dll contains no icons
//   Error creating palette bitmap of (TUPnPService) : Server C:\Windows\system32\upnp.dll contains no icons
//   Error creating palette bitmap of (TUPnPDescriptionDocument) : Server C:\Windows\system32\upnp.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  UPNPLibMajorVersion = 1;
  UPNPLibMinorVersion = 0;

  LIBID_UPNPLib: TGUID = '{DB3442A7-A2E9-4A59-9CB5-F5C1A5D901E5}';

  IID_IUPnPDeviceFinder: TGUID = '{ADDA3D55-6F72-4319-BFF9-18600A539B10}';
  IID_IUPnPAddressFamilyControl: TGUID = '{E3BF6178-694E-459F-A5A6-191EA0FFA1C7}';
  IID_IUPnPDevices: TGUID = '{FDBC0C73-BDA3-4C66-AC4F-F2D96FDAD68C}';
  IID_IUPnPDevice: TGUID = '{3D44D0D1-98C9-4889-ACD1-F9D674BF2221}';
  IID_IUPnPServices: TGUID = '{3F8C8E9E-9A7A-4DC8-BC41-FF31FA374956}';
  IID_IUPnPService: TGUID = '{A295019C-DC65-47DD-90DC-7FE918A1AB44}';
  IID_IUPnPHttpHeaderControl: TGUID = '{0405AF4F-8B5C-447C-80F2-B75984A31F3C}';
  CLASS_UPnPDeviceFinder: TGUID = '{E2085F28-FEB7-404A-B8E7-E659BDEAAA02}';
  CLASS_UPnPDevices: TGUID = '{B9E84FFD-AD3C-40A4-B835-0882EBCBAAA8}';
  CLASS_UPnPDevice: TGUID = '{A32552C5-BA61-457A-B59A-A2561E125E33}';
  CLASS_UPnPServices: TGUID = '{C0BC4B4A-A406-4EFC-932F-B8546B8100CC}';
  CLASS_UPnPService: TGUID = '{C624BA95-FBCB-4409-8C03-8CCEEC533EF1}';
  IID_IUPnPDescriptionDocument: TGUID = '{11D1C1B2-7DAA-4C9E-9595-7F82ED206D1E}';
  CLASS_UPnPDescriptionDocument: TGUID = '{1D8A9B47-3A28-4CE2-8A4B-BD34E45BCEEB}';
  IID_IUPnPDeviceDocumentAccess: TGUID = '{E7772804-3287-418E-9072-CF2B47238981}';
  IID_IUPnPDeviceDocumentAccessEx: TGUID = '{C4BC4050-6178-4BD1-A4B8-6398321F3247}';
  IID_IUPnPDeviceFinderCallback: TGUID = '{415A984A-88B3-49F3-92AF-0508BEDF0D6C}';
  IID_IUPnPDeviceFinderAddCallbackWithInterface: TGUID = '{983DFC0B-1796-44DF-8975-CA545B620EE5}';
  IID_IUPnPServiceCallback: TGUID = '{31FADCA9-AB73-464B-B67D-5C1D0F83C8B8}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IUPnPDeviceFinder = interface;
  IUPnPDeviceFinderDisp = dispinterface;
  IUPnPAddressFamilyControl = interface;
  IUPnPDevices = interface;
  IUPnPDevicesDisp = dispinterface;
  IUPnPDevice = interface;
  IUPnPDeviceDisp = dispinterface;
  IUPnPServices = interface;
  IUPnPServicesDisp = dispinterface;
  IUPnPService = interface;
  IUPnPServiceDisp = dispinterface;
  IUPnPHttpHeaderControl = interface;
  IUPnPDescriptionDocument = interface;
  IUPnPDescriptionDocumentDisp = dispinterface;
  IUPnPDeviceDocumentAccess = interface;
  IUPnPDeviceDocumentAccessEx = interface;
  IUPnPDeviceFinderCallback = interface;
  IUPnPDeviceFinderAddCallbackWithInterface = interface;
  IUPnPServiceCallback = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  UPnPDeviceFinder = IUPnPDeviceFinder;
  UPnPDevices = IUPnPDevices;
  UPnPDevice = IUPnPDevice;
  UPnPServices = IUPnPServices;
  UPnPService = IUPnPService;
  UPnPDescriptionDocument = IUPnPDescriptionDocument;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PUserType1 = ^TGUID; {*}


// *********************************************************************//
// Interface: IUPnPDeviceFinder
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {ADDA3D55-6F72-4319-BFF9-18600A539B10}
// *********************************************************************//
  IUPnPDeviceFinder = interface(IDispatch)
    ['{ADDA3D55-6F72-4319-BFF9-18600A539B10}']
    function FindByType(const bstrTypeURI: WideString; dwFlags: LongWord): IUPnPDevices; safecall;
    function CreateAsyncFind(const bstrTypeURI: WideString; dwFlags: LongWord; 
                             const punkDeviceFinderCallback: IUnknown): Integer; safecall;
    procedure StartAsyncFind(lFindData: Integer); safecall;
    procedure CancelAsyncFind(lFindData: Integer); safecall;
    function FindByUDN(const bstrUDN: WideString): IUPnPDevice; safecall;
  end;

// *********************************************************************//
// DispIntf:  IUPnPDeviceFinderDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {ADDA3D55-6F72-4319-BFF9-18600A539B10}
// *********************************************************************//
  IUPnPDeviceFinderDisp = dispinterface
    ['{ADDA3D55-6F72-4319-BFF9-18600A539B10}']
    function FindByType(const bstrTypeURI: WideString; dwFlags: LongWord): IUPnPDevices; dispid 1610744809;
    function CreateAsyncFind(const bstrTypeURI: WideString; dwFlags: LongWord; 
                             const punkDeviceFinderCallback: IUnknown): Integer; dispid 1610744812;
    procedure StartAsyncFind(lFindData: Integer); dispid 1610744813;
    procedure CancelAsyncFind(lFindData: Integer); dispid 1610744814;
    function FindByUDN(const bstrUDN: WideString): IUPnPDevice; dispid 1610744811;
  end;

// *********************************************************************//
// Interface: IUPnPAddressFamilyControl
// Flags:     (256) OleAutomation
// GUID:      {E3BF6178-694E-459F-A5A6-191EA0FFA1C7}
// *********************************************************************//
  IUPnPAddressFamilyControl = interface(IUnknown)
    ['{E3BF6178-694E-459F-A5A6-191EA0FFA1C7}']
    function SetAddressFamily(dwFlags: Integer): HResult; stdcall;
    function GetAddressFamily(out pdwFlags: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IUPnPDevices
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {FDBC0C73-BDA3-4C66-AC4F-F2D96FDAD68C}
// *********************************************************************//
  IUPnPDevices = interface(IDispatch)
    ['{FDBC0C73-BDA3-4C66-AC4F-F2D96FDAD68C}']
    function Get_Count: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(const bstrUDN: WideString): IUPnPDevice; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[const bstrUDN: WideString]: IUPnPDevice read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  IUPnPDevicesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {FDBC0C73-BDA3-4C66-AC4F-F2D96FDAD68C}
// *********************************************************************//
  IUPnPDevicesDisp = dispinterface
    ['{FDBC0C73-BDA3-4C66-AC4F-F2D96FDAD68C}']
    property Count: Integer readonly dispid 1610747309;
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[const bstrUDN: WideString]: IUPnPDevice readonly dispid 0; default;
  end;

// *********************************************************************//
// Interface: IUPnPDevice
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3D44D0D1-98C9-4889-ACD1-F9D674BF2221}
// *********************************************************************//
  IUPnPDevice = interface(IDispatch)
    ['{3D44D0D1-98C9-4889-ACD1-F9D674BF2221}']
    function Get_IsRootDevice: WordBool; safecall;
    function Get_RootDevice: IUPnPDevice; safecall;
    function Get_ParentDevice: IUPnPDevice; safecall;
    function Get_HasChildren: WordBool; safecall;
    function Get_Children: IUPnPDevices; safecall;
    function Get_UniqueDeviceName: WideString; safecall;
    function Get_FriendlyName: WideString; safecall;
    function Get_type_: WideString; safecall;
    function Get_PresentationURL: WideString; safecall;
    function Get_ManufacturerName: WideString; safecall;
    function Get_ManufacturerURL: WideString; safecall;
    function Get_ModelName: WideString; safecall;
    function Get_ModelNumber: WideString; safecall;
    function Get_Description: WideString; safecall;
    function Get_ModelURL: WideString; safecall;
    function Get_UPC: WideString; safecall;
    function Get_SerialNumber: WideString; safecall;
    function IconURL(const bstrEncodingFormat: WideString; lSizeX: Integer; lSizeY: Integer; 
                     lBitDepth: Integer): WideString; safecall;
    function Get_Services: IUPnPServices; safecall;
    property IsRootDevice: WordBool read Get_IsRootDevice;
    property RootDevice: IUPnPDevice read Get_RootDevice;
    property ParentDevice: IUPnPDevice read Get_ParentDevice;
    property HasChildren: WordBool read Get_HasChildren;
    property Children: IUPnPDevices read Get_Children;
    property UniqueDeviceName: WideString read Get_UniqueDeviceName;
    property FriendlyName: WideString read Get_FriendlyName;
    property type_: WideString read Get_type_;
    property PresentationURL: WideString read Get_PresentationURL;
    property ManufacturerName: WideString read Get_ManufacturerName;
    property ManufacturerURL: WideString read Get_ManufacturerURL;
    property ModelName: WideString read Get_ModelName;
    property ModelNumber: WideString read Get_ModelNumber;
    property Description: WideString read Get_Description;
    property ModelURL: WideString read Get_ModelURL;
    property UPC: WideString read Get_UPC;
    property SerialNumber: WideString read Get_SerialNumber;
    property Services: IUPnPServices read Get_Services;
  end;

// *********************************************************************//
// DispIntf:  IUPnPDeviceDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3D44D0D1-98C9-4889-ACD1-F9D674BF2221}
// *********************************************************************//
  IUPnPDeviceDisp = dispinterface
    ['{3D44D0D1-98C9-4889-ACD1-F9D674BF2221}']
    property IsRootDevice: WordBool readonly dispid 1610747809;
    property RootDevice: IUPnPDevice readonly dispid 1610747810;
    property ParentDevice: IUPnPDevice readonly dispid 1610747811;
    property HasChildren: WordBool readonly dispid 1610747812;
    property Children: IUPnPDevices readonly dispid 1610747813;
    property UniqueDeviceName: WideString readonly dispid 1610747814;
    property FriendlyName: WideString readonly dispid 1610747815;
    property type_: WideString readonly dispid 1610747816;
    property PresentationURL: WideString readonly dispid 1610747817;
    property ManufacturerName: WideString readonly dispid 1610747818;
    property ManufacturerURL: WideString readonly dispid 1610747819;
    property ModelName: WideString readonly dispid 1610747820;
    property ModelNumber: WideString readonly dispid 1610747821;
    property Description: WideString readonly dispid 1610747822;
    property ModelURL: WideString readonly dispid 1610747823;
    property UPC: WideString readonly dispid 1610747824;
    property SerialNumber: WideString readonly dispid 1610747825;
    function IconURL(const bstrEncodingFormat: WideString; lSizeX: Integer; lSizeY: Integer; 
                     lBitDepth: Integer): WideString; dispid 1610747827;
    property Services: IUPnPServices readonly dispid 1610747828;
  end;

// *********************************************************************//
// Interface: IUPnPServices
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3F8C8E9E-9A7A-4DC8-BC41-FF31FA374956}
// *********************************************************************//
  IUPnPServices = interface(IDispatch)
    ['{3F8C8E9E-9A7A-4DC8-BC41-FF31FA374956}']
    function Get_Count: Integer; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(const bstrServiceId: WideString): IUPnPService; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[const bstrServiceId: WideString]: IUPnPService read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  IUPnPServicesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3F8C8E9E-9A7A-4DC8-BC41-FF31FA374956}
// *********************************************************************//
  IUPnPServicesDisp = dispinterface
    ['{3F8C8E9E-9A7A-4DC8-BC41-FF31FA374956}']
    property Count: Integer readonly dispid 1610745809;
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[const bstrServiceId: WideString]: IUPnPService readonly dispid 0; default;
  end;

// *********************************************************************//
// Interface: IUPnPService
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {A295019C-DC65-47DD-90DC-7FE918A1AB44}
// *********************************************************************//
  IUPnPService = interface(IDispatch)
    ['{A295019C-DC65-47DD-90DC-7FE918A1AB44}']
    function QueryStateVariable(const bstrVariableName: WideString): OleVariant; safecall;
    function InvokeAction(const bstrActionName: WideString; vInActionArgs: OleVariant; 
                          var pvOutActionArgs: OleVariant): OleVariant; safecall;
    function Get_ServiceTypeIdentifier: WideString; safecall;
    procedure AddCallback(const pUnkCallback: IUnknown); safecall;
    function Get_Id: WideString; safecall;
    function Get_LastTransportStatus: Integer; safecall;
    property ServiceTypeIdentifier: WideString read Get_ServiceTypeIdentifier;
    property Id: WideString read Get_Id;
    property LastTransportStatus: Integer read Get_LastTransportStatus;
  end;

// *********************************************************************//
// DispIntf:  IUPnPServiceDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {A295019C-DC65-47DD-90DC-7FE918A1AB44}
// *********************************************************************//
  IUPnPServiceDisp = dispinterface
    ['{A295019C-DC65-47DD-90DC-7FE918A1AB44}']
    function QueryStateVariable(const bstrVariableName: WideString): OleVariant; dispid 1610746309;
    function InvokeAction(const bstrActionName: WideString; vInActionArgs: OleVariant; 
                          var pvOutActionArgs: OleVariant): OleVariant; dispid 1610746310;
    property ServiceTypeIdentifier: WideString readonly dispid 1610746311;
    procedure AddCallback(const pUnkCallback: IUnknown); dispid 1610746312;
    property Id: WideString readonly dispid 1610746313;
    property LastTransportStatus: Integer readonly dispid 1610746314;
  end;

// *********************************************************************//
// Interface: IUPnPHttpHeaderControl
// Flags:     (256) OleAutomation
// GUID:      {0405AF4F-8B5C-447C-80F2-B75984A31F3C}
// *********************************************************************//
  IUPnPHttpHeaderControl = interface(IUnknown)
    ['{0405AF4F-8B5C-447C-80F2-B75984A31F3C}']
    function AddRequestHeaders(const bstrHttpHeaders: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IUPnPDescriptionDocument
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {11D1C1B2-7DAA-4C9E-9595-7F82ED206D1E}
// *********************************************************************//
  IUPnPDescriptionDocument = interface(IDispatch)
    ['{11D1C1B2-7DAA-4C9E-9595-7F82ED206D1E}']
    function Get_ReadyState: Integer; safecall;
    procedure Load(const bstrUrl: WideString); safecall;
    procedure LoadAsync(const bstrUrl: WideString; const pUnkCallback: IUnknown); safecall;
    function Get_LoadResult: Integer; safecall;
    procedure Abort; safecall;
    function RootDevice: IUPnPDevice; safecall;
    function DeviceByUDN(const bstrUDN: WideString): IUPnPDevice; safecall;
    property ReadyState: Integer read Get_ReadyState;
    property LoadResult: Integer read Get_LoadResult;
  end;

// *********************************************************************//
// DispIntf:  IUPnPDescriptionDocumentDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {11D1C1B2-7DAA-4C9E-9595-7F82ED206D1E}
// *********************************************************************//
  IUPnPDescriptionDocumentDisp = dispinterface
    ['{11D1C1B2-7DAA-4C9E-9595-7F82ED206D1E}']
    property ReadyState: Integer readonly dispid -525;
    procedure Load(const bstrUrl: WideString); dispid 1610748309;
    procedure LoadAsync(const bstrUrl: WideString; const pUnkCallback: IUnknown); dispid 1610748310;
    property LoadResult: Integer readonly dispid 1610748311;
    procedure Abort; dispid 1610748312;
    function RootDevice: IUPnPDevice; dispid 1610748313;
    function DeviceByUDN(const bstrUDN: WideString): IUPnPDevice; dispid 1610748314;
  end;

// *********************************************************************//
// Interface: IUPnPDeviceDocumentAccess
// Flags:     (0)
// GUID:      {E7772804-3287-418E-9072-CF2B47238981}
// *********************************************************************//
  IUPnPDeviceDocumentAccess = interface(IUnknown)
    ['{E7772804-3287-418E-9072-CF2B47238981}']
    function GetDocumentURL(out pbstrDocument: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IUPnPDeviceDocumentAccessEx
// Flags:     (0)
// GUID:      {C4BC4050-6178-4BD1-A4B8-6398321F3247}
// *********************************************************************//
  IUPnPDeviceDocumentAccessEx = interface(IUnknown)
    ['{C4BC4050-6178-4BD1-A4B8-6398321F3247}']
    function GetDocument(out pbstrDocument: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IUPnPDeviceFinderCallback
// Flags:     (0)
// GUID:      {415A984A-88B3-49F3-92AF-0508BEDF0D6C}
// *********************************************************************//
  IUPnPDeviceFinderCallback = interface(IUnknown)
    ['{415A984A-88B3-49F3-92AF-0508BEDF0D6C}']
    function DeviceAdded(lFindData: Integer; const pDevice: IUPnPDevice): HResult; stdcall;
    function DeviceRemoved(lFindData: Integer; const bstrUDN: WideString): HResult; stdcall;
    function SearchComplete(lFindData: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IUPnPDeviceFinderAddCallbackWithInterface
// Flags:     (0)
// GUID:      {983DFC0B-1796-44DF-8975-CA545B620EE5}
// *********************************************************************//
  IUPnPDeviceFinderAddCallbackWithInterface = interface(IUnknown)
    ['{983DFC0B-1796-44DF-8975-CA545B620EE5}']
    function DeviceAddedWithInterface(lFindData: Integer; const pDevice: IUPnPDevice; 
                                      var pguidInterface: TGUID): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IUPnPServiceCallback
// Flags:     (0)
// GUID:      {31FADCA9-AB73-464B-B67D-5C1D0F83C8B8}
// *********************************************************************//
  IUPnPServiceCallback = interface(IUnknown)
    ['{31FADCA9-AB73-464B-B67D-5C1D0F83C8B8}']
    function StateVariableChanged(const pus: IUPnPService; pcwszStateVarName: PWideChar; 
                                  vaValue: OleVariant): HResult; stdcall;
    function ServiceInstanceDied(const pus: IUPnPService): HResult; stdcall;
  end;

// *********************************************************************//
// The Class CoUPnPDeviceFinder provides a Create and CreateRemote method to          
// create instances of the default interface IUPnPDeviceFinder exposed by              
// the CoClass UPnPDeviceFinder. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUPnPDeviceFinder = class
    class function Create: IUPnPDeviceFinder;
    class function CreateRemote(const MachineName: string): IUPnPDeviceFinder;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUPnPDeviceFinder
// Help String      : UPnPDeviceFinder Class
// Default Interface: IUPnPDeviceFinder
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUPnPDeviceFinderProperties= class;
{$ENDIF}
  TUPnPDeviceFinder = class(TOleServer)
  private
    FIntf: IUPnPDeviceFinder;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TUPnPDeviceFinderProperties;
    function GetServerProperties: TUPnPDeviceFinderProperties;
{$ENDIF}
    function GetDefaultInterface: IUPnPDeviceFinder;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUPnPDeviceFinder);
    procedure Disconnect; override;
    function FindByType(const bstrTypeURI: WideString; dwFlags: LongWord): IUPnPDevices;
    function CreateAsyncFind(const bstrTypeURI: WideString; dwFlags: LongWord; 
                             const punkDeviceFinderCallback: IUnknown): Integer;
    procedure StartAsyncFind(lFindData: Integer);
    procedure CancelAsyncFind(lFindData: Integer);
    function FindByUDN(const bstrUDN: WideString): IUPnPDevice;
    property DefaultInterface: IUPnPDeviceFinder read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUPnPDeviceFinderProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUPnPDeviceFinder
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUPnPDeviceFinderProperties = class(TPersistent)
  private
    FServer:    TUPnPDeviceFinder;
    function    GetDefaultInterface: IUPnPDeviceFinder;
    constructor Create(AServer: TUPnPDeviceFinder);
  protected
  public
    property DefaultInterface: IUPnPDeviceFinder read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoUPnPDevices provides a Create and CreateRemote method to          
// create instances of the default interface IUPnPDevices exposed by              
// the CoClass UPnPDevices. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUPnPDevices = class
    class function Create: IUPnPDevices;
    class function CreateRemote(const MachineName: string): IUPnPDevices;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUPnPDevices
// Help String      : UPnPDevices Class
// Default Interface: IUPnPDevices
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUPnPDevicesProperties= class;
{$ENDIF}
  TUPnPDevices = class(TOleServer)
  private
    FIntf: IUPnPDevices;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TUPnPDevicesProperties;
    function GetServerProperties: TUPnPDevicesProperties;
{$ENDIF}
    function GetDefaultInterface: IUPnPDevices;
  protected
    procedure InitServerData; override;
    function Get_Count: Integer;
    function Get_Item(const bstrUDN: WideString): IUPnPDevice;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUPnPDevices);
    procedure Disconnect; override;
    property DefaultInterface: IUPnPDevices read GetDefaultInterface;
    property Count: Integer read Get_Count;
    property Item[const bstrUDN: WideString]: IUPnPDevice read Get_Item; default;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUPnPDevicesProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUPnPDevices
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUPnPDevicesProperties = class(TPersistent)
  private
    FServer:    TUPnPDevices;
    function    GetDefaultInterface: IUPnPDevices;
    constructor Create(AServer: TUPnPDevices);
  protected
    function Get_Count: Integer;
    function Get_Item(const bstrUDN: WideString): IUPnPDevice;
  public
    property DefaultInterface: IUPnPDevices read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoUPnPDevice provides a Create and CreateRemote method to          
// create instances of the default interface IUPnPDevice exposed by              
// the CoClass UPnPDevice. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUPnPDevice = class
    class function Create: IUPnPDevice;
    class function CreateRemote(const MachineName: string): IUPnPDevice;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUPnPDevice
// Help String      : UPnPDevice Class
// Default Interface: IUPnPDevice
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUPnPDeviceProperties= class;
{$ENDIF}
  TUPnPDevice = class(TOleServer)
  private
    FIntf: IUPnPDevice;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TUPnPDeviceProperties;
    function GetServerProperties: TUPnPDeviceProperties;
{$ENDIF}
    function GetDefaultInterface: IUPnPDevice;
  protected
    procedure InitServerData; override;
    function Get_IsRootDevice: WordBool;
    function Get_RootDevice: IUPnPDevice;
    function Get_ParentDevice: IUPnPDevice;
    function Get_HasChildren: WordBool;
    function Get_Children: IUPnPDevices;
    function Get_UniqueDeviceName: WideString;
    function Get_FriendlyName: WideString;
    function Get_type_: WideString;
    function Get_PresentationURL: WideString;
    function Get_ManufacturerName: WideString;
    function Get_ManufacturerURL: WideString;
    function Get_ModelName: WideString;
    function Get_ModelNumber: WideString;
    function Get_Description: WideString;
    function Get_ModelURL: WideString;
    function Get_UPC: WideString;
    function Get_SerialNumber: WideString;
    function Get_Services: IUPnPServices;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUPnPDevice);
    procedure Disconnect; override;
    function IconURL(const bstrEncodingFormat: WideString; lSizeX: Integer; lSizeY: Integer; 
                     lBitDepth: Integer): WideString;
    property DefaultInterface: IUPnPDevice read GetDefaultInterface;
    property IsRootDevice: WordBool read Get_IsRootDevice;
    property RootDevice: IUPnPDevice read Get_RootDevice;
    property ParentDevice: IUPnPDevice read Get_ParentDevice;
    property HasChildren: WordBool read Get_HasChildren;
    property Children: IUPnPDevices read Get_Children;
    property UniqueDeviceName: WideString read Get_UniqueDeviceName;
    property FriendlyName: WideString read Get_FriendlyName;
    property type_: WideString read Get_type_;
    property PresentationURL: WideString read Get_PresentationURL;
    property ManufacturerName: WideString read Get_ManufacturerName;
    property ManufacturerURL: WideString read Get_ManufacturerURL;
    property ModelName: WideString read Get_ModelName;
    property ModelNumber: WideString read Get_ModelNumber;
    property Description: WideString read Get_Description;
    property ModelURL: WideString read Get_ModelURL;
    property UPC: WideString read Get_UPC;
    property SerialNumber: WideString read Get_SerialNumber;
    property Services: IUPnPServices read Get_Services;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUPnPDeviceProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUPnPDevice
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUPnPDeviceProperties = class(TPersistent)
  private
    FServer:    TUPnPDevice;
    function    GetDefaultInterface: IUPnPDevice;
    constructor Create(AServer: TUPnPDevice);
  protected
    function Get_IsRootDevice: WordBool;
    function Get_RootDevice: IUPnPDevice;
    function Get_ParentDevice: IUPnPDevice;
    function Get_HasChildren: WordBool;
    function Get_Children: IUPnPDevices;
    function Get_UniqueDeviceName: WideString;
    function Get_FriendlyName: WideString;
    function Get_type_: WideString;
    function Get_PresentationURL: WideString;
    function Get_ManufacturerName: WideString;
    function Get_ManufacturerURL: WideString;
    function Get_ModelName: WideString;
    function Get_ModelNumber: WideString;
    function Get_Description: WideString;
    function Get_ModelURL: WideString;
    function Get_UPC: WideString;
    function Get_SerialNumber: WideString;
    function Get_Services: IUPnPServices;
  public
    property DefaultInterface: IUPnPDevice read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoUPnPServices provides a Create and CreateRemote method to          
// create instances of the default interface IUPnPServices exposed by              
// the CoClass UPnPServices. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUPnPServices = class
    class function Create: IUPnPServices;
    class function CreateRemote(const MachineName: string): IUPnPServices;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUPnPServices
// Help String      : UPnPServices Class
// Default Interface: IUPnPServices
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUPnPServicesProperties= class;
{$ENDIF}
  TUPnPServices = class(TOleServer)
  private
    FIntf: IUPnPServices;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TUPnPServicesProperties;
    function GetServerProperties: TUPnPServicesProperties;
{$ENDIF}
    function GetDefaultInterface: IUPnPServices;
  protected
    procedure InitServerData; override;
    function Get_Count: Integer;
    function Get_Item(const bstrServiceId: WideString): IUPnPService;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUPnPServices);
    procedure Disconnect; override;
    property DefaultInterface: IUPnPServices read GetDefaultInterface;
    property Count: Integer read Get_Count;
    property Item[const bstrServiceId: WideString]: IUPnPService read Get_Item; default;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUPnPServicesProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUPnPServices
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUPnPServicesProperties = class(TPersistent)
  private
    FServer:    TUPnPServices;
    function    GetDefaultInterface: IUPnPServices;
    constructor Create(AServer: TUPnPServices);
  protected
    function Get_Count: Integer;
    function Get_Item(const bstrServiceId: WideString): IUPnPService;
  public
    property DefaultInterface: IUPnPServices read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoUPnPService provides a Create and CreateRemote method to          
// create instances of the default interface IUPnPService exposed by              
// the CoClass UPnPService. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUPnPService = class
    class function Create: IUPnPService;
    class function CreateRemote(const MachineName: string): IUPnPService;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUPnPService
// Help String      : UPnPService Class
// Default Interface: IUPnPService
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUPnPServiceProperties= class;
{$ENDIF}
  TUPnPService = class(TOleServer)
  private
    FIntf: IUPnPService;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TUPnPServiceProperties;
    function GetServerProperties: TUPnPServiceProperties;
{$ENDIF}
    function GetDefaultInterface: IUPnPService;
  protected
    procedure InitServerData; override;
    function Get_ServiceTypeIdentifier: WideString;
    function Get_Id: WideString;
    function Get_LastTransportStatus: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUPnPService);
    procedure Disconnect; override;
    function QueryStateVariable(const bstrVariableName: WideString): OleVariant;
    function InvokeAction(const bstrActionName: WideString; vInActionArgs: OleVariant; 
                          var pvOutActionArgs: OleVariant): OleVariant;
    procedure AddCallback(const pUnkCallback: IUnknown);
    property DefaultInterface: IUPnPService read GetDefaultInterface;
    property ServiceTypeIdentifier: WideString read Get_ServiceTypeIdentifier;
    property Id: WideString read Get_Id;
    property LastTransportStatus: Integer read Get_LastTransportStatus;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUPnPServiceProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUPnPService
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUPnPServiceProperties = class(TPersistent)
  private
    FServer:    TUPnPService;
    function    GetDefaultInterface: IUPnPService;
    constructor Create(AServer: TUPnPService);
  protected
    function Get_ServiceTypeIdentifier: WideString;
    function Get_Id: WideString;
    function Get_LastTransportStatus: Integer;
  public
    property DefaultInterface: IUPnPService read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoUPnPDescriptionDocument provides a Create and CreateRemote method to          
// create instances of the default interface IUPnPDescriptionDocument exposed by              
// the CoClass UPnPDescriptionDocument. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUPnPDescriptionDocument = class
    class function Create: IUPnPDescriptionDocument;
    class function CreateRemote(const MachineName: string): IUPnPDescriptionDocument;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUPnPDescriptionDocument
// Help String      : UPnPDescriptionDocument Class
// Default Interface: IUPnPDescriptionDocument
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUPnPDescriptionDocumentProperties= class;
{$ENDIF}
  TUPnPDescriptionDocument = class(TOleServer)
  private
    FIntf: IUPnPDescriptionDocument;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TUPnPDescriptionDocumentProperties;
    function GetServerProperties: TUPnPDescriptionDocumentProperties;
{$ENDIF}
    function GetDefaultInterface: IUPnPDescriptionDocument;
  protected
    procedure InitServerData; override;
    function Get_ReadyState: Integer;
    function Get_LoadResult: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUPnPDescriptionDocument);
    procedure Disconnect; override;
    procedure Load(const bstrUrl: WideString);
    procedure LoadAsync(const bstrUrl: WideString; const pUnkCallback: IUnknown);
    procedure Abort;
    function RootDevice: IUPnPDevice;
    function DeviceByUDN(const bstrUDN: WideString): IUPnPDevice;
    property DefaultInterface: IUPnPDescriptionDocument read GetDefaultInterface;
    property ReadyState: Integer read Get_ReadyState;
    property LoadResult: Integer read Get_LoadResult;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUPnPDescriptionDocumentProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUPnPDescriptionDocument
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUPnPDescriptionDocumentProperties = class(TPersistent)
  private
    FServer:    TUPnPDescriptionDocument;
    function    GetDefaultInterface: IUPnPDescriptionDocument;
    constructor Create(AServer: TUPnPDescriptionDocument);
  protected
    function Get_ReadyState: Integer;
    function Get_LoadResult: Integer;
  public
    property DefaultInterface: IUPnPDescriptionDocument read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'MS Upnp';

  dtlOcxPage = 'MS Upnp';

implementation

uses ComObj;

class function CoUPnPDeviceFinder.Create: IUPnPDeviceFinder;
begin
  Result := CreateComObject(CLASS_UPnPDeviceFinder) as IUPnPDeviceFinder;
end;

class function CoUPnPDeviceFinder.CreateRemote(const MachineName: string): IUPnPDeviceFinder;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UPnPDeviceFinder) as IUPnPDeviceFinder;
end;

procedure TUPnPDeviceFinder.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{E2085F28-FEB7-404A-B8E7-E659BDEAAA02}';
    IntfIID:   '{ADDA3D55-6F72-4319-BFF9-18600A539B10}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUPnPDeviceFinder.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUPnPDeviceFinder;
  end;
end;

procedure TUPnPDeviceFinder.ConnectTo(svrIntf: IUPnPDeviceFinder);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUPnPDeviceFinder.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUPnPDeviceFinder.GetDefaultInterface: IUPnPDeviceFinder;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TUPnPDeviceFinder.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUPnPDeviceFinderProperties.Create(Self);
{$ENDIF}
end;

destructor TUPnPDeviceFinder.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUPnPDeviceFinder.GetServerProperties: TUPnPDeviceFinderProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TUPnPDeviceFinder.FindByType(const bstrTypeURI: WideString; dwFlags: LongWord): IUPnPDevices;
begin
  Result := DefaultInterface.FindByType(bstrTypeURI, dwFlags);
end;

function TUPnPDeviceFinder.CreateAsyncFind(const bstrTypeURI: WideString; dwFlags: LongWord; 
                                           const punkDeviceFinderCallback: IUnknown): Integer;
begin
  Result := DefaultInterface.CreateAsyncFind(bstrTypeURI, dwFlags, punkDeviceFinderCallback);
end;

procedure TUPnPDeviceFinder.StartAsyncFind(lFindData: Integer);
begin
  DefaultInterface.StartAsyncFind(lFindData);
end;

procedure TUPnPDeviceFinder.CancelAsyncFind(lFindData: Integer);
begin
  DefaultInterface.CancelAsyncFind(lFindData);
end;

function TUPnPDeviceFinder.FindByUDN(const bstrUDN: WideString): IUPnPDevice;
begin
  Result := DefaultInterface.FindByUDN(bstrUDN);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUPnPDeviceFinderProperties.Create(AServer: TUPnPDeviceFinder);
begin
  inherited Create;
  FServer := AServer;
end;

function TUPnPDeviceFinderProperties.GetDefaultInterface: IUPnPDeviceFinder;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoUPnPDevices.Create: IUPnPDevices;
begin
  Result := CreateComObject(CLASS_UPnPDevices) as IUPnPDevices;
end;

class function CoUPnPDevices.CreateRemote(const MachineName: string): IUPnPDevices;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UPnPDevices) as IUPnPDevices;
end;

procedure TUPnPDevices.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{B9E84FFD-AD3C-40A4-B835-0882EBCBAAA8}';
    IntfIID:   '{FDBC0C73-BDA3-4C66-AC4F-F2D96FDAD68C}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUPnPDevices.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUPnPDevices;
  end;
end;

procedure TUPnPDevices.ConnectTo(svrIntf: IUPnPDevices);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUPnPDevices.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUPnPDevices.GetDefaultInterface: IUPnPDevices;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TUPnPDevices.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUPnPDevicesProperties.Create(Self);
{$ENDIF}
end;

destructor TUPnPDevices.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUPnPDevices.GetServerProperties: TUPnPDevicesProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TUPnPDevices.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

function TUPnPDevices.Get_Item(const bstrUDN: WideString): IUPnPDevice;
begin
    Result := DefaultInterface.Item[bstrUDN];
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUPnPDevicesProperties.Create(AServer: TUPnPDevices);
begin
  inherited Create;
  FServer := AServer;
end;

function TUPnPDevicesProperties.GetDefaultInterface: IUPnPDevices;
begin
  Result := FServer.DefaultInterface;
end;

function TUPnPDevicesProperties.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

function TUPnPDevicesProperties.Get_Item(const bstrUDN: WideString): IUPnPDevice;
begin
    Result := DefaultInterface.Item[bstrUDN];
end;

{$ENDIF}

class function CoUPnPDevice.Create: IUPnPDevice;
begin
  Result := CreateComObject(CLASS_UPnPDevice) as IUPnPDevice;
end;

class function CoUPnPDevice.CreateRemote(const MachineName: string): IUPnPDevice;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UPnPDevice) as IUPnPDevice;
end;

procedure TUPnPDevice.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{A32552C5-BA61-457A-B59A-A2561E125E33}';
    IntfIID:   '{3D44D0D1-98C9-4889-ACD1-F9D674BF2221}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUPnPDevice.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUPnPDevice;
  end;
end;

procedure TUPnPDevice.ConnectTo(svrIntf: IUPnPDevice);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUPnPDevice.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUPnPDevice.GetDefaultInterface: IUPnPDevice;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TUPnPDevice.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUPnPDeviceProperties.Create(Self);
{$ENDIF}
end;

destructor TUPnPDevice.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUPnPDevice.GetServerProperties: TUPnPDeviceProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TUPnPDevice.Get_IsRootDevice: WordBool;
begin
    Result := DefaultInterface.IsRootDevice;
end;

function TUPnPDevice.Get_RootDevice: IUPnPDevice;
begin
    Result := DefaultInterface.RootDevice;
end;

function TUPnPDevice.Get_ParentDevice: IUPnPDevice;
begin
    Result := DefaultInterface.ParentDevice;
end;

function TUPnPDevice.Get_HasChildren: WordBool;
begin
    Result := DefaultInterface.HasChildren;
end;

function TUPnPDevice.Get_Children: IUPnPDevices;
begin
    Result := DefaultInterface.Children;
end;

function TUPnPDevice.Get_UniqueDeviceName: WideString;
begin
    Result := DefaultInterface.UniqueDeviceName;
end;

function TUPnPDevice.Get_FriendlyName: WideString;
begin
    Result := DefaultInterface.FriendlyName;
end;

function TUPnPDevice.Get_type_: WideString;
begin
    Result := DefaultInterface.type_;
end;

function TUPnPDevice.Get_PresentationURL: WideString;
begin
    Result := DefaultInterface.PresentationURL;
end;

function TUPnPDevice.Get_ManufacturerName: WideString;
begin
    Result := DefaultInterface.ManufacturerName;
end;

function TUPnPDevice.Get_ManufacturerURL: WideString;
begin
    Result := DefaultInterface.ManufacturerURL;
end;

function TUPnPDevice.Get_ModelName: WideString;
begin
    Result := DefaultInterface.ModelName;
end;

function TUPnPDevice.Get_ModelNumber: WideString;
begin
    Result := DefaultInterface.ModelNumber;
end;

function TUPnPDevice.Get_Description: WideString;
begin
    Result := DefaultInterface.Description;
end;

function TUPnPDevice.Get_ModelURL: WideString;
begin
    Result := DefaultInterface.ModelURL;
end;

function TUPnPDevice.Get_UPC: WideString;
begin
    Result := DefaultInterface.UPC;
end;

function TUPnPDevice.Get_SerialNumber: WideString;
begin
    Result := DefaultInterface.SerialNumber;
end;

function TUPnPDevice.Get_Services: IUPnPServices;
begin
    Result := DefaultInterface.Services;
end;

function TUPnPDevice.IconURL(const bstrEncodingFormat: WideString; lSizeX: Integer; 
                             lSizeY: Integer; lBitDepth: Integer): WideString;
begin
  Result := DefaultInterface.IconURL(bstrEncodingFormat, lSizeX, lSizeY, lBitDepth);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUPnPDeviceProperties.Create(AServer: TUPnPDevice);
begin
  inherited Create;
  FServer := AServer;
end;

function TUPnPDeviceProperties.GetDefaultInterface: IUPnPDevice;
begin
  Result := FServer.DefaultInterface;
end;

function TUPnPDeviceProperties.Get_IsRootDevice: WordBool;
begin
    Result := DefaultInterface.IsRootDevice;
end;

function TUPnPDeviceProperties.Get_RootDevice: IUPnPDevice;
begin
    Result := DefaultInterface.RootDevice;
end;

function TUPnPDeviceProperties.Get_ParentDevice: IUPnPDevice;
begin
    Result := DefaultInterface.ParentDevice;
end;

function TUPnPDeviceProperties.Get_HasChildren: WordBool;
begin
    Result := DefaultInterface.HasChildren;
end;

function TUPnPDeviceProperties.Get_Children: IUPnPDevices;
begin
    Result := DefaultInterface.Children;
end;

function TUPnPDeviceProperties.Get_UniqueDeviceName: WideString;
begin
    Result := DefaultInterface.UniqueDeviceName;
end;

function TUPnPDeviceProperties.Get_FriendlyName: WideString;
begin
    Result := DefaultInterface.FriendlyName;
end;

function TUPnPDeviceProperties.Get_type_: WideString;
begin
    Result := DefaultInterface.type_;
end;

function TUPnPDeviceProperties.Get_PresentationURL: WideString;
begin
    Result := DefaultInterface.PresentationURL;
end;

function TUPnPDeviceProperties.Get_ManufacturerName: WideString;
begin
    Result := DefaultInterface.ManufacturerName;
end;

function TUPnPDeviceProperties.Get_ManufacturerURL: WideString;
begin
    Result := DefaultInterface.ManufacturerURL;
end;

function TUPnPDeviceProperties.Get_ModelName: WideString;
begin
    Result := DefaultInterface.ModelName;
end;

function TUPnPDeviceProperties.Get_ModelNumber: WideString;
begin
    Result := DefaultInterface.ModelNumber;
end;

function TUPnPDeviceProperties.Get_Description: WideString;
begin
    Result := DefaultInterface.Description;
end;

function TUPnPDeviceProperties.Get_ModelURL: WideString;
begin
    Result := DefaultInterface.ModelURL;
end;

function TUPnPDeviceProperties.Get_UPC: WideString;
begin
    Result := DefaultInterface.UPC;
end;

function TUPnPDeviceProperties.Get_SerialNumber: WideString;
begin
    Result := DefaultInterface.SerialNumber;
end;

function TUPnPDeviceProperties.Get_Services: IUPnPServices;
begin
    Result := DefaultInterface.Services;
end;

{$ENDIF}

class function CoUPnPServices.Create: IUPnPServices;
begin
  Result := CreateComObject(CLASS_UPnPServices) as IUPnPServices;
end;

class function CoUPnPServices.CreateRemote(const MachineName: string): IUPnPServices;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UPnPServices) as IUPnPServices;
end;

procedure TUPnPServices.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C0BC4B4A-A406-4EFC-932F-B8546B8100CC}';
    IntfIID:   '{3F8C8E9E-9A7A-4DC8-BC41-FF31FA374956}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUPnPServices.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUPnPServices;
  end;
end;

procedure TUPnPServices.ConnectTo(svrIntf: IUPnPServices);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUPnPServices.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUPnPServices.GetDefaultInterface: IUPnPServices;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TUPnPServices.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUPnPServicesProperties.Create(Self);
{$ENDIF}
end;

destructor TUPnPServices.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUPnPServices.GetServerProperties: TUPnPServicesProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TUPnPServices.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

function TUPnPServices.Get_Item(const bstrServiceId: WideString): IUPnPService;
begin
    Result := DefaultInterface.Item[bstrServiceId];
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUPnPServicesProperties.Create(AServer: TUPnPServices);
begin
  inherited Create;
  FServer := AServer;
end;

function TUPnPServicesProperties.GetDefaultInterface: IUPnPServices;
begin
  Result := FServer.DefaultInterface;
end;

function TUPnPServicesProperties.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

function TUPnPServicesProperties.Get_Item(const bstrServiceId: WideString): IUPnPService;
begin
    Result := DefaultInterface.Item[bstrServiceId];
end;

{$ENDIF}

class function CoUPnPService.Create: IUPnPService;
begin
  Result := CreateComObject(CLASS_UPnPService) as IUPnPService;
end;

class function CoUPnPService.CreateRemote(const MachineName: string): IUPnPService;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UPnPService) as IUPnPService;
end;

procedure TUPnPService.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C624BA95-FBCB-4409-8C03-8CCEEC533EF1}';
    IntfIID:   '{A295019C-DC65-47DD-90DC-7FE918A1AB44}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUPnPService.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUPnPService;
  end;
end;

procedure TUPnPService.ConnectTo(svrIntf: IUPnPService);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUPnPService.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUPnPService.GetDefaultInterface: IUPnPService;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TUPnPService.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUPnPServiceProperties.Create(Self);
{$ENDIF}
end;

destructor TUPnPService.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUPnPService.GetServerProperties: TUPnPServiceProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TUPnPService.Get_ServiceTypeIdentifier: WideString;
begin
    Result := DefaultInterface.ServiceTypeIdentifier;
end;

function TUPnPService.Get_Id: WideString;
begin
    Result := DefaultInterface.Id;
end;

function TUPnPService.Get_LastTransportStatus: Integer;
begin
    Result := DefaultInterface.LastTransportStatus;
end;

function TUPnPService.QueryStateVariable(const bstrVariableName: WideString): OleVariant;
begin
  Result := DefaultInterface.QueryStateVariable(bstrVariableName);
end;

function TUPnPService.InvokeAction(const bstrActionName: WideString; vInActionArgs: OleVariant; 
                                   var pvOutActionArgs: OleVariant): OleVariant;
begin
  Result := DefaultInterface.InvokeAction(bstrActionName, vInActionArgs, pvOutActionArgs);
end;

procedure TUPnPService.AddCallback(const pUnkCallback: IUnknown);
begin
  DefaultInterface.AddCallback(pUnkCallback);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUPnPServiceProperties.Create(AServer: TUPnPService);
begin
  inherited Create;
  FServer := AServer;
end;

function TUPnPServiceProperties.GetDefaultInterface: IUPnPService;
begin
  Result := FServer.DefaultInterface;
end;

function TUPnPServiceProperties.Get_ServiceTypeIdentifier: WideString;
begin
    Result := DefaultInterface.ServiceTypeIdentifier;
end;

function TUPnPServiceProperties.Get_Id: WideString;
begin
    Result := DefaultInterface.Id;
end;

function TUPnPServiceProperties.Get_LastTransportStatus: Integer;
begin
    Result := DefaultInterface.LastTransportStatus;
end;

{$ENDIF}

class function CoUPnPDescriptionDocument.Create: IUPnPDescriptionDocument;
begin
  Result := CreateComObject(CLASS_UPnPDescriptionDocument) as IUPnPDescriptionDocument;
end;

class function CoUPnPDescriptionDocument.CreateRemote(const MachineName: string): IUPnPDescriptionDocument;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UPnPDescriptionDocument) as IUPnPDescriptionDocument;
end;

procedure TUPnPDescriptionDocument.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{1D8A9B47-3A28-4CE2-8A4B-BD34E45BCEEB}';
    IntfIID:   '{11D1C1B2-7DAA-4C9E-9595-7F82ED206D1E}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUPnPDescriptionDocument.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUPnPDescriptionDocument;
  end;
end;

procedure TUPnPDescriptionDocument.ConnectTo(svrIntf: IUPnPDescriptionDocument);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUPnPDescriptionDocument.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUPnPDescriptionDocument.GetDefaultInterface: IUPnPDescriptionDocument;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TUPnPDescriptionDocument.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUPnPDescriptionDocumentProperties.Create(Self);
{$ENDIF}
end;

destructor TUPnPDescriptionDocument.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUPnPDescriptionDocument.GetServerProperties: TUPnPDescriptionDocumentProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TUPnPDescriptionDocument.Get_ReadyState: Integer;
begin
    Result := DefaultInterface.ReadyState;
end;

function TUPnPDescriptionDocument.Get_LoadResult: Integer;
begin
    Result := DefaultInterface.LoadResult;
end;

procedure TUPnPDescriptionDocument.Load(const bstrUrl: WideString);
begin
  DefaultInterface.Load(bstrUrl);
end;

procedure TUPnPDescriptionDocument.LoadAsync(const bstrUrl: WideString; const pUnkCallback: IUnknown);
begin
  DefaultInterface.LoadAsync(bstrUrl, pUnkCallback);
end;

procedure TUPnPDescriptionDocument.Abort;
begin
  DefaultInterface.Abort;
end;

function TUPnPDescriptionDocument.RootDevice: IUPnPDevice;
begin
  Result := DefaultInterface.RootDevice;
end;

function TUPnPDescriptionDocument.DeviceByUDN(const bstrUDN: WideString): IUPnPDevice;
begin
  Result := DefaultInterface.DeviceByUDN(bstrUDN);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUPnPDescriptionDocumentProperties.Create(AServer: TUPnPDescriptionDocument);
begin
  inherited Create;
  FServer := AServer;
end;

function TUPnPDescriptionDocumentProperties.GetDefaultInterface: IUPnPDescriptionDocument;
begin
  Result := FServer.DefaultInterface;
end;

function TUPnPDescriptionDocumentProperties.Get_ReadyState: Integer;
begin
    Result := DefaultInterface.ReadyState;
end;

function TUPnPDescriptionDocumentProperties.Get_LoadResult: Integer;
begin
    Result := DefaultInterface.LoadResult;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TUPnPDeviceFinder, TUPnPDevices, TUPnPDevice, TUPnPServices, 
    TUPnPService, TUPnPDescriptionDocument]);
end;

end.
