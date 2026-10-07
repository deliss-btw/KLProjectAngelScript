
namespace __INTENRAL_FC_FactureControlInfo_NS
{
    const TECSComponentDerivedPtr<FC_FactureControlInfo> DerivedPtr = TECSComponentDerivedPtr<FC_FactureControlInfo>();
    const FC_FactureControlInfo DefaultValue = FC_FactureControlInfo();
}
namespace __INTENRAL_FC_CrossBowAimRotationLogic_NS
{
    const TECSComponentDerivedPtr<FC_CrossBowAimRotationLogic> DerivedPtr = TECSComponentDerivedPtr<FC_CrossBowAimRotationLogic>();
    const FC_CrossBowAimRotationLogic DefaultValue = FC_CrossBowAimRotationLogic();
}
namespace __INTENRAL_FC_CrossBowAimRotationLocalPresentation_NS
{
    const TECSComponentDerivedPtr<FC_CrossBowAimRotationLocalPresentation> DerivedPtr = TECSComponentDerivedPtr<FC_CrossBowAimRotationLocalPresentation>();
    const FC_CrossBowAimRotationLocalPresentation DefaultValue = FC_CrossBowAimRotationLocalPresentation();

}
struct FC_FactureControlInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_OwnerEntity;
    UPROPERTY()
    bool m_ControlPosition;
    UPROPERTY()
    bool m_ControlRotation;

    FC_FactureControlInfo()
    {
        this.m_OwnerEntity = ENTITY_NULL;
        this.m_ControlPosition = false;
        this.m_ControlRotation = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_FactureControlInfo(const FC_FactureControlInfo &inout Other)
    {
        this.m_OwnerEntity = ENTITY_NULL;
        this.m_ControlPosition = false;
        this.m_ControlRotation = false;
        this.__InitDirtyFlags();
        this.m_OwnerEntity = Other.m_OwnerEntity;
        this.m_ControlPosition = Other.m_ControlPosition;
        this.m_ControlRotation = Other.m_ControlRotation;
        return;
    }
    FC_FactureControlInfo opAssign(const FC_FactureControlInfo &inout Other)
    {
        FC_FactureControlInfo __r;
        this.SetOwnerEntity(Other.GetOwnerEntity());
        this.SetControlPosition(Other.GetControlPosition());
        this.SetControlRotation(Other.GetControlRotation());
        return __r;
    }
    FECSEntity GetOwnerEntity() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_OwnerEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetOwnerEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_OwnerEntity = __Value;
        return;
    }
    bool GetControlPosition() const property
    {
        return this.m_ControlPosition;
    }
    void SetControlPosition(const bool __Value) property
    {
        if (!(this.m_ControlPosition) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ControlPosition = __Value;
        return;
    }
    bool GetControlRotation() const property
    {
        return this.m_ControlRotation;
    }
    void SetControlRotation(const bool __Value) property
    {
        if (!(this.m_ControlRotation) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ControlRotation = __Value;
        return;
    }
}

struct FC_CrossBowAimRotationLogic : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FRotator m_AimRotation;

    FC_CrossBowAimRotationLogic()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_CrossBowAimRotationLogic(const FC_CrossBowAimRotationLogic &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_AimRotation = Other.m_AimRotation;
        return;
    }
    FC_CrossBowAimRotationLogic opAssign(const FC_CrossBowAimRotationLogic &inout Other)
    {
        FC_CrossBowAimRotationLogic __r;
        this.SetAimRotation(Other.GetAimRotation());
        return __r;
    }
    const FRotator GetAimRotation() const property
    {
        const FRotator __r;
        return __r;
    }
    FRotator GetModify_AimRotation() property
    {
        FRotator __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAimRotation(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AimRotation = __Value;
        return;
    }
}

struct FC_CrossBowAimRotationLocalPresentation : FECSComponent
{
    UPROPERTY()
    FRotator AimRotation;

    FC_CrossBowAimRotationLocalPresentation()
    {
        return;
    }
}

namespace ECSFunc_FC_FactureControlInfo
{
UFUNCTION()
bool HasFactureControlInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FactureControlInfo);
}
FC_FactureControlInfo& AssignFactureControlInfo(const FECSEntity &inout Entity, const FC_FactureControlInfo &inout DefaultValue = FC_FactureControlInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FactureControlInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFactureControlInfo_BP(const FECSEntity &inout Entity, const FC_FactureControlInfo &inout DefaultValue = FC_FactureControlInfo())
{
    ECSFunc_FC_FactureControlInfo::AssignFactureControlInfo(Entity, DefaultValue);
    return;
}
FC_FactureControlInfo& ModifyFactureControlInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FactureControlInfo));
    return local_12.GetComp();
}
FC_FactureControlInfo& ModifyOrAddFactureControlInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FactureControlInfo));
    return local_12.GetComp();
}
const FC_FactureControlInfo& GetFactureControlInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FactureControlInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_FactureControlInfo GetFactureControlInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_FactureControlInfo& local_4 = ECSFunc_FC_FactureControlInfo::GetFactureControlInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_FactureControlInfo();
}
const FC_FactureControlInfo GetDefaultedFactureControlInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FactureControlInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FactureControlInfo);
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
FC_FactureControlInfo GetDefaultedFactureControlInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_FactureControlInfo::GetDefaultedFactureControlInfo(Entity);
}
UFUNCTION()
bool RemoveFactureControlInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FactureControlInfo);
}
}
FECSMonitorRuntimeView __GetMonitorFactureControlInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FactureControlInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFactureControlInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FactureControlInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFactureControlInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FactureControlInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFactureControlInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FactureControlInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFactureControlInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FactureControlInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorFactureControlInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FactureControlInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFactureControlInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FactureControlInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFactureControlInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FactureControlInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CrossBowAimRotationLogic
{
UFUNCTION()
bool HasCrossBowAimRotationLogic(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLogic);
}
FC_CrossBowAimRotationLogic& AssignCrossBowAimRotationLogic(const FECSEntity &inout Entity, const FC_CrossBowAimRotationLogic &inout DefaultValue = FC_CrossBowAimRotationLogic())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLogic, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCrossBowAimRotationLogic_BP(const FECSEntity &inout Entity, const FC_CrossBowAimRotationLogic &inout DefaultValue = FC_CrossBowAimRotationLogic())
{
    ECSFunc_FC_CrossBowAimRotationLogic::AssignCrossBowAimRotationLogic(Entity, DefaultValue);
    return;
}
FC_CrossBowAimRotationLogic& ModifyCrossBowAimRotationLogic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLogic));
    return local_12.GetComp();
}
FC_CrossBowAimRotationLogic& ModifyOrAddCrossBowAimRotationLogic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLogic));
    return local_12.GetComp();
}
const FC_CrossBowAimRotationLogic& GetCrossBowAimRotationLogic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLogic));
    return local_12.GetComp();
}
UFUNCTION()
FC_CrossBowAimRotationLogic GetCrossBowAimRotationLogic_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CrossBowAimRotationLogic& local_4 = ECSFunc_FC_CrossBowAimRotationLogic::GetCrossBowAimRotationLogic(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CrossBowAimRotationLogic();
}
const FC_CrossBowAimRotationLogic GetDefaultedCrossBowAimRotationLogic(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CrossBowAimRotationLogic __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLogic);
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
FC_CrossBowAimRotationLogic GetDefaultedCrossBowAimRotationLogic_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CrossBowAimRotationLogic::GetDefaultedCrossBowAimRotationLogic(Entity);
}
UFUNCTION()
bool RemoveCrossBowAimRotationLogic(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLogic);
}
}
FECSMonitorRuntimeView __GetMonitorCrossBowAimRotationLogicOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CrossBowAimRotationLogic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCrossBowAimRotationLogicOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CrossBowAimRotationLogic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCrossBowAimRotationLogicOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CrossBowAimRotationLogic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCrossBowAimRotationLogicOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CrossBowAimRotationLogic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCrossBowAimRotationLogicOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CrossBowAimRotationLogic, bFixedFrame, bMustHandleAll);
}
void __MonitorCrossBowAimRotationLogicLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CrossBowAimRotationLogic, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCrossBowAimRotationLogicActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CrossBowAimRotationLogic, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCrossBowAimRotationLogicModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CrossBowAimRotationLogic, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CrossBowAimRotationLocalPresentation
{
UFUNCTION()
bool HasCrossBowAimRotationLocalPresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLocalPresentation);
}
FC_CrossBowAimRotationLocalPresentation& AssignCrossBowAimRotationLocalPresentation(const FECSEntity &inout Entity, const FC_CrossBowAimRotationLocalPresentation &inout DefaultValue = FC_CrossBowAimRotationLocalPresentation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLocalPresentation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCrossBowAimRotationLocalPresentation_BP(const FECSEntity &inout Entity, const FC_CrossBowAimRotationLocalPresentation &inout DefaultValue = FC_CrossBowAimRotationLocalPresentation())
{
    ECSFunc_FC_CrossBowAimRotationLocalPresentation::AssignCrossBowAimRotationLocalPresentation(Entity, DefaultValue);
    return;
}
FC_CrossBowAimRotationLocalPresentation& ModifyCrossBowAimRotationLocalPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLocalPresentation));
    return local_12.GetComp();
}
FC_CrossBowAimRotationLocalPresentation& ModifyOrAddCrossBowAimRotationLocalPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLocalPresentation));
    return local_12.GetComp();
}
const FC_CrossBowAimRotationLocalPresentation& GetCrossBowAimRotationLocalPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLocalPresentation));
    return local_12.GetComp();
}
UFUNCTION()
FC_CrossBowAimRotationLocalPresentation GetCrossBowAimRotationLocalPresentation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CrossBowAimRotationLocalPresentation& local_4 = ECSFunc_FC_CrossBowAimRotationLocalPresentation::GetCrossBowAimRotationLocalPresentation(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CrossBowAimRotationLocalPresentation();
}
const FC_CrossBowAimRotationLocalPresentation GetDefaultedCrossBowAimRotationLocalPresentation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CrossBowAimRotationLocalPresentation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLocalPresentation);
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
FC_CrossBowAimRotationLocalPresentation GetDefaultedCrossBowAimRotationLocalPresentation_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CrossBowAimRotationLocalPresentation::GetDefaultedCrossBowAimRotationLocalPresentation(Entity);
}
UFUNCTION()
bool RemoveCrossBowAimRotationLocalPresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CrossBowAimRotationLocalPresentation);
}
}
FECSMonitorRuntimeView __GetMonitorCrossBowAimRotationLocalPresentationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CrossBowAimRotationLocalPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCrossBowAimRotationLocalPresentationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CrossBowAimRotationLocalPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCrossBowAimRotationLocalPresentationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CrossBowAimRotationLocalPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCrossBowAimRotationLocalPresentationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CrossBowAimRotationLocalPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCrossBowAimRotationLocalPresentationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CrossBowAimRotationLocalPresentation, bFixedFrame, bMustHandleAll);
}
void __MonitorCrossBowAimRotationLocalPresentationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CrossBowAimRotationLocalPresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCrossBowAimRotationLocalPresentationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CrossBowAimRotationLocalPresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCrossBowAimRotationLocalPresentationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CrossBowAimRotationLocalPresentation, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_FactureControlInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_FactureControlInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_FactureControlInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_FactureControlInfo
{
int __IndexOf_OwnerEntity()
{
    return 0;
}
int __IndexOf_ControlPosition()
{
    return 1;
}
int __IndexOf_ControlRotation()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CrossBowAimRotationLogic &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CrossBowAimRotationLogic &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CrossBowAimRotationLogic &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CrossBowAimRotationLogic
{
int __IndexOf_AimRotation()
{
    return 0;
}
}
