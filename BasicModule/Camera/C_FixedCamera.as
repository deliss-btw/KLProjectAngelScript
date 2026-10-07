
namespace __INTENRAL_FC_PresentationTopFixedCameraTag_NS
{
    const TECSComponentDerivedPtr<FC_PresentationTopFixedCameraTag> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationTopFixedCameraTag>();
    const FC_PresentationTopFixedCameraTag DefaultValue = FC_PresentationTopFixedCameraTag();

}
struct FFixedCameraData : FCameraRuntimeDataBasic
{
    FCameraRuntimeDataBasic _base_FCameraRuntimeDataBasic;

    FFixedCameraData()
    {
        super();
        return;
    }
}

struct FFixedCameraPresentationData : FFixedCameraData
{
    FFixedCameraData _base_FFixedCameraData;

    FFixedCameraPresentationData()
    {
        super();
        return;
    }
}

struct FFixedCameraParams : FCameraParamsBasic
{
    FCameraParamsBasic _base_FCameraParamsBasic;
    UPROPERTY()
    TDataObjectPtr<FFixedCameraConfig> CameraConfig;
    UPROPERTY()
    FECSEntity FollowTarget;
    UPROPERTY()
    FFPTime StartTime;

    FFixedCameraParams()
    {
        super();
        return;
    }
}

struct FFixedCameraLogic
{
    UPROPERTY()
    FFixedCameraParams Params;
    UPROPERTY()
    FFixedCameraData CameraRuntimeData;

    FFixedCameraLogic()
    {
        return;
    }
}

struct FFixedCameraPresentation
{
    UPROPERTY()
    FFixedCameraParams Params;
    UPROPERTY()
    FFixedCameraPresentationData CameraRuntimeData;

    FFixedCameraPresentation()
    {
        return;
    }
    void SetBlendPhaseByConfig(const ECameraBlendPhase Phase, const FFPTime &inout WorldTime)
    {
        if (!(this.CameraConfig))
        {
            return;
        }
        return;
    }
    void SetBlendPhaseByParams(const ECameraBlendPhase Phase, const FFPTime &inout WorldTime, const FCameraBlendType &inout BlendType, const float32 Duration)
    {
        this.CameraRuntimeData.SetBlendPhase(ECameraBlendPhase(Phase), WorldTime, BlendType, Duration);
        return;
    }
    FCameraBlendConfig GetBlendConfig() const
    {
        // body not fully recovered вЂ” stub [no-return]
        FCameraBlendConfig __r; return __r;
    }
}

struct FC_PresentationTopFixedCameraTag : FECSComponent
{
    FC_PresentationTopFixedCameraTag()
    {
        return;
    }
}

struct FCameraEventData_PushFixedCamera
{
    UPROPERTY()
    FFixedCameraParams Params;

    FCameraEventData_PushFixedCamera()
    {
        return;
    }
}

namespace ECSFunc_FC_PresentationTopFixedCameraTag
{
UFUNCTION()
bool HasPresentationTopFixedCameraTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopFixedCameraTag);
}
FC_PresentationTopFixedCameraTag& AssignPresentationTopFixedCameraTag(const FECSEntity &inout Entity, const FC_PresentationTopFixedCameraTag &inout DefaultValue = FC_PresentationTopFixedCameraTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopFixedCameraTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationTopFixedCameraTag_BP(const FECSEntity &inout Entity, const FC_PresentationTopFixedCameraTag &inout DefaultValue = FC_PresentationTopFixedCameraTag())
{
    ECSFunc_FC_PresentationTopFixedCameraTag::AssignPresentationTopFixedCameraTag(Entity, DefaultValue);
    return;
}
FC_PresentationTopFixedCameraTag& ModifyPresentationTopFixedCameraTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopFixedCameraTag));
    return local_12.GetComp();
}
FC_PresentationTopFixedCameraTag& ModifyOrAddPresentationTopFixedCameraTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopFixedCameraTag));
    return local_12.GetComp();
}
const FC_PresentationTopFixedCameraTag& GetPresentationTopFixedCameraTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopFixedCameraTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationTopFixedCameraTag GetPresentationTopFixedCameraTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PresentationTopFixedCameraTag& local_4 = ECSFunc_FC_PresentationTopFixedCameraTag::GetPresentationTopFixedCameraTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PresentationTopFixedCameraTag();
}
const FC_PresentationTopFixedCameraTag GetDefaultedPresentationTopFixedCameraTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationTopFixedCameraTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopFixedCameraTag);
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
FC_PresentationTopFixedCameraTag GetDefaultedPresentationTopFixedCameraTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PresentationTopFixedCameraTag::GetDefaultedPresentationTopFixedCameraTag(Entity);
}
UFUNCTION()
bool RemovePresentationTopFixedCameraTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopFixedCameraTag);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationTopFixedCameraTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationTopFixedCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopFixedCameraTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationTopFixedCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopFixedCameraTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationTopFixedCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopFixedCameraTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationTopFixedCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopFixedCameraTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationTopFixedCameraTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationTopFixedCameraTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationTopFixedCameraTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationTopFixedCameraTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationTopFixedCameraTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationTopFixedCameraTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationTopFixedCameraTag, bFixedFrame, Details);
    return;
}
