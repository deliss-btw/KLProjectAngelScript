

// NOTE: class defaults are not authored in this module: FGTCTriggerAction (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FSimulatedTrigger
{
    UPROPERTY()
    FFPTime TriggerValidTime;
    UPROPERTY()
    UESMInputTriggerAsset InputTrigger;
    UPROPERTY()
    FName TriggerName;

    FSimulatedTrigger()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FGTCTriggerAction : FGTCAction
{
    FGTCAction _base_FGTCAction;
    UPROPERTY()
    TArray<FSimulatedTrigger> TriggerSequence;

    FGTCTriggerAction()
    {
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        Has local_4;
        int local_12 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        for (auto& local_26 : this.TriggerSequence)
        {
            FName local_28 = local_26.TriggerName;
            if (((local_28 == NAME_None) && ((local_26.InputTrigger != nullptr))))
            {
                local_28 = local_26.InputTrigger.OutputTrigger;
            }
            if ((local_28 == NAME_None))
            {
                continue;
            }
            FFPTime local_34 = FFPTime(Context.FixedTime.Time);
            FESMTriggerUtils::ActivateTrigger(TargetEntity, local_12.Storage, local_28, local_34, local_26.TriggerValidTime, 0);
        }
        return;
    }
}

