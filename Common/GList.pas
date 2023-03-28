unit GList;

interface

uses
  Classes, Windows;

type
  TGList = class(TList)
  private
    FLock: TRTLCriticalSection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Lock;
    procedure UnLock;
  end;

  TGStringList = class(TStringList)
  private
    FLock: TRTLCriticalSection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Lock;
    procedure UnLock;
  end;

implementation

constructor TGList.Create;
begin
  inherited;
  InitializeCriticalSection(FLock);
end;

destructor TGList.Destroy;
begin
  DeleteCriticalSection(FLock);
  inherited;
end;

procedure TGList.Lock;
begin
  EnterCriticalSection(FLock);
end;

procedure TGList.UnLock;
begin
  LeaveCriticalSection(FLock);
end;

constructor TGStringList.Create;
begin
  inherited;
  InitializeCriticalSection(FLock);
end;

destructor TGStringList.Destroy;
begin
  DeleteCriticalSection(FLock);
  inherited;
end;

procedure TGStringList.Lock;
begin
  EnterCriticalSection(FLock);
end;

procedure TGStringList.UnLock;
begin
  LeaveCriticalSection(FLock);
end;

end.

