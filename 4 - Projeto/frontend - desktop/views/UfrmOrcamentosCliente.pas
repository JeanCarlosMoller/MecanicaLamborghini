unit UfrmOrcamentosCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Objects, FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts;

type
  TfrmOrcamentosCliente = class(TForm)
    lytPrincipal: TLayout;
    lytBotoes: TLayout;
    rectVisualizarOrcamento: TRoundRect;
    Label1: TLabel;
    lstListaOrcamentos: TLayout;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lstOrcamentos: TListView;
    rectFundo: TRectangle;
    logoLamborhini: TImage;
    lytTitulo: TLayout;
    lblTitulo: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrcamentosCliente: TfrmOrcamentosCliente;

implementation

{$R *.fmx}

end.
