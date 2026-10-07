

struct FProtoRecord
{
    UPROPERTY()
    FDateTime TimeStamp;
    UPROPERTY()
    int CmdId;
    UPROPERTY()
    int Direction;
    UPROPERTY()
    int Side;
    UPROPERTY()
    bool bIsBlocked = false;
    UPROPERTY()
    FString ProtoJsonString;


}

class UProtoToolSubsystem : UEngineSubsystem
{
    bool bRecordOpen = true;
    TSet<int> CmdIdShowBlackList;
    TArray<FProtoRecord> ProtoRecordArray;
    bool bBlockOpen = false;
    TSet<int> CmdIdBlockList;


}

