
namespace __INTENRAL_FC_EcologyResourceProviderSummary_NS
{
    const TECSComponentDerivedPtr<FC_EcologyResourceProviderSummary> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyResourceProviderSummary>();
    const FC_EcologyResourceProviderSummary DefaultValue = FC_EcologyResourceProviderSummary();
}
namespace __INTENRAL_FC_EcologyResourceSlot_NS
{
    const TECSComponentDerivedPtr<FC_EcologyResourceSlot> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyResourceSlot>();
    const FC_EcologyResourceSlot DefaultValue = FC_EcologyResourceSlot();
}
namespace __INTENRAL_FC_EcologyModifierRegionData_NS
{
    const TECSComponentDerivedPtr<FC_EcologyModifierRegionData> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyModifierRegionData>();
    const FC_EcologyModifierRegionData DefaultValue = FC_EcologyModifierRegionData();
}
namespace __INTENRAL_FC_EcologyModifier_NS
{
    const TECSComponentDerivedPtr<FC_EcologyModifier> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyModifier>();
    const FC_EcologyModifier DefaultValue = FC_EcologyModifier();

}
struct FC_EcologyResourceProviderSummary : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FEcologyResourceDefinitionRow> ResourceType;
    UPROPERTY()
    FBox Region;
    UPROPERTY()
    FConfigReference ConfigRef;
    UPROPERTY()
    int MaxTeamCount = 1;
    UPROPERTY()
    bool bHighPriorityResource;
    UPROPERTY()
    bool bHaveSlot;
    UPROPERTY()
    bool bEnableDynamicSlot;
    UPROPERTY()
    int PinedTeamCount = 0;
    UPROPERTY()
    TSet<FECSEntityId> PinedTeams;


}

struct FC_EcologyResourceSlot : FECSComponent
{
    UPROPERTY()
    TArray<FEcologyResourceSlotData> SlotData;
    UPROPERTY()
    TMap<int, FECSEntityId> ClaimedMap;

    FC_EcologyResourceSlot()
    {
        return;
    }
    FECSEntityId GetClaimEntity(const int SlotIndex) const
    {
        if (this.ClaimedMap.Contains(SlotIndex))
        {
            return this.ClaimedMap[SlotIndex];
        }
        return ENTITY_ID_NULL;
    }
    void SetClaimEntity(const int SlotIndex, const FECSEntityId &inout EntityId)
    {
        if (this.ClaimedMap.Contains(SlotIndex))
        {
            this.ClaimedMap[SlotIndex] = EntityId;
            return;
        }
        this.ClaimedMap.Add(SlotIndex, EntityId);
        return;
    }
    bool IsClaimed(const int SlotIndex) const
    {
        return (!((this.GetClaimEntity(SlotIndex) == ENTITY_ID_NULL)));
    }
    bool RemoveClaim(const int SlotIndex, const FECSEntityId &inout TargetEntity, const bool bForceClaim = false)
    {
        if (bForceClaim || (TargetEntity == this.GetClaimEntity(SlotIndex)))
        {
            return true;
        }
        return false;
    }
    bool IsUseableFor(const int SlotIndex, const FECSEntityId &inout TargetEntity) const
    {
        FECSEntityId local_1 = this.GetClaimEntity(SlotIndex);
        return ((local_1 == ENTITY_ID_NULL) || (local_1 == TargetEntity));
    }
    TConstRawPtr<FEcologyResourceSlotData> GetSlotData(const int Index) const
    {
        if (Index < 0 || (Index >= this.Num()))
        {
            return TConstRawPtr<FEcologyResourceSlotData>();
        }
        return TConstRawPtr<FEcologyResourceSlotData>(this[Index]);
    }
}

struct FEcologyModifierSummary
{
    UPROPERTY()
    FECSEntityId ConfigRef;

    FEcologyModifierSummary()
    {
        return;
    }
    const FEcologyResourceModifierConfig& GetModifierConfig() const
    {
        bool local_9 = !(FECSEntity(this).IsValid());
        if (local_9)
        {
        }
        else
        {
            FC_EcologyResourceModifierConfig local_16;
            if (local_16)
            {
            }
            else
            {
            }
        }
        return local_9;
    }
}

struct FC_EcologyModifierRegionData : FECSComponent
{
    UPROPERTY()
    TMap<FECSEntityId, FEcologyModifierSummary> Modifiers;

    FC_EcologyModifierRegionData()
    {
        return;
    }
}

struct FC_EcologyModifier : FECSComponent
{
    UPROPERTY()
    TMap<FECSEntityId, FEcologyModifierSummary> Modifiers;

    FC_EcologyModifier()
    {
        return;
    }
}

namespace ECSFunc_FC_EcologyResourceProviderSummary
{
UFUNCTION()
bool HasEcologyResourceProviderSummary(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceProviderSummary);
}
FC_EcologyResourceProviderSummary& AssignEcologyResourceProviderSummary(const FECSEntity &inout Entity, const FC_EcologyResourceProviderSummary &inout DefaultValue = FC_EcologyResourceProviderSummary())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceProviderSummary, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyResourceProviderSummary_BP(const FECSEntity &inout Entity, const FC_EcologyResourceProviderSummary &inout DefaultValue = FC_EcologyResourceProviderSummary())
{
    ECSFunc_FC_EcologyResourceProviderSummary::AssignEcologyResourceProviderSummary(Entity, DefaultValue);
    return;
}
FC_EcologyResourceProviderSummary& ModifyEcologyResourceProviderSummary(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceProviderSummary));
    return local_12.GetComp();
}
FC_EcologyResourceProviderSummary& ModifyOrAddEcologyResourceProviderSummary(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceProviderSummary));
    return local_12.GetComp();
}
const FC_EcologyResourceProviderSummary& GetEcologyResourceProviderSummary(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceProviderSummary));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyResourceProviderSummary GetEcologyResourceProviderSummary_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyResourceProviderSummary __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyResourceProviderSummary::GetEcologyResourceProviderSummary(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyResourceProviderSummary GetDefaultedEcologyResourceProviderSummary(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyResourceProviderSummary __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceProviderSummary);
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
FC_EcologyResourceProviderSummary GetDefaultedEcologyResourceProviderSummary_BP(const FECSEntity &inout Entity)
{
    FC_EcologyResourceProviderSummary __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyResourceProviderSummary(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceProviderSummary);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceProviderSummaryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyResourceProviderSummary, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceProviderSummaryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyResourceProviderSummary, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceProviderSummaryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyResourceProviderSummary, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceProviderSummaryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyResourceProviderSummary, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceProviderSummaryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyResourceProviderSummary, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyResourceProviderSummaryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyResourceProviderSummary, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyResourceProviderSummaryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyResourceProviderSummary, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyResourceProviderSummaryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyResourceProviderSummary, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyResourceSlot
{
UFUNCTION()
bool HasEcologyResourceSlot(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceSlot);
}
FC_EcologyResourceSlot& AssignEcologyResourceSlot(const FECSEntity &inout Entity, const FC_EcologyResourceSlot &inout DefaultValue = FC_EcologyResourceSlot())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceSlot, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyResourceSlot_BP(const FECSEntity &inout Entity, const FC_EcologyResourceSlot &inout DefaultValue = FC_EcologyResourceSlot())
{
    ECSFunc_FC_EcologyResourceSlot::AssignEcologyResourceSlot(Entity, DefaultValue);
    return;
}
FC_EcologyResourceSlot& ModifyEcologyResourceSlot(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceSlot));
    return local_12.GetComp();
}
FC_EcologyResourceSlot& ModifyOrAddEcologyResourceSlot(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceSlot));
    return local_12.GetComp();
}
const FC_EcologyResourceSlot& GetEcologyResourceSlot(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceSlot));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyResourceSlot GetEcologyResourceSlot_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyResourceSlot __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyResourceSlot::GetEcologyResourceSlot(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyResourceSlot GetDefaultedEcologyResourceSlot(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyResourceSlot __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceSlot);
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
FC_EcologyResourceSlot GetDefaultedEcologyResourceSlot_BP(const FECSEntity &inout Entity)
{
    FC_EcologyResourceSlot __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyResourceSlot(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyResourceSlot);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceSlotOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyResourceSlot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceSlotOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyResourceSlot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceSlotOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyResourceSlot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceSlotOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyResourceSlot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyResourceSlotOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyResourceSlot, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyResourceSlotLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyResourceSlot, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyResourceSlotActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyResourceSlot, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyResourceSlotModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyResourceSlot, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyModifierRegionData
{
UFUNCTION()
bool HasEcologyModifierRegionData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifierRegionData);
}
FC_EcologyModifierRegionData& AssignEcologyModifierRegionData(const FECSEntity &inout Entity, const FC_EcologyModifierRegionData &inout DefaultValue = FC_EcologyModifierRegionData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifierRegionData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyModifierRegionData_BP(const FECSEntity &inout Entity, const FC_EcologyModifierRegionData &inout DefaultValue = FC_EcologyModifierRegionData())
{
    ECSFunc_FC_EcologyModifierRegionData::AssignEcologyModifierRegionData(Entity, DefaultValue);
    return;
}
FC_EcologyModifierRegionData& ModifyEcologyModifierRegionData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifierRegionData));
    return local_12.GetComp();
}
FC_EcologyModifierRegionData& ModifyOrAddEcologyModifierRegionData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifierRegionData));
    return local_12.GetComp();
}
const FC_EcologyModifierRegionData& GetEcologyModifierRegionData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifierRegionData));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyModifierRegionData GetEcologyModifierRegionData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyModifierRegionData __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyModifierRegionData::GetEcologyModifierRegionData(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyModifierRegionData GetDefaultedEcologyModifierRegionData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyModifierRegionData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifierRegionData);
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
FC_EcologyModifierRegionData GetDefaultedEcologyModifierRegionData_BP(const FECSEntity &inout Entity)
{
    FC_EcologyModifierRegionData __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyModifierRegionData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifierRegionData);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyModifierRegionDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyModifierRegionData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyModifierRegionDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyModifierRegionData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyModifierRegionDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyModifierRegionData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyModifierRegionDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyModifierRegionData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyModifierRegionDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyModifierRegionData, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyModifierRegionDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyModifierRegionData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyModifierRegionDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyModifierRegionData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyModifierRegionDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyModifierRegionData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcologyModifier
{
UFUNCTION()
bool HasEcologyModifier(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifier);
}
FC_EcologyModifier& AssignEcologyModifier(const FECSEntity &inout Entity, const FC_EcologyModifier &inout DefaultValue = FC_EcologyModifier())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifier, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyModifier_BP(const FECSEntity &inout Entity, const FC_EcologyModifier &inout DefaultValue = FC_EcologyModifier())
{
    ECSFunc_FC_EcologyModifier::AssignEcologyModifier(Entity, DefaultValue);
    return;
}
FC_EcologyModifier& ModifyEcologyModifier(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifier));
    return local_12.GetComp();
}
FC_EcologyModifier& ModifyOrAddEcologyModifier(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifier));
    return local_12.GetComp();
}
const FC_EcologyModifier& GetEcologyModifier(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifier));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyModifier GetEcologyModifier_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyModifier __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyModifier::GetEcologyModifier(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyModifier GetDefaultedEcologyModifier(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyModifier __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifier);
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
FC_EcologyModifier GetDefaultedEcologyModifier_BP(const FECSEntity &inout Entity)
{
    FC_EcologyModifier __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyModifier(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyModifier);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyModifierOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyModifier, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyModifierOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyModifier, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyModifierOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyModifier, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyModifierOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyModifier, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyModifierOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyModifier, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyModifierLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyModifier, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyModifierActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyModifier, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyModifierModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyModifier, bFixedFrame, Details);
    return;
}
