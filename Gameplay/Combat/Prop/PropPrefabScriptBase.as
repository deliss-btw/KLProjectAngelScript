

// NOTE: class defaults are not authored in this module: APropPrefabScriptBase (default scalar field AECSPrefab.NetRelevancePolicyType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FNormalPropLayoutInfo
{
    UPROPERTY()
    TSoftObjectPtr<AECSRegionVolume> WeatherVolume;

    FNormalPropLayoutInfo()
    {
        return;
    }
}

class APropPrefabScriptBase : APropPrefabBase
{
    UPROPERTY()
    FOnEntityReady OnEntityReady;
    UPROPERTY()
    FOnEntityDie OnEntityDie;
    UPROPERTY()
    FOnEntityPendingDestroy OnEntityPendingDestroy;
    UPROPERTY()
    FT_ESM ESMTrait;
    UPROPERTY()
    FT_DynamicPropComp DynamicPropCompTrait;
    UPROPERTY()
    FT_PrefabConfig PrefabConfigTrait;
    UPROPERTY()
    FT_GameplayTags GameplayTagsTrait;
    UPROPERTY()
    FT_Prop_Existence PropExistenceTrait;
    UPROPERTY()
    FT_Prop_LifeAndDeath PropLifeAndDeathTrait;
    UPROPERTY()
    FT_Prop_Ability PropAbilityTrait;
    UPROPERTY()
    FT_Prop_Presentation PropPresentationTrait;
    UPROPERTY()
    FT_Collision CollisionTrait;
    UPROPERTY()
    FT_VisualComponentToggle VisualComponentToggleTrait;
    UPROPERTY()
    FT_Animation AnimationTrait;
    UPROPERTY()
    FT_Prop_Movement PropMovementTrait;
    UPROPERTY()
    FT_InteractTrait InteractTrait;
    UPROPERTY()
    FT_BlockInteractionConfig BlockInteractionTrait;
    UPROPERTY()
    FT_StaticSockets StaticSocketsTrait;
    UPROPERTY()
    FT_DropItemSpawner DropItemSpawnerTrait;
    UPROPERTY()
    FT_SpawnMonster SpawnMonsterTrait;
    UPROPERTY()
    FT_TreasureBoxDropItemSpawner TreasureBoxDropItemSpawnerTrait;
    UPROPERTY()
    FT_BeHitPresentation BeHitPresentationTrait;
    UPROPERTY()
    FT_Hittable HittableTrait;
    UPROPERTY()
    FT_Lockable LockableTrait;
    UPROPERTY()
    FT_MiniHPBarConfig FT_MiniHPBarConfigTrait;
    UPROPERTY()
    FT_GameAttribute GameAttributeTrait;
    UPROPERTY()
    FT_PropEnvBreakableConfig PropEnvBreakableConfigTrait;
    UPROPERTY()
    FT_Faction FactionTrait;
    UPROPERTY()
    FT_HUDIndicator HUDIndicatorTrait;
    UPROPERTY()
    FT_Turret TurretTrait;
    UPROPERTY()
    FT_AutoTrackTurret AutoTrackTurretTrait;
    UPROPERTY()
    FT_EntityBlackboard EntityBlackboardTrait;
    UPROPERTY()
    FT_EventToESMTriggerFilterConfig EventToESMTriggerFilterConfigTrait;
    UPROPERTY()
    FT_CameraAffector CameraAffectorTrait;
    UPROPERTY()
    FT_Cook CookConfigTrait;
    UPROPERTY()
    FT_PropAddBuffToPlayer PropAddBuffToPlayerTrait;
    UPROPERTY()
    FT_Teleporter TeleporterTrait;
    UPROPERTY()
    FT_EntitySpawnInit SpawnInitTrait;
    UPROPERTY()
    TDataObjectPtr<FPropDisplayConfig> DisplayConfig;
    UPROPERTY()
    bool bHasLayoutInfo;
    UPROPERTY()
    FEcologyPropLayoutInfo LayoutInfo;
    UPROPERTY()
    bool bHasNormalPropLayoutInfo;
    UPROPERTY()
    FNormalPropLayoutInfo NormalPropLayoutInfo;

    APropPrefabScriptBase()
    {
        this.bHasLayoutInfo = false;
        this.bHasNormalPropLayoutInfo = false;
        this.ESMTrait.bTraitEnable = false;
        this.DynamicPropCompTrait.bTraitEnable = false;
        this.GameplayTagsTrait.bTraitEnable = false;
        this.CollisionTrait.bTraitEnable = false;
        this.VisualComponentToggleTrait.bTraitEnable = false;
        this.AnimationTrait.bTraitEnable = false;
        this.StaticSocketsTrait.bTraitEnable = false;
        this.GameAttributeTrait.bTraitEnable = false;
        this.EntityBlackboardTrait.bTraitEnable = false;
        return;
    }
    UFUNCTION()
    void PostPrefabLoad_Implementation(const FECSEntity &inout Entity) const
    {
        if (this.bHasLayoutInfo)
        {
            FC_EcologyPropPendingInitSpawnerInfoTag local_56;
            Assign local_54;
            local_54.opCall(local_56);
            FC_EcologyPropPendingInitActivationStateTag local_62;
            Assign local_60;
            local_60.opCall(local_62);
            return;
        }
        if (this.bHasNormalPropLayoutInfo)
        {
        }
        return;
    }
    UFUNCTION()
    bool ShouldLoadPrefabByPolicy_Implementation(const FEcologyLoadPolicy &inout EcologyLoadPolicy) const
    {
        return true;
    }
    void ResetEcologyPropLayoutInfo()
    {
        return;
    }
}

struct FLevelUnitConfigPropBase : FSceneUnitConfigWithJsonData
{
    FSceneUnitConfigWithJsonData _base_FSceneUnitConfigWithJsonData;
    UPROPERTY()
    bool bHasLayoutInfo;
    UPROPERTY()
    FEcologyPropLayoutInfo LayoutInfo;
    UPROPERTY()
    bool bHasNormalPropLayoutInfo;
    UPROPERTY()
    FNormalPropLayoutInfo NormalPropLayoutInfo;

    FLevelUnitConfigPropBase()
    {
        this.bHasLayoutInfo = false;
        this.bHasNormalPropLayoutInfo = false;
        this.__InitDefaults();
        return;
    }
    void SetupByActor(const APropPrefabScriptBase Actor)
    {
        this.GUID = Actor.GetConfigGUID();
        int local_1 = Actor.GetUnitId();
        this.Transform = Actor.GetActorTransform();
        this.bInitialInactive = (Actor.bInitialInactive != 0);
        this.bAutoLoad = (Actor.IsAutoLoad() != 0);
        Actor.SerializeLevelUnitJsonData(this.JsonData);
        this.bHasLayoutInfo = Actor.bHasLayoutInfo;
        this.bHasNormalPropLayoutInfo = Actor.bHasNormalPropLayoutInfo;
        return;
    }
    void PostCreateEntity_Implementation(const FECSEntity &inout Entity) const
    {
        if (this.bHasLayoutInfo)
        {
            FC_EcologyPropPendingInitSpawnerInfoTag local_56;
            Assign local_54;
            local_54.opCall(local_56);
            FC_EcologyPropPendingInitActivationStateTag local_62;
            Assign local_60;
            local_60.opCall(local_62);
            return;
        }
        if (this.bHasNormalPropLayoutInfo)
        {
        }
        return;
    }
}

event void FOnEntityReady(const FECSEntity &inout Entity);

event void FOnEntityDie(const FECSEntity &inout Entity);

event void FOnEntityPendingDestroy(const FECSEntity &inout Entity);

