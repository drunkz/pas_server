unit uFrmDBSrv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TFrmDBSrv = class(TForm)
    mmoLog: TMemo;
    btn1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
  public
  end;

var
  FrmDBSrv: TFrmDBSrv;

implementation

uses
  FormUtil, LogUtil;

{$R *.dfm}

procedure TFrmDBSrv.btn1Click(Sender: TObject);
begin
  g_LogMgr.AddLog('啊手动阀啊手动阀');
end;

procedure TFrmDBSrv.FormCreate(Sender: TObject);
begin
  FormSetBaseProp(Self);
  MemoSetBaseProp(mmoLog);
  g_LogMgr.Init(mmoLog, True);
end;

end.

