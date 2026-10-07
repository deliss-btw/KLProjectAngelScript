
namespace __INTENRAL_FC_PresentationTopAnimatedCameraTag_NS
{
    const TECSComponentDerivedPtr<FC_PresentationTopAnimatedCameraTag> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationTopAnimatedCameraTag>();
    const FC_PresentationTopAnimatedCameraTag DefaultValue = FC_PresentationTopAnimatedCameraTag();
}
namespace __INTENRAL_FCE_PushAnimatedCamera_NS
{
    const TECSEventDerivedPtr<FCE_PushAnimatedCamera> DerivedPtr = TECSEventDerivedPtr<FCE_PushAnimatedCamera>();
}
namespace __INTENRAL_FCE_PushAnimatedCameraLocal_NS
{
    const TECSEventDerivedPtr<FCE_PushAnimatedCameraLocal> DerivedPtr = TECSEventDerivedPtr<FCE_PushAnimatedCameraLocal>();

}
struct FAnimatedCameraData : FCameraRuntimeDataBasic
{
    FCameraRuntimeDataBasic _base_FCameraRuntimeDataBasic;

    FAnimatedCameraData()
    {
        super();
        return;
    }
}

struct FAnimatedCameraPresentationData : FAnimatedCameraData
{
    FAnimatedCameraData _base_FAnimatedCameraData;
    UPROPERTY()
    FECSEntity OriginEntity;
    UPROPERTY()
    FVector OriginPosition = FVector::ZeroVector;
    UPROPERTY()
    FQuat4f OriginRotation = FQuat4f::Identity;
    UPROPERTY()
    float32 BlendParam = 0.0f;
    UPROPERTY()
    FVector3f FocusPointPositionOffset = FVector3f(0.0f, 0.0f, 0.0f);
    UPROPERTY()
    bool bRuntimeOriginInited = false;
    UPROPERTY()
    FFPTime StartTime;


}

struct FAnimatedCameraParamsInput
{
    UPROPERTY()
    TDataObjectPtr<FAnimCameraData> CameraConfig;
    UPROPERTY()
    float32 NormalizedStartTime = 0.0f;
    UPROPERTY()
    float32 NormalizedEndTime = 1.0f;
    UPROPERTY()
    ECameraAnimBlendParamType BlendParamType = ECameraAnimBlendParamType(0);
    UPROPERTY()
    ECameraAnimOriginTransfromType OriginTransformType = ECameraAnimOriginTransfromType(0);
    UPROPERTY()
    EOffsetRefType OriginalPositionType = EOffsetRefType(1);
    UPROPERTY()
    bool bUpdateBlendParam = false;
    UPROPERTY()
    bool bUpdateOriginTransform = true;
    UPROPERTY()
    bool bEnableCollisionCorrection = true;
    UPROPERTY()
    float32 CollisionCorrectionStrength = 1.0f;


}

struct FAnimatedCameraParams : FCameraParamsBasic
{
    FCameraParamsBasic _base_FCameraParamsBasic;
    UPROPERTY()
    TDataObjectPtr<FAnimCameraData> CameraConfig;
    UPROPERTY()
    FFPTime StartTime;
    UPROPERTY()
    float32 NormalizedStartTime = 0.0f;
    UPROPERTY()
    float32 NormalizedEndTime = 1.0f;
    UPROPERTY()
    ECameraAnimBlendParamType BlendParamType = ECameraAnimBlendParamType(0);
    UPROPERTY()
    ECameraAnimOriginTransfromType OriginTransformType = ECameraAnimOriginTransfromType(0);
    UPROPERTY()
    EOffsetRefType OriginalPositionType = EOffsetRefType(1);
    UPROPERTY()
    bool bUpdateBlendParam = false;
    UPROPERTY()
    bool bUpdateOriginTransform = true;
    UPROPERTY()
    bool bEnableCollisionCorrection = true;
    UPROPERTY()
    float32 CollisionCorrectionStrength = 1.0f;


    void CopyFromParamsInput(const FAnimatedCameraParamsInput &inout ParamsInput)
    {
        this.CameraConfig = ParamsInput.CameraConfig;
        this.NormalizedStartTime = ParamsInput.NormalizedStartTime;
        this.NormalizedEndTime = ParamsInput.NormalizedEndTime;
        this.BlendParamType = ParamsInput.BlendParamType;
        this.OriginTransformType = ParamsInput.OriginTransformType;
        this.OriginalPositionType = ParamsInput.OriginalPositionType;
        this.bUpdateBlendParam = ParamsInput.bUpdateBlendParam;
        this.bUpdateOriginTransform = ParamsInput.bUpdateOriginTransform;
        this.bEnableCollisionCorrection = ParamsInput.bEnableCollisionCorrection;
        this.CollisionCorrectionStrength = ParamsInput.CollisionCorrectionStrength;
        return;
    }
}

struct FAnimatedCameraLogic
{
    UPROPERTY()
    FAnimatedCameraParams Params;
    UPROPERTY()
    FAnimatedCameraData CameraRuntimeData;

    FAnimatedCameraLogic()
    {
        return;
    }
}

struct FAnimatedCameraPresentation
{
    UPROPERTY()
    FAnimatedCameraParams Params;
    UPROPERTY()
    FAnimatedCameraPresentationData CameraRuntimeData;

    FAnimatedCameraPresentation()
    {
        return;
    }
    void SetBlendPhaseByConfig(const ECameraBlendPhase Phase, const FFPTime &inout WorldTime)
    {
        const FAnimCameraData& local_4;
        if (!(this.CameraConfig))
        {
            return;
        }
        int local_8 = local_4.FadeInDuration >= 0.0f ? int(local_4.FadeInDuration) : 1056964608;
        this.SetBlendPhaseByParams(ECameraBlendPhase(Phase), WorldTime, local_4.FadeInType, local_8);
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
        FAnimCameraData local_78;
        local_76.BlendInEasing = local_78.FadeInType;
        local_76.BlendOutEasing = local_78.FadeOutType;
        return local_76;
    }
}

struct FC_PresentationTopAnimatedCameraTag : FECSComponent
{
    FC_PresentationTopAnimatedCameraTag()
    {
        return;
    }
}

struct FCE_PushAnimatedCamera : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FAnimatedCameraParams Params;
    UPROPERTY()
    EPresentationCameraLayer Layer;
    UPROPERTY()
    FName CameraName;


}

struct FCE_PushAnimatedCameraLocal : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FAnimatedCameraParams Params;
    UPROPERTY()
    EPresentationCameraLayer Layer;
    UPROPERTY()
    FName CameraName;


}

struct FCameraEventData_PushAnimatedCamera
{
    UPROPERTY()
    FAnimatedCameraParams Params;

    FCameraEventData_PushAnimatedCamera()
    {
        return;
    }
}

namespace ECSFunc_FC_PresentationTopAnimatedCameraTag
{
UFUNCTION()
bool HasPresentationTopAnimatedCameraTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopAnimatedCameraTag);
}
FC_PresentationTopAnimatedCameraTag& AssignPresentationTopAnimatedCameraTag(const FECSEntity &inout Entity, const FC_PresentationTopAnimatedCameraTag &inout DefaultValue = FC_PresentationTopAnimatedCameraTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopAnimatedCameraTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationTopAnimatedCameraTag_BP(const FECSEntity &inout Entity, const FC_PresentationTopAnimatedCameraTag &inout DefaultValue = FC_PresentationTopAnimatedCameraTag())
{
    ECSFunc_FC_PresentationTopAnimatedCameraTag::AssignPresentationTopAnimatedCameraTag(Entity, DefaultValue);
    return;
}
FC_PresentationTopAnimatedCameraTag& ModifyPresentationTopAnimatedCameraTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopAnimatedCameraTag));
    return local_12.GetComp();
}
FC_PresentationTopAnimatedCameraTag& ModifyOrAddPresentationTopAnimatedCameraTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopAnimatedCameraTag));
    return local_12.GetComp();
}
const FC_PresentationTopAnimatedCameraTag& GetPresentationTopAnimatedCameraTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopAnimatedCameraTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationTopAnimatedCameraTag GetPresentationTopAnimatedCameraTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PresentationTopAnimatedCameraTag& local_4 = ECSFunc_FC_PresentationTopAnimatedCameraTag::GetPresentationTopAnimatedCameraTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PresentationTopAnimatedCameraTag();
}
const FC_PresentationTopAnimatedCameraTag GetDefaultedPresentationTopAnimatedCameraTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationTopAnimatedCameraTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopAnimatedCameraTag);
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
FC_PresentationTopAnimatedCameraTag GetDefaultedPresentationTopAnimatedCameraTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PresentationTopAnimatedCameraTag::GetDefaultedPresentationTopAnimatedCameraTag(Entity);
}
UFUNCTION()
bool RemovePresentationTopAnimatedCameraTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopAnimatedCameraTag);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationTopAnimatedCameraTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationTopAnimatedCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopAnimatedCameraTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationTopAnimatedCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopAnimatedCameraTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationTopAnimatedCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopAnimatedCameraTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationTopAnimatedCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopAnimatedCameraTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationTopAnimatedCameraTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationTopAnimatedCameraTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationTopAnimatedCameraTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationTopAnimatedCameraTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationTopAnimatedCameraTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationTopAnimatedCameraTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationTopAnimatedCameraTag, bFixedFrame, Details);
    return;
}
