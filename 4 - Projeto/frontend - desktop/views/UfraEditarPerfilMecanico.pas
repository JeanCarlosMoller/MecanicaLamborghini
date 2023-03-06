unit UfraEditarPerfilMecanico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts;

type
  TfraEditarPerfilMecanico = class(TFrame)
    rectFundo: TRectangle;
    logoLamborhini: TImage;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    lytLogo: TLayout;
    imgLogo: TImage;
    Label1: TLabel;
    Rectangle6: TRectangle;
    rectAcessar: TRoundRect;
    Label4: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Layout2: TLayout;
    RoundRectSenha: TRoundRect;
    edtSenhaAcesso: TEdit;
    RoundRectLogin: TRoundRect;
    edtLoginAcesso: TEdit;
    RoundRect4: TRoundRect;
    Edit4: TEdit;
    Rectangle3: TRectangle;
    Layout1: TLayout;
    RoundRect2: TRoundRect;
    Edit1: TEdit;
    RoundRect3: TRoundRect;
    Edit2: TEdit;
    RoundRect1: TRoundRect;
    Edit3: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 fraEditarPerfilMecanico : TfraEditarPerfilMecanico;

implementation

{$R *.fmx}

end.
