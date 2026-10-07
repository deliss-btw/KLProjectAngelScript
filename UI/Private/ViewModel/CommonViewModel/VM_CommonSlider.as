
namespace FVM_CommonSlider
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetCurrentRatio = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetCurrentStep = FEUIModelCallbackSignature();

}
struct FVM_CommonSlider : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_MinValue;
    UPROPERTY()
    float32 m_MaxValue;
    UPROPERTY()
    float32 m_Ratio;
    UPROPERTY()
    float32 m_Step;
    UPROPERTY()
    FOnCommonSliderRatioChanged m_OnRatioChangedEvent;

    FVM_CommonSlider()
    {
        this.m_MinValue = 0.0f;
        this.m_MaxValue = 1.0f;
        this.m_Ratio = 0.0f;
        this.m_Step = 0.01f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommonSlider(const FVM_CommonSlider &inout Other)
    {
        this.m_MinValue = 0.0f;
        this.m_MaxValue = 1.0f;
        this.m_Ratio = 0.0f;
        this.m_Step = 0.01f;
        this.m_MinValue = Other.m_MinValue;
        this.m_MaxValue = Other.m_MaxValue;
        this.m_Ratio = Other.m_Ratio;
        this.m_Step = Other.m_Step;
        return;
    }
    FVM_CommonSlider opAssign(const FVM_CommonSlider &inout Other)
    {
        FVM_CommonSlider __r;
        this.m_MinValue = Other.m_MinValue;
        this.m_MaxValue = Other.m_MaxValue;
        this.m_Ratio = Other.m_Ratio;
        this.m_Step = Other.m_Step;
        return __r;
    }
    void SetCurrentRatio(const float32 NewRatio)
    {
        this.SetRatio(FMath::Clamp(NewRatio, this.GetMinValue(), this.GetMaxValue()));
        return;
    }
    void StepCurrentRatio(const float32 StepSign)
    {
        if (StepSign >= 0.0f)
        {
            this.SetRatio(FMath::Clamp((this.GetRatio() + this.GetStep()), this.GetMinValue(), this.GetMaxValue()));
            return;
        }
        float32 local_5 = this.GetMaxValue();
        float32 local_6 = this.GetMinValue();
        float32 local_1_2 = this.GetRatio() - this.GetStep();
        this.SetRatio(FMath::Clamp(local_1_2, local_6, local_5));
        return;
    }
    void SetCurrentStep(const float32 NewStep)
    {
        this.SetStep(NewStep);
        if (this.GetStep() <= 0.0f)
        {
            this.SetStep(0.01f);
        }
        return;
    }
    void BroadcastRatioChanged()
    {
        if (this.GetOnRatioChangedEvent().IsBound())
        {
            this.GetOnRatioChangedEvent().Broadcast(this.GetRatio());
        }
        return;
    }
    float32 GetMinValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_MinValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMinValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MinValue = __Value;
        return;
    }
    float32 GetMaxValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_MaxValue() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetMaxValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MaxValue = __Value;
        return;
    }
    const float32 GetRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_Ratio() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Ratio = __Value;
        return;
    }
    const float32 GetStep() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_Step() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetStep(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Step = __Value;
        return;
    }
    const FOnCommonSliderRatioChanged GetOnRatioChangedEvent() const property
    {
        const FOnCommonSliderRatioChanged __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FOnCommonSliderRatioChanged GetModify_OnRatioChangedEvent() property
    {
        FOnCommonSliderRatioChanged __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetOnRatioChangedEvent(const FOnCommonSliderRatioChanged &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        return;
    }
}

struct __GeneratedProperties_FVM_CommonSlider
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonSlider> Self;

    __GeneratedProperties_FVM_CommonSlider()
    {
        return;
    }
}

namespace FVM_CommonSlider
{
FVM_CommonSlider& Create(const UObject ContextObject)
{
    return FVM_CommonSlider::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommonSlider CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommonSlider __r;
    TEUIModelRef<FVM_CommonSlider> local_6 = TEUIModelRef<FVM_CommonSlider>(EUIInternal::MakeModelWithManager(Manager, FVM_CommonSlider::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
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
    local_14.PropertyName = "Ratio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Step";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonSlider>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonSlider;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__BroadcastRatioChanged";
    local_24.DirtyFlags.Set(FVM_CommonSlider::__IndexOf_Ratio());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonSlider;
}
void __BroadcastRatioChanged(FVM_CommonSlider &inout Model)
{
    Model.BroadcastRatioChanged();
    return;
}
float32 __UIGetter_MinValue(const FVM_CommonSlider &inout Model)
{
    return Model.GetMinValue();
}
float32 __UIGetter_MaxValue(const FVM_CommonSlider &inout Model)
{
    return Model.GetMaxValue();
}
float32 __UIGetter_Ratio(const FVM_CommonSlider &inout Model)
{
    return Model.GetRatio();
}
float32 __UIGetter_Step(const FVM_CommonSlider &inout Model)
{
    return Model.GetStep();
}
TEUIModelRef<FVM_CommonSlider> __UIGetter_Self(const FVM_CommonSlider &inout Model)
{
    return TEUIModelRef<FVM_CommonSlider>(Model);
}
int __IndexOf_MinValue()
{
    return 0;
}
int __IndexOf_MaxValue()
{
    return 1;
}
int __IndexOf_Ratio()
{
    return 2;
}
int __IndexOf_Step()
{
    return 3;
}
int __IndexOf_OnRatioChangedEvent()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_CommonSlider
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
