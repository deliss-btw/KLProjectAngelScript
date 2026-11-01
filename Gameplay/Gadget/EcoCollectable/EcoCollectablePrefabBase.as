class AEcoCollectablePrefabBase : AEcoCollectablePrefabNativeBase
{
    UPROPERTY()
    FT_EcoCollectableConfig EcoCollectableConfigTrait;
    UPROPERTY()
    FT_InteractTrait InteractTrait;
    UPROPERTY()
    FT_Collision CollisionTrait;
    UPROPERTY()
    FT_VisualComponentToggle VisualComponentToggleTrait;
    UPROPERTY()
    FEcoCollectableLayoutInfo LayoutInfo;

    AEcoCollectablePrefabBase()
    {
        return;
    }
    UFUNCTION()
    void PostPrefabLoad_Implementation(const FECSEntity &inout Entity) const
    {
        if (this.LayoutInfo.CheckForErrorsRuntime(Entity).IsEmpty())
        {
            FC_EcoCollectablePendingInitSpawnerInfoTag local_84;
            Assign local_82;
            local_82.opCall(local_84);
        }
        if (ECS::GetRuntimeInfo().IsServer)
        {
            FC_EcoCollectableLayoutInfoPendingCheckErrorServerTag local_90;
            Assign local_88;
            local_88.opCall(local_90);
            return;
        }
        FC_EcoCollectableLayoutInfoPendingCheckErrorClientTag local_96;
        Assign local_94;
        local_94.opCall(local_96);
        return;
    }
    UFUNCTION()
    bool ShouldLoadPrefabByPolicy_Implementation(const FEcologyLoadPolicy &inout EcologyLoadPolicy) const
    {
        return ::EcologyLoadPolicyUtils::IsCollectableShouldLoad(EcologyLoadPolicy);
    }
}

struct FLevelUnitConfigEcoCollectable : FSceneUnitConfigWithJsonData
{
    FSceneUnitConfigWithJsonData _base_FSceneUnitConfigWithJsonData;
    UPROPERTY()
    FEcoCollectableLayoutInfo LayoutInfo;

    FLevelUnitConfigEcoCollectable()
    {
        this.__InitDefaults();
        return;
    }
    void SetupByActor(const AEcoCollectablePrefabBase Actor)
    {
        this.GUID = Actor.GetConfigGUID();
        this.UnitId = Actor.GetUnitId();
        this.Transform = Actor.GetActorTransform();
        this.bInitialInactive = (Actor.bInitialInactive != 0);
        this.bAutoLoad = (Actor.IsAutoLoad() != 0);
        Actor.SerializeLevelUnitJsonData(this.JsonData);
        return;
    }
    void PostCreateEntity_Implementation(const FECSEntity &inout Entity) const
    {
        if (this.LayoutInfo.CheckForErrorsRuntime(Entity).IsEmpty())
        {
            FC_EcoCollectablePendingInitSpawnerInfoTag local_84;
            Assign local_82;
            local_82.opCall(local_84);
        }
        if (ECS::GetRuntimeInfo().IsServer)
        {
            FC_EcoCollectableLayoutInfoPendingCheckErrorServerTag local_90;
            Assign local_88;
            local_88.opCall(local_90);
            return;
        }
        FC_EcoCollectableLayoutInfoPendingCheckErrorClientTag local_96;
        Assign local_94;
        local_94.opCall(local_96);
        return;
    }
}

