unit UfraNovoOrcamento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Objects, FMX.ListView, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox,
  FMX.Layouts;

type
  TfraNovoOrcamento = class(TFrame)
    lytPrincipal: TLayout;
    lytAdicionarItem: TLayout;
    Rectangle1: TRectangle;
    rectTipoItem: TRoundRect;
    cmbTipoItem: TComboBox;
    rectQuantidade: TRoundRect;
    edtQuantidade: TEdit;
    Label1: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    rectAdicionarItem: TRoundRect;
    Label2: TLabel;
    lblUnidMedida: TLabel;
    rectValorUnitario: TRoundRect;
    edtValorUnitario: TEdit;
    Label10: TLabel;
    rectDescricacao: TRoundRect;
    edtDescricao: TEdit;
    Label11: TLabel;
    lstListaOrcamentos: TLayout;
    lytOrcamentoPecas: TLayout;
    lstItensPecas: TListView;
    lytHeaderPecas: TLayout;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    lytTituloPecas: TLayout;
    Label12: TLabel;
    Line1: TLine;
    lytTituloOrcamento: TLayout;
    lblTituloOrcamento: TLabel;
    lytStatus: TLayout;
    rectStatus: TRoundRect;
    cmbStatus: TComboBox;
    rectAtualizarStatus: TRoundRect;
    Label13: TLabel;
    lytOrcamentosServicos: TLayout;
    lstItensServicos: TListView;
    lytHeaderServicos: TLayout;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lytTituloServicos: TLayout;
    Label19: TLabel;
    Line2: TLine;
    lytValorTotal: TLayout;
    Label20: TLabel;
    Line3: TLine;
    lblValorTotal: TLabel;
    rectEditarItem: TRoundRect;
    Label21: TLabel;
    rectExcluirItem: TRoundRect;
    Label22: TLabel;
    rectFundo: TRectangle;
    logoLamborhini: TImage;
    StyleBook1: TStyleBook;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
