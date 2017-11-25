program GammaFunc;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  LUX.Math.Gamma in '_LIBRARY\LUXOPHIA\LUX\» Math\LUX.Math.Gamma.pas',
  LUX.Math.Gamma.Lanczos in '_LIBRARY\LUXOPHIA\LUX\» Math\LUX.Math.Gamma.Lanczos.pas',
  LUX.Math.Gamma.Ooura in '_LIBRARY\LUXOPHIA\LUX\» Math\LUX.Math.Gamma.Ooura.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
