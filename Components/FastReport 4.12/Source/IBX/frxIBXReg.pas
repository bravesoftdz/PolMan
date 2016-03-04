
{******************************************}
{                                          }
{             FastReport v4.0              }
{       IBX components registration        }
{                                          }
{         Copyright (c) 1998-2008          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}

unit frxIBXReg;

interface

{$I frx.inc}

procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes, Controls
{$IFNDEF Delphi6}
, DsgnIntf
{$ELSE}
, DesignIntf, DesignEditors
{$ENDIF}
, frxIBXComponents;

procedure Register;
begin
  RegisterComponents('FastReport 4.0', [TfrxIBXComponents]);
{$IFDEF DELPHI16}
//  GroupDescendentsWith(TfrxIBXComponents, TControl);
{$ENDIF}
end;

end.
