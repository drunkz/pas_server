unit FormUtil;

interface

uses
  Vcl.Forms;

/// <remarks> 设置窗体基本属性 </remarks>
procedure FormSetBaseProp(form: TForm);

implementation

const
  FORM_FONT_NAME = '宋体';

procedure FormSetBaseProp(form: TForm);
begin
  with form do begin
    Font.Name := FORM_FONT_NAME;
    Position := poDesktopCenter;
    BorderIcons := BorderIcons - [biMaximize];
  end;
end;

end.

