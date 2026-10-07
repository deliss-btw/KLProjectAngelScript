
enum EFXOffsetSpaceWithAttachmentOption
{
    LocalSpace,
    EntitySapce,
    WorldSpace,
    AccordingToAttachmentSetting,
}

enum EFXBaseTransformResolveModeWithAttachmentOption
{
    AccordingToAttachmentSetting,
    WorldOrigin,
    ActorOrEntityOrSocket,
}

enum EFXStopMethod
{
    DeactivateEmitter,
    Destroy,
}

namespace __INTENRAL_FC_FXParamChangePoint_NS
{
    const TECSComponentDerivedPtr<FC_FXParamChangePoint> DerivedPtr = TECSComponentDerivedPtr<FC_FXParamChangePoint>();
    const FC_FXParamChangePoint DefaultValue = FC_FXParamChangePoint();
}
namespace __INTENRAL_FCE_ReinitializeNiagaraComponent_NS
{
    const TECSEventDerivedPtr<FCE_ReinitializeNiagaraComponent> DerivedPtr = TECSEventDerivedPtr<FCE_ReinitializeNiagaraComponent>();
}
namespace __INTENRAL_FCE_SetNiagaraComponentDitherOverrideParam_NS
{
    const TECSEventDerivedPtr<FCE_SetNiagaraComponentDitherOverrideParam> DerivedPtr = TECSEventDerivedPtr<FCE_SetNiagaraComponentDitherOverrideParam>();

}
struct FFXParamChangePoint
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_Time = 0;
    UPROPERTY()
    FFPTime m_LerpToDuration = 0;
    UPROPERTY()
    TArray<FFXOverrideParam> m_OverrideParams;

    FFXParamChangePoint()
    {
        return;
    }
    FFXParamChangePoint(const FFXParamChangePoint &inout Other)
    {
        this.m_Time = Other.m_Time;
        this.m_LerpToDuration = Other.m_LerpToDuration;
        this.m_OverrideParams = Other.m_OverrideParams;
        return;
    }
    FFXParamChangePoint opAssign(const FFXParamChangePoint &inout Other)
    {
        FFXParamChangePoint __r;
        this.SetTime(Other.GetTime());
        this.SetLerpToDuration(Other.GetLerpToDuration());
        this.SetOverrideParams(Other.GetOverrideParams());
        return __r;
    }
    FFPTime GetTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_Time() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Time = __Value;
        return;
    }
    const FFPTime GetLerpToDuration() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LerpToDuration() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetLerpToDuration(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LerpToDuration = __Value;
        return;
    }
    const TArray<FFXOverrideParam> GetOverrideParams() const property
    {
        const TArray<FFXOverrideParam> __r;
        return __r;
    }
    TArray<FFXOverrideParam> GetModify_OverrideParams() property
    {
        TArray<FFXOverrideParam> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetOverrideParams(const TArray<FFXOverrideParam> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_OverrideParams = __Value;
        return;
    }
}

struct FFXParamValueLerpTime
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFXOverrideParam m_StartValue;
    UPROPERTY()
    FFXOverrideParam m_EndValue;
    UPROPERTY()
    FFPTime m_StartTime = 0;
    UPROPERTY()
    FFPTime m_EndTime = 0;

    FFXParamValueLerpTime()
    {
        return;
    }
    FFXParamValueLerpTime(const FFXParamValueLerpTime &inout Other)
    {
        this.m_StartValue = Other.m_StartValue;
        this.m_EndValue = Other.m_EndValue;
        this.m_StartTime = Other.m_StartTime;
        this.m_EndTime = Other.m_EndTime;
        return;
    }
    FFXParamValueLerpTime opAssign(const FFXParamValueLerpTime &inout Other)
    {
        FFXParamValueLerpTime __r;
        this.SetStartValue(Other.GetStartValue());
        this.SetEndValue(Other.GetEndValue());
        this.SetStartTime(Other.GetStartTime());
        this.SetEndTime(Other.GetEndTime());
        return __r;
    }
    FFXOverrideParam GetStartValue() const property
    {
        FFXOverrideParam __r;
        return __r;
    }
    FFXOverrideParam GetModify_StartValue() property
    {
        FFXOverrideParam __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetStartValue(const FFXOverrideParam &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StartValue = __Value;
        return;
    }
    const FFXOverrideParam GetEndValue() const property
    {
        const FFXOverrideParam __r;
        return __r;
    }
    FFXOverrideParam GetModify_EndValue() property
    {
        FFXOverrideParam __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetEndValue(const FFXOverrideParam &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_EndValue = __Value;
        return;
    }
    FFPTime GetStartTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_StartTime = __Value;
        return;
    }
    FFPTime GetEndTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_EndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_EndTime = __Value;
        return;
    }
}

struct FCE_ReinitializeNiagaraComponent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FName> LogicNames;

    FCE_ReinitializeNiagaraComponent()
    {
        return;
    }
}

struct FC_FXParamChangePoint : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FFXParamChangePoint> m_ParamChangePoints;
    UPROPERTY()
    TMap<FName, FFXParamValueLerpTime> m_ParamLerpDatas;

    FC_FXParamChangePoint()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_FXParamChangePoint(const FC_FXParamChangePoint &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ParamChangePoints = Other.m_ParamChangePoints;
        this.m_ParamLerpDatas = Other.m_ParamLerpDatas;
        return;
    }
    FC_FXParamChangePoint opAssign(const FC_FXParamChangePoint &inout Other)
    {
        FC_FXParamChangePoint __r;
        this.SetParamChangePoints(Other.GetParamChangePoints());
        this.SetParamLerpDatas(Other.GetParamLerpDatas());
        return __r;
    }
    const TArray<FFXParamChangePoint> GetParamChangePoints() const property
    {
        const TArray<FFXParamChangePoint> __r;
        return __r;
    }
    TArray<FFXParamChangePoint> GetModify_ParamChangePoints() property
    {
        TArray<FFXParamChangePoint> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetParamChangePoints(const TArray<FFXParamChangePoint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ParamChangePoints = __Value;
        return;
    }
    const TMap<FName, FFXParamValueLerpTime> GetParamLerpDatas() const property
    {
        const TMap<FName, FFXParamValueLerpTime> __r;
        return __r;
    }
    TMap<FName, FFXParamValueLerpTime> GetModify_ParamLerpDatas() property
    {
        TMap<FName, FFXParamValueLerpTime> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetParamLerpDatas(const TMap<FName, FFXParamValueLerpTime> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ParamLerpDatas = __Value;
        return;
    }
}

struct FCE_SetNiagaraComponentDitherOverrideParam : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FFPTime CurrentTime;
    UPROPERTY()
    TArray<FName> LogicNames;

    FCE_SetNiagaraComponentDitherOverrideParam()
    {
        return;
    }
}

namespace ECSFunc_FC_FXParamChangePoint
{
UFUNCTION()
bool HasFXParamChangePoint(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FXParamChangePoint);
}
FC_FXParamChangePoint& AssignFXParamChangePoint(const FECSEntity &inout Entity, const FC_FXParamChangePoint &inout DefaultValue = FC_FXParamChangePoint())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FXParamChangePoint, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFXParamChangePoint_BP(const FECSEntity &inout Entity, const FC_FXParamChangePoint &inout DefaultValue = FC_FXParamChangePoint())
{
    ECSFunc_FC_FXParamChangePoint::AssignFXParamChangePoint(Entity, DefaultValue);
    return;
}
FC_FXParamChangePoint& ModifyFXParamChangePoint(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FXParamChangePoint));
    return local_12.GetComp();
}
FC_FXParamChangePoint& ModifyOrAddFXParamChangePoint(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FXParamChangePoint));
    return local_12.GetComp();
}
const FC_FXParamChangePoint& GetFXParamChangePoint(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FXParamChangePoint));
    return local_12.GetComp();
}
UFUNCTION()
FC_FXParamChangePoint GetFXParamChangePoint_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_FXParamChangePoint& local_4 = ECSFunc_FC_FXParamChangePoint::GetFXParamChangePoint(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_FXParamChangePoint();
}
const FC_FXParamChangePoint GetDefaultedFXParamChangePoint(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FXParamChangePoint __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FXParamChangePoint);
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
FC_FXParamChangePoint GetDefaultedFXParamChangePoint_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_FXParamChangePoint::GetDefaultedFXParamChangePoint(Entity);
}
UFUNCTION()
bool RemoveFXParamChangePoint(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FXParamChangePoint);
}
}
FECSMonitorRuntimeView __GetMonitorFXParamChangePointOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FXParamChangePoint, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXParamChangePointOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FXParamChangePoint, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXParamChangePointOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FXParamChangePoint, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXParamChangePointOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FXParamChangePoint, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXParamChangePointOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FXParamChangePoint, bFixedFrame, bMustHandleAll);
}
void __MonitorFXParamChangePointLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FXParamChangePoint, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFXParamChangePointActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FXParamChangePoint, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFXParamChangePointModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FXParamChangePoint, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FFXParamChangePoint &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FFXParamChangePoint &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FFXParamChangePoint
{
int __IndexOf_Time()
{
    return 0;
}
int __IndexOf_LerpToDuration()
{
    return 1;
}
int __IndexOf_OverrideParams()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FFXParamValueLerpTime &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FFXParamValueLerpTime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FFXParamValueLerpTime
{
int __IndexOf_StartValue()
{
    return 0;
}
int __IndexOf_EndValue()
{
    return 1;
}
int __IndexOf_StartTime()
{
    return 2;
}
int __IndexOf_EndTime()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_FXParamChangePoint &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_FXParamChangePoint &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_FXParamChangePoint &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_FXParamChangePoint
{
int __IndexOf_ParamChangePoints()
{
    return 0;
}
int __IndexOf_ParamLerpDatas()
{
    return 1;
}
}
