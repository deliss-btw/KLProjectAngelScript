

class UEQC_SelfRotation : UEnvQueryContext_ECS_BlueprintBase
{
    UEQC_SelfRotation()
    {
        return;
    }
    UFUNCTION()
    void ProvideSingleRotation_Implementation(const UObject QuerierObject, const FECSEntity &inout QuerierProxy, FRotator &inout ResultingRotator) const
    {
        Get local_4;
        ResultingRotator = local_4.opCall().GetRotation().Rotator();
        return;
    }
}

