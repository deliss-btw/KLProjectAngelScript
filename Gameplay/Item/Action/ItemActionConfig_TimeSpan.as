

UCLASS(Abstract)
class UItemActionConfig_TimeSpan : UItemActionConfigBase
{
    UPROPERTY()
    FFPTime ActionTimeout = -1;

    UItemActionConfig_TimeSpan()
    {
        super();
        return;
    }
    void OnExecutionStart(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        RuntimeInfo.SetActionStartTime(ECS::GetContextTime());
        RuntimeInfo.SetActionTimeout(this.ActionTimeout);
        return;
    }
    void OnActionTick(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        FFPTime local_2 = FFPTime(RuntimeInfo.GetActionTimeout());
        if ((local_2.opCmp(0.0) >= 0 && ((((ECS::GetContextTime() - RuntimeInfo.GetActionStartTime())).opCmp(RuntimeInfo.GetActionTimeout()) >= 0))))
        {
            XLog(ELog(47), FString().Append("Item Action Failed: timeout ").Append(this.ActionTimeout));
            Super::ExecuteFail(RuntimeInfo);
        }
        return;
    }
    void ExecuteOverriteTimeout(FItemActionRuntimeInfo &inout RuntimeInfo, const FFPTime &inout OverriteTimeout) const
    {
        RuntimeInfo.SetActionTimeout(OverriteTimeout);
        return;
    }
}

