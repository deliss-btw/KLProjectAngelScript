

class UESMAction_SetStrafeTransitionTime : UESMBPBaseInstantAction
{
    UESMAction_SetStrafeTransitionTime()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_18;
        int local_20 = 0;
        int local_68 = 0;
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        float local_60 = FMath::Abs(FMath::RadiansToDegrees((FQuat::FindBetweenVectors((FVector(local_20.GetPosition()) - local_18.opCall().GetPosition()), local_18.opCall().GetRotation().GetForwardVector()).GetAngle())));
        Get local_72;
        local_60 = local_60 / local_72.opCall().TurnSpeed;
        local_68.SetStrafeTransitionTime(float32(local_60));
        return;
    }
}

