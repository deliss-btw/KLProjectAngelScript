

class UEQC_TargetEcosimWanderPoint : UEnvQueryContext_ECS_BlueprintBase
{
    UEQC_TargetEcosimWanderPoint()
    {
        return;
    }
    UFUNCTION()
    void ProvideSingleEntity_Implementation(const UObject QuerierObject, const FECSEntity &inout QuerierProxy, FECSEntityId &inout ResultingEntity) const
    {
        UBlackboardComponent local_2 = this.GetBlackboardFromQuerierObject(QuerierObject);
        if (local_2 != nullptr)
        {
            ResultingEntity = local_2.GetValueAsEntityId(n"TargetEcosimWanderPointEntityID");
        }
        return;
    }
}

