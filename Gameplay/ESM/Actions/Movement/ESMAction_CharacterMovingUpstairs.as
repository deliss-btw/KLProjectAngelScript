

class UESMAction_CharacterMovingUpstairs : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bIsDualUpstairs = false;
    UPROPERTY()
    bool bNeedEnsureVaultStartState = false;
    UPROPERTY()
    EVaultStartState EnsureVaultStartState = EVaultStartState(0);


    UFUNCTION()
    EESMActionExitPolicy GetExitPolicy_Implementation() const
    {
        return EESMActionExitPolicy(2);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        local_6.SetbIsMovingUpstairs(true);
        if (this.bIsDualUpstairs && (int(local_6.GetDualProbPath().VaultActionType) == 1))
        {
            local_6.SetProbPath(local_6.GetDualProbPath());
            local_6.SetClearInfoTime((FFPTime(Time.WorldTime) + FFPTime(::Vaulting::GetClearVaultTriggerDelay())));
        }
        FVaultPath local_48;
        local_6.SetDualProbPath(local_48);
        if (this.bNeedEnsureVaultStartState)
        {
            EVaultStartState local_49 = local_6.VaultStartState();
            int local_9 = int(this.EnsureVaultStartState);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        local_6.SetbIsMovingUpstairs(false);
        if (int(local_6.GetProbPath().VaultActionType) == 1)
        {
            local_6.ClearVaultAction();
        }
        return;
    }
}

