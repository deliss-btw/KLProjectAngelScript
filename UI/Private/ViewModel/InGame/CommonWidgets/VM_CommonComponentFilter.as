
namespace FVM_CommonComponentFilter
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnFilterButtonClicked = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSubPageClosed = FEUIModelCallbackSignature();

}
struct FVM_CommonComponentFilterConfig
{
    UPROPERTY()
    FText CustomOperationName;
    UPROPERTY()
    FGameplayTag SubPageTag;

    FVM_CommonComponentFilterConfig()
    {
        return;
    }
    FVM_CommonComponentFilterConfig(const FText &inout _CustomOperationName, const FGameplayTag &inout _SubPageTag)
    {
        this.SubPageTag = _SubPageTag;
        return;
    }
}

struct FVM_CommonComponentFilter : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonActionEntry> m_CommonActionEntryVM;
    UPROPERTY()
    FVM_CommonComponentFilterConfig m_Config;
    UPROPERTY()
    FOnCommonComponentFilterSelected m_OnComponentFilterSelected;
    UPROPERTY()
    FEUIWidgetRef SubPageHandle;
    UPROPERTY()
    float32 PrevValue;

    FVM_CommonComponentFilter()
    {
        this.PrevValue = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonComponentFilter' by default constructor.");
        return;
    }
    FVM_CommonComponentFilter(const FVM_CommonComponentFilter &inout Other)
    {
        this.PrevValue = 0.0f;
        this.m_CommonActionEntryVM = Other.m_CommonActionEntryVM;
        return;
    }
    FVM_CommonComponentFilter(const FVM_CommonComponentFilterConfig &inout InConfig, const FOnCommonComponentFilterSelected &inout InOnComponentFilterSelected)
    {
        this.PrevValue = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetConfig(InConfig);
        this.SetOnComponentFilterSelected(InOnComponentFilterSelected);
        return;
    }
    FVM_CommonComponentFilter& opAssign(const FVM_CommonComponentFilter &inout Other)
    {
        return Other.m_CommonActionEntryVM;
    }
    void PostConstruct()
    {
        this.SetCommonActionEntryVM(TEUIModelRef<FVM_CommonActionEntry>(::FVM_CommonActionEntry::Create(this.GetContext().Manager)));
        TEUIModelRef<FVM_CommonActionEntry> local_2 = this.GetCommonActionEntryVM();
        this.GetConfig().CustomOperationName.Setup();
        FSimpleModelEvent local_24;
        local_24.Add(this, FVM_CommonComponentFilter::OnFilterButtonClicked);
        TEUIModelRef<FVM_CommonActionEntry> local_2_2 = this.GetCommonActionEntryVM();
        return;
    }
    void OnFilterButtonClicked()
    {
        int local_10 = 0;
        if (this.SubPageHandle.IsValid())
        {
            FEUIWidget::RemoveWidget(this.SubPageHandle);
        }
        this.SubPageHandle = FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, this.GetConfig().SubPageTag);
        FEUIWidgetRef::GetViewModel<FVM_GammaSlider> local_8 = FEUIWidgetRef::GetViewModel<FVM_GammaSlider>(this.SubPageHandle);
        local_10.SetbNotLoginPage(true);
        local_10.GetOnGammaSliderClosedEvent().Add(this, FVM_CommonComponentFilter::OnSubPageClosed);
        return;
    }
    void OnSubPageClosed()
    {
        this.GetOnComponentFilterSelected().Broadcast(0.0f);
        return;
    }
    TEUIModelRef<FVM_CommonActionEntry> GetCommonActionEntryVM() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommonActionEntryVM;
    }
    void SetCommonActionEntryVM(const TEUIModelRef<FVM_CommonActionEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonActionEntry> local_2;
        local_2 = this.m_CommonActionEntryVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommonActionEntryVM = __Value;
        return;
    }
    FVM_CommonComponentFilterConfig GetConfig() const property
    {
        FVM_CommonComponentFilterConfig __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FVM_CommonComponentFilterConfig GetModify_Config() property
    {
        FVM_CommonComponentFilterConfig __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetConfig(const FVM_CommonComponentFilterConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const FOnCommonComponentFilterSelected GetOnComponentFilterSelected() const property
    {
        const FOnCommonComponentFilterSelected __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FOnCommonComponentFilterSelected GetModify_OnComponentFilterSelected() property
    {
        FOnCommonComponentFilterSelected __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOnComponentFilterSelected(const FOnCommonComponentFilterSelected &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
}

struct __GeneratedProperties_FVM_CommonComponentFilter
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonComponentFilter> Self;

    __GeneratedProperties_FVM_CommonComponentFilter()
    {
        return;
    }
}

namespace FVM_CommonComponentFilter
{
FVM_CommonComponentFilter& Create(const UObject ContextObject, const FVM_CommonComponentFilterConfig &inout Config, const FOnCommonComponentFilterSelected &inout OnComponentFilterSelected)
{
    return FVM_CommonComponentFilter::CreateByManager(EUIInternal::GetContextManager(ContextObject), Config, OnComponentFilterSelected);
}
FVM_CommonComponentFilter CreateByManager(const UEUIManagerSubsystem Manager, const FVM_CommonComponentFilterConfig &inout Config, const FOnCommonComponentFilterSelected &inout OnComponentFilterSelected)
{
    FVM_CommonComponentFilter __r;
    TEUIModelRef<FVM_CommonComponentFilter> local_6 = TEUIModelRef<FVM_CommonComponentFilter>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonComponentFilter::ModelId, 0, Config, OnComponentFilterSelected));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CommonActionEntryVM";
    local_14.TypeName = "TEUIModelRef<FVM_CommonActionEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonComponentFilter>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonComponentFilter;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonComponentFilter;
}
TEUIModelRef<FVM_CommonActionEntry> __UIGetter_CommonActionEntryVM(const FVM_CommonComponentFilter &inout Model)
{
    return Model.GetCommonActionEntryVM();
}
TEUIModelRef<FVM_CommonComponentFilter> __UIGetter_Self(const FVM_CommonComponentFilter &inout Model)
{
    return TEUIModelRef<FVM_CommonComponentFilter>(Model);
}
int __IndexOf_CommonActionEntryVM()
{
    return 0;
}
int __IndexOf_Config()
{
    return 1;
}
int __IndexOf_OnComponentFilterSelected()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CommonComponentFilter
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
