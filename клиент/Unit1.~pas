unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DateUtils;

type
  TForm1 = class(TForm)
    GroupBoxSingle: TGroupBox;
    Panel1: TPanel;
    singleTEXT: TLabel;
    Image1: TImage;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBoxMultiply: TGroupBox;
    MutlyTEXT: TLabel;
    Image2: TImage;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBoxEnter: TGroupBox;
    EnterTEXT: TLabel;
    Image3: TImage;
    EnterANSWER: TLabeledEdit;
    statusLabel: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
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
testing = record
  start_time:string;
  end_time:string;
  result:integer;
  mark:integer;
  mode:integer;
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

TTesting = class
  active_question: integer;
  lost_questions:integer;
  ready_questions:integer;
  question_case: array[0..100] of question;
  sel_test:test;
  sel_student:student;
  act_testing:testing;
  constructor NewTesting;
  procedure CreateReport;
  procedure NextQuestion(question_pos:integer; user_answer:string);
  procedure ShowQuestion(question_pos:integer);
  end;
var
  Form1: TForm1;
  NowTest:TTesting;
  i:integer;
implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}
constructor TTEsting.NewTesting;
var i:integer;
begin
  // TTesting.Create;
  // присваиваем начальное время тестирования и запускаем таймер
  act_testing.start_time := DateTostr(Date) + ' ' +  TimeToStr(Time);
 lost_questions:= form5.DBGridQUESTION.DataSource.DataSet.RecordCount;
  ready_questions:=0;
 // Заполнение информации о пользователе
  sel_student.id :=unit2._user.id;
  sel_student.surname:=unit2._user.surname;
  sel_student.name:=unit2._user.name;
  sel_student.patronimic:=unit2._user.patronimic;
  // Заполнение информации о тесте
  sel_test.id:=unit2._test.id;
  sel_test.description:=unit2._test.description;
  sel_test.markA:=unit2._test.markA;
  sel_test.markB:=unit2._test.markB;
  sel_test.markC:=unit2._test.markC;
  sel_test.markD:=unit2._test.markD;
  sel_test.timelimit:=unit2._test.timelimit;
  sel_test.active_questions:=unit2._test.active_questions;
   // Заполнение информации о вопросах
   for i:=1 to lost_questions do
    begin
        question_case[i].id:=unit2._case_questions[i].id;
        question_case[i].text:=unit2._case_questions[i].text;
        question_case[i].answer1:=unit2._case_questions[i].answer1;
        question_case[i].answer2:=unit2._case_questions[i].answer2;
        question_case[i].answer3:=unit2._case_questions[i].answer3;
        question_case[i].answer4:=unit2._case_questions[i].answer4;
        question_case[i].rigth_answer:=unit2._case_questions[i].rigth_answer;
        question_case[i].score:=unit2._case_questions[i].score;
        question_case[i].type_question:=unit2._case_questions[i].type_question;
        question_case[i].image:=unit2._case_questions[i].image;
    end;
    active_question:=1;

   form1.Caption:='Тестирование '+sel_test.description;
end;






procedure TTesting.CreateReport;
var Memoreport:TMemo;
  total_score:integer;
begin
//здесь нужно записать время завершения теста
act_testing.end_time:= DateTostr(Date) + ' ' +  TimeToStr(Time);
total_score:=0;
for i:=1 to sel_test.active_questions do
  begin
      if question_case[i].rigth_answer = question_case[i].user_answer then
        begin
        act_testing.result:=act_testing.result+question_case[i].score;

        end;
        total_score:=total_score+question_case[i].score;
  end;
if ((act_testing.result*100 div total_score) >= sel_test.markA) then
  act_testing.mark:=5 else
  if ((act_testing.result*100 div total_score) >= sel_test.markB) then
      act_testing.mark:=4 else
      if ((act_testing.result*100 div total_score) >= sel_test.markC) then
          act_testing.mark:=3 else
          if ((act_testing.result*100 div total_score) >= sel_test.markD) then
              act_testing.mark:=2 else
                  act_testing.mark:=1;

with formRESULTS.MemoRESULT do
  begin
  Clear;
  lines.Add('РЕЗУЛЬТАТЫ ПРОХОЖДЕНИЯ ТЕСТИРОВАНИЯ');
  lines.Add('Студент: '+sel_student.surname+' ' + sel_student.name+ ' ' + sel_student.patronimic);
  lines.Add('Тест: '+sel_test.description);
  lines.Add('Время начала тестирования: '+act_testing.start_time);
  lines.Add('Время завершения тестирования: '+act_testing.end_time);
  lines.Add('Набрано баллов '+inttostr(act_testing.result)+'     из возможных '+inttostr(total_score));
  lines.Add('По итогам тестирования студентом получена оценка: '+inttostr(act_testing.mark));
  lines.Add(' ');
  lines.Add('ОТВЕТЫ ТЕСТИРУЕМОГО');
  for i:=1 to sel_test.active_questions do
    begin
        lines.Add('Вопрос: '+question_case[i].text);
        lines.Add('Варианты ответов: 1)'+question_case[i].answer1+'   2)'+question_case[i].answer2+'   3)'+question_case[i].answer3+'   4)'+question_case[i].answer4);
        lines.Add('Верный ответ: '+question_case[i].rigth_answer);
        lines.Add('Ответ студента: '+question_case[i].user_answer);
        if question_case[i].user_answer = question_case[i].rigth_answer then
          lines.Add('Получено баллов: '+inttostr(question_case[i].score))
        else
          lines.Add('Получено баллов: 0');
        lines.Add(' ');
    end;
  // Добавление отчета о результатах тестирования в базу
  datamodule4.IBTransaction2.Active:=true;
              with datamodule4.IBQueryREPORT do
              begin
              // :start_time, :end_time, :result,
              //:mark, :id_test, :id_respondent, :report)
              //  SQL.Clear;
                ParamByName('start_time').Value := act_testing.start_time;
                // ParamByName('start_time').Value := act_testing.start_time;
                ParamByName('end_time').Value := act_testing.end_time;
                //ParamByName('end_time').Value := act_testing.end_time;
                ParamByName('result').Value := act_testing.result;
                ParamByName('mark').Value := act_testing.mark;
                ParamByName('id_test').Value := sel_test.id;
                ParamByName('id_respondent').Value := sel_student.id;
                ParamByName('report').Value := FormResults.MemoRESULT.Text;
                Prepare;
                ExecSQL;
              end;
              datamodule4.IBTransaction2.Commit;


  formRESULTS.ShowModal;
  end;
end;




procedure TTesting.NextQuestion(question_pos:integer; user_answer:string);
begin
active_question:=question_pos;
ready_questions:=ready_questions+1;
lost_questions:=lost_questions-1;
question_case[active_question].user_answer:=user_answer;
active_question:=active_question+1;
if lost_questions < 1 then
  CreateReport
else
  ShowQuestion(active_question);
end;





procedure TTEsting.ShowQuestion(question_pos:integer);
begin
active_question:=question_pos;
case question_case[active_question].type_question of
1:   // single
    begin
      form1.GroupBoxSingle.Visible:=true;
      form1.GroupBoxMultiply.Visible:=false;
      form1.GroupBoxEnter.Visible:=false;
      form1.RadioButton1.Checked:=false;
      form1.RadioButton1.Caption:='';
      form1.RadioButton2.Checked:=false;
      form1.RadioButton2.Caption:='';
      form1.RadioButton3.Checked:=false;
      form1.RadioButton3.Caption:='';
      form1.RadioButton4.Checked:=false;
      form1.RadioButton4.Caption:='';
      form1.singleTEXT.Caption:='';
      form1.singleTEXT.Caption:= question_case[active_question].text;
      form1.RadioButton1.Caption:=question_case[active_question].answer1;
      form1.RadioButton2.Caption:=question_case[active_question].answer2;
      form1.RadioButton3.Caption:=question_case[active_question].answer3;
      form1.RadioButton4.Caption:=question_case[active_question].answer4;
      form1.Image1.Picture.Bitmap:=question_case[active_question].image;
      if question_case[active_question].user_answer = '1' then
        form1.RadioButton1.Checked:=true;
      if question_case[active_question].user_answer = '2' then
        form1.RadioButton2.Checked:=true;
      if question_case[active_question].user_answer = '3' then
        form1.RadioButton3.Checked:=true;
      if question_case[active_question].user_answer = '4' then
        form1.RadioButton4.Checked:=true;
    end;
2: // multy
    begin
      form1.GroupBoxSingle.Visible:=false;
      form1.GroupBoxMultiply.Visible:=true;
      form1.GroupBoxEnter.Visible:=false;
      form1.CheckBox1.Checked:=false;
      form1.CheckBox2.Checked:=false;
      form1.CheckBox3.Checked:=false;
      form1.CheckBox4.Checked:=false;

      form1.MutlyTEXT.Caption:=question_case[active_question].text;
      form1.CheckBox1.Caption:=question_case[active_question].answer1;
      form1.CheckBox2.Caption:=question_case[active_question].answer2;
      form1.CheckBox3.Caption:=question_case[active_question].answer3;
      form1.CheckBox4.Caption:=question_case[active_question].answer4;
          form1.Image2.Picture.Bitmap:=question_case[active_question].image;
      for i:=0 to length(question_case[active_question].user_answer) -1 do
        begin
            if question_case[active_question].user_answer[i] = '1' then
              form1.CheckBox1.Checked:=true;
             if question_case[active_question].user_answer[i] = '2' then
              form1.CheckBox2.Checked:=true;
               if question_case[active_question].user_answer[i] = '3' then
              form1.CheckBox3.Checked:=true;
               if question_case[active_question].user_answer[i] = '4' then
              form1.CheckBox4.Checked:=true;
        end;
    end;
3: // open
    begin
      form1.GroupBoxSingle.Visible:=false;
      form1.GroupBoxMultiply.Visible:=false;
      form1.GroupBoxEnter.Visible:=true;
      form1.EnterANSWER.Text:='';
      form1.EnterANSWER.Text:=question_case[active_question].user_answer;
      form1.EnterTEXT.Caption:=question_case[active_question].text;
          form1.Image3.Picture.Bitmap:=question_case[active_question].image;
    end;
end;
form1.statusLabel.Caption:='Осталось вопросов: '+inttostr(lost_questions)+'   Пройдено вопросов: '+ inttostr(ready_questions);
end;



procedure TForm1.BitBtn1Click(Sender: TObject);
var
  _answer:string;
begin
  _answer:='';
  if form1.GroupBoxSingle.Visible = true then
    begin
        if form1.RadioButton1.Checked then
          _answer:='1';
        if form1.RadioButton2.Checked then
          _answer:='2';
        if form1.RadioButton3.Checked then
          _answer:='3';
        if form1.RadioButton4.Checked then
          _answer:='4';
    end;
  if form1.GroupBoxMultiply.Visible = true then
    begin
       if form1.CheckBox1.Checked then
          _answer:=_answer+'1';
       if form1.CheckBox2.Checked then
          _answer:=_answer+'2';
       if form1.CheckBox3.Checked then
          _answer:=_answer+'3';
       if form1.CheckBox4.Checked then
          _answer:=_answer+'4';
    end;
  if form1.GroupBoxEnter.Visible = true then
    begin
        _answer := form1.EnterANSWER.Text;
    end;

  NowTest.NextQuestion(NowTest.active_question, _answer);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FormAUTORIZATION.Visible:=true;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
nowTest.lost_questions := nowTest.lost_questions + 1;
nowTest.ready_questions := nowTest.ready_questions - 1;
nowTest.ShowQuestion(nowTest.active_question-1);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
nowtest.CreateReport;
end;

end.
