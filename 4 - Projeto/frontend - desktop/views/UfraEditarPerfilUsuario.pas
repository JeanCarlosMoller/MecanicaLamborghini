unit UfraEditarPerfilUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts;

type
  TfraEditarPerfilUsuario = class(TFrame)
    rectFundo: TRectangle;
    logoLamborhini: TImage;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    RoundRectSenha: TRoundRect;
    edtSenhaAcesso: TEdit;
    RoundRectLogin: TRoundRect;
    edtLoginAcesso: TEdit;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Layout1: TLayout;
    RoundRect2: TRoundRect;
    Edit1: TEdit;
    RoundRect3: TRoundRect;
    edtCPF: TEdit;
    RoundRect1: TRoundRect;
    Edit3: TEdit;
    RoundRect4: TRoundRect;
    Edit4: TEdit;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    rectAcessar: TRoundRect;
    Label4: TLabel;
    lytLogo: TLayout;
    imgLogo: TImage;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 fraEditarPerfilUsuario : TfraEditarPerfilUsuario;

implementation

{$R *.fmx}

end.
