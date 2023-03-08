unit UfraOrcamentoCompletoCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Controls.Presentation,
  FMX.Layouts;

type
  TfraOrcamentoCompletoCliente = class(TFrame)
    rectFundo: TRectangle;
    logoLamborhini: TImage;
    lytPrincipal: TLayout;
    lytDadosOrcamento: TLayout;
    Label4: TLabel;
    lblNomeCliente: TLabel;
    Label9: TLabel;
    lblCelular: TLabel;
    Label11: TLabel;
    lblCarro: TLabel;
    lblPlaca: TLabel;
    Label24: TLabel;
    Label10: TLabel;
    lblMecanico: TLabel;
    Line4: TLine;
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
    Label1: TLabel;
    lblStatusOrcamento: TLabel;
    rectAprovarOrcamento: TRoundRect;
    Label13: TLabel;
    rectRecusarOrçamento: TRoundRect;
    Label2: TLabel;
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
    procedure FrameResized(Sender: TObject);
    procedure rectAprovarOrcamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
fraOrcamentoCompletoCliente: TfraOrcamentoCompletoCliente;

implementation

{$R *.fmx}

procedure TfraOrcamentoCompletoCliente.FrameResized(Sender: TObject);
var
  xItem : TListViewItem;
begin
  lblNomeCliente.Text     := 'João Silva';
  lblCelular.Text         := '(47) 99922-5587';
  lblCarro.Text           := 'Fiat Marea 2006';
  lblPlaca.Text           := 'AAA6A98';
  lblMecanico.Text        := 'Armando Correa';
  lblStatusOrcamento.Text := 'Aguardando Aprovação Cliente';
  lblTituloOrcamento.Text := 'ORÇAMENTO Nº 1564';
  lblValorTotal.Text      := 'R$ 7.990,00';

  xItem := lstItensPecas.Items.Add;
  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := 'Cabeçote Motor Marea';
  TListItemText(xItem.Objects.FindDrawable('txtQuantidade')).Text := '1';
  TListItemText(xItem.Objects.FindDrawable('txtUnidadeMedida')).Text := 'unid.';
  TListItemText(xItem.Objects.FindDrawable('txtValorUnitario')).Text := 'R$ 2790,00';
  TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text := 'R$ 2790,00';

  xItem := lstItensPecas.Items.Add;
  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := 'Junta Cabeçote Motor Marea';
  TListItemText(xItem.Objects.FindDrawable('txtQuantidade')).Text := '1';
  TListItemText(xItem.Objects.FindDrawable('txtUnidadeMedida')).Text := 'unid.';
  TListItemText(xItem.Objects.FindDrawable('txtValorUnitario')).Text := 'R$ 1000,00';
  TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text := 'R$ 1000,00';

  xItem := lstItensPecas.Items.Add;
  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := 'Suspensão Marea';
  TListItemText(xItem.Objects.FindDrawable('txtQuantidade')).Text := '4';
  TListItemText(xItem.Objects.FindDrawable('txtUnidadeMedida')).Text := 'unid.';
  TListItemText(xItem.Objects.FindDrawable('txtValorUnitario')).Text := 'R$ 500,00';
  TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text := 'R$ 2000,00';

  xItem := lstItensServicos.Items.Add;
  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := 'Manutenção Suspensão Marea';
  TListItemText(xItem.Objects.FindDrawable('txtQuantidade')).Text := '5';
  TListItemText(xItem.Objects.FindDrawable('txtUnidadeMedida')).Text := 'h';
  TListItemText(xItem.Objects.FindDrawable('txtValorUnitario')).Text := 'R$ 100,00';
  TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text := 'R$ 500,00';

  xItem := lstItensServicos.Items.Add;
  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := 'Troca Cabeçote';
  TListItemText(xItem.Objects.FindDrawable('txtQuantidade')).Text := '1';
  TListItemText(xItem.Objects.FindDrawable('txtUnidadeMedida')).Text := 'Unid.';
  TListItemText(xItem.Objects.FindDrawable('txtValorUnitario')).Text := 'R$ 1500,00';
  TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text := 'R$ 1500,00';

end;

procedure TfraOrcamentoCompletoCliente.rectAprovarOrcamentoClick(
  Sender: TObject);
begin
  ShowMessage('Orçamento Aprovado com Sucesso');
  lblStatusOrcamento.Text := 'Aprovado e Aguardando Execução';
  rectAprovarOrcamento.Visible := False;
  rectRecusarOrçamento.Visible := False;
end;

end.
