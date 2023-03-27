unit uFrmDBSrv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFrmDBSrv = class(TForm)
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
end;

end.

