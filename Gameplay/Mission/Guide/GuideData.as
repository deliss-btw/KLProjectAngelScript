struct FGuideDataBase
{
    UPROPERTY()
    TSubclassOf<UGuideBehavior> GuideBehavior = UGuideBehavior;
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

    default _base_FGuideDataBase = UGuideNpcBehavior;

    FGuideNpcData()
    {
        this.__InitDefaults();
        return;
    }
}

struct FGuidePrefabData : FGuideDataBase
{
    FGuideDataBase _base_FGuideDataBase;
    UPROPERTY()
    TDataObjectPtr<FBasePrefabConfig> Target;

    default _base_FGuideDataBase = UGuidePrefabBehavior;

    FGuidePrefabData()
    {
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

    default _base_FGuideDataBase = UGuideRegionBehavior;

    FGuideRegionData()
    {
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

    default _base_FGuideDataBase = UGuideMonsterBehavior;

    FGuideMonsterData()
    {
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

