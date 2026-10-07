
namespace __INTENRAL_FC_HitTestByMoveTrail_NS
{
    const TECSComponentDerivedPtr<FC_HitTestByMoveTrail> DerivedPtr = TECSComponentDerivedPtr<FC_HitTestByMoveTrail>();
    const FC_HitTestByMoveTrail DefaultValue = FC_HitTestByMoveTrail();
}
namespace __INTENRAL_FC_HitTestByMoveTrailRunTimeData_NS
{
    const TECSComponentDerivedPtr<FC_HitTestByMoveTrailRunTimeData> DerivedPtr = TECSComponentDerivedPtr<FC_HitTestByMoveTrailRunTimeData>();
    const FC_HitTestByMoveTrailRunTimeData DefaultValue = FC_HitTestByMoveTrailRunTimeData();
}
namespace __INTENRAL_FC_FXByMoveTrail_NS
{
    const TECSComponentDerivedPtr<FC_FXByMoveTrail> DerivedPtr = TECSComponentDerivedPtr<FC_FXByMoveTrail>();
    const FC_FXByMoveTrail DefaultValue = FC_FXByMoveTrail();
}
namespace __INTENRAL_FC_FXByMoveTrailRuntimeData_NS
{
    const TECSComponentDerivedPtr<FC_FXByMoveTrailRuntimeData> DerivedPtr = TECSComponentDerivedPtr<FC_FXByMoveTrailRuntimeData>();
    const FC_FXByMoveTrailRuntimeData DefaultValue = FC_FXByMoveTrailRuntimeData();

}
struct FC_HitTestByMoveTrail : FECSComponent
{
    UPROPERTY()
    FFPTime HitTestDelayTimeAfterSpawn;
    UPROPERTY()
    float32 HitTestCheckIntervalTime;
    UPROPERTY()
    float32 HitTestWidth;
    UPROPERTY()
    float32 HitTestHeight;
    UPROPERTY()
    FDataObjectPtr AttackData;
    UPROPERTY()
    FAreaStrikeShape StrikeShape;
    UPROPERTY()
    FVector3f StrikeDirection;

    FC_HitTestByMoveTrail()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FC_HitTestByMoveTrailRunTimeData : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_LastPos;
    UPROPERTY()
    FFPTime m_LastRecordTime;

    FC_HitTestByMoveTrailRunTimeData()
    {
        this.m_LastRecordTime = 0;
        this.__InitDirtyFlags();
        return;
    }
    FC_HitTestByMoveTrailRunTimeData(const FC_HitTestByMoveTrailRunTimeData &inout Other)
    {
        this.m_LastRecordTime = 0;
        this.__InitDirtyFlags();
        this.m_LastPos = Other.m_LastPos;
        this.m_LastRecordTime = Other.m_LastRecordTime;
        return;
    }
    FC_HitTestByMoveTrailRunTimeData opAssign(const FC_HitTestByMoveTrailRunTimeData &inout Other)
    {
        FC_HitTestByMoveTrailRunTimeData __r;
        this.SetLastPos(Other.GetLastPos());
        this.SetLastRecordTime(Other.GetLastRecordTime());
        return __r;
    }
    const FVector GetLastPos() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LastPos() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLastPos(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LastPos = __Value;
        return;
    }
    const FFPTime GetLastRecordTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastRecordTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetLastRecordTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LastRecordTime = __Value;
        return;
    }
}

struct FFXByMoveTrailConfig
{
    UPROPERTY()
    FFPTime SpawnFXDelayTime;
    UPROPERTY()
    FFXConfig FXConfig;
    UPROPERTY()
    bool bUpdateLengthByTime = false;
    UPROPERTY()
    FName FXLengthParamName;
    UPROPERTY()
    float32 FXLengthDesiredDistance = 3000.0f;


}

struct FFXByMoveTrailRuntimeData
{
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    FName FXLengthParamName;
    UPROPERTY()
    float32 FXLengthDesiredDistance;


}

struct FC_FXByMoveTrail : FECSComponent
{
    UPROPERTY()
    TArray<FFXByMoveTrailConfig> Configs;

    FC_FXByMoveTrail()
    {
        return;
    }
}

struct FC_FXByMoveTrailRuntimeData : FECSComponent
{
    UPROPERTY()
    TArray<int> SpawnedIndex;
    UPROPERTY()
    TArray<FFXByMoveTrailRuntimeData> Datas;

    FC_FXByMoveTrailRuntimeData()
    {
        return;
    }
}

namespace ECSFunc_FC_HitTestByMoveTrail
{
UFUNCTION()
bool HasHitTestByMoveTrail(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrail);
}
FC_HitTestByMoveTrail& AssignHitTestByMoveTrail(const FECSEntity &inout Entity, const FC_HitTestByMoveTrail &inout DefaultValue = FC_HitTestByMoveTrail())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrail, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHitTestByMoveTrail_BP(const FECSEntity &inout Entity, const FC_HitTestByMoveTrail &inout DefaultValue = FC_HitTestByMoveTrail())
{
    ECSFunc_FC_HitTestByMoveTrail::AssignHitTestByMoveTrail(Entity, DefaultValue);
    return;
}
FC_HitTestByMoveTrail& ModifyHitTestByMoveTrail(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrail));
    return local_12.GetComp();
}
FC_HitTestByMoveTrail& ModifyOrAddHitTestByMoveTrail(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrail));
    return local_12.GetComp();
}
const FC_HitTestByMoveTrail& GetHitTestByMoveTrail(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrail));
    return local_12.GetComp();
}
UFUNCTION()
FC_HitTestByMoveTrail GetHitTestByMoveTrail_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_HitTestByMoveTrail __r;
    bValid = false;
    bValid = ECSFunc_FC_HitTestByMoveTrail::GetHitTestByMoveTrail(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_HitTestByMoveTrail GetDefaultedHitTestByMoveTrail(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HitTestByMoveTrail __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrail);
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
FC_HitTestByMoveTrail GetDefaultedHitTestByMoveTrail_BP(const FECSEntity &inout Entity)
{
    FC_HitTestByMoveTrail __r;
    return __r;
}
UFUNCTION()
bool RemoveHitTestByMoveTrail(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrail);
}
}
FECSMonitorRuntimeView __GetMonitorHitTestByMoveTrailOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HitTestByMoveTrail, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitTestByMoveTrailOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HitTestByMoveTrail, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitTestByMoveTrailOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HitTestByMoveTrail, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitTestByMoveTrailOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HitTestByMoveTrail, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitTestByMoveTrailOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HitTestByMoveTrail, bFixedFrame, bMustHandleAll);
}
void __MonitorHitTestByMoveTrailLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HitTestByMoveTrail, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitTestByMoveTrailActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HitTestByMoveTrail, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitTestByMoveTrailModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HitTestByMoveTrail, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_HitTestByMoveTrailRunTimeData
{
UFUNCTION()
bool HasHitTestByMoveTrailRunTimeData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrailRunTimeData);
}
FC_HitTestByMoveTrailRunTimeData& AssignHitTestByMoveTrailRunTimeData(const FECSEntity &inout Entity, const FC_HitTestByMoveTrailRunTimeData &inout DefaultValue = FC_HitTestByMoveTrailRunTimeData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrailRunTimeData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHitTestByMoveTrailRunTimeData_BP(const FECSEntity &inout Entity, const FC_HitTestByMoveTrailRunTimeData &inout DefaultValue = FC_HitTestByMoveTrailRunTimeData())
{
    ECSFunc_FC_HitTestByMoveTrailRunTimeData::AssignHitTestByMoveTrailRunTimeData(Entity, DefaultValue);
    return;
}
FC_HitTestByMoveTrailRunTimeData& ModifyHitTestByMoveTrailRunTimeData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrailRunTimeData));
    return local_12.GetComp();
}
FC_HitTestByMoveTrailRunTimeData& ModifyOrAddHitTestByMoveTrailRunTimeData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrailRunTimeData));
    return local_12.GetComp();
}
const FC_HitTestByMoveTrailRunTimeData& GetHitTestByMoveTrailRunTimeData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrailRunTimeData));
    return local_12.GetComp();
}
UFUNCTION()
FC_HitTestByMoveTrailRunTimeData GetHitTestByMoveTrailRunTimeData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_HitTestByMoveTrailRunTimeData& local_4 = ECSFunc_FC_HitTestByMoveTrailRunTimeData::GetHitTestByMoveTrailRunTimeData(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_HitTestByMoveTrailRunTimeData();
}
const FC_HitTestByMoveTrailRunTimeData GetDefaultedHitTestByMoveTrailRunTimeData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HitTestByMoveTrailRunTimeData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrailRunTimeData);
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
FC_HitTestByMoveTrailRunTimeData GetDefaultedHitTestByMoveTrailRunTimeData_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_HitTestByMoveTrailRunTimeData::GetDefaultedHitTestByMoveTrailRunTimeData(Entity);
}
UFUNCTION()
bool RemoveHitTestByMoveTrailRunTimeData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HitTestByMoveTrailRunTimeData);
}
}
FECSMonitorRuntimeView __GetMonitorHitTestByMoveTrailRunTimeDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HitTestByMoveTrailRunTimeData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitTestByMoveTrailRunTimeDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HitTestByMoveTrailRunTimeData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitTestByMoveTrailRunTimeDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HitTestByMoveTrailRunTimeData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitTestByMoveTrailRunTimeDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HitTestByMoveTrailRunTimeData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHitTestByMoveTrailRunTimeDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HitTestByMoveTrailRunTimeData, bFixedFrame, bMustHandleAll);
}
void __MonitorHitTestByMoveTrailRunTimeDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HitTestByMoveTrailRunTimeData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitTestByMoveTrailRunTimeDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HitTestByMoveTrailRunTimeData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHitTestByMoveTrailRunTimeDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HitTestByMoveTrailRunTimeData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_FXByMoveTrail
{
UFUNCTION()
bool HasFXByMoveTrail(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrail);
}
FC_FXByMoveTrail& AssignFXByMoveTrail(const FECSEntity &inout Entity, const FC_FXByMoveTrail &inout DefaultValue = FC_FXByMoveTrail())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrail, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFXByMoveTrail_BP(const FECSEntity &inout Entity, const FC_FXByMoveTrail &inout DefaultValue = FC_FXByMoveTrail())
{
    ECSFunc_FC_FXByMoveTrail::AssignFXByMoveTrail(Entity, DefaultValue);
    return;
}
FC_FXByMoveTrail& ModifyFXByMoveTrail(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrail));
    return local_12.GetComp();
}
FC_FXByMoveTrail& ModifyOrAddFXByMoveTrail(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrail));
    return local_12.GetComp();
}
const FC_FXByMoveTrail& GetFXByMoveTrail(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrail));
    return local_12.GetComp();
}
UFUNCTION()
FC_FXByMoveTrail GetFXByMoveTrail_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FXByMoveTrail __r;
    bValid = false;
    bValid = ECSFunc_FC_FXByMoveTrail::GetFXByMoveTrail(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FXByMoveTrail GetDefaultedFXByMoveTrail(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FXByMoveTrail __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrail);
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
FC_FXByMoveTrail GetDefaultedFXByMoveTrail_BP(const FECSEntity &inout Entity)
{
    FC_FXByMoveTrail __r;
    return __r;
}
UFUNCTION()
bool RemoveFXByMoveTrail(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrail);
}
}
FECSMonitorRuntimeView __GetMonitorFXByMoveTrailOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FXByMoveTrail, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXByMoveTrailOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FXByMoveTrail, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXByMoveTrailOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FXByMoveTrail, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXByMoveTrailOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FXByMoveTrail, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXByMoveTrailOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FXByMoveTrail, bFixedFrame, bMustHandleAll);
}
void __MonitorFXByMoveTrailLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FXByMoveTrail, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFXByMoveTrailActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FXByMoveTrail, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFXByMoveTrailModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FXByMoveTrail, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_FXByMoveTrailRuntimeData
{
UFUNCTION()
bool HasFXByMoveTrailRuntimeData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrailRuntimeData);
}
FC_FXByMoveTrailRuntimeData& AssignFXByMoveTrailRuntimeData(const FECSEntity &inout Entity, const FC_FXByMoveTrailRuntimeData &inout DefaultValue = FC_FXByMoveTrailRuntimeData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrailRuntimeData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFXByMoveTrailRuntimeData_BP(const FECSEntity &inout Entity, const FC_FXByMoveTrailRuntimeData &inout DefaultValue = FC_FXByMoveTrailRuntimeData())
{
    ECSFunc_FC_FXByMoveTrailRuntimeData::AssignFXByMoveTrailRuntimeData(Entity, DefaultValue);
    return;
}
FC_FXByMoveTrailRuntimeData& ModifyFXByMoveTrailRuntimeData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrailRuntimeData));
    return local_12.GetComp();
}
FC_FXByMoveTrailRuntimeData& ModifyOrAddFXByMoveTrailRuntimeData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrailRuntimeData));
    return local_12.GetComp();
}
const FC_FXByMoveTrailRuntimeData& GetFXByMoveTrailRuntimeData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrailRuntimeData));
    return local_12.GetComp();
}
UFUNCTION()
FC_FXByMoveTrailRuntimeData GetFXByMoveTrailRuntimeData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FXByMoveTrailRuntimeData __r;
    bValid = false;
    bValid = ECSFunc_FC_FXByMoveTrailRuntimeData::GetFXByMoveTrailRuntimeData(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FXByMoveTrailRuntimeData GetDefaultedFXByMoveTrailRuntimeData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FXByMoveTrailRuntimeData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrailRuntimeData);
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
FC_FXByMoveTrailRuntimeData GetDefaultedFXByMoveTrailRuntimeData_BP(const FECSEntity &inout Entity)
{
    FC_FXByMoveTrailRuntimeData __r;
    return __r;
}
UFUNCTION()
bool RemoveFXByMoveTrailRuntimeData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FXByMoveTrailRuntimeData);
}
}
FECSMonitorRuntimeView __GetMonitorFXByMoveTrailRuntimeDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FXByMoveTrailRuntimeData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXByMoveTrailRuntimeDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FXByMoveTrailRuntimeData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXByMoveTrailRuntimeDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FXByMoveTrailRuntimeData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXByMoveTrailRuntimeDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FXByMoveTrailRuntimeData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFXByMoveTrailRuntimeDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FXByMoveTrailRuntimeData, bFixedFrame, bMustHandleAll);
}
void __MonitorFXByMoveTrailRuntimeDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FXByMoveTrailRuntimeData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFXByMoveTrailRuntimeDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FXByMoveTrailRuntimeData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFXByMoveTrailRuntimeDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FXByMoveTrailRuntimeData, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_HitTestByMoveTrailRunTimeData &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_HitTestByMoveTrailRunTimeData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_HitTestByMoveTrailRunTimeData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_HitTestByMoveTrailRunTimeData
{
int __IndexOf_LastPos()
{
    return 0;
}
int __IndexOf_LastRecordTime()
{
    return 1;
}
}
