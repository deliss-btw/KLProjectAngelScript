

class UESMAction_SteeringRotationSpeedControl : UESMBPBaseSpanAction
{
    UPROPERTY()
    float32 EnterProceduralTargetTime = 0.2f;
    UPROPERTY()
    float32 ExitProceduralTargetTime = 0.2f;


    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("SteeringSpeed: Enter=").Append(FString::ApplyFormat(this.EnterProceduralTargetTime, ".2f")).Append("s, Exit=").Append(FString::ApplyFormat(this.ExitProceduralTargetTime, ".2f")).Append("s");
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.EnterProceduralTargetTime <= 0.0f)
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "EnterProceduralTargetTime еї…йЎ»е¤§дєЋ 0");
        }
        if (this.ExitProceduralTargetTime <= 0.0f)
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "ExitProceduralTargetTime еї…йЎ»е¤§дєЋ 0");
        }
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_CharacterGroundMovementInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetSteeringProceduralTargetTime(this.EnterProceduralTargetTime);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_CharacterGroundMovementInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetSteeringProceduralTargetTime(this.ExitProceduralTargetTime);
        }
        return;
    }
}

