

struct FItemESMActionConfigPtr : FItemActionConfigPtr
{
    FItemActionConfigPtr _base_FItemActionConfigPtr;

    FItemESMActionConfigPtr()
    {
        super();
        return;
    }
    FItemESMActionConfigPtr(const FItemActionConfigPtr &inout ItemActionPtr)
    {
        super();
        Super::SetItemConfig(ItemActionPtr.GetItemConfig());
        Super::SetActionType(ItemActionPtr.GetActionType());
        if ((!((this.GetESMAction() != nullptr))))
        {
            Super::Reset();
        }
        return;
    }
    UItemActionConfig_ESMAction GetESMAction() const
    {
        return Cast<UItemActionConfig_ESMAction>(Super::Get());
    }
}

UCLASS(Abstract)
class UItemActionConfig_ESMAction : UItemActionConfig_TimeSpan
{
    UPROPERTY()
    FGameplayTag ItemActionTag;
    UPROPERTY()
    TArray<UItemActionTriggerBase> OnEnterESMActionTriggers;
    UPROPERTY()
    TArray<UItemActionTriggerBase> OnExitESMActionTriggers;
    UPROPERTY()
    TMap<FGameplayTag, FItemActionTriggerArray> OnCustomTriggers;

    UItemActionConfig_ESMAction()
    {
        super();
        return;
    }
    void OnExecutionStart(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        int local_6 = 0;
        Super::OnExecutionStart(RuntimeInfo);
        local_6.SetOwnerEntity(RuntimeInfo.GetActionSource().GetItemOwner());
        if (!(local_6.RegisterPendingESMAction()))
        {
            XLog(ELog(47), "Failed to start ESM action, there has already running action");
            Super::ExecuteFail(RuntimeInfo);
        }
        return;
    }
    void NotifyEnter(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        Super::ExecuteCustomTriggers(RuntimeInfo, this.OnEnterESMActionTriggers);
        Super::ExecuteOverriteTimeout(RuntimeInfo, FFPTime(-1));
        return;
    }
    void NotifyExit(FItemActionRuntimeInfo &inout RuntimeInfo) const
    {
        Super::ExecuteCustomTriggers(RuntimeInfo, this.OnExitESMActionTriggers);
        if (RuntimeInfo.GetbCostPaid())
        {
            Super::ExecuteFinish(RuntimeInfo);
            return;
        }
        Super::ExecuteFail(RuntimeInfo);
        return;
    }
    void NotifyCustomTrigger(FItemActionRuntimeInfo &inout RuntimeInfo, const FGameplayTag &inout CustomTrigger) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

