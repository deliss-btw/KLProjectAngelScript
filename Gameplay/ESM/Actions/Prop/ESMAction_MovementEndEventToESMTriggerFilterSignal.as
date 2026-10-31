class UESMAction_AddMovementEndEventToESMTriggerFilter : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bNotifySelf = true;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity NotifyEntity_EntityBBVar;
    UPROPERTY()
    FName EventName;

    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (local_6)
        {
            FECSEntity local_20;
            if (this.bNotifySelf)
            {
                local_20 = Context.GetEntity();
            }
            else
            {
                FNameHandle_EntityBBVarEntity local_12;
                local_12;
                local_20 = Context.GetEntity().GetBB_Entity(local_12);
            }
            local_6.SetNotifyEntity(local_20);
            local_6.SetEventName(this.EventName);
        }
        return;
    }
}

