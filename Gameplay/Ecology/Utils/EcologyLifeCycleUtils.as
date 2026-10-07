
namespace FEcologyLifeCycleUtils
{
void RegisterEcologyRuntimeEntity(const FECSEntity &inout ConfigEntity, const FECSEntity &inout RuntimeEntity, const bool bSyncDataLayer = true)
{
    int local_4 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (local_4.EntityConfig2RuntimeMap.Contains(ConfigEntity.GetId()))
    {
        XError(ELog(30), "Some Config Entity Has Exit RuntimeEntity");
    }
    local_4.EntityConfig2RuntimeMap.Add(ConfigEntity.GetId(), RuntimeEntity.GetId());
    if (bSyncDataLayer)
    {
        FEcologyLifeCycleUtils::SyncDataLayerOwner(ConfigEntity, RuntimeEntity);
    }
    return;
}
void SyncDataLayerOwner(const FECSEntity &inout Owner, const FECSEntity &inout TargetEntity)
{
    int local_8 = 0;
    int local_14 = 0;
    if (!(Owner.IsValid()) || !(TargetEntity.IsValid()))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    local_14.DataLayerName = local_8.DataLayerName;
    return;
}
void DestroyEcologyRuntimeEntity(const FECSEntity &inout OuterEntity)
{
    int local_4 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FECSEntityId local_5;
    if (local_4.EntityConfig2RuntimeMap.Find(OuterEntity.GetId(), local_5))
    {
        FECSEntity local_16 = FECSEntity(local_5);
        FEcologyLifeCycleUtils::MarkEntityWaitDestroy(local_16);
    }
    return;
}
void MarkEntityWaitDestroy(const FECSEntity &inout Entity)
{
    FEcologyLifeCycleUtils::MarkEntityWaitDestroy(Entity, ECS::GetECSWorld().GetFixedTime().Time);
    return;
}
void MarkEntityWaitDestroy(const FECSEntity &inout Entity, const FFPTime &inout Time)
{
    if (!(Entity))
    {
        return;
    }
    Assign local_6;
    local_6.opCall(FC_EcologyWaitDestroyTag());
    return;
}
void KillFlockEntity(const FECSEntity &inout RemoveEntity)
{
    FEcologyLifeCycleUtils::MarkEntityWaitDestroy(RemoveEntity);
    return;
}
void ImmediateUnregisterFlockData(const FECSEntity &inout FlockEntity, FC_EcologyFlockComponent &inout EcologyFlockComponent)
{
    int local_16 = 0;
    if (FECSEntity(EcologyFlockComponent.SpawnerDataRef.SpawnerEntity))
    {
        if (local_16 && local_16.SpawnerData.IsValidIndex(EcologyFlockComponent.SpawnerDataRef.SubIndex))
        {
            FECSEntity local_8 = FECSEntity(FlockEntity.GetId());
            local_16.SpawnerData[EcologyFlockComponent.SpawnerDataRef.SubIndex].FlockEntities.RemoveSwap(local_8);
        }
    }
    FEcologyBehaviorUtils::FlockClaimNewResource(FlockEntity, ENTITY_NULL, false);
    return;
}
void KillCreatureEntity(const FECSEntity &inout RemoveEntity)
{
    FEcologyLifeCycleUtils::MarkEntityWaitDestroy(RemoveEntity);
    return;
}
void MarkCreatureReady(const FECSEntity &inout CreatureEntity)
{
    int local_18 = 0;
    FC_SpawnerReadyTracker local_36;
    if (!(CreatureEntity))
    {
        return;
    }
    Has local_6;
    bool local_1 = local_6.opCall();
    if (local_1)
    {
        return;
    }
    FC_CreatureReadyTag local_12;
    Assign local_10;
    local_10.opCall(local_12);
    if (!(local_18))
    {
        return;
    }
    FECSEntity local_22 = FECSEntity(local_18.RuntimeSpawnerEntity);
    if (!(local_22))
    {
        return;
    }
    FEcologySpawnerUtils::NotifyNewMonsterReady(local_22, CreatureEntity);
    Has local_30;
    if (!(local_30.opCall()))
    {
        return;
    }
    if (!(local_36.bSpawnComplete))
    {
        return;
    }
    --local_36.PendingReadyCount;
    if (int(local_36.PendingReadyCount) <= 0)
    {
        FEcologySpawnerUtils::MarkAndNotirySpawnerReady(local_22, local_36);
    }
    return;
}
}
