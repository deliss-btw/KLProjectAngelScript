
namespace __INTENRAL_FC_HeadControl_NS
{
    const TECSComponentDerivedPtr<FC_HeadControl> DerivedPtr = TECSComponentDerivedPtr<FC_HeadControl>();
    const FC_HeadControl DefaultValue = FC_HeadControl();
}
namespace __INTENRAL_FC_AnimHeadControlData_NS
{
    const TECSComponentDerivedPtr<FC_AnimHeadControlData> DerivedPtr = TECSComponentDerivedPtr<FC_AnimHeadControlData>();
    const FC_AnimHeadControlData DefaultValue = FC_AnimHeadControlData();
}
namespace __INTENRAL_FC_BodyCurve_NS
{
    const TECSComponentDerivedPtr<FC_BodyCurve> DerivedPtr = TECSComponentDerivedPtr<FC_BodyCurve>();
    const FC_BodyCurve DefaultValue = FC_BodyCurve();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AnimHeadControlDataRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_HeadControl : FECSComponent
{
    UPROPERTY()
    float32 MaxAngle = 80.0f;
    UPROPERTY()
    float32 LerpSpeed = 0.15f;
    UPROPERTY()
    FVector DefaultFocusPoint = FVector(0.0, 500.0, 260.0);


}

struct FC_AnimHeadControlData : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_FocusPosition;
    UPROPERTY()
    float32 m_HeadControlWeight;
    UPROPERTY()
    float32 m_EnableWeight;
    UPROPERTY()
    FAnimFloatStack m_CachedEnableWeightStack;

    FC_AnimHeadControlData()
    {
        this.m_FocusPosition = FVector(0.0, 0.0, 0.0);
        this.m_HeadControlWeight = 0.0f;
        this.m_EnableWeight = -1.0f;
        this.__InitDirtyFlags();
        return;
    }
    FC_AnimHeadControlData(const FC_AnimHeadControlData &inout Other)
    {
        this.m_FocusPosition = FVector(0.0, 0.0, 0.0);
        this.m_HeadControlWeight = 0.0f;
        this.m_EnableWeight = -1.0f;
        this.__InitDirtyFlags();
        this.m_FocusPosition = Other.m_FocusPosition;
        this.m_HeadControlWeight = Other.m_HeadControlWeight;
        this.m_EnableWeight = Other.m_EnableWeight;
        return;
    }
    FC_AnimHeadControlData opAssign(const FC_AnimHeadControlData &inout Other)
    {
        FC_AnimHeadControlData __r;
        this.SetFocusPosition(Other.GetFocusPosition());
        this.SetHeadControlWeight(Other.GetHeadControlWeight());
        this.SetEnableWeight(Other.GetEnableWeight());
        this.SetCachedEnableWeightStack(Other.GetCachedEnableWeightStack());
        return __r;
    }
    bool IsActive() const
    {
        return (this.GetEnableWeight() >= 0.0f);
    }
    float32 GetTargetControlWeight() const
    {
        return this.IsActive() ? this.GetEnableWeight() : 0.0f;
    }
    void PushWeight(const float32 Weight)
    {
        if (this.IsActive())
        {
            this.GetCachedEnableWeightStack().Push(this.GetEnableWeight());
        }
        this.SetEnableWeight(Weight);
        return;
    }
    void PopWeight()
    {
        this.SetEnableWeight(this.GetCachedEnableWeightStack().Top(-1.0f));
        this.GetCachedEnableWeightStack().Pop();
        return;
    }
    bool CanBeRemoved() const
    {
        return !(this.IsActive()) && (this.GetHeadControlWeight() == 0.0f);
    }
    const FVector GetFocusPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_FocusPosition() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetFocusPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FocusPosition = __Value;
        return;
    }
    float32 GetHeadControlWeight() const property
    {
        return this.m_HeadControlWeight;
    }
    void SetHeadControlWeight(const float32 __Value) property
    {
        if (this.m_HeadControlWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_HeadControlWeight = __Value;
        return;
    }
    float32 GetEnableWeight() const property
    {
        return this.m_EnableWeight;
    }
    void SetEnableWeight(const float32 __Value) property
    {
        if (this.m_EnableWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_EnableWeight = __Value;
        return;
    }
    const FAnimFloatStack GetCachedEnableWeightStack() const property
    {
        const FAnimFloatStack __r;
        return __r;
    }
    FAnimFloatStack GetCachedEnableWeightStack() property
    {
        FAnimFloatStack __r;
        return __r;
    }
    void SetCachedEnableWeightStack(const FAnimFloatStack &inout __Value) property
    {
        return;
    }
}

struct FC_BodyCurve : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_BodyCurving0;
    UPROPERTY()
    float32 m_BodyCurving1;

    FC_BodyCurve()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_BodyCurve(const FC_BodyCurve &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_BodyCurve opAssign(const FC_BodyCurve &inout Other)
    {
        FC_BodyCurve __r;
        this.SetBodyCurving0(Other.GetBodyCurving0());
        this.SetBodyCurving1(Other.GetBodyCurving1());
        return __r;
    }
    float32 GetBodyCurving0() const property
    {
        return this.m_BodyCurving0;
    }
    void SetBodyCurving0(const float32 __Value) property
    {
        if (this.m_BodyCurving0 == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_BodyCurving0 = __Value;
        return;
    }
    float32 GetBodyCurving1() const property
    {
        return this.m_BodyCurving1;
    }
    void SetBodyCurving1(const float32 __Value) property
    {
        if (this.m_BodyCurving1 == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_BodyCurving1 = __Value;
        return;
    }
}

struct FT_PoseControl : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_BodyCurve_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_BodyCurve, NAME_None);
    UPROPERTY()
    bool bHas_FC_BodyCurve = true;
    UPROPERTY()
    FC_BodyCurve Config_FC_BodyCurve;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HeadControl_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HeadControl, NAME_None);
    UPROPERTY()
    bool bHas_FC_HeadControl = true;
    UPROPERTY()
    FC_HeadControl Config_FC_HeadControl;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_FootIKControl_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_FootIKControl, NAME_None);
    UPROPERTY()
    bool bHas_FC_FootIKControl = true;
    UPROPERTY()
    FC_FootIKControl Config_FC_FootIKControl;


}

namespace FC_AnimHeadControlData
{
FC_AnimHeadControlData Interpolate(const FC_AnimHeadControlData &inout A, const FC_AnimHeadControlData &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AnimHeadControlData local_16;
    local_16.SetFocusPosition(FMath::Lerp(A.GetFocusPosition(), B.GetFocusPosition(), T));
    local_16.SetEnableWeight(FMath::Lerp(A.GetEnableWeight(), B.GetEnableWeight(), T));
    local_16.SetHeadControlWeight(FMath::Lerp(A.GetHeadControlWeight(), B.GetHeadControlWeight(), T));
    return local_16;
}
}
namespace ECSFunc_FC_HeadControl
{
UFUNCTION()
bool HasHeadControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HeadControl);
}
FC_HeadControl& AssignHeadControl(const FECSEntity &inout Entity, const FC_HeadControl &inout DefaultValue = FC_HeadControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HeadControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHeadControl_BP(const FECSEntity &inout Entity, const FC_HeadControl &inout DefaultValue = FC_HeadControl())
{
    ECSFunc_FC_HeadControl::AssignHeadControl(Entity, DefaultValue);
    return;
}
FC_HeadControl& ModifyHeadControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HeadControl));
    return local_12.GetComp();
}
FC_HeadControl& ModifyOrAddHeadControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HeadControl));
    return local_12.GetComp();
}
const FC_HeadControl& GetHeadControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HeadControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_HeadControl GetHeadControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_HeadControl& local_4 = ECSFunc_FC_HeadControl::GetHeadControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_HeadControl();
}
const FC_HeadControl GetDefaultedHeadControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HeadControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HeadControl);
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
FC_HeadControl GetDefaultedHeadControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_HeadControl::GetDefaultedHeadControl(Entity);
}
UFUNCTION()
bool RemoveHeadControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HeadControl);
}
}
FECSMonitorRuntimeView __GetMonitorHeadControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HeadControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHeadControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HeadControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHeadControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HeadControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHeadControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HeadControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHeadControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HeadControl, bFixedFrame, bMustHandleAll);
}
void __MonitorHeadControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HeadControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHeadControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HeadControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHeadControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HeadControl, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimHeadControlData
{
UFUNCTION()
bool HasAnimHeadControlData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlData);
}
FC_AnimHeadControlData& AssignAnimHeadControlData(const FECSEntity &inout Entity, const FC_AnimHeadControlData &inout DefaultValue = FC_AnimHeadControlData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimHeadControlData_BP(const FECSEntity &inout Entity, const FC_AnimHeadControlData &inout DefaultValue = FC_AnimHeadControlData())
{
    ECSFunc_FC_AnimHeadControlData::AssignAnimHeadControlData(Entity, DefaultValue);
    return;
}
FC_AnimHeadControlData& ModifyAnimHeadControlData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlData));
    return local_12.GetComp();
}
FC_AnimHeadControlData& ModifyOrAddAnimHeadControlData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlData));
    return local_12.GetComp();
}
const FC_AnimHeadControlData& GetAnimHeadControlData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlData));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimHeadControlData GetAnimHeadControlData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimHeadControlData& local_4 = ECSFunc_FC_AnimHeadControlData::GetAnimHeadControlData(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimHeadControlData();
}
const FC_AnimHeadControlData GetDefaultedAnimHeadControlData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimHeadControlData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlData);
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
FC_AnimHeadControlData GetDefaultedAnimHeadControlData_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimHeadControlData::GetDefaultedAnimHeadControlData(Entity);
}
UFUNCTION()
bool RemoveAnimHeadControlData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimHeadControlData);
}
}
FECSMonitorRuntimeView __GetMonitorAnimHeadControlDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimHeadControlData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimHeadControlDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimHeadControlData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimHeadControlDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimHeadControlData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimHeadControlDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimHeadControlData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimHeadControlDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimHeadControlData, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimHeadControlDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimHeadControlData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimHeadControlDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimHeadControlData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimHeadControlDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimHeadControlData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BodyCurve
{
UFUNCTION()
bool HasBodyCurve(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BodyCurve);
}
FC_BodyCurve& AssignBodyCurve(const FECSEntity &inout Entity, const FC_BodyCurve &inout DefaultValue = FC_BodyCurve())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BodyCurve, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBodyCurve_BP(const FECSEntity &inout Entity, const FC_BodyCurve &inout DefaultValue = FC_BodyCurve())
{
    ECSFunc_FC_BodyCurve::AssignBodyCurve(Entity, DefaultValue);
    return;
}
FC_BodyCurve& ModifyBodyCurve(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BodyCurve));
    return local_12.GetComp();
}
FC_BodyCurve& ModifyOrAddBodyCurve(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BodyCurve));
    return local_12.GetComp();
}
const FC_BodyCurve& GetBodyCurve(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BodyCurve));
    return local_12.GetComp();
}
UFUNCTION()
FC_BodyCurve GetBodyCurve_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BodyCurve& local_4 = ECSFunc_FC_BodyCurve::GetBodyCurve(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BodyCurve();
}
const FC_BodyCurve GetDefaultedBodyCurve(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BodyCurve __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BodyCurve);
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
FC_BodyCurve GetDefaultedBodyCurve_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BodyCurve::GetDefaultedBodyCurve(Entity);
}
UFUNCTION()
bool RemoveBodyCurve(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BodyCurve);
}
}
FECSMonitorRuntimeView __GetMonitorBodyCurveOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BodyCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyCurveOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BodyCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyCurveOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BodyCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyCurveOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BodyCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyCurveOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BodyCurve, bFixedFrame, bMustHandleAll);
}
void __MonitorBodyCurveLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BodyCurve, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBodyCurveActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BodyCurve, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBodyCurveModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BodyCurve, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_BodyCurve_BodyCurving0(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetBodyCurving0();
    return;
}
void GetEntityBBVar_BodyCurve_BodyCurving1(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetBodyCurving1();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimHeadControlData &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimHeadControlData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimHeadControlData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimHeadControlData
{
int __IndexOf_FocusPosition()
{
    return 0;
}
int __IndexOf_HeadControlWeight()
{
    return 1;
}
int __IndexOf_EnableWeight()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_BodyCurve &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_BodyCurve &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_BodyCurve &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_BodyCurve
{
int __IndexOf_BodyCurving0()
{
    return 0;
}
int __IndexOf_BodyCurving1()
{
    return 1;
}
}
