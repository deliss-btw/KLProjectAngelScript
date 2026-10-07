
namespace FMS_WeatherData
{
    const int ModelId = 0;

}
struct FMsg_WeatherChanged : FEUIMessage
{
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> NewWeatherConfig;

    FMsg_WeatherChanged()
    {
        return;
    }
}

struct FMS_WeatherData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> m_CacheOldWeatherPrivate;
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> m_CurrentWeatherPrivate;

    FMS_WeatherData()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_WeatherData(const FMS_WeatherData &inout Other)
    {
        this.m_CacheOldWeatherPrivate = Other.m_CacheOldWeatherPrivate;
        this.m_CurrentWeatherPrivate = Other.m_CurrentWeatherPrivate;
        return;
    }
    FMS_WeatherData& opAssign(const FMS_WeatherData &inout Other)
    {
        this.m_CacheOldWeatherPrivate = Other.m_CacheOldWeatherPrivate;
        return Other.m_CurrentWeatherPrivate;
    }
    TDataObjectPtr<FWeatherConfig> GetCurrentWeatherConfig() const property
    {
        return this.GetCurrentWeatherPrivate();
    }
    TDataObjectPtr<FWeatherConfig> GetCacheOldWeatherConfig() const property
    {
        return this.GetCacheOldWeatherPrivate();
    }
    void OnWeatherEffectChanged(const FCS_ClientWeatherEffect &inout WeatherEffect)
    {
        int local_90 = 0;
        TDataObjectPtr<FWeatherConfig> local_24 = this.GetCurrentWeatherPrivate();
        if (WeatherEffect)
        {
            this.SetCurrentWeatherPrivate(WeatherEffect.WeatherConfig);
        }
        FDataObjectPtr local_74;
        local_74;
        if ((!((local_24 == local_74))))
        {
            this.SetCacheOldWeatherPrivate(local_24);
            if ((int(::FLevelUtils::GetCurrentLevelType())) == 3 || (int(::FLevelUtils::GetCurrentLevelType()) == 5) || (this.GetCurrentWeatherPrivate() && !(KLLoadingScreen::IsLoadingScreenVisible(__GetWorldContext()))))
            {
                FEUIModelRef local_88 = FEUIModelRef(this);
                FEUIMessageBus::Publish(EUIMessageBus);
                local_90.NewWeatherConfig = this.GetCurrentWeatherPrivate();
            }
        }
        return;
    }
    void ShowWeatherChangePopup(const FMsg_WeatherChanged &inout Msg)
    {
        return;
    }
    void InvalidateEntityCache()
    {
        this.SetCurrentWeatherPrivate(TDataObjectPtr<FWeatherConfig>(nullptr));
        return;
    }
    const TDataObjectPtr<FWeatherConfig> GetCacheOldWeatherPrivate() const property
    {
        const TDataObjectPtr<FWeatherConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FWeatherConfig> GetModify_CacheOldWeatherPrivate() property
    {
        TDataObjectPtr<FWeatherConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCacheOldWeatherPrivate(const TDataObjectPtr<FWeatherConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CacheOldWeatherPrivate = __Value;
        return;
    }
    const TDataObjectPtr<FWeatherConfig> GetCurrentWeatherPrivate() const property
    {
        const TDataObjectPtr<FWeatherConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FWeatherConfig> GetModify_CurrentWeatherPrivate() property
    {
        TDataObjectPtr<FWeatherConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCurrentWeatherPrivate(const TDataObjectPtr<FWeatherConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentWeatherPrivate = __Value;
        return;
    }
}

namespace FMS_WeatherData
{
FMS_WeatherData& Get(const UObject ContextObject)
{
    return FMS_WeatherData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_WeatherData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_WeatherData __r;
    TEUIModelRef<FMS_WeatherData> local_6 = TEUIModelRef<FMS_WeatherData>(EUIInternal::MakeModelWithManager(Manager, FMS_WeatherData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnWeatherEffectChanged";
    local_14.ComponentType = FCS_ClientWeatherEffect;
    Result.MonitorFunctions.Add(local_14);
    FEUIModelMsgHandleDefine local_28;
    local_28.FunctionName = "__ShowWeatherChangePopup";
    local_28.MessageTypeName = "Msg_WeatherChanged";
    local_28.SourcePropertyModelRefs = FBitSet64(-1);
    Result.MessageHandleFunctions.Add(local_28);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_WeatherData;
}
void __OnWeatherEffectChanged(FMS_WeatherData &inout Model, const FECSEntity &inout Entity, const FCS_ClientWeatherEffect &inout Component)
{
    Get local_4;
    Model.OnWeatherEffectChanged(local_4.opCall());
    return;
}
void __ShowWeatherChangePopup(FMS_WeatherData &inout Model, const FMsg_WeatherChanged &inout Message)
{
    Model.ShowWeatherChangePopup(Message);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_CacheOldWeatherPrivate()
{
    return 0;
}
int __IndexOf_CurrentWeatherPrivate()
{
    return 1;
}
}
