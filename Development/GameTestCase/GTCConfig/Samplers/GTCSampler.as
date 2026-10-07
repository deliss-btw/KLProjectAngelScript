

struct FGTCSampleResult
{
    UPROPERTY()
    int ActionID;
    UPROPERTY()
    bool bIsValid = true;


}

struct FGTCRecordTimeStamp
{
    UPROPERTY()
    int64 TimeTicks;
    UPROPERTY()
    int FixedFrame;
    UPROPERTY()
    int LocalFrame;


}

struct FGTCSampleRecord
{
    UPROPERTY()
    FGTCRecordTimeStamp TimeStamp;

    FGTCSampleRecord()
    {
        return;
    }
}

struct FGTCSampler : FGTCAction
{
    FGTCAction _base_FGTCAction;
    UPROPERTY()
    bool bNeedValidation;


    FGTCRecordTimeStamp GetCurTimeStamp(const FGTCActionContext &inout Context)
    {
        FGTCRecordTimeStamp local_4;
        local_4.TimeTicks = FDateTime::Now().GetTicks();
        local_4.FixedFrame = int(Context.CurFrame);
        local_4.LocalFrame = int(Context.LocalTime.Frame);
        return local_4;
    }
}

