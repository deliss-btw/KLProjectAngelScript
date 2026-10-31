struct FGTCTransitESMStateAction : FGTCAction
{
    FGTCAction _base_FGTCAction;
    UPROPERTY()
    FName StateName;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FGTCTransitESMStateAction.Get());

    FGTCTransitESMStateAction()
    {
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        ::FGTCUtils::TransitToESMState(TargetEntity, this.StateName, 0.0f);
        return;
    }
}

