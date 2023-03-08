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
    procedure rectAdicionarItemClick(Sender: TObject);
    procedure lblValorTotalResized(Sender: TObject);
    procedure rectExcluirItemClick(Sender: TObject);
    procedure rectAtualizarStatusClick(Sender: TObject);
  private
    { Private declarations }
    FValorTotal : Double;
    procedure ExcluirPeca;
    procedure ExcluirServico;
  public
    { Public declarations }
  end;

var
  fraNovoOrcamento: TfraNovoOrcamento;
implementation

uses
  UUtils.Functions;

{$R *.fmx}

procedure TfraNovoOrcamento.lblValorTotalResized(Sender: TObject);
begin
  lblTituloOrcamento.Text := 'ORÇAMENTO Nº ' + FloatToStr(Random(9999));
end;

procedure TfraNovoOrcamento.rectAdicionarItemClick(Sender: TObject);
var
  xItem: TListViewItem;
  xValorTotal : Double;

begin
  case cmbTipoItem.ItemIndex of
    0: //Peças
    begin
      xItem := lstItensPecas.Items.Add;
      lblUnidMedida.Text := 'un';
    end;
    1: //Serviços
    begin
      xItem := lstItensServicos.Items.Add;
      lblUnidMedida.Text := 'h';
    end;

  end;

  xValorTotal := StrToFloat(edtQuantidade.Text) * StrToFloat(edtValorUnitario.Text);
  FValorTotal := FValorTotal + xValorTotal;

  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := edtDescricao.Text;
  TListItemText(xItem.Objects.FindDrawable('txtQuantidade')).Text := edtQuantidade.Text;
  TListItemText(xItem.Objects.FindDrawable('txtUnidadeMedida')).Text := lblUnidMedida.Text;
  TListItemText(xItem.Objects.FindDrawable('txtValorUnitario')).Text := edtValorUnitario.Text;
  TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text := FloatToStr(xValorTotal);

  lblValorTotal.Text := FormatFloat('R$ ###,###,##0.00',FValorTotal);
end;

procedure TfraNovoOrcamento.rectAtualizarStatusClick(Sender: TObject);
var
  xEmailWasSent: Boolean;
begin
  xEmailWasSent := TUtilsFunctions.EnviarEmail('jeancmoller17@gmail.com', 'Orçamento status: '
    + cmbStatus.Items[cmbStatus.ItemIndex] + 'Mecanica Lamborghini',
    'Status atualizado para ' + cmbStatus.Items[cmbStatus.ItemIndex]);

  if xEmailWasSent then
    ShowMessage('E-mail enviado com sucesso.')
  else
    ShowMessage('Falha ao enviar e-mail.')
end;

procedure TfraNovoOrcamento.rectExcluirItemClick(Sender: TObject);
begin
  Self.ExcluirPeca;
  Self.ExcluirServico;
end;

procedure TfraNovoOrcamento.ExcluirPeca;
var
  xItem: TListViewItem;
begin
  if lstItensPecas.ItemIndex = -1 then
    Exit;
  lstItensPecas.Items.Delete(lstItensPecas.ItemIndex);
end;

procedure TfraNovoOrcamento.ExcluirServico;
var
  xItem: TListViewItem;
begin
  if lstItensServicos.ItemIndex = -1 then
    Exit;
  lstItensServicos.Items.Delete(lstItensServicos.ItemIndex);
end;


end.
