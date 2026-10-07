

class UESMAction_EstimateSpeed : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bUseInternalSpeed = false;
    UPROPERTY()
    FFPTime SampleTimeOffset = 0.1;


    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        if (this.bUseInternalSpeed)
        {
            return "дј°з®—йЂџеє¦ InternalVelocity";
        }
        return FString().Append("дј°з®—йЂџеє¦ й‡‡ж ·ж—¶й—ґеЃЏз§»=").Append(this.SampleTimeOffset.ToSeconds()).Append("s");
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (!(this.bUseInternalSpeed) && (this.SampleTimeOffset.opCmp(0.0) <= 0))
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "й‡‡ж ·ж—¶й—ґеЃЏз§»еї…йЎ»е¤§дєЋ0");
        }
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        local_8.SetbUseInternalSpeed(this.bUseInternalSpeed);
        local_8.SetSampleTimeOffset(this.SampleTimeOffset);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Remove local_6;
        local_6.opCall();
        return;
    }
}

