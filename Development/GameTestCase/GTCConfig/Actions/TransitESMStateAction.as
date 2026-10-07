

// NOTE: class defaults are not authored in this module: FGTCTransitESMStateAction (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FGTCTransitESMStateAction : FGTCAction
{
    FGTCAction _base_FGTCAction;
    UPROPERTY()
    FName StateName;

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

