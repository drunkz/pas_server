unit TimeUtil;

interface

uses
  System.SysUtils;

type
  TTimeCallBack = record
  end;

  PTTimeCallBack = ^TTimeCallBack;

procedure GetNow(var Year, Month, Day, Hour, Min, Sec, MSec: Word);

/// <remarks> 注册时间变更触发函数 </remarks>
procedure RegisterTimeProc(timeCallBack: TTimeCallBack);

implementation

procedure GetNow(var Year, Month, Day, Hour, Min, Sec, MSec: Word);
begin
  var nowTime := Now;
  DecodeDate(nowTime, Year, Month, Day);
  DecodeTime(nowTime, Hour, Min, Sec, MSec);
end;

procedure RegisterTimeProc(timeCallBack: TTimeCallBack);
begin

end;

end.

