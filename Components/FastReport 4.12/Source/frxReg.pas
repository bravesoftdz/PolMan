
{******************************************}
{                                          }
{             FastReport v4.0              }
{            Registration unit             }
{                                          }
{         Copyright (c) 1998-2008          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}

unit frxReg;

{$I frx.inc}
//{$I frxReg.inc}

interface


procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
{$IFNDEF Delphi6}
  DsgnIntf,
{$ELSE}
  DesignIntf, DesignEditors,
{$ENDIF}
{$IFDEF Delphi9}
  ToolsAPI,
{$ENDIF}
  Dialogs, frxClass, 
  frxDock, frxCtrls, frxDesgnCtrls,
  frxDesgn, frxPreview, frxRes,
  frxRich, 
  frxOLE, frxBarCode,
  frxChBox, frxDMPExport,
{$IFNDEF FR_VER_BASIC}
  frxDCtrl, 
{$ENDIF}
{$IFNDEF RAD_ED}
  frxCross,
{$ENDIF}
{$IFNDEF WIN64}
 frxRichEdit, 
{$ENDIF}
frxGradient,
  frxGZip, frxEditAliases, 
{$IFNDEF WIN64}
frxCrypt
{$ENDIF};

{-----------------------------------------------------------------------}
type
  TfrxReportEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): String; override;
    function GetVerbCount: Integer; override;
  end;

  TfrxDataSetEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): String; override;
    function GetVerbCount: Integer; override;
  end;


{ TfrxReportEditor }

procedure TfrxReportEditor.ExecuteVerb(Index: Integer);
var
  Report: TfrxReport;
begin
  Report := TfrxReport(Component);
  if Report.Designer <> nil then
    Report.Designer.BringToFront
  else
  begin
    Report.DesignReport(Designer, Self);
    if Report.StoreInDFM then
      Designer.Modified;
  end;
end;

function TfrxReportEditor.GetVerb(Index: Integer): String;
begin
  Result := frxResources.Get('rpEditRep');
end;

function TfrxReportEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;


{ TfrxDataSetEditor }

procedure TfrxDataSetEditor.ExecuteVerb(Index: Integer);
begin
  with TfrxAliasesEditorForm.Create(Application) do
  begin
    DataSet := TfrxCustomDBDataSet(Component);
    if ShowModal = mrOk then
      Self.Designer.Modified;
    Free;
  end;
end;

function TfrxDataSetEditor.GetVerb(Index: Integer): String;
begin
  Result := frxResources.Get('rpEditAlias');
end;

function TfrxDataSetEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;


{-----------------------------------------------------------------------}
procedure Register;
begin
{$IFDEF Delphi9}
   SplashScreenServices.AddPluginBitmap('Fast Report 4',
    LoadBitmap(HInstance, 'SPLASH_ICON'));
{$ENDIF}

{$IFDEF DELPHI16}
//  StartClassGroup(TControl);
//  ActivateClassGroup(TControl);
//  GroupDescendentsWith(TfrxReport, TControl);
//  GroupDescendentsWith(TfrxUserDataSet, TControl);
//  GroupDescendentsWith(TfrxRichObject, TControl);
//  GroupDescendentsWith(TfrxCrypt, TControl);
//  GroupDescendentsWith(TfrxCheckBoxObject, TControl);
//  GroupDescendentsWith(TfrxGradientObject, TControl);
//  GroupDescendentsWith(TfrxGZipCompressor, TControl);
//  GroupDescendentsWith(TfrxDotMatrixExport, TControl);
//  GroupDescendentsWith(TfrxBarCodeObject, TControl);
//  GroupDescendentsWith(TfrxOLEObject, TControl);
  
//  GroupDescendentsWith(TfrxDockSite, TControl);
//  GroupDescendentsWith(TfrxTBPanel, TControl);
//  GroupDescendentsWith(TfrxComboEdit, TControl);
//  GroupDescendentsWith(TfrxComboBox, TControl);
//  GroupDescendentsWith(TfrxFontComboBox, TControl);
//  GroupDescendentsWith(TfrxRuler, TControl);
//  GroupDescendentsWith(TfrxScrollBox, TControl);
{$ENDIF}

  RegisterComponents('FastReport 4.0',
    [TfrxReport, TfrxUserDataset,
{$IFNDEF FR_VER_BASIC}
     TfrxDesigner,
{$ENDIF}
     TfrxPreview,
     TfrxBarcodeObject, TfrxOLEObject, 
{$IFNDEF WIN64}
     TfrxRichObject,
{$ENDIF}
{$IFNDEF RAD_ED}
     TfrxCrossObject,
{$ENDIF}
     TfrxCheckBoxObject, TfrxGradientObject,
     TfrxDotMatrixExport
{$IFNDEF FR_VER_BASIC}
   , TfrxDialogControls
{$ENDIF}     
   , TfrxGZipCompressor
{$IFNDEF WIN64}
, TfrxCrypt
{$ENDIF}
     ]);
  RegisterComponents('FR4 tools',
    [TfrxDockSite, TfrxTBPanel, TfrxComboEdit,
     TfrxComboBox, TfrxFontComboBox, TfrxRuler, TfrxScrollBox]);

  RegisterComponentEditor(TfrxReport, TfrxReportEditor);
  RegisterComponentEditor(TfrxCustomDBDataSet, TfrxDataSetEditor);
end;

{$IFDEF FPC}
initialization
  {$INCLUDE frx_ireg.lrs}
{$ENDIF}

end.



