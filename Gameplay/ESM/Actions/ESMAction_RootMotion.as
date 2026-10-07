

class UESMAction_RootMotion : UESMRootMotionAction
{
    UESMAction_RootMotion()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.SpecificStateMachineName = n"MainSM";
        return;
    }
}

