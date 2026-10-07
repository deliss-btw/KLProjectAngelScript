
namespace FVM_Weather
{
    const int ModelId = 0;
}
namespace FVMS_CurrentWeather
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ShowHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HideHover = FEUIModelCallbackSignature();

}
struct FVM_Weather : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> m_WeatherConfig;

    FVM_Weather()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_Weather' by default constructor.");
        return;
    }
    FVM_Weather(const FVM_Weather &inout Other)
    {
        this.m_WeatherConfig = Other.m_WeatherConfig;
        return;
    }
    FVM_Weather(const TDataObjectPtr<FWeatherConfig> &inout InWeatherConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetWeatherConfig(InWeatherConfig);
        return;
    }
    FVM_Weather& opAssign(const FVM_Weather &inout Other)
    {
        return Other.m_WeatherConfig;
    }
    FSlateBrush GetDisplayIcon() const
    {
        if (this.GetWeatherConfig())
        {
            return this.GetWeatherConfig().opArrow().DisplayIcon.LoadBrush();
        }
        return FSoftBrush().LoadBrush();
    }
    FSlateBrush GetLargeIcon() const
    {
        if (this.GetWeatherConfig())
        {
            return this.GetWeatherConfig().opArrow().LargeIcon.LoadBrush();
        }
        return FSoftBrush().LoadBrush();
    }
    FText GetWeatherChangeTipsText() const
    {
        FText local_6;
        if (this.GetWeatherConfig())
        {
            local_6 = NSLOCTEXT("VM_Weather", "WeatherTipsText", "е¤©ж°”еЏдёє{0}");
            return FText::Format(local_6, this.GetWeatherConfig().opArrow().DisplayName);
        }
        return local_6;
    }
    TDataObjectPtr<FWeatherConfig> GetWeatherConfig() const property
    {
        TDataObjectPtr<FWeatherConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FWeatherConfig> GetModify_WeatherConfig() property
    {
        TDataObjectPtr<FWeatherConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetWeatherConfig(const TDataObjectPtr<FWeatherConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_WeatherConfig = __Value;
        return;
    }
}

struct FVMS_CurrentWeather : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TEUIModelRef<FMS_WeatherData> m_WeatherData;
    UPROPERTY()
    FCommonHoverHandle m_HoverHandle;
    UPROPERTY()
    uint m_NeedAnimShowWeatherID;

    FVMS_CurrentWeather()
    {
        this.m_NeedAnimShowWeatherID = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_CurrentWeather(const FVMS_CurrentWeather &inout Other)
    {
        this.m_NeedAnimShowWeatherID = 0;
        this.m_WeatherData = Other.m_WeatherData;
        this.m_NeedAnimShowWeatherID = int(Other.m_NeedAnimShowWeatherID);
        return;
    }
    FVMS_CurrentWeather opAssign(const FVMS_CurrentWeather &inout Other)
    {
        FVMS_CurrentWeather __r;
        this.m_WeatherData = Other.m_WeatherData;
        this.m_NeedAnimShowWeatherID = int(Other.m_NeedAnimShowWeatherID);
        return __r;
    }
    void PostConstruct()
    {
        this.SetWeatherData(TEUIModelRef<FMS_WeatherData>(::FMS_WeatherData::Get(this.GetContext().Manager)));
        return;
    }
    TDataObjectPtr<FWeatherConfig> GetWeatherConfig() const
    {
        return this.GetWeatherData().opArrow().GetCurrentWeatherConfig();
    }
    FSlateBrush GetDisplayIcon() const
    {
        if (this.GetWeatherData().opArrow().GetCurrentWeatherConfig())
        {
            return this.GetWeatherData().opArrow().GetCurrentWeatherConfig().opArrow().DisplayIcon.LoadBrush();
        }
        return FSoftBrush().LoadBrush();
    }
    void ShowWeatherChangePopup(const FMsg_WeatherChanged &inout Msg)
    {
        this.SetNeedAnimShowWeatherID(0);
        return;
    }
    TEUIModelRef<FVM_Weather> GetWeatherModel() const
    {
        TDataObjectPtr<FWeatherConfig> local_76;
        if (this.GetWeatherData())
        {
            local_76 = this.GetWeatherData().opArrow().GetCurrentWeatherConfig();
        }
        else
        {
            local_76 = TDataObjectPtr<FWeatherConfig>();
        }
        return TEUIModelRef<FVM_Weather>(::FVM_Weather::Create(this.GetContext().Manager, local_76));
    }
    TEUIModelRef<FVM_Weather> GetOldWeatherModel() const
    {
        TDataObjectPtr<FWeatherConfig> local_76;
        if (this.GetWeatherData())
        {
            local_76 = this.GetWeatherData().opArrow().GetCacheOldWeatherConfig();
        }
        else
        {
            local_76 = TDataObjectPtr<FWeatherConfig>();
        }
        return TEUIModelRef<FVM_Weather>(::FVM_Weather::Create(this.GetContext().Manager, local_76));
    }
    void ShowHover(const UWidget Widget)
    {
        const UUtilitySettings local_24;
        FCommonHoverHandle local_2;
        if (local_2.opCmp(FCommonHoverHandle::InvalidHandle) == 0)
        {
            FEUIModelContainer local_18;
            local_18.AddModel(this.GetWeatherData().opImplConv(), false);
            GetGameplaySettings<UUtilitySettings> local_26;
            local_24 = local_26;
            local_2 = ::CommonPopup::HoverCustom(Widget, local_24.WeatherInfoHover, local_18, false, true, ECommonHoverLayout(0), EEUILayoutLayer(0), false);
            this.SetHoverHandle(local_2);
        }
        return;
    }
    void HideHover()
    {
        ::CommonPopup::CloseHover(this.GetHoverHandle(), this.GetContext().Manager, true);
        this.SetHoverHandle(FCommonHoverHandle::InvalidHandle);
        return;
    }
    TEUIModelRef<FMS_WeatherData> GetWeatherData() const property
    {
        this.TrackPropertyRead(0);
        return this.m_WeatherData;
    }
    void SetWeatherData(const TEUIModelRef<FMS_WeatherData> &inout __Value) property
    {
        TEUIModelRef<FMS_WeatherData> local_2;
        local_2 = this.m_WeatherData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_WeatherData = __Value;
        return;
    }
    const FCommonHoverHandle GetHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FCommonHoverHandle GetModify_HoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    uint GetNeedAnimShowWeatherID() const property
    {
        this.TrackPropertyRead(2);
        return this.m_NeedAnimShowWeatherID;
    }
    void SetNeedAnimShowWeatherID(const uint __Value) property
    {
        if (this.m_NeedAnimShowWeatherID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_NeedAnimShowWeatherID = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Weather
{
    UPROPERTY()
    FSlateBrush DisplayIcon;
    UPROPERTY()
    FSlateBrush LargeIcon;
    UPROPERTY()
    FText WeatherChangeTipsText;
    UPROPERTY()
    TEUIModelRef<FVM_Weather> Self;

    __GeneratedProperties_FVM_Weather()
    {
        return;
    }
}

struct __GeneratedProperties_FVMS_CurrentWeather
{
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> WeatherConfig;
    UPROPERTY()
    FSlateBrush DisplayIcon;
    UPROPERTY()
    TEUIModelRef<FVM_Weather> WeatherModel;
    UPROPERTY()
    TEUIModelRef<FVM_Weather> OldWeatherModel;
    UPROPERTY()
    TEUIModelRef<FVMS_CurrentWeather> Self;

    __GeneratedProperties_FVMS_CurrentWeather()
    {
        return;
    }
}

namespace FVM_Weather
{
FVM_Weather& Create(const UObject ContextObject, const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig)
{
    return FVM_Weather::CreateByManager(EUIInternal::GetContextManager(ContextObject), WeatherConfig);
}
FVM_Weather CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig)
{
    FVM_Weather __r;
    TEUIModelRef<FVM_Weather> local_6 = TEUIModelRef<FVM_Weather>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Weather::ModelId, 0, WeatherConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "WeatherConfig";
    local_14.TypeName = "TDataObjectPtr<FWeatherConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LargeIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WeatherChangeTipsText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Weather>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Weather;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Weather;
}
TDataObjectPtr<FWeatherConfig> __UIGetter_WeatherConfig(const FVM_Weather &inout Model)
{
    return Model.GetWeatherConfig();
}
FSlateBrush __UIGetter_DisplayIcon(const FVM_Weather &inout Model)
{
    return Model.GetDisplayIcon();
}
FSlateBrush __UIGetter_LargeIcon(const FVM_Weather &inout Model)
{
    return Model.GetLargeIcon();
}
FText __UIGetter_WeatherChangeTipsText(const FVM_Weather &inout Model)
{
    return Model.GetWeatherChangeTipsText();
}
TEUIModelRef<FVM_Weather> __UIGetter_Self(const FVM_Weather &inout Model)
{
    return TEUIModelRef<FVM_Weather>(Model);
}
int __IndexOf_WeatherConfig()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_Weather
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVMS_CurrentWeather
{
FVMS_CurrentWeather& Get(const UObject ContextObject)
{
    return FVMS_CurrentWeather::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_CurrentWeather GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_CurrentWeather __r;
    TEUIModelRef<FVMS_CurrentWeather> local_6 = TEUIModelRef<FVMS_CurrentWeather>(EUIInternal::MakeModelWithManager(Manager, FVMS_CurrentWeather::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVMS_CurrentWeather;
}
void __ShowWeatherChangePopup(FVMS_CurrentWeather &inout Model, const FMsg_WeatherChanged &inout Message)
{
    Model.ShowWeatherChangePopup(Message);
    return;
}
TDataObjectPtr<FWeatherConfig> __UIGetter_WeatherConfig(const FVMS_CurrentWeather &inout Model)
{
    return Model.GetWeatherConfig();
}
FSlateBrush __UIGetter_DisplayIcon(const FVMS_CurrentWeather &inout Model)
{
    return Model.GetDisplayIcon();
}
TEUIModelRef<FVM_Weather> __UIGetter_WeatherModel(const FVMS_CurrentWeather &inout Model)
{
    return Model.GetWeatherModel();
}
TEUIModelRef<FVM_Weather> __UIGetter_OldWeatherModel(const FVMS_CurrentWeather &inout Model)
{
    return Model.GetOldWeatherModel();
}
TEUIModelRef<FVMS_CurrentWeather> __UIGetter_Self(const FVMS_CurrentWeather &inout Model)
{
    return TEUIModelRef<FVMS_CurrentWeather>(Model);
}
int __IndexOf_WeatherData()
{
    return 0;
}
int __IndexOf_HoverHandle()
{
    return 1;
}
int __IndexOf_NeedAnimShowWeatherID()
{
    return 2;
}
}
namespace __GeneratedProperties_FVMS_CurrentWeather
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
