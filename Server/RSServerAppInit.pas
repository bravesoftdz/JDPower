unit RSServerAppInit;

interface

uses
  System.Classes,
  System.SysUtils,
  Vcl.SvcMgr,
  Vcl.Forms,
  uRemoteShutdownServerMain,
  uRemoteShutdownServerTest;

procedure RunApp;

implementation

procedure RunApp;
var
  T: Boolean;
begin
  T:= FindCmdLineSwitch('test');

  if T then begin
    //Test application
    Vcl.Forms.Application.Initialize;
    Vcl.Forms.Application.CreateForm(TJDRemoteShutdownSvrTest, JDRemoteShutdownSvrTest);
    Vcl.Forms.Application.Run;
  end else begin
    //Service application
    if not Vcl.SvcMgr.Application.DelayInitialize or Vcl.SvcMgr.Application.Installing then
      Vcl.SvcMgr.Application.Initialize;
    Vcl.SvcMgr.Application.CreateForm(TJDRemoteShutdownSvr, JDRemoteShutdownSvr);
    Vcl.SvcMgr.Application.Run;
  end;

end;

end.