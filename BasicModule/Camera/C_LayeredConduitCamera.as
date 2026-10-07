
namespace __INTENRAL_FC_PresentationTopLayerConduitCameraTag_NS
{
    const TECSComponentDerivedPtr<FC_PresentationTopLayerConduitCameraTag> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationTopLayerConduitCameraTag>();
    const FC_PresentationTopLayerConduitCameraTag DefaultValue = FC_PresentationTopLayerConduitCameraTag();

}
struct FLayerConduitCamera : FCameraRuntimeDataBasic
{
    FCameraRuntimeDataBasic _base_FCameraRuntimeDataBasic;
    UPROPERTY()
    FDataObjectPtr CameraConfig;

    FLayerConduitCamera()
    {
        super();
        return;
    }
    void UpdateCameraConfig(const FFPTime &inout WorldTime, const FCS_LocalPlayer &inout LocalPlayer)
    {
        int local_2 = 0;
        FECSEntity local_6 = LocalPlayer.GetCameraViewTargetEntity();
        Has local_14;
        bool local_15 = local_14.opCall();
        if (local_15)
        {
            Get local_20;
            this.CameraConfig = local_20.opCall().AnimData;
            if ((TDataObjectPtr<FAnimCameraData>(this.CameraConfig)))
            {
                TDataObjectPtr<FAnimCameraData> local_44 = TDataObjectPtr<FAnimCameraData>(this.CameraConfig);
            }
        }
        else
        {
            Get local_50;
            FECSWorldPtr local_46 = local_2.GetWorld();
            bool local_15_2 = local_50.opCall();
            if (local_15_2)
            {
                FECSWorldPtr local_46_2 = local_2.GetWorld();
                const FCS_TPCameraParam& local_52 = local_50.opCall();
                if (local_52)
                {
                    this.CameraConfig = local_52.TargetConfigRef;
                    if ((TDataObjectPtr<FTPCameraStateConfig>(this.CameraConfig)))
                    {
                        TDataObjectPtr<FTPCameraStateConfig> local_76 = TDataObjectPtr<FTPCameraStateConfig>(this.CameraConfig);
                    }
                }
            }
        }
        return;
    }
    void SetBlendPhaseByConfig(const ECameraBlendPhase Phase, const FFPTime &inout WorldTime)
    {
        if (!(this.CameraConfig.IsValid()))
        {
            return;
        }
        int local_2 = 0;
        FCameraBlendType local_40;
        if ((TDataObjectPtr<FTPCameraStateConfig>(this.CameraConfig)))
        {
            FTPCameraStateConfig local_66;
            TDataObjectPtr<FTPCameraStateConfig> local_64 = TDataObjectPtr<FTPCameraStateConfig>(this.CameraConfig);
            local_2 = int(local_66.BlendInDuration);
            local_40 = local_66.BlendInEasing;
        }
        else
        {
            if ((TDataObjectPtr<FAnimCameraData>(this.CameraConfig)))
            {
                FAnimCameraData local_92;
                TDataObjectPtr<FAnimCameraData> local_90 = TDataObjectPtr<FAnimCameraData>(this.CameraConfig);
                local_2 = int(local_92.FadeInDuration);
                local_40 = local_92.FadeInType;
            }
        }
        this.SetBlendPhaseByParams(ECameraBlendPhase(Phase), WorldTime, local_40, local_2);
        return;
    }
    void SetBlendPhaseByParams(const ECameraBlendPhase Phase, const FFPTime &inout WorldTime, const FCameraBlendType &inout BlendType, const float32 Duration)
    {
        Super::SetBlendPhase(ECameraBlendPhase(Phase), WorldTime, BlendType, Duration);
        return;
    }
    FCameraBlendConfig GetBlendConfig() const
    {
        if ((TDataObjectPtr<FTPCameraStateConfig>(this.CameraConfig)))
        {
            FTPCameraStateConfig local_28;
            TDataObjectPtr<FTPCameraStateConfig> local_24 = TDataObjectPtr<FTPCameraStateConfig>(this.CameraConfig);
            FCameraBlendConfig local_104;
            local_104.BlendInEasing = local_28.BlendInEasing;
            local_104.BlendOutEasing = local_28.BlendOutEasing;
            return local_104;
        }
        else
        {
            if ((TDataObjectPtr<FAnimCameraData>(this.CameraConfig)))
            {
                FAnimCameraData local_132;
                TDataObjectPtr<FAnimCameraData> local_130 = TDataObjectPtr<FAnimCameraData>(this.CameraConfig);
                FCameraBlendConfig local_104;
                local_104.BlendInEasing = local_132.FadeInType;
                local_104.BlendOutEasing = local_132.FadeOutType;
                return local_104;
            }
            else
            {
                return local_104;
            }
        }
    }
}

struct FC_PresentationTopLayerConduitCameraTag : FECSComponent
{
    FC_PresentationTopLayerConduitCameraTag()
    {
        return;
    }
}

struct FCameraEventData_PushLayerConduitCamera
{
    FCameraEventData_PushLayerConduitCamera()
    {
        return;
    }
}

namespace ECSFunc_FC_PresentationTopLayerConduitCameraTag
{
UFUNCTION()
bool HasPresentationTopLayerConduitCameraTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopLayerConduitCameraTag);
}
FC_PresentationTopLayerConduitCameraTag& AssignPresentationTopLayerConduitCameraTag(const FECSEntity &inout Entity, const FC_PresentationTopLayerConduitCameraTag &inout DefaultValue = FC_PresentationTopLayerConduitCameraTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopLayerConduitCameraTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationTopLayerConduitCameraTag_BP(const FECSEntity &inout Entity, const FC_PresentationTopLayerConduitCameraTag &inout DefaultValue = FC_PresentationTopLayerConduitCameraTag())
{
    ECSFunc_FC_PresentationTopLayerConduitCameraTag::AssignPresentationTopLayerConduitCameraTag(Entity, DefaultValue);
    return;
}
FC_PresentationTopLayerConduitCameraTag& ModifyPresentationTopLayerConduitCameraTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopLayerConduitCameraTag));
    return local_12.GetComp();
}
FC_PresentationTopLayerConduitCameraTag& ModifyOrAddPresentationTopLayerConduitCameraTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopLayerConduitCameraTag));
    return local_12.GetComp();
}
const FC_PresentationTopLayerConduitCameraTag& GetPresentationTopLayerConduitCameraTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopLayerConduitCameraTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationTopLayerConduitCameraTag GetPresentationTopLayerConduitCameraTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PresentationTopLayerConduitCameraTag& local_4 = ECSFunc_FC_PresentationTopLayerConduitCameraTag::GetPresentationTopLayerConduitCameraTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PresentationTopLayerConduitCameraTag();
}
const FC_PresentationTopLayerConduitCameraTag GetDefaultedPresentationTopLayerConduitCameraTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationTopLayerConduitCameraTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopLayerConduitCameraTag);
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
FC_PresentationTopLayerConduitCameraTag GetDefaultedPresentationTopLayerConduitCameraTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PresentationTopLayerConduitCameraTag::GetDefaultedPresentationTopLayerConduitCameraTag(Entity);
}
UFUNCTION()
bool RemovePresentationTopLayerConduitCameraTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationTopLayerConduitCameraTag);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationTopLayerConduitCameraTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationTopLayerConduitCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopLayerConduitCameraTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationTopLayerConduitCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopLayerConduitCameraTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationTopLayerConduitCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopLayerConduitCameraTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationTopLayerConduitCameraTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationTopLayerConduitCameraTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationTopLayerConduitCameraTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationTopLayerConduitCameraTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationTopLayerConduitCameraTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationTopLayerConduitCameraTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationTopLayerConduitCameraTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationTopLayerConduitCameraTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationTopLayerConduitCameraTag, bFixedFrame, Details);
    return;
}
