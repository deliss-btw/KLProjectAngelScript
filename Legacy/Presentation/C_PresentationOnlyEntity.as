
namespace __INTENRAL_FC_PresentationOnlyEntityTag_NS
{
    const TECSComponentDerivedPtr<FC_PresentationOnlyEntityTag> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationOnlyEntityTag>();
    const FC_PresentationOnlyEntityTag DefaultValue = FC_PresentationOnlyEntityTag();
}
namespace __INTENRAL_FC_PresentationOnlyEntityInitTag_NS
{
    const TECSComponentDerivedPtr<FC_PresentationOnlyEntityInitTag> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationOnlyEntityInitTag>();
    const FC_PresentationOnlyEntityInitTag DefaultValue = FC_PresentationOnlyEntityInitTag();
}
namespace __INTENRAL_FC_PresentationOnlyEntityInitData_NS
{
    const TECSComponentDerivedPtr<FC_PresentationOnlyEntityInitData> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationOnlyEntityInitData>();
    const FC_PresentationOnlyEntityInitData DefaultValue = FC_PresentationOnlyEntityInitData();

}
struct FC_PresentationOnlyEntityTag : FECSComponent
{
    FC_PresentationOnlyEntityTag()
    {
        return;
    }
}

struct FC_PresentationOnlyEntityInitTag : FECSComponent
{
    FC_PresentationOnlyEntityInitTag()
    {
        return;
    }
}

struct FC_PresentationOnlyEntityInitData : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_ParentEntity;
    UPROPERTY()
    ESpawnPresentationEntityPosType m_SpawnPositionType;
    UPROPERTY()
    FName m_SocketName;
    UPROPERTY()
    FVector m_PositionOffset;
    UPROPERTY()
    ESpawnPresentationEntityRotType m_SpawnRotationType;
    UPROPERTY()
    FRotator3f m_RotationOffset;

    FC_PresentationOnlyEntityInitData()
    {
        this.m_SpawnPositionType = ESpawnPresentationEntityPosType(0);
        this.m_SpawnRotationType = ESpawnPresentationEntityRotType(0);
        this.m_SocketName = NAME_None;
        this.__InitDirtyFlags();
        return;
    }
    FC_PresentationOnlyEntityInitData(const FC_PresentationOnlyEntityInitData &inout Other)
    {
        this.m_SpawnPositionType = ESpawnPresentationEntityPosType(0);
        this.m_SpawnRotationType = ESpawnPresentationEntityRotType(0);
        this.m_SocketName = NAME_None;
        this.__InitDirtyFlags();
        this.m_ParentEntity = Other.m_ParentEntity;
        this.m_SpawnPositionType = Other.m_SpawnPositionType;
        this.m_SocketName = Other.m_SocketName;
        this.m_PositionOffset = Other.m_PositionOffset;
        this.m_SpawnRotationType = Other.m_SpawnRotationType;
        this.m_RotationOffset = Other.m_RotationOffset;
        return;
    }
    FC_PresentationOnlyEntityInitData opAssign(const FC_PresentationOnlyEntityInitData &inout Other)
    {
        FC_PresentationOnlyEntityInitData __r;
        this.SetParentEntity(Other.GetParentEntity());
        this.SetSpawnPositionType(Other.GetSpawnPositionType());
        this.SetSocketName(Other.GetSocketName());
        this.SetPositionOffset(Other.GetPositionOffset());
        this.SetSpawnRotationType(Other.GetSpawnRotationType());
        this.SetRotationOffset(Other.GetRotationOffset());
        return __r;
    }
    const FECSEntity GetParentEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_ParentEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetParentEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ParentEntity = __Value;
        return;
    }
    ESpawnPresentationEntityPosType GetSpawnPositionType() const property
    {
        return this.m_SpawnPositionType;
    }
    void SetSpawnPositionType(const ESpawnPresentationEntityPosType __Value) property
    {
        if (int(this.m_SpawnPositionType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SpawnPositionType = __Value;
        return;
    }
    FName GetSocketName() const property
    {
        return this.m_SocketName;
    }
    void SetSocketName(const FName &inout __Value) property
    {
        if ((this.m_SocketName == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_SocketName = __Value;
        return;
    }
    FVector GetPositionOffset() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_PositionOffset() property
    {
        FVector __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetPositionOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_PositionOffset = __Value;
        return;
    }
    ESpawnPresentationEntityRotType GetSpawnRotationType() const property
    {
        return this.m_SpawnRotationType;
    }
    void SetSpawnRotationType(const ESpawnPresentationEntityRotType __Value) property
    {
        if (int(this.m_SpawnRotationType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_SpawnRotationType = __Value;
        return;
    }
    const FRotator3f GetRotationOffset() const property
    {
        const FRotator3f __r;
        return __r;
    }
    FRotator3f GetModify_RotationOffset() property
    {
        FRotator3f __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetRotationOffset(const FRotator3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_RotationOffset = __Value;
        return;
    }
}

namespace ECSFunc_FC_PresentationOnlyEntityTag
{
UFUNCTION()
bool HasPresentationOnlyEntityTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityTag);
}
FC_PresentationOnlyEntityTag& AssignPresentationOnlyEntityTag(const FECSEntity &inout Entity, const FC_PresentationOnlyEntityTag &inout DefaultValue = FC_PresentationOnlyEntityTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationOnlyEntityTag_BP(const FECSEntity &inout Entity, const FC_PresentationOnlyEntityTag &inout DefaultValue = FC_PresentationOnlyEntityTag())
{
    ECSFunc_FC_PresentationOnlyEntityTag::AssignPresentationOnlyEntityTag(Entity, DefaultValue);
    return;
}
FC_PresentationOnlyEntityTag& ModifyPresentationOnlyEntityTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityTag));
    return local_12.GetComp();
}
FC_PresentationOnlyEntityTag& ModifyOrAddPresentationOnlyEntityTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityTag));
    return local_12.GetComp();
}
const FC_PresentationOnlyEntityTag& GetPresentationOnlyEntityTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationOnlyEntityTag GetPresentationOnlyEntityTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PresentationOnlyEntityTag& local_4 = ECSFunc_FC_PresentationOnlyEntityTag::GetPresentationOnlyEntityTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PresentationOnlyEntityTag();
}
const FC_PresentationOnlyEntityTag GetDefaultedPresentationOnlyEntityTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationOnlyEntityTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityTag);
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
FC_PresentationOnlyEntityTag GetDefaultedPresentationOnlyEntityTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PresentationOnlyEntityTag::GetDefaultedPresentationOnlyEntityTag(Entity);
}
UFUNCTION()
bool RemovePresentationOnlyEntityTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityTag);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationOnlyEntityTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationOnlyEntityTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationOnlyEntityTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationOnlyEntityTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationOnlyEntityTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationOnlyEntityTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationOnlyEntityTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationOnlyEntityTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationOnlyEntityTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationOnlyEntityTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationOnlyEntityTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PresentationOnlyEntityInitTag
{
UFUNCTION()
bool HasPresentationOnlyEntityInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitTag);
}
FC_PresentationOnlyEntityInitTag& AssignPresentationOnlyEntityInitTag(const FECSEntity &inout Entity, const FC_PresentationOnlyEntityInitTag &inout DefaultValue = FC_PresentationOnlyEntityInitTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationOnlyEntityInitTag_BP(const FECSEntity &inout Entity, const FC_PresentationOnlyEntityInitTag &inout DefaultValue = FC_PresentationOnlyEntityInitTag())
{
    ECSFunc_FC_PresentationOnlyEntityInitTag::AssignPresentationOnlyEntityInitTag(Entity, DefaultValue);
    return;
}
FC_PresentationOnlyEntityInitTag& ModifyPresentationOnlyEntityInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitTag));
    return local_12.GetComp();
}
FC_PresentationOnlyEntityInitTag& ModifyOrAddPresentationOnlyEntityInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitTag));
    return local_12.GetComp();
}
const FC_PresentationOnlyEntityInitTag& GetPresentationOnlyEntityInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationOnlyEntityInitTag GetPresentationOnlyEntityInitTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PresentationOnlyEntityInitTag& local_4 = ECSFunc_FC_PresentationOnlyEntityInitTag::GetPresentationOnlyEntityInitTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PresentationOnlyEntityInitTag();
}
const FC_PresentationOnlyEntityInitTag GetDefaultedPresentationOnlyEntityInitTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationOnlyEntityInitTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitTag);
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
FC_PresentationOnlyEntityInitTag GetDefaultedPresentationOnlyEntityInitTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PresentationOnlyEntityInitTag::GetDefaultedPresentationOnlyEntityInitTag(Entity);
}
UFUNCTION()
bool RemovePresentationOnlyEntityInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitTag);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityInitTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationOnlyEntityInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityInitTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationOnlyEntityInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityInitTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationOnlyEntityInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityInitTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationOnlyEntityInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityInitTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationOnlyEntityInitTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationOnlyEntityInitTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationOnlyEntityInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationOnlyEntityInitTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationOnlyEntityInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationOnlyEntityInitTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationOnlyEntityInitTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PresentationOnlyEntityInitData
{
UFUNCTION()
bool HasPresentationOnlyEntityInitData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitData);
}
FC_PresentationOnlyEntityInitData& AssignPresentationOnlyEntityInitData(const FECSEntity &inout Entity, const FC_PresentationOnlyEntityInitData &inout DefaultValue = FC_PresentationOnlyEntityInitData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationOnlyEntityInitData_BP(const FECSEntity &inout Entity, const FC_PresentationOnlyEntityInitData &inout DefaultValue = FC_PresentationOnlyEntityInitData())
{
    ECSFunc_FC_PresentationOnlyEntityInitData::AssignPresentationOnlyEntityInitData(Entity, DefaultValue);
    return;
}
FC_PresentationOnlyEntityInitData& ModifyPresentationOnlyEntityInitData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitData));
    return local_12.GetComp();
}
FC_PresentationOnlyEntityInitData& ModifyOrAddPresentationOnlyEntityInitData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitData));
    return local_12.GetComp();
}
const FC_PresentationOnlyEntityInitData& GetPresentationOnlyEntityInitData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitData));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationOnlyEntityInitData GetPresentationOnlyEntityInitData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PresentationOnlyEntityInitData& local_4 = ECSFunc_FC_PresentationOnlyEntityInitData::GetPresentationOnlyEntityInitData(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PresentationOnlyEntityInitData();
}
const FC_PresentationOnlyEntityInitData GetDefaultedPresentationOnlyEntityInitData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationOnlyEntityInitData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitData);
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
FC_PresentationOnlyEntityInitData GetDefaultedPresentationOnlyEntityInitData_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PresentationOnlyEntityInitData::GetDefaultedPresentationOnlyEntityInitData(Entity);
}
UFUNCTION()
bool RemovePresentationOnlyEntityInitData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationOnlyEntityInitData);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityInitDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationOnlyEntityInitData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityInitDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationOnlyEntityInitData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityInitDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationOnlyEntityInitData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityInitDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationOnlyEntityInitData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationOnlyEntityInitDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationOnlyEntityInitData, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationOnlyEntityInitDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationOnlyEntityInitData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationOnlyEntityInitDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationOnlyEntityInitData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationOnlyEntityInitDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationOnlyEntityInitData, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PresentationOnlyEntityInitData &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PresentationOnlyEntityInitData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PresentationOnlyEntityInitData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PresentationOnlyEntityInitData
{
int __IndexOf_ParentEntity()
{
    return 0;
}
int __IndexOf_SpawnPositionType()
{
    return 1;
}
int __IndexOf_SocketName()
{
    return 2;
}
int __IndexOf_PositionOffset()
{
    return 3;
}
int __IndexOf_SpawnRotationType()
{
    return 4;
}
int __IndexOf_RotationOffset()
{
    return 5;
}
}
