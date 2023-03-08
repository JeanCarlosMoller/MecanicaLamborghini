unit UfrmHomeUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.ListBox, FMX.MultiView;

type
  TfrmHomeUsuario = class(TForm)
    rectFundo: TRectangle;
    logoLamborhini: TImage;
    lytPrincipal: TLayout;
    btnMenu: TSpeedButton;
    MultiView1: TMultiView;
    Rectangle1: TRectangle;
    lytLogo: TLayout;
    imgLogo: TImage;
    lstMenu: TListBox;
    procedure lstMenuItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgLogoClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirEditarUsuario;
    procedure AbrirOrcamentoUsuario;
    procedure AbrirCarrosCliente;

    procedure RemoverTelaAnterior;
  public
    { Public declarations }
  end;

var
  frmHomeUsuario: TfrmHomeUsuario;

implementation

uses
  UUtils.Enums,
  UfraEditarPerfilUsuario,
  UfraOrcamentosCliente,
  UfraCarrosCliente;

{$R *.fmx}

procedure TfrmHomeUsuario.AbrirCarrosCliente;
begin
  if not Assigned(fraCarrosCliente) then
    fraCarrosCliente := TfraCarrosCliente.Create(nil);

  fraCarrosCliente.Align := TAlignLayout.Center;
  lytPrincipal.AddObject(fraCarrosCliente);
end;

procedure TfrmHomeUsuario.AbrirEditarUsuario;
begin
  if not Assigned(fraEditarPerfilUsuario) then
    fraEditarPerfilUsuario := TfraEditarPerfilUsuario.Create(Application);

  fraEditarPerfilUsuario.Align := TAlignLayout.Center;
  lytPrincipal.AddObject(fraEditarPerfilUsuario);
end;

procedure TfrmHomeUsuario.AbrirOrcamentoUsuario;
begin
  if not Assigned(fraOrcamentoCliente) then
    fraOrcamentoCliente := TfraOrcamentoCliente.Create(Application);

  fraOrcamentoCliente.Align := TAlignLayout.Center;
  lytPrincipal.AddObject(fraOrcamentoCliente);
end;

procedure TfrmHomeUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  frmHomeUsuario := nil;
end;

procedure TfrmHomeUsuario.imgLogoClick(Sender: TObject);
begin
  AbrirEditarUsuario;
end;

procedure TfrmHomeUsuario.lstMenuItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  Self.RemoverTelaAnterior;

  case TEnumMenuCliente(Item.Index) of

    mnuOrcamentosCliente:
      AbrirOrcamentoUsuario;

    mnuSimularServico:
      ShowMessage('test');

    mnuMeusCarros:
      AbrirCarrosCliente;

    mnuSairCliente:
      Self.Close;

  end;

  MultiView1.HideMaster;
end;

procedure TfrmHomeUsuario.RemoverTelaAnterior;
var
  I: Integer;
begin
  for I := Pred(lytPrincipal.ControlsCount) downto 0 do
      lytPrincipal.RemoveObject(I)
end;


end.
