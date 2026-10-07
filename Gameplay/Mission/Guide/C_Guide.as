
namespace __INTENRAL_FCS_GuideManager_NS
{
    const TECSComponentDerivedPtr<FCS_GuideManager> DerivedPtr = TECSComponentDerivedPtr<FCS_GuideManager>();
    const FCS_GuideManager DefaultValue = FCS_GuideManager();
}
namespace __INTENRAL_FC_PendingGuideList_NS
{
    const TECSComponentDerivedPtr<FC_PendingGuideList> DerivedPtr = TECSComponentDerivedPtr<FC_PendingGuideList>();
    const FC_PendingGuideList DefaultValue = FC_PendingGuideList();
}
namespace __INTENRAL_FC_DeferredGuideList_NS
{
    const TECSComponentDerivedPtr<FC_DeferredGuideList> DerivedPtr = TECSComponentDerivedPtr<FC_DeferredGuideList>();
    const FC_DeferredGuideList DefaultValue = FC_DeferredGuideList();
}
namespace __INTENRAL_FC_GuidingInfoList_NS
{
    const TECSComponentDerivedPtr<FC_GuidingInfoList> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingInfoList>();
    const FC_GuidingInfoList DefaultValue = FC_GuidingInfoList();

}
struct FGuideRuntimeInfoContainer
{
    UPROPERTY()
    TArray<FECSEntity> Requesters;

    FGuideRuntimeInfoContainer()
    {
        return;
    }
}

struct FCS_GuideManager : FECSSingleton
{
    UPROPERTY()
    TMap<uint, FGuideRuntimeInfoContainer> GuideInfoMap;

    FCS_GuideManager()
    {
        return;
    }
}

struct FC_PendingGuideList : FECSComponent
{
    UPROPERTY()
    TMap<uint, FGuideContext> GuideToStart;
    UPROPERTY()
    TMap<uint, FInstancedStruct> GuideToStop;

    FC_PendingGuideList()
    {
        return;
    }
}

struct FC_DeferredGuideList : FECSComponent
{
    UPROPERTY()
    TMap<uint, FGuideContext> DeferredGuides;

    FC_DeferredGuideList()
    {
        return;
    }
}

struct FC_GuidingInfoList : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<uint, FGuideContext> m_GuideInfoMap;

    FC_GuidingInfoList()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_GuidingInfoList(const FC_GuidingInfoList &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_GuideInfoMap = Other.m_GuideInfoMap;
        return;
    }
    FC_GuidingInfoList opAssign(const FC_GuidingInfoList &inout Other)
    {
        FC_GuidingInfoList __r;
        this.SetGuideInfoMap(Other.GetGuideInfoMap());
        return __r;
    }
    const TMap<uint, FGuideContext> GetGuideInfoMap() const property
    {
        const TMap<uint, FGuideContext> __r;
        return __r;
    }
    TMap<uint, FGuideContext> GetModify_GuideInfoMap() property
    {
        TMap<uint, FGuideContext> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetGuideInfoMap(const TMap<uint, FGuideContext> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_GuideInfoMap = __Value;
        return;
    }
}

namespace ECSFunc_FCS_GuideManager
{
UFUNCTION()
bool HasGuideManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GuideManager);
}
FCS_GuideManager& AssignGuideManager(const FECSWorldPtr &inout World, const FCS_GuideManager &inout DefaultValue = FCS_GuideManager())
{
    UScriptStruct local_6 = FCS_GuideManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGuideManager_BP(const FECSWorldPtr &inout World, const FCS_GuideManager &inout DefaultValue = FCS_GuideManager())
{
    ECSFunc_FCS_GuideManager::AssignGuideManager(World, DefaultValue);
    return;
}
FCS_GuideManager& ModifyGuideManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GuideManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GuideManager& ModifyOrAddGuideManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GuideManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GuideManager& GetGuideManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GuideManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GuideManager GetGuideManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_GuideManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_GuideManager::GetGuideManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_GuideManager GetDefaultedGuideManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GuideManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GuideManager);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_GuideManager GetDefaultedGuideManager_BP(const FECSWorldPtr &inout World)
{
    FCS_GuideManager __r;
    return __r;
}
UFUNCTION()
bool RemoveGuideManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GuideManager);
}
}
void __MonitorGuideManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GuideManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuideManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GuideManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuideManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GuideManager, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PendingGuideList
{
UFUNCTION()
bool HasPendingGuideList(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PendingGuideList);
}
FC_PendingGuideList& AssignPendingGuideList(const FECSEntity &inout Entity, const FC_PendingGuideList &inout DefaultValue = FC_PendingGuideList())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PendingGuideList, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPendingGuideList_BP(const FECSEntity &inout Entity, const FC_PendingGuideList &inout DefaultValue = FC_PendingGuideList())
{
    ECSFunc_FC_PendingGuideList::AssignPendingGuideList(Entity, DefaultValue);
    return;
}
FC_PendingGuideList& ModifyPendingGuideList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PendingGuideList));
    return local_12.GetComp();
}
FC_PendingGuideList& ModifyOrAddPendingGuideList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PendingGuideList));
    return local_12.GetComp();
}
const FC_PendingGuideList& GetPendingGuideList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PendingGuideList));
    return local_12.GetComp();
}
UFUNCTION()
FC_PendingGuideList GetPendingGuideList_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PendingGuideList __r;
    bValid = false;
    bValid = ECSFunc_FC_PendingGuideList::GetPendingGuideList(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PendingGuideList GetDefaultedPendingGuideList(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PendingGuideList __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PendingGuideList);
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
FC_PendingGuideList GetDefaultedPendingGuideList_BP(const FECSEntity &inout Entity)
{
    FC_PendingGuideList __r;
    return __r;
}
UFUNCTION()
bool RemovePendingGuideList(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PendingGuideList);
}
}
FECSMonitorRuntimeView __GetMonitorPendingGuideListOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PendingGuideList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingGuideListOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PendingGuideList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingGuideListOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PendingGuideList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingGuideListOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PendingGuideList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingGuideListOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PendingGuideList, bFixedFrame, bMustHandleAll);
}
void __MonitorPendingGuideListLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PendingGuideList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingGuideListActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PendingGuideList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingGuideListModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PendingGuideList, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DeferredGuideList
{
UFUNCTION()
bool HasDeferredGuideList(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DeferredGuideList);
}
FC_DeferredGuideList& AssignDeferredGuideList(const FECSEntity &inout Entity, const FC_DeferredGuideList &inout DefaultValue = FC_DeferredGuideList())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DeferredGuideList, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDeferredGuideList_BP(const FECSEntity &inout Entity, const FC_DeferredGuideList &inout DefaultValue = FC_DeferredGuideList())
{
    ECSFunc_FC_DeferredGuideList::AssignDeferredGuideList(Entity, DefaultValue);
    return;
}
FC_DeferredGuideList& ModifyDeferredGuideList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DeferredGuideList));
    return local_12.GetComp();
}
FC_DeferredGuideList& ModifyOrAddDeferredGuideList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DeferredGuideList));
    return local_12.GetComp();
}
const FC_DeferredGuideList& GetDeferredGuideList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DeferredGuideList));
    return local_12.GetComp();
}
UFUNCTION()
FC_DeferredGuideList GetDeferredGuideList_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DeferredGuideList __r;
    bValid = false;
    bValid = ECSFunc_FC_DeferredGuideList::GetDeferredGuideList(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DeferredGuideList GetDefaultedDeferredGuideList(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DeferredGuideList __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DeferredGuideList);
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
FC_DeferredGuideList GetDefaultedDeferredGuideList_BP(const FECSEntity &inout Entity)
{
    FC_DeferredGuideList __r;
    return __r;
}
UFUNCTION()
bool RemoveDeferredGuideList(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DeferredGuideList);
}
}
FECSMonitorRuntimeView __GetMonitorDeferredGuideListOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DeferredGuideList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeferredGuideListOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DeferredGuideList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeferredGuideListOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DeferredGuideList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeferredGuideListOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DeferredGuideList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeferredGuideListOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DeferredGuideList, bFixedFrame, bMustHandleAll);
}
void __MonitorDeferredGuideListLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DeferredGuideList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeferredGuideListActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DeferredGuideList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeferredGuideListModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DeferredGuideList, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GuidingInfoList
{
UFUNCTION()
bool HasGuidingInfoList(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingInfoList);
}
FC_GuidingInfoList& AssignGuidingInfoList(const FECSEntity &inout Entity, const FC_GuidingInfoList &inout DefaultValue = FC_GuidingInfoList())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingInfoList, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingInfoList_BP(const FECSEntity &inout Entity, const FC_GuidingInfoList &inout DefaultValue = FC_GuidingInfoList())
{
    ECSFunc_FC_GuidingInfoList::AssignGuidingInfoList(Entity, DefaultValue);
    return;
}
FC_GuidingInfoList& ModifyGuidingInfoList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingInfoList));
    return local_12.GetComp();
}
FC_GuidingInfoList& ModifyOrAddGuidingInfoList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingInfoList));
    return local_12.GetComp();
}
const FC_GuidingInfoList& GetGuidingInfoList(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingInfoList));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingInfoList GetGuidingInfoList_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GuidingInfoList& local_4 = ECSFunc_FC_GuidingInfoList::GetGuidingInfoList(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GuidingInfoList();
}
const FC_GuidingInfoList GetDefaultedGuidingInfoList(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingInfoList __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingInfoList);
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
FC_GuidingInfoList GetDefaultedGuidingInfoList_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GuidingInfoList::GetDefaultedGuidingInfoList(Entity);
}
UFUNCTION()
bool RemoveGuidingInfoList(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingInfoList);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingInfoListOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingInfoList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingInfoListOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingInfoList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingInfoListOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingInfoList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingInfoListOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingInfoList, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingInfoListOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingInfoList, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingInfoListLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingInfoList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingInfoListActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingInfoList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingInfoListModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingInfoList, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_GuidingInfoList &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_GuidingInfoList &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_GuidingInfoList &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_GuidingInfoList
{
int __IndexOf_GuideInfoMap()
{
    return 0;
}
}
