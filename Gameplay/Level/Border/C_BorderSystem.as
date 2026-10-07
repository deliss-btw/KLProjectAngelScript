
enum EBorderType
{
    Bigworld,
    Commission,
    Mission,
}

enum EBorderWarningType
{
    Period,
    Permanent,
}

enum EKLBorderAcrossTeleportMode
{
    NearestTeleporter,
    NearestInnerPoint,
}

namespace __INTENRAL_FC_BorderWarningActivateTimes_NS
{
    const TECSComponentDerivedPtr<FC_BorderWarningActivateTimes> DerivedPtr = TECSComponentDerivedPtr<FC_BorderWarningActivateTimes>();
    const FC_BorderWarningActivateTimes DefaultValue = FC_BorderWarningActivateTimes();
}
namespace __INTENRAL_FC_BorderActivatingWarningFX_NS
{
    const TECSComponentDerivedPtr<FC_BorderActivatingWarningFX> DerivedPtr = TECSComponentDerivedPtr<FC_BorderActivatingWarningFX>();
    const FC_BorderActivatingWarningFX DefaultValue = FC_BorderActivatingWarningFX();
}
namespace __INTENRAL_FC_BorderWarningPendingDeactivateTag_NS
{
    const TECSComponentDerivedPtr<FC_BorderWarningPendingDeactivateTag> DerivedPtr = TECSComponentDerivedPtr<FC_BorderWarningPendingDeactivateTag>();
    const FC_BorderWarningPendingDeactivateTag DefaultValue = FC_BorderWarningPendingDeactivateTag();
}
namespace __INTENRAL_FC_BorderDynamicMeshInterpState_NS
{
    const TECSComponentDerivedPtr<FC_BorderDynamicMeshInterpState> DerivedPtr = TECSComponentDerivedPtr<FC_BorderDynamicMeshInterpState>();
    const FC_BorderDynamicMeshInterpState DefaultValue = FC_BorderDynamicMeshInterpState();
}
namespace __INTENRAL_FCE_ActivateBorderWarningEffect_NS
{
    const TECSEventDerivedPtr<FCE_ActivateBorderWarningEffect> DerivedPtr = TECSEventDerivedPtr<FCE_ActivateBorderWarningEffect>();
}
namespace __INTENRAL_FCE_DeactivateBorderWarningEffect_NS
{
    const TECSEventDerivedPtr<FCE_DeactivateBorderWarningEffect> DerivedPtr = TECSEventDerivedPtr<FCE_DeactivateBorderWarningEffect>();

}
struct FCE_ActivateBorderWarningEffect : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity BorderEntity;

    FCE_ActivateBorderWarningEffect()
    {
        return;
    }
}

struct FCE_DeactivateBorderWarningEffect : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity BorderEntity;

    FCE_DeactivateBorderWarningEffect()
    {
        return;
    }
}

struct FC_BorderWarningActivateTimes : FECSComponent
{
    UPROPERTY()
    TMap<FECSEntity, FFPTime> ActivateTimes;

    FC_BorderWarningActivateTimes()
    {
        return;
    }
}

struct FC_BorderActivatingWarningFX : FECSComponent
{
    UPROPERTY()
    TArray<FECSEntity> FXEntities;

    FC_BorderActivatingWarningFX()
    {
        return;
    }
}

struct FC_BorderWarningPendingDeactivateTag : FECSComponent
{
    FC_BorderWarningPendingDeactivateTag()
    {
        return;
    }
}

struct FBorderDynamicMeshInterpData
{
    UPROPERTY()
    FVector CurrentPos;
    UPROPERTY()
    FVector StartPos = FVector::ZeroVector;
    UPROPERTY()
    FVector TargetPos = FVector::ZeroVector;
    UPROPERTY()
    float32 ElapsedTime = 0.0f;
    UPROPERTY()
    float32 Duration = 0.0f;
    UPROPERTY()
    bool bCompleted = true;


}

struct FC_BorderDynamicMeshInterpState : FECSComponent
{
    UPROPERTY()
    TMap<FECSEntity, FBorderDynamicMeshInterpData> InterpData;

    FC_BorderDynamicMeshInterpState()
    {
        return;
    }
}

namespace ECSFunc_FC_BorderWarningActivateTimes
{
UFUNCTION()
bool HasBorderWarningActivateTimes(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningActivateTimes);
}
FC_BorderWarningActivateTimes& AssignBorderWarningActivateTimes(const FECSEntity &inout Entity, const FC_BorderWarningActivateTimes &inout DefaultValue = FC_BorderWarningActivateTimes())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningActivateTimes, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBorderWarningActivateTimes_BP(const FECSEntity &inout Entity, const FC_BorderWarningActivateTimes &inout DefaultValue = FC_BorderWarningActivateTimes())
{
    ECSFunc_FC_BorderWarningActivateTimes::AssignBorderWarningActivateTimes(Entity, DefaultValue);
    return;
}
FC_BorderWarningActivateTimes& ModifyBorderWarningActivateTimes(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningActivateTimes));
    return local_12.GetComp();
}
FC_BorderWarningActivateTimes& ModifyOrAddBorderWarningActivateTimes(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningActivateTimes));
    return local_12.GetComp();
}
const FC_BorderWarningActivateTimes& GetBorderWarningActivateTimes(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningActivateTimes));
    return local_12.GetComp();
}
UFUNCTION()
FC_BorderWarningActivateTimes GetBorderWarningActivateTimes_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BorderWarningActivateTimes __r;
    bValid = false;
    bValid = ECSFunc_FC_BorderWarningActivateTimes::GetBorderWarningActivateTimes(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BorderWarningActivateTimes GetDefaultedBorderWarningActivateTimes(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BorderWarningActivateTimes __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningActivateTimes);
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
FC_BorderWarningActivateTimes GetDefaultedBorderWarningActivateTimes_BP(const FECSEntity &inout Entity)
{
    FC_BorderWarningActivateTimes __r;
    return __r;
}
UFUNCTION()
bool RemoveBorderWarningActivateTimes(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningActivateTimes);
}
}
FECSMonitorRuntimeView __GetMonitorBorderWarningActivateTimesOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BorderWarningActivateTimes, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderWarningActivateTimesOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BorderWarningActivateTimes, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderWarningActivateTimesOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BorderWarningActivateTimes, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderWarningActivateTimesOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BorderWarningActivateTimes, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderWarningActivateTimesOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BorderWarningActivateTimes, bFixedFrame, bMustHandleAll);
}
void __MonitorBorderWarningActivateTimesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BorderWarningActivateTimes, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBorderWarningActivateTimesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BorderWarningActivateTimes, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBorderWarningActivateTimesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BorderWarningActivateTimes, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BorderActivatingWarningFX
{
UFUNCTION()
bool HasBorderActivatingWarningFX(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BorderActivatingWarningFX);
}
FC_BorderActivatingWarningFX& AssignBorderActivatingWarningFX(const FECSEntity &inout Entity, const FC_BorderActivatingWarningFX &inout DefaultValue = FC_BorderActivatingWarningFX())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BorderActivatingWarningFX, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBorderActivatingWarningFX_BP(const FECSEntity &inout Entity, const FC_BorderActivatingWarningFX &inout DefaultValue = FC_BorderActivatingWarningFX())
{
    ECSFunc_FC_BorderActivatingWarningFX::AssignBorderActivatingWarningFX(Entity, DefaultValue);
    return;
}
FC_BorderActivatingWarningFX& ModifyBorderActivatingWarningFX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BorderActivatingWarningFX));
    return local_12.GetComp();
}
FC_BorderActivatingWarningFX& ModifyOrAddBorderActivatingWarningFX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BorderActivatingWarningFX));
    return local_12.GetComp();
}
const FC_BorderActivatingWarningFX& GetBorderActivatingWarningFX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BorderActivatingWarningFX));
    return local_12.GetComp();
}
UFUNCTION()
FC_BorderActivatingWarningFX GetBorderActivatingWarningFX_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BorderActivatingWarningFX __r;
    bValid = false;
    bValid = ECSFunc_FC_BorderActivatingWarningFX::GetBorderActivatingWarningFX(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BorderActivatingWarningFX GetDefaultedBorderActivatingWarningFX(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BorderActivatingWarningFX __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BorderActivatingWarningFX);
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
FC_BorderActivatingWarningFX GetDefaultedBorderActivatingWarningFX_BP(const FECSEntity &inout Entity)
{
    FC_BorderActivatingWarningFX __r;
    return __r;
}
UFUNCTION()
bool RemoveBorderActivatingWarningFX(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BorderActivatingWarningFX);
}
}
FECSMonitorRuntimeView __GetMonitorBorderActivatingWarningFXOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BorderActivatingWarningFX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderActivatingWarningFXOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BorderActivatingWarningFX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderActivatingWarningFXOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BorderActivatingWarningFX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderActivatingWarningFXOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BorderActivatingWarningFX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderActivatingWarningFXOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BorderActivatingWarningFX, bFixedFrame, bMustHandleAll);
}
void __MonitorBorderActivatingWarningFXLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BorderActivatingWarningFX, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBorderActivatingWarningFXActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BorderActivatingWarningFX, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBorderActivatingWarningFXModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BorderActivatingWarningFX, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BorderWarningPendingDeactivateTag
{
UFUNCTION()
bool HasBorderWarningPendingDeactivateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningPendingDeactivateTag);
}
FC_BorderWarningPendingDeactivateTag& AssignBorderWarningPendingDeactivateTag(const FECSEntity &inout Entity, const FC_BorderWarningPendingDeactivateTag &inout DefaultValue = FC_BorderWarningPendingDeactivateTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningPendingDeactivateTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBorderWarningPendingDeactivateTag_BP(const FECSEntity &inout Entity, const FC_BorderWarningPendingDeactivateTag &inout DefaultValue = FC_BorderWarningPendingDeactivateTag())
{
    ECSFunc_FC_BorderWarningPendingDeactivateTag::AssignBorderWarningPendingDeactivateTag(Entity, DefaultValue);
    return;
}
FC_BorderWarningPendingDeactivateTag& ModifyBorderWarningPendingDeactivateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningPendingDeactivateTag));
    return local_12.GetComp();
}
FC_BorderWarningPendingDeactivateTag& ModifyOrAddBorderWarningPendingDeactivateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningPendingDeactivateTag));
    return local_12.GetComp();
}
const FC_BorderWarningPendingDeactivateTag& GetBorderWarningPendingDeactivateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningPendingDeactivateTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_BorderWarningPendingDeactivateTag GetBorderWarningPendingDeactivateTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BorderWarningPendingDeactivateTag& local_4 = ECSFunc_FC_BorderWarningPendingDeactivateTag::GetBorderWarningPendingDeactivateTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BorderWarningPendingDeactivateTag();
}
const FC_BorderWarningPendingDeactivateTag GetDefaultedBorderWarningPendingDeactivateTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BorderWarningPendingDeactivateTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningPendingDeactivateTag);
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
FC_BorderWarningPendingDeactivateTag GetDefaultedBorderWarningPendingDeactivateTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BorderWarningPendingDeactivateTag::GetDefaultedBorderWarningPendingDeactivateTag(Entity);
}
UFUNCTION()
bool RemoveBorderWarningPendingDeactivateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BorderWarningPendingDeactivateTag);
}
}
FECSMonitorRuntimeView __GetMonitorBorderWarningPendingDeactivateTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BorderWarningPendingDeactivateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderWarningPendingDeactivateTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BorderWarningPendingDeactivateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderWarningPendingDeactivateTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BorderWarningPendingDeactivateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderWarningPendingDeactivateTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BorderWarningPendingDeactivateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderWarningPendingDeactivateTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BorderWarningPendingDeactivateTag, bFixedFrame, bMustHandleAll);
}
void __MonitorBorderWarningPendingDeactivateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BorderWarningPendingDeactivateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBorderWarningPendingDeactivateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BorderWarningPendingDeactivateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBorderWarningPendingDeactivateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BorderWarningPendingDeactivateTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BorderDynamicMeshInterpState
{
UFUNCTION()
bool HasBorderDynamicMeshInterpState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BorderDynamicMeshInterpState);
}
FC_BorderDynamicMeshInterpState& AssignBorderDynamicMeshInterpState(const FECSEntity &inout Entity, const FC_BorderDynamicMeshInterpState &inout DefaultValue = FC_BorderDynamicMeshInterpState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BorderDynamicMeshInterpState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBorderDynamicMeshInterpState_BP(const FECSEntity &inout Entity, const FC_BorderDynamicMeshInterpState &inout DefaultValue = FC_BorderDynamicMeshInterpState())
{
    ECSFunc_FC_BorderDynamicMeshInterpState::AssignBorderDynamicMeshInterpState(Entity, DefaultValue);
    return;
}
FC_BorderDynamicMeshInterpState& ModifyBorderDynamicMeshInterpState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BorderDynamicMeshInterpState));
    return local_12.GetComp();
}
FC_BorderDynamicMeshInterpState& ModifyOrAddBorderDynamicMeshInterpState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BorderDynamicMeshInterpState));
    return local_12.GetComp();
}
const FC_BorderDynamicMeshInterpState& GetBorderDynamicMeshInterpState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BorderDynamicMeshInterpState));
    return local_12.GetComp();
}
UFUNCTION()
FC_BorderDynamicMeshInterpState GetBorderDynamicMeshInterpState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BorderDynamicMeshInterpState __r;
    bValid = false;
    bValid = ECSFunc_FC_BorderDynamicMeshInterpState::GetBorderDynamicMeshInterpState(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BorderDynamicMeshInterpState GetDefaultedBorderDynamicMeshInterpState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BorderDynamicMeshInterpState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BorderDynamicMeshInterpState);
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
FC_BorderDynamicMeshInterpState GetDefaultedBorderDynamicMeshInterpState_BP(const FECSEntity &inout Entity)
{
    FC_BorderDynamicMeshInterpState __r;
    return __r;
}
UFUNCTION()
bool RemoveBorderDynamicMeshInterpState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BorderDynamicMeshInterpState);
}
}
FECSMonitorRuntimeView __GetMonitorBorderDynamicMeshInterpStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BorderDynamicMeshInterpState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderDynamicMeshInterpStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BorderDynamicMeshInterpState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderDynamicMeshInterpStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BorderDynamicMeshInterpState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderDynamicMeshInterpStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BorderDynamicMeshInterpState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBorderDynamicMeshInterpStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BorderDynamicMeshInterpState, bFixedFrame, bMustHandleAll);
}
void __MonitorBorderDynamicMeshInterpStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BorderDynamicMeshInterpState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBorderDynamicMeshInterpStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BorderDynamicMeshInterpState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBorderDynamicMeshInterpStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BorderDynamicMeshInterpState, bFixedFrame, Details);
    return;
}
