unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Unit6;

type
  TFormTEST = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LabeledEdit6: TLabeledEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTEST: TFormTEST;

implementation

uses Unit1;

{$R *.dfm}

procedure TFormTEST.BitBtn1Click(Sender: TObject);
begin
if formTEST.Caption = 'Редактировать тест' then
begin
  if (formTEST.LabeledEdit1.Text<>'') and (formTEST.LabeledEdit2.Text<>'')
  and (formTEST.LabeledEdit3.Text<>'') and (formTEST.LabeledEdit4.Text<>'')
  and (formTEST.LabeledEdit5.Text<>'') and (formTEST.LabeledEdit6.Text<>'')     then
  begin
              datamodule6.IBTransaction2.Active:=true;
              datamodule6.IBQueryAddGroup.SQL.Clear;
              datamodule6.IBQueryAddGroup.SQL.Add('update TEST set TEST_DESCRIPTION = :description, MARK_A = :markA, MARK_B = :markB, MARK_C = :markC, MARK_D = :markD, TIME_LIMIT = :timelimit where ID_TEST = :id');
              datamodule6.IBQueryAddGroup.ParamByName('description').Value := Trim(formTEST.LabeledEdit1.Text);
              datamodule6.IBQueryAddGroup.ParamByName('markA').Value := Trim(formTEST.LabeledEdit2.Text);
              datamodule6.IBQueryAddGroup.ParamByName('markB').Value := Trim(formTEST.LabeledEdit3.Text);
              datamodule6.IBQueryAddGroup.ParamByName('markC').Value := Trim(formTEST.LabeledEdit4.Text);
              datamodule6.IBQueryAddGroup.ParamByName('markD').Value := Trim(formTEST.LabeledEdit5.Text);
              datamodule6.IBQueryAddGroup.ParamByName('timelimit').Value := Trim(formTEST.LabeledEdit6.Text);
              datamodule6.IBQueryAddGroup.ParamByName('id').Value := form1.DBGridTest.DataSource.DataSet.Fields[0].AsInteger;
              datamodule6.IBQueryAddGroup.Prepare;
              datamodule6.IBQueryAddGroup.ExecSQL;
              datamodule6.IBTransaction2.Commit;
              Form1.DBGridTest.DataSource.DataSet.Close;
              form1.DBGridTest.DataSource.DataSet.Open;
    end
  else
    showmessage('Проверьте правильность заполнения всех параметров!');
end
else
if formTEST.CAption = 'Добавить тест' then
begin
 if (formTEST.LabeledEdit1.Text<>'') and (formTEST.LabeledEdit2.Text<>'')
  and (formTEST.LabeledEdit3.Text<>'') and (formTEST.LabeledEdit4.Text<>'')
  and (formTEST.LabeledEdit5.Text<>'') and (formTEST.LabeledEdit6.Text<>'')     then
  begin
              datamodule6.IBTransaction2.Active:=true;
              datamodule6.IBQueryAddGroup.SQL.Clear;
              datamodule6.IBQueryAddGroup.SQL.Add('INSERT into TEST (TEST_DESCRIPTION, MARK_A, MARK_B, MARK_C, MARK_D, TIME_LIMIT) values (:description, :markA, :markB, :markC, :markD, :timelimit)');
              datamodule6.IBQueryAddGroup.ParamByName('description').Value := Trim(formTEST.LabeledEdit1.Text);
              datamodule6.IBQueryAddGroup.ParamByName('markA').Value := Trim(formTEST.LabeledEdit2.Text);
              datamodule6.IBQueryAddGroup.ParamByName('markB').Value := Trim(formTEST.LabeledEdit3.Text);
              datamodule6.IBQueryAddGroup.ParamByName('markC').Value := Trim(formTEST.LabeledEdit4.Text);
              datamodule6.IBQueryAddGroup.ParamByName('markD').Value := Trim(formTEST.LabeledEdit5.Text);
              datamodule6.IBQueryAddGroup.ParamByName('timelimit').Value := Trim(formTEST.LabeledEdit6.Text);
              datamodule6.IBQueryAddGroup.Prepare;
              datamodule6.IBQueryAddGroup.ExecSQL;
              datamodule6.IBTransaction2.Commit;
 Form1.DBGridTest.DataSource.DataSet.Close;
              form1.DBGridTest.DataSource.DataSet.Open;
    end
  else
    showmessage('Проверьте правильность заполнения всех параметров!');
  end;
end;

end.
