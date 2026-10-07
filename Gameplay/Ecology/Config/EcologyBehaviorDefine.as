

class UEcologyBehaviorDefine : UEcologyBehaviorBase
{
    UPROPERTY()
    FName BehaviorName;
    UPROPERTY()
    bool bIsDefaultBehavior;
    UPROPERTY()
    FName LegacyBehaviorName;
    UPROPERTY()
    bool bIsLoopBehavior;
    UPROPERTY()
    float32 LoopDuration;
    UPROPERTY()
    float32 LoopRand;
    UPROPERTY()
    bool bHasBehaviorTreeAsset;
    UPROPERTY()
    TSoftObjectPtr<UBehaviorTree> BehaviorTreeAsset;

    UEcologyBehaviorDefine()
    {
        super();
        return;
    }
}

class UCommonChangeAreaTriggerDefinitionAsset : UEcologyDataAssetBase
{
    UPROPERTY()
    bool bTriggerOnce = false;
    UPROPERTY()
    FString Description;
    UPROPERTY()
    TArray<FCommonChangeAreaCondition> TempConditionOrList;
    UPROPERTY()
    TSoftObjectPtr<UResourceRequestFilterConfigAsset> ChangeAreaRequestFilter;
    UPROPERTY()
    FGameplayTag ReasonTag;
    UPROPERTY()
    int Priority = 0;
    UPROPERTY()
    bool bForceUpdateTargetResource = false;
    UPROPERTY()
    float32 TriggerCD = 20.0f;
    UPROPERTY()
    bool bUseNearestCombatRegionPolicy = false;
    UPROPERTY()
    float32 CombatRegionPolicyRadiusLayer1 = 25000.0f;
    UPROPERTY()
    float32 CombatRegionPolicyRadiusLayer2 = 50000.0f;
    UPROPERTY()
    bool bNeedChangeAreaMessage = true;
    UPROPERTY()
    FChangeAreaMessageInfo MessageInfo;


    bool IsConditionalTrue(const FChangeAreaTaskConditionContext &inout Context)
    {
        for (auto& local_16 : this.TempConditionOrList)
        {
            if (local_16.IsTrue(Context))
            {
                return true;
            }
        }
        return false;
    }
}

class UCommonChangeAreaTriggerDefinitionCollectionAsset : UEcologyDataAssetBase
{
    UPROPERTY()
    TArray<TSoftObjectPtr<UCommonChangeAreaTriggerDefinitionAsset>> CommonChangeAreaEventDefinitions;

    UCommonChangeAreaTriggerDefinitionCollectionAsset()
    {
        return;
    }
}

