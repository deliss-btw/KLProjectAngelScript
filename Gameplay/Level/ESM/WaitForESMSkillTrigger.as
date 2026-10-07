

// NOTE: class defaults are not authored in this module: FASWaitForESMSkillTrigger (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FASWaitForESMSkillTrigger : FECSAsyncAction
{
    FECSAsyncAction _base_FECSAsyncAction;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    TArray<FName> TriggerNames;
    UPROPERTY()
    FECSAsyncActionDelegate OnTriggerResponded;

    FASWaitForESMSkillTrigger()
    {
        this.__InitDefaults();
        return;
    }
    void Activate_Implementation()
    {
        ULevelEventManager local_2 = ::ULevelEventManager::Get();
        int local_6 = this.GetActionHandle();
        for (auto& local_22 : this.TriggerNames)
        {
            local_2.RegisterESMTriggerAsyncAction(this.TargetEntity, local_22, local_6);
        }
        return;
    }
    void Deactivate_Implementation()
    {
        ULevelEventManager local_2 = ::ULevelEventManager::Get();
        int local_6 = this.GetActionHandle();
        for (auto& local_22 : this.TriggerNames)
        {
            local_2.UnRegisterESMTriggerAsyncAction(this.TargetEntity, local_22, local_6);
        }
        return;
    }
    void Init(const FECSEntity &inout InEntity, const USkillConfig InSkillConfig)
    {
        this.TargetEntity = InEntity;
        this.TriggerNames.Empty(0);
        if (!(InSkillConfig.InputConfig.IsEmpty()))
        {
            for (auto& local_16 : InSkillConfig.InputConfig)
            {
                FName local_18(local_16.CoreTriggerItem.OutputTrigger);
                if ((!((local_18 == NAME_None))))
                {
                    this.TriggerNames.AddUnique(local_18);
                }
            }
        }
        if (this.TriggerNames.IsEmpty())
        {
            FName local_18_2(InSkillConfig.ESMTriggerUsedForTransit);
            if ((!((local_18_2 == NAME_None))))
            {
                this.TriggerNames.Add(local_18_2);
            }
        }
        return;
    }
}

