unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ToolWin, ComCtrls;

type
  TFormTESTEDIT = class(TForm)
    ToolBar1: TToolBar;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    CheckBoxRandom: TCheckBox;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CheckBoxAdaptive: TCheckBox;
    CheckBoxVisible: TCheckBox;
    EditDESCRIPTIONTEST: TEdit;
    EditTimeLimit: TEdit;
    EditQuestCOUNT: TEdit;
    EditMarkA: TEdit;
    EditMarkB: TEdit;
    EditMarkC: TEdit;
    EditMarkD: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTESTEDIT: TFormTESTEDIT;

implementation

uses Unit5, Unit1;

{$R *.dfm}

procedure TFormTESTEDIT.BitBtn1Click(Sender: TObject);
begin
FormTESTEDIT.Close;
end;

procedure TFormTESTEDIT.BitBtn2Click(Sender: TObject);
begin
if (formTESTEDIT.EditDESCRIPTIONTEST.Text<>'') and (formTESTEDIT.EditTimeLimit.Text<>'')
  and (formTESTEDIT.EditQuestCOUNT.Text<>'') and (formTESTEDIT.EditMarkA.Text<>'')
  and (formTESTEDIT.EditMarkB.Text<>'') and (formTESTEDIT.EditMarkC.Text<>'')
  and (formTESTEDIT.EditMarkD.Text<>'') then
  begin
      with datamodule5 do
      begin
          IBTransaction2.Active:=true;
          IBQueryTEst.SQL.Clear;
          IBQueryTEST.SQL.Add('update TEST set TEST_DESCRIPTION = :description,');
          IBQueryTEST.SQL.Add(' MARK_A = :markA, MARK_B = :markB, MARK_C = :markC, MARK_D = :markD, ');
          IBQueryTEST.SQL.Add(' VISIBILITY = :vis, RANDOM_MODE = :rand, ACTIVE_QUESTIONS = :act_QUE, ADAPTIVE = :adaptive, ');
          IBQueryTEST.SQL.Add('TIME_LIMIT = :timelimit where ID_TEST = :id');
          IBQueryTEST.ParamByName('description').Value:=trim(formTESTEDIT.EditDESCRIPTIONTEST.Text);
          IBQueryTEST.ParamByName('markA').Value:=trim(formTESTEDIT.EditMarkA.Text);
          IBQueryTEST.ParamByName('markB').Value:=trim(formTESTEDIT.EditMarkB.Text);
          IBQueryTEST.ParamByName('markC').Value:=trim(formTESTEDIT.EditMarkC.Text);
          IBQueryTEST.ParamByName('markD').Value:=trim(formTESTEDIT.EditMarkD.Text);
          IBQueryTEST.ParamByName('act_QUE').Value:=trim(formTESTEDIT.EditQuestCOUNT.Text);
          IBQueryTEst.ParamByName('id').Value := trim(form1.DBGridTEST.DataSource.DataSet.Fields[0].AsString);
          IBQueryTEST.ParamByName('timelimit').Value:=trim(formTESTEDIT.EditTimeLimit.Text);
          if formTESTEDIT.CheckBoxRandom.Checked then  IBQueryTEST.ParamByName('rand').Value:= '1'
            else IBQueryTEST.ParamByName('rand').Value:= '0';
          if formTESTEDIT.CheckBoxAdaptive.Checked then  IBQueryTEST.ParamByName('adaptive').Value:= '1'
            else IBQueryTEST.ParamByName('adaptive').Value:= '0';
          if formTESTEDIT.CheckBoxVisible.Checked then  IBQueryTEST.ParamByName('vis').Value:= '1'
            else IBQueryTEST.ParamByName('vis').Value:= '0';
          IBQUERYTESt.Prepare;
          IBQueryTEST.ExecSQL;
          IBTransaction2.Commit;
      end;
      form1.DBGridTEST.DataSource.DataSet.Close;
      form1.DBGridTEST.DataSource.DataSet.Open;
      formTESTEDIT.Close;
  end
else
   showmessage('Проверьте правильность заполнения всех параметров!');
end;

end.
