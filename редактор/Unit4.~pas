unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  Mask, DBCtrls;

type
  TFormGROUP = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGROUP: TFormGROUP;



implementation

uses Unit6, Unit1;

{$R *.dfm}

procedure TFormGROUP.FormShow(Sender: TObject);
begin
if formGROUP.Caption = '–едактирование группы' then
formGROUP.LabeledEdit1.Text:= TrimRight(form1.DBGrid2.DataSource.DataSet.Fields[1].asString)
else
  formGROUP.LabeledEdit1.Text:='';
end;

procedure TFormGROUP.BitBtn1Click(Sender: TObject);
begin
if formGROUP.Caption = '–едактирование группы' then
begin
  if formGROUP.LabeledEdit1.Text<>'' then
  begin
              datamodule6.IBTransaction2.Active:=true;
              datamodule6.IBQueryAddGroup.SQL.Clear;
              datamodule6.IBQueryAddGroup.SQL.Add('update GROUPS set GROUP_DESCRIPTION = :description where ID_GROUP = :id');
              datamodule6.IBQueryAddGroup.ParamByName('description').Value := Trim(formGROUP.LabeledEdit1.Text);
              datamodule6.IBQueryAddGroup.ParamByName('id').Value := form1.DBGrid2.DataSource.DataSet.Fields[0].AsInteger;
              datamodule6.IBQueryAddGroup.Prepare;
              datamodule6.IBQueryAddGroup.ExecSQL;
              datamodule6.IBTransaction2.Commit;
              datamodule6.IBDataSetGROUP.Close;
              datamodule6.IBDataSetGROUP.Open;
    end
  else
    showmessage('¬ведите название новой группы!');
end
else
begin
 if formGROUP.LabeledEdit1.Text<>'' then
  begin
    datamodule6.IBTransaction2.Active:=true;
    datamodule6.IBQueryAddGroup.SQL.Clear;
    datamodule6.IBQueryAddGroup.SQL.Add('insert into GROUPS (GROUP_DESCRIPTION) values (:group_name)');
    datamodule6.IBQueryAddGroup.ParamByName('group_name').Value := Trim(formGROUP.LabeledEdit1.Text);
    datamodule6.IBQueryAddGroup.Prepare;
    datamodule6.IBQueryAddGroup.ExecSQL;
    datamodule6.IBTransaction2.Commit;
    datamodule6.IBDataSetGROUP.Close;
    datamodule6.IBDataSetGROUP.Open;
  end
else
  showmessage('¬ведите название новой группы!');
  end;
end;

procedure TFormGROUP.BitBtn2Click(Sender: TObject);
begin
FormGROUP.Close;
end;

end.
