unit UComEnumerator;

interface


type
  IEnumVariant = interface(IUnknown)
    ['{00020404-0000-0000-C000-000000000046}']
    function Next(celt: LongWord; var rgvar : OleVariant;
      out pceltFetched: LongWord): HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out Enum: IEnumVariant): HResult; stdcall;
  end;


  // the "TComEnumerator" class basically just follows the outline of Borlands
  // Enumerator classes. All methods are implemented as asked for in the Delphi
  // 2005 Help
  TComEnumerator = class
  private
    FEnum: IEnumVariant;
    FCurrent: IInterface;
  public
    constructor Create(aEnum: IInterface);
    function GetEnumerator: TComEnumerator;


    function GetCurrent: IInterface;
    function MoveNext: Boolean;
    property Current: IInterface read GetCurrent;
  end;


// use "GetCOMEnumerator" to get an "TComEnumerator" class for your
// for...in...do constructs
//   - Paramter aEnum
//     an interface that implements the default IEnumVariant interface as
//     defined by Microsoft (and found in ActiveX.pas)
//   - Return value
//     the Enumerator class that is used in for...in...do constructs.
//
// Attention: Call GetCOMEnumerator() each time you want to pass an enumeration
// to Delphi's for...in...do construct. Do not cache this object, Delphi will
// automatically destroy it (using an internal try...finally...end block) once
// the for...in...do loop has been finished.
//
// Note: You can use GetCOMEnumerator() on any COM Enum Variant collection. To
// access your object directly simply cast the enumerated value to the COM type
// needed (provided that it is supported ;))
function GetCOMEnumerator(aEnum: IInterface): TComEnumerator;


implementation


function GetCOMEnumerator(aEnum: IInterface): TComEnumerator;
begin
  Result := TComEnumerator.Create(aEnum);
end;


{ TComEnumerator }


constructor TComEnumerator.Create(aEnum: IInterface);
begin
  inherited Create;
  try
    // save the enumeration
    FEnum := aEnum as IEnumVariant;
  except
    // fetch developer errors :-O
    FEnum := nil;
  end;
end;


function TComEnumerator.GetCurrent: IInterface;
begin
  // return the current object
  Result := FCurrent;
end;


function TComEnumerator.GetEnumerator: TComEnumerator;
begin
  // return the class itself as enumerator for the Delphi-Language
  Result := Self;
end;


function TComEnumerator.MoveNext: Boolean;
var
  OleCurrent: OleVariant;
  Fetched: Cardinal;
begin
  if FEnum <> nil then
  begin
    // fetch the next element from the collection list
    FEnum.Next(1, OleCurrent, Fetched);
    if Fetched = 1 then
    begin
      // another object was fetched
      FCurrent := OleCurrent;
      Result := True;
    end
    else
    begin
      // no more objects in enumaration
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;
end;


end.
