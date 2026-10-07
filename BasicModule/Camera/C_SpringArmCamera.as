
namespace __INTENRAL_FC_PresentationTopSpringArmCameraTag_NS
{
    const TECSComponentDerivedPtr<FC_PresentationTopSpringArmCameraTag> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationTopSpringArmCameraTag>();
    const FC_PresentationTopSpringArmCameraTag DefaultValue = FC_PresentationTopSpringArmCameraTag();

}
struct FSpringArmCameraData : FCameraRuntimeDataBasic
{
    FCameraRuntimeDataBasic _base_FCameraRuntimeDataBasic;

    FSpringArmCameraData()
    {
        super();
        return;
    }
}

struct FSpringArmCameraPresentationData : FSpringArmCameraData
{
    FSpringArmCameraData _base_FSpringArmCameraData;
    UPROPERTY()
    FCS_TPCameraParam TPCameraParam;
    UPROPERTY()
    FFPTime StartTime;

    FSpringArmCameraPresentationData()
    {
        super();
        return;
    }
}

struct FSpringArmCameraParams : FCameraParamsBasic
{
    FCameraParamsBasic _base_FCameraParamsBasic;
    UPROPERTY()
    TDataObjectPtr<FTPCameraStateConfig> CameraConfig;
    UPROPERTY()
    FFPTime StartTime;

    FSpringArmCameraParams()
    {
        super();
        return;
    }
}

struct FSpringArmCameraLogic
{
    UPROPERTY()
    FSpringArmCameraParams Params;
    UPROPERTY()
    FSpringArmCameraData CameraRuntimeData;

    FSpringArmCameraLogic()
    {
        return;
    }
}

struct FSpringArmCameraPresentation
{
    UPROPERTY()
    FSpringArmCameraParams Params;
    UPROPERTY()
    FSpringArmCameraPresentationData CameraRuntimeData;

    FSpringArmCameraPresentation()
    {
        return;
    }
    void SetBlendPhaseByConfig(const ECameraBlendPhase Phase, const FFPTime &inout WorldTime)
    {
        const FTPCameraStateConfig& local_4;
        if (!(this.CameraConfig))
        {
            return;
        }
        int local_8 = local_4.BlendInDuration >= 0.0f ? int(local_4.BlendInDuration) : 1056964608;
        this.SetBlendPhaseByParams(ECameraBlendPhase(Phase), WorldTime, local_4.BlendInEasing, local_8);
        return;
    }
    void SetBlendPhaseByParams(const ECameraBlendPhase Phase, const FFPTime &inout WorldTime, const FCameraBlendType &inout BlendType, const float32 Duration)
    {
        this.CameraRuntimeData.SetBlendPhase(ECameraBlendPhase(Phase), WorldTime, BlendType, Duration);
        return;
    }
    FCameraBlendConfig GetBlendConfig() const
    {
        FCameraBlendConfig local_76;
        FTPCameraStateConfig local_78;
        local_76.BlendInEasing = local_78.BlendInEasing;
        local_76.BlendOutEasing = local_78.BlendOutEasing;
        return local_76;
    }
}

struct FC_PresentationTopSpringArmCameraTag : FECSComponent
{
    FC_PresentationTopSpringArmCameraTag()
    {
        return;
    }
}

struct FCameraEventData_PushSpringArmCamera
{
    UPROPERTY()
    FSpringArmCameraParams Params;

    FCameraEventData_PushSpringArmCamera()
    {
        return;
    }
}

namespace ECSFunc_FC_PresentationTopSpringArmCameraTag
{
UFUNCTION()
bool HasPresentationTopSpringArmCameraTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopSpringArmCameraTag);
}
FC_PresentationTopSpringArmCameraTag& AssignPresentationTopSpringArmCameraTag(const FECSEntity &inout Entity, const FC_PresentationTopSpringArmCameraTag &inout DefaultValue = FC_PresentationTopSpringArmCameraTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopSpringArmCameraTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationTopSpringArmCameraTag_BP(const FECSEntity &inout Entity, const FC_PresentationTopSpringArmCameraTag &inout DefaultValue = FC_PresentationTopSpringArmCameraTag())
{
    ECSFunc_FC_PresentationTopSpringArmCameraTag::AssignPresentationTopSpringArmCameraTag(Entity, DefaultValue);
    return;
}
FC_PresentationTopSpringArmCameraTag& ModifyPresentationTopSpringArmCameraTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopSpringArmCameraTag));
    return local_12.GetComp();
}
FC_PresentationTopSpringArmCameraTag& ModifyOrAddPresentationTopSpringArmCameraTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopSpringArmCameraTag));
    return local_12.GetComp();
}
const FC_PresentationTopSpringArmCameraTag& GetPresentationTopSpringArmCameraTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopSpringArmCameraTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationTopSpringArmCameraTag GetPresentationTopSpringArmCameraTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PresentationTopSpringArmCameraTag& local_4 = ECSFunc_FC_PresentationTopSpringArmCameraTag::GetPresentationTopSpringArmCameraTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PresentationTopSpringArmCameraTag();
}
const FC_PresentationTopSpringArmCameraTag GetDefaultedPresentationTopSpringArmCameraTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationTopSpringArmCameraTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopSpringArmCameraTag);
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
FC_PresentationTopSpringArmCameraTag GetDefaultedPresentationTopSpringArmCameraTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PresentationTopSpringArmCameraTag::GetDefaultedPresentationTopSpringArmCameraTag(Entity);
}
UFUNCTION()
bool RemovePresentationTopSpringArmCameraTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopSpringArmCameraTag);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationTopSpringArmCameraTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationTopSpringArmCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopSpringArmCameraTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationTopSpringArmCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopSpringArmCameraTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationTopSpringArmCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopSpringArmCameraTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationTopSpringArmCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopSpringArmCameraTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationTopSpringArmCameraTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationTopSpringArmCameraTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationTopSpringArmCameraTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationTopSpringArmCameraTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationTopSpringArmCameraTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationTopSpringArmCameraTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationTopSpringArmCameraTag, bFixedFrame, Details);
    return;
}
