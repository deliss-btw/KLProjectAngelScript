
namespace __INTENRAL_FCS_TimeOfDay_NS
{
    const TECSComponentDerivedPtr<FCS_TimeOfDay> DerivedPtr = TECSComponentDerivedPtr<FCS_TimeOfDay>();
    const FCS_TimeOfDay DefaultValue = FCS_TimeOfDay();
}
namespace __INTENRAL_FCS_TODAccumulatedDeltaTime_NS
{
    const TECSComponentDerivedPtr<FCS_TODAccumulatedDeltaTime> DerivedPtr = TECSComponentDerivedPtr<FCS_TODAccumulatedDeltaTime>();
    const FCS_TODAccumulatedDeltaTime DefaultValue = FCS_TODAccumulatedDeltaTime();
}
namespace __INTENRAL_FCS_FastForwardTODInfo_NS
{
    const TECSComponentDerivedPtr<FCS_FastForwardTODInfo> DerivedPtr = TECSComponentDerivedPtr<FCS_FastForwardTODInfo>();
    const FCS_FastForwardTODInfo DefaultValue = FCS_FastForwardTODInfo();
}
namespace __INTENRAL_FCE_TODStageUpdated_NS
{
    const TECSEventDerivedPtr<FCE_TODStageUpdated> DerivedPtr = TECSEventDerivedPtr<FCE_TODStageUpdated>();
}
namespace __INTENRAL_FCE_SetCurrentTimeOfDay_NS
{
    const TECSEventDerivedPtr<FCE_SetCurrentTimeOfDay> DerivedPtr = TECSEventDerivedPtr<FCE_SetCurrentTimeOfDay>();

}
struct FCS_TimeOfDay : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_TimeOfDaySeconds;
    UPROPERTY()
    float32 m_LastIntegerTime;
    UPROPERTY()
    float32 m_TimeSpeed;
    UPROPERTY()
    bool m_bPaused;
    UPROPERTY()
    FName m_TODStageName;

    FCS_TimeOfDay()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_TimeOfDay(const FCS_TimeOfDay &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_TimeOfDay opAssign(const FCS_TimeOfDay &inout Other)
    {
        FCS_TimeOfDay __r;
        this.SetTimeOfDaySeconds(Other.GetTimeOfDaySeconds());
        this.SetLastIntegerTime(Other.GetLastIntegerTime());
        this.SetTimeSpeed(Other.GetTimeSpeed());
        this.SetbPaused(Other.GetbPaused());
        this.SetTODStageName(Other.GetTODStageName());
        return __r;
    }
    void UpdateTimeOfDaySeconds(const int NewSeconds)
    {
        int local_18 = 0;
        this.SetTimeOfDaySeconds(NewSeconds);
        float32 local_3 = ::FTimeOfDayUtils::GetTimeOfDayInHoursClamp24(this.GetTimeOfDaySeconds());
        FName local_7 = ::FTimeOfDayUtils::GetTODStageName(local_3);
        if ((!((this.GetTODStageName() == local_7))))
        {
            FFPTime local_16 = FFPTime(-1);
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            local_18.PrevStageName = this.GetTODStageName();
            local_18.NewStageName = local_7;
            this.SetTODStageName(local_7);
        }
        float32 local_1 = FMath::FloorToFloat((local_3 * 10.0f)) / 10.0f;
        if (local_1 != this.GetLastIntegerTime())
        {
            FFPTime local_16_2 = FFPTime(-1);
            FECSWorldPtr local_10_2 = ECS::GetECSWorld();
            FCE_TimeOfDayChangeEvent local_28;
            local_28.IntegerTime = local_1;
            this.SetLastIntegerTime(local_1);
        }
        return;
    }
    int GetTimeOfDaySeconds() const property
    {
        return this.m_TimeOfDaySeconds;
    }
    void SetTimeOfDaySeconds(const int __Value) property
    {
        if (this.m_TimeOfDaySeconds == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TimeOfDaySeconds = __Value;
        return;
    }
    float32 GetLastIntegerTime() const property
    {
        return this.m_LastIntegerTime;
    }
    void SetLastIntegerTime(const float32 __Value) property
    {
        if (this.m_LastIntegerTime == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LastIntegerTime = __Value;
        return;
    }
    float32 GetTimeSpeed() const property
    {
        return this.m_TimeSpeed;
    }
    void SetTimeSpeed(const float32 __Value) property
    {
        if (this.m_TimeSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_TimeSpeed = __Value;
        return;
    }
    bool GetbPaused() const property
    {
        return this.m_bPaused;
    }
    void SetbPaused(const bool __Value) property
    {
        if (!(this.m_bPaused) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bPaused = __Value;
        return;
    }
    FName GetTODStageName() const property
    {
        return this.m_TODStageName;
    }
    void SetTODStageName(const FName &inout __Value) property
    {
        if ((this.m_TODStageName == __Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TODStageName = __Value;
        return;
    }
}

struct FCS_TODAccumulatedDeltaTime : FECSSingleton
{
    UPROPERTY()
    float32 AccumulatedDeltaTime = 0.0f;


}

struct FCS_FastForwardTODInfo : FECSSingleton
{
    UPROPERTY()
    float32 OriginTimeSpeed = 0.0f;
    UPROPERTY()
    int TargetTimeOfDaySeconds = 0;
    UPROPERTY()
    float32 BlendDuration = 0.0f;
    UPROPERTY()
    float32 RemainBlendTime = 0.0f;
    UPROPERTY()
    float32 TimeSpeed = 0.0f;


}

struct FCE_TODStageUpdated : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName PrevStageName;
    UPROPERTY()
    FName NewStageName;

    FCE_TODStageUpdated()
    {
        return;
    }
}

struct FCE_SetCurrentTimeOfDay : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    float32 TimeOfDayInHours;


}

namespace ECSFunc_FCS_TimeOfDay
{
UFUNCTION()
bool HasTimeOfDay(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TimeOfDay);
}
FCS_TimeOfDay& AssignTimeOfDay(const FECSWorldPtr &inout World, const FCS_TimeOfDay &inout DefaultValue = FCS_TimeOfDay())
{
    UScriptStruct local_6 = FCS_TimeOfDay;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTimeOfDay_BP(const FECSWorldPtr &inout World, const FCS_TimeOfDay &inout DefaultValue = FCS_TimeOfDay())
{
    ECSFunc_FCS_TimeOfDay::AssignTimeOfDay(World, DefaultValue);
    return;
}
FCS_TimeOfDay& ModifyTimeOfDay(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TimeOfDay;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TimeOfDay& ModifyOrAddTimeOfDay(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TimeOfDay;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TimeOfDay& GetTimeOfDay(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TimeOfDay;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TimeOfDay GetTimeOfDay_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_TimeOfDay& local_4 = ECSFunc_FCS_TimeOfDay::GetTimeOfDay(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_TimeOfDay();
}
const FCS_TimeOfDay GetDefaultedTimeOfDay(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TimeOfDay __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TimeOfDay);
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
FCS_TimeOfDay GetDefaultedTimeOfDay_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_TimeOfDay::GetDefaultedTimeOfDay(World);
}
UFUNCTION()
bool RemoveTimeOfDay(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TimeOfDay);
}
}
void __MonitorTimeOfDayLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TimeOfDay, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTimeOfDayActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TimeOfDay, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTimeOfDayModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TimeOfDay, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_TODAccumulatedDeltaTime
{
UFUNCTION()
bool HasTODAccumulatedDeltaTime(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TODAccumulatedDeltaTime);
}
FCS_TODAccumulatedDeltaTime& AssignTODAccumulatedDeltaTime(const FECSWorldPtr &inout World, const FCS_TODAccumulatedDeltaTime &inout DefaultValue = FCS_TODAccumulatedDeltaTime())
{
    UScriptStruct local_6 = FCS_TODAccumulatedDeltaTime;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTODAccumulatedDeltaTime_BP(const FECSWorldPtr &inout World, const FCS_TODAccumulatedDeltaTime &inout DefaultValue = FCS_TODAccumulatedDeltaTime())
{
    ECSFunc_FCS_TODAccumulatedDeltaTime::AssignTODAccumulatedDeltaTime(World, DefaultValue);
    return;
}
FCS_TODAccumulatedDeltaTime& ModifyTODAccumulatedDeltaTime(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TODAccumulatedDeltaTime;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TODAccumulatedDeltaTime& ModifyOrAddTODAccumulatedDeltaTime(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TODAccumulatedDeltaTime;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TODAccumulatedDeltaTime& GetTODAccumulatedDeltaTime(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TODAccumulatedDeltaTime;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TODAccumulatedDeltaTime GetTODAccumulatedDeltaTime_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_TODAccumulatedDeltaTime& local_4 = ECSFunc_FCS_TODAccumulatedDeltaTime::GetTODAccumulatedDeltaTime(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_TODAccumulatedDeltaTime();
}
const FCS_TODAccumulatedDeltaTime GetDefaultedTODAccumulatedDeltaTime(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TODAccumulatedDeltaTime __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TODAccumulatedDeltaTime);
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
FCS_TODAccumulatedDeltaTime GetDefaultedTODAccumulatedDeltaTime_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_TODAccumulatedDeltaTime::GetDefaultedTODAccumulatedDeltaTime(World);
}
UFUNCTION()
bool RemoveTODAccumulatedDeltaTime(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TODAccumulatedDeltaTime);
}
}
void __MonitorTODAccumulatedDeltaTimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TODAccumulatedDeltaTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTODAccumulatedDeltaTimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TODAccumulatedDeltaTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTODAccumulatedDeltaTimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TODAccumulatedDeltaTime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_FastForwardTODInfo
{
UFUNCTION()
bool HasFastForwardTODInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_FastForwardTODInfo);
}
FCS_FastForwardTODInfo& AssignFastForwardTODInfo(const FECSWorldPtr &inout World, const FCS_FastForwardTODInfo &inout DefaultValue = FCS_FastForwardTODInfo())
{
    UScriptStruct local_6 = FCS_FastForwardTODInfo;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignFastForwardTODInfo_BP(const FECSWorldPtr &inout World, const FCS_FastForwardTODInfo &inout DefaultValue = FCS_FastForwardTODInfo())
{
    ECSFunc_FCS_FastForwardTODInfo::AssignFastForwardTODInfo(World, DefaultValue);
    return;
}
FCS_FastForwardTODInfo& ModifyFastForwardTODInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_FastForwardTODInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_FastForwardTODInfo& ModifyOrAddFastForwardTODInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_FastForwardTODInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_FastForwardTODInfo& GetFastForwardTODInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_FastForwardTODInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_FastForwardTODInfo GetFastForwardTODInfo_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_FastForwardTODInfo& local_4 = ECSFunc_FCS_FastForwardTODInfo::GetFastForwardTODInfo(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_FastForwardTODInfo();
}
const FCS_FastForwardTODInfo GetDefaultedFastForwardTODInfo(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_FastForwardTODInfo __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_FastForwardTODInfo);
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
FCS_FastForwardTODInfo GetDefaultedFastForwardTODInfo_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_FastForwardTODInfo::GetDefaultedFastForwardTODInfo(World);
}
UFUNCTION()
bool RemoveFastForwardTODInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_FastForwardTODInfo);
}
}
void __MonitorFastForwardTODInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_FastForwardTODInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFastForwardTODInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_FastForwardTODInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFastForwardTODInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_FastForwardTODInfo, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_TimeOfDay &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_TimeOfDay &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_TimeOfDay &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_TimeOfDay
{
int __IndexOf_TimeOfDaySeconds()
{
    return 0;
}
int __IndexOf_LastIntegerTime()
{
    return 1;
}
int __IndexOf_TimeSpeed()
{
    return 2;
}
int __IndexOf_bPaused()
{
    return 3;
}
int __IndexOf_TODStageName()
{
    return 4;
}
}
