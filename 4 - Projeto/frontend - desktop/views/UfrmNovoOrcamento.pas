unit UfrmNovoOrcamento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Objects, FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts, FMX.ListBox, FMX.Edit;

type
  TfrmNovoOrcamento = class(TForm)
    lytPrincipal: TLayout;
    lytAdicionarItem: TLayout;
    rectAdicionarItem: TRoundRect;
    Label2: TLabel;
    lstListaOrcamentos: TLayout;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lstItensPecas: TListView;
    rectFundo: TRectangle;
    logoLamborhini: TImage;
    rectTipoItem: TRoundRect;
    rectQuantidade: TRoundRect;
    edtQuantidade: TEdit;
    cmbTipoItem: TComboBox;
    Rectangle1: TRectangle;
    StyleBook1: TStyleBook;
    Label1: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    lblUnidMedida: TLabel;
    rectValorUnitario: TRoundRect;
    edtValorUnitario: TEdit;
    Label10: TLabel;
    rectDescricacao: TRoundRect;
    edtDescricao: TEdit;
    Label11: TLabel;
    lytHeaderPecas: TLayout;
    lytOrcamentoPecas: TLayout;
    lytTituloPecas: TLayout;
    Label12: TLabel;
    lytTituloOrcamento: TLayout;
    lblTituloOrcamento: TLabel;
    lytStatus: TLayout;
    rectStatus: TRoundRect;
    cmbStatus: TComboBox;
    rectAtualizarStatus: TRoundRect;
    Label13: TLabel;
    Line1: TLine;
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
    procedure rectAdicionarItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoOrcamento: TfrmNovoOrcamento;

implementation

{$R *.fmx}

procedure TfrmNovoOrcamento.rectAdicionarItemClick(Sender: TObject);
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


  TListItemText(xItem.Objects.FindDrawable('txtDescricao')).Text := edtDescricao.Text;
  TListItemText(xItem.Objects.FindDrawable('txtQuantidade')).Text := edtQuantidade.Text;
  TListItemText(xItem.Objects.FindDrawable('txtUnidadeMedida')).Text := lblUnidMedida.Text;
  TListItemText(xItem.Objects.FindDrawable('txtValorUnitario')).Text := edtValorUnitario.Text;
  TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text := FloatToStr(xValorTotal);
end;

end.
