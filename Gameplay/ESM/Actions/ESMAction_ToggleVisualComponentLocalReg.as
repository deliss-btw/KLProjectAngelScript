

// NOTE: class defaults are not authored in this module: UESMAction_ToggleComponentsForDurationLocalReg (default scalar field UESMAction.ActionFilterType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

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
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
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
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

