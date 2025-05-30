unit UDataBaseConfig;

interface

uses
  FireDAC.Comp.Client, FireDAC.DApt, SysUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,

  FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, Datasnap.Provider,
  FireDAC.Comp.DataSet;

type
  TDataBaseConfig = class

  public
    procedure ApplyToConnection(AConnection: TFDConnection;
      FDPhysPgDriverLink1: TFDPhysPgDriverLink);
  end;

implementation

procedure TDataBaseConfig.ApplyToConnection(AConnection: TFDConnection;
  FDPhysPgDriverLink1: TFDPhysPgDriverLink);
var
  LibCaminho: string;
begin

  // Volta uma pasta e acessa a pasta lib
  LibCaminho := ExtractFilePath(ParamStr(0)) + 'lib\libpq.dll';

  // Configura o driver para PostgreSQL
  FDPhysPgDriverLink1.DriverID := 'PG';

  FDPhysPgDriverLink1.VendorLib := LibCaminho;

  // Configura a conex�o
  AConnection.DriverName := 'PG';
  AConnection.Params.Values['Database'] := 'financas';
  AConnection.Params.Values['User_Name'] := 'postgres';
  AConnection.Params.Values['Password'] := '123456';
  AConnection.Params.Values['Server'] := 'localhost';
  AConnection.Params.Values['Port'] := '5433';
  AConnection.LoginPrompt := False;

  // Estabelece a conex�o
  AConnection.Connected := True;

end;

end.
