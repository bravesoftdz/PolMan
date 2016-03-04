{=======================================================================================================================
  ListBoxesFrame Unit

  Raize Components - Demo Program Source Unit

  Copyright © 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RC3Demo.inc}

unit ListBoxesFrame;

interface

uses
  Forms,
  RzLstBox,
  RzChkLst,
  ExtCtrls,
  RzPanel,
  Controls,
  StdCtrls,
  Classes,
  Windows, RzLabel, ComCtrls;
  
type
  TFmeListBoxes = class(TFrame)
    GrpListBox: TRzGroupBox;
    GrpTRzTabbedListBox: TRzGroupBox;
    LstTitles: TRzListBox;
    LstTimes: TRzTabbedListBox;
    GrpTRzCheckList: TRzGroupBox;
    LstVersions: TRzCheckList;
    GrpTRzEditListBox: TRzGroupBox;
    LstEditTitles: TRzEditListBox;
    RzPanel1: TRzPanel;
    HdrTimes: THeader;
    PnlTitle: TRzPanel;
    procedure HdrTimesSized(Sender: TObject; ASection, AWidth: Integer);
    procedure LstEditTitlesSizeEditRect( Sender: TObject; Index: Integer; var EditRect: TRect );
  private
    { Private declarations }
  public
    procedure Init;
  end;


implementation

{$R *.dfm}


procedure TFmeListBoxes.Init;
begin
  {$IFDEF VCL70_OR_HIGHER}
  ParentBackground := False;
  {$ENDIF}
end;


procedure TFmeListBoxes.HdrTimesSized(Sender: TObject; ASection, AWidth: Integer);
begin
  LstTimes.UpdateFromHeader( HdrTimes );
end;


procedure TFmeListBoxes.LstEditTitlesSizeEditRect(Sender: TObject; Index: Integer; var EditRect: TRect);
begin
  InflateRect( EditRect, 2, 2 );
end;

end.
