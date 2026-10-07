

class UEQC_TargetEcosimPoint : UEnvQueryContext_ECS_BlueprintBase
{
    UEQC_TargetEcosimPoint()
    {
        return;
    }
    UFUNCTION()
    void ProvideSingleEntity_Implementation(const UObject QuerierObject, const FECSEntity &inout QuerierProxy, FECSEntityId &inout ResultingEntity) const
    {
        UBlackboardComponent local_2 = this.GetBlackboardFromQuerierObject(QuerierObject);
        if (local_2 != nullptr)
        {
            ResultingEntity = local_2.GetValueAsEntityId(n"TargetEcosimPointEntityID");
            if (!(FECSEntity(ResultingEntity).IsValid()))
            {
                XError(ELog(0), FString().Append("Invalid TargetEcosimPoint:").Append(ResultingEntity.GetIdValue()).Append("!"));
            }
        }
        return;
    }
}

