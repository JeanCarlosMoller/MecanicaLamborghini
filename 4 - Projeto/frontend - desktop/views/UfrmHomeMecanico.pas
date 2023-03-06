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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHomeMecanico: TfrmHomeMecanico;

implementation

uses
  UUtils.Enums;

{$R *.fmx}

procedure TfrmHomeMecanico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  frmHomeMecanico := nil;
end;

procedure TfrmHomeMecanico.lstMenuItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  // mnuOrcamentos, mnuServico, mnuPecas,
  // mnuGerenciarUsuario, mnuSair
  case TEnumMenu(Item.Index) of
    mnuOrcamentos:
      ShowMessage('test');
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

end.
