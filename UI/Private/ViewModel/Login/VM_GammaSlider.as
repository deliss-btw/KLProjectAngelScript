
namespace FVM_GammaSlider
{
    const int ModelId = 0;

}
struct FVM_GammaSlider : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_CurrentValue;
    UPROPERTY()
    float32 m_DefaultValue;
    UPROPERTY()
    float32 m_MinValue;
    UPROPERTY()
    float32 m_MaxValue;
    UPROPERTY()
    float32 m_DeadZone;
    UPROPERTY()
    float32 m_BeginValue;
    UPROPERTY()
    bool m_bNotLoginPage;
    UPROPERTY()
    FSimpleModelEvent m_OnGammaSliderClosedEvent;

    FVM_GammaSlider()
    {
        this.m_CurrentValue = 0.0f;
        this.m_DefaultValue = 2.2f;
        this.m_MinValue = 0.5f;
        this.m_MaxValue = 5.0f;
        this.m_DeadZone = 0.1f;
        this.m_BeginValue = 0.5f;
        this.m_bNotLoginPage = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_GammaSlider(const FVM_GammaSlider &inout Other)
    {
        this.m_CurrentValue = 0.0f;
        this.m_DefaultValue = 2.2f;
        this.m_MinValue = 0.5f;
        this.m_MaxValue = 5.0f;
        this.m_DeadZone = 0.1f;
        this.m_BeginValue = 0.5f;
        this.m_bNotLoginPage = false;
        this.m_CurrentValue = Other.m_CurrentValue;
        this.m_DefaultValue = Other.m_DefaultValue;
        this.m_MinValue = Other.m_MinValue;
        this.m_MaxValue = Other.m_MaxValue;
        this.m_DeadZone = Other.m_DeadZone;
        this.m_BeginValue = Other.m_BeginValue;
        this.m_bNotLoginPage = Other.m_bNotLoginPage;
        return;
    }
    FVM_GammaSlider opAssign(const FVM_GammaSlider &inout Other)
    {
        FVM_GammaSlider __r;
        this.m_CurrentValue = Other.m_CurrentValue;
        this.m_DefaultValue = Other.m_DefaultValue;
        this.m_MinValue = Other.m_MinValue;
        this.m_MaxValue = Other.m_MaxValue;
        this.m_DeadZone = Other.m_DeadZone;
        this.m_BeginValue = Other.m_BeginValue;
        this.m_bNotLoginPage = Other.m_bNotLoginPage;
        return __r;
    }
    void LoadConfig(const FConfigVM_GammaSlider &inout InConfig)
    {
        this.SetMinValue(InConfig.MinValue);
        this.SetMaxValue(InConfig.MaxValue);
        this.SetDeadZone(InConfig.DeadZone);
        this.SetDefaultValue(InConfig.DefaultValue);
        return;
    }
    void PostLoad()
    {
        int local_16 = 0;
        UKLGameUserSettings local_4 = UKLGameUserSettings::Get();
        if (local_4 == nullptr)
        {
            XError(ELog(16), "FVM_GammaSlider::SetGammaValue: UKLGameUserSettings is null");
            return;
        }
        this.SetCurrentValue(this.GammaValueToSliderValue(local_4.GetDisplayGamma()));
        this.SetBeginValue(this.GetCurrentValue());
        FEUIWidgetRef local_10 = this.GetOwnerWidget();
        FEUIWidgetRef::GetViewModel(local_10);
        local_16.SetCurrentRatio(this.GetBeginValue());
        return;
    }
    bool HasChanged()
    {
        return (this.GetBeginValue() != this.GetCurrentValue());
    }
    void ResetGammaValue()
    {
        UKLGameUserSettings local_4 = UKLGameUserSettings::Get();
        if (local_4 == nullptr)
        {
            XError(ELog(16), "FVM_GammaSlider::SetGammaValue: UKLGameUserSettings is null");
            return;
        }
        local_4.SetDisplayGamma(this.SliderValueToGammaValue(this.GetBeginValue()));
        return;
    }
    void BeginDestroy()
    {
        this.GetOnGammaSliderClosedEvent().Broadcast();
        return;
    }
    void SettingFinish()
    {
        UKLGameUserSettings local_4 = UKLGameUserSettings::Get();
        if (local_4 == nullptr)
        {
            XError(ELog(16), "FVM_GammaSlider::SaveSettings: UKLGameUserSettings is null");
            return;
        }
        local_4.SaveSettings();
        return;
    }
    void SetSliderValue(const float32 Value)
    {
        float32 local_1 = this.GetCurrentValue();
        this.SetCurrentValue(FMath::Clamp(Value, 0.0f, 1.0f));
        if (local_1 != this.GetCurrentValue())
        {
            UKLGameUserSettings local_10 = UKLGameUserSettings::Get();
            if (local_10 == nullptr)
            {
                XError(ELog(16), "FVM_GammaSlider::SetGammaValue: UKLGameUserSettings is null");
                return;
            }
            float32 local_3 = this.SliderValueToGammaValue(this.GetCurrentValue());
            local_10.SetDisplayGamma(local_3);
            XLog(ELog(16), FString().Append("FVM_GammaSlider::SetGammaValue: CurrentValue = ").Append(this.GetCurrentValue()).Append(" GammaValue = ").Append(local_3));
        }
        return;
    }
    float32 GammaValueToSliderValue(const float32 GammaValue)
    {
        if (GammaValue > this.GetDefaultValue())
        {
            return (((GammaValue - this.GetDefaultValue()) / (this.GetMaxValue() - this.GetDefaultValue())) * 0.5f) + 0.5f;
        }
        else
        {
            float32 local_3_2 = this.GetMinValue();
            float32 local_5 = GammaValue - local_3_2;
            local_3_2 = this.GetDefaultValue();
            return (local_5 / (local_3_2 - this.GetMinValue())) * 0.5f;
        }
    }
    float32 SliderValueToGammaValue(const float32 SliderValue)
    {
        if (SliderValue > 0.5f)
        {
            float32 local_5 = this.GetDefaultValue();
            float32 local_1 = SliderValue - 0.5f;
            float32 local_3 = local_1 * 2.0f;
            local_1 = this.GetMaxValue();
            local_1 = local_1 - this.GetDefaultValue();
            return local_5 + (local_3 * local_1);
        }
        else
        {
            return this.GetMinValue() + ((SliderValue * 2.0f) * (this.GetDefaultValue() - this.GetMinValue()));
        }
    }
    float32 GetCurrentValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_CurrentValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCurrentValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentValue = __Value;
        return;
    }
    float32 GetDefaultValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_DefaultValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDefaultValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DefaultValue = __Value;
        return;
    }
    float32 GetMinValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_MinValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetMinValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MinValue = __Value;
        return;
    }
    float32 GetMaxValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_MaxValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetMaxValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MaxValue = __Value;
        return;
    }
    const float32 GetDeadZone() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_DeadZone() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDeadZone(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DeadZone = __Value;
        return;
    }
    const float32 GetBeginValue() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_BeginValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetBeginValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_BeginValue = __Value;
        return;
    }
    bool GetbNotLoginPage() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bNotLoginPage;
    }
    void SetbNotLoginPage(const bool __Value) property
    {
        if (!(this.m_bNotLoginPage) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bNotLoginPage = __Value;
        return;
    }
    const FSimpleModelEvent GetOnGammaSliderClosedEvent() const property
    {
        const FSimpleModelEvent __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FSimpleModelEvent GetModify_OnGammaSliderClosedEvent() property
    {
        FSimpleModelEvent __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetOnGammaSliderClosedEvent(const FSimpleModelEvent &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        return;
    }
}

struct __GeneratedProperties_FVM_GammaSlider
{
    UPROPERTY()
    TEUIModelRef<FVM_GammaSlider> Self;

    __GeneratedProperties_FVM_GammaSlider()
    {
        return;
    }
}

namespace FVM_GammaSlider
{
FVM_GammaSlider& Create(const UObject ContextObject)
{
    return FVM_GammaSlider::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_GammaSlider CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_GammaSlider __r;
    TEUIModelRef<FVM_GammaSlider> local_6 = TEUIModelRef<FVM_GammaSlider>(EUIInternal::MakeModelWithManager(Manager, FVM_GammaSlider::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DefaultValue";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MinValue";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MaxValue";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BeginValue";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bNotLoginPage";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_GammaSlider>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_GammaSlider;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_GammaSlider;
}
float32 __UIGetter_DefaultValue(const FVM_GammaSlider &inout Model)
{
    return Model.GetDefaultValue();
}
float32 __UIGetter_MinValue(const FVM_GammaSlider &inout Model)
{
    return Model.GetMinValue();
}
float32 __UIGetter_MaxValue(const FVM_GammaSlider &inout Model)
{
    return Model.GetMaxValue();
}
float32 __UIGetter_BeginValue(const FVM_GammaSlider &inout Model)
{
    return Model.GetBeginValue();
}
bool __UIGetter_bNotLoginPage(const FVM_GammaSlider &inout Model)
{
    return Model.GetbNotLoginPage();
}
TEUIModelRef<FVM_GammaSlider> __UIGetter_Self(const FVM_GammaSlider &inout Model)
{
    return TEUIModelRef<FVM_GammaSlider>(Model);
}
int __IndexOf_CurrentValue()
{
    return 0;
}
int __IndexOf_DefaultValue()
{
    return 1;
}
int __IndexOf_MinValue()
{
    return 2;
}
int __IndexOf_MaxValue()
{
    return 3;
}
int __IndexOf_DeadZone()
{
    return 4;
}
int __IndexOf_BeginValue()
{
    return 5;
}
int __IndexOf_bNotLoginPage()
{
    return 6;
}
int __IndexOf_OnGammaSliderClosedEvent()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_GammaSlider
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
