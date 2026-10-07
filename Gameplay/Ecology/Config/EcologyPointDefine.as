

// NOTE: class defaults are not authored in this module: FEcologyPointUnitConfig (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FEcologyPointData
{
    UPROPERTY()
    FGameplayTag DomainTag;
    UPROPERTY()
    TMap<FGameplayTag, FVirtualConfigData> CapabilityInfo;

    FEcologyPointData()
    {
        return;
    }
}

struct FEcologyPointUnitConfig : FEcologyUnitConfig
{
    FEcologyUnitConfig _base_FEcologyUnitConfig;
    UPROPERTY()
    FEcologyPointData ConfigData;

    FEcologyPointUnitConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
    bool Activate_Implementation(const FLevelUnitExecuteContext &inout Context)
    {
        int local_12 = 0;
        FECSEntity local_4 = FECSEntity(Context.UnitInstanceEntity);
        local_12.DomainTag = this.ConfigData.DomainTag;
        local_4.InitTransform(this.Transform.GetLocation(), this.Transform.GetRotation());
        Assign local_30;
        local_30.opCall(FC_LevelUnitReadyTag());
        FC_EcologyVoxelUnit local_62;
        local_62.AABBExtent = FVector::OneVector;
        local_62.Slot = EEcologyVoxelUnitSlot(3);
        FC_WaitingUpdateToVoxelSceneTag local_70;
        Assign local_68;
        local_68.opCall(local_70);
        if (this.bInitialInactive)
        {
            local_4.SetActive(false, FFPTime(-1));
        }
        return true;
    }
    void Deactivate_Implementation(const FLevelUnitExecuteContext &inout Context)
    {
        return;
    }
}

struct FEcologyPointQuery
{
    UPROPERTY()
    FBoxSphereBounds Bounds;
    UPROPERTY()
    FConfigGUID OwnerGroup;
    UPROPERTY()
    FKLGameplayTagQuery DomainTagQuery;

    FEcologyPointQuery()
    {
        return;
    }
}

struct FEcologyPointQueryResult
{
    UPROPERTY()
    TSet<FECSEntityId> ActivatePoint;

    FEcologyPointQueryResult()
    {
        return;
    }
}

