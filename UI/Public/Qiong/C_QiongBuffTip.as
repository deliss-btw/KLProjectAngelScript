
namespace __INTENRAL_FC_QiongBuffIndicator_NS
{
    const TECSComponentDerivedPtr<FC_QiongBuffIndicator> DerivedPtr = TECSComponentDerivedPtr<FC_QiongBuffIndicator>();
    const FC_QiongBuffIndicator DefaultValue = FC_QiongBuffIndicator();
}
namespace __INTENRAL_FC_QiongHiddenBuffTipTag_NS
{
    const TECSComponentDerivedPtr<FC_QiongHiddenBuffTipTag> DerivedPtr = TECSComponentDerivedPtr<FC_QiongHiddenBuffTipTag>();
    const FC_QiongHiddenBuffTipTag DefaultValue = FC_QiongHiddenBuffTipTag();
}
namespace __INTENRAL_FC_QiongBuffUIHandle_NS
{
    const TECSComponentDerivedPtr<FC_QiongBuffUIHandle> DerivedPtr = TECSComponentDerivedPtr<FC_QiongBuffUIHandle>();
    const FC_QiongBuffUIHandle DefaultValue = FC_QiongBuffUIHandle();

}
struct FC_QiongBuffIndicator : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_FromEntity;
    UPROPERTY()
    FBuffConfigRef m_BuffConfig;
    UPROPERTY()
    FVector m_Offset;

    FC_QiongBuffIndicator()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_QiongBuffIndicator(const FC_QiongBuffIndicator &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_FromEntity = Other.m_FromEntity;
        this.m_BuffConfig = Other.m_BuffConfig;
        this.m_Offset = Other.m_Offset;
        return;
    }
    FC_QiongBuffIndicator opAssign(const FC_QiongBuffIndicator &inout Other)
    {
        FC_QiongBuffIndicator __r;
        this.SetFromEntity(Other.GetFromEntity());
        this.SetBuffConfig(Other.GetBuffConfig());
        this.SetOffset(Other.GetOffset());
        return __r;
    }
    const FECSEntity GetFromEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_FromEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetFromEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FromEntity = __Value;
        return;
    }
    FBuffConfigRef GetBuffConfig() const property
    {
        FBuffConfigRef __r;
        return __r;
    }
    FBuffConfigRef GetModify_BuffConfig() property
    {
        FBuffConfigRef __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetBuffConfig(const FBuffConfigRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_BuffConfig = __Value;
        return;
    }
    const FVector GetOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_Offset() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Offset = __Value;
        return;
    }
}

struct FC_QiongHiddenBuffTipTag : FECSComponent
{
    FC_QiongHiddenBuffTipTag()
    {
        return;
    }
}

struct FC_QiongBuffUIHandle : FECSComponent
{
    UPROPERTY()
    FEUIWidgetRef Handle;

    FC_QiongBuffUIHandle()
    {
        return;
    }
}

namespace ECSFunc_FC_QiongBuffIndicator
{
UFUNCTION()
bool HasQiongBuffIndicator(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffIndicator);
}
FC_QiongBuffIndicator& AssignQiongBuffIndicator(const FECSEntity &inout Entity, const FC_QiongBuffIndicator &inout DefaultValue = FC_QiongBuffIndicator())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffIndicator, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignQiongBuffIndicator_BP(const FECSEntity &inout Entity, const FC_QiongBuffIndicator &inout DefaultValue = FC_QiongBuffIndicator())
{
    ECSFunc_FC_QiongBuffIndicator::AssignQiongBuffIndicator(Entity, DefaultValue);
    return;
}
FC_QiongBuffIndicator& ModifyQiongBuffIndicator(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffIndicator));
    return local_12.GetComp();
}
FC_QiongBuffIndicator& ModifyOrAddQiongBuffIndicator(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffIndicator));
    return local_12.GetComp();
}
const FC_QiongBuffIndicator& GetQiongBuffIndicator(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffIndicator));
    return local_12.GetComp();
}
UFUNCTION()
FC_QiongBuffIndicator GetQiongBuffIndicator_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_QiongBuffIndicator& local_4 = ECSFunc_FC_QiongBuffIndicator::GetQiongBuffIndicator(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_QiongBuffIndicator();
}
const FC_QiongBuffIndicator GetDefaultedQiongBuffIndicator(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_QiongBuffIndicator __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffIndicator);
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
FC_QiongBuffIndicator GetDefaultedQiongBuffIndicator_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_QiongBuffIndicator::GetDefaultedQiongBuffIndicator(Entity);
}
UFUNCTION()
bool RemoveQiongBuffIndicator(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffIndicator);
}
}
FECSMonitorRuntimeView __GetMonitorQiongBuffIndicatorOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_QiongBuffIndicator, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorQiongBuffIndicatorOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_QiongBuffIndicator, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorQiongBuffIndicatorOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_QiongBuffIndicator, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorQiongBuffIndicatorOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_QiongBuffIndicator, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorQiongBuffIndicatorOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_QiongBuffIndicator, bFixedFrame, bMustHandleAll);
}
void __MonitorQiongBuffIndicatorLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_QiongBuffIndicator, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorQiongBuffIndicatorActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_QiongBuffIndicator, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorQiongBuffIndicatorModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_QiongBuffIndicator, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_QiongHiddenBuffTipTag
{
UFUNCTION()
bool HasQiongHiddenBuffTipTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_QiongHiddenBuffTipTag);
}
FC_QiongHiddenBuffTipTag& AssignQiongHiddenBuffTipTag(const FECSEntity &inout Entity, const FC_QiongHiddenBuffTipTag &inout DefaultValue = FC_QiongHiddenBuffTipTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_QiongHiddenBuffTipTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignQiongHiddenBuffTipTag_BP(const FECSEntity &inout Entity, const FC_QiongHiddenBuffTipTag &inout DefaultValue = FC_QiongHiddenBuffTipTag())
{
    ECSFunc_FC_QiongHiddenBuffTipTag::AssignQiongHiddenBuffTipTag(Entity, DefaultValue);
    return;
}
FC_QiongHiddenBuffTipTag& ModifyQiongHiddenBuffTipTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_QiongHiddenBuffTipTag));
    return local_12.GetComp();
}
FC_QiongHiddenBuffTipTag& ModifyOrAddQiongHiddenBuffTipTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_QiongHiddenBuffTipTag));
    return local_12.GetComp();
}
const FC_QiongHiddenBuffTipTag& GetQiongHiddenBuffTipTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_QiongHiddenBuffTipTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_QiongHiddenBuffTipTag GetQiongHiddenBuffTipTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_QiongHiddenBuffTipTag& local_4 = ECSFunc_FC_QiongHiddenBuffTipTag::GetQiongHiddenBuffTipTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_QiongHiddenBuffTipTag();
}
const FC_QiongHiddenBuffTipTag GetDefaultedQiongHiddenBuffTipTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_QiongHiddenBuffTipTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_QiongHiddenBuffTipTag);
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
FC_QiongHiddenBuffTipTag GetDefaultedQiongHiddenBuffTipTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_QiongHiddenBuffTipTag::GetDefaultedQiongHiddenBuffTipTag(Entity);
}
UFUNCTION()
bool RemoveQiongHiddenBuffTipTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_QiongHiddenBuffTipTag);
}
}
FECSMonitorRuntimeView __GetMonitorQiongHiddenBuffTipTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_QiongHiddenBuffTipTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorQiongHiddenBuffTipTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_QiongHiddenBuffTipTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorQiongHiddenBuffTipTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_QiongHiddenBuffTipTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorQiongHiddenBuffTipTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_QiongHiddenBuffTipTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorQiongHiddenBuffTipTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_QiongHiddenBuffTipTag, bFixedFrame, bMustHandleAll);
}
void __MonitorQiongHiddenBuffTipTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_QiongHiddenBuffTipTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorQiongHiddenBuffTipTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_QiongHiddenBuffTipTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorQiongHiddenBuffTipTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_QiongHiddenBuffTipTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_QiongBuffUIHandle
{
UFUNCTION()
bool HasQiongBuffUIHandle(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffUIHandle);
}
FC_QiongBuffUIHandle& AssignQiongBuffUIHandle(const FECSEntity &inout Entity, const FC_QiongBuffUIHandle &inout DefaultValue = FC_QiongBuffUIHandle())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffUIHandle, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignQiongBuffUIHandle_BP(const FECSEntity &inout Entity, const FC_QiongBuffUIHandle &inout DefaultValue = FC_QiongBuffUIHandle())
{
    ECSFunc_FC_QiongBuffUIHandle::AssignQiongBuffUIHandle(Entity, DefaultValue);
    return;
}
FC_QiongBuffUIHandle& ModifyQiongBuffUIHandle(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffUIHandle));
    return local_12.GetComp();
}
FC_QiongBuffUIHandle& ModifyOrAddQiongBuffUIHandle(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffUIHandle));
    return local_12.GetComp();
}
const FC_QiongBuffUIHandle& GetQiongBuffUIHandle(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffUIHandle));
    return local_12.GetComp();
}
UFUNCTION()
FC_QiongBuffUIHandle GetQiongBuffUIHandle_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_QiongBuffUIHandle __r;
    bValid = false;
    bValid = ECSFunc_FC_QiongBuffUIHandle::GetQiongBuffUIHandle(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_QiongBuffUIHandle GetDefaultedQiongBuffUIHandle(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_QiongBuffUIHandle __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffUIHandle);
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
FC_QiongBuffUIHandle GetDefaultedQiongBuffUIHandle_BP(const FECSEntity &inout Entity)
{
    FC_QiongBuffUIHandle __r;
    return __r;
}
UFUNCTION()
bool RemoveQiongBuffUIHandle(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_QiongBuffUIHandle);
}
}
FECSMonitorRuntimeView __GetMonitorQiongBuffUIHandleOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_QiongBuffUIHandle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorQiongBuffUIHandleOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_QiongBuffUIHandle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorQiongBuffUIHandleOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_QiongBuffUIHandle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorQiongBuffUIHandleOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_QiongBuffUIHandle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorQiongBuffUIHandleOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_QiongBuffUIHandle, bFixedFrame, bMustHandleAll);
}
void __MonitorQiongBuffUIHandleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_QiongBuffUIHandle, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorQiongBuffUIHandleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_QiongBuffUIHandle, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorQiongBuffUIHandleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_QiongBuffUIHandle, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_QiongBuffIndicator &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_QiongBuffIndicator &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_QiongBuffIndicator &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_QiongBuffIndicator
{
int __IndexOf_FromEntity()
{
    return 0;
}
int __IndexOf_BuffConfig()
{
    return 1;
}
int __IndexOf_Offset()
{
    return 2;
}
}
