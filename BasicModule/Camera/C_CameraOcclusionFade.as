
namespace __INTENRAL_FCS_CameraOcclusionFade_NS
{
    const TECSComponentDerivedPtr<FCS_CameraOcclusionFade> DerivedPtr = TECSComponentDerivedPtr<FCS_CameraOcclusionFade>();
    const FCS_CameraOcclusionFade DefaultValue = FCS_CameraOcclusionFade();
}
namespace __INTENRAL_FCS_CameraOcclusionFadeUpdated_NS
{
    const TECSComponentDerivedPtr<FCS_CameraOcclusionFadeUpdated> DerivedPtr = TECSComponentDerivedPtr<FCS_CameraOcclusionFadeUpdated>();
    const FCS_CameraOcclusionFadeUpdated DefaultValue = FCS_CameraOcclusionFadeUpdated();
}
namespace __INTENRAL_FC_CameraOcclusionFadeDisableCounter_NS
{
    const TECSComponentDerivedPtr<FC_CameraOcclusionFadeDisableCounter> DerivedPtr = TECSComponentDerivedPtr<FC_CameraOcclusionFadeDisableCounter>();
    const FC_CameraOcclusionFadeDisableCounter DefaultValue = FC_CameraOcclusionFadeDisableCounter();

}
struct FCameraOcclusionFadeItem
{
    UPROPERTY()
    float32 OcclusionFadeWeight = 0.0f;
    UPROPERTY()
    float32 OcclusionFadeTargetWeight = 0.0f;
    UPROPERTY()
    float32 OcclusionFadeWeightFreezeTimer = -1.0f;
    UPROPERTY()
    bool bFreezeOcclusionFadeWeight = false;
    UPROPERTY()
    float32 LogicFadeWeight = 0.0f;
    UPROPERTY()
    float32 PrevOcclusionFadeWeight = 0.0f;
    UPROPERTY()
    float32 PrevOcclusionTargetFadeWeight = 0.0f;
    UPROPERTY()
    float32 PrevLogicFadeWeight = 0.0f;
    UPROPERTY()
    bool bCompCached = false;
    UPROPERTY()
    TArray<UPrimitiveComponent> CachedFadeComponents;
    UPROPERTY()
    TArray<bool> SetEnableDynamicMaskedMaterialByFades;


}

struct FCS_CameraOcclusionFade : FECSSingleton
{
    UPROPERTY()
    TMap<TWeakObjectPtr<AActor>, FCameraOcclusionFadeItem> FadeObjects;

    FCS_CameraOcclusionFade()
    {
        return;
    }
}

struct FCS_CameraOcclusionFadeUpdated : FECSSingleton
{
    UPROPERTY()
    TArray<TWeakObjectPtr<AActor>> Actor;

    FCS_CameraOcclusionFadeUpdated()
    {
        return;
    }
}

struct FC_CameraOcclusionFadeDisableCounter : FECSComponent
{
    UPROPERTY()
    int Counter = 0;


}

namespace ECSFunc_FCS_CameraOcclusionFade
{
UFUNCTION()
bool HasCameraOcclusionFade(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CameraOcclusionFade);
}
FCS_CameraOcclusionFade& AssignCameraOcclusionFade(const FECSWorldPtr &inout World, const FCS_CameraOcclusionFade &inout DefaultValue = FCS_CameraOcclusionFade())
{
    UScriptStruct local_6 = FCS_CameraOcclusionFade;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCameraOcclusionFade_BP(const FECSWorldPtr &inout World, const FCS_CameraOcclusionFade &inout DefaultValue = FCS_CameraOcclusionFade())
{
    ECSFunc_FCS_CameraOcclusionFade::AssignCameraOcclusionFade(World, DefaultValue);
    return;
}
FCS_CameraOcclusionFade& ModifyCameraOcclusionFade(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CameraOcclusionFade;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CameraOcclusionFade& ModifyOrAddCameraOcclusionFade(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CameraOcclusionFade;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CameraOcclusionFade& GetCameraOcclusionFade(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CameraOcclusionFade;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CameraOcclusionFade GetCameraOcclusionFade_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CameraOcclusionFade __r;
    bValid = false;
    bValid = ECSFunc_FCS_CameraOcclusionFade::GetCameraOcclusionFade(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CameraOcclusionFade GetDefaultedCameraOcclusionFade(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CameraOcclusionFade __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CameraOcclusionFade);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_CameraOcclusionFade GetDefaultedCameraOcclusionFade_BP(const FECSWorldPtr &inout World)
{
    FCS_CameraOcclusionFade __r;
    return __r;
}
UFUNCTION()
bool RemoveCameraOcclusionFade(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CameraOcclusionFade);
}
}
void __MonitorCameraOcclusionFadeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CameraOcclusionFade, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraOcclusionFadeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CameraOcclusionFade, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraOcclusionFadeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CameraOcclusionFade, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CameraOcclusionFadeUpdated
{
UFUNCTION()
bool HasCameraOcclusionFadeUpdated(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CameraOcclusionFadeUpdated);
}
FCS_CameraOcclusionFadeUpdated& AssignCameraOcclusionFadeUpdated(const FECSWorldPtr &inout World, const FCS_CameraOcclusionFadeUpdated &inout DefaultValue = FCS_CameraOcclusionFadeUpdated())
{
    UScriptStruct local_6 = FCS_CameraOcclusionFadeUpdated;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCameraOcclusionFadeUpdated_BP(const FECSWorldPtr &inout World, const FCS_CameraOcclusionFadeUpdated &inout DefaultValue = FCS_CameraOcclusionFadeUpdated())
{
    ECSFunc_FCS_CameraOcclusionFadeUpdated::AssignCameraOcclusionFadeUpdated(World, DefaultValue);
    return;
}
FCS_CameraOcclusionFadeUpdated& ModifyCameraOcclusionFadeUpdated(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CameraOcclusionFadeUpdated;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CameraOcclusionFadeUpdated& ModifyOrAddCameraOcclusionFadeUpdated(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CameraOcclusionFadeUpdated;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CameraOcclusionFadeUpdated& GetCameraOcclusionFadeUpdated(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CameraOcclusionFadeUpdated;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CameraOcclusionFadeUpdated GetCameraOcclusionFadeUpdated_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CameraOcclusionFadeUpdated __r;
    bValid = false;
    bValid = ECSFunc_FCS_CameraOcclusionFadeUpdated::GetCameraOcclusionFadeUpdated(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CameraOcclusionFadeUpdated GetDefaultedCameraOcclusionFadeUpdated(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CameraOcclusionFadeUpdated __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CameraOcclusionFadeUpdated);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_CameraOcclusionFadeUpdated GetDefaultedCameraOcclusionFadeUpdated_BP(const FECSWorldPtr &inout World)
{
    FCS_CameraOcclusionFadeUpdated __r;
    return __r;
}
UFUNCTION()
bool RemoveCameraOcclusionFadeUpdated(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CameraOcclusionFadeUpdated);
}
}
void __MonitorCameraOcclusionFadeUpdatedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CameraOcclusionFadeUpdated, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraOcclusionFadeUpdatedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CameraOcclusionFadeUpdated, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraOcclusionFadeUpdatedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CameraOcclusionFadeUpdated, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CameraOcclusionFadeDisableCounter
{
UFUNCTION()
bool HasCameraOcclusionFadeDisableCounter(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CameraOcclusionFadeDisableCounter);
}
FC_CameraOcclusionFadeDisableCounter& AssignCameraOcclusionFadeDisableCounter(const FECSEntity &inout Entity, const FC_CameraOcclusionFadeDisableCounter &inout DefaultValue = FC_CameraOcclusionFadeDisableCounter())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CameraOcclusionFadeDisableCounter, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCameraOcclusionFadeDisableCounter_BP(const FECSEntity &inout Entity, const FC_CameraOcclusionFadeDisableCounter &inout DefaultValue = FC_CameraOcclusionFadeDisableCounter())
{
    ECSFunc_FC_CameraOcclusionFadeDisableCounter::AssignCameraOcclusionFadeDisableCounter(Entity, DefaultValue);
    return;
}
FC_CameraOcclusionFadeDisableCounter& ModifyCameraOcclusionFadeDisableCounter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CameraOcclusionFadeDisableCounter));
    return local_12.GetComp();
}
FC_CameraOcclusionFadeDisableCounter& ModifyOrAddCameraOcclusionFadeDisableCounter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CameraOcclusionFadeDisableCounter));
    return local_12.GetComp();
}
const FC_CameraOcclusionFadeDisableCounter& GetCameraOcclusionFadeDisableCounter(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CameraOcclusionFadeDisableCounter));
    return local_12.GetComp();
}
UFUNCTION()
FC_CameraOcclusionFadeDisableCounter GetCameraOcclusionFadeDisableCounter_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CameraOcclusionFadeDisableCounter& local_4 = ECSFunc_FC_CameraOcclusionFadeDisableCounter::GetCameraOcclusionFadeDisableCounter(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CameraOcclusionFadeDisableCounter();
}
const FC_CameraOcclusionFadeDisableCounter GetDefaultedCameraOcclusionFadeDisableCounter(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CameraOcclusionFadeDisableCounter __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CameraOcclusionFadeDisableCounter);
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
FC_CameraOcclusionFadeDisableCounter GetDefaultedCameraOcclusionFadeDisableCounter_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CameraOcclusionFadeDisableCounter::GetDefaultedCameraOcclusionFadeDisableCounter(Entity);
}
UFUNCTION()
bool RemoveCameraOcclusionFadeDisableCounter(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CameraOcclusionFadeDisableCounter);
}
}
FECSMonitorRuntimeView __GetMonitorCameraOcclusionFadeDisableCounterOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CameraOcclusionFadeDisableCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraOcclusionFadeDisableCounterOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CameraOcclusionFadeDisableCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraOcclusionFadeDisableCounterOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CameraOcclusionFadeDisableCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraOcclusionFadeDisableCounterOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CameraOcclusionFadeDisableCounter, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCameraOcclusionFadeDisableCounterOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CameraOcclusionFadeDisableCounter, bFixedFrame, bMustHandleAll);
}
void __MonitorCameraOcclusionFadeDisableCounterLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CameraOcclusionFadeDisableCounter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraOcclusionFadeDisableCounterActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CameraOcclusionFadeDisableCounter, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCameraOcclusionFadeDisableCounterModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CameraOcclusionFadeDisableCounter, bFixedFrame, Details);
    return;
}
