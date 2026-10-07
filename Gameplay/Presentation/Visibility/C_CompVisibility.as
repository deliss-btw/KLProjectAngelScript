
namespace __INTENRAL_FC_CompHidden_NS
{
    const TECSComponentDerivedPtr<FC_CompHidden> DerivedPtr = TECSComponentDerivedPtr<FC_CompHidden>();
    const FC_CompHidden DefaultValue = FC_CompHidden();
}
namespace __INTENRAL_FC_PresentationHiddenComponents_NS
{
    const TECSComponentDerivedPtr<FC_PresentationHiddenComponents> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationHiddenComponents>();
    const FC_PresentationHiddenComponents DefaultValue = FC_PresentationHiddenComponents();
}
namespace __INTENRAL_FC_PresentationHiddenComponentsUpdateTag_NS
{
    const TECSComponentDerivedPtr<FC_PresentationHiddenComponentsUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationHiddenComponentsUpdateTag>();
    const FC_PresentationHiddenComponentsUpdateTag DefaultValue = FC_PresentationHiddenComponentsUpdateTag();

}
struct FCompHiddenInfo
{
    UPROPERTY()
    int m_Counter = 0;


    int GetCounter() const property
    {
        return this.m_Counter;
    }
    void SetCounter(const int __Value) property
    {
        this.m_Counter = __Value;
        return;
    }
}

struct FC_CompHidden : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FName, int> m_HiddenCountByName;

    FC_CompHidden()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_CompHidden(const FC_CompHidden &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_HiddenCountByName = Other.m_HiddenCountByName;
        return;
    }
    FC_CompHidden opAssign(const FC_CompHidden &inout Other)
    {
        FC_CompHidden __r;
        this.SetHiddenCountByName(Other.GetHiddenCountByName());
        return __r;
    }
    const TMap<FName, int> GetHiddenCountByName() const property
    {
        const TMap<FName, int> __r;
        return __r;
    }
    TMap<FName, int> GetModify_HiddenCountByName() property
    {
        TMap<FName, int> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetHiddenCountByName(const TMap<FName, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_HiddenCountByName = __Value;
        return;
    }
}

struct FPresentationHiddenComponentData
{
    UPROPERTY()
    bool bHidden = false;
    UPROPERTY()
    bool bUpdated = false;


}

struct FC_PresentationHiddenComponents : FECSComponent
{
    UPROPERTY()
    TArray<FName> NewHiddenCompName;
    UPROPERTY()
    TArray<FName> NewUnHiddenCompName;
    UPROPERTY()
    TArray<FName> NewResetDefaultCompName;
    UPROPERTY()
    TArray<FName> HiddenCompName;
    UPROPERTY()
    TArray<FName> UnHiddenCompName;
    UPROPERTY()
    int DeferFramesLeft = -1;


}

struct FC_PresentationHiddenComponentsUpdateTag : FECSComponent
{
    FC_PresentationHiddenComponentsUpdateTag()
    {
        return;
    }
}

namespace ECSFunc_FC_CompHidden
{
UFUNCTION()
bool HasCompHidden(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CompHidden);
}
FC_CompHidden& AssignCompHidden(const FECSEntity &inout Entity, const FC_CompHidden &inout DefaultValue = FC_CompHidden())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CompHidden, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCompHidden_BP(const FECSEntity &inout Entity, const FC_CompHidden &inout DefaultValue = FC_CompHidden())
{
    ECSFunc_FC_CompHidden::AssignCompHidden(Entity, DefaultValue);
    return;
}
FC_CompHidden& ModifyCompHidden(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CompHidden));
    return local_12.GetComp();
}
FC_CompHidden& ModifyOrAddCompHidden(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CompHidden));
    return local_12.GetComp();
}
const FC_CompHidden& GetCompHidden(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CompHidden));
    return local_12.GetComp();
}
UFUNCTION()
FC_CompHidden GetCompHidden_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CompHidden& local_4 = ECSFunc_FC_CompHidden::GetCompHidden(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CompHidden();
}
const FC_CompHidden GetDefaultedCompHidden(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CompHidden __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CompHidden);
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
FC_CompHidden GetDefaultedCompHidden_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CompHidden::GetDefaultedCompHidden(Entity);
}
UFUNCTION()
bool RemoveCompHidden(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CompHidden);
}
}
FECSMonitorRuntimeView __GetMonitorCompHiddenOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CompHidden, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompHiddenOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CompHidden, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompHiddenOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CompHidden, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompHiddenOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CompHidden, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompHiddenOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CompHidden, bFixedFrame, bMustHandleAll);
}
void __MonitorCompHiddenLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CompHidden, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCompHiddenActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CompHidden, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCompHiddenModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CompHidden, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PresentationHiddenComponents
{
UFUNCTION()
bool HasPresentationHiddenComponents(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponents);
}
FC_PresentationHiddenComponents& AssignPresentationHiddenComponents(const FECSEntity &inout Entity, const FC_PresentationHiddenComponents &inout DefaultValue = FC_PresentationHiddenComponents())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponents, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationHiddenComponents_BP(const FECSEntity &inout Entity, const FC_PresentationHiddenComponents &inout DefaultValue = FC_PresentationHiddenComponents())
{
    ECSFunc_FC_PresentationHiddenComponents::AssignPresentationHiddenComponents(Entity, DefaultValue);
    return;
}
FC_PresentationHiddenComponents& ModifyPresentationHiddenComponents(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponents));
    return local_12.GetComp();
}
FC_PresentationHiddenComponents& ModifyOrAddPresentationHiddenComponents(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponents));
    return local_12.GetComp();
}
const FC_PresentationHiddenComponents& GetPresentationHiddenComponents(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponents));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationHiddenComponents GetPresentationHiddenComponents_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PresentationHiddenComponents __r;
    bValid = false;
    bValid = ECSFunc_FC_PresentationHiddenComponents::GetPresentationHiddenComponents(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PresentationHiddenComponents GetDefaultedPresentationHiddenComponents(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationHiddenComponents __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponents);
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
FC_PresentationHiddenComponents GetDefaultedPresentationHiddenComponents_BP(const FECSEntity &inout Entity)
{
    FC_PresentationHiddenComponents __r;
    return __r;
}
UFUNCTION()
bool RemovePresentationHiddenComponents(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponents);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationHiddenComponentsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationHiddenComponents, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationHiddenComponentsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationHiddenComponents, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationHiddenComponentsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationHiddenComponents, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationHiddenComponentsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationHiddenComponents, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationHiddenComponentsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationHiddenComponents, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationHiddenComponentsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationHiddenComponents, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationHiddenComponentsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationHiddenComponents, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationHiddenComponentsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationHiddenComponents, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PresentationHiddenComponentsUpdateTag
{
UFUNCTION()
bool HasPresentationHiddenComponentsUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponentsUpdateTag);
}
FC_PresentationHiddenComponentsUpdateTag& AssignPresentationHiddenComponentsUpdateTag(const FECSEntity &inout Entity, const FC_PresentationHiddenComponentsUpdateTag &inout DefaultValue = FC_PresentationHiddenComponentsUpdateTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponentsUpdateTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationHiddenComponentsUpdateTag_BP(const FECSEntity &inout Entity, const FC_PresentationHiddenComponentsUpdateTag &inout DefaultValue = FC_PresentationHiddenComponentsUpdateTag())
{
    ECSFunc_FC_PresentationHiddenComponentsUpdateTag::AssignPresentationHiddenComponentsUpdateTag(Entity, DefaultValue);
    return;
}
FC_PresentationHiddenComponentsUpdateTag& ModifyPresentationHiddenComponentsUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponentsUpdateTag));
    return local_12.GetComp();
}
FC_PresentationHiddenComponentsUpdateTag& ModifyOrAddPresentationHiddenComponentsUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponentsUpdateTag));
    return local_12.GetComp();
}
const FC_PresentationHiddenComponentsUpdateTag& GetPresentationHiddenComponentsUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponentsUpdateTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationHiddenComponentsUpdateTag GetPresentationHiddenComponentsUpdateTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PresentationHiddenComponentsUpdateTag& local_4 = ECSFunc_FC_PresentationHiddenComponentsUpdateTag::GetPresentationHiddenComponentsUpdateTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PresentationHiddenComponentsUpdateTag();
}
const FC_PresentationHiddenComponentsUpdateTag GetDefaultedPresentationHiddenComponentsUpdateTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationHiddenComponentsUpdateTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponentsUpdateTag);
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
FC_PresentationHiddenComponentsUpdateTag GetDefaultedPresentationHiddenComponentsUpdateTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PresentationHiddenComponentsUpdateTag::GetDefaultedPresentationHiddenComponentsUpdateTag(Entity);
}
UFUNCTION()
bool RemovePresentationHiddenComponentsUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationHiddenComponentsUpdateTag);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationHiddenComponentsUpdateTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationHiddenComponentsUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationHiddenComponentsUpdateTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationHiddenComponentsUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationHiddenComponentsUpdateTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationHiddenComponentsUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationHiddenComponentsUpdateTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationHiddenComponentsUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationHiddenComponentsUpdateTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationHiddenComponentsUpdateTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationHiddenComponentsUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationHiddenComponentsUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationHiddenComponentsUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationHiddenComponentsUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationHiddenComponentsUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationHiddenComponentsUpdateTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CompHidden &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CompHidden &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CompHidden &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CompHidden
{
int __IndexOf_HiddenCountByName()
{
    return 0;
}
}
