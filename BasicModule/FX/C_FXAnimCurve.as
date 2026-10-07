
namespace __INTENRAL_FC_FXAnimCurve_NS
{
    const TECSComponentDerivedPtr<FC_FXAnimCurve> DerivedPtr = TECSComponentDerivedPtr<FC_FXAnimCurve>();
    const FC_FXAnimCurve DefaultValue = FC_FXAnimCurve();
}
namespace __INTENRAL_FC_FXAnimCurveInterpoState_NS
{
    const TECSComponentDerivedPtr<FC_FXAnimCurveInterpoState> DerivedPtr = TECSComponentDerivedPtr<FC_FXAnimCurveInterpoState>();
    const FC_FXAnimCurveInterpoState DefaultValue = FC_FXAnimCurveInterpoState();

}
struct FFXAnimCurveRange
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_StartTime;
    UPROPERTY()
    FFPTime m_Duration;
    UPROPERTY()
    TSoftObjectPtr<UFXAnimCurveConfig> m_Config;

    FFXAnimCurveRange()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FFXAnimCurveRange(const FFXAnimCurveRange &inout Other)
    {
        this.m_StartTime = Other.m_StartTime;
        this.m_Duration = Other.m_Duration;
        this.m_Config = Other.m_Config;
        return;
    }
    FFXAnimCurveRange opAssign(const FFXAnimCurveRange &inout Other)
    {
        FFXAnimCurveRange __r;
        this.SetStartTime(Other.GetStartTime());
        this.SetDuration(Other.GetDuration());
        this.SetConfig(Other.GetConfig());
        return __r;
    }
    FFPTime GetStartTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StartTime = __Value;
        return;
    }
    FFPTime GetDuration() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_Duration() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetDuration(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Duration = __Value;
        return;
    }
    TSoftObjectPtr<UFXAnimCurveConfig> GetConfig() const property
    {
        TSoftObjectPtr<UFXAnimCurveConfig> __r;
        return __r;
    }
    TSoftObjectPtr<UFXAnimCurveConfig> GetModify_Config() property
    {
        TSoftObjectPtr<UFXAnimCurveConfig> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetConfig(const TSoftObjectPtr<UFXAnimCurveConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Config = __Value;
        return;
    }
}

struct FC_FXAnimCurve : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FFXAnimCurveRange> m_Curves;

    FC_FXAnimCurve()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_FXAnimCurve(const FC_FXAnimCurve &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Curves = Other.m_Curves;
        return;
    }
    FC_FXAnimCurve opAssign(const FC_FXAnimCurve &inout Other)
    {
        FC_FXAnimCurve __r;
        this.SetCurves(Other.GetCurves());
        return __r;
    }
    const TArray<FFXAnimCurveRange> GetCurves() const property
    {
        const TArray<FFXAnimCurveRange> __r;
        return __r;
    }
    TArray<FFXAnimCurveRange> GetModify_Curves() property
    {
        TArray<FFXAnimCurveRange> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetCurves(const TArray<FFXAnimCurveRange> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Curves = __Value;
        return;
    }
}

struct FC_FXAnimCurveInterpoState : FECSComponent
{
    UPROPERTY()
    TMap<TSoftObjectPtr<UFXAnimCurveConfig>, FFXAnimCurveInterpoState> State;

    FC_FXAnimCurveInterpoState()
    {
        return;
    }
}

namespace ECSFunc_FC_FXAnimCurve
{
UFUNCTION()
bool HasFXAnimCurve(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurve);
}
FC_FXAnimCurve& AssignFXAnimCurve(const FECSEntity &inout Entity, const FC_FXAnimCurve &inout DefaultValue = FC_FXAnimCurve())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurve, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFXAnimCurve_BP(const FECSEntity &inout Entity, const FC_FXAnimCurve &inout DefaultValue = FC_FXAnimCurve())
{
    ECSFunc_FC_FXAnimCurve::AssignFXAnimCurve(Entity, DefaultValue);
    return;
}
FC_FXAnimCurve& ModifyFXAnimCurve(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurve));
    return local_12.GetComp();
}
FC_FXAnimCurve& ModifyOrAddFXAnimCurve(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurve));
    return local_12.GetComp();
}
const FC_FXAnimCurve& GetFXAnimCurve(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurve));
    return local_12.GetComp();
}
UFUNCTION()
FC_FXAnimCurve GetFXAnimCurve_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_FXAnimCurve& local_4 = ECSFunc_FC_FXAnimCurve::GetFXAnimCurve(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_FXAnimCurve();
}
const FC_FXAnimCurve GetDefaultedFXAnimCurve(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FXAnimCurve __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurve);
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
FC_FXAnimCurve GetDefaultedFXAnimCurve_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_FXAnimCurve::GetDefaultedFXAnimCurve(Entity);
}
UFUNCTION()
bool RemoveFXAnimCurve(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurve);
}
}
FECSMonitorRuntimeView __GetMonitorFXAnimCurveOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FXAnimCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXAnimCurveOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FXAnimCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXAnimCurveOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FXAnimCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXAnimCurveOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FXAnimCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXAnimCurveOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FXAnimCurve, bFixedFrame, bMustHandleAll);
}
void __MonitorFXAnimCurveLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FXAnimCurve, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFXAnimCurveActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FXAnimCurve, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFXAnimCurveModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FXAnimCurve, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_FXAnimCurveInterpoState
{
UFUNCTION()
bool HasFXAnimCurveInterpoState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurveInterpoState);
}
FC_FXAnimCurveInterpoState& AssignFXAnimCurveInterpoState(const FECSEntity &inout Entity, const FC_FXAnimCurveInterpoState &inout DefaultValue = FC_FXAnimCurveInterpoState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurveInterpoState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFXAnimCurveInterpoState_BP(const FECSEntity &inout Entity, const FC_FXAnimCurveInterpoState &inout DefaultValue = FC_FXAnimCurveInterpoState())
{
    ECSFunc_FC_FXAnimCurveInterpoState::AssignFXAnimCurveInterpoState(Entity, DefaultValue);
    return;
}
FC_FXAnimCurveInterpoState& ModifyFXAnimCurveInterpoState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurveInterpoState));
    return local_12.GetComp();
}
FC_FXAnimCurveInterpoState& ModifyOrAddFXAnimCurveInterpoState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurveInterpoState));
    return local_12.GetComp();
}
const FC_FXAnimCurveInterpoState& GetFXAnimCurveInterpoState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurveInterpoState));
    return local_12.GetComp();
}
UFUNCTION()
FC_FXAnimCurveInterpoState GetFXAnimCurveInterpoState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FXAnimCurveInterpoState __r;
    bValid = false;
    bValid = ECSFunc_FC_FXAnimCurveInterpoState::GetFXAnimCurveInterpoState(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FXAnimCurveInterpoState GetDefaultedFXAnimCurveInterpoState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FXAnimCurveInterpoState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurveInterpoState);
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
FC_FXAnimCurveInterpoState GetDefaultedFXAnimCurveInterpoState_BP(const FECSEntity &inout Entity)
{
    FC_FXAnimCurveInterpoState __r;
    return __r;
}
UFUNCTION()
bool RemoveFXAnimCurveInterpoState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FXAnimCurveInterpoState);
}
}
FECSMonitorRuntimeView __GetMonitorFXAnimCurveInterpoStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FXAnimCurveInterpoState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXAnimCurveInterpoStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FXAnimCurveInterpoState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXAnimCurveInterpoStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FXAnimCurveInterpoState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXAnimCurveInterpoStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FXAnimCurveInterpoState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXAnimCurveInterpoStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FXAnimCurveInterpoState, bFixedFrame, bMustHandleAll);
}
void __MonitorFXAnimCurveInterpoStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FXAnimCurveInterpoState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFXAnimCurveInterpoStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FXAnimCurveInterpoState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFXAnimCurveInterpoStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FXAnimCurveInterpoState, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FFXAnimCurveRange &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FFXAnimCurveRange &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FFXAnimCurveRange
{
int __IndexOf_StartTime()
{
    return 0;
}
int __IndexOf_Duration()
{
    return 1;
}
int __IndexOf_Config()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_FXAnimCurve &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_FXAnimCurve &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_FXAnimCurve &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_FXAnimCurve
{
int __IndexOf_Curves()
{
    return 0;
}
}
