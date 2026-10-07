
namespace __INTENRAL_FCS_ObjectiveManager_NS
{
    const TECSComponentDerivedPtr<FCS_ObjectiveManager> DerivedPtr = TECSComponentDerivedPtr<FCS_ObjectiveManager>();
    const FCS_ObjectiveManager DefaultValue = FCS_ObjectiveManager();
}
namespace __INTENRAL_FCS_ManualSetObjectiveStatus_NS
{
    const TECSComponentDerivedPtr<FCS_ManualSetObjectiveStatus> DerivedPtr = TECSComponentDerivedPtr<FCS_ManualSetObjectiveStatus>();
    const FCS_ManualSetObjectiveStatus DefaultValue = FCS_ManualSetObjectiveStatus();
}
namespace __INTENRAL_FCE_ObjectiveProgressUpdated_NS
{
    const TECSEventDerivedPtr<FCE_ObjectiveProgressUpdated> DerivedPtr = TECSEventDerivedPtr<FCE_ObjectiveProgressUpdated>();
}
namespace __INTENRAL_FCE_ObjectiveStatusChanged_NS
{
    const TECSEventDerivedPtr<FCE_ObjectiveStatusChanged> DerivedPtr = TECSEventDerivedPtr<FCE_ObjectiveStatusChanged>();
}
namespace __INTENRAL_FCE_ObjectiveGroupNewChildActivated_NS
{
    const TECSEventDerivedPtr<FCE_ObjectiveGroupNewChildActivated> DerivedPtr = TECSEventDerivedPtr<FCE_ObjectiveGroupNewChildActivated>();

}
struct FObjectiveContext
{
    UPROPERTY()
    FECSEntity ContextEntity;
    UPROPERTY()
    EConditionUsage ConditionUsage;
    UPROPERTY()
    uint UniqueIdForUsage;

    FObjectiveContext()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FObjectiveContext(const FECSEntity &inout InContextEntity, const EConditionUsage InConditionUsage = EConditionUsage::None, const uint InUniqueIdForUsage = 0)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FObjectiveConditionInfo
{
    UPROPERTY()
    uint GSCondDataId;
    UPROPERTY()
    TDataObjectPtr<FConditionConfigBase> ConditionConfig;
    UPROPERTY()
    FConditionIdentifier ConditionIdentifier;
    UPROPERTY()
    FConditionInstanceHandle ConditionHandle;
    UPROPERTY()
    int ProgressValue;
    UPROPERTY()
    int TargetProgressValue;


    bool IsSet() const
    {
        return this.ConditionConfig.IsSet();
    }
    bool IsGSCondition() const
    {
        int local_2 = 0;
        if (!(this.ConditionConfig.IsSet()))
        {
            return false;
        }
        return (local_2 == 1);
    }
    bool IsReached() const
    {
        if (this.IsGSCondition())
        {
            return false;
        }
        return ::ConditionUtils::IsReached(this.ConditionHandle);
    }
    FString ToString() const
    {
        return FString().Append(this.ConditionConfig.GetDataName()).Append(" ").Append(this.ProgressValue).Append("/").Append(this.TargetProgressValue);
    }
}

struct FObjectiveInstance
{
    UPROPERTY()
    uint InstanceId;
    UPROPERTY()
    uint ObjectiveId;
    UPROPERTY()
    EObjectiveStatus Status;
    UPROPERTY()
    EObjectiveFinishType FinishType;
    UPROPERTY()
    TMap<uint, uint> ChildObjectiveMap;
    UPROPERTY()
    FObjectiveConditionInfo FinishConditionInfo;
    UPROPERTY()
    FObjectiveConditionInfo FailConditionInfo;
    UPROPERTY()
    FObjectiveContext Context;


    int GetFinishProgressValue() const
    {
        int local_2;
        if (this.FinishConditionInfo.IsSet())
        {
            local_2 = this.FinishConditionInfo.ProgressValue;
        }
        else
        {
            local_2 = 0;
        }
        return local_2;
    }
    int GetFailProgressValue() const
    {
        int local_2;
        if (this.FailConditionInfo.IsSet())
        {
            local_2 = this.FailConditionInfo.ProgressValue;
        }
        else
        {
            local_2 = 0;
        }
        return local_2;
    }
}

struct FCS_ObjectiveManager : FECSSingleton
{
    UPROPERTY()
    uint NextInstanceId = 1;
    UPROPERTY()
    TMap<uint, FObjectiveInstance> ActiveObjectives;


}

struct FCS_ManualSetObjectiveStatus : FECSSingleton
{
    UPROPERTY()
    TMap<uint, EObjectiveStatus> ObjectiveStatusMap;

    FCS_ManualSetObjectiveStatus()
    {
        return;
    }
}

struct FCE_ObjectiveProgressUpdated : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint ObjectiveInstanceId;
    UPROPERTY()
    uint ObjectiveId;
    UPROPERTY()
    bool bIsFinishProgress;
    UPROPERTY()
    int NewProgressValue;


}

struct FCE_ObjectiveStatusChanged : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint ObjectiveInstanceId;
    UPROPERTY()
    uint ObjectiveId;
    UPROPERTY()
    EObjectiveStatus Status;


}

struct FCE_ObjectiveGroupNewChildActivated : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint GroupInstanceId;
    UPROPERTY()
    uint NewChildInstanceId;


}

namespace ECSFunc_FCS_ObjectiveManager
{
UFUNCTION()
bool HasObjectiveManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_ObjectiveManager);
}
FCS_ObjectiveManager& AssignObjectiveManager(const FECSWorldPtr &inout World, const FCS_ObjectiveManager &inout DefaultValue = FCS_ObjectiveManager())
{
    UScriptStruct local_6 = FCS_ObjectiveManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignObjectiveManager_BP(const FECSWorldPtr &inout World, const FCS_ObjectiveManager &inout DefaultValue = FCS_ObjectiveManager())
{
    ECSFunc_FCS_ObjectiveManager::AssignObjectiveManager(World, DefaultValue);
    return;
}
FCS_ObjectiveManager& ModifyObjectiveManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ObjectiveManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_ObjectiveManager& ModifyOrAddObjectiveManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ObjectiveManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_ObjectiveManager& GetObjectiveManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ObjectiveManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_ObjectiveManager GetObjectiveManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_ObjectiveManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_ObjectiveManager::GetObjectiveManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_ObjectiveManager GetDefaultedObjectiveManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_ObjectiveManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_ObjectiveManager);
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
FCS_ObjectiveManager GetDefaultedObjectiveManager_BP(const FECSWorldPtr &inout World)
{
    FCS_ObjectiveManager __r;
    return __r;
}
UFUNCTION()
bool RemoveObjectiveManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_ObjectiveManager);
}
}
void __MonitorObjectiveManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_ObjectiveManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorObjectiveManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_ObjectiveManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorObjectiveManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_ObjectiveManager, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_ManualSetObjectiveStatus
{
UFUNCTION()
bool HasManualSetObjectiveStatus(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_ManualSetObjectiveStatus);
}
FCS_ManualSetObjectiveStatus& AssignManualSetObjectiveStatus(const FECSWorldPtr &inout World, const FCS_ManualSetObjectiveStatus &inout DefaultValue = FCS_ManualSetObjectiveStatus())
{
    UScriptStruct local_6 = FCS_ManualSetObjectiveStatus;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignManualSetObjectiveStatus_BP(const FECSWorldPtr &inout World, const FCS_ManualSetObjectiveStatus &inout DefaultValue = FCS_ManualSetObjectiveStatus())
{
    ECSFunc_FCS_ManualSetObjectiveStatus::AssignManualSetObjectiveStatus(World, DefaultValue);
    return;
}
FCS_ManualSetObjectiveStatus& ModifyManualSetObjectiveStatus(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ManualSetObjectiveStatus;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_ManualSetObjectiveStatus& ModifyOrAddManualSetObjectiveStatus(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ManualSetObjectiveStatus;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_ManualSetObjectiveStatus& GetManualSetObjectiveStatus(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_ManualSetObjectiveStatus;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_ManualSetObjectiveStatus GetManualSetObjectiveStatus_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_ManualSetObjectiveStatus __r;
    bValid = false;
    bValid = ECSFunc_FCS_ManualSetObjectiveStatus::GetManualSetObjectiveStatus(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_ManualSetObjectiveStatus GetDefaultedManualSetObjectiveStatus(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_ManualSetObjectiveStatus __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_ManualSetObjectiveStatus);
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
FCS_ManualSetObjectiveStatus GetDefaultedManualSetObjectiveStatus_BP(const FECSWorldPtr &inout World)
{
    FCS_ManualSetObjectiveStatus __r;
    return __r;
}
UFUNCTION()
bool RemoveManualSetObjectiveStatus(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_ManualSetObjectiveStatus);
}
}
void __MonitorManualSetObjectiveStatusLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_ManualSetObjectiveStatus, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManualSetObjectiveStatusActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_ManualSetObjectiveStatus, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorManualSetObjectiveStatusModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_ManualSetObjectiveStatus, bFixedFrame, Details);
    return;
}
