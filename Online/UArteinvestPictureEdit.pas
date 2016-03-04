unit UArteinvestPictureEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, NixButton, StdCtrls, RzLabel, ComCtrls,
  RzDTP, RzEdit, Mask;

type
  TArteInvestPictureEditForm = class(TForm)
    RzPanel1: TRzPanel;
    Title: TRzEdit;
    Year: TRzNumericEdit;
    Width: TRzNumericEdit;
    Height: TRzNumericEdit;
    Price: TRzNumericEdit;
    ReservedBy: TRzNumericEdit;
    BoughtBy: TRzNumericEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    CloseButton: TNixButton;
    SaveButton: TNixButton;
    ReservedUntil: TRzEdit;
    Bought: TRzEdit;
    function DataOK : Boolean;
    procedure SaveButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    PictureID : Integer;
  end;

var
  ArteInvestPictureEditForm: TArteInvestPictureEditForm;

implementation

uses UArteinvestPicture;

{$R *.dfm}

//------------------------------------------------------------------------------

function TArteinvestPictureEditForm.DataOK : Boolean;

begin
  Result := True;
  if (Title.Text = '') then begin Result := False; Exit; end;
  if (Year.Text = '') then begin Result := False; Exit; end;
  if (Width.Text = '') then begin Result := False; Exit; end;
  if (Height.Text = '') then begin Result := False; Exit; end;
  if (Price.Text = '') then begin Result := False; Exit; end;
end;

//------------------------------------------------------------------------------

procedure TArteInvestPictureEditForm.SaveButtonClick(Sender: TObject);

begin
  if DataOK then
  begin
    with ArteinvestPictureForm.tPictures do
    begin
      if Locate('picture_id', PictureID, []) then
      begin
        Edit;
        FieldValues['picture_title'] := Title.Text;
        FieldValues['picture_year'] := Year.Value;
        FieldValues['picture_width'] := Width.Value;
        FieldValues['picture_height'] := Height.Value;
        FieldValues['picture_price'] := Price.Value;
        FieldValues['reserved_until'] := StrToDateTime(ReservedUntil.Text);
        FieldValues['reserved_by'] := ReservedBy.Value;
        FieldValues['bought_at'] := StrToDateTime(ReservedUntil.Text);
        FieldValues['bought_by'] := BoughtBy.Value;
        Post;
      end;
    end;
  end
  else
    MessageDlg('You cannot leave any fields empty except the reservation and buy time!', mtINFORMATION, [mbOK], 0);
end;

//------------------------------------------------------------------------------

procedure TArteInvestPictureEditForm.CloseButtonClick(Sender: TObject);

begin
  ArteInvestPictureEditForm.Close;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
end.
