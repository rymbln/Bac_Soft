unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm6 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit4, Unit2;

{$R *.dfm}

procedure TForm6.BitBtn1Click(Sender: TObject);
begin
   with datamodule4 do
  begin
  IBDatabase1.Params.Clear;
  IBDatabase1.LoginPrompt:=False;
  IBDatabase1.Connected:=False;
  IBDatabase1.DatabaseName:=labeledEdit1.text+':D:\test_base.fdb';
  IBDatabase1.Params.Add('user_name=SYSDBA');
  IBDatabase1.Params.Add('password=masterkey');
  IBDatabase1.Params.Add('lc_ctype=win1251');
  IBDAtabase1.Connected:=true;
  end;
  form6.Visible:=false;
  formAutorization.Visible:=true;
end;

end.
