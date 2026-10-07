
namespace __INTENRAL_FCS_DebugViewWeatherAndTOD_NS
{
    const TECSComponentDerivedPtr<FCS_DebugViewWeatherAndTOD> DerivedPtr = TECSComponentDerivedPtr<FCS_DebugViewWeatherAndTOD>();
    const FCS_DebugViewWeatherAndTOD DefaultValue = FCS_DebugViewWeatherAndTOD();
}
namespace __INTENRAL_FCS_DebugLogicWeatherAndTOD_NS
{
    const TECSComponentDerivedPtr<FCS_DebugLogicWeatherAndTOD> DerivedPtr = TECSComponentDerivedPtr<FCS_DebugLogicWeatherAndTOD>();
    const FCS_DebugLogicWeatherAndTOD DefaultValue = FCS_DebugLogicWeatherAndTOD();
}
namespace __INTENRAL_FC_DebugOverrideRegionWeatherData_NS
{
    const TECSComponentDerivedPtr<FC_DebugOverrideRegionWeatherData> DerivedPtr = TECSComponentDerivedPtr<FC_DebugOverrideRegionWeatherData>();
    const FC_DebugOverrideRegionWeatherData DefaultValue = FC_DebugOverrideRegionWeatherData();
}
namespace __INTENRAL_FC_DebugRegionWeatherData_NS
{
    const TECSComponentDerivedPtr<FC_DebugRegionWeatherData> DerivedPtr = TECSComponentDerivedPtr<FC_DebugRegionWeatherData>();
    const FC_DebugRegionWeatherData DefaultValue = FC_DebugRegionWeatherData();
}
namespace __INTENRAL_FCS_SyncDebugWeatherInfo_NS
{
    const TECSComponentDerivedPtr<FCS_SyncDebugWeatherInfo> DerivedPtr = TECSComponentDerivedPtr<FCS_SyncDebugWeatherInfo>();
    const FCS_SyncDebugWeatherInfo DefaultValue = FCS_SyncDebugWeatherInfo();
}
namespace __INTENRAL_FCE_ClientToServerDebugDrawWeahterInfo_NS
{
    const TECSEventDerivedPtr<FCE_ClientToServerDebugDrawWeahterInfo> DerivedPtr = TECSEventDerivedPtr<FCE_ClientToServerDebugDrawWeahterInfo>();

}
struct FCS_DebugViewWeatherAndTOD : FECSSingleton
{
    UPROPERTY()
    bool bDrawWeatherInfo = false;
    UPROPERTY()
    FName ForceArtWeatherName;
    UPROPERTY()
    float32 ForceArtWeatherBlendTime;
    UPROPERTY()
    bool bIsDirty = false;


}

struct FCS_DebugLogicWeatherAndTOD : FECSSingleton
{
    UPROPERTY()
    FName ForceLogicWeather;

    FCS_DebugLogicWeatherAndTOD()
    {
        return;
    }
}

struct FC_DebugOverrideRegionWeatherData : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> m_WeatherConfig;
    UPROPERTY()
    float32 m_Duration;
    UPROPERTY()
    float32 m_ArtWeatherBlendTime;

    FC_DebugOverrideRegionWeatherData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DebugOverrideRegionWeatherData(const FC_DebugOverrideRegionWeatherData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DebugOverrideRegionWeatherData opAssign(const FC_DebugOverrideRegionWeatherData &inout Other)
    {
        FC_DebugOverrideRegionWeatherData __r;
        this.SetWeatherConfig(Other.GetWeatherConfig());
        this.SetDuration(Other.GetDuration());
        this.SetArtWeatherBlendTime(Other.GetArtWeatherBlendTime());
        return __r;
    }
    TDataObjectPtr<FWeatherConfig> GetWeatherConfig() const property
    {
        TDataObjectPtr<FWeatherConfig> __r;
        return __r;
    }
    TDataObjectPtr<FWeatherConfig> GetModify_WeatherConfig() property
    {
        TDataObjectPtr<FWeatherConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetWeatherConfig(const TDataObjectPtr<FWeatherConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_WeatherConfig = __Value;
        return;
    }
    float32 GetDuration() const property
    {
        return this.m_Duration;
    }
    void SetDuration(const float32 __Value) property
    {
        if (this.m_Duration == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Duration = __Value;
        return;
    }
    float32 GetArtWeatherBlendTime() const property
    {
        return this.m_ArtWeatherBlendTime;
    }
    void SetArtWeatherBlendTime(const float32 __Value) property
    {
        if (this.m_ArtWeatherBlendTime == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ArtWeatherBlendTime = __Value;
        return;
    }
}

struct FC_DebugRegionWeatherData : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FWeatherGenerateTemplate> m_WeatherTemplate;
    UPROPERTY()
    TDataObjectPtr<FWeatherGenerateTemplate> m_RuntimeOverrideWeatherTemplate;
    UPROPERTY()
    FECSEntity m_WeatherEntity;
    UPROPERTY()
    FFPTime m_UpdatedTimeStamp;
    UPROPERTY()
    float32 m_Duration;
    UPROPERTY()
    float32 m_ElapsedTime;
    UPROPERTY()
    bool m_bIsOverrideWeather;

    FC_DebugRegionWeatherData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DebugRegionWeatherData(const FC_DebugRegionWeatherData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DebugRegionWeatherData opAssign(const FC_DebugRegionWeatherData &inout Other)
    {
        FC_DebugRegionWeatherData __r;
        this.SetWeatherTemplate(Other.GetWeatherTemplate());
        this.SetRuntimeOverrideWeatherTemplate(Other.GetRuntimeOverrideWeatherTemplate());
        this.SetWeatherEntity(Other.GetWeatherEntity());
        this.SetUpdatedTimeStamp(Other.GetUpdatedTimeStamp());
        this.SetDuration(Other.GetDuration());
        this.SetElapsedTime(Other.GetElapsedTime());
        this.SetbIsOverrideWeather(Other.GetbIsOverrideWeather());
        return __r;
    }
    TDataObjectPtr<FWeatherGenerateTemplate> GetUsingWeatherTemplate() const
    {
        if (this.GetRuntimeOverrideWeatherTemplate().IsSet())
        {
            return this.GetRuntimeOverrideWeatherTemplate();
        }
        return this.GetWeatherTemplate();
    }
    const TDataObjectPtr<FWeatherGenerateTemplate> GetWeatherTemplate() const property
    {
        const TDataObjectPtr<FWeatherGenerateTemplate> __r;
        return __r;
    }
    TDataObjectPtr<FWeatherGenerateTemplate> GetModify_WeatherTemplate() property
    {
        TDataObjectPtr<FWeatherGenerateTemplate> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetWeatherTemplate(const TDataObjectPtr<FWeatherGenerateTemplate> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_WeatherTemplate = __Value;
        return;
    }
    const TDataObjectPtr<FWeatherGenerateTemplate> GetRuntimeOverrideWeatherTemplate() const property
    {
        const TDataObjectPtr<FWeatherGenerateTemplate> __r;
        return __r;
    }
    TDataObjectPtr<FWeatherGenerateTemplate> GetModify_RuntimeOverrideWeatherTemplate() property
    {
        TDataObjectPtr<FWeatherGenerateTemplate> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetRuntimeOverrideWeatherTemplate(const TDataObjectPtr<FWeatherGenerateTemplate> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RuntimeOverrideWeatherTemplate = __Value;
        return;
    }
    const FECSEntity GetWeatherEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_WeatherEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetWeatherEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_WeatherEntity = __Value;
        return;
    }
    const FFPTime GetUpdatedTimeStamp() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_UpdatedTimeStamp() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetUpdatedTimeStamp(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_UpdatedTimeStamp = __Value;
        return;
    }
    float32 GetDuration() const property
    {
        return this.m_Duration;
    }
    void SetDuration(const float32 __Value) property
    {
        if (this.m_Duration == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Duration = __Value;
        return;
    }
    float32 GetElapsedTime() const property
    {
        return this.m_ElapsedTime;
    }
    void SetElapsedTime(const float32 __Value) property
    {
        if (this.m_ElapsedTime == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_ElapsedTime = __Value;
        return;
    }
    bool GetbIsOverrideWeather() const property
    {
        return this.m_bIsOverrideWeather;
    }
    void SetbIsOverrideWeather(const bool __Value) property
    {
        if (!(this.m_bIsOverrideWeather) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bIsOverrideWeather = __Value;
        return;
    }
}

struct FCE_ClientToServerDebugDrawWeahterInfo : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bDrawWeatherInfo;


}

struct FCS_SyncDebugWeatherInfo : FECSSingleton
{
    UPROPERTY()
    bool bDrawWeatherInfo;


}

namespace ECSFunc_FCS_DebugViewWeatherAndTOD
{
UFUNCTION()
bool HasDebugViewWeatherAndTOD(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_DebugViewWeatherAndTOD);
}
FCS_DebugViewWeatherAndTOD& AssignDebugViewWeatherAndTOD(const FECSWorldPtr &inout World, const FCS_DebugViewWeatherAndTOD &inout DefaultValue = FCS_DebugViewWeatherAndTOD())
{
    UScriptStruct local_6 = FCS_DebugViewWeatherAndTOD;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignDebugViewWeatherAndTOD_BP(const FECSWorldPtr &inout World, const FCS_DebugViewWeatherAndTOD &inout DefaultValue = FCS_DebugViewWeatherAndTOD())
{
    ECSFunc_FCS_DebugViewWeatherAndTOD::AssignDebugViewWeatherAndTOD(World, DefaultValue);
    return;
}
FCS_DebugViewWeatherAndTOD& ModifyDebugViewWeatherAndTOD(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugViewWeatherAndTOD;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_DebugViewWeatherAndTOD& ModifyOrAddDebugViewWeatherAndTOD(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugViewWeatherAndTOD;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_DebugViewWeatherAndTOD& GetDebugViewWeatherAndTOD(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugViewWeatherAndTOD;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_DebugViewWeatherAndTOD GetDebugViewWeatherAndTOD_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_DebugViewWeatherAndTOD& local_4 = ECSFunc_FCS_DebugViewWeatherAndTOD::GetDebugViewWeatherAndTOD(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_DebugViewWeatherAndTOD();
}
const FCS_DebugViewWeatherAndTOD GetDefaultedDebugViewWeatherAndTOD(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_DebugViewWeatherAndTOD __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_DebugViewWeatherAndTOD);
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
FCS_DebugViewWeatherAndTOD GetDefaultedDebugViewWeatherAndTOD_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_DebugViewWeatherAndTOD::GetDefaultedDebugViewWeatherAndTOD(World);
}
UFUNCTION()
bool RemoveDebugViewWeatherAndTOD(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_DebugViewWeatherAndTOD);
}
}
void __MonitorDebugViewWeatherAndTODLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_DebugViewWeatherAndTOD, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugViewWeatherAndTODActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_DebugViewWeatherAndTOD, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugViewWeatherAndTODModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_DebugViewWeatherAndTOD, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_DebugLogicWeatherAndTOD
{
UFUNCTION()
bool HasDebugLogicWeatherAndTOD(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_DebugLogicWeatherAndTOD);
}
FCS_DebugLogicWeatherAndTOD& AssignDebugLogicWeatherAndTOD(const FECSWorldPtr &inout World, const FCS_DebugLogicWeatherAndTOD &inout DefaultValue = FCS_DebugLogicWeatherAndTOD())
{
    UScriptStruct local_6 = FCS_DebugLogicWeatherAndTOD;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignDebugLogicWeatherAndTOD_BP(const FECSWorldPtr &inout World, const FCS_DebugLogicWeatherAndTOD &inout DefaultValue = FCS_DebugLogicWeatherAndTOD())
{
    ECSFunc_FCS_DebugLogicWeatherAndTOD::AssignDebugLogicWeatherAndTOD(World, DefaultValue);
    return;
}
FCS_DebugLogicWeatherAndTOD& ModifyDebugLogicWeatherAndTOD(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugLogicWeatherAndTOD;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_DebugLogicWeatherAndTOD& ModifyOrAddDebugLogicWeatherAndTOD(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugLogicWeatherAndTOD;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_DebugLogicWeatherAndTOD& GetDebugLogicWeatherAndTOD(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DebugLogicWeatherAndTOD;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_DebugLogicWeatherAndTOD GetDebugLogicWeatherAndTOD_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_DebugLogicWeatherAndTOD& local_4 = ECSFunc_FCS_DebugLogicWeatherAndTOD::GetDebugLogicWeatherAndTOD(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_DebugLogicWeatherAndTOD();
}
const FCS_DebugLogicWeatherAndTOD GetDefaultedDebugLogicWeatherAndTOD(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_DebugLogicWeatherAndTOD __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_DebugLogicWeatherAndTOD);
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
FCS_DebugLogicWeatherAndTOD GetDefaultedDebugLogicWeatherAndTOD_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_DebugLogicWeatherAndTOD::GetDefaultedDebugLogicWeatherAndTOD(World);
}
UFUNCTION()
bool RemoveDebugLogicWeatherAndTOD(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_DebugLogicWeatherAndTOD);
}
}
void __MonitorDebugLogicWeatherAndTODLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_DebugLogicWeatherAndTOD, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugLogicWeatherAndTODActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_DebugLogicWeatherAndTOD, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugLogicWeatherAndTODModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_DebugLogicWeatherAndTOD, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DebugOverrideRegionWeatherData
{
UFUNCTION()
bool HasDebugOverrideRegionWeatherData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DebugOverrideRegionWeatherData);
}
FC_DebugOverrideRegionWeatherData& AssignDebugOverrideRegionWeatherData(const FECSEntity &inout Entity, const FC_DebugOverrideRegionWeatherData &inout DefaultValue = FC_DebugOverrideRegionWeatherData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DebugOverrideRegionWeatherData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDebugOverrideRegionWeatherData_BP(const FECSEntity &inout Entity, const FC_DebugOverrideRegionWeatherData &inout DefaultValue = FC_DebugOverrideRegionWeatherData())
{
    ECSFunc_FC_DebugOverrideRegionWeatherData::AssignDebugOverrideRegionWeatherData(Entity, DefaultValue);
    return;
}
FC_DebugOverrideRegionWeatherData& ModifyDebugOverrideRegionWeatherData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DebugOverrideRegionWeatherData));
    return local_12.GetComp();
}
FC_DebugOverrideRegionWeatherData& ModifyOrAddDebugOverrideRegionWeatherData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DebugOverrideRegionWeatherData));
    return local_12.GetComp();
}
const FC_DebugOverrideRegionWeatherData& GetDebugOverrideRegionWeatherData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DebugOverrideRegionWeatherData));
    return local_12.GetComp();
}
UFUNCTION()
FC_DebugOverrideRegionWeatherData GetDebugOverrideRegionWeatherData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DebugOverrideRegionWeatherData& local_4 = ECSFunc_FC_DebugOverrideRegionWeatherData::GetDebugOverrideRegionWeatherData(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DebugOverrideRegionWeatherData();
}
const FC_DebugOverrideRegionWeatherData GetDefaultedDebugOverrideRegionWeatherData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DebugOverrideRegionWeatherData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DebugOverrideRegionWeatherData);
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
FC_DebugOverrideRegionWeatherData GetDefaultedDebugOverrideRegionWeatherData_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DebugOverrideRegionWeatherData::GetDefaultedDebugOverrideRegionWeatherData(Entity);
}
UFUNCTION()
bool RemoveDebugOverrideRegionWeatherData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DebugOverrideRegionWeatherData);
}
}
FECSMonitorRuntimeView __GetMonitorDebugOverrideRegionWeatherDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DebugOverrideRegionWeatherData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugOverrideRegionWeatherDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DebugOverrideRegionWeatherData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugOverrideRegionWeatherDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DebugOverrideRegionWeatherData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugOverrideRegionWeatherDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DebugOverrideRegionWeatherData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugOverrideRegionWeatherDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DebugOverrideRegionWeatherData, bFixedFrame, bMustHandleAll);
}
void __MonitorDebugOverrideRegionWeatherDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DebugOverrideRegionWeatherData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugOverrideRegionWeatherDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DebugOverrideRegionWeatherData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugOverrideRegionWeatherDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DebugOverrideRegionWeatherData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DebugRegionWeatherData
{
UFUNCTION()
bool HasDebugRegionWeatherData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DebugRegionWeatherData);
}
FC_DebugRegionWeatherData& AssignDebugRegionWeatherData(const FECSEntity &inout Entity, const FC_DebugRegionWeatherData &inout DefaultValue = FC_DebugRegionWeatherData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DebugRegionWeatherData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDebugRegionWeatherData_BP(const FECSEntity &inout Entity, const FC_DebugRegionWeatherData &inout DefaultValue = FC_DebugRegionWeatherData())
{
    ECSFunc_FC_DebugRegionWeatherData::AssignDebugRegionWeatherData(Entity, DefaultValue);
    return;
}
FC_DebugRegionWeatherData& ModifyDebugRegionWeatherData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DebugRegionWeatherData));
    return local_12.GetComp();
}
FC_DebugRegionWeatherData& ModifyOrAddDebugRegionWeatherData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DebugRegionWeatherData));
    return local_12.GetComp();
}
const FC_DebugRegionWeatherData& GetDebugRegionWeatherData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DebugRegionWeatherData));
    return local_12.GetComp();
}
UFUNCTION()
FC_DebugRegionWeatherData GetDebugRegionWeatherData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DebugRegionWeatherData& local_4 = ECSFunc_FC_DebugRegionWeatherData::GetDebugRegionWeatherData(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DebugRegionWeatherData();
}
const FC_DebugRegionWeatherData GetDefaultedDebugRegionWeatherData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DebugRegionWeatherData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DebugRegionWeatherData);
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
FC_DebugRegionWeatherData GetDefaultedDebugRegionWeatherData_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DebugRegionWeatherData::GetDefaultedDebugRegionWeatherData(Entity);
}
UFUNCTION()
bool RemoveDebugRegionWeatherData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DebugRegionWeatherData);
}
}
FECSMonitorRuntimeView __GetMonitorDebugRegionWeatherDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DebugRegionWeatherData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugRegionWeatherDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DebugRegionWeatherData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugRegionWeatherDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DebugRegionWeatherData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugRegionWeatherDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DebugRegionWeatherData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDebugRegionWeatherDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DebugRegionWeatherData, bFixedFrame, bMustHandleAll);
}
void __MonitorDebugRegionWeatherDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DebugRegionWeatherData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugRegionWeatherDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DebugRegionWeatherData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDebugRegionWeatherDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DebugRegionWeatherData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_SyncDebugWeatherInfo
{
UFUNCTION()
bool HasSyncDebugWeatherInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_SyncDebugWeatherInfo);
}
FCS_SyncDebugWeatherInfo& AssignSyncDebugWeatherInfo(const FECSWorldPtr &inout World, const FCS_SyncDebugWeatherInfo &inout DefaultValue = FCS_SyncDebugWeatherInfo())
{
    UScriptStruct local_6 = FCS_SyncDebugWeatherInfo;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignSyncDebugWeatherInfo_BP(const FECSWorldPtr &inout World, const FCS_SyncDebugWeatherInfo &inout DefaultValue = FCS_SyncDebugWeatherInfo())
{
    ECSFunc_FCS_SyncDebugWeatherInfo::AssignSyncDebugWeatherInfo(World, DefaultValue);
    return;
}
FCS_SyncDebugWeatherInfo& ModifySyncDebugWeatherInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SyncDebugWeatherInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_SyncDebugWeatherInfo& ModifyOrAddSyncDebugWeatherInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SyncDebugWeatherInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_SyncDebugWeatherInfo& GetSyncDebugWeatherInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_SyncDebugWeatherInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_SyncDebugWeatherInfo GetSyncDebugWeatherInfo_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_SyncDebugWeatherInfo& local_4 = ECSFunc_FCS_SyncDebugWeatherInfo::GetSyncDebugWeatherInfo(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_SyncDebugWeatherInfo();
}
const FCS_SyncDebugWeatherInfo GetDefaultedSyncDebugWeatherInfo(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_SyncDebugWeatherInfo __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_SyncDebugWeatherInfo);
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
FCS_SyncDebugWeatherInfo GetDefaultedSyncDebugWeatherInfo_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_SyncDebugWeatherInfo::GetDefaultedSyncDebugWeatherInfo(World);
}
UFUNCTION()
bool RemoveSyncDebugWeatherInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_SyncDebugWeatherInfo);
}
}
void __MonitorSyncDebugWeatherInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_SyncDebugWeatherInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncDebugWeatherInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_SyncDebugWeatherInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncDebugWeatherInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_SyncDebugWeatherInfo, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DebugOverrideRegionWeatherData &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DebugOverrideRegionWeatherData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DebugOverrideRegionWeatherData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DebugOverrideRegionWeatherData
{
int __IndexOf_WeatherConfig()
{
    return 0;
}
int __IndexOf_Duration()
{
    return 1;
}
int __IndexOf_ArtWeatherBlendTime()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DebugRegionWeatherData &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DebugRegionWeatherData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DebugRegionWeatherData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DebugRegionWeatherData
{
int __IndexOf_WeatherTemplate()
{
    return 0;
}
int __IndexOf_RuntimeOverrideWeatherTemplate()
{
    return 1;
}
int __IndexOf_WeatherEntity()
{
    return 2;
}
int __IndexOf_UpdatedTimeStamp()
{
    return 3;
}
int __IndexOf_Duration()
{
    return 4;
}
int __IndexOf_ElapsedTime()
{
    return 5;
}
int __IndexOf_bIsOverrideWeather()
{
    return 6;
}
}
