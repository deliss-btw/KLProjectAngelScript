
enum EPostProcessAnimCurveSource
{
    Time,
    EntityBB,
    Attribute,
}

namespace __INTENRAL_FC_CameraPostProcessAnimResource_NS
{
    const TECSComponentDerivedPtr<FC_CameraPostProcessAnimResource> DerivedPtr = TECSComponentDerivedPtr<FC_CameraPostProcessAnimResource>();
    const FC_CameraPostProcessAnimResource DefaultValue = FC_CameraPostProcessAnimResource();
}
namespace __INTENRAL_FC_CameraPostProcessAnim_NS
{
    const TECSComponentDerivedPtr<FC_CameraPostProcessAnim> DerivedPtr = TECSComponentDerivedPtr<FC_CameraPostProcessAnim>();
    const FC_CameraPostProcessAnim DefaultValue = FC_CameraPostProcessAnim();

}
struct FPostProcessAnimFloatCurve
{
    UPROPERTY()
    FRuntimeFloatCurve Curve;
    UPROPERTY()
    EPostProcessAnimCurveSource Source = EPostProcessAnimCurveSource(0);
    UPROPERTY()
    FNameHandle_EntityBBVarFloat BBVarName;
    UPROPERTY()
    FGameAttributeSelectorView Attribute;


}

struct FPostProcessAnimVectorCurve
{
    UPROPERTY()
    FRuntimeVectorCurve Curve;
    UPROPERTY()
    EPostProcessAnimCurveSource Source = EPostProcessAnimCurveSource(0);
    UPROPERTY()
    FNameHandle_EntityBBVarFloat BBVarName;
    UPROPERTY()
    FGameAttributeSelectorView Attribute;


}

struct FPostProcessAnim
{
    UPROPERTY()
    UMaterialInterface BlendMaterial;
    UPROPERTY()
    FName AttachLocationSlotName;
    UPROPERTY()
    TMap<FName, FNameHandle_EntityBBVarVector> EntityBBVectorSlotNames;
    UPROPERTY()
    TMap<FName, FPostProcessAnimFloatCurve> FloatAnimCurves;
    UPROPERTY()
    TMap<FName, FPostProcessAnimVectorCurve> VectorAnimCurves;
    UPROPERTY()
    FName FadeInOutParamName;
    UPROPERTY()
    float32 FadeInDuration = 0.0f;
    UPROPERTY()
    bool bUseFadeInCurve = false;
    UPROPERTY()
    FRuntimeFloatCurve BlendInCurve;
    UPROPERTY()
    float32 FadeOutDuration = 0.0f;
    UPROPERTY()
    bool bUseFadeOutCurve = false;
    UPROPERTY()
    FRuntimeFloatCurve BlendOutCurve;


    void UpdateAnim(const UMaterialInstanceDynamic Material, const FVector &inout AttachLocation, const FECSEntity &inout Entity, const float Time, const float Duration, const FFPTime &inout WorldTime) const
    {
        const FPostProcessAnimFloatCurve& local_54;
        float local_56;
        const FPostProcessAnimVectorCurve& local_82;
        if (!((this.AttachLocationSlotName == NAME_None)))
        {
            Material.SetVectorParameterValue(this.AttachLocationSlotName, FLinearColor(AttachLocation, 1.0f));
        }
        for (auto& local_26 : this.EntityBBVectorSlotNames)
        {
            Material.SetVectorParameterValue(local_26.GetKey(), FLinearColor(Entity.GetBB_Vector(), 1.0f));
        }
        for (auto& local_50 : this.FloatAnimCurves)
        {
            const FName& local_52 = local_50.GetKey();
            Material.SetScalarParameterValue(local_52, local_54.Curve.GetFloatValue(float32((this.GetSampleTime(local_54.Source, Entity, Time, local_54.BBVarName, local_54.Attribute.AttributeClass, WorldTime))), 0.0f));
        }
        for (auto& local_80 : this.VectorAnimCurves)
        {
            const FName& local_52_2 = local_80.GetKey();
            local_56 = this.GetSampleTime(local_82.Source, Entity, Time, local_82.BBVarName, local_82.Attribute.AttributeClass, WorldTime);
            Material.SetVectorParameterValue(local_52_2, FLinearColor(local_82.Curve.GetValue(float32(local_56)), 1.0f));
        }
        if (!((this.FadeInOutParamName == NAME_None)))
        {
            local_56 = 1.0;
            if (this.FadeInDuration > 0.0f && ((Time < this.FadeInDuration)))
            {
                if (this.bUseFadeInCurve)
                {
                    local_56 = this.BlendInCurve.GetFloatValue(float32((Time / this.FadeInDuration)), 0.0f);
                }
                else
                {
                    local_56 = Time / this.FadeInDuration;
                }
            }
            else
            {
                if (this.FadeOutDuration > 0.0f && (Duration > 0.0) && (Time > (Duration - this.FadeOutDuration)))
                {
                    float local_60_4 = Time - (Duration - this.FadeOutDuration);
                    if (this.bUseFadeOutCurve)
                    {
                        local_56 = this.BlendOutCurve.GetFloatValue(float32((local_60_4 / this.FadeOutDuration)), 0.0f);
                    }
                    else
                    {
                        local_56 = FMath::Max((1.0 - (local_60_4 / this.FadeOutDuration)), 0.0);
                    }
                }
            }
            Material.SetScalarParameterValue(this.FadeInOutParamName, float32(local_56));
        }
        return;
    }
    float GetSampleTime(const EPostProcessAnimCurveSource Source, const FECSEntity &inout Entity, const float Time, const FNameHandle_EntityBBVarFloat &inout BBVarName, const TSoftClassPtr<UGameAttribute> &inout Attribute, const FFPTime &inout WorldTime) const
    {
        switch (int(Source))
        {
        case 0:
        {
            return Time;
        }
        case 1:
        {
            return Entity.GetBB_Float(BBVarName);
        }
        case 2:
        {
            return FGameAttributeUtils::GetAttributeValue(Entity, FGameAttributeRef(Attribute), WorldTime, false, 0.0f, false, FGameAttributeModificationValue());
        }
        default:
        {
            return 0.0;
        }
        }
    }
}

class UCameraPostProcessAnimConfig : UDataAsset
{
    UPROPERTY()
    FPostProcessAnim PostProcessAnim;

    UCameraPostProcessAnimConfig()
    {
        return;
    }
}

struct FCameraPostProcessAnimRange
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_AttachEntity;
    UPROPERTY()
    bool m_bUpdateAttach;
    UPROPERTY()
    FName m_AttachSocketName;
    UPROPERTY()
    FVector m_AttachOffset;
    UPROPERTY()
    FFPTime m_StartTime;
    UPROPERTY()
    FFPTime m_Duration;
    UPROPERTY()
    TSoftObjectPtr<UCameraPostProcessAnimConfig> m_Config;

    FCameraPostProcessAnimRange()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCameraPostProcessAnimRange(const FCameraPostProcessAnimRange &inout Other)
    {
        this.m_bUpdateAttach = false;
        this.m_AttachEntity = Other.m_AttachEntity;
        this.m_bUpdateAttach = Other.m_bUpdateAttach;
        this.m_AttachSocketName = Other.m_AttachSocketName;
        this.m_AttachOffset = Other.m_AttachOffset;
        this.m_StartTime = Other.m_StartTime;
        this.m_Duration = Other.m_Duration;
        this.m_Config = Other.m_Config;
        return;
    }
    FCameraPostProcessAnimRange opAssign(const FCameraPostProcessAnimRange &inout Other)
    {
        FCameraPostProcessAnimRange __r;
        this.SetAttachEntity(Other.GetAttachEntity());
        this.SetbUpdateAttach(Other.GetbUpdateAttach());
        this.SetAttachSocketName(Other.GetAttachSocketName());
        this.SetAttachOffset(Other.GetAttachOffset());
        this.SetStartTime(Other.GetStartTime());
        this.SetDuration(Other.GetDuration());
        this.SetConfig(Other.GetConfig());
        return __r;
    }
    const FECSEntity GetAttachEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_AttachEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAttachEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AttachEntity = __Value;
        return;
    }
    bool GetbUpdateAttach() const property
    {
        return this.m_bUpdateAttach;
    }
    void SetbUpdateAttach(const bool __Value) property
    {
        if (!(this.m_bUpdateAttach) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bUpdateAttach = __Value;
        return;
    }
    FName GetAttachSocketName() const property
    {
        return this.m_AttachSocketName;
    }
    void SetAttachSocketName(const FName &inout __Value) property
    {
        if ((this.m_AttachSocketName == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AttachSocketName = __Value;
        return;
    }
    FVector GetAttachOffset() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_AttachOffset() property
    {
        FVector __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetAttachOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_AttachOffset = __Value;
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
        this.__MarkDirty(4);
        return __r;
    }
    void SetStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
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
        this.__MarkDirty(5);
        return __r;
    }
    void SetDuration(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_Duration = __Value;
        return;
    }
    TSoftObjectPtr<UCameraPostProcessAnimConfig> GetConfig() const property
    {
        TSoftObjectPtr<UCameraPostProcessAnimConfig> __r;
        return __r;
    }
    TSoftObjectPtr<UCameraPostProcessAnimConfig> GetModify_Config() property
    {
        TSoftObjectPtr<UCameraPostProcessAnimConfig> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetConfig(const TSoftObjectPtr<UCameraPostProcessAnimConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_Config = __Value;
        return;
    }
}

struct FCameraPostProcessAnimResourceData
{
    UPROPERTY()
    TWeakObjectPtr<UMaterialInstanceDynamic> Material;
    UPROPERTY()
    FFPTime StartTime;
    UPROPERTY()
    FVector AttachLocation;
    UPROPERTY()
    bool bAttachLocationIsSet = false;


}

struct FC_CameraPostProcessAnimResource : FECSComponent
{
    UPROPERTY()
    TMap<TWeakObjectPtr<UCameraPostProcessAnimConfig>, FCameraPostProcessAnimResourceData> DataMap;
    UPROPERTY()
    TMap<TWeakObjectPtr<UCameraPostProcessAnimConfig>, TWeakObjectPtr<UMaterialInstanceDynamic>> EsmMaterialsMap;

    FC_CameraPostProcessAnimResource()
    {
        return;
    }
}

struct FC_CameraPostProcessAnim : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FCameraPostProcessAnimRange> m_Anims;

    FC_CameraPostProcessAnim()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_CameraPostProcessAnim(const FC_CameraPostProcessAnim &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Anims = Other.m_Anims;
        return;
    }
    FC_CameraPostProcessAnim opAssign(const FC_CameraPostProcessAnim &inout Other)
    {
        FC_CameraPostProcessAnim __r;
        this.SetAnims(Other.GetAnims());
        return __r;
    }
    const TArray<FCameraPostProcessAnimRange> GetAnims() const property
    {
        const TArray<FCameraPostProcessAnimRange> __r;
        return __r;
    }
    TArray<FCameraPostProcessAnimRange> GetModify_Anims() property
    {
        TArray<FCameraPostProcessAnimRange> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAnims(const TArray<FCameraPostProcessAnimRange> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Anims = __Value;
        return;
    }
}

namespace ECSFunc_FC_CameraPostProcessAnimResource
{
UFUNCTION()
bool HasCameraPostProcessAnimResource(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnimResource);
}
FC_CameraPostProcessAnimResource& AssignCameraPostProcessAnimResource(const FECSEntity &inout Entity, const FC_CameraPostProcessAnimResource &inout DefaultValue = FC_CameraPostProcessAnimResource())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnimResource, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCameraPostProcessAnimResource_BP(const FECSEntity &inout Entity, const FC_CameraPostProcessAnimResource &inout DefaultValue = FC_CameraPostProcessAnimResource())
{
    ECSFunc_FC_CameraPostProcessAnimResource::AssignCameraPostProcessAnimResource(Entity, DefaultValue);
    return;
}
FC_CameraPostProcessAnimResource& ModifyCameraPostProcessAnimResource(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnimResource));
    return local_12.GetComp();
}
FC_CameraPostProcessAnimResource& ModifyOrAddCameraPostProcessAnimResource(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnimResource));
    return local_12.GetComp();
}
const FC_CameraPostProcessAnimResource& GetCameraPostProcessAnimResource(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnimResource));
    return local_12.GetComp();
}
UFUNCTION()
FC_CameraPostProcessAnimResource GetCameraPostProcessAnimResource_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CameraPostProcessAnimResource __r;
    bValid = false;
    bValid = ECSFunc_FC_CameraPostProcessAnimResource::GetCameraPostProcessAnimResource(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CameraPostProcessAnimResource GetDefaultedCameraPostProcessAnimResource(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CameraPostProcessAnimResource __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnimResource);
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
FC_CameraPostProcessAnimResource GetDefaultedCameraPostProcessAnimResource_BP(const FECSEntity &inout Entity)
{
    FC_CameraPostProcessAnimResource __r;
    return __r;
}
UFUNCTION()
bool RemoveCameraPostProcessAnimResource(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnimResource);
}
}
FECSMonitorRuntimeView __GetMonitorCameraPostProcessAnimResourceOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CameraPostProcessAnimResource, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraPostProcessAnimResourceOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CameraPostProcessAnimResource, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraPostProcessAnimResourceOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CameraPostProcessAnimResource, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraPostProcessAnimResourceOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CameraPostProcessAnimResource, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraPostProcessAnimResourceOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CameraPostProcessAnimResource, bFixedFrame, bMustHandleAll);
}
void __MonitorCameraPostProcessAnimResourceLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CameraPostProcessAnimResource, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraPostProcessAnimResourceActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CameraPostProcessAnimResource, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraPostProcessAnimResourceModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CameraPostProcessAnimResource, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CameraPostProcessAnim
{
UFUNCTION()
bool HasCameraPostProcessAnim(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnim);
}
FC_CameraPostProcessAnim& AssignCameraPostProcessAnim(const FECSEntity &inout Entity, const FC_CameraPostProcessAnim &inout DefaultValue = FC_CameraPostProcessAnim())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnim, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCameraPostProcessAnim_BP(const FECSEntity &inout Entity, const FC_CameraPostProcessAnim &inout DefaultValue = FC_CameraPostProcessAnim())
{
    ECSFunc_FC_CameraPostProcessAnim::AssignCameraPostProcessAnim(Entity, DefaultValue);
    return;
}
FC_CameraPostProcessAnim& ModifyCameraPostProcessAnim(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnim));
    return local_12.GetComp();
}
FC_CameraPostProcessAnim& ModifyOrAddCameraPostProcessAnim(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnim));
    return local_12.GetComp();
}
const FC_CameraPostProcessAnim& GetCameraPostProcessAnim(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnim));
    return local_12.GetComp();
}
UFUNCTION()
FC_CameraPostProcessAnim GetCameraPostProcessAnim_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CameraPostProcessAnim& local_4 = ECSFunc_FC_CameraPostProcessAnim::GetCameraPostProcessAnim(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CameraPostProcessAnim();
}
const FC_CameraPostProcessAnim GetDefaultedCameraPostProcessAnim(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CameraPostProcessAnim __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnim);
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
FC_CameraPostProcessAnim GetDefaultedCameraPostProcessAnim_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CameraPostProcessAnim::GetDefaultedCameraPostProcessAnim(Entity);
}
UFUNCTION()
bool RemoveCameraPostProcessAnim(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CameraPostProcessAnim);
}
}
FECSMonitorRuntimeView __GetMonitorCameraPostProcessAnimOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CameraPostProcessAnim, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraPostProcessAnimOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CameraPostProcessAnim, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraPostProcessAnimOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CameraPostProcessAnim, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraPostProcessAnimOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CameraPostProcessAnim, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraPostProcessAnimOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CameraPostProcessAnim, bFixedFrame, bMustHandleAll);
}
void __MonitorCameraPostProcessAnimLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CameraPostProcessAnim, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraPostProcessAnimActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CameraPostProcessAnim, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraPostProcessAnimModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CameraPostProcessAnim, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FCameraPostProcessAnimRange &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FCameraPostProcessAnimRange &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCameraPostProcessAnimRange
{
int __IndexOf_AttachEntity()
{
    return 0;
}
int __IndexOf_bUpdateAttach()
{
    return 1;
}
int __IndexOf_AttachSocketName()
{
    return 2;
}
int __IndexOf_AttachOffset()
{
    return 3;
}
int __IndexOf_StartTime()
{
    return 4;
}
int __IndexOf_Duration()
{
    return 5;
}
int __IndexOf_Config()
{
    return 6;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CameraPostProcessAnim &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CameraPostProcessAnim &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CameraPostProcessAnim &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CameraPostProcessAnim
{
int __IndexOf_Anims()
{
    return 0;
}
}
