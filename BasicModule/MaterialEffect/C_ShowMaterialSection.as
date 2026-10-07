
namespace __INTENRAL_FC_SyncShowMaterialSectionRequests_NS
{
    const TECSComponentDerivedPtr<FC_SyncShowMaterialSectionRequests> DerivedPtr = TECSComponentDerivedPtr<FC_SyncShowMaterialSectionRequests>();
    const FC_SyncShowMaterialSectionRequests DefaultValue = FC_SyncShowMaterialSectionRequests();
}
namespace __INTENRAL_FC_UpdateShowMaterialSectionTag_NS
{
    const TECSComponentDerivedPtr<FC_UpdateShowMaterialSectionTag> DerivedPtr = TECSComponentDerivedPtr<FC_UpdateShowMaterialSectionTag>();
    const FC_UpdateShowMaterialSectionTag DefaultValue = FC_UpdateShowMaterialSectionTag();
}
namespace __INTENRAL_FC_BackupShowMaterialSection_NS
{
    const TECSComponentDerivedPtr<FC_BackupShowMaterialSection> DerivedPtr = TECSComponentDerivedPtr<FC_BackupShowMaterialSection>();
    const FC_BackupShowMaterialSection DefaultValue = FC_BackupShowMaterialSection();

}
struct FMaterialSlotOrIndex
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bUseSlotName;
    UPROPERTY()
    int m_MaterialIndex;
    UPROPERTY()
    FName m_MaterialSlotName;

    FMaterialSlotOrIndex()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FMaterialSlotOrIndex(const FMaterialSlotOrIndex &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FMaterialSlotOrIndex opAssign(const FMaterialSlotOrIndex &inout Other)
    {
        FMaterialSlotOrIndex __r;
        this.SetbUseSlotName(Other.GetbUseSlotName());
        this.SetMaterialIndex(Other.GetMaterialIndex());
        this.SetMaterialSlotName(Other.GetMaterialSlotName());
        return __r;
    }
    bool GetbUseSlotName() const property
    {
        return this.m_bUseSlotName;
    }
    void SetbUseSlotName(const bool __Value) property
    {
        if (!(this.m_bUseSlotName) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bUseSlotName = __Value;
        return;
    }
    int GetMaterialIndex() const property
    {
        return this.m_MaterialIndex;
    }
    void SetMaterialIndex(const int __Value) property
    {
        if (this.m_MaterialIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MaterialIndex = __Value;
        return;
    }
    FName GetMaterialSlotName() const property
    {
        return this.m_MaterialSlotName;
    }
    void SetMaterialSlotName(const FName &inout __Value) property
    {
        if ((this.m_MaterialSlotName == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_MaterialSlotName = __Value;
        return;
    }
}

struct FShowMaterialSectionSingleRequest
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_MeshName = n"ViewMesh";
    UPROPERTY()
    TArray<FMaterialSlotOrIndex> m_Materials;
    UPROPERTY()
    bool m_bShouldShow = false;

    FShowMaterialSectionSingleRequest(const FShowMaterialSectionSingleRequest &inout Other)
    {
        this.m_MeshName = Other.m_MeshName;
        this.m_Materials = Other.m_Materials;
        this.m_bShouldShow = Other.m_bShouldShow;
        return;
    }
    FShowMaterialSectionSingleRequest opAssign(const FShowMaterialSectionSingleRequest &inout Other)
    {
        FShowMaterialSectionSingleRequest __r;
        this.SetMeshName(Other.GetMeshName());
        this.SetMaterials(Other.GetMaterials());
        this.SetbShouldShow(Other.GetbShouldShow());
        return __r;
    }
    FName GetMeshName() const property
    {
        return this.m_MeshName;
    }
    void SetMeshName(const FName &inout __Value) property
    {
        if ((this.m_MeshName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MeshName = __Value;
        return;
    }
    const TArray<FMaterialSlotOrIndex> GetMaterials() const property
    {
        const TArray<FMaterialSlotOrIndex> __r;
        return __r;
    }
    TArray<FMaterialSlotOrIndex> GetModify_Materials() property
    {
        TArray<FMaterialSlotOrIndex> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetMaterials(const TArray<FMaterialSlotOrIndex> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Materials = __Value;
        return;
    }
    bool GetbShouldShow() const property
    {
        return this.m_bShouldShow;
    }
    void SetbShouldShow(const bool __Value) property
    {
        if (!(this.m_bShouldShow) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bShouldShow = __Value;
        return;
    }
}

struct FShowMaterialSectionRequest
{
    UPROPERTY()
    FName m_RequestName;
    UPROPERTY()
    TArray<FShowMaterialSectionSingleRequest> m_Sections;

    FShowMaterialSectionRequest()
    {
        return;
    }
    FName GetRequestName() const property
    {
        return this;
    }
    void SetRequestName(const FName &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const TArray<FShowMaterialSectionSingleRequest> GetSections() const property
    {
        const TArray<FShowMaterialSectionSingleRequest> __r;
        return __r;
    }
    TArray<FShowMaterialSectionSingleRequest> GetSections() property
    {
        TArray<FShowMaterialSectionSingleRequest> __r;
        return __r;
    }
    void SetSections(const TArray<FShowMaterialSectionSingleRequest> &inout __Value) property
    {
        this.m_Sections = __Value;
        return;
    }
}

struct FC_SyncShowMaterialSectionRequests : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FShowMaterialSectionRequest> m_Requests;

    FC_SyncShowMaterialSectionRequests()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SyncShowMaterialSectionRequests(const FC_SyncShowMaterialSectionRequests &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Requests = Other.m_Requests;
        return;
    }
    FC_SyncShowMaterialSectionRequests opAssign(const FC_SyncShowMaterialSectionRequests &inout Other)
    {
        FC_SyncShowMaterialSectionRequests __r;
        this.SetRequests(Other.GetRequests());
        return __r;
    }
    const TArray<FShowMaterialSectionRequest> GetRequests() const property
    {
        const TArray<FShowMaterialSectionRequest> __r;
        return __r;
    }
    TArray<FShowMaterialSectionRequest> GetModify_Requests() property
    {
        TArray<FShowMaterialSectionRequest> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRequests(const TArray<FShowMaterialSectionRequest> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Requests = __Value;
        return;
    }
}

struct FC_UpdateShowMaterialSectionTag : FECSComponent
{
    FC_UpdateShowMaterialSectionTag()
    {
        return;
    }
}

struct FSingleShowMaterialSection
{
    UPROPERTY()
    FName MeshName;
    UPROPERTY()
    int MaterialIdx;
    UPROPERTY()
    bool bShouldShow = true;


}

struct FC_BackupShowMaterialSection : FECSComponent
{
    UPROPERTY()
    TArray<FSingleShowMaterialSection> Materials;

    FC_BackupShowMaterialSection()
    {
        return;
    }
    int GetMaterialBackupIndex(const FName &inout MeshName, const int MaterialIndex) const
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            if ((FName(this[local_1].MeshName) == MeshName) && (this[local_1].MaterialIdx == MaterialIndex))
            {
                return local_1;
            }
        }
        return -1;
    }
}

namespace ECSFunc_FC_SyncShowMaterialSectionRequests
{
UFUNCTION()
bool HasSyncShowMaterialSectionRequests(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SyncShowMaterialSectionRequests);
}
FC_SyncShowMaterialSectionRequests& AssignSyncShowMaterialSectionRequests(const FECSEntity &inout Entity, const FC_SyncShowMaterialSectionRequests &inout DefaultValue = FC_SyncShowMaterialSectionRequests())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SyncShowMaterialSectionRequests, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSyncShowMaterialSectionRequests_BP(const FECSEntity &inout Entity, const FC_SyncShowMaterialSectionRequests &inout DefaultValue = FC_SyncShowMaterialSectionRequests())
{
    ECSFunc_FC_SyncShowMaterialSectionRequests::AssignSyncShowMaterialSectionRequests(Entity, DefaultValue);
    return;
}
FC_SyncShowMaterialSectionRequests& ModifySyncShowMaterialSectionRequests(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SyncShowMaterialSectionRequests));
    return local_12.GetComp();
}
FC_SyncShowMaterialSectionRequests& ModifyOrAddSyncShowMaterialSectionRequests(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SyncShowMaterialSectionRequests));
    return local_12.GetComp();
}
const FC_SyncShowMaterialSectionRequests& GetSyncShowMaterialSectionRequests(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SyncShowMaterialSectionRequests));
    return local_12.GetComp();
}
UFUNCTION()
FC_SyncShowMaterialSectionRequests GetSyncShowMaterialSectionRequests_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SyncShowMaterialSectionRequests& local_4 = ECSFunc_FC_SyncShowMaterialSectionRequests::GetSyncShowMaterialSectionRequests(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SyncShowMaterialSectionRequests();
}
const FC_SyncShowMaterialSectionRequests GetDefaultedSyncShowMaterialSectionRequests(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SyncShowMaterialSectionRequests __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SyncShowMaterialSectionRequests);
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
FC_SyncShowMaterialSectionRequests GetDefaultedSyncShowMaterialSectionRequests_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SyncShowMaterialSectionRequests::GetDefaultedSyncShowMaterialSectionRequests(Entity);
}
UFUNCTION()
bool RemoveSyncShowMaterialSectionRequests(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SyncShowMaterialSectionRequests);
}
}
FECSMonitorRuntimeView __GetMonitorSyncShowMaterialSectionRequestsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SyncShowMaterialSectionRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncShowMaterialSectionRequestsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SyncShowMaterialSectionRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncShowMaterialSectionRequestsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SyncShowMaterialSectionRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncShowMaterialSectionRequestsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SyncShowMaterialSectionRequests, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncShowMaterialSectionRequestsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SyncShowMaterialSectionRequests, bFixedFrame, bMustHandleAll);
}
void __MonitorSyncShowMaterialSectionRequestsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SyncShowMaterialSectionRequests, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncShowMaterialSectionRequestsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SyncShowMaterialSectionRequests, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncShowMaterialSectionRequestsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SyncShowMaterialSectionRequests, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_UpdateShowMaterialSectionTag
{
UFUNCTION()
bool HasUpdateShowMaterialSectionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_UpdateShowMaterialSectionTag);
}
FC_UpdateShowMaterialSectionTag& AssignUpdateShowMaterialSectionTag(const FECSEntity &inout Entity, const FC_UpdateShowMaterialSectionTag &inout DefaultValue = FC_UpdateShowMaterialSectionTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_UpdateShowMaterialSectionTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignUpdateShowMaterialSectionTag_BP(const FECSEntity &inout Entity, const FC_UpdateShowMaterialSectionTag &inout DefaultValue = FC_UpdateShowMaterialSectionTag())
{
    ECSFunc_FC_UpdateShowMaterialSectionTag::AssignUpdateShowMaterialSectionTag(Entity, DefaultValue);
    return;
}
FC_UpdateShowMaterialSectionTag& ModifyUpdateShowMaterialSectionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_UpdateShowMaterialSectionTag));
    return local_12.GetComp();
}
FC_UpdateShowMaterialSectionTag& ModifyOrAddUpdateShowMaterialSectionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_UpdateShowMaterialSectionTag));
    return local_12.GetComp();
}
const FC_UpdateShowMaterialSectionTag& GetUpdateShowMaterialSectionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_UpdateShowMaterialSectionTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_UpdateShowMaterialSectionTag GetUpdateShowMaterialSectionTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_UpdateShowMaterialSectionTag& local_4 = ECSFunc_FC_UpdateShowMaterialSectionTag::GetUpdateShowMaterialSectionTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_UpdateShowMaterialSectionTag();
}
const FC_UpdateShowMaterialSectionTag GetDefaultedUpdateShowMaterialSectionTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_UpdateShowMaterialSectionTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_UpdateShowMaterialSectionTag);
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
FC_UpdateShowMaterialSectionTag GetDefaultedUpdateShowMaterialSectionTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_UpdateShowMaterialSectionTag::GetDefaultedUpdateShowMaterialSectionTag(Entity);
}
UFUNCTION()
bool RemoveUpdateShowMaterialSectionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_UpdateShowMaterialSectionTag);
}
}
FECSMonitorRuntimeView __GetMonitorUpdateShowMaterialSectionTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_UpdateShowMaterialSectionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateShowMaterialSectionTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_UpdateShowMaterialSectionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateShowMaterialSectionTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_UpdateShowMaterialSectionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateShowMaterialSectionTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_UpdateShowMaterialSectionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorUpdateShowMaterialSectionTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_UpdateShowMaterialSectionTag, bFixedFrame, bMustHandleAll);
}
void __MonitorUpdateShowMaterialSectionTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_UpdateShowMaterialSectionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorUpdateShowMaterialSectionTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_UpdateShowMaterialSectionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorUpdateShowMaterialSectionTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_UpdateShowMaterialSectionTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BackupShowMaterialSection
{
UFUNCTION()
bool HasBackupShowMaterialSection(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BackupShowMaterialSection);
}
FC_BackupShowMaterialSection& AssignBackupShowMaterialSection(const FECSEntity &inout Entity, const FC_BackupShowMaterialSection &inout DefaultValue = FC_BackupShowMaterialSection())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BackupShowMaterialSection, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBackupShowMaterialSection_BP(const FECSEntity &inout Entity, const FC_BackupShowMaterialSection &inout DefaultValue = FC_BackupShowMaterialSection())
{
    ECSFunc_FC_BackupShowMaterialSection::AssignBackupShowMaterialSection(Entity, DefaultValue);
    return;
}
FC_BackupShowMaterialSection& ModifyBackupShowMaterialSection(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BackupShowMaterialSection));
    return local_12.GetComp();
}
FC_BackupShowMaterialSection& ModifyOrAddBackupShowMaterialSection(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BackupShowMaterialSection));
    return local_12.GetComp();
}
const FC_BackupShowMaterialSection& GetBackupShowMaterialSection(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BackupShowMaterialSection));
    return local_12.GetComp();
}
UFUNCTION()
FC_BackupShowMaterialSection GetBackupShowMaterialSection_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BackupShowMaterialSection __r;
    bValid = false;
    bValid = ECSFunc_FC_BackupShowMaterialSection::GetBackupShowMaterialSection(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BackupShowMaterialSection GetDefaultedBackupShowMaterialSection(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BackupShowMaterialSection __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BackupShowMaterialSection);
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
FC_BackupShowMaterialSection GetDefaultedBackupShowMaterialSection_BP(const FECSEntity &inout Entity)
{
    FC_BackupShowMaterialSection __r;
    return __r;
}
UFUNCTION()
bool RemoveBackupShowMaterialSection(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BackupShowMaterialSection);
}
}
FECSMonitorRuntimeView __GetMonitorBackupShowMaterialSectionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BackupShowMaterialSection, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBackupShowMaterialSectionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BackupShowMaterialSection, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBackupShowMaterialSectionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BackupShowMaterialSection, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBackupShowMaterialSectionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BackupShowMaterialSection, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBackupShowMaterialSectionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BackupShowMaterialSection, bFixedFrame, bMustHandleAll);
}
void __MonitorBackupShowMaterialSectionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BackupShowMaterialSection, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBackupShowMaterialSectionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BackupShowMaterialSection, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBackupShowMaterialSectionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BackupShowMaterialSection, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FMaterialSlotOrIndex &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FMaterialSlotOrIndex &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FMaterialSlotOrIndex
{
int __IndexOf_bUseSlotName()
{
    return 0;
}
int __IndexOf_MaterialIndex()
{
    return 1;
}
int __IndexOf_MaterialSlotName()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FShowMaterialSectionSingleRequest &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FShowMaterialSectionSingleRequest &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FShowMaterialSectionSingleRequest
{
int __IndexOf_MeshName()
{
    return 0;
}
int __IndexOf_Materials()
{
    return 1;
}
int __IndexOf_bShouldShow()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SyncShowMaterialSectionRequests &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SyncShowMaterialSectionRequests &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SyncShowMaterialSectionRequests &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SyncShowMaterialSectionRequests
{
int __IndexOf_Requests()
{
    return 0;
}
}
