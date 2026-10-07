
namespace __INTENRAL_FC_CombatScriptControl_NS
{
    const TECSComponentDerivedPtr<FC_CombatScriptControl> DerivedPtr = TECSComponentDerivedPtr<FC_CombatScriptControl>();
    const FC_CombatScriptControl DefaultValue = FC_CombatScriptControl();

}
struct FC_CombatScriptControl : FECSComponent
{
    UPROPERTY()
    TArray<FScriptControlQueueSlot> Slots;
    UPROPERTY()
    int ActiveSlotIndex = -1;
    UPROPERTY()
    EScriptControlSourceType ActiveSourceType;
    UPROPERTY()
    bool bEnabled = false;
    UPROPERTY()
    EScriptControlPreferBehavior PreferBehavior;
    UPROPERTY()
    EScriptControlCurrentBehavior CurrentBehavior;
    UPROPERTY()
    EScriptControlBehaviorName CurrentActionBehavior;
    UPROPERTY()
    int PreferEntryId = 0;
    UPROPERTY()
    int CurrentEntryId = 0;
    UPROPERTY()
    int NextEntryId = 1;


    int FindSlotIndex(const EScriptControlSourceType SourceType) const
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            if (int(this[local_1].SourceType) == int(SourceType))
            {
                return local_1;
            }
        }
        return -1;
    }
    FScriptControlQueueSlot& FindOrCreateSlot(const EScriptControlSourceType SourceType)
    {
        int local_2 = this.FindSlotIndex(EScriptControlSourceType(SourceType));
        if (local_2 >= 0)
        {
            return this[local_2];
        }
        FScriptControlQueueSlot local_72;
        local_72.SourceType = SourceType;
        local_72.Priority = ::ScriptControlSourceConfig::GetPriority(EScriptControlSourceType(SourceType));
        int local_73 = 0;
        int local_74 = 0;
        for (; local_74 < this.Num(); ++local_74)
        {
            if (this[local_74].Priority >= int(local_72.Priority))
            {
                local_73 = local_74 + 1;
                continue;
            }
            break;
        }
        this.Insert(local_72, local_73);
        if (this.ActiveSlotIndex >= local_73)
        {
            ++this.ActiveSlotIndex;
        }
        return this[local_73];
    }
    void RemoveSlot(const EScriptControlSourceType SourceType)
    {
        int local_2 = this.FindSlotIndex(EScriptControlSourceType(SourceType));
        if (local_2 < 0)
        {
            return;
        }
        this.RemoveAt(local_2);
        if (this.ActiveSlotIndex == local_2)
        {
            this.ActiveSlotIndex = -1;
            return;
        }
        if (this.ActiveSlotIndex > local_2)
        {
            --this.ActiveSlotIndex;
        }
        return;
    }
    bool HasActiveSlot() const
    {
        return this.ActiveSlotIndex >= 0 && (this.ActiveSlotIndex < this.Num());
    }
    void RefreshBBBehaviorNames()
    {
        EScriptControlBehaviorName local_5;
        if (this.HasActiveSlot())
        {
            FScriptControlQueueSlot& local_4 = this[this.ActiveSlotIndex];
            if (local_4.bHasCurrentAction)
            {
                local_5 = local_4.CurrentAction.BehaviorName;
            }
            else
            {
                local_5 = EScriptControlBehaviorName(0);
            }
            this.CurrentActionBehavior = EScriptControlBehaviorName(local_5);
            return;
        }
        EScriptControlBehaviorName local_6 = EScriptControlBehaviorName(0);
        this.CurrentActionBehavior = EScriptControlBehaviorName(local_6);
        return;
    }
    void DisableAndClearAll()
    {
        this.Reset(0);
        this.ActiveSlotIndex = -1;
        this.bEnabled = false;
        this.PreferBehavior = EScriptControlPreferBehavior(0);
        this.CurrentBehavior = EScriptControlCurrentBehavior(0);
        this.PreferEntryId = 0;
        this.CurrentEntryId = 0;
        this.CurrentActionBehavior = EScriptControlBehaviorName(0);
        return;
    }
}

namespace ECSFunc_FC_CombatScriptControl
{
UFUNCTION()
bool HasCombatScriptControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatScriptControl);
}
FC_CombatScriptControl& AssignCombatScriptControl(const FECSEntity &inout Entity, const FC_CombatScriptControl &inout DefaultValue = FC_CombatScriptControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatScriptControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatScriptControl_BP(const FECSEntity &inout Entity, const FC_CombatScriptControl &inout DefaultValue = FC_CombatScriptControl())
{
    ECSFunc_FC_CombatScriptControl::AssignCombatScriptControl(Entity, DefaultValue);
    return;
}
FC_CombatScriptControl& ModifyCombatScriptControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatScriptControl));
    return local_12.GetComp();
}
FC_CombatScriptControl& ModifyOrAddCombatScriptControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatScriptControl));
    return local_12.GetComp();
}
const FC_CombatScriptControl& GetCombatScriptControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatScriptControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatScriptControl GetCombatScriptControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CombatScriptControl __r;
    bValid = false;
    bValid = ECSFunc_FC_CombatScriptControl::GetCombatScriptControl(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CombatScriptControl GetDefaultedCombatScriptControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatScriptControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatScriptControl);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_CombatScriptControl GetDefaultedCombatScriptControl_BP(const FECSEntity &inout Entity)
{
    FC_CombatScriptControl __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatScriptControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatScriptControl);
}
}
FECSMonitorRuntimeView __GetMonitorCombatScriptControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatScriptControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatScriptControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatScriptControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatScriptControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatScriptControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatScriptControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatScriptControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatScriptControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatScriptControl, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatScriptControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatScriptControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatScriptControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatScriptControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatScriptControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatScriptControl, bFixedFrame, Details);
    return;
}
