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
    procedure rectNovoCarroClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure rectExcluirCarroClick(Sender: TObject);
    procedure FrameResized(Sender: TObject);
  private
    { Private declarations }
    procedure ExcluirRegistro;
  public
    { Public declarations }
  end;

var
  fraCarrosCliente: TfraCarrosCliente;

implementation

uses
  UfraCadastroCarrosCliente;

{$R *.fmx}

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

procedure TfraCarrosCliente.ExcluirRegistro;
var
  xItem: TListViewItem;
begin
  if lstCarros.ItemIndex = -1 then
    Exit;

  lstCarros.Items.Delete(lstCarros.ItemIndex);

end;

procedure TfraCarrosCliente.FrameResized(Sender: TObject);
var
  xItem: TListViewItem;
begin
  xItem := lstCarros.Items.Add;

  TListItemText(xItem.Objects.FindDrawable('txtModelo')).Text :=
    'Marea';
  TListItemText(xItem.Objects.FindDrawable('txtMarca')).Text := 'Fiat';
  TListItemText(xItem.Objects.FindDrawable('txtCor')).Text := 'Vermelho';
  TListItemText(xItem.Objects.FindDrawable('txtAno')).Text := '2006';
  TListItemText(xItem.Objects.FindDrawable('txtPlaca')).Text := 'AAA6A98';

end;

procedure TfraCarrosCliente.rectExcluirCarroClick(Sender: TObject);
begin
  ExcluirRegistro;
end;

procedure TfraCarrosCliente.rectNovoCarroClick(Sender: TObject);
begin
  if not Assigned(fraCadastroCarrosCliente) then
    fraCadastroCarrosCliente := TfraCadastroCarrosCliente.Create(Application);

  fraCadastroCarrosCliente.Align := TAlignLayout.Center;
  Self.Parent.AddObject(fraCadastroCarrosCliente);
end;

end.
