
namespace __INTENRAL_FC_LayeredBlendMask_NS
{
    const TECSComponentDerivedPtr<FC_LayeredBlendMask> DerivedPtr = TECSComponentDerivedPtr<FC_LayeredBlendMask>();
    const FC_LayeredBlendMask DefaultValue = FC_LayeredBlendMask();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_LayeredBlendMaskRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_LayeredBlendMask : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_BlendWeight;
    UPROPERTY()
    float32 m_BlendTime;
    UPROPERTY()
    bool m_bIsMeshSpaceBlend;
    UPROPERTY()
    bool m_bIsRootSpaceBlend;
    UPROPERTY()
    FSoftObjectPath m_BlendMaskStandalonePath;

    FC_LayeredBlendMask()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_LayeredBlendMask(const FC_LayeredBlendMask &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_LayeredBlendMask opAssign(const FC_LayeredBlendMask &inout Other)
    {
        FC_LayeredBlendMask __r;
        this.SetBlendWeight(Other.GetBlendWeight());
        this.SetBlendTime(Other.GetBlendTime());
        this.SetbIsMeshSpaceBlend(Other.GetbIsMeshSpaceBlend());
        this.SetbIsRootSpaceBlend(Other.GetbIsRootSpaceBlend());
        this.SetBlendMaskStandalonePath(Other.GetBlendMaskStandalonePath());
        return __r;
    }
    void Clear()
    {
        this.SetBlendWeight(0.0f);
        this.SetBlendTime(0.2f);
        this.SetbIsMeshSpaceBlend(false);
        this.SetbIsRootSpaceBlend(false);
        this.SetBlendMaskStandalonePath(FSoftObjectPath());
        return;
    }
    float32 GetBlendWeight() const property
    {
        return this.m_BlendWeight;
    }
    void SetBlendWeight(const float32 __Value) property
    {
        if (this.m_BlendWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_BlendWeight = __Value;
        return;
    }
    float32 GetBlendTime() const property
    {
        return this.m_BlendTime;
    }
    void SetBlendTime(const float32 __Value) property
    {
        if (this.m_BlendTime == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_BlendTime = __Value;
        return;
    }
    bool GetbIsMeshSpaceBlend() const property
    {
        return this.m_bIsMeshSpaceBlend;
    }
    void SetbIsMeshSpaceBlend(const bool __Value) property
    {
        if (!(this.m_bIsMeshSpaceBlend) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bIsMeshSpaceBlend = __Value;
        return;
    }
    bool GetbIsRootSpaceBlend() const property
    {
        return this.m_bIsRootSpaceBlend;
    }
    void SetbIsRootSpaceBlend(const bool __Value) property
    {
        if (!(this.m_bIsRootSpaceBlend) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bIsRootSpaceBlend = __Value;
        return;
    }
    FSoftObjectPath GetBlendMaskStandalonePath() const property
    {
        return this.m_BlendMaskStandalonePath;
    }
    void SetBlendMaskStandalonePath(const FSoftObjectPath &inout __Value) property
    {
        if ((this.m_BlendMaskStandalonePath == __Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_BlendMaskStandalonePath = __Value;
        return;
    }
}

class UESMAction_LayeredBlend : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 BlendWeight = 1.0f;
    UPROPERTY()
    float32 BlendTime = 0.2f;
    UPROPERTY()
    bool bIsMeshSpaceBlend = false;
    UPROPERTY()
    bool bIsRootSpaceBlend = false;
    UPROPERTY()
    UBlendProfileStandalone BlendMaskStandalone;


    UFUNCTION()
    void PreviewClear_Implementation(const FESMPreviewContext &inout Context)
    {
        UESMAnimInstance_Base local_4 = this.GetPreviewAnimInstance(Context);
        if (local_4 == nullptr)
        {
            return;
        }
        FC_LayeredBlendMask local_18;
        local_4.PreviewLayeredBlendMask = local_18;
        return;
    }
    UFUNCTION()
    void Preview_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        UESMAnimInstance_Base local_4 = this.GetPreviewAnimInstance(Context);
        if (local_4 == nullptr)
        {
            return;
        }
        FC_LayeredBlendMask local_18;
        this.ApplyToMask(local_18);
        local_4.PreviewLayeredBlendMask = local_18;
        return;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_LayeredBlendMask& local_6 = local_4.opCall();
        if (local_6)
        {
            this.ApplyToMask(local_6);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        if (local_4.opCall())
        {
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.BlendMaskStandalone == nullptr)
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), "BlendMaskStandalone жњЄй…ЌзЅ®пјЊж··еђ€е°†дёЌз”џж•€");
        }
        return;
    }
    UESMAnimInstance_Base GetPreviewAnimInstance(const FESMPreviewContext &inout Context) const
    {
        AActor local_10;
        return Cast<UESMAnimInstance_Base>(Cast<USkeletalMeshComponent>(local_10.GetComponentByClass(USkeletalMeshComponent)).GetAnimInstance());
    }
    void ApplyToMask(FC_LayeredBlendMask &inout Mask) const
    {
        if (this.BlendMaskStandalone == nullptr)
        {
            return;
        }
        Mask.SetBlendWeight(this.BlendWeight);
        Mask.SetBlendTime(this.BlendTime);
        Mask.SetbIsMeshSpaceBlend(this.bIsMeshSpaceBlend);
        Mask.SetbIsRootSpaceBlend(this.bIsRootSpaceBlend);
        Mask.SetBlendMaskStandalonePath(FSoftObjectPath(this.BlendMaskStandalone));
        return;
    }
}

namespace FC_LayeredBlendMask
{
FC_LayeredBlendMask Interpolate(const FC_LayeredBlendMask &inout A, const FC_LayeredBlendMask &inout B, const float32 T, const float32 DeltaTime)
{
    FC_LayeredBlendMask local_12;
    local_12.SetBlendWeight(FMath::Lerp(A.GetBlendWeight(), B.GetBlendWeight(), T));
    local_12.SetBlendTime(B.GetBlendTime());
    local_12.SetbIsMeshSpaceBlend(B.GetbIsMeshSpaceBlend());
    local_12.SetbIsRootSpaceBlend(B.GetbIsRootSpaceBlend());
    local_12.SetBlendMaskStandalonePath(B.GetBlendMaskStandalonePath());
    return local_12;
}
}
namespace ECSFunc_FC_LayeredBlendMask
{
UFUNCTION()
bool HasLayeredBlendMask(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMask);
}
FC_LayeredBlendMask& AssignLayeredBlendMask(const FECSEntity &inout Entity, const FC_LayeredBlendMask &inout DefaultValue = FC_LayeredBlendMask())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMask, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLayeredBlendMask_BP(const FECSEntity &inout Entity, const FC_LayeredBlendMask &inout DefaultValue = FC_LayeredBlendMask())
{
    ECSFunc_FC_LayeredBlendMask::AssignLayeredBlendMask(Entity, DefaultValue);
    return;
}
FC_LayeredBlendMask& ModifyLayeredBlendMask(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMask));
    return local_12.GetComp();
}
FC_LayeredBlendMask& ModifyOrAddLayeredBlendMask(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMask));
    return local_12.GetComp();
}
const FC_LayeredBlendMask& GetLayeredBlendMask(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMask));
    return local_12.GetComp();
}
UFUNCTION()
FC_LayeredBlendMask GetLayeredBlendMask_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LayeredBlendMask& local_4 = ECSFunc_FC_LayeredBlendMask::GetLayeredBlendMask(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LayeredBlendMask();
}
const FC_LayeredBlendMask GetDefaultedLayeredBlendMask(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LayeredBlendMask __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMask);
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
FC_LayeredBlendMask GetDefaultedLayeredBlendMask_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LayeredBlendMask::GetDefaultedLayeredBlendMask(Entity);
}
UFUNCTION()
bool RemoveLayeredBlendMask(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LayeredBlendMask);
}
}
FECSMonitorRuntimeView __GetMonitorLayeredBlendMaskOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LayeredBlendMask, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLayeredBlendMaskOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LayeredBlendMask, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLayeredBlendMaskOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LayeredBlendMask, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLayeredBlendMaskOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LayeredBlendMask, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLayeredBlendMaskOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LayeredBlendMask, bFixedFrame, bMustHandleAll);
}
void __MonitorLayeredBlendMaskLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LayeredBlendMask, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLayeredBlendMaskActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LayeredBlendMask, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLayeredBlendMaskModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LayeredBlendMask, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LayeredBlendMask &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LayeredBlendMask &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LayeredBlendMask &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LayeredBlendMask
{
int __IndexOf_BlendWeight()
{
    return 0;
}
int __IndexOf_BlendTime()
{
    return 1;
}
int __IndexOf_bIsMeshSpaceBlend()
{
    return 2;
}
int __IndexOf_bIsRootSpaceBlend()
{
    return 3;
}
int __IndexOf_BlendMaskStandalonePath()
{
    return 4;
}
}
