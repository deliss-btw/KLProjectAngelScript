
namespace __INTENRAL_FC_ScriptControl_NS
{
    const TECSComponentDerivedPtr<FC_ScriptControl> DerivedPtr = TECSComponentDerivedPtr<FC_ScriptControl>();
    const FC_ScriptControl DefaultValue = FC_ScriptControl();

}
struct FC_ScriptControl : FECSComponent
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
    EScriptControlBehaviorName CurrentScriptControlStateBehavior;
    UPROPERTY()
    EScriptControlBehaviorName CurrentScriptControlActionBehavior;
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
            if (local_4.HasPendingState())
            {
                local_5 = local_4.StateQueue[int(local_4.CurrentStateIndex)].BehaviorName;
            }
            else
            {
                local_5 = EScriptControlBehaviorName(0);
            }
            this.CurrentScriptControlStateBehavior = EScriptControlBehaviorName(local_5);
            if (local_4.bHasCurrentAction)
            {
                local_5 = local_4.CurrentAction.BehaviorName;
            }
            else
            {
                local_5 = EScriptControlBehaviorName(0);
            }
            this.CurrentScriptControlActionBehavior = EScriptControlBehaviorName(local_5);
            return;
        }
        EScriptControlBehaviorName local_6 = EScriptControlBehaviorName(0);
        this.CurrentScriptControlStateBehavior = EScriptControlBehaviorName(local_6);
        local_5 = EScriptControlBehaviorName(0);
        this.CurrentScriptControlActionBehavior = EScriptControlBehaviorName(local_5);
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
        this.CurrentScriptControlStateBehavior = EScriptControlBehaviorName(0);
        this.CurrentScriptControlActionBehavior = EScriptControlBehaviorName(0);
        return;
    }
}

namespace ECSFunc_FC_ScriptControl
{
UFUNCTION()
bool HasScriptControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScriptControl);
}
FC_ScriptControl& AssignScriptControl(const FECSEntity &inout Entity, const FC_ScriptControl &inout DefaultValue = FC_ScriptControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScriptControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScriptControl_BP(const FECSEntity &inout Entity, const FC_ScriptControl &inout DefaultValue = FC_ScriptControl())
{
    ECSFunc_FC_ScriptControl::AssignScriptControl(Entity, DefaultValue);
    return;
}
FC_ScriptControl& ModifyScriptControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScriptControl));
    return local_12.GetComp();
}
FC_ScriptControl& ModifyOrAddScriptControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScriptControl));
    return local_12.GetComp();
}
const FC_ScriptControl& GetScriptControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScriptControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScriptControl GetScriptControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ScriptControl __r;
    bValid = false;
    bValid = ECSFunc_FC_ScriptControl::GetScriptControl(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ScriptControl GetDefaultedScriptControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScriptControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScriptControl);
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
FC_ScriptControl GetDefaultedScriptControl_BP(const FECSEntity &inout Entity)
{
    FC_ScriptControl __r;
    return __r;
}
UFUNCTION()
bool RemoveScriptControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScriptControl);
}
}
FECSMonitorRuntimeView __GetMonitorScriptControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScriptControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScriptControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScriptControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScriptControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScriptControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScriptControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScriptControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScriptControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScriptControl, bFixedFrame, bMustHandleAll);
}
void __MonitorScriptControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScriptControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScriptControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScriptControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScriptControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScriptControl, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_ScriptControl_bEnabled(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().bEnabled;
    return;
}
void GetEntityBBVar_ScriptControl_PreferBehavior(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().PreferBehavior) != 0);
    return;
}
void GetEntityBBVar_ScriptControl_CurrentBehavior(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().CurrentBehavior) != 0);
    return;
}
void GetEntityBBVar_ScriptControl_CurrentScriptControlStateBehavior(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().CurrentScriptControlStateBehavior) != 0);
    return;
}
void GetEntityBBVar_ScriptControl_CurrentScriptControlActionBehavior(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().CurrentScriptControlActionBehavior) != 0);
    return;
}
}
