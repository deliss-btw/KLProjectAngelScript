

// NOTE: class defaults are not authored in this module: AEcoCollectableSpawner (default scalar field AECSPrefab.NetRelevancePolicyType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class AEcoCollectableSpawner : AEcoCollectableSpawnerBase
{
    UPROPERTY()
    int Priority = 0;
    UPROPERTY()
    TArray<EcoCollectable::FEcoCollectableCreatureAndCountRangeDef> EcoCollectableCreatureAndCountRanges;
    UPROPERTY()
    TArray<EcologyProp::FEcologyPropAndCountRangeDef> EcologyPropAndCountRanges;
    UPROPERTY()
    TSet<TDataObjectPtr<FEcoCollectableCreatureDefinitionRow>> RelatedCreatureDefs;
    UPROPERTY()
    TMap<TDataObjectPtr<FEcoCollectableCreatureDefinitionRow>, FIndicesArray> CreatureDefToIndicesMap;
    UPROPERTY()
    TArray<EcoCollectable::FEcoCollectableBakedData> BakedDataArray;
    UPROPERTY()
    TSet<TDataObjectPtr<FEcologyPropLayoutDef>> RelatedEcologyPropDefs;
    UPROPERTY()
    TMap<TDataObjectPtr<FEcologyPropLayoutDef>, FIndicesArray> EcologyPropDefToIndicesMap;
    UPROPERTY()
    TArray<EcologyProp::FEcologyPropBakedData> BakedDataArrayEcologyProp;
    UPROPERTY()
    FT_EcoCollectableSpawnerRuntime EcoCollectableSpawnerRuntimeTrait;


    UFUNCTION()
    void PostPrefabLoad_Implementation(const FECSEntity &inout Entity) const
    {
        int local_28 = 0;
        Has local_4;
        local_4.opCall();
        AECSPrefab local_14;
        AEcoCollectableSpawner local_8 = (Cast<AEcoCollectableSpawner>(local_14));
        if (local_8 != nullptr)
        {
            local_28.UID = local_8.GetConfigGUID();
            return;
        }
        Get local_32;
        const FC_SyncLevelUnitGUID& local_34 = local_32.opCall();
        if (local_34)
        {
            local_28.UID = local_34.GetGUID();
        }
        return;
    }
}

