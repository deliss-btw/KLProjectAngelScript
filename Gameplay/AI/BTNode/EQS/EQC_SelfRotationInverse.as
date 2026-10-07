

class UEQC_SelfRotationInverse : UEnvQueryContext_ECS_BlueprintBase
{
    UEQC_SelfRotationInverse()
    {
        return;
    }
    UFUNCTION()
    void ProvideSingleRotation_Implementation(const UObject QuerierObject, const FECSEntity &inout QuerierProxy, FRotator &inout ResultingRotator) const
    {
        Get local_4;
        ResultingRotator = (local_4.opCall().GetRotation().Rotator() + FRotator(0.0, 180.0, 0.0));
        return;
    }
}

