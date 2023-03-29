unit FormUtil;

interface

uses
  Vcl.Forms, Vcl.StdCtrls;

/// <remarks> 设置窗体基本属性 </remarks>
procedure FormSetBaseProp(form: TForm);

/// <remarks> 设置 Memo 基本属性 </remarks>
procedure MemoSetBaseProp(memo: TMemo);

implementation

const
  FORM_FONT_NAME = '宋体';

procedure FormSetBaseProp(form: TForm);
begin
  with form do begin
    Font.Name := FORM_FONT_NAME;
    Position := poDesktopCenter;
    BorderIcons := BorderIcons - [biMaximize];
    BorderStyle := bsSingle;
  end;
end;

procedure MemoSetBaseProp(memo: TMemo);
begin
  memo.Clear;
  memo.ReadOnly := True;
  memo.TabStop := False;
  memo.ScrollBars := System.UITypes.TScrollStyle.ssVertical;
end;

end.

