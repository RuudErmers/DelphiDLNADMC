object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 588
  ClientWidth = 963
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 128
    Top = 407
    Width = 37
    Height = 16
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 568
    Top = 472
    Width = 33
    Height = 16
    Caption = 'Seek:'
  end
  object Button1: TButton
    Left = 24
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Devices'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 128
    Top = 16
    Width = 809
    Height = 169
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
    WordWrap = False
  end
  object ServerListBox: TListBox
    Left = 128
    Top = 200
    Width = 177
    Height = 89
    TabOrder = 2
    OnClick = ServerListBoxClick
  end
  object ItemListBox: TListBox
    Left = 336
    Top = 200
    Width = 601
    Height = 209
    TabOrder = 3
    OnClick = ItemListBoxClick
  end
  object RendererListBox: TListBox
    Left = 128
    Top = 304
    Width = 177
    Height = 97
    TabOrder = 4
    OnClick = RendererListBoxClick
  end
  object Button3: TButton
    Left = 344
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Back'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 448
    Top = 415
    Width = 75
    Height = 25
    Caption = 'Play'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button2: TButton
    Left = 336
    Top = 464
    Width = 177
    Height = 25
    Caption = 'Play Video'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button5: TButton
    Left = 536
    Top = 415
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 624
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Seek'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 712
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Pause'
    TabOrder = 10
    OnClick = Button7Click
  end
  object SpinEdit1: TSpinEdit
    Left = 624
    Top = 464
    Width = 121
    Height = 26
    MaxValue = 0
    MinValue = 0
    TabOrder = 11
    Value = 0
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 336
    Top = 504
  end
end
