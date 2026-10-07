
namespace __INTENRAL_FC_AniParamNPCBodyPartControl_NS
{
    const TECSComponentDerivedPtr<FC_AniParamNPCBodyPartControl> DerivedPtr = TECSComponentDerivedPtr<FC_AniParamNPCBodyPartControl>();
    const FC_AniParamNPCBodyPartControl DefaultValue = FC_AniParamNPCBodyPartControl();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AniParamNPCBodyPartControlRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_AniParamNPCBodyPartControl : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_StanceWeight;
    UPROPERTY()
    float32 m_ArmWeight;
    UPROPERTY()
    float32 m_HeadWeight;

    FC_AniParamNPCBodyPartControl()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AniParamNPCBodyPartControl(const FC_AniParamNPCBodyPartControl &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AniParamNPCBodyPartControl opAssign(const FC_AniParamNPCBodyPartControl &inout Other)
    {
        FC_AniParamNPCBodyPartControl __r;
        this.SetStanceWeight(Other.GetStanceWeight());
        this.SetArmWeight(Other.GetArmWeight());
        this.SetHeadWeight(Other.GetHeadWeight());
        return __r;
    }
    float32 GetStanceWeight() const property
    {
        return this.m_StanceWeight;
    }
    void SetStanceWeight(const float32 __Value) property
    {
        if (this.m_StanceWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StanceWeight = __Value;
        return;
    }
    float32 GetArmWeight() const property
    {
        return this.m_ArmWeight;
    }
    void SetArmWeight(const float32 __Value) property
    {
        if (this.m_ArmWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ArmWeight = __Value;
        return;
    }
    float32 GetHeadWeight() const property
    {
        return this.m_HeadWeight;
    }
    void SetHeadWeight(const float32 __Value) property
    {
        if (this.m_HeadWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_HeadWeight = __Value;
        return;
    }
}

class UESMAction_AniParamNPCBodyPartControl : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool EnableStanceLayer = false;
    UPROPERTY()
    bool EnableArmLayer = false;
    UPROPERTY()
    bool EnableHeadLayer = false;


    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(6);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_AniParamNPCBodyPartControl& local_6 = local_4.opCall();
        if (local_6)
        {
            if (this.EnableStanceLayer)
            {
                local_6.SetStanceWeight(1.0f);
            }
            if (this.EnableArmLayer)
            {
                local_6.SetArmWeight(1.0f);
            }
            if (this.EnableHeadLayer)
            {
                local_6.SetHeadWeight(1.0f);
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_AniParamNPCBodyPartControl& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetStanceWeight(0.0f);
            local_6.SetArmWeight(0.0f);
            local_6.SetHeadWeight(0.0f);
        }
        return;
    }
}

namespace FC_AniParamNPCBodyPartControl
{
FC_AniParamNPCBodyPartControl Interpolate(const FC_AniParamNPCBodyPartControl &inout A, const FC_AniParamNPCBodyPartControl &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AniParamNPCBodyPartControl local_4;
    local_4.SetStanceWeight(FMath::Lerp(A.GetStanceWeight(), B.GetStanceWeight(), T));
    local_4.SetArmWeight(FMath::Lerp(A.GetArmWeight(), B.GetArmWeight(), T));
    local_4.SetHeadWeight(FMath::Lerp(A.GetHeadWeight(), B.GetHeadWeight(), T));
    return local_4;
}
}
namespace ECSFunc_FC_AniParamNPCBodyPartControl
{
UFUNCTION()
bool HasAniParamNPCBodyPartControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControl);
}
FC_AniParamNPCBodyPartControl& AssignAniParamNPCBodyPartControl(const FECSEntity &inout Entity, const FC_AniParamNPCBodyPartControl &inout DefaultValue = FC_AniParamNPCBodyPartControl())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControl, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAniParamNPCBodyPartControl_BP(const FECSEntity &inout Entity, const FC_AniParamNPCBodyPartControl &inout DefaultValue = FC_AniParamNPCBodyPartControl())
{
    ECSFunc_FC_AniParamNPCBodyPartControl::AssignAniParamNPCBodyPartControl(Entity, DefaultValue);
    return;
}
FC_AniParamNPCBodyPartControl& ModifyAniParamNPCBodyPartControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControl));
    return local_12.GetComp();
}
FC_AniParamNPCBodyPartControl& ModifyOrAddAniParamNPCBodyPartControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControl));
    return local_12.GetComp();
}
const FC_AniParamNPCBodyPartControl& GetAniParamNPCBodyPartControl(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControl));
    return local_12.GetComp();
}
UFUNCTION()
FC_AniParamNPCBodyPartControl GetAniParamNPCBodyPartControl_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AniParamNPCBodyPartControl& local_4 = ECSFunc_FC_AniParamNPCBodyPartControl::GetAniParamNPCBodyPartControl(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AniParamNPCBodyPartControl();
}
const FC_AniParamNPCBodyPartControl GetDefaultedAniParamNPCBodyPartControl(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AniParamNPCBodyPartControl __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControl);
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
FC_AniParamNPCBodyPartControl GetDefaultedAniParamNPCBodyPartControl_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AniParamNPCBodyPartControl::GetDefaultedAniParamNPCBodyPartControl(Entity);
}
UFUNCTION()
bool RemoveAniParamNPCBodyPartControl(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AniParamNPCBodyPartControl);
}
}
FECSMonitorRuntimeView __GetMonitorAniParamNPCBodyPartControlOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AniParamNPCBodyPartControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamNPCBodyPartControlOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AniParamNPCBodyPartControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamNPCBodyPartControlOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AniParamNPCBodyPartControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamNPCBodyPartControlOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AniParamNPCBodyPartControl, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamNPCBodyPartControlOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AniParamNPCBodyPartControl, bFixedFrame, bMustHandleAll);
}
void __MonitorAniParamNPCBodyPartControlLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AniParamNPCBodyPartControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAniParamNPCBodyPartControlActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AniParamNPCBodyPartControl, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAniParamNPCBodyPartControlModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AniParamNPCBodyPartControl, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AniParamNPCBodyPartControl &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AniParamNPCBodyPartControl &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AniParamNPCBodyPartControl &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AniParamNPCBodyPartControl
{
int __IndexOf_StanceWeight()
{
    return 0;
}
int __IndexOf_ArmWeight()
{
    return 1;
}
int __IndexOf_HeadWeight()
{
    return 2;
}
}
