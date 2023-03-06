unit UfraCarrosCliente;

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
  TfraCarrosCliente = class(TFrame)
    rectFundo: TRectangle;
    logoLamborhini: TImage;
    lytPrincipal: TLayout;
    lytBotoes: TLayout;
    rectNovoCarro: TRoundRect;
    Label4: TLabel;
    lstListaOrcamentos: TLayout;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lstCarros: TListView;
    rectExcluirCarro: TRoundRect;
    Label1: TLabel;
    Label2: TLabel;
    procedure rectNovoCarroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fraCarrosCliente: TfraCarrosCliente;

implementation

{$R *.fmx}

procedure TfraCarrosCliente.rectNovoCarroClick(Sender: TObject);
begin
  var
    xItem: TListViewItem;
  begin
    xItem := lstCarros.Items.Add;

  TListItemText(xItem.Objects.FindDrawable('txtModelo')).Text := 'Lamborghini Aventador';
  TListItemText(xItem.Objects.FindDrawable('txtMarca')).Text := 'Lamborghini';
  TListItemText(xItem.Objects.FindDrawable('txtCor')).Text := 'Preta';
  TListItemText(xItem.Objects.FindDrawable('txtAno')).Text := '2023';
  TListItemText(xItem.Objects.FindDrawable('txtPlaca')).Text := 'BRA1E23';
  end;
end;

end.
