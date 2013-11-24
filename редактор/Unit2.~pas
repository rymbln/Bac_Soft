unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBTable, StdCtrls, Buttons,
  ExtCtrls;

type
  TFormStudents = class(TFrame)
    LabeledEditSURNAME: TLabeledEdit;
    LabeledEditNAME: TLabeledEdit;
    LabeledEditSecNAME: TLabeledEdit;
    LabeledEditLOGIN: TLabeledEdit;
    LabeledEditPASS: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Unit6, Unit4, Unit1;

{$R *.dfm}

procedure TFormStudents.BitBtn1Click(Sender: TObject);
begin
if formGROUP.Caption = 'Редактирование группы' then
  begin
    if (formGROUP.LabeledEdit1.Text <>'') then
      begin
              datamodule6.IBTransaction2.Active:=true;
              datamodule6.IBQueryAddGroup.SQL.Clear;
              datamodule6.IBQueryAddGroup.SQL.Add('update GROUPS set GROUP_DESCRIPTION = :description where ID_GROUP = :id');
              datamodule6.IBQueryAddGroup.ParamByName('description').Value := TrimRight(formGROUP.LabeledEdit1.Text);
              datamodule6.IBQueryAddGroup.ParamByName('id').Value := form1.DBGrid2.DataSource.DataSet.Fields[0].AsInteger;
              datamodule6.IBQueryAddGroup.Prepare;
              datamodule6.IBQueryAddGroup.ExecSQL;
              datamodule6.IBTransaction2.Commit;
              datamodule6.IBDataSetGROUP.Close;
              datamodule6.IBDataSetGROUP.Open;
      end
    else
      showmessage('Введите название новой группы!');
  end
else
  if formGROUP.Caption = 'Добавление группы' then
    begin
       if formGROUP.LabeledEdit1.Text<>'' then
          begin
            datamodule6.IBTransaction2.Active:=true;
            datamodule6.IBQueryAddGroup.SQL.Clear;
            datamodule6.IBQueryAddGroup.SQL.Add('insert into GROUPS (GROUP_DESCRIPTION) values (:group_name)');
            datamodule6.IBQueryAddGroup.ParamByName('group_name').Value := TrimRight(formGROUP.LabeledEdit1.Text);
            datamodule6.IBQueryAddGroup.Prepare;
            datamodule6.IBQueryAddGroup.ExecSQL;
            datamodule6.IBTransaction2.Commit;
            datamodule6.IBDataSetGROUP.Close;
            datamodule6.IBDataSetGROUP.Open;
          end
        else
          showmessage('Введите название новой группы!');
     end;
end;

end.
