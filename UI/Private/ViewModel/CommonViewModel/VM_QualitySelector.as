
namespace FVM_QualitySelector
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetCurrentNumValue = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature IncreaseNumValue = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature DecreaseNumValue = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature BeginLongPressIncrease = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature BeginLongPressDecrease = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature EndLongPress = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature EndLongPressIncrease = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature EndLongPressDecrease = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetCurrentNumRatio = FEUIModelCallbackSignature();

}
struct FVM_QualitySelector : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonSlider> m_CommonSliderVM;
    UPROPERTY()
    int m_MinNum;
    UPROPERTY()
    int m_MaxNum;
    UPROPERTY()
    int m_CurrentNum;
    UPROPERTY()
    bool m_bIsLongPressIncrease;
    UPROPERTY()
    FLongPressHelper m_IncreaseLongPressHelper;
    UPROPERTY()
    FLongPressHelper m_DecreaseLongPressHelper;
    UPROPERTY()
    float32 m_LongPressTriggerRatio;

    FVM_QualitySelector()
    {
        this.m_bIsLongPressIncrease = false;
        this.m_MinNum = 1;
        this.m_MaxNum = 1;
        this.m_CurrentNum = 1;
        FFPTime local_6 = FFPTime(0.5);
        FFPTime local_10 = FFPTime(0.2);
        FFPTime local_6_2 = FFPTime(0.5);
        FFPTime local_10_2 = FFPTime(0.2);
        this.m_LongPressTriggerRatio = 0.05f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_QualitySelector(const FVM_QualitySelector &inout Other)
    {
        this.m_bIsLongPressIncrease = false;
        this.m_MinNum = 1;
        this.m_MaxNum = 1;
        this.m_CurrentNum = 1;
        FFPTime local_6 = FFPTime(0.5);
        FFPTime local_10 = FFPTime(0.2);
        FFPTime local_6_2 = FFPTime(0.5);
        FFPTime local_10_2 = FFPTime(0.2);
        this.m_LongPressTriggerRatio = 0.05f;
        this.m_CommonSliderVM = Other.m_CommonSliderVM;
        this.m_MinNum = int(Other.m_MinNum);
        this.m_MaxNum = int(Other.m_MaxNum);
        this.m_CurrentNum = int(Other.m_CurrentNum);
        this.m_bIsLongPressIncrease = Other.m_bIsLongPressIncrease;
        this.m_LongPressTriggerRatio = Other.m_LongPressTriggerRatio;
        return;
    }
    FVM_QualitySelector opAssign(const FVM_QualitySelector &inout Other)
    {
        FVM_QualitySelector __r;
        this.m_CommonSliderVM = Other.m_CommonSliderVM;
        this.m_MinNum = int(Other.m_MinNum);
        this.m_MaxNum = int(Other.m_MaxNum);
        this.m_CurrentNum = int(Other.m_CurrentNum);
        this.m_bIsLongPressIncrease = Other.m_bIsLongPressIncrease;
        this.m_LongPressTriggerRatio = Other.m_LongPressTriggerRatio;
        return __r;
    }
    void PostConstruct()
    {
        this.SetCommonSliderVM(TEUIModelRef<FVM_CommonSlider>(::FVM_CommonSlider::Create(this.GetContext().Manager)));
        this.GetCommonSliderVM().opArrow().GetModify_OnRatioChangedEvent().Add(this, FVM_QualitySelector::SetCurrentNumRatio);
        return;
    }
    bool CanIncreaseNum() const
    {
        return (this.GetCurrentNum() < this.GetMaxNum());
    }
    bool CanDecreaseNum() const
    {
        return (this.GetCurrentNum() > this.GetMinNum());
    }
    void UpdateCurStepSize()
    {
        float32 local_10;
        int local_2 = this.GetMaxNum() - this.GetMinNum();
        if (this.GetCommonSliderVM().IsValid())
        {
            if (local_2 > 0)
            {
                local_10 = 1.0f / local_2;
            }
            else
            {
                local_10 = 1.0f;
            }
            TEUIModelRef<FVM_CommonSlider> local_6 = this.GetCommonSliderVM();
            local_10.SetCurrentStep();
        }
        return;
    }
    void SetCurrentNumValue(const int InNum)
    {
        this.SetCurrentNum(FMath::Clamp(InNum, this.GetMinNum(), this.GetMaxNum()));
        this.UpdateCurrentNumRatio();
        return;
    }
    void IncreaseNumValue()
    {
        this.SetCurrentNumValue((this.GetCurrentNum() + 1));
        return;
    }
    void DecreaseNumValue()
    {
        this.SetCurrentNumValue((this.GetCurrentNum() - 1));
        return;
    }
    void BeginLongPressIncrease()
    {
        this.SetbIsLongPressIncrease(true);
        this.GetModify_IncreaseLongPressHelper().BeginPress(this.GetContext().Time);
        return;
    }
    void BeginLongPressDecrease()
    {
        this.SetbIsLongPressIncrease(false);
        this.GetModify_DecreaseLongPressHelper().BeginPress(this.GetContext().Time);
        return;
    }
    void EndLongPress()
    {
        this.GetModify_IncreaseLongPressHelper().Reset();
        this.GetModify_DecreaseLongPressHelper().Reset();
        return;
    }
    void EndLongPressIncrease()
    {
        this.GetModify_IncreaseLongPressHelper().Reset();
        if (this.GetDecreaseLongPressHelper().IsPressed())
        {
            this.GetModify_DecreaseLongPressHelper().SkipElapsedTo(this.GetContext().Time);
            this.SetbIsLongPressIncrease(false);
        }
        return;
    }
    void EndLongPressDecrease()
    {
        this.GetModify_DecreaseLongPressHelper().Reset();
        if (this.GetIncreaseLongPressHelper().IsPressed())
        {
            this.GetModify_IncreaseLongPressHelper().SkipElapsedTo(this.GetContext().Time);
            this.SetbIsLongPressIncrease(true);
        }
        return;
    }
    void SetCurrentNumRatio(const float32 Ratio)
    {
        this.SetCurrentNum(FMath::RoundToInt((FMath::Max(0.0f, (this.GetMaxNum() - this.GetMinNum())) * Ratio) + this.GetMinNum()));
        return;
    }
    void UpdateCurrentNumRatio()
    {
        float32 local_1 = 1.0f;
        int local_3 = this.GetMaxNum() - this.GetMinNum();
        if (local_3 > 0)
        {
            local_1 = FMath::Clamp(((this.GetCurrentNum() - this.GetMinNum()) / local_3), 0.0f, 1.0f);
        }
        if (this.GetCommonSliderVM().IsValid())
        {
            TEUIModelRef<FVM_CommonSlider> local_12 = this.GetCommonSliderVM();
            local_1.SetCurrentRatio();
        }
        return;
    }
    void OnMinMaxNumChanged()
    {
        if (this.GetMinNum() > this.GetMaxNum())
        {
            this.SetMinNum(1);
            this.SetMaxNum(1);
        }
        if (this.GetCurrentNum() < this.GetMinNum())
        {
            this.SetCurrentNum(this.GetMinNum());
        }
        else
        {
            if (this.GetCurrentNum() > this.GetMaxNum())
            {
                this.SetCurrentNum(this.GetMaxNum());
            }
        }
        this.UpdateCurrentNumRatio();
        return;
    }
    void Tick()
    {
        bool local_1 = false;
        if (this.GetbIsLongPressIncrease())
        {
            local_1 = this.GetModify_IncreaseLongPressHelper().Evaluate(this.GetContext().Time);
        }
        else
        {
            local_1 = this.GetModify_DecreaseLongPressHelper().Evaluate(this.GetContext().Time);
        }
        if (local_1)
        {
            int local_6 = this.GetbIsLongPressIncrease() ? this.GetCurrentNum() + this.GetLongPressChangeValue() : this.GetCurrentNum() - this.GetLongPressChangeValue();
            this.SetCurrentNumValue(local_6);
        }
        return;
    }
    int GetLongPressChangeValue()
    {
        return FMath::Max(1, FMath::RoundToInt((this.GetLongPressTriggerRatio() * (this.GetMaxNum() - this.GetMinNum()))));
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
    int GetMinNum() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MinNum;
    }
    void SetMinNum(const int __Value) property
    {
        if (this.m_MinNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MinNum = __Value;
        return;
    }
    int GetMaxNum() const property
    {
        this.TrackPropertyRead(2);
        return this.m_MaxNum;
    }
    void SetMaxNum(const int __Value) property
    {
        if (this.m_MaxNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MaxNum = __Value;
        return;
    }
    int GetCurrentNum() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CurrentNum;
    }
    void SetCurrentNum(const int __Value) property
    {
        if (this.m_CurrentNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentNum = __Value;
        return;
    }
    bool GetbIsLongPressIncrease() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bIsLongPressIncrease;
    }
    void SetbIsLongPressIncrease(const bool __Value) property
    {
        if (!(this.m_bIsLongPressIncrease) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bIsLongPressIncrease = __Value;
        return;
    }
    const FLongPressHelper GetIncreaseLongPressHelper() const property
    {
        const FLongPressHelper __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FLongPressHelper GetModify_IncreaseLongPressHelper() property
    {
        FLongPressHelper __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetIncreaseLongPressHelper(const FLongPressHelper &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        return;
    }
    const FLongPressHelper GetDecreaseLongPressHelper() const property
    {
        const FLongPressHelper __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FLongPressHelper GetModify_DecreaseLongPressHelper() property
    {
        FLongPressHelper __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetDecreaseLongPressHelper(const FLongPressHelper &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        return;
    }
    const float32 GetLongPressTriggerRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_LongPressTriggerRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetLongPressTriggerRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_LongPressTriggerRatio = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_QualitySelector
{
    UPROPERTY()
    bool CanIncreaseNum;
    UPROPERTY()
    bool CanDecreaseNum;
    UPROPERTY()
    TEUIModelRef<FVM_QualitySelector> Self;


}

namespace FVM_QualitySelector
{
FVM_QualitySelector& Create(const UObject ContextObject)
{
    return FVM_QualitySelector::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_QualitySelector CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_QualitySelector __r;
    TEUIModelRef<FVM_QualitySelector> local_6 = TEUIModelRef<FVM_QualitySelector>(EUIInternal::MakeModelWithManager(Manager, FVM_QualitySelector::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CommonSliderVM";
    local_14.TypeName = "TEUIModelRef<FVM_CommonSlider>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MinNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MaxNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanIncreaseNum";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanDecreaseNum";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_QualitySelector>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_QualitySelector;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "UpdateCurStepSize";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "UpdateCurrentNumRatio";
    Result.EffectFunctions.Add(local_20);
    FEUIModelDirtyDefine local_28;
    local_28.FunctionName = "__OnMinMaxNumChanged";
    local_28.DirtyFlags.Set(FVM_QualitySelector::__IndexOf_MinNum());
    local_28.DirtyFlags.Set(FVM_QualitySelector::__IndexOf_MaxNum());
    Result.DirtyFunctions.Add(local_28);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_QualitySelector;
}
void __OnMinMaxNumChanged(FVM_QualitySelector &inout Model)
{
    Model.OnMinMaxNumChanged();
    return;
}
void __Tick(FVM_QualitySelector &inout Model)
{
    Model.Tick();
    return;
}
TEUIModelRef<FVM_CommonSlider> __UIGetter_CommonSliderVM(const FVM_QualitySelector &inout Model)
{
    return Model.GetCommonSliderVM();
}
int __UIGetter_MinNum(const FVM_QualitySelector &inout Model)
{
    return Model.GetMinNum();
}
int __UIGetter_MaxNum(const FVM_QualitySelector &inout Model)
{
    return Model.GetMaxNum();
}
int __UIGetter_CurrentNum(const FVM_QualitySelector &inout Model)
{
    return Model.GetCurrentNum();
}
bool __UIGetter_CanIncreaseNum(const FVM_QualitySelector &inout Model)
{
    return Model.CanIncreaseNum();
}
bool __UIGetter_CanDecreaseNum(const FVM_QualitySelector &inout Model)
{
    return Model.CanDecreaseNum();
}
TEUIModelRef<FVM_QualitySelector> __UIGetter_Self(const FVM_QualitySelector &inout Model)
{
    return TEUIModelRef<FVM_QualitySelector>(Model);
}
int __IndexOf_CommonSliderVM()
{
    return 0;
}
int __IndexOf_MinNum()
{
    return 1;
}
int __IndexOf_MaxNum()
{
    return 2;
}
int __IndexOf_CurrentNum()
{
    return 3;
}
int __IndexOf_bIsLongPressIncrease()
{
    return 4;
}
int __IndexOf_IncreaseLongPressHelper()
{
    return 5;
}
int __IndexOf_DecreaseLongPressHelper()
{
    return 6;
}
int __IndexOf_LongPressTriggerRatio()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_QualitySelector
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
