
namespace FEntityPoolUtils
{
FECSEntity TryPopEntityFromPool(const EEntityPoolType PoolType, const FECSEntity &inout Owner, EEntityType &inout OutEntityType, const AECSPrefab Prefab = nullptr)
{
    int local_16 = 0;
    OutEntityType = EEntityType(0);
    Get local_6;
    const FC_EntityPoolOwner& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.GetPoolSourceEntity().IsValid())
        {
            FECSEntityPool& local_20 = local_16.Pools[int(PoolType)];
            OutEntityType = EEntityType(local_20.EntityType);
            return local_20.PopActive(Owner, Prefab);
        }
    }
    return ENTITY_NULL;
}
FECSEntity PopFromPoolOrSpawnEntity(bool &out bFromPool, const EEntityPoolType PoolType, const FECSEntity &inout Owner, const AECSPrefab Prefab = nullptr)
{
    FECSEntity local_10;
    bFromPool = false;
    bFromPool = false;
    int local_5 = 0;
    int local_4 = local_5;
    FECSEntity local_14 = FEntityPoolUtils::TryPopEntityFromPool(EEntityPoolType(PoolType), Owner, EEntityType(local_4), Prefab);
    if (local_14.IsValid())
    {
        bFromPool = true;
        return local_14;
    }
    if (ECS::GetRuntimeInfo().IsServer)
    {
        if (Prefab != nullptr)
        {
            local_10 = ECS::RequestEntityByPrefabDeferred(TSubclassOf<AECSPrefab>(Prefab.GetClass()), FVector::ZeroVector, FRotator::ZeroRotator, EPrefabCollisionAlignment(2), EECSRegType(0), false);
            local_14 = local_10;
        }
        else
        {
            FECSWorldPtr local_22 = Owner.GetWorld();
            local_14 = local_10;
        }
        Assign local_28;
        local_28.opCall(FC_LocalTag());
        FC_Owner local_35 = FC_Owner();
        Assign local_34;
        local_34.opCall(local_35).SetOwnerEntity(Owner);
        return local_14;
    }
    return ENTITY_NULL;
}
}
