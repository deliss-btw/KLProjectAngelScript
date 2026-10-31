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
    bFromPool = false;
    bFromPool = false;
    EEntityType local_4 = EEntityType(0);
    FECSEntity local_14 = FEntityPoolUtils::TryPopEntityFromPool(EEntityPoolType(PoolType), Owner, local_4, Prefab);
    if (local_14.IsValid())
    {
        bFromPool = true;
        return local_14;
    }
    if (int(ECS::GetRuntimeInfo().IsServer) != 0)
    {
        if (Prefab != nullptr)
        {
            local_14 = ECS::RequestEntityByPrefabDeferred(TSubclassOf<AECSPrefab>(Prefab.GetClass()), FVector::ZeroVector, FRotator::ZeroRotator, EPrefabCollisionAlignment(2), EECSRegType(0), false);
        }
        else
        {
            local_14 = Owner.GetWorld().Create(EEntityType(local_4), n"PooledEntity");
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
