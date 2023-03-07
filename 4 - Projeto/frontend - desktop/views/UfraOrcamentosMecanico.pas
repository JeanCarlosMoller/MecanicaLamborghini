unit UfraOrcamentosMecanico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
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
    Button1: TButton;
    procedure rectNovoOrcamentoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  fraOrcamentosMecanico: TfraOrcamentosMecanico;

implementation

uses
  UfraNovoOrcamento,
  UfrmHomeMecanico;

{$R *.fmx}

procedure TfraOrcamentosMecanico.Button1Click(Sender: TObject);
var
  xItem: TListViewItem;
begin
  xItem := lstOrcamentos.Items.Add;

  TListItemText(xItem.Objects.FindDrawable('txtNumero')).Text := '0192';
  TListItemText(xItem.Objects.FindDrawable('txtCliente')).Text := 'João Silva';
  TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text :=
    'R$ 1.500,00';
  TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text :=
    'Aguardando Aprovação Cliente';

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
