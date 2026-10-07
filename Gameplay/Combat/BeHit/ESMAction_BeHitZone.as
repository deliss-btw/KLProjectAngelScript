

class UESMAction_BeHitZone : UESMBPBaseSpanAction
{
    UESMAction_BeHitZone()
    {
        return;
    }
    UFUNCTION()
    EESMActionExitPolicy GetExitPolicy_Implementation() const
    {
        return EESMActionExitPolicy(3);
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(5);
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.IdentifyName = n"BeHitZone";
        OutParam.bExclusive = true;
        OutParam.SpecificStateMachineName = n"MainSM";
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FBeHitUtils::HandleBeHitContext(Context.GetEntity(), int(Context.GetECSWorld().GetFixedTime().Frame));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FBeHitUtils::ClearBeHitContext(Context.GetEntity());
        return;
    }
}

