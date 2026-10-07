
namespace __INTENRAL_FCS_AutoTestJobPool_NS
{
    const TECSComponentDerivedPtr<FCS_AutoTestJobPool> DerivedPtr = TECSComponentDerivedPtr<FCS_AutoTestJobPool>();
    const FCS_AutoTestJobPool DefaultValue = FCS_AutoTestJobPool();
}
namespace __INTENRAL_FCS_GTCRecord_NS
{
    const TECSComponentDerivedPtr<FCS_GTCRecord> DerivedPtr = TECSComponentDerivedPtr<FCS_GTCRecord>();
    const FCS_GTCRecord DefaultValue = FCS_GTCRecord();
}
namespace __INTENRAL_FCE_ServerFuncCallEvent_NS
{
    const TECSEventDerivedPtr<FCE_ServerFuncCallEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ServerFuncCallEvent>();
}
namespace __INTENRAL_FCE_ServerFuncReturnEvent_NS
{
    const TECSEventDerivedPtr<FCE_ServerFuncReturnEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ServerFuncReturnEvent>();

}
struct FCE_ServerFuncCallEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FString ExecParamJsonStr;
    UPROPERTY()
    FString JobId;

    FCE_ServerFuncCallEvent()
    {
        return;
    }
}

struct FCE_ServerFuncReturnEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FString JobId;
    UPROPERTY()
    FString OutputJsonStr;

    FCE_ServerFuncReturnEvent()
    {
        return;
    }
}

struct FCS_AutoTestJobPool : FECSSingleton
{
    UPROPERTY()
    TMap<FString, FString> JobMap;
    UPROPERTY()
    int LatestEventId = -1;
    UPROPERTY()
    bool bBTTaskFinishMark = false;
    UPROPERTY()
    bool bBTTaskShouldStart = false;


}

struct FGTCInfo
{
    UPROPERTY()
    bool IsFinished;
    UPROPERTY()
    TArray<FString> LogFiles;


}

struct FCS_GTCRecord : FECSSingleton
{
    UPROPERTY()
    TMap<uint, FGTCInfo> GTCMap;

    FCS_GTCRecord()
    {
        return;
    }
}

namespace ECSFunc_FCS_AutoTestJobPool
{
UFUNCTION()
bool HasAutoTestJobPool(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_AutoTestJobPool);
}
FCS_AutoTestJobPool& AssignAutoTestJobPool(const FECSWorldPtr &inout World, const FCS_AutoTestJobPool &inout DefaultValue = FCS_AutoTestJobPool())
{
    UScriptStruct local_6 = FCS_AutoTestJobPool;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignAutoTestJobPool_BP(const FECSWorldPtr &inout World, const FCS_AutoTestJobPool &inout DefaultValue = FCS_AutoTestJobPool())
{
    ECSFunc_FCS_AutoTestJobPool::AssignAutoTestJobPool(World, DefaultValue);
    return;
}
FCS_AutoTestJobPool& ModifyAutoTestJobPool(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AutoTestJobPool;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_AutoTestJobPool& ModifyOrAddAutoTestJobPool(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AutoTestJobPool;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_AutoTestJobPool& GetAutoTestJobPool(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AutoTestJobPool;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_AutoTestJobPool GetAutoTestJobPool_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_AutoTestJobPool __r;
    bValid = false;
    bValid = ECSFunc_FCS_AutoTestJobPool::GetAutoTestJobPool(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_AutoTestJobPool GetDefaultedAutoTestJobPool(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_AutoTestJobPool __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_AutoTestJobPool);
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
FCS_AutoTestJobPool GetDefaultedAutoTestJobPool_BP(const FECSWorldPtr &inout World)
{
    FCS_AutoTestJobPool __r;
    return __r;
}
UFUNCTION()
bool RemoveAutoTestJobPool(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_AutoTestJobPool);
}
}
void __MonitorAutoTestJobPoolLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_AutoTestJobPool, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoTestJobPoolActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_AutoTestJobPool, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoTestJobPoolModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_AutoTestJobPool, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_GTCRecord
{
UFUNCTION()
bool HasGTCRecord(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GTCRecord);
}
FCS_GTCRecord& AssignGTCRecord(const FECSWorldPtr &inout World, const FCS_GTCRecord &inout DefaultValue = FCS_GTCRecord())
{
    UScriptStruct local_6 = FCS_GTCRecord;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGTCRecord_BP(const FECSWorldPtr &inout World, const FCS_GTCRecord &inout DefaultValue = FCS_GTCRecord())
{
    ECSFunc_FCS_GTCRecord::AssignGTCRecord(World, DefaultValue);
    return;
}
FCS_GTCRecord& ModifyGTCRecord(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GTCRecord;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GTCRecord& ModifyOrAddGTCRecord(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GTCRecord;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GTCRecord& GetGTCRecord(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GTCRecord;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GTCRecord GetGTCRecord_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_GTCRecord __r;
    bValid = false;
    bValid = ECSFunc_FCS_GTCRecord::GetGTCRecord(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_GTCRecord GetDefaultedGTCRecord(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GTCRecord __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GTCRecord);
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
FCS_GTCRecord GetDefaultedGTCRecord_BP(const FECSWorldPtr &inout World)
{
    FCS_GTCRecord __r;
    return __r;
}
UFUNCTION()
bool RemoveGTCRecord(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GTCRecord);
}
}
void __MonitorGTCRecordLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GTCRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGTCRecordActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GTCRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGTCRecordModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GTCRecord, bFixedFrame, Details);
    return;
}
