

class UEQC_TargetEntity : UEnvQueryContext_ECS_BlueprintBase
{
    UEQC_TargetEntity()
    {
        return;
    }
    UFUNCTION()
    void ProvideSingleEntity_Implementation(const UObject QuerierObject, const FECSEntity &inout QuerierProxy, FECSEntityId &inout ResultingEntity) const
    {
        UBlackboardComponent local_2 = this.GetBlackboardFromQuerierObject(QuerierObject);
        if (local_2 != nullptr)
        {
            ResultingEntity = local_2.GetValueAsEntityId(n"TargetEntityID");
        }
        return;
    }
}

