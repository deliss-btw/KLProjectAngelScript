
namespace __INTENRAL_FCS_DebugCheckStuckProgress_NS
{
    const TECSComponentDerivedPtr<FCS_DebugCheckStuckProgress> DerivedPtr = TECSComponentDerivedPtr<FCS_DebugCheckStuckProgress>();
    const FCS_DebugCheckStuckProgress DefaultValue = FCS_DebugCheckStuckProgress();
}
namespace __INTENRAL_FCS_DebugDiagnoseStuckRequest_NS
{
    const TECSComponentDerivedPtr<FCS_DebugDiagnoseStuckRequest> DerivedPtr = TECSComponentDerivedPtr<FCS_DebugDiagnoseStuckRequest>();
    const FCS_DebugDiagnoseStuckRequest DefaultValue = FCS_DebugDiagnoseStuckRequest();
}
namespace __INTENRAL_FCS_DebugStatInfo_NS
{
    const TECSComponentDerivedPtr<FCS_DebugStatInfo> DerivedPtr = TECSComponentDerivedPtr<FCS_DebugStatInfo>();
    const FCS_DebugStatInfo DefaultValue = FCS_DebugStatInfo();
}
namespace __INTENRAL_FCE_DebugTeleportRequest_NS
{
    const TECSEventDerivedPtr<FCE_DebugTeleportRequest> DerivedPtr = TECSEventDerivedPtr<FCE_DebugTeleportRequest>();

}
struct FCE_DebugTeleportRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVector OffsetLocation;

    FCE_DebugTeleportRequest()
    {
        return;
    }
}

struct FCS_DebugCheckStuckProgress : FECSSingleton
{
    UPROPERTY()
    FBox Box;
    UPROPERTY()
    FVector Base;
    UPROPERTY()
    FVector Local;
    UPROPERTY()
    FVector InitPosition;
    UPROPERTY()
    int ScanCount;
    UPROPERTY()
    TArray<FVector> StuckPoints;
    UPROPERTY()
    bool bNeedTeleport;
    UPROPERTY()
    FFPTime LastTeleportTime;
    UPROPERTY()
    float32 PrevMaxScriptExcutionTime;


}

struct FCS_DebugDiagnoseStuckRequest : FECSSingleton
{
    UPROPERTY()
    FVector Position;

    FCS_DebugDiagnoseStuckRequest()
    {
        return;
    }
}

struct FCS_DebugStatInfo : FECSSingleton
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    TArray<FDebugMovementStatLine> m_PrintLines;
    UPROPERTY()
    FDebugMovementCollisionInfo m_ShapeInfo;

    FCS_DebugStatInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_DebugStatInfo(const FCS_DebugStatInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_PrintLines = Other.m_PrintLines;
        this.m_ShapeInfo = Other.m_ShapeInfo;
        return;
    }
    FCS_DebugStatInfo opAssign(const FCS_DebugStatInfo &inout Other)
    {
        FCS_DebugStatInfo __r;
        this.SetPrintLines(Other.GetPrintLines());
        this.SetShapeInfo(Other.GetShapeInfo());
        return __r;
    }
    const TArray<FDebugMovementStatLine> GetPrintLines() const property
    {
        const TArray<FDebugMovementStatLine> __r;
        return __r;
    }
    TArray<FDebugMovementStatLine> GetModify_PrintLines() property
    {
        TArray<FDebugMovementStatLine> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPrintLines(const TArray<FDebugMovementStatLine> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PrintLines = __Value;
        return;
    }
    const FDebugMovementCollisionInfo GetShapeInfo() const property
    {
        const FDebugMovementCollisionInfo __r;
        return __r;
    }
    FDebugMovementCollisionInfo GetShapeInfo() property
    {
        FDebugMovementCollisionInfo __r;
        return __r;
    }
    void SetShapeInfo(const FDebugMovementCollisionInfo &inout __Value) property
    {
        this.m_ShapeInfo = __Value;
        return;
    }
}

namespace ECSFunc_FCS_DebugCheckStuckProgress
{
UFUNCTION()
bool HasDebugCheckStuckProgress(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_DebugCheckStuckProgress);
}
FCS_DebugCheckStuckProgress& AssignDebugCheckStuckProgress(const FECSWorldPtr &inout World, const FCS_DebugCheckStuckProgress &inout DefaultValue = FCS_DebugCheckStuckProgress())
{
    UScriptStruct local_6 = FCS_DebugCheckStuckProgress;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignDebugCheckStuckProgress_BP(const FECSWorldPtr &inout World, const FCS_DebugCheckStuckProgress &inout DefaultValue = FCS_DebugCheckStuckProgress())
{
    ECSFunc_FCS_DebugCheckStuckProgress::AssignDebugCheckStuckProgress(World, DefaultValue);
    return;
}
FCS_DebugCheckStuckProgress& ModifyDebugCheckStuckProgress(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugCheckStuckProgress;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_DebugCheckStuckProgress& ModifyOrAddDebugCheckStuckProgress(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugCheckStuckProgress;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_DebugCheckStuckProgress& GetDebugCheckStuckProgress(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugCheckStuckProgress;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_DebugCheckStuckProgress GetDebugCheckStuckProgress_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_DebugCheckStuckProgress __r;
    bValid = false;
    bValid = ECSFunc_FCS_DebugCheckStuckProgress::GetDebugCheckStuckProgress(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_DebugCheckStuckProgress GetDefaultedDebugCheckStuckProgress(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_DebugCheckStuckProgress __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_DebugCheckStuckProgress);
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
FCS_DebugCheckStuckProgress GetDefaultedDebugCheckStuckProgress_BP(const FECSWorldPtr &inout World)
{
    FCS_DebugCheckStuckProgress __r;
    return __r;
}
UFUNCTION()
bool RemoveDebugCheckStuckProgress(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_DebugCheckStuckProgress);
}
}
void __MonitorDebugCheckStuckProgressLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_DebugCheckStuckProgress, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugCheckStuckProgressActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_DebugCheckStuckProgress, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugCheckStuckProgressModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_DebugCheckStuckProgress, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_DebugDiagnoseStuckRequest
{
UFUNCTION()
bool HasDebugDiagnoseStuckRequest(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_DebugDiagnoseStuckRequest);
}
FCS_DebugDiagnoseStuckRequest& AssignDebugDiagnoseStuckRequest(const FECSWorldPtr &inout World, const FCS_DebugDiagnoseStuckRequest &inout DefaultValue = FCS_DebugDiagnoseStuckRequest())
{
    UScriptStruct local_6 = FCS_DebugDiagnoseStuckRequest;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignDebugDiagnoseStuckRequest_BP(const FECSWorldPtr &inout World, const FCS_DebugDiagnoseStuckRequest &inout DefaultValue = FCS_DebugDiagnoseStuckRequest())
{
    ECSFunc_FCS_DebugDiagnoseStuckRequest::AssignDebugDiagnoseStuckRequest(World, DefaultValue);
    return;
}
FCS_DebugDiagnoseStuckRequest& ModifyDebugDiagnoseStuckRequest(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugDiagnoseStuckRequest;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_DebugDiagnoseStuckRequest& ModifyOrAddDebugDiagnoseStuckRequest(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugDiagnoseStuckRequest;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_DebugDiagnoseStuckRequest& GetDebugDiagnoseStuckRequest(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugDiagnoseStuckRequest;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_DebugDiagnoseStuckRequest GetDebugDiagnoseStuckRequest_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_DebugDiagnoseStuckRequest& local_4 = ECSFunc_FCS_DebugDiagnoseStuckRequest::GetDebugDiagnoseStuckRequest(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_DebugDiagnoseStuckRequest();
}
const FCS_DebugDiagnoseStuckRequest GetDefaultedDebugDiagnoseStuckRequest(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_DebugDiagnoseStuckRequest __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_DebugDiagnoseStuckRequest);
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
FCS_DebugDiagnoseStuckRequest GetDefaultedDebugDiagnoseStuckRequest_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_DebugDiagnoseStuckRequest::GetDefaultedDebugDiagnoseStuckRequest(World);
}
UFUNCTION()
bool RemoveDebugDiagnoseStuckRequest(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_DebugDiagnoseStuckRequest);
}
}
void __MonitorDebugDiagnoseStuckRequestLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_DebugDiagnoseStuckRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugDiagnoseStuckRequestActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_DebugDiagnoseStuckRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugDiagnoseStuckRequestModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_DebugDiagnoseStuckRequest, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_DebugStatInfo
{
UFUNCTION()
bool HasDebugStatInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_DebugStatInfo);
}
FCS_DebugStatInfo& AssignDebugStatInfo(const FECSWorldPtr &inout World, const FCS_DebugStatInfo &inout DefaultValue = FCS_DebugStatInfo())
{
    UScriptStruct local_6 = FCS_DebugStatInfo;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignDebugStatInfo_BP(const FECSWorldPtr &inout World, const FCS_DebugStatInfo &inout DefaultValue = FCS_DebugStatInfo())
{
    ECSFunc_FCS_DebugStatInfo::AssignDebugStatInfo(World, DefaultValue);
    return;
}
FCS_DebugStatInfo& ModifyDebugStatInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugStatInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_DebugStatInfo& ModifyOrAddDebugStatInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugStatInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_DebugStatInfo& GetDebugStatInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugStatInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_DebugStatInfo GetDebugStatInfo_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_DebugStatInfo& local_4 = ECSFunc_FCS_DebugStatInfo::GetDebugStatInfo(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_DebugStatInfo();
}
const FCS_DebugStatInfo GetDefaultedDebugStatInfo(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_DebugStatInfo __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_DebugStatInfo);
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
FCS_DebugStatInfo GetDefaultedDebugStatInfo_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_DebugStatInfo::GetDefaultedDebugStatInfo(World);
}
UFUNCTION()
bool RemoveDebugStatInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_DebugStatInfo);
}
}
void __MonitorDebugStatInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_DebugStatInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugStatInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_DebugStatInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugStatInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_DebugStatInfo, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FCS_DebugStatInfo &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FCS_DebugStatInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_DebugStatInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_DebugStatInfo
{
int __IndexOf_PrintLines()
{
    return 0;
}
int __IndexOf_ShapeInfo()
{
    return 1;
}
}
