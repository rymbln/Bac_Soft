unit Unit2;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ToolWin, IBDatabase, DB,  Grids, DBGrids,
  ExtCtrls, DBCtrls, IBCustomDataSet, IBTable, StdCtrls, Buttons,
  IBUpdateSQL;

type
  TFormAUTORIZATION = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 student = record
  id:integer;
  surname:string[30];
  name:string[30];
  patronimic:string[30];
  end;
test = record
  id:integer;
  description:string[200];
  markA:integer;
  markB:integer;
  markC:integer;
  markD:integer;
  timelimit:integer;
  active_questions:integer;
  end;

question = record
  id:integer;
  text:string[200];
  answer1: string[200];
  answer2:string[200];
  answer3:string[200];
  answer4:string[200];
  rigth_answer:string[200];
  user_answer:string[200];
  score:integer;
  type_question:integer;
  image:TBitmap;
  end;



var
  FormAUTORIZATION: TFormAUTORIZATION;
  _user:student;
  _test:test;
  _case_questions: array[0..100] of question;
implementation

uses Unit1, Unit3, Unit4, Unit5, Unit6;

{$R *.dfm}

procedure TFormAUTORIZATION.BitBtn1Click(Sender: TObject);
begin
   if (formAUTORIZATION.LabeledEdit1.Text<>'') and (formAUTORIZATION.LabeledEdit2.Text<>'') then
    begin
    datamodule4.IBTransaction2.Active:=true;
    datamodule4.IBQuery1.SQL.Clear;
    datamodule4.IBQuery1.SQL.Add('SELECT surname, name, patronimic  FROM respondent WHERE (id_respondent = :id) and (pass = :pass)');
      datamodule4.IBQuery1.ParamByName('id').Value:=formAUTORIZATION.LabeledEdit1.Text;
      datamodule4.IBQuery1.ParamByName('pass').Value:=formAUTORIZATION.LabeledEdit2.Text;
      datamodule4.IBQuery1.Prepare;
      datamodule4.IBQuery1.Open;
      datamodule4.IBTransaction2.Commit;
      form5.DBGridRESPONDENT.DataSource.DataSet.Close;
      form5.DBGridRESPONDENT.DataSource.DataSet.Open;
      _user.id:=strtoint(labeledEdit1.Text);
      _user.surname:=trim(form5.DBGridRESPONDENT.DataSource.DataSet.Fields[0].AsString);
      _user.name:=trim(form5.DBGridRESPONDENT.DataSource.DataSet.Fields[1].AsString);
      _user.patronimic:=trim(form5.DBGridRESPONDENT.DataSource.DataSet.Fields[2].asString);
    end;
    if form5.DBGridRESPONDENT.DataSource.DataSet.Fields[0].AsString<>'' then
      begin
          formAUTORIZATION.Label3.Caption:='Здравствуйте';
          formAUTORIZATION.Label4.Caption:=_user.surname+' '+_user.name+' '+_user.patronimic ;
          datamodule4.IBTransaction2.Active:=true;
          datamodule4.IBQuery2.Prepare;
          datamodule4.IBQuery2.Open;
          datamodule4.IBTransaction2.Commit;
          formAUTORIZATION.Panel2.Visible:=true;
          form5.DBGridTEST.DataSource.DataSet.Close;
          form5.DBGridTEST.DataSource.DataSet.Open;
         


      end
    else
      showmessage('Проверьте правильность ввода логина/пароля');
//    form5.Visible:=true;
end;

procedure TFormAUTORIZATION.BitBtn2Click(Sender: TObject);
var i:integer;
begin
 _test.id:=strtoint(trim(form5.DBGridTEST.DataSource.DataSet.Fields[0].AsString));
          _test.description:=trim(form5.DBGridTEST.DataSource.DataSet.Fields[1].AsString);
          _test.markA:=strtoint(trim(form5.DBGridTEST.DataSource.DataSet.Fields[2].AsString));
          _test.markB:=strtoint(trim(form5.DBGridTEST.DataSource.DataSet.Fields[3].AsString));
          _test.markC:=strtoint(trim(form5.DBGridTEST.DataSource.DataSet.Fields[4].AsString));
          _test.markD:=strtoint(trim(form5.DBGridTEST.DataSource.DataSet.Fields[5].AsString));
          _test.timelimit:=strtoint(trim(form5.DBGridTEST.DataSource.DataSet.Fields[9].AsString));
          _test.active_questions:=strtoint(trim(form5.DBGridTEST.DataSource.DataSet.fields[7].asString));
   datamodule4.IBTransaction2.Active:=true;
      datamodule4.IBQuery3.ParamByName('id').Value:=trim(form5.DBGridTEST.DataSource.DataSet.Fields[0].AsString);
      datamodule4.IBQuery3.Prepare;
      datamodule4.IBQuery3.Open;

      datamodule4.IBTransaction2.Commit;
      form5.DBgridQUESTION.DataSource.DataSet.Close;
      form5.DBgridQUESTION.DataSource.DataSet.Open;
      form5.DBGridQUESTION.DataSource.DataSet.First;
      for i:=1 to form5.DBGridQUESTION.DataSource.DataSet.RecordCount do
        begin
          _case_questions[i].id:=strtoint(trim(form5.DBGridQUESTION.DataSource.DataSet.Fields[0].asString));
          _case_questions[i].text:=trim(form5.DBGridQUESTION.DataSource.DataSet.Fields[1].asString);
          _case_questions[i].answer1:=(trim(form5.DBGridQUESTION.DataSource.DataSet.Fields[2].asString));
          _case_questions[i].answer2:=(trim(form5.DBGridQUESTION.DataSource.DataSet.Fields[3].asString));
          _case_questions[i].answer3:=(trim(form5.DBGridQUESTION.DataSource.DataSet.Fields[4].asString));
          _case_questions[i].answer4:=(trim(form5.DBGridQUESTION.DataSource.DataSet.Fields[5].asString));
          _case_questions[i].rigth_answer:=trim(form5.DBGridQUESTION.DataSource.DataSet.Fields[6].asString);
          _case_questions[i].score:=form5.DBGridQUESTION.DataSource.DataSet.fields[8].AsInteger;
          _case_questions[i].image := TBitmap.Create;
          _case_questions[i].type_question:=strtoint(trim(form5.DBGridQUESTION.DataSource.DataSet.Fields[9].asString));
          _case_questions[i].image.Assign(TBLOBField(datamodule4.IBTable1.DataSource.DataSet.Fields[10]));
          form5.DBGridQUESTION.DataSource.DataSet.Next;

        end;
Unit1.nowtest := TTesting.Create;
Unit1.nowtest.NewTesting;
Unit1.nowtest.ShowQuestion(1);
      form1.Visible:=true;
      formAUTORIZATION.Hide;


end;

procedure TFormAUTORIZATION.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

form6.Close;
end;

procedure TFormAUTORIZATION.BitBtn4Click(Sender: TObject);
begin
formAUTORIZATION.Close;
end;

procedure TFormAUTORIZATION.BitBtn3Click(Sender: TObject);
begin
formAUTORIZATION.Close;
end;

end.
