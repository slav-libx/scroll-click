unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Edit, FMX.DateTimeCtrls, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Layouts, Form.Base;

type
  TForm1 = class(TBaseForm)
    VertScrollBox1: TVertScrollBox;
    Button1: TButton;
    Button2: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Switch1: TSwitch;
    DateEdit1: TDateEdit;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Button3: TButton;
    Button4: TButton;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ClearEditButton1: TClearEditButton;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ControlledScrollBox:=VertScrollBox1;
end;

end.
