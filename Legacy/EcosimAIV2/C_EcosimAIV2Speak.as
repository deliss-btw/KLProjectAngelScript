
namespace __INTENRAL_FC_EcosimAIV2SpeakProgress_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2SpeakProgress> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2SpeakProgress>();
    const FC_EcosimAIV2SpeakProgress DefaultValue = FC_EcosimAIV2SpeakProgress();
}
namespace __INTENRAL_FC_EcosimAIV2PublicSpeakByDistance_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2PublicSpeakByDistance> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2PublicSpeakByDistance>();
    const FC_EcosimAIV2PublicSpeakByDistance DefaultValue = FC_EcosimAIV2PublicSpeakByDistance();
}
namespace __INTENRAL_FCS_EcosimAIV2GlobalSpeakData_NS
{
    const TECSComponentDerivedPtr<FCS_EcosimAIV2GlobalSpeakData> DerivedPtr = TECSComponentDerivedPtr<FCS_EcosimAIV2GlobalSpeakData>();
    const FCS_EcosimAIV2GlobalSpeakData DefaultValue = FCS_EcosimAIV2GlobalSpeakData();

}
struct FC_EcosimAIV2SpeakProgress : FECSComponent
{
    UPROPERTY()
    FFPTime TargetWorldTime;

    FC_EcosimAIV2SpeakProgress()
    {
        return;
    }
}

struct FC_EcosimAIV2PublicSpeakByDistance : FECSComponent
{
    UPROPERTY()
    TArray<FECSEntity> CachedPlayerControllerList;
    UPROPERTY()
    float32 SpeakTriggerDistance = 2000.0f;
    UPROPERTY()
    FFPTime LastTriggerTime = -1;
    UPROPERTY()
    float32 TriggerMinInterval = 20.0f;
    UPROPERTY()
    TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> SpeakData;


}

struct FCS_EcosimAIV2GlobalSpeakData : FECSSingleton
{
    UPROPERTY()
    TMap<FGameplayTag, FFPTime> PublicSpeakTimeByTag;

    FCS_EcosimAIV2GlobalSpeakData()
    {
        return;
    }
}

namespace ECSFunc_FC_EcosimAIV2SpeakProgress
{
UFUNCTION()
bool HasEcosimAIV2SpeakProgress(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SpeakProgress);
}
FC_EcosimAIV2SpeakProgress& AssignEcosimAIV2SpeakProgress(const FECSEntity &inout Entity, const FC_EcosimAIV2SpeakProgress &inout DefaultValue = FC_EcosimAIV2SpeakProgress())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SpeakProgress, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2SpeakProgress_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2SpeakProgress &inout DefaultValue = FC_EcosimAIV2SpeakProgress())
{
    ECSFunc_FC_EcosimAIV2SpeakProgress::AssignEcosimAIV2SpeakProgress(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2SpeakProgress& ModifyEcosimAIV2SpeakProgress(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SpeakProgress));
    return local_12.GetComp();
}
FC_EcosimAIV2SpeakProgress& ModifyOrAddEcosimAIV2SpeakProgress(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SpeakProgress));
    return local_12.GetComp();
}
const FC_EcosimAIV2SpeakProgress& GetEcosimAIV2SpeakProgress(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SpeakProgress));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2SpeakProgress GetEcosimAIV2SpeakProgress_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2SpeakProgress __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2SpeakProgress::GetEcosimAIV2SpeakProgress(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2SpeakProgress GetDefaultedEcosimAIV2SpeakProgress(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2SpeakProgress __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SpeakProgress);
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
FC_EcosimAIV2SpeakProgress GetDefaultedEcosimAIV2SpeakProgress_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2SpeakProgress __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2SpeakProgress(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SpeakProgress);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2SpeakProgressOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2SpeakProgress, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2SpeakProgressOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2SpeakProgress, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2SpeakProgressOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2SpeakProgress, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2SpeakProgressOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2SpeakProgress, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2SpeakProgressOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2SpeakProgress, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2SpeakProgressLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2SpeakProgress, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2SpeakProgressActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2SpeakProgress, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2SpeakProgressModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2SpeakProgress, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2PublicSpeakByDistance
{
UFUNCTION()
bool HasEcosimAIV2PublicSpeakByDistance(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PublicSpeakByDistance);
}
FC_EcosimAIV2PublicSpeakByDistance& AssignEcosimAIV2PublicSpeakByDistance(const FECSEntity &inout Entity, const FC_EcosimAIV2PublicSpeakByDistance &inout DefaultValue = FC_EcosimAIV2PublicSpeakByDistance())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PublicSpeakByDistance, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2PublicSpeakByDistance_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2PublicSpeakByDistance &inout DefaultValue = FC_EcosimAIV2PublicSpeakByDistance())
{
    ECSFunc_FC_EcosimAIV2PublicSpeakByDistance::AssignEcosimAIV2PublicSpeakByDistance(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2PublicSpeakByDistance& ModifyEcosimAIV2PublicSpeakByDistance(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PublicSpeakByDistance));
    return local_12.GetComp();
}
FC_EcosimAIV2PublicSpeakByDistance& ModifyOrAddEcosimAIV2PublicSpeakByDistance(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PublicSpeakByDistance));
    return local_12.GetComp();
}
const FC_EcosimAIV2PublicSpeakByDistance& GetEcosimAIV2PublicSpeakByDistance(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PublicSpeakByDistance));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2PublicSpeakByDistance GetEcosimAIV2PublicSpeakByDistance_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2PublicSpeakByDistance __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2PublicSpeakByDistance::GetEcosimAIV2PublicSpeakByDistance(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2PublicSpeakByDistance GetDefaultedEcosimAIV2PublicSpeakByDistance(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2PublicSpeakByDistance __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PublicSpeakByDistance);
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
FC_EcosimAIV2PublicSpeakByDistance GetDefaultedEcosimAIV2PublicSpeakByDistance_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2PublicSpeakByDistance __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2PublicSpeakByDistance(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PublicSpeakByDistance);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2PublicSpeakByDistanceOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2PublicSpeakByDistance, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2PublicSpeakByDistanceOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2PublicSpeakByDistance, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2PublicSpeakByDistanceOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2PublicSpeakByDistance, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2PublicSpeakByDistanceOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2PublicSpeakByDistance, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2PublicSpeakByDistanceOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2PublicSpeakByDistance, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2PublicSpeakByDistanceLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2PublicSpeakByDistance, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2PublicSpeakByDistanceActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2PublicSpeakByDistance, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2PublicSpeakByDistanceModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2PublicSpeakByDistance, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EcosimAIV2GlobalSpeakData
{
UFUNCTION()
bool HasEcosimAIV2GlobalSpeakData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcosimAIV2GlobalSpeakData);
}
FCS_EcosimAIV2GlobalSpeakData& AssignEcosimAIV2GlobalSpeakData(const FECSWorldPtr &inout World, const FCS_EcosimAIV2GlobalSpeakData &inout DefaultValue = FCS_EcosimAIV2GlobalSpeakData())
{
    UScriptStruct local_6 = FCS_EcosimAIV2GlobalSpeakData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2GlobalSpeakData_BP(const FECSWorldPtr &inout World, const FCS_EcosimAIV2GlobalSpeakData &inout DefaultValue = FCS_EcosimAIV2GlobalSpeakData())
{
    ECSFunc_FCS_EcosimAIV2GlobalSpeakData::AssignEcosimAIV2GlobalSpeakData(World, DefaultValue);
    return;
}
FCS_EcosimAIV2GlobalSpeakData& ModifyEcosimAIV2GlobalSpeakData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2GlobalSpeakData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcosimAIV2GlobalSpeakData& ModifyOrAddEcosimAIV2GlobalSpeakData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2GlobalSpeakData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcosimAIV2GlobalSpeakData& GetEcosimAIV2GlobalSpeakData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2GlobalSpeakData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcosimAIV2GlobalSpeakData GetEcosimAIV2GlobalSpeakData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcosimAIV2GlobalSpeakData __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcosimAIV2GlobalSpeakData::GetEcosimAIV2GlobalSpeakData(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcosimAIV2GlobalSpeakData GetDefaultedEcosimAIV2GlobalSpeakData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcosimAIV2GlobalSpeakData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcosimAIV2GlobalSpeakData);
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
FCS_EcosimAIV2GlobalSpeakData GetDefaultedEcosimAIV2GlobalSpeakData_BP(const FECSWorldPtr &inout World)
{
    FCS_EcosimAIV2GlobalSpeakData __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2GlobalSpeakData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcosimAIV2GlobalSpeakData);
}
}
void __MonitorEcosimAIV2GlobalSpeakDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcosimAIV2GlobalSpeakData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2GlobalSpeakDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcosimAIV2GlobalSpeakData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2GlobalSpeakDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcosimAIV2GlobalSpeakData, bFixedFrame, Details);
    return;
}
