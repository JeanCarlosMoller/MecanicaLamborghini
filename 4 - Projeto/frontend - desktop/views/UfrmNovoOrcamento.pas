unit UfrmNovoOrcamento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Objects, FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts;

type
  TfrmNovoOrcamento = class(TForm)
    lytPrincipal: TLayout;
    lytBotoes: TLayout;
    rectExcluirOrcamento: TRoundRect;
    Label2: TLabel;
    rectAtualizarOrcamento: TRoundRect;
    Label1: TLabel;
    rectNovoOrcamento: TRoundRect;
    Label4: TLabel;
    lstListaOrcamentos: TLayout;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lstItensOrcamento: TListView;
    rectFundo: TRectangle;
    logoLamborhini: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovoOrcamento: TfrmNovoOrcamento;

implementation

{$R *.fmx}

end.
