object FrameInicio: TFrameInicio
  Left = 0
  Top = 0
  Width = 900
  Height = 678
  TabOrder = 0
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 673
    BevelOuter = bvNone
    Constraints.MaxHeight = 800
    Constraints.MaxWidth = 900
    TabOrder = 0
    object pnlBody: TPanel
      Left = 0
      Top = 0
      Width = 900
      Height = 673
      TabOrder = 0
      object pnlDadosAdicionais: TPanel
        Left = 1
        Top = 481
        Width = 898
        Height = 193
        Align = alTop
        Caption = 'pnlDadosAdicionais'
        TabOrder = 0
        ExplicitWidth = 864
      end
      object pnlInformacoesDoGrafico: TPanel
        Left = 1
        Top = 145
        Width = 898
        Height = 336
        Align = alTop
        Caption = 'Panel1'
        TabOrder = 1
        ExplicitWidth = 864
      end
      object pnlInformacoesDoFluxo: TPanel
        Left = 1
        Top = 1
        Width = 898
        Height = 144
        Align = alTop
        TabOrder = 2
        ExplicitWidth = 864
        object pnlInformacaoReceita: TPanel
          AlignWithMargins = True
          Left = 331
          Top = 16
          Width = 185
          Height = 112
          Margins.Left = 80
          Margins.Top = 15
          Margins.Right = 15
          Margins.Bottom = 15
          Align = alLeft
          Color = 15658734
          ParentBackground = False
          TabOrder = 0
          object lblReceita: TLabel
            Left = 1
            Top = 1
            Width = 183
            Height = 30
            Align = alTop
            Alignment = taCenter
            Caption = 'Receitas no M'#234's'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 151
          end
          object lblValorReceita: TLabel
            Left = 1
            Top = 31
            Width = 183
            Height = 80
            Align = alClient
            Alignment = taCenter
            Caption = 'Label1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 79
            ExplicitHeight = 37
          end
        end
        object pnlInformacaoResultado: TPanel
          AlignWithMargins = True
          Left = 51
          Top = 16
          Width = 185
          Height = 112
          Margins.Left = 50
          Margins.Top = 15
          Margins.Right = 15
          Margins.Bottom = 15
          Align = alLeft
          Color = 15658734
          ParentBackground = False
          TabOrder = 1
          object lblResultado: TLabel
            Left = 1
            Top = 1
            Width = 183
            Height = 30
            Align = alTop
            Alignment = taCenter
            Caption = 'Saldo Atual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 106
          end
          object lblValorResultado: TLabel
            Left = 1
            Top = 31
            Width = 183
            Height = 80
            Align = alClient
            Alignment = taCenter
            Caption = 'Label1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 79
            ExplicitHeight = 37
          end
        end
        object pnlInfomacaoDespesa: TPanel
          AlignWithMargins = True
          Left = 611
          Top = 16
          Width = 185
          Height = 112
          Margins.Left = 80
          Margins.Top = 15
          Margins.Right = 15
          Margins.Bottom = 15
          Align = alLeft
          Color = 15658734
          ParentBackground = False
          TabOrder = 2
          object lblDespesas: TLabel
            Left = 1
            Top = 1
            Width = 183
            Height = 30
            Align = alTop
            Alignment = taCenter
            Caption = 'Despesas no M'#234's'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 162
          end
          object lblValorDespesa: TLabel
            Left = 1
            Top = 31
            Width = 183
            Height = 80
            Align = alClient
            Alignment = taCenter
            Caption = 'Label1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 79
            ExplicitHeight = 37
          end
        end
      end
    end
  end
end
