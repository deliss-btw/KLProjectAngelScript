class UESMAction_KillSelfEntity : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bAutoEnterDestroy = true;
    UPROPERTY()
    bool bESMTransitToDeathState = true;
    UPROPERTY()
    bool bNoKillerEntity = false;

    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(3);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        FECSEntityId local_6;
        if (this.bNoKillerEntity)
        {
            local_6 = ENTITY_ID_NULL;
        }
        else
        {
            local_6 = local_2.GetId();
        }
        ::FLifeCycleUtils::KillEntityCheckNearDeathRule(local_2, local_6, Time.WorldTime, (this.bESMTransitToDeathState), (this.bAutoEnterDestroy), false, true);
        return;
    }
}

