

class UEQC_TargetCenterLocation : UEnvQueryContext_ECS_BlueprintBase
{
    UEQC_TargetCenterLocation()
    {
        return;
    }
    UFUNCTION()
    void ProvideSingleLocation_Implementation(const UObject QuerierObject, const FECSEntity &inout QuerierProxy, FVector &inout ResultingLocation) const
    {
        UBlackboardComponent local_2 = this.GetBlackboardFromQuerierObject(QuerierObject);
        if (local_2 != nullptr)
        {
            ResultingLocation = local_2.GetValueAsVector(n"TargetCenterLocation");
        }
        return;
    }
}

