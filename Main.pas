unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  LUX;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
      GroupBox1: TGroupBox;
        LabelX0: TLabel;
          EditX0: TEdit;
        LabelX1: TLabel;
          EditX1: TEdit;
      LabelN: TLabel;
        EditN: TEdit;
      Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { private 宣言 }
  public
    { public 宣言 }
  end;

var
  Form1: TForm1;

implementation //############################################################### ■

{$R *.fmx}

uses LUX.Math.Special.Gamma.Ooura,
     LUX.Math.Special.Gamma.Lanczos;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.Button1Click(Sender: TObject);
var
   N, I :Integer;
   X0, X1, X, G :Double;
   S :String;
begin
     with Memo1 do
     begin
          Lines.Clear;

          N := EditN.Text.ToInteger;

          X0 := EditX0.Text.ToDouble;
          X1 := EditX1.Text.ToDouble;

          for I := 0 to N do
          begin
               X := ( X1 - X0 ) / N * I + X0;

               G := LUX.Math.Special.Gamma.Ooura.Gamma( X );

               if Double.IsInfinity( G ) or Double.IsNan( G ) then S := ''
                                                              else S := G.ToString;

               Lines.Add( X.ToString + '	' + S );
          end;

          SelectAll;
          SetFocus;
     end;
end;

end. //######################################################################### ■
