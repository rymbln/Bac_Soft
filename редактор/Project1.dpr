program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {FormStudents: TFrame},
  Unit3 in 'Unit3.pas' {FormQUESTION},
  Unit4 in 'Unit4.pas' {FormGROUP},
  Unit5 in 'Unit5.pas' {FormTEST},
  Unit6 in 'Unit6.pas' {DataModule6: TDataModule},
  Unit7 in 'Unit7.pas' {FormSTUDENT},
  Unit8 in 'Unit8.pas' {Form8},
  Unit9 in 'Unit9.pas' {TGridReport},
  Unit10 in 'Unit10.pas' {Form10},
  Unit11 in 'Unit11.pas' {Form11};

{$R *.res}

begin
  Application.Initialize;
   Application.CreateForm(TDataModule6, DataModule6);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormQUESTION, FormQUESTION);
  Application.CreateForm(TFormGROUP, FormGROUP);
  Application.CreateForm(TFormTEST, FormTEST);
  Application.CreateForm(TFormSTUDENT, FormSTUDENT);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TTGridReport, TGridReport);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
