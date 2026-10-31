class UConditionPlayerEnterRegion : ULocalConditionTypeDefineBase
{
    UConditionPlayerEnterRegion()
    {
        super();
        return;
    }
    void OnConditionRegistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        int local_12 = 0;
        if (!(FECSEntity(ConditionInstance.GetInstanceData().GetContextEntity()).IsValid()))
        {
            return;
        }
        FConditionInstanceHandle local_38 = ConditionInstance.GetHandle();
        TDataObjectPtr<FConditionConfigBase> local_88 = local_38.GetConditionConfig();
        FEnterRegionInfo& local_116 = local_12.EnterRegionInfos.FindOrAdd(local_38.GetLocalConditionInstanceID());
        CastTo local_120;
        this.GetRegionConfig(local_120.opCall().Get(), local_116);
        return;
    }
    void OnConditionUnregistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        int local_72 = 0;
        int local_54 = ConditionInstance.GetHandle().GetLocalConditionInstanceID();
        Has local_64;
        if (!(FECSEntity(ConditionInstance.GetInstanceData().GetContextEntity()).IsValid()) || !(local_64.opCall()))
        {
            return;
        }
        local_72.EnterRegionInfos.Remove(local_54);
        if (local_72.EnterRegionInfos.Num() == 0)
        {
            Remove local_78;
            local_78.opCall();
        }
        return;
    }
    void ValidateConditionConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FString> &inout OutErrorMessages) const
    {
        return;
    }
    void GetRegionConfig(const FLocalConditionConfig &inout ConditionConfig, FEnterRegionInfo &inout RegionCfg) const
    {
        FConditionPlayerEnterRegionConfig local_6;
        RegionCfg.LevelInfo = local_6.LevelInfo;
        RegionCfg.Center = local_6.RegionCenter;
        RegionCfg.Radius = local_6.RegionRadius;
        return;
    }
}

struct FConditionPlayerEnterRegionConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> LevelInfo;
    UPROPERTY()
    FVector RegionCenter;
    UPROPERTY()
    float32 RegionRadius;

    default _base_FLocalConditionTypeDefineConfigBase = UConditionPlayerEnterRegion;

    FConditionPlayerEnterRegionConfig()
    {
        this.RegionRadius = 0.0f;
        this.__InitDefaults();
        return;
    }
}

