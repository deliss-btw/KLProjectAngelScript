

class UEQC_Self : UEnvQueryContext_ECS_BlueprintBase
{
    UEQC_Self()
    {
        return;
    }
    UFUNCTION()
    void ProvideSingleEntity_Implementation(const UObject QuerierObject, const FECSEntity &inout QuerierProxy, FECSEntityId &inout ResultingEntity) const
    {
        ResultingEntity = QuerierProxy.GetId();
        return;
    }
}

