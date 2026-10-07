
namespace FVM_CommonComponentSlider
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature BroadcastCurrentValue = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetCurrentValueByRatio = FEUIModelCallbackSignature();

}
struct FVM_CommonComponentSliderConfig
{
    UPROPERTY()
    float32 MinValue;
    UPROPERTY()
    float32 MaxValue;
    UPROPERTY()
    float32 Step;
    UPROPERTY()
    float32 DefaultValue;
    UPROPERTY()
    float32 CurrentValue;
    UPROPERTY()
    float32 MidValue;
    UPROPERTY()
    int Precision;


}

struct FVM_CommonComponentSlider : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonSlider> m_CommonSliderVM;
    UPROPERTY()
    FVM_CommonComponentSliderConfig m_Config;
    UPROPERTY()
    FOnCommonComponentSliderSelected m_OnComponentSliderSelected;
    UPROPERTY()
    float32 m_CurrentValue;
    UPROPERTY()
    FText m_DisplayText;
    UPROPERTY()
    float32 m_MinValue;
    UPROPERTY()
    float32 m_MaxValue;
    UPROPERTY()
    float32 m_Step;
    UPROPERTY()
    float32 m_DefaultValue;
    UPROPERTY()
    float32 m_MidValue;
    UPROPERTY()
    float32 PrevValue;
    UPROPERTY()
    int m_Precision;
    UPROPERTY()
    FEUITimerHandle m_BroadcastTimer;
    UPROPERTY()
    float32 m_BroadcastInterval;
    UPROPERTY()
    bool bBroadcast;

    FVM_CommonComponentSlider()
    {
        this.m_CurrentValue = 0.0f;
        this.m_MinValue = 0.0f;
        this.m_MaxValue = 0.0f;
        this.m_Step = 0.0f;
        this.m_DefaultValue = 0.0f;
        this.m_MidValue = 0.0f;
        this.PrevValue = 0.0f;
        this.m_Precision = 0;
        this.m_BroadcastInterval = 0.15f;
        this.bBroadcast = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonComponentSlider' by default constructor.");
        return;
    }
    FVM_CommonComponentSlider(const FVM_CommonComponentSlider &inout Other)
    {
        this.m_CurrentValue = 0.0f;
        this.m_MinValue = 0.0f;
        this.m_MaxValue = 0.0f;
        this.m_Step = 0.0f;
        this.m_DefaultValue = 0.0f;
        this.m_MidValue = 0.0f;
        this.PrevValue = 0.0f;
        this.m_Precision = 0;
        this.m_BroadcastInterval = 0.15f;
        this.bBroadcast = true;
        this.m_CommonSliderVM = Other.m_CommonSliderVM;
        this.m_Config = Other.m_Config;
        this.m_CurrentValue = Other.m_CurrentValue;
        this.m_DisplayText = Other.m_DisplayText;
        this.m_MinValue = Other.m_MinValue;
        this.m_MaxValue = Other.m_MaxValue;
        this.m_Step = Other.m_Step;
        this.m_DefaultValue = Other.m_DefaultValue;
        this.m_MidValue = Other.m_MidValue;
        this.m_Precision = int(Other.m_Precision);
        this.m_BroadcastTimer = Other.m_BroadcastTimer;
        this.m_BroadcastInterval = Other.m_BroadcastInterval;
        return;
    }
    FVM_CommonComponentSlider(const FVM_CommonComponentSliderConfig &inout InConfig, const FOnCommonComponentSliderSelected &inout InOnComponentSliderSelected)
    {
        this.m_CurrentValue = 0.0f;
        this.m_MinValue = 0.0f;
        this.m_MaxValue = 0.0f;
        this.m_Step = 0.0f;
        this.m_DefaultValue = 0.0f;
        this.m_MidValue = 0.0f;
        this.PrevValue = 0.0f;
        this.m_Precision = 0;
        this.m_BroadcastInterval = 0.15f;
        this.bBroadcast = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetConfig(InConfig);
        this.SetOnComponentSliderSelected(InOnComponentSliderSelected);
        return;
    }
    FVM_CommonComponentSlider opAssign(const FVM_CommonComponentSlider &inout Other)
    {
        FVM_CommonComponentSlider __r;
        this.m_CommonSliderVM = Other.m_CommonSliderVM;
        this.m_Config = Other.m_Config;
        this.m_CurrentValue = Other.m_CurrentValue;
        this.m_DisplayText = Other.m_DisplayText;
        this.m_MinValue = Other.m_MinValue;
        this.m_MaxValue = Other.m_MaxValue;
        this.m_Step = Other.m_Step;
        this.m_DefaultValue = Other.m_DefaultValue;
        this.m_MidValue = Other.m_MidValue;
        this.m_Precision = int(Other.m_Precision);
        this.m_BroadcastTimer = Other.m_BroadcastTimer;
        this.m_BroadcastInterval = Other.m_BroadcastInterval;
        return __r;
    }
    void PostConstruct()
    {
        this.SetMinValue(this.GetConfig().MinValue);
        this.SetMaxValue(this.GetConfig().MaxValue);
        this.SetStep(this.GetConfig().Step);
        this.SetDefaultValue(this.GetConfig().DefaultValue);
        this.SetCurrentValue(this.GetConfig().CurrentValue);
        this.SetMidValue(this.GetConfig().MidValue);
        this.SetPrecision(this.GetConfig().Precision);
        this.SetCommonSliderVM(TEUIModelRef<FVM_CommonSlider>(::FVM_CommonSlider::Create(this.GetContext().Manager)));
        float32 local_7_2 = (this.GetStep() / 2.0f) / (this.GetMaxValue() - this.GetMidValue());
        float32 local_8 = FMath::Max(0.01f, FMath::Min(((this.GetStep() / 2.0f) / (this.GetMidValue() - this.GetMinValue())), local_7_2));
        TEUIModelRef<FVM_CommonSlider> local_4 = this.GetCommonSliderVM();
        local_8.SetStep();
        float32 local_8_2 = this.GetCurrentRatioByValue(this.GetCurrentValue());
        TEUIModelRef<FVM_CommonSlider> local_4_2 = this.GetCommonSliderVM();
        local_8_2.SetCurrentRatio();
        TEUIModelRef<FVM_CommonSlider> local_4_3 = this.GetCommonSliderVM();
        GetModify_OnRatioChangedEvent().Add(this, FVM_CommonComponentSlider::SetCurrentValueByRatio);
        this.PrevValue = this.GetCurrentValue();
        this.UpdateDisplayText();
        return;
    }
    void UpdateDisplayText()
    {
        if (this.GetPrecision() > 0)
        {
            this.SetDisplayText(FText::FromString(FString().Append(this.GetCurrentValue())));
        }
        else
        {
            this.SetDisplayText(FText::FromString(FString().Append(FMath::RoundToInt(this.GetCurrentValue()))));
        }
        if (this.PrevValue != this.GetCurrentValue() && this.bBroadcast)
        {
            this.ScheduleCall(this.GetModify_BroadcastTimer(), n"BroadcastCurrentValue", this.GetBroadcastInterval());
            return;
        }
        if (!(this.bBroadcast))
        {
            this.bBroadcast = true;
            this.PrevValue = this.GetCurrentValue();
        }
        return;
    }
    void BroadcastCurrentValue()
    {
        if (!(this.bBroadcast) || (this.GetCurrentValue() == this.PrevValue))
        {
            this.bBroadcast = true;
            return;
        }
        this.GetOnComponentSliderSelected().Broadcast(this.GetCurrentValue());
        this.PrevValue = this.GetCurrentValue();
        return;
    }
    float32 GetCurrentRatioByValue(const float32 Value)
    {
        if (Value > this.GetMidValue())
        {
            return (((Value - this.GetMidValue()) / (this.GetMaxValue() - this.GetMidValue())) / 2.0f) + 0.5f;
        }
        else
        {
            float32 local_5_2 = Value - this.GetMinValue();
            float32 local_3_2 = local_5_2 / (this.GetMidValue() - this.GetMinValue());
            return local_3_2 / 2.0f;
        }
    }
    void SetValue(const float32 Value, const bool _bBroadcast = true)
    {
        this.SetCurrentValue(Value);
        TEUIModelRef<FVM_CommonSlider> local_2 = this.GetCommonSliderVM();
        this.GetCurrentRatioByValue(this.GetCurrentValue()).SetCurrentRatio();
        this.bBroadcast = _bBroadcast;
        return;
    }
    void SetCurrentValueByRatio(const float32 Ratio)
    {
        if (Ratio > 0.5f)
        {
            float32 local_1 = this.GetMaxValue();
            float32 local_4 = this.GetMidValue();
            local_1 = local_1 - local_4;
            float32 local_5 = FMath::Max(0.0f, local_1);
            float32 local_6 = this.GetMidValue();
            float32 local_3 = local_5 * 2.0f;
            local_4 = Ratio - 0.5f;
            this.SetCurrentValue(local_6 + (local_3 * local_4));
        }
        else
        {
            float32 local_1_2 = this.GetMidValue();
            float32 local_4_2 = this.GetMinValue();
            local_1_2 = FMath::Max(0.0f, local_1_2 - local_4_2);
            float32 local_6_2 = this.GetMidValue();
            local_4_2 = 0.5f - Ratio;
            this.SetCurrentValue(local_6_2 - ((local_1_2 * 2.0f) * local_4_2));
        }
        this.SetCurrentValue(float32(((FMath::RoundToFloat(this.GetCurrentValue() * (FMath::Pow(10.0, this.GetPrecision())))) / FMath::Pow(10.0, this.GetPrecision()))));
        return;
    }
    TEUIModelRef<FVM_CommonSlider> GetCommonSliderVM() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommonSliderVM;
    }
    void SetCommonSliderVM(const TEUIModelRef<FVM_CommonSlider> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonSlider> local_2;
        local_2 = this.m_CommonSliderVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommonSliderVM = __Value;
        return;
    }
    FVM_CommonComponentSliderConfig GetConfig() const property
    {
        FVM_CommonComponentSliderConfig __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FVM_CommonComponentSliderConfig GetModify_Config() property
    {
        FVM_CommonComponentSliderConfig __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetConfig(const FVM_CommonComponentSliderConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Config = __Value;
        return;
    }
    const FOnCommonComponentSliderSelected GetOnComponentSliderSelected() const property
    {
        const FOnCommonComponentSliderSelected __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FOnCommonComponentSliderSelected GetModify_OnComponentSliderSelected() property
    {
        FOnCommonComponentSliderSelected __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOnComponentSliderSelected(const FOnCommonComponentSliderSelected &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    float32 GetCurrentValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_CurrentValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCurrentValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentValue = __Value;
        return;
    }
    const FText GetDisplayText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_DisplayText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDisplayText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DisplayText = __Value;
        return;
    }
    float32 GetMinValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_MinValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetMinValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_MinValue = __Value;
        return;
    }
    float32 GetMaxValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_MaxValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetMaxValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_MaxValue = __Value;
        return;
    }
    const float32 GetStep() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_Step() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetStep(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_Step = __Value;
        return;
    }
    float32 GetDefaultValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_DefaultValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetDefaultValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_DefaultValue = __Value;
        return;
    }
    float32 GetMidValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    float32 GetModify_MidValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetMidValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_MidValue = __Value;
        return;
    }
    int GetPrecision() const property
    {
        this.TrackPropertyRead(10);
        return this.m_Precision;
    }
    void SetPrecision(const int __Value) property
    {
        if (this.m_Precision == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_Precision = __Value;
        return;
    }
    const FEUITimerHandle GetBroadcastTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FEUITimerHandle GetModify_BroadcastTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetBroadcastTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_BroadcastTimer = __Value;
        return;
    }
    const float32 GetBroadcastInterval() const property
    {
        const float32 __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    float32 GetModify_BroadcastInterval() property
    {
        float32 __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetBroadcastInterval(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_BroadcastInterval = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonComponentSlider
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonComponentSlider> Self;

    __GeneratedProperties_FVM_CommonComponentSlider()
    {
        return;
    }
}

namespace FVM_CommonComponentSlider
{
FVM_CommonComponentSlider& Create(const UObject ContextObject, const FVM_CommonComponentSliderConfig &inout Config, const FOnCommonComponentSliderSelected &inout OnComponentSliderSelected)
{
    return FVM_CommonComponentSlider::CreateByManager(EUIInternal::GetContextManager(ContextObject), Config, OnComponentSliderSelected);
}
FVM_CommonComponentSlider CreateByManager(const UEUIManagerSubsystem Manager, const FVM_CommonComponentSliderConfig &inout Config, const FOnCommonComponentSliderSelected &inout OnComponentSliderSelected)
{
    FVM_CommonComponentSlider __r;
    TEUIModelRef<FVM_CommonComponentSlider> local_6 = TEUIModelRef<FVM_CommonComponentSlider>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonComponentSlider::ModelId, 0, Config, OnComponentSliderSelected));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CommonSliderVM";
    local_14.TypeName = "TEUIModelRef<FVM_CommonSlider>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayText";
    local_14.TypeName = "FText";
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
    local_14.PropertyName = "Step";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DefaultValue";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MidValue";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Precision";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonComponentSlider>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonComponentSlider;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__UpdateDisplayText";
    local_24.DirtyFlags.Set(FVM_CommonComponentSlider::__IndexOf_CurrentValue());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonComponentSlider;
}
void __UpdateDisplayText(FVM_CommonComponentSlider &inout Model)
{
    Model.UpdateDisplayText();
    return;
}
TEUIModelRef<FVM_CommonSlider> __UIGetter_CommonSliderVM(const FVM_CommonComponentSlider &inout Model)
{
    return Model.GetCommonSliderVM();
}
FText __UIGetter_DisplayText(const FVM_CommonComponentSlider &inout Model)
{
    return Model.GetDisplayText();
}
float32 __UIGetter_MinValue(const FVM_CommonComponentSlider &inout Model)
{
    return Model.GetMinValue();
}
float32 __UIGetter_MaxValue(const FVM_CommonComponentSlider &inout Model)
{
    return Model.GetMaxValue();
}
float32 __UIGetter_Step(const FVM_CommonComponentSlider &inout Model)
{
    return Model.GetStep();
}
float32 __UIGetter_DefaultValue(const FVM_CommonComponentSlider &inout Model)
{
    return Model.GetDefaultValue();
}
float32 __UIGetter_MidValue(const FVM_CommonComponentSlider &inout Model)
{
    return Model.GetMidValue();
}
int __UIGetter_Precision(const FVM_CommonComponentSlider &inout Model)
{
    return Model.GetPrecision();
}
TEUIModelRef<FVM_CommonComponentSlider> __UIGetter_Self(const FVM_CommonComponentSlider &inout Model)
{
    return TEUIModelRef<FVM_CommonComponentSlider>(Model);
}
int __IndexOf_CommonSliderVM()
{
    return 0;
}
int __IndexOf_Config()
{
    return 1;
}
int __IndexOf_OnComponentSliderSelected()
{
    return 2;
}
int __IndexOf_CurrentValue()
{
    return 3;
}
int __IndexOf_DisplayText()
{
    return 4;
}
int __IndexOf_MinValue()
{
    return 5;
}
int __IndexOf_MaxValue()
{
    return 6;
}
int __IndexOf_Step()
{
    return 7;
}
int __IndexOf_DefaultValue()
{
    return 8;
}
int __IndexOf_MidValue()
{
    return 9;
}
int __IndexOf_Precision()
{
    return 10;
}
int __IndexOf_BroadcastTimer()
{
    return 11;
}
int __IndexOf_BroadcastInterval()
{
    return 12;
}
}
namespace __GeneratedProperties_FVM_CommonComponentSlider
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
