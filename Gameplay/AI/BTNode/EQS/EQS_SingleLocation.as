

class UEQS_SingleLocation : UEnvQueryContext_ECS_BlueprintBase
{
    UEQS_SingleLocation()
    {
        return;
    }
    UFUNCTION()
    void ProvideSingleLocation_Implementation(const UObject QuerierObject, const FECSEntity &inout QuerierProxy, FVector &inout ResultingLocation) const
    {
        Get local_4;
        ResultingLocation = local_4.opCall().GetPosition();
        return;
    }
}

