unit LogUtil;

interface

uses
  Vcl.StdCtrls, System.Classes, FileCtrl, System.SysUtils, GList;

type
  TLogMgr = class(TThread)
  private
    /// <remarks> 日志信息列表 </remarks>
    m_LogList: TGStringList;
    /// <remarks> 是否写到文件 </remarks>
    m_boToFile: Boolean;
    m_FileStream: TStream;
    m_Memo: TMemo;
    /// <remarks> 获取将要写入的日志文件名 </remarks>
    function getLogFileName(): string;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
    procedure AddLog(Str: string);
    function Init(memo: TMemo; boToFile: Boolean): Boolean;
  end;

var
  g_LogMgr: TLogMgr;

implementation

uses
  TimeUtil;

const
  LOG_DIR = 'log';

constructor TLogMgr.Create(CreateSuspended: Boolean);
begin
  inherited;
  m_LogList := TGStringList.Create;
end;

destructor TLogMgr.Destroy;
begin
  m_LogList.Free;
  inherited;
end;

function TLogMgr.Init(memo: TMemo; boToFile: Boolean): Boolean;
begin
  Result := True;
  m_Memo := memo;
  m_boToFile := boToFile;
  if not m_boToFile then
    Exit;
  if not DirectoryExists(LOG_DIR) then begin
    Result := CreateDir(LOG_DIR);
  end;
  if not Result then
    Exit;
  var sLogFileName := getLogFileName();
  if FileExists(sLogFileName) then
    m_FileStream := TFileStream.Create(sLogFileName, fmOpenWrite or fmShareDenyWrite)
  else
    m_FileStream := TFileStream.Create(sLogFileName, fmCreate or fmShareDenyWrite);
  m_FileStream.Seek(0, soEnd);
  // 每小时变更文件名
end;

function TLogMgr.getLogFileName(): string;
begin
  var Year, Month, Day, Hour, Min, Sec, MSec: Word;
  GetNow(Year, Month, Day, Hour, Min, Sec, MSec);
  Result := Format('%s/%u-%u-%u.%u.txt', [LOG_DIR, Year, Month, Day, Hour]);
end;

procedure TLogMgr.AddLog(str: string);
begin
  m_LogList.Lock;
  m_LogList.Add(Format('%s %s', [DateTimeToStr(Now), str]));
  m_LogList.UnLock;
end;

procedure TLogMgr.Execute;
begin
  while not Terminated do begin
    m_LogList.Lock;
    if m_LogList.Count > 0 then begin
      if m_Memo <> nil then begin
        m_Memo.Lines.AddStrings(m_LogList);
      end;
      if m_boToFile then
        m_LogList.SaveToStream(m_FileStream);
      m_LogList.Clear;
    end;
    m_LogList.UnLock;
    Sleep(30);
  end;
end;

initialization
  g_LogMgr := TLogMgr.Create(True);
  g_LogMgr.Start;


finalization
  g_LogMgr.Free;

end.

