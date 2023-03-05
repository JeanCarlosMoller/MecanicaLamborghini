unit UfrmOrcamentosMecanico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmOrcamentosMecanico = class(TForm)
    rectFundo: TRectangle;
    rectNovoOrcamento: TRoundRect;
    Label4: TLabel;
    rectVisualizarOrcamento: TRoundRect;
    Label1: TLabel;
    rectExcluirOrcamento: TRoundRect;
    Label2: TLabel;
    logoLamborhini: TImage;
    lytBotoes: TLayout;
    lstListaOrcamentos: TLayout;
    lstOrcamentos: TListView;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lytPrincipal: TLayout;
    procedure rectNovoOrcamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrcamentosMecanico: TfrmOrcamentosMecanico;

implementation

{$R *.fmx}

procedure TfrmOrcamentosMecanico.rectNovoOrcamentoClick(Sender: TObject);
var
  xItem: TListViewItem;
begin
  xItem     := lstOrcamentos.Items.Add;

  TListItemText(xItem.Objects.FindDrawable('txtNumero')).Text := '0192';
  TListItemText(xItem.Objects.FindDrawable('txtCliente')).Text := 'João Silva';
  TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text := 'R$ 1.500,00';
  TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text := 'Aguardando Aprovação Cliente';

end;

end.
