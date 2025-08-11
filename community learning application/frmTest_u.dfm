object frmTest: TfrmTest
  Left = 0
  Top = 0
  Caption = 'Test'
  ClientHeight = 330
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 689
    Height = 477
    Color = clDefault
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object pnlBack1: TPanel
      Left = 0
      Top = 148
      Width = 502
      Height = 182
      Color = clTeal
      ParentBackground = False
      TabOrder = 0
      object pnlTrue: TPanel
        Left = 19
        Top = 0
        Width = 95
        Height = 37
        Color = clLime
        ParentBackground = False
        TabOrder = 0
        Visible = False
        object btnTrue: TButton
          Left = 7
          Top = 4
          Width = 75
          Height = 25
          Caption = 'True'
          TabOrder = 0
          OnClick = btnTrueClick
        end
      end
      object pnlFalse: TPanel
        Left = 19
        Top = 46
        Width = 95
        Height = 41
        Color = clRed
        ParentBackground = False
        TabOrder = 1
        Visible = False
        object btnFalse: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = 'False'
          TabOrder = 0
          OnClick = btnFalseClick
        end
      end
      object pnlType: TPanel
        Left = 120
        Top = 7
        Width = 369
        Height = 49
        Color = clSkyBlue
        ParentBackground = False
        TabOrder = 2
        Visible = False
        object edtConcept: TEdit
          Left = 133
          Top = 12
          Width = 211
          Height = 21
          TabOrder = 0
          Text = 'Enter concept'
        end
        object pnlBackButton: TPanel
          Left = 23
          Top = 8
          Width = 88
          Height = 33
          Color = clActiveCaption
          ParentBackground = False
          TabOrder = 1
          object btnNextDefinition: TButton
            Left = 8
            Top = 8
            Width = 75
            Height = 17
            Caption = 'Next'
            TabOrder = 0
            OnClick = btnNextDefinitionClick
          end
        end
      end
      object btbNext: TBitBtn
        Left = 164
        Top = 62
        Width = 75
        Height = 25
        Caption = 'Next'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 3
        Visible = False
        OnClick = btbNextClick
      end
      object pnlMultiChoice: TPanel
        Left = 27
        Top = 93
        Width = 457
        Height = 97
        Color = clSkyBlue
        ParentBackground = False
        TabOrder = 4
        Visible = False
        object chk1: TCheckBox
          Left = 33
          Top = 8
          Width = 208
          Height = 17
          Caption = 'chk1'
          TabOrder = 0
          OnClick = chk1Click
        end
        object chk2: TCheckBox
          Left = 33
          Top = 55
          Width = 208
          Height = 17
          Caption = 'CheckBox1'
          TabOrder = 1
          OnClick = chk2Click
        end
        object chk3: TCheckBox
          Left = 274
          Top = 8
          Width = 183
          Height = 17
          Caption = 'CheckBox1'
          TabOrder = 2
          OnClick = chk3Click
        end
        object chk4: TCheckBox
          Left = 274
          Top = 57
          Width = 175
          Height = 17
          Caption = 'CheckBox1'
          TabOrder = 3
          OnClick = chk4Click
        end
      end
      object mpcorrectanswer: TMediaPlayer
        Left = 245
        Top = 62
        Width = 253
        Height = 25
        Visible = False
        TabOrder = 5
      end
    end
    object redOutPut: TRichEdit
      Left = 88
      Top = 16
      Width = 305
      Height = 113
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object pnlEndTest: TPanel
      Left = 361
      Top = 368
      Width = 328
      Height = 218
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object lblMessage: TLabel
        Left = 7
        Top = 50
        Width = 71
        Height = 16
        Caption = 'lblMessage'
      end
      object Panel2: TPanel
        Left = 7
        Top = 90
        Width = 145
        Height = 79
        Color = clMaroon
        ParentBackground = False
        TabOrder = 0
        object lblUserScore: TLabel
          Left = 13
          Top = 44
          Width = 80
          Height = 16
          Caption = 'lblUserScore'
        end
        object Label3: TLabel
          Left = 9
          Top = 14
          Width = 89
          Height = 16
          Caption = 'YOUR SCORE :'
        end
      end
      object Panel3: TPanel
        Left = 174
        Top = 88
        Width = 147
        Height = 81
        Color = clMaroon
        ParentBackground = False
        TabOrder = 1
        object label2: TLabel
          Left = 3
          Top = 16
          Width = 135
          Height = 16
          Caption = 'THIS TEST AVERAGE :'
        end
        object lblTestAvg: TLabel
          Left = 38
          Top = 46
          Width = 68
          Height = 16
          Caption = 'lblTestAvg'
        end
      end
      object Panel5: TPanel
        Left = -6
        Top = 175
        Width = 334
        Height = 42
        Color = clMaroon
        ParentBackground = False
        TabOrder = 2
        object Panel6: TPanel
          Left = 254
          Top = 0
          Width = 81
          Height = 41
          Color = clTeal
          ParentBackground = False
          TabOrder = 0
          object BitBtn1: TBitBtn
            Left = 245
            Top = 11
            Width = 75
            Height = 25
            Caption = 'ReTest'
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 0
            OnClick = btbReTestClick
          end
          object btbReTest: TBitBtn
            Left = 3
            Top = 11
            Width = 75
            Height = 25
            Caption = 'Re-Test'
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 1
            OnClick = btbReTestClick
          end
        end
      end
      object Panel7: TPanel
        Left = -6
        Top = 0
        Width = 334
        Height = 34
        Color = clMaroon
        ParentBackground = False
        TabOrder = 3
        object Label1: TLabel
          Left = 137
          Top = 8
          Width = 77
          Height = 21
          Caption = 'RESULTS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel4: TPanel
          Left = 5
          Top = -5
          Width = 88
          Height = 38
          Color = clTeal
          ParentBackground = False
          TabOrder = 0
          object btbBack: TBitBtn
            Left = 7
            Top = 13
            Width = 75
            Height = 20
            Caption = 'BACK'
            DoubleBuffered = True
            Glyph.Data = {
              52060000424D5206000000000000360000002800000016000000170000000100
              1800000000001C06000000000000000000000000000000000000FEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE0000FEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFD
              FDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFE0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFE0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFE0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFE161616000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE0000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFE000000000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE0000FEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFE252525000000010101000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE0000FEFEFEFEFEFE
              FEFEFEFEFEFE0000000000000909090202020101010101010000000000000000
              00000000000000000000000000000000FEFEFEFEFEFEFEFEFEFEFEFE0000FEFE
              FEFEFEFEFEFEFE00000000000000000002020201010101010100000000000000
              0000000000000000010101010101010101000000FEFEFEFEFEFEFEFEFEFEFEFE
              0000FEFEFEFEFEFE2C2C2C000000000000020202020202020202020202020202
              020202020202020202020202020202020202000000000000FEFEFEFEFEFEFEFE
              FEFEFEFE0000FEFEFEFEFEFE0606060000000202020202020202020202020202
              02020202020202020202020202020202020202020202000000000000FEFEFEFE
              FEFEFEFEFEFEFEFE0000FEFEFEFEFEFE2424240000000F0F0F02020205050502
              0202020202060606010101020202020202020202050505020202000000000000
              FEFEFEFEFEFEFEFEFEFEFEFE0000FEFEFEFEFEFEFEFEFE000000060606020202
              0202020202020000000000000000000202020000000101010000010000000000
              00000000FEFEFEFEFEFEFEFEFEFEFEFE0000FEFEFEFEFEFEFEFEFEFEFEFE0101
              0101010102020202020202020200000000000000000000000000000000000019
              1919000000020202FEFEFEFEFEFEFEFEFEFEFEFE0000FEFEFEFEFEFEFEFEFEFE
              FEFE9A9A9A020202010101030303020202FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE0000FEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEF8F8F80101010A0A0A000000FEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE0000FEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE5F5F5F010101000000FEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED4D4D42F2F2FFDFDFD
              FDFDFDFEFEFEFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFE0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFD
              FDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFE0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFE0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE0000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE0000}
            Margin = 3
            ParentDoubleBuffered = False
            TabOrder = 0
            OnClick = btbBackClick
          end
        end
      end
    end
  end
end
