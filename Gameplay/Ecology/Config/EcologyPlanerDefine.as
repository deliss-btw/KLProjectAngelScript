

UCLASS(Abstract)
class UBaseEcologyPlanerDefine : UEcologyDataAssetBase
{
    UPROPERTY()
    EFlockAllocatorType SlotAllocatorType = EFlockAllocatorType(0);
    UPROPERTY()
    bool bLazyAllocateSlot = true;
    UPROPERTY()
    bool bNeedPathConnectedCheckBeforeChangeArea = true;
    UPROPERTY()
    bool bAllowAutoSearchResource = true;
    UPROPERTY()
    bool bAllowNoResourceWanderMove = true;
    UPROPERTY()
    ENoResourcePivotLocationPolicy NoResourceActivityPivotPolicy = ENoResourcePivotLocationPolicy(0);
    UPROPERTY()
    EFlockNoResourceUpdatePolicy NoResourceFlockUpdatePolicy = EFlockNoResourceUpdatePolicy(0);


    UFUNCTION()
    void SetupEcologyPlanerEntity_Implementation(const FECSEntity &inout PlanerEntity, FC_EcologyPlaner &inout EcologyPlaner) const
    {
        return;
    }
    void SetupEcologyPlanerEntity(const FECSEntity &inout PlanerEntity, FC_EcologyPlaner &inout EcologyPlaner) const
    {
        __Evt_PushArgument__FECSEntity(PlanerEntity);
        __Evt_PushArgumentRef(EcologyPlaner);
        __Evt_Execute(this, n"SetupEcologyPlanerEntity");
        return;
    }
}

class UHTNPlanerDefine : UBaseEcologyPlanerDefine
{
    UPROPERTY()
    TSoftObjectPtr<UHTN> HTNAsset;
    UPROPERTY()
    TSoftObjectPtr<UBlackboardData> BlackboardAsset;
    UPROPERTY()
    TMap<FGameplayTag, TSoftObjectPtr<UHTN>> DynamicHTNSet;

    UHTNPlanerDefine()
    {
        super();
        return;
    }
    UFUNCTION()
    void SetupEcologyPlanerEntity_Implementation(const FECSEntity &inout PlanerEntity, FC_EcologyPlaner &inout EcologyPlaner) const
    {
        int local_82 = 0;
        this.SyncLoad();
        if (!(this.HTNAsset.IsValid()) || !(this.BlackboardAsset.IsValid()))
        {
            return;
        }
        EcologyPlaner.FuncType = EEcologyPlanerFuncType(2);
        local_82.DynamicSetup(this.HTNAsset, this.BlackboardAsset, this.DynamicHTNSet);
        FC_HTNNeedRestartTag local_88;
        Assign local_86;
        local_86.opCall(local_88);
        return;
    }
    void SyncLoad() const
    {
        Ecology::SyncLoadObject(this.HTNAsset.ToSoftObjectPath());
        Ecology::SyncLoadObject(this.BlackboardAsset.ToSoftObjectPath());
        return;
    }
}

class UResourceRequestFilterConfigAsset : UEcologyDataAssetBase
{
    UPROPERTY()
    FResourceRequestFilterConfig Filter;

    UResourceRequestFilterConfigAsset()
    {
        return;
    }
}

