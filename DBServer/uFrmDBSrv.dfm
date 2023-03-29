object FrmDBSrv: TFrmDBSrv
  Left = 0
  Top = 0
  Caption = 'FrmDBSrv'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object mmoLog: TMemo
    Left = 120
    Top = 96
    Width = 401
    Height = 193
    Lines.Strings = (
      'mmoLog')
    TabOrder = 0
  end
  object btn1: TButton
    Left = 272
    Top = 320
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 1
    OnClick = btn1Click
  end
end
