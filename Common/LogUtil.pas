unit LogUtil;

interface

uses
  Vcl.StdCtrls, GList;

type
  TLogTarget = (ltMemo, ltFile);

  /// <remarks> 日志写到位置 </remarks>
  TLogTargets = set of TLogTarget;

  TLogMgr = class
  private
    m_LogTargets: TLogTargets;
    /// <remarks> 日志信息列表 </remarks>
    m_LogList: TGStringList;
    m_Memo: TMemo;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddLog(str: string);
  end;

var
  g_LogMgr: TLogMgr;

implementation

constructor TLogMgr.Create();
begin
  inherited;
end;

destructor TLogMgr.Destroy;
begin
  inherited;
end;

procedure TLogMgr.AddLog(str: string);
begin
  
end;

end.

