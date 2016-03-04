
{*********************************************************}
{                                                         }
{                    XML Data Binding                     }
{                                                         }
{         Generated on: 19.02.2016 7:31:16                }
{       Generated from: C:\Projects\PolMan\Settings.xml   }
{                                                         }
{*********************************************************}

unit Settings;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLSettingsType = interface;
  IXMLConnectionsType = interface;
  IXMLConnectionType = interface;

{ IXMLSettingsType }

  IXMLSettingsType = interface(IXMLNode)
    ['{D26577C1-2E2B-4136-B5B5-AA6808F3F043}']
    { Property Accessors }
    function Get_WindowsAuthentication: Boolean;
    function Get_Login: WideString;
    function Get_Password: WideString;
    function Get_AutoLogin: Boolean;
    function Get_Connections: IXMLConnectionsType;
    procedure Set_WindowsAuthentication(Value: Boolean);
    procedure Set_Login(Value: WideString);
    procedure Set_Password(Value: WideString);
    procedure Set_AutoLogin(Value: Boolean);
    { Methods & Properties }
    property WindowsAuthentication: Boolean read Get_WindowsAuthentication write Set_WindowsAuthentication;
    property Login: WideString read Get_Login write Set_Login;
    property Password: WideString read Get_Password write Set_Password;
    property AutoLogin: Boolean read Get_AutoLogin write Set_AutoLogin;
    property Connections: IXMLConnectionsType read Get_Connections;
  end;

{ IXMLConnectionsType }

  IXMLConnectionsType = interface(IXMLNodeCollection)
    ['{861D9917-625E-456F-B106-B1AF36046443}']
    { Property Accessors }
    function Get_DefaultConnection: Integer;
    function Get_Connection(Index: Integer): IXMLConnectionType;
    procedure Set_DefaultConnection(Value: Integer);
    { Methods & Properties }
    function Add: IXMLConnectionType;
    function Insert(const Index: Integer): IXMLConnectionType;
    property DefaultConnection: Integer read Get_DefaultConnection write Set_DefaultConnection;
    property Connection[Index: Integer]: IXMLConnectionType read Get_Connection; default;
  end;

{ IXMLConnectionType }

  IXMLConnectionType = interface(IXMLNode)
    ['{1C70AB73-DC3E-49AE-AA25-42B74D2FC0DB}']
    { Property Accessors }
    function Get_Server: WideString;
    function Get_Database: WideString;
    function Get_Name: WideString;
    function Get_Icon: WideString;
    procedure Set_Server(Value: WideString);
    procedure Set_Database(Value: WideString);
    procedure Set_Name(Value: WideString);
    procedure Set_Icon(Value: WideString);
    { Methods & Properties }
    property Server: WideString read Get_Server write Set_Server;
    property Database: WideString read Get_Database write Set_Database;
    property Name: WideString read Get_Name write Set_Name;
    property Icon: WideString read Get_Icon write Set_Icon;
  end;

{ Forward Decls }

  TXMLSettingsType = class;
  TXMLConnectionsType = class;
  TXMLConnectionType = class;

{ TXMLSettingsType }

  TXMLSettingsType = class(TXMLNode, IXMLSettingsType)
  protected
    { IXMLSettingsType }
    function Get_WindowsAuthentication: Boolean;
    function Get_Login: WideString;
    function Get_Password: WideString;
    function Get_AutoLogin: Boolean;
    function Get_Connections: IXMLConnectionsType;
    procedure Set_WindowsAuthentication(Value: Boolean);
    procedure Set_Login(Value: WideString);
    procedure Set_Password(Value: WideString);
    procedure Set_AutoLogin(Value: Boolean);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLConnectionsType }

  TXMLConnectionsType = class(TXMLNodeCollection, IXMLConnectionsType)
  protected
    { IXMLConnectionsType }
    function Get_DefaultConnection: Integer;
    function Get_Connection(Index: Integer): IXMLConnectionType;
    procedure Set_DefaultConnection(Value: Integer);
    function Add: IXMLConnectionType;
    function Insert(const Index: Integer): IXMLConnectionType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLConnectionType }

  TXMLConnectionType = class(TXMLNode, IXMLConnectionType)
  protected
    { IXMLConnectionType }
    function Get_Server: WideString;
    function Get_Database: WideString;
    function Get_Name: WideString;
    function Get_Icon: WideString;
    procedure Set_Server(Value: WideString);
    procedure Set_Database(Value: WideString);
    procedure Set_Name(Value: WideString);
    procedure Set_Icon(Value: WideString);
  end;

{ Global Functions }

function GetSettings(Doc: IXMLDocument): IXMLSettingsType;
function LoadSettings(const FileName: WideString): IXMLSettingsType;
function NewSettings: IXMLSettingsType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetSettings(Doc: IXMLDocument): IXMLSettingsType;
begin
  Result := Doc.GetDocBinding('Settings', TXMLSettingsType, TargetNamespace) as IXMLSettingsType;
end;

function LoadSettings(const FileName: WideString): IXMLSettingsType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Settings', TXMLSettingsType, TargetNamespace) as IXMLSettingsType;
end;

function NewSettings: IXMLSettingsType;
begin
  Result := NewXMLDocument.GetDocBinding('Settings', TXMLSettingsType, TargetNamespace) as IXMLSettingsType;
end;

{ TXMLSettingsType }

procedure TXMLSettingsType.AfterConstruction;
begin
  RegisterChildNode('Connections', TXMLConnectionsType);
  inherited;
end;

function TXMLSettingsType.Get_WindowsAuthentication: Boolean;
begin
  Result := AttributeNodes['WindowsAuthentication'].NodeValue;
end;

procedure TXMLSettingsType.Set_WindowsAuthentication(Value: Boolean);
begin
  SetAttribute('WindowsAuthentication', Value);
end;

function TXMLSettingsType.Get_Login: WideString;
begin
  Result := AttributeNodes['Login'].Text;
end;

procedure TXMLSettingsType.Set_Login(Value: WideString);
begin
  SetAttribute('Login', Value);
end;

function TXMLSettingsType.Get_Password: WideString;
begin
  Result := AttributeNodes['Password'].Text;
end;

procedure TXMLSettingsType.Set_Password(Value: WideString);
begin
  SetAttribute('Password', Value);
end;

function TXMLSettingsType.Get_AutoLogin: Boolean;
begin
  Result := AttributeNodes['AutoLogin'].NodeValue;
end;

procedure TXMLSettingsType.Set_AutoLogin(Value: Boolean);
begin
  SetAttribute('AutoLogin', Value);
end;

function TXMLSettingsType.Get_Connections: IXMLConnectionsType;
begin
  Result := ChildNodes['Connections'] as IXMLConnectionsType;
end;

{ TXMLConnectionsType }

procedure TXMLConnectionsType.AfterConstruction;
begin
  RegisterChildNode('Connection', TXMLConnectionType);
  ItemTag := 'Connection';
  ItemInterface := IXMLConnectionType;
  inherited;
end;

function TXMLConnectionsType.Get_DefaultConnection: Integer;
begin
  Result := AttributeNodes['DefaultConnection'].NodeValue;
end;

procedure TXMLConnectionsType.Set_DefaultConnection(Value: Integer);
begin
  SetAttribute('DefaultConnection', Value);
end;

function TXMLConnectionsType.Get_Connection(Index: Integer): IXMLConnectionType;
begin
  Result := List[Index] as IXMLConnectionType;
end;

function TXMLConnectionsType.Add: IXMLConnectionType;
begin
  Result := AddItem(-1) as IXMLConnectionType;
end;

function TXMLConnectionsType.Insert(const Index: Integer): IXMLConnectionType;
begin
  Result := AddItem(Index) as IXMLConnectionType;
end;

{ TXMLConnectionType }

function TXMLConnectionType.Get_Server: WideString;
begin
  Result := ChildNodes['Server'].Text;
end;

procedure TXMLConnectionType.Set_Server(Value: WideString);
begin
  ChildNodes['Server'].NodeValue := Value;
end;

function TXMLConnectionType.Get_Database: WideString;
begin
  Result := ChildNodes['Database'].Text;
end;

procedure TXMLConnectionType.Set_Database(Value: WideString);
begin
  ChildNodes['Database'].NodeValue := Value;
end;

function TXMLConnectionType.Get_Name: WideString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLConnectionType.Set_Name(Value: WideString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

function TXMLConnectionType.Get_Icon: WideString;
begin
  Result := ChildNodes['Icon'].Text;
end;

procedure TXMLConnectionType.Set_Icon(Value: WideString);
begin
  ChildNodes['Icon'].NodeValue := Value;
end;

end. 