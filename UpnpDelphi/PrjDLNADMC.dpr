program PrjDLNADMC;

uses
  Forms,
  UMain in 'UMain.pas' {FormMain},
  UPNPLib_TLB in '..\UPNPLib_TLB.pas',
  UComEnumerator in '..\UComEnumerator.pas',
  UAVTransportService in '..\UAVTransportService.pas',
  UUpnpDMC in '..\UUpnpDMC.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
