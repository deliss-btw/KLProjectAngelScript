
namespace EcologyStatsUtils
{
FName GetCreatureRowName(const FC_CreatureMeta &inout CreatureMeta)
{
    if (CreatureMeta.CreatureType.IsSet())
    {
        FName local_3;
        local_3.GetDataName();
        return local_3;
    }
    return n"Unknown";
}
void StatsCreatureSpawned(const FECSEntity &inout CreatureEntity)
{
    int local_8 = 0;
    int local_26 = 0;
    int local_38 = 0;
    int local_46 = 0;
    if (!(CreatureEntity.IsValid()))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    if (!(FECSEntity(local_8.RuntimeSpawnerEntity)))
    {
        return;
    }
    Has local_20;
    if (!(local_20.opCall()))
    {
        return;
    }
    FName local_30 = EcologyStatsUtils::GetCreatureRowName(local_8);
    FECSEntityId local_31 = FECSEntityId(ENTITY_ID_NULL);
    if (local_38)
    {
        local_31 = local_38.FlockProxyEntity;
    }
    FECSWorldPtr local_40 = ECS::GetECSWorld();
    local_26.RecordSpawn(CreatureEntity.GetId(), local_30, local_31, local_46.Time);
    return;
}
void StatsCreatureDeath(const FECSEntity &inout DeathEntity)
{
    int local_8 = 0;
    int local_26 = 0;
    int local_34 = 0;
    if (!(DeathEntity.IsValid()))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    if (!(FECSEntity(local_8.RuntimeSpawnerEntity)))
    {
        return;
    }
    Has local_20;
    if (!(local_20.opCall()))
    {
        return;
    }
    FECSWorldPtr local_28 = ECS::GetECSWorld();
    local_26.RecordDeath(DeathEntity.GetId(), local_34.Time);
    return;
}
}
