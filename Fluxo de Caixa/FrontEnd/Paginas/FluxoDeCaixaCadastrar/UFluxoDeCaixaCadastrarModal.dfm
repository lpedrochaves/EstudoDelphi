object FormFluxoDeCaixaCadastrarModal: TFormFluxoDeCaixaCadastrarModal
  Left = 0
  Top = 0
  Caption = 'Cadastrar Lan'#231'amento'
  ClientHeight = 509
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object lblTitulo: TLabel
    Left = 138
    Top = 24
    Width = 124
    Height = 37
    Caption = 'Cadastrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object imgCategoria: TImage
    Left = 78
    Top = 136
    Width = 24
    Height = 24
    Cursor = crHandPoint
    AutoSize = True
    Center = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
      00180806000000E0773DF80000000473424954080808087C0864880000000970
      485973000000A6000000A601DD7DFF380000001974455874536F667477617265
      007777772E696E6B73636170652E6F72679BEE3C1A000001D24944415478DAB5
      944F2804511CC7674A4E1BB94939B3B1975D522EF642C48D248A13A1C88503C9
      CA81125B72212E1225876D0FC40537CA227F220794B838587221B53E6FF7B58D
      DD99D9996D77EAD3B79DF77BDFEFBEF79BF7D44824A2587D54556D44AAC123F9
      8253C91E5E174973AC04605C8CAC422D3C4108CEC12183DC500073308EE7B7E5
      00CC5B9165084317F5473A352A320033F0082DD4DDA60C605EB95C7E007AA8FD
      4CF1679CC8B6FCE9162B310CA038073901A195D4FD58EC93536EE1227346CC02
      869129697E65C55C337710F18BFE98051C20AF8C77D831D7F4E40D6675036481
      68EA24E3F37603A4C73EF261145082DC8157EFABB118308DB419055421C750C1
      7828CD803164C828205F6E5137E32B690688CFD561D6E41724C8785F9A01E2C0
      6D98052C20CD50464DD8A6790D72084D660185C80304A869B7619E875CC23DF3
      EA525D153B4803F452B764C13C1759837A7031E7D96C053E6442F36A13FA8DB6
      8B7A17B20EE213EFA46E2BFADEE02B4A34DF052FBC435049BEAE3DB25F374AEC
      C6BD8E7B2506E8988BD3EC933D199546459A7171C39E81D84E3FB5BFFFFCB401
      46E63A2B14E7A454899D15D14CC346C603AC9ADB7DA201D9328F0640D6CCF502
      326A9EB8454AA6CDC5F30724D0FF8D0BD8E83B0000000049454E44AE426082}
    OnClick = imgCategoriaClick
  end
  object lblTipoFluxo: TLabel
    Left = 234
    Top = 109
    Width = 93
    Height = 21
    Caption = 'Tipo do Fluxo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblCategoria: TLabel
    Left = 37
    Top = 109
    Width = 67
    Height = 21
    Caption = 'Categoria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblValor: TLabel
    Left = 37
    Top = 189
    Width = 69
    Height = 21
    Caption = 'Valor (R$)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblData: TLabel
    Left = 134
    Top = 109
    Width = 32
    Height = 21
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblDescricao: TLabel
    Left = 37
    Top = 277
    Width = 67
    Height = 21
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblTipoPagamento: TLabel
    Left = 236
    Top = 189
    Width = 78
    Height = 21
    Caption = 'Pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblDadosEmbranco: TLabel
    Left = 138
    Top = 464
    Width = 100
    Height = 15
    Caption = 'lblDadosEmbranco'
    Visible = False
  end
  object lblDadoCategoria: TLabel
    Left = 27
    Top = 168
    Width = 92
    Height = 15
    Caption = 'lblDadoCategoria'
    Visible = False
  end
  object lblDadoData: TLabel
    Left = 145
    Top = 168
    Width = 65
    Height = 15
    Caption = 'lblDadoData'
    Visible = False
  end
  object lblDadoTipoFluxo: TLabel
    Left = 248
    Top = 168
    Width = 93
    Height = 15
    Caption = 'lblDadoTipoFluxo'
    Visible = False
  end
  object lblDadoValor: TLabel
    Left = 54
    Top = 247
    Width = 67
    Height = 15
    Caption = 'lblDadoValor'
    Visible = False
  end
  object lblDadoPagamento: TLabel
    Left = 244
    Top = 247
    Width = 102
    Height = 15
    Caption = 'lblDadoPagamento'
    Visible = False
  end
  object memDescricao: TMemo
    Left = 37
    Top = 304
    Width = 308
    Height = 105
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 5
  end
  object btnCadastrar: TButton
    Left = 37
    Top = 422
    Width = 95
    Height = 35
    Caption = 'Cadastrar'
    TabOrder = 6
    OnClick = btnCadastrarClick
  end
  object btnCancelar: TButton
    Left = 251
    Top = 422
    Width = 95
    Height = 35
    Caption = 'Cancelar'
    TabOrder = 7
    OnClick = btnCancelarClick
  end
  object edtId: TEdit
    Left = 8
    Top = 8
    Width = 25
    Height = 23
    TabOrder = 8
    Text = 'edtId'
    Visible = False
  end
  object pnlCategoria: TPanel
    Left = 37
    Top = 136
    Width = 36
    Height = 25
    BevelOuter = bvNone
    Color = clRed
    ParentBackground = False
    TabOrder = 0
    object edtCategoria: TEdit
      Left = 0
      Top = 0
      Width = 36
      Height = 25
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlTipoFluxo: TPanel
    Left = 234
    Top = 136
    Width = 111
    Height = 25
    BevelOuter = bvNone
    Color = clRed
    ParentBackground = False
    TabOrder = 2
    object selDespesaReceita: TComboBox
      Left = 0
      Top = 0
      Width = 111
      Height = 25
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = selDespesaReceitaKeyPress
      Items.Strings = (
        'Receita'
        'Despesa')
    end
  end
  object pnlData: TPanel
    Left = 132
    Top = 136
    Width = 78
    Height = 25
    BevelOuter = bvNone
    Color = clRed
    ParentBackground = False
    TabOrder = 1
    object edtData: TMaskEdit
      Left = 0
      Top = 0
      Width = 78
      Height = 25
      Align = alClient
      EditMask = '!99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      OnEnter = edtDataEnter
      OnMouseDown = edtDataMouseDown
    end
  end
  object pnlValor: TPanel
    Left = 37
    Top = 216
    Width = 119
    Height = 25
    BevelOuter = bvNone
    Color = clRed
    ParentBackground = False
    TabOrder = 3
    object edtValor: TMaskEdit
      Left = 0
      Top = 0
      Width = 119
      Height = 25
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = ''
      OnChange = edtValorChange
      OnKeyPress = edtValorKeyPress
    end
  end
  object pnlTipoPagamento: TPanel
    Left = 236
    Top = 216
    Width = 109
    Height = 25
    BevelOuter = bvNone
    Color = clRed
    ParentBackground = False
    TabOrder = 4
    object selTipoPagamento: TComboBox
      Left = 0
      Top = 0
      Width = 109
      Height = 25
      Align = alClient
      Style = csOwnerDrawFixed
      ItemHeight = 19
      TabOrder = 0
    end
  end
end
