unit uFrmDBSrv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, LogUtil,
  Vcl.StdCtrls;

type
  TFrmDBSrv = class(TForm)
    mmoLog: TMemo;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FrmDBSrv: TFrmDBSrv;

implementation

uses
  FormUtil;

{$R *.dfm}

procedure TFrmDBSrv.FormCreate(Sender: TObject);
begin
  FormSetBaseProp(Self);
  mmoLog.Lines.Add('');
end;

end.

