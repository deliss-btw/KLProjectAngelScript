class UESMAction_SpawnInteractDropItem : UESMBPBaseInstantAction
{
    UESMAction_SpawnInteractDropItem()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (::DropItemsUtils::CanTriggerDrop(EDropTriggerType(1), Context.GetEntity()))
        {
            SendEvent local_8;
            local_8.opCall(Time.WorldTime);
        }
        return;
    }
}

