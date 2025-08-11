object frmAdmin: TfrmAdmin
  Left = 0
  Top = 0
  Caption = 'frmAdmin'
  ClientHeight = 339
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pgcDbGrids: TPageControl
    Left = -4
    Top = -2
    Width = 695
    Height = 347
    ActivePage = tbsUsers
    TabOrder = 0
    OnChange = pgcDbGridsChange
    object tbsUsers: TTabSheet
      Caption = 'tbsUsers'
      object Panel5: TPanel
        Left = -4
        Top = -10
        Width = 737
        Height = 380
        Color = clTeal
        ParentBackground = False
        TabOrder = 0
        object Panel21: TPanel
          Left = 4
          Top = 2
          Width = 733
          Height = 183
          Color = clBlack
          ParentBackground = False
          TabOrder = 0
          object Label9: TLabel
            Left = 257
            Top = 17
            Width = 109
            Height = 25
            Caption = 'TBLUSERS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel25: TPanel
            Left = 7
            Top = 48
            Width = 673
            Height = 129
            Color = clMaroon
            ParentBackground = False
            TabOrder = 0
            object DGBusers: TDBGrid
              Left = 8
              Top = 8
              Width = 656
              Height = 111
              DataSource = dmComLearning.dsrUsers
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = [fsBold]
            end
          end
        end
        object Panel2: TPanel
          Left = 209
          Top = 276
          Width = 83
          Height = 37
          Color = clMaroon
          ParentBackground = False
          TabOrder = 1
          object BtnDeleteUser: TButton
            Left = 4
            Top = 8
            Width = 72
            Height = 25
            Caption = 'Delete user'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = BtnDeleteUserClick
          end
          object Panel3: TPanel
            Left = 168
            Top = 0
            Width = 105
            Height = 54
            Color = clMaroon
            ParentBackground = False
            TabOrder = 1
          end
        end
        object Panel30: TPanel
          Left = 11
          Top = 191
          Width = 180
          Height = 126
          Color = clMaroon
          ParentBackground = False
          TabOrder = 2
          object Label1: TLabel
            Left = 47
            Top = 3
            Width = 90
            Height = 13
            Caption = 'SORT TABEL BY :'
          end
          object Label2: TLabel
            Left = 106
            Top = 22
            Width = 68
            Height = 13
            Caption = 'DECENDING :'
          end
          object Label3: TLabel
            Left = 8
            Top = 23
            Width = 69
            Height = 13
            Caption = 'ASCENDING :'
          end
          object Panel34: TPanel
            Left = 0
            Top = 41
            Width = 177
            Height = 93
            Color = clMaroon
            ParentBackground = False
            TabOrder = 0
            object btnNameSortD: TButton
              Left = 9
              Top = 9
              Width = 68
              Height = 25
              Caption = 'Name'
              TabOrder = 0
              OnClick = btnNameSortDClick
            end
            object btnSurnameSortA: TButton
              Left = 9
              Top = 51
              Width = 68
              Height = 25
              Caption = 'Surname'
              TabOrder = 1
              OnClick = btnSurnameSortAClick
            end
            object btnSortNameD: TButton
              Left = 106
              Top = 9
              Width = 68
              Height = 25
              Caption = 'Name '
              TabOrder = 2
              OnClick = btnSortNameDClick
            end
            object btnSurnameSortD: TButton
              Left = 106
              Top = 51
              Width = 68
              Height = 25
              Caption = 'Surname'
              TabOrder = 3
              OnClick = btnSurnameSortDClick
            end
          end
        end
        object redOutputFeedback: TRichEdit
          Left = 492
          Top = 191
          Width = 185
          Height = 126
          Color = clMaroon
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Lines.Strings = (
            '')
          ParentFont = False
          TabOrder = 3
        end
        object Panel8: TPanel
          Left = 197
          Top = 191
          Width = 289
          Height = 46
          Color = clMaroon
          ParentBackground = False
          TabOrder = 4
          object Label4: TLabel
            Left = 40
            Top = 3
            Width = 106
            Height = 13
            Caption = 'SEARCH A USERID :'
          end
          object spnstudent: TSpinEdit
            Left = 40
            Top = 21
            Width = 121
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 0
            Value = 0
          end
          object Panel33: TPanel
            Left = 209
            Top = 0
            Width = 98
            Height = 54
            Color = clMaroon
            ParentBackground = False
            TabOrder = 1
            object btnstudentS: TButton
              Left = 5
              Top = 9
              Width = 68
              Height = 31
              Caption = 'Search'
              TabOrder = 0
              OnClick = btnstudentSClick
            end
          end
        end
        object Panel35: TPanel
          Left = 403
          Top = 274
          Width = 83
          Height = 41
          Color = clMaroon
          ParentBackground = False
          TabOrder = 5
          object btnReadFeedback: TButton
            Left = 4
            Top = 10
            Width = 77
            Height = 23
            Caption = 'Feedback'
            TabOrder = 0
            OnClick = btnReadFeedbackClick
          end
        end
      end
    end
    object tbsContent: TTabSheet
      Caption = 'Content'
      ImageIndex = 1
      object Panel18: TPanel
        Left = -8
        Top = -10
        Width = 737
        Height = 372
        Color = clMaroon
        ParentBackground = False
        TabOrder = 0
        object Panel24: TPanel
          Left = 4
          Top = 2
          Width = 733
          Height = 183
          Color = clBlack
          ParentBackground = False
          TabOrder = 0
          object Label10: TLabel
            Left = 256
            Top = 9
            Width = 140
            Height = 25
            Caption = 'TBLCONTENT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel26: TPanel
            Left = 7
            Top = 40
            Width = 681
            Height = 137
            Color = clMaroon
            ParentBackground = False
            TabOrder = 0
            object dgbContent: TDBGrid
              Left = 11
              Top = 8
              Width = 657
              Height = 120
              DataSource = dmComLearning.dsrContent
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = [fsBold]
            end
          end
        end
        object panel29: TPanel
          Left = 11
          Top = 194
          Width = 174
          Height = 119
          Color = clTeal
          ParentBackground = False
          TabOrder = 1
          object btnDelete: TButton
            Left = 38
            Top = 47
            Width = 91
            Height = 25
            Caption = 'Delete Record'
            TabOrder = 0
            OnClick = btnDeleteClick
          end
          object btnDeleteSet: TButton
            Left = 38
            Top = 87
            Width = 88
            Height = 25
            Caption = 'Delete Set'
            TabOrder = 1
            OnClick = btnDeleteSetClick
          end
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 193
            Height = 41
            Color = clTeal
            ParentBackground = False
            TabOrder = 2
            object Label8: TLabel
              Left = 1
              Top = 15
              Width = 168
              Height = 16
              Caption = 'DELETE FROM TBLCONTENT:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object memdisplay: TMemo
          Left = 527
          Top = 230
          Width = 152
          Height = 84
          Color = clTeal
          Lines.Strings = (
            '')
          TabOrder = 2
        end
        object Panel32: TPanel
          Left = 202
          Top = 191
          Width = 295
          Height = 50
          Color = clTeal
          ParentBackground = False
          TabOrder = 3
          object Label6: TLabel
            Left = 24
            Top = 5
            Width = 123
            Height = 13
            Caption = 'SEARCH A CONTENTID:'
          end
          object Panel1: TPanel
            Left = 192
            Top = 0
            Width = 157
            Height = 50
            Color = clTeal
            ParentBackground = False
            TabOrder = 0
            object spncontentidsearch: TButton
              Left = 10
              Top = 8
              Width = 75
              Height = 34
              Caption = 'Search'
              TabOrder = 0
              OnClick = spncontentidsearchClick
            end
          end
          object spncontentid: TSpinEdit
            Left = 28
            Top = 20
            Width = 121
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
        end
        object Panel6: TPanel
          Left = 191
          Top = 260
          Width = 82
          Height = 41
          Color = clTeal
          ParentBackground = False
          TabOrder = 4
          object btnView: TButton
            Left = 8
            Top = 9
            Width = 65
            Height = 24
            Caption = 'View'
            TabOrder = 0
            OnClick = btnViewClick
          end
        end
        object Panel7: TPanel
          Left = 530
          Top = 191
          Width = 149
          Height = 40
          Color = clTeal
          ParentBackground = False
          TabOrder = 5
          object btnReports: TButton
            Left = 5
            Top = 8
            Width = 132
            Height = 25
            Caption = 'Reports'
            TabOrder = 0
            OnClick = btnReportsClick
          end
        end
        object Panel16: TPanel
          Left = 279
          Top = 259
          Width = 218
          Height = 41
          Color = clTeal
          ParentBackground = False
          TabOrder = 6
          object lblDefinition: TLabel
            Left = 0
            Top = 12
            Width = 67
            Height = 13
            Caption = 'lblDefinition'
            Visible = False
          end
        end
      end
    end
    object tbsTests: TTabSheet
      Caption = 'Tests'
      ImageIndex = 2
      object Panel19: TPanel
        Left = 0
        Top = -10
        Width = 737
        Height = 372
        Color = clTeal
        ParentBackground = False
        TabOrder = 0
        object Panel22: TPanel
          Left = 4
          Top = 2
          Width = 733
          Height = 183
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object Label11: TLabel
            Left = 256
            Top = 16
            Width = 104
            Height = 25
            Caption = 'TBLTESTS'
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Panel27: TPanel
            Left = 18
            Top = 47
            Width = 653
            Height = 121
            Color = clMaroon
            ParentBackground = False
            TabOrder = 0
            object dgbTests: TDBGrid
              Left = 8
              Top = 8
              Width = 641
              Height = 107
              DataSource = dmComLearning.dsrTests
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = [fsBold]
            end
          end
        end
        object Panel9: TPanel
          Left = 218
          Top = 191
          Width = 252
          Height = 45
          Color = clMaroon
          ParentBackground = False
          TabOrder = 1
          object Label5: TLabel
            Left = 24
            Top = 5
            Width = 113
            Height = 13
            Caption = 'SEARCH A TESTNUM:'
          end
          object Panel37: TPanel
            Left = 158
            Top = -5
            Width = 99
            Height = 49
            Color = clMaroon
            ParentBackground = False
            TabOrder = 0
            object btntestsearch: TButton
              Left = 9
              Top = 17
              Width = 80
              Height = 24
              Caption = 'Search'
              TabOrder = 0
              OnClick = btntestsearchClick
            end
          end
          object spnTestsearch: TSpinEdit
            Left = 24
            Top = 24
            Width = 121
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
        end
        object Panel31: TPanel
          Left = 14
          Top = 191
          Width = 185
          Height = 122
          Color = clMaroon
          ParentBackground = False
          TabOrder = 2
          object btnDeletetest: TButton
            Left = 8
            Top = 93
            Width = 75
            Height = 25
            Caption = 'Single test'
            TabOrder = 0
            OnClick = btnDeletetestClick
          end
          object btnDeleteTestUser: TButton
            Left = 99
            Top = 93
            Width = 75
            Height = 25
            Caption = 'Userid'
            TabOrder = 1
            OnClick = btnDeleteTestUserClick
          end
          object btnDeleteTestContentid: TButton
            Left = 99
            Top = 46
            Width = 75
            Height = 25
            Caption = 'Contentid'
            TabOrder = 2
            OnClick = btnDeleteTestContentidClick
          end
          object btnDeleteTestdate: TButton
            Left = 13
            Top = 47
            Width = 75
            Height = 25
            Caption = 'Testdate'
            TabOrder = 3
            OnClick = btnDeleteTestdateClick
          end
          object Panel36: TPanel
            Left = 0
            Top = 0
            Width = 295
            Height = 41
            Color = clMaroon
            ParentBackground = False
            TabOrder = 4
            object LBLdeletefromtests: TLabel
              Left = 0
              Top = 12
              Width = 189
              Height = 18
              Caption = 'DELETE FROM TBLTESTS:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object Button1: TButton
          Left = 728
          Top = 216
          Width = 75
          Height = 25
          Caption = 'Button1'
          TabOrder = 3
        end
        object Panel11: TPanel
          Left = 476
          Top = 191
          Width = 185
          Height = 122
          Color = clMaroon
          ParentBackground = False
          TabOrder = 4
          object btnSearchtestDate: TButton
            Left = 111
            Top = 31
            Width = 66
            Height = 19
            Caption = 'search'
            TabOrder = 0
            OnClick = btnSearchtestDateClick
          end
          object dtpTest: TDateTimePicker
            Left = 5
            Top = 31
            Width = 99
            Height = 19
            Date = 44782.065863009260000000
            Time = 44782.065863009260000000
            TabOrder = 1
          end
          object Panel15: TPanel
            Left = 0
            Top = -1
            Width = 185
            Height = 26
            TabOrder = 2
            object Label15: TLabel
              Left = 5
              Top = 7
              Width = 169
              Height = 19
              Caption = 'SEARCH TESTDATES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object redOutTest: TRichEdit
            Left = 0
            Top = 49
            Width = 185
            Height = 74
            Color = clMaroon
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
      end
    end
    object tbsQueries: TTabSheet
      Caption = 'Queries'
      ImageIndex = 3
      object Panel20: TPanel
        Left = -8
        Top = -10
        Width = 737
        Height = 372
        Color = clMaroon
        ParentBackground = False
        TabOrder = 0
        object Label7: TLabel
          Left = 712
          Top = 200
          Width = 37
          Height = 13
          Caption = 'Label7'
        end
        object Panel23: TPanel
          Left = 4
          Top = 2
          Width = 733
          Height = 183
          Color = clBlack
          ParentBackground = False
          TabOrder = 0
          object Label12: TLabel
            Left = 280
            Top = 8
            Width = 79
            Height = 25
            Caption = 'Queries'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel28: TPanel
            Left = 28
            Top = 32
            Width = 652
            Height = 137
            Color = clMaroon
            ParentBackground = False
            TabOrder = 0
            object dgbQueries: TDBGrid
              Left = 8
              Top = 16
              Width = 641
              Height = 105
              DataSource = dmComLearning.dsrComLearning
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = [fsBold]
            end
          end
        end
        object Panel4: TPanel
          Left = 104
          Top = 191
          Width = 225
          Height = 122
          Color = clTeal
          ParentBackground = False
          TabOrder = 1
          object btnTopAchievers: TButton
            Left = 8
            Top = 44
            Width = 95
            Height = 25
            Caption = 'Top Achievers'
            TabOrder = 0
            OnClick = btnTopAchieversClick
          end
          object btnLearnerAVg: TButton
            Left = 109
            Top = 75
            Width = 108
            Height = 25
            Caption = 'learner Averages'
            TabOrder = 1
            OnClick = btnLearnerAVgClick
          end
          object btnRiskLearners: TButton
            Left = 8
            Top = 75
            Width = 95
            Height = 25
            Caption = 'Risk Learners'
            TabOrder = 2
            OnClick = btnRiskLearnersClick
          end
          object Panel13: TPanel
            Left = 0
            Top = -4
            Width = 225
            Height = 41
            TabOrder = 3
            object Label13: TLabel
              Left = 16
              Top = 12
              Width = 182
              Height = 19
              Caption = 'LEARNER STAISTICS :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object Panel12: TPanel
          Left = 400
          Top = 191
          Width = 249
          Height = 122
          Color = clTeal
          ParentBackground = False
          TabOrder = 2
          object btnSubjectPreformance: TButton
            Left = 0
            Top = 44
            Width = 131
            Height = 25
            Caption = 'Subject Preformance'
            TabOrder = 0
            OnClick = btnSubjectPreformanceClick
          end
          object Panel14: TPanel
            Left = 0
            Top = -3
            Width = 249
            Height = 41
            TabOrder = 1
            object Label14: TLabel
              Left = 33
              Top = 11
              Width = 186
              Height = 19
              Caption = ' PERFORMANCE INFO: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object btnAverage: TButton
            Left = 137
            Top = 44
            Width = 129
            Height = 25
            Caption = 'Test Average'
            TabOrder = 2
            OnClick = btnAverageClick
          end
          object btnMax: TButton
            Left = 135
            Top = 83
            Width = 132
            Height = 25
            Caption = 'Test highest'
            TabOrder = 3
            OnClick = btnMaxClick
          end
          object btnmin: TButton
            Left = 0
            Top = 85
            Width = 129
            Height = 25
            Caption = 'Test Lowest'
            TabOrder = 4
            OnClick = btnminClick
          end
        end
      end
    end
  end
end
