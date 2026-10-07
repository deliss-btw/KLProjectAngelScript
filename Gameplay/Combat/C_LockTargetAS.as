
enum EPreChangeTargetReason
{
    Default,
    NATIVE_MAX = 0,
    AITargetting,
    ESM,
    Executing,
    DisableLockTarget,
    Hidden,
}

namespace __INTENRAL_FC_LockTargetTrigger_NS
{
    const TECSComponentDerivedPtr<FC_LockTargetTrigger> DerivedPtr = TECSComponentDerivedPtr<FC_LockTargetTrigger>();
    const FC_LockTargetTrigger DefaultValue = FC_LockTargetTrigger();
}
namespace __INTENRAL_FC_SoftLockTargetTag_NS
{
    const TECSComponentDerivedPtr<FC_SoftLockTargetTag> DerivedPtr = TECSComponentDerivedPtr<FC_SoftLockTargetTag>();
    const FC_SoftLockTargetTag DefaultValue = FC_SoftLockTargetTag();
}
namespace __INTENRAL_FC_AutoClearLockTarget_NS
{
    const TECSComponentDerivedPtr<FC_AutoClearLockTarget> DerivedPtr = TECSComponentDerivedPtr<FC_AutoClearLockTarget>();
    const FC_AutoClearLockTarget DefaultValue = FC_AutoClearLockTarget();
}
namespace __INTENRAL_FC_AILockPointRatingOverride_NS
{
    const TECSComponentDerivedPtr<FC_AILockPointRatingOverride> DerivedPtr = TECSComponentDerivedPtr<FC_AILockPointRatingOverride>();
    const FC_AILockPointRatingOverride DefaultValue = FC_AILockPointRatingOverride();

}
struct FLockTargetScoreInfo
{
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    float32 Score;


}

struct FLockTargetResult
{
    UPROPERTY()
    bool bValid;
    UPROPERTY()
    FECSEntity LockTarget = ENTITY_NULL;
    UPROPERTY()
    FVector LockPointPosition;
    UPROPERTY()
    int LockPointIndex = -1;
    UPROPERTY()
    int ArrayIndex = -1;
    UPROPERTY()
    float32 NewScore = 0.0f;


}

struct FLockPointInfo
{
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    FRotator Rotation;
    UPROPERTY()
    float32 Radius = 0.0f;
    UPROPERTY()
    int Index = -1;
    UPROPERTY()
    int SubIndex = -1;
    UPROPERTY()
    bool bFanShapeSoftLockRangeSearch = true;


}

struct FAILockPointRatingResult
{
    UPROPERTY()
    FLockPointInfo LockPointInfo;
    UPROPERTY()
    float32 DistanceXY = 0.0f;
    UPROPERTY()
    float32 DistanceZ = 0.0f;
    UPROPERTY()
    float32 ScoreXY = 0.0f;
    UPROPERTY()
    float32 ScoreZ = 0.0f;
    UPROPERTY()
    float32 TotalScore = 0.0f;


}

struct FLockTargetOverrideInfo
{
    UPROPERTY()
    FVector ViewOriginPos;
    UPROPERTY()
    FRotator3f ViewDir;
    UPROPERTY()
    FVector MoveOriginPos;
    UPROPERTY()
    FRotator3f MoveDir;
    UPROPERTY()
    bool bNoInput;
    UPROPERTY()
    bool bOverrideMaxLockDistance;
    UPROPERTY()
    float32 MaxMaxLockDistance;


    float32 GetQueryMaxLockDistance(const FLockTargetConfigData &inout ConfigData) const
    {
        float32 local_3;
        if (this.bOverrideMaxLockDistance)
        {
            local_3 = this.MaxMaxLockDistance;
        }
        else
        {
            local_3 = ConfigData.GetQueryLockDistance();
        }
        return local_3 + 200.0f;
    }
}

struct FC_LockTargetTrigger : FECSComponent
{
    UPROPERTY()
    FFPTime Time;
    UPROPERTY()
    bool bCanRepickNull = true;


}

struct FC_SoftLockTargetTag : FECSComponent
{
    FC_SoftLockTargetTag()
    {
        return;
    }
}

struct FC_AutoClearLockTarget : FECSComponent
{
    UPROPERTY()
    FFPTime LastAutoRecordTime;

    FC_AutoClearLockTarget()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FC_AILockPointRatingOverride : FECSComponent
{
    UPROPERTY()
    TArray<TDataObjectPtr<FAILockPointRatingConfig>> ConfigStack;

    FC_AILockPointRatingOverride()
    {
        return;
    }
}

namespace ECSFunc_FC_LockTargetTrigger
{
UFUNCTION()
bool HasLockTargetTrigger(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LockTargetTrigger);
}
FC_LockTargetTrigger& AssignLockTargetTrigger(const FECSEntity &inout Entity, const FC_LockTargetTrigger &inout DefaultValue = FC_LockTargetTrigger())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LockTargetTrigger, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLockTargetTrigger_BP(const FECSEntity &inout Entity, const FC_LockTargetTrigger &inout DefaultValue = FC_LockTargetTrigger())
{
    ECSFunc_FC_LockTargetTrigger::AssignLockTargetTrigger(Entity, DefaultValue);
    return;
}
FC_LockTargetTrigger& ModifyLockTargetTrigger(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LockTargetTrigger));
    return local_12.GetComp();
}
FC_LockTargetTrigger& ModifyOrAddLockTargetTrigger(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LockTargetTrigger));
    return local_12.GetComp();
}
const FC_LockTargetTrigger& GetLockTargetTrigger(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LockTargetTrigger));
    return local_12.GetComp();
}
UFUNCTION()
FC_LockTargetTrigger GetLockTargetTrigger_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LockTargetTrigger __r;
    bValid = false;
    bValid = ECSFunc_FC_LockTargetTrigger::GetLockTargetTrigger(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LockTargetTrigger GetDefaultedLockTargetTrigger(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LockTargetTrigger __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LockTargetTrigger);
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
FC_LockTargetTrigger GetDefaultedLockTargetTrigger_BP(const FECSEntity &inout Entity)
{
    FC_LockTargetTrigger __r;
    return __r;
}
UFUNCTION()
bool RemoveLockTargetTrigger(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LockTargetTrigger);
}
}
FECSMonitorRuntimeView __GetMonitorLockTargetTriggerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LockTargetTrigger, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLockTargetTriggerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LockTargetTrigger, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLockTargetTriggerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LockTargetTrigger, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLockTargetTriggerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LockTargetTrigger, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLockTargetTriggerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LockTargetTrigger, bFixedFrame, bMustHandleAll);
}
void __MonitorLockTargetTriggerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LockTargetTrigger, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLockTargetTriggerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LockTargetTrigger, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLockTargetTriggerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LockTargetTrigger, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SoftLockTargetTag
{
UFUNCTION()
bool HasSoftLockTargetTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SoftLockTargetTag);
}
FC_SoftLockTargetTag& AssignSoftLockTargetTag(const FECSEntity &inout Entity, const FC_SoftLockTargetTag &inout DefaultValue = FC_SoftLockTargetTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SoftLockTargetTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSoftLockTargetTag_BP(const FECSEntity &inout Entity, const FC_SoftLockTargetTag &inout DefaultValue = FC_SoftLockTargetTag())
{
    ECSFunc_FC_SoftLockTargetTag::AssignSoftLockTargetTag(Entity, DefaultValue);
    return;
}
FC_SoftLockTargetTag& ModifySoftLockTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SoftLockTargetTag));
    return local_12.GetComp();
}
FC_SoftLockTargetTag& ModifyOrAddSoftLockTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SoftLockTargetTag));
    return local_12.GetComp();
}
const FC_SoftLockTargetTag& GetSoftLockTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SoftLockTargetTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_SoftLockTargetTag GetSoftLockTargetTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SoftLockTargetTag& local_4 = ECSFunc_FC_SoftLockTargetTag::GetSoftLockTargetTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SoftLockTargetTag();
}
const FC_SoftLockTargetTag GetDefaultedSoftLockTargetTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SoftLockTargetTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SoftLockTargetTag);
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
FC_SoftLockTargetTag GetDefaultedSoftLockTargetTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SoftLockTargetTag::GetDefaultedSoftLockTargetTag(Entity);
}
UFUNCTION()
bool RemoveSoftLockTargetTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SoftLockTargetTag);
}
}
FECSMonitorRuntimeView __GetMonitorSoftLockTargetTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SoftLockTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSoftLockTargetTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SoftLockTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSoftLockTargetTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SoftLockTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSoftLockTargetTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SoftLockTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSoftLockTargetTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SoftLockTargetTag, bFixedFrame, bMustHandleAll);
}
void __MonitorSoftLockTargetTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SoftLockTargetTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSoftLockTargetTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SoftLockTargetTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSoftLockTargetTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SoftLockTargetTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AutoClearLockTarget
{
UFUNCTION()
bool HasAutoClearLockTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AutoClearLockTarget);
}
FC_AutoClearLockTarget& AssignAutoClearLockTarget(const FECSEntity &inout Entity, const FC_AutoClearLockTarget &inout DefaultValue = FC_AutoClearLockTarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AutoClearLockTarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAutoClearLockTarget_BP(const FECSEntity &inout Entity, const FC_AutoClearLockTarget &inout DefaultValue = FC_AutoClearLockTarget())
{
    ECSFunc_FC_AutoClearLockTarget::AssignAutoClearLockTarget(Entity, DefaultValue);
    return;
}
FC_AutoClearLockTarget& ModifyAutoClearLockTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AutoClearLockTarget));
    return local_12.GetComp();
}
FC_AutoClearLockTarget& ModifyOrAddAutoClearLockTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AutoClearLockTarget));
    return local_12.GetComp();
}
const FC_AutoClearLockTarget& GetAutoClearLockTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AutoClearLockTarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_AutoClearLockTarget GetAutoClearLockTarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AutoClearLockTarget __r;
    bValid = false;
    bValid = ECSFunc_FC_AutoClearLockTarget::GetAutoClearLockTarget(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AutoClearLockTarget GetDefaultedAutoClearLockTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AutoClearLockTarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AutoClearLockTarget);
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
FC_AutoClearLockTarget GetDefaultedAutoClearLockTarget_BP(const FECSEntity &inout Entity)
{
    FC_AutoClearLockTarget __r;
    return __r;
}
UFUNCTION()
bool RemoveAutoClearLockTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AutoClearLockTarget);
}
}
FECSMonitorRuntimeView __GetMonitorAutoClearLockTargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AutoClearLockTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoClearLockTargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AutoClearLockTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoClearLockTargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AutoClearLockTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoClearLockTargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AutoClearLockTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoClearLockTargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AutoClearLockTarget, bFixedFrame, bMustHandleAll);
}
void __MonitorAutoClearLockTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AutoClearLockTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoClearLockTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AutoClearLockTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoClearLockTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AutoClearLockTarget, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AILockPointRatingOverride
{
UFUNCTION()
bool HasAILockPointRatingOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AILockPointRatingOverride);
}
FC_AILockPointRatingOverride& AssignAILockPointRatingOverride(const FECSEntity &inout Entity, const FC_AILockPointRatingOverride &inout DefaultValue = FC_AILockPointRatingOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AILockPointRatingOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAILockPointRatingOverride_BP(const FECSEntity &inout Entity, const FC_AILockPointRatingOverride &inout DefaultValue = FC_AILockPointRatingOverride())
{
    ECSFunc_FC_AILockPointRatingOverride::AssignAILockPointRatingOverride(Entity, DefaultValue);
    return;
}
FC_AILockPointRatingOverride& ModifyAILockPointRatingOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AILockPointRatingOverride));
    return local_12.GetComp();
}
FC_AILockPointRatingOverride& ModifyOrAddAILockPointRatingOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AILockPointRatingOverride));
    return local_12.GetComp();
}
const FC_AILockPointRatingOverride& GetAILockPointRatingOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AILockPointRatingOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_AILockPointRatingOverride GetAILockPointRatingOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AILockPointRatingOverride __r;
    bValid = false;
    bValid = ECSFunc_FC_AILockPointRatingOverride::GetAILockPointRatingOverride(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AILockPointRatingOverride GetDefaultedAILockPointRatingOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AILockPointRatingOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AILockPointRatingOverride);
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
FC_AILockPointRatingOverride GetDefaultedAILockPointRatingOverride_BP(const FECSEntity &inout Entity)
{
    FC_AILockPointRatingOverride __r;
    return __r;
}
UFUNCTION()
bool RemoveAILockPointRatingOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AILockPointRatingOverride);
}
}
FECSMonitorRuntimeView __GetMonitorAILockPointRatingOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AILockPointRatingOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAILockPointRatingOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AILockPointRatingOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAILockPointRatingOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AILockPointRatingOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAILockPointRatingOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AILockPointRatingOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAILockPointRatingOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AILockPointRatingOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorAILockPointRatingOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AILockPointRatingOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAILockPointRatingOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AILockPointRatingOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAILockPointRatingOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AILockPointRatingOverride, bFixedFrame, Details);
    return;
}
