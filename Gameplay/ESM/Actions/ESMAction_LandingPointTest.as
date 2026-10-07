

struct FLandingPointTestActionInstanceData
{
    UPROPERTY()
    float32 ExitActionZ = 0.0f;
    UPROPERTY()
    bool bHasLandingPoint = false;


}

class UESMAction_LandingPointTest : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FVector TraceDir;
    UPROPERTY()
    float32 TraceDistance = 20000.0f;
    UPROPERTY()
    float32 StartActionDistance = 400.0f;
    UPROPERTY()
    FVector TargetOffset;
    UPROPERTY()
    float32 TraceOffsetMinDistance = 200.0f;
    UPROPERTY()
    float32 TraceOffsetExtendDistance = 400.0f;
    UPROPERTY()
    FVector LandPlaneNormal;
    UPROPERTY()
    float32 LandPlaneNormalDegree = 30.0f;
    UPROPERTY()
    FNameHandle_EntityBBVarVector LandingPointName;
    UPROPERTY()
    FNameHandle_ESMBBTrigger FailedTrigger;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ExitActionTrigger;
    UPROPERTY()
    ECollisionChannel TraceChannel = ECollisionChannel(18);
    UPROPERTY()
    float32 Tolerance = 2.0f;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FLandingPointTestActionInstanceData);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FLandingPointTestActionInstanceData& local_2;
        int local_10 = 0;
        if (local_2.bHasLandingPoint == false)
        {
            return;
        }
        if (!(local_10))
        {
            return;
        }
        if (local_10.GetPosition().Z < local_2.ExitActionZ)
        {
            FESMTriggerUtils::ActivateTrigger(Context.GetEntity(), Context.GetBlackboard().GetTriggerStorage(), this.ExitActionTrigger.Name, Context.Time.WorldTime, FFPTime(0.1), 0);
        }
        return;
    }
    FLandingPointTestActionInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FLandingPointTestActionInstanceData __r;
        return __r;
    }
    FLandingPointTestActionInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FLandingPointTestActionInstanceData __r;
        return __r;
    }
}

