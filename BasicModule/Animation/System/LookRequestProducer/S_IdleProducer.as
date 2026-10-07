

class US_LookRequestIdleProducerSystemAS : UECSScriptSystem
{
    US_LookRequestIdleProducerSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    void Job_PushIdleLookRequest(const FECSEntity &inout Entity, const FC_AnimAimPoseOutput &inout AimPoseOutput, const FCS_FixedTime &inout FixedTime, FC_LookRequestLocal &inout LookRequestLocal) const
    {
        int local_2 = 10;
        int local_1 = local_2;
        if (FMath::IsNearlyZero(AimPoseOutput.GetTargetWeight(), 1e-8f))
        {
            return;
        }
        FRotator local_18 = FCharacterInputUtils::GetViewInputDir(Entity, FixedTime.LastTime);
        FVector local_30 = FCharacterInputUtils::GetViewOffset(Entity, FixedTime.LastTime);
        FVector local_36(FVector::ZeroVector);
        Get local_40;
        const FC_Transform& local_42 = local_40.opCall();
        if (local_42)
        {
            local_36 = local_42.GetPosition();
        }
        FVector local_24 = (local_36 + local_30);
        FVector local_54 = (local_24 + (local_18.GetForwardVector() * 1000.0));
        return;
    }
}

