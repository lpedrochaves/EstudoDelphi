object FormCategoria: TFormCategoria
  Left = 0
  Top = 0
  Caption = 'FormCategoria'
  ClientHeight = 240
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object strTabelaCategoria: TStringGrid
    AlignWithMargins = True
    Left = 0
    Top = 43
    Width = 360
    Height = 160
    Margins.Left = 0
    Margins.Top = 10
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Constraints.MaxHeight = 160
    Constraints.MaxWidth = 360
    Constraints.MinHeight = 160
    Constraints.MinWidth = 350
    TabOrder = 0
    OnClick = strTabelaCategoriaClick
    OnDblClick = strTabelaCategoriaDblClick
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object pnlBotoes: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 199
    Width = 360
    Height = 41
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 152
    ExplicitWidth = 337
    object btnSelecionar: TButton
      AlignWithMargins = True
      Left = 165
      Top = 8
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 8
      Margins.Right = 40
      Margins.Bottom = 8
      Align = alRight
      Caption = 'Selecionar'
      TabOrder = 0
      OnClick = btnSelecionarClick
      ExplicitLeft = 142
    end
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 280
      Top = 8
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 8
      Margins.Right = 5
      Margins.Bottom = 8
      Align = alRight
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = pnlBotoesClick
      ExplicitLeft = 257
    end
  end
  object dbGridCategorias: TDBGrid
    AlignWithMargins = True
    Left = 5
    Top = 275
    Width = 337
    Height = 109
    Margins.Left = 0
    Margins.Top = 10
    Margins.Right = 0
    Margins.Bottom = 0
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object edtBuscarCategoria: TEdit
    AlignWithMargins = True
    Left = 0
    Top = 10
    Width = 360
    Height = 23
    Margins.Left = 0
    Margins.Top = 10
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    TabOrder = 3
    TextHint = 'Buscar'
    OnChange = edtBuscarCategoriaChange
    ExplicitWidth = 337
  end
end
