// JCL_DEBUG_EXPERT_INSERTJDBG OFF
program DBServer;

uses
  FastMM5,
  Vcl.Forms,
  uFrmDBSrv in 'uFrmDBSrv.pas' {FrmDBSrv};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmDBSrv, FrmDBSrv);
  Application.Run;
end.
