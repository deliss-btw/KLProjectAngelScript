

class UEQC_MasterEntity : UEnvQueryContext_ECS_BlueprintBase
{
    UEQC_MasterEntity()
    {
        return;
    }
    UFUNCTION()
    void ProvideSingleEntity_Implementation(const UObject QuerierObject, const FECSEntity &inout QuerierProxy, FECSEntityId &inout ResultingEntity) const
    {
        FNameHandle_EntityBBVarEntity local_6;
        local_6;
        QuerierProxy.GetBB_Entity(local_6).GetId();
        FECSEntityId local_11;
        ResultingEntity = local_11;
        return;
    }
}

