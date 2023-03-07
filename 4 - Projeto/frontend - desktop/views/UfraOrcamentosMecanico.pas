unit UfraOrcamentosMecanico;

interface

uses
  System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.Controls.Presentation, FMX.Layouts;

type
  TfraOrcamentosMecanico = class(TFrame)
    rectFundo: TRectangle;
    logoLamborhini: TImage;
    lytPrincipalOrcamentoMecanico: TLayout;
    lytBotoes: TLayout;
    rectExcluirOrcamento: TRoundRect;
    Label2: TLabel;
    rectVisualizarOrcamento: TRoundRect;
    Label1: TLabel;
    rectNovoOrcamento: TRoundRect;
    Label4: TLabel;
    lstListaOrcamentos: TLayout;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lstOrcamentos: TListView;
    procedure rectNovoOrcamentoClick(Sender: TObject);
    procedure rectExcluirOrcamentoClick(Sender: TObject);
    procedure FrameResized(Sender: TObject);
  private
    { Private declarations }
    procedure ExcluirRegistro;

  public
    { Public declarations }
  end;

var
  fraOrcamentosMecanico: TfraOrcamentosMecanico;

implementation

uses
  UfraNovoOrcamento,
  UfrmHomeMecanico, System.SysUtils;

{$R *.fmx}




procedure TfraOrcamentosMecanico.ExcluirRegistro;
var
  xItem: TListViewItem;
begin
  if lstOrcamentos.ItemIndex = -1 then
    Exit;

  lstOrcamentos.Items.Delete(lstOrcamentos.ItemIndex);

end;

procedure TfraOrcamentosMecanico.FrameResized(Sender: TObject);
var
  xItem: TListViewItem;
  I: Integer;
begin
  for I := 1 to 3 do
  begin
    xItem := lstOrcamentos.Items.Add;

    TListItemText(xItem.Objects.FindDrawable('txtNumero')).Text := FloatToStr(Random(9999));
    TListItemText(xItem.Objects.FindDrawable('txtCliente')).Text := 'João Silva';
    TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text :=
      'R$ 1.300,00';
    TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text :=
      'Aguardando Aprovação Cliente';

    xItem := lstOrcamentos.Items.Add;

    TListItemText(xItem.Objects.FindDrawable('txtNumero')).Text := FloatToStr(Random(9999));
    TListItemText(xItem.Objects.FindDrawable('txtCliente')).Text := 'Pedro Santos';
    TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text :=
      'R$ 1.000,00';
    TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text :=
      'Serviço em Andamento';

    xItem := lstOrcamentos.Items.Add;

    TListItemText(xItem.Objects.FindDrawable('txtNumero')).Text := FloatToStr(Random(9999));
    TListItemText(xItem.Objects.FindDrawable('txtCliente')).Text := 'José Correa';
    TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text :=
      'R$ 4.000,00';
    TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text :=
      'Aprovado e Aguardando Execução';

    xItem := lstOrcamentos.Items.Add;

    TListItemText(xItem.Objects.FindDrawable('txtNumero')).Text := FloatToStr(Random(9999));
    TListItemText(xItem.Objects.FindDrawable('txtCliente')).Text := 'Marcos Almeida';
    TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text :=
      'R$ 400,00';
    TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text :=
      'Serviço em Andamento';

    xItem := lstOrcamentos.Items.Add;

    TListItemText(xItem.Objects.FindDrawable('txtNumero')).Text := FloatToStr(Random(9999));
    TListItemText(xItem.Objects.FindDrawable('txtCliente')).Text := 'Cristiano Silva';
    TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text :=
      'R$ 690,00';
    TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text :=
      'Serviço Concluído';

    xItem := lstOrcamentos.Items.Add;

     TListItemText(xItem.Objects.FindDrawable('txtNumero')).Text := FloatToStr(Random(9999));
    TListItemText(xItem.Objects.FindDrawable('txtCliente')).Text := 'Daniel Pereira';
    TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text :=
      'R$ 900,00';
    TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text :=
      'Serviço Concluído';
  end;
end;

procedure TfraOrcamentosMecanico.rectExcluirOrcamentoClick(Sender: TObject);
begin
  ExcluirRegistro
end;

procedure TfraOrcamentosMecanico.rectNovoOrcamentoClick(Sender: TObject);
begin
  if not Assigned(fraNovoOrcamento) then
    fraNovoOrcamento := TfraNovoOrcamento.Create(Application);

  fraNovoOrcamento.Align := TAlignLayout.Center;
  //lytPrincipalOrcamentoMecanico.Parent.AddObject(fraNovoOrcamento);
  Self.Parent.AddObject(fraNovoOrcamento);
end;

end.
