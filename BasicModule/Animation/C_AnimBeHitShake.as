
namespace __INTENRAL_FC_AnimBeHitShake_NS
{
    const TECSComponentDerivedPtr<FC_AnimBeHitShake> DerivedPtr = TECSComponentDerivedPtr<FC_AnimBeHitShake>();
    const FC_AnimBeHitShake DefaultValue = FC_AnimBeHitShake();
}
namespace __INTENRAL_FC_NeedUpdateHitShakeTag_NS
{
    const TECSComponentDerivedPtr<FC_NeedUpdateHitShakeTag> DerivedPtr = TECSComponentDerivedPtr<FC_NeedUpdateHitShakeTag>();
    const FC_NeedUpdateHitShakeTag DefaultValue = FC_NeedUpdateHitShakeTag();

}
struct FC_AnimBeHitShake : FECSComponent
{
    UPROPERTY()
    FFPTime BeHitShakeStartTime;
    UPROPERTY()
    float32 BeHitShakeDuration;
    UPROPERTY()
    float32 BeHitShakePauseDuration;
    UPROPERTY()
    float32 BeHitShakeRatio;
    UPROPERTY()
    float32 BeHitShakeAngle;
    UPROPERTY()
    float32 DynamicShakeStrengthScale;
    UPROPERTY()
    float32 DynamicShakeTimeScale;
    UPROPERTY()
    float32 BeHitShakePauseStartPercent;
    UPROPERTY()
    FTransform AttackerTransform;
    UPROPERTY()
    FVector AttackerForwardVector;
    UPROPERTY()
    FVector AttackDirectionVector;
    UPROPERTY()
    FName BeHitShakeBoneName;
    UPROPERTY()
    EHitShakeBodyType BeHitShakeBodyType;


}

struct FC_NeedUpdateHitShakeTag : FECSComponent
{
    FC_NeedUpdateHitShakeTag()
    {
        return;
    }
}

namespace ECSFunc_FC_AnimBeHitShake
{
UFUNCTION()
bool HasAnimBeHitShake(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimBeHitShake);
}
FC_AnimBeHitShake& AssignAnimBeHitShake(const FECSEntity &inout Entity, const FC_AnimBeHitShake &inout DefaultValue = FC_AnimBeHitShake())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimBeHitShake, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimBeHitShake_BP(const FECSEntity &inout Entity, const FC_AnimBeHitShake &inout DefaultValue = FC_AnimBeHitShake())
{
    ECSFunc_FC_AnimBeHitShake::AssignAnimBeHitShake(Entity, DefaultValue);
    return;
}
FC_AnimBeHitShake& ModifyAnimBeHitShake(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimBeHitShake));
    return local_12.GetComp();
}
FC_AnimBeHitShake& ModifyOrAddAnimBeHitShake(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimBeHitShake));
    return local_12.GetComp();
}
const FC_AnimBeHitShake& GetAnimBeHitShake(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimBeHitShake));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimBeHitShake GetAnimBeHitShake_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AnimBeHitShake __r;
    bValid = false;
    bValid = ECSFunc_FC_AnimBeHitShake::GetAnimBeHitShake(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AnimBeHitShake GetDefaultedAnimBeHitShake(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimBeHitShake __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimBeHitShake);
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
FC_AnimBeHitShake GetDefaultedAnimBeHitShake_BP(const FECSEntity &inout Entity)
{
    FC_AnimBeHitShake __r;
    return __r;
}
UFUNCTION()
bool RemoveAnimBeHitShake(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimBeHitShake);
}
}
FECSMonitorRuntimeView __GetMonitorAnimBeHitShakeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimBeHitShake, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimBeHitShakeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimBeHitShake, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimBeHitShakeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimBeHitShake, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimBeHitShakeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimBeHitShake, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimBeHitShakeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimBeHitShake, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimBeHitShakeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimBeHitShake, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimBeHitShakeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimBeHitShake, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimBeHitShakeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimBeHitShake, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_NeedUpdateHitShakeTag
{
UFUNCTION()
bool HasNeedUpdateHitShakeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NeedUpdateHitShakeTag);
}
FC_NeedUpdateHitShakeTag& AssignNeedUpdateHitShakeTag(const FECSEntity &inout Entity, const FC_NeedUpdateHitShakeTag &inout DefaultValue = FC_NeedUpdateHitShakeTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NeedUpdateHitShakeTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNeedUpdateHitShakeTag_BP(const FECSEntity &inout Entity, const FC_NeedUpdateHitShakeTag &inout DefaultValue = FC_NeedUpdateHitShakeTag())
{
    ECSFunc_FC_NeedUpdateHitShakeTag::AssignNeedUpdateHitShakeTag(Entity, DefaultValue);
    return;
}
FC_NeedUpdateHitShakeTag& ModifyNeedUpdateHitShakeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NeedUpdateHitShakeTag));
    return local_12.GetComp();
}
FC_NeedUpdateHitShakeTag& ModifyOrAddNeedUpdateHitShakeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NeedUpdateHitShakeTag));
    return local_12.GetComp();
}
const FC_NeedUpdateHitShakeTag& GetNeedUpdateHitShakeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NeedUpdateHitShakeTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_NeedUpdateHitShakeTag GetNeedUpdateHitShakeTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_NeedUpdateHitShakeTag& local_4 = ECSFunc_FC_NeedUpdateHitShakeTag::GetNeedUpdateHitShakeTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_NeedUpdateHitShakeTag();
}
const FC_NeedUpdateHitShakeTag GetDefaultedNeedUpdateHitShakeTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NeedUpdateHitShakeTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NeedUpdateHitShakeTag);
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
FC_NeedUpdateHitShakeTag GetDefaultedNeedUpdateHitShakeTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_NeedUpdateHitShakeTag::GetDefaultedNeedUpdateHitShakeTag(Entity);
}
UFUNCTION()
bool RemoveNeedUpdateHitShakeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NeedUpdateHitShakeTag);
}
}
FECSMonitorRuntimeView __GetMonitorNeedUpdateHitShakeTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NeedUpdateHitShakeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNeedUpdateHitShakeTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NeedUpdateHitShakeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNeedUpdateHitShakeTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NeedUpdateHitShakeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNeedUpdateHitShakeTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NeedUpdateHitShakeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNeedUpdateHitShakeTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NeedUpdateHitShakeTag, bFixedFrame, bMustHandleAll);
}
void __MonitorNeedUpdateHitShakeTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NeedUpdateHitShakeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNeedUpdateHitShakeTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NeedUpdateHitShakeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNeedUpdateHitShakeTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NeedUpdateHitShakeTag, bFixedFrame, Details);
    return;
}
