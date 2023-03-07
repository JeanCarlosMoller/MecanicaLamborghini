unit UfrmHomeMecanico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.ListBox, FMX.MultiView;

type
  TfrmHomeMecanico = class(TForm)
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
    procedure AbrirEditarMecanico;
    procedure AbrirOrcamentosMecanico;
    procedure RemoverTelaAnterior;
  public
    { Public declarations }

  end;

var
  frmHomeMecanico: TfrmHomeMecanico;

implementation

uses
  UUtils.Enums,
  UfraEditarPerfilMecanico,
  UfraOrcamentosMecanico,
  UfraNovoOrcamento;

{$R *.fmx}

procedure TfrmHomeMecanico.AbrirEditarMecanico;
begin
  if not Assigned(fraEditarPerfilMecanico) then
    fraEditarPerfilMecanico := TfraEditarPerfilMecanico.Create(Application);

  fraEditarPerfilMecanico.Align := TAlignLayout.Center;
  lytPrincipal.AddObject(fraEditarPerfilMecanico);
end;

procedure TfrmHomeMecanico.AbrirOrcamentosMecanico;
begin
  if not Assigned(fraOrcamentosMecanico) then
    fraOrcamentosMecanico := TfraOrcamentosMecanico.Create(Application);

  fraOrcamentosMecanico.Align := TAlignLayout.Center;
  lytPrincipal.AddObject(fraOrcamentosMecanico);
end;

procedure TfrmHomeMecanico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  frmHomeMecanico := nil;
end;

procedure TfrmHomeMecanico.imgLogoClick(Sender: TObject);
begin
  AbrirEditarMecanico;
end;

procedure TfrmHomeMecanico.lstMenuItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  Self.RemoverTelaAnterior;

  case TEnumMenuMecanico(Item.Index) of
    mnuOrcamentos:
      AbrirOrcamentosMecanico;
    mnuServico:
      ShowMessage('test');
    mnuPecas:
      ShowMessage('test');
    mnuGerenciarUsuario:
      ShowMessage('test');
    mnuSair:
      Self.Close;
  end;
end;

procedure TfrmHomeMecanico.RemoverTelaAnterior;

var
  I: Integer;
begin
  for I := Pred(lytPrincipal.ControlsCount) downto 0 do
      lytPrincipal.RemoveObject(I)
end;

end.
