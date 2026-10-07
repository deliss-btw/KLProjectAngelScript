
enum EConstSpawnerResourceMode
{
    None,
    InternalCreate,
    External,
}


// NOTE: class defaults are not authored in this module: FConstFlockSpawnerConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

struct FConstSpawnCreatureEntry
{
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> MonsterConfig;
    UPROPERTY()
    FVector LocationOffset;
    UPROPERTY()
    FRotator RotationOverride;
    UPROPERTY()
    FGameplayTag SpawnTag;
    UPROPERTY()
    FName SpawnInitEntryName;

    FConstSpawnCreatureEntry()
    {
        return;
    }
}

struct FConstFlockSpawnerConfig : FSpawnerConfig
{
    FSpawnerConfig _base_FSpawnerConfig;
    UPROPERTY()
    bool SpawnOnStart;
    UPROPERTY()
    TArray<FConstSpawnCreatureEntry> CreatureList;
    UPROPERTY()
    TSoftObjectPtr<UBaseEcologyPlanerDefine> PlanerDefine;
    UPROPERTY()
    EConstSpawnerResourceMode ResourceMode;
    UPROPERTY()
    TDataObjectPtr<FEcologyResourceDefinitionRow> InternalResourceType;
    UPROPERTY()
    FLevelUnitReference ExternalResourceUnitId;

    FConstFlockSpawnerConfig()
    {
        super();
        this.SpawnOnStart = true;
        this.ResourceMode = EConstSpawnerResourceMode(0);
        this.__InitDefaults();
        return;
    }
    FECSEntity GenerateRuntimeEntity_Implementation(const FEcologyConfigGenerateContext &inout Context) const
    {
        int local_24 = 0;
        int local_84 = 0;
        int local_106 = 0;
        FECSEntity local_10 = ECS::GetECSWorld().Create(EECSRegType(2), EEntityType(10), n"ConstFlockSpawner");
        FC_EcologyRuntimeSpanwerTag local_30;
        Assign local_28;
        local_28.opCall(local_30);
        FC_EcologySpawnerStats local_66;
        Assign local_34;
        local_34.opCall(local_66);
        const FTransform& local_68 = Context.GetDefaultedTransform();
        local_10.InitTransform(local_68.GetLocation(), local_68.GetRotation());
        local_84.ConfigRef = Context.OuterEntity.GetId();
        local_84.ConfigType = FConstFlockSpawnerConfig;
        local_106.LevelUnitEntity = Context.OuterEntity.GetId();
        ::FConstFlockSpawnerUtils::InitConstFlockSpawner(local_10, local_24);
        return local_10;
    }
}

namespace FConstFlockSpawnerUtils
{
FECSEntity ResolveExternalResourceByUnitId(const FLevelUnitReference &inout TargetUnitId)
{
    int local_8 = 0;
    int local_26 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (FECSEntity(local_8.FindUnitEntityByGUID(TargetUnitId.GUID)))
    {
        if (local_26)
        {
            return FECSEntity(local_26.ChildEntity);
        }
    }
    return FECSEntity();
}
void InitConstFlockSpawner(const FECSEntity &inout SpawnerEntity, FC_EcologyRuntimeConstFlockSpawner &inout SpawnerComp)
{
    int local_6 = 0;
    int local_126 = 0;
    if (!(local_6))
    {
        return;
    }
    if (!(local_6.ReadSpawnerConfig()))
    {
        return;
    }
    bool local_7 = !(FInstancedStruct::GetPtr(GetConfigData()).opCall());
    if (local_7)
    {
        return;
    }
    FConstFlockSpawnerConfig local_70;
    if (int(local_70.ResourceMode) != 1)
    {
        local_7 = false;
    }
    else
    {
        local_7 = local_70.InternalResourceType;
    }
    if (local_7)
    {
        FSingleResourceConfig local_196;
        local_196.ResourceType = local_70.InternalResourceType;
        SpawnerComp.InternalResourceEntity = FEcologyResourceUtils::SpawnDynamicResource(SpawnerEntity, local_196, local_126.GetPosition(), local_126.GetRotation().Euler(), ECS::GetECSWorld().GetFixedTime().Time, -1.0f).GetId();
    }
    else
    {
        if (int(local_70.ResourceMode) == 2 && local_70.ExternalResourceUnitId.IsValid())
        {
            SpawnerComp.PendingExternalResourceUnitId = local_70.ExternalResourceUnitId;
        }
    }
    if (local_70.SpawnOnStart)
    {
        FC_EcologyForceRefreshSpawnerTag local_246;
        Assign local_244;
        local_244.opCall(local_246);
    }
    return;
}
void RefreshConstSpawnerCreatures(const FECSEntity &inout SpawnerEntity, FC_EcologyRuntimeConstFlockSpawner &inout SpawnerComp)
{
    int local_6 = 0;
    int local_126 = 0;
    UBaseEcologyPlanerDefine local_168;
    if (!(local_6))
    {
        return;
    }
    if (!(local_6.ReadSpawnerConfig()))
    {
        return;
    }
    if (!(FInstancedStruct::GetPtr(GetConfigData()).opCall()))
    {
        return;
    }
    FConstFlockSpawnerConfig local_70;
    FECSEntity local_130 = FECSEntity(SpawnerComp.FlockEntity);
    if (local_130.IsValid())
    {
        FC_EcologySchedulerUnit local_140;
        FEcologyBehaviorUtils::FlockClaimNewResource(local_130, ENTITY_NULL, false);
        if (local_140)
        {
            FECSWorldPtr local_142 = ECS::GetECSWorld();
            Modify local_146;
            FEcologySchedulerUtils::RemoveEntityFromScheduler(local_130, local_140.CurrentScedulerLevel, local_146.opCall());
        }
        FEcologyLifeCycleUtils::MarkEntityWaitDestroy(local_130, ECS::GetContextTime());
        SpawnerComp.FlockEntity = ENTITY_ID_NULL;
    }
    FECSEntity local_154;
    if ((!((SpawnerComp.InternalResourceEntity == ENTITY_ID_NULL))))
    {
        local_154 = FECSEntity(SpawnerComp.InternalResourceEntity);
    }
    else
    {
        if (SpawnerComp.PendingExternalResourceUnitId.IsValid())
        {
            local_154 = FConstFlockSpawnerUtils::ResolveExternalResourceByUnitId(SpawnerComp.PendingExternalResourceUnitId);
        }
    }
    TSoftObjectPtr<UBaseEcologyPlanerDefine> local_166 = local_70.PlanerDefine;
    if (!((local_168 != nullptr)) && (local_70.CreatureList.Num() > 0))
    {
        TSoftObjectPtr<UBaseEcologyPlanerDefine> local_198;
        if (local_198.GetCreatureType())
        {
            UBaseEcologyPlanerDefine local_248;
            local_166 = local_248;
        }
    }
    FEcologyFlockSpawnParam local_296;
    local_296.bSkipChangeAreaTrigger = true;
    local_296.bSkipDelayActivation = true;
    local_296.SpawnNum = 0;
    local_296.DefaultPosition = local_126.GetPosition();
    int local_169 = local_70.CreatureList.Num();
    if (local_169 > 0)
    {
    }
    local_296.PlanerDefine = local_166;
    if (local_154.IsValid())
    {
        local_296.SpawnFEcologyFlockActivityTarget.MainTargetResource = local_154.GetId();
    }
    FRuntimeSpawnerReference local_298;
    local_298.SpawnerEntity = SpawnerEntity.GetId();
    TArray<TSoftObjectPtr<AECSRegionVolume>> local_302;
    FECSEntity local_134 = FEcologySpawnerUtils::SpawnEcologyFlockEntity(local_296, local_298, local_302);
    SpawnerComp.FlockEntity = local_134.GetId();
    FC_NeedCheckResourceTag local_312;
    Assign local_310;
    local_310.opCall(local_312);
    int local_313 = 0;
    while (local_313 < local_169)
    {
        FConstSpawnCreatureEntry& local_316 = local_70.CreatureList[local_313];
        FEcologyCreatureSpawnerContext local_376;
        local_376.SpawnerConfigRef = local_6.ConfigRef;
        local_376.RuntimeSpawnerEntity = SpawnerEntity.GetId();
        local_376.FlockEntity = local_134.GetId();
        local_376.TargetLocation = (FVector(local_126.GetPosition()) + local_126.GetRotation().RotateVector(local_316.LocationOffset));
        local_376.TargetRotation = local_316.RotationOverride.Quaternion();
        local_376.AdditionalSpawnTag = local_316.SpawnTag;
        local_376.SpawnInitEntryName = local_316.SpawnInitEntryName;
        FEcologySpawnerUtils::SpawnCreatureByContext(local_376);
        ++local_313;
        local_169 = local_70.CreatureList.Num();
    }
    return;
}
void CleanUpConstFlockSpawner(const FECSEntity &inout SpawnerEntity, const FC_EcologyRuntimeConstFlockSpawner &inout SpawnerData)
{
    if ((!((SpawnerData.FlockEntity == ENTITY_ID_NULL))))
    {
        FC_EcologySchedulerUnit local_16;
        FECSEntity local_6 = FECSEntity(SpawnerData.FlockEntity);
        if (local_16)
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            Modify local_22;
            FEcologySchedulerUtils::RemoveEntityFromScheduler(local_6, local_16.CurrentScedulerLevel, local_22.opCall());
        }
        FEcologyLifeCycleUtils::KillFlockEntity(local_6);
    }
    if ((!((SpawnerData.InternalResourceEntity == ENTITY_ID_NULL))))
    {
        FEcologyLifeCycleUtils::MarkEntityWaitDestroy(FECSEntity(SpawnerData.InternalResourceEntity), ECS::GetContextTime());
    }
    return;
}
}
