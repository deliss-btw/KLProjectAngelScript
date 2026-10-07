

class UESMAction_ForceTransitOnEntityLost : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarEntity WatchEntityBBVar;
    UPROPERTY()
    FName TargetStateName = n"Default";
    UPROPERTY()
    FName TargetSMName = NAME_None;

    UESMAction_ForceTransitOnEntityLost()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Mark;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (!((Info.GetParentState() != nullptr)) && ((Info.StateGroup == nullptr)))
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "Force Transit On Entity Lost can only add in state or state group.");
        }
        if ((FName(this.WatchEntityBBVar.Name) == NAME_None))
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "WatchEntityBBVar is not set.");
        }
        if ((this.TargetStateName == NAME_None))
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "TargetStateName is not set.");
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if ((this.TargetStateName == NAME_None) || (FName(this.WatchEntityBBVar.Name) == NAME_None))
        {
            return;
        }
        FNameHandle_EntityBBVarEntity local_12;
        local_12;
        FECSEntity local_16 = Context.GetEntity().GetBB_Entity(local_12);
        if (local_16.IsValid() && local_16.IsActive())
        {
            return;
        }
        if ((this.TargetSMName == NAME_None))
        {
            FESMExternalTransitHandle local_26 = Context.GetEntity().ESMExternalTransitMainSM(this.TargetStateName, n"ForceTransitOnEntityLost");
        }
        else
        {
            FESMExternalTransitHandle local_26_2 = Context.GetEntity().ESMExternalTransit(this.TargetSMName, this.TargetStateName, n"ForceTransitOnEntityLost");
        }
        return;
    }
}

