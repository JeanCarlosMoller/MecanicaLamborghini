unit UfrmOrcamentosMecanico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmOrcamentosMecanico = class(TForm)
    rectFundo: TRectangle;
    rectNovoOrcamento: TRoundRect;
    Label4: TLabel;
    rectAtualizarOrcamento: TRoundRect;
    Label1: TLabel;
    rectExcluirOrcamento: TRoundRect;
    Label2: TLabel;
    imgConta: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrcamentosMecanico: TfrmOrcamentosMecanico;

implementation

{$R *.fmx}

end.
