

// NOTE: class defaults are not authored in this module: FGuideNpcData (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

struct FGuideDataBase
{
    UPROPERTY()
    TSubclassOf<UGuideBehavior> GuideBehavior;
    UPROPERTY()
    TDataObjectPtr<FGuidePresentationConfig> OverridePresentation;

    FGuideDataBase()
    {
        return;
    }
}

struct FGuideNpcData : FGuideDataBase
{
    FGuideDataBase _base_FGuideDataBase;
    UPROPERTY()
    TDataObjectPtr<FNPCMainConfig> TargetNpc;
    UPROPERTY()
    TSoftClassPtr<AKLLevelScriptActor> OwnerLevelGroup;

    FGuideNpcData()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FGuidePrefabData : FGuideDataBase
{
    FGuideDataBase _base_FGuideDataBase;
    UPROPERTY()
    TDataObjectPtr<FBasePrefabConfig> Target;

    FGuidePrefabData()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FGuideRegionData : FGuideDataBase
{
    FGuideDataBase _base_FGuideDataBase;
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    float32 Radius;
    UPROPERTY()
    bool bShowGuideFX;

    FGuideRegionData()
    {
        super();
        this.Radius = 0.0f;
        this.bShowGuideFX = false;
        this.__InitDefaults();
        return;
    }
    bool IsPoint() const
    {
        return FMath::IsNearlyEqual(this.Radius, 0.0, 0.001);
    }
    bool IsInRegion(const FVector &inout InPosition) const
    {
        if (this.IsPoint())
        {
            return false;
        }
        return (this.Position.DistSquared2D(InPosition) <= (this.Radius * this.Radius));
    }
}

struct FGuideMonsterData : FGuideDataBase
{
    FGuideDataBase _base_FGuideDataBase;
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> MonsterConfig;
    UPROPERTY()
    bool bMarkAll;
    UPROPERTY()
    TSoftClassPtr<AKLLevelScriptActor> OwnerLevelGroup;

    FGuideMonsterData()
    {
        super();
        this.bMarkAll = false;
        this.__InitDefaults();
        return;
    }
}

struct FGuideConfig
{
    UPROPERTY()
    TArray<FInstancedStruct> GuideDataList;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> LevelInfo;

    FGuideConfig()
    {
        return;
    }
}

