class UESMAction_ToggleComponentsForDurationLocalReg : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bHidden = true;
    UPROPERTY()
    FNameToComponentLogicNames LogicNames;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_16 = 0;
        FECSEntity local_8 = this.GetDefaultEntity(Context);
        if (!(local_8.IsValid()))
        {
            return;
        }
        if (local_16)
        {
            FName local_22 = FName(this.GetDisplayName());
            ::VisualComponentToggleUtils::SetVisualComponentHiddenWithPotentialDelay(local_8, local_16, this.LogicNames.LogicNames, (this.bHidden), Time.WorldTime, local_22, true);
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_16 = 0;
        FECSEntity local_8 = this.GetDefaultEntity(Context);
        if (!(local_8.IsValid()))
        {
            return;
        }
        if (local_16)
        {
            FName local_22 = FName(this.GetDisplayName());
            ::VisualComponentToggleUtils::SetVisualComponentHiddenWithPotentialDelay(local_8, local_16, this.LogicNames.LogicNames, !(this.bHidden), Time.WorldTime, local_22, true);
        }
        return;
    }
    FECSEntity GetDefaultEntity(const FESMViewContext &inout Context) const
    {
        Get local_4;
        const FC_LocalToDefault& local_6 = local_4.opCall();
        if (local_6)
        {
            return FECSEntity(local_6.DefaultEntityId);
        }
        return ENTITY_NULL;
    }
}

class UESMAction_ToggleComponentsInstantlyLocalReg : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bHidden = true;
    UPROPERTY()
    FNameToComponentLogicNames LogicNames;


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    void ViewDo_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_22 = 0;
        FECSEntity local_4 = FECSEntity(ENTITY_NULL);
        Get local_8;
        const FC_LocalToDefault& local_10 = local_8.opCall();
        if (local_10)
        {
            local_4 = FECSEntity(local_10.DefaultEntityId);
        }
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (local_22)
        {
            FName local_28 = FName(this.GetDisplayName());
            ::VisualComponentToggleUtils::SetVisualComponentHiddenWithPotentialDelay(local_4, local_22, this.LogicNames.LogicNames, (this.bHidden), Time.WorldTime, local_28, true);
        }
        return;
    }
}

