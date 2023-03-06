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
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure rectNovoCarroClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirCadastroCarro;
  public
    { Public declarations }
  end;

var
  fraCarrosCliente: TfraCarrosCliente;

implementation

uses
  UfraCadastroCarrosCliente;

{$R *.fmx}

procedure TfraCarrosCliente.AbrirCadastroCarro;
begin
  if not Assigned(fraCadastroCarrosCliente) then
    fraCadastroCarrosCliente := TfraCadastroCarrosCliente.Create(Application);

  fraCadastroCarrosCliente.Align := TAlignLayout.Center;
  lytPrincipal.AddObject(fraCadastroCarrosCliente);
end;

procedure TfraCarrosCliente.Button1Click(Sender: TObject);
var
  xItem: TListViewItem;
begin
  xItem := lstCarros.Items.Add;

  TListItemText(xItem.Objects.FindDrawable('txtModelo')).Text :=
    'Lamborghini Aventador';
  TListItemText(xItem.Objects.FindDrawable('txtMarca')).Text := 'Lamborghini';
  TListItemText(xItem.Objects.FindDrawable('txtCor')).Text := 'Preta';
  TListItemText(xItem.Objects.FindDrawable('txtAno')).Text := '2023';
  TListItemText(xItem.Objects.FindDrawable('txtPlaca')).Text := 'BRA1E23';
end;

procedure TfraCarrosCliente.rectNovoCarroClick(Sender: TObject);
begin
  AbrirCadastroCarro;
end;

end.
