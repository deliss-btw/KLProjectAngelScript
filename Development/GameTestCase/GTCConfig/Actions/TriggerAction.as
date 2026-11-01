struct FSimulatedTrigger
{
    UPROPERTY()
    FFPTime TriggerValidTime = 0.1;
    UPROPERTY()
    UESMInputTriggerAsset InputTrigger = nullptr;
    UPROPERTY()
    FName TriggerName;

    FSimulatedTrigger()
    {
        return;
    }
}

struct FGTCTriggerAction : FGTCAction
{
    FGTCAction _base_FGTCAction;
    UPROPERTY()
    TArray<FSimulatedTrigger> TriggerSequence;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FGTCTriggerAction.Get());

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
            FESMTriggerUtils::ActivateTrigger(TargetEntity, local_12.Storage, local_28, Context.FixedTime.Time, local_26.TriggerValidTime, 0);
        }
        return;
    }
}

