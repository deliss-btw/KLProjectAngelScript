
namespace FVM_CommonHoverProvider
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature NotifyMouseEnter = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature NotifyMouseLeave = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature NotifyGamepadFocusReceive = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature NotifyGamepadFocusLoss = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature NotifyClick = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature PinCurrentHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature PinOrOpenPinnedPassThrough = FEUIModelCallbackSignature();

}
struct FVM_CommonHoverProvider : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIModelContainer m_HoverModels;
    UPROPERTY()
    FCommonHoverHandle m_HoverHandle;
    UPROPERTY()
    FCommonHoverHandle m_ParentHoverHandle;
    UPROPERTY()
    TWeakObjectPtr<UWidget> m_HoverForWidgetRef;
    UPROPERTY()
    bool m_bResponsibleForClick;
    UPROPERTY()
    bool m_bFocusHover;
    UPROPERTY()
    bool m_bClickForExecute;
    UPROPERTY()
    FGameplayTag m_SubPageTag;
    UPROPERTY()
    FEUIWidgetRef SubPageHandle;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> m_HoverWidgetClass;
    UPROPERTY()
    ECommonHoverLayout m_HoverLayout;
    UPROPERTY()
    bool m_bIsForbidHover;
    UPROPERTY()
    bool m_bClickOpenPinnedPassThrough;

    FVM_CommonHoverProvider()
    {
        this.m_bResponsibleForClick = true;
        this.m_bFocusHover = true;
        this.m_bClickForExecute = false;
        this.m_HoverLayout = ECommonHoverLayout(0);
        this.m_bIsForbidHover = false;
        this.m_bClickOpenPinnedPassThrough = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommonHoverProvider(const FVM_CommonHoverProvider &inout Other)
    {
        this.m_bResponsibleForClick = true;
        this.m_bFocusHover = true;
        this.m_bClickForExecute = false;
        this.m_HoverLayout = ECommonHoverLayout(0);
        this.m_bIsForbidHover = false;
        this.m_bClickOpenPinnedPassThrough = false;
        this.m_HoverModels = Other.m_HoverModels;
        this.m_HoverForWidgetRef = Other.m_HoverForWidgetRef;
        this.m_bResponsibleForClick = Other.m_bResponsibleForClick;
        this.m_bFocusHover = Other.m_bFocusHover;
        this.m_bClickForExecute = Other.m_bClickForExecute;
        this.m_SubPageTag = Other.m_SubPageTag;
        this.m_HoverWidgetClass = Other.m_HoverWidgetClass;
        this.m_HoverLayout = Other.m_HoverLayout;
        this.m_bIsForbidHover = Other.m_bIsForbidHover;
        this.m_bClickOpenPinnedPassThrough = Other.m_bClickOpenPinnedPassThrough;
        return;
    }
    FVM_CommonHoverProvider opAssign(const FVM_CommonHoverProvider &inout Other)
    {
        FVM_CommonHoverProvider __r;
        this.m_HoverModels = Other.m_HoverModels;
        this.m_HoverForWidgetRef = Other.m_HoverForWidgetRef;
        this.m_bResponsibleForClick = Other.m_bResponsibleForClick;
        this.m_bFocusHover = Other.m_bFocusHover;
        this.m_bClickForExecute = Other.m_bClickForExecute;
        this.m_SubPageTag = Other.m_SubPageTag;
        this.m_HoverWidgetClass = Other.m_HoverWidgetClass;
        this.m_HoverLayout = Other.m_HoverLayout;
        this.m_bIsForbidHover = Other.m_bIsForbidHover;
        this.m_bClickOpenPinnedPassThrough = Other.m_bClickOpenPinnedPassThrough;
        return __r;
    }
    void LoadConfig(const FConfigVM_CommonHoverProvider &inout InConfig)
    {
        this.SetbFocusHover(InConfig.bFocusHover);
        this.SetbClickForExecute(InConfig.bClickForExecute);
        this.SetSubPageTag(InConfig.SubPageTag);
        this.SetHoverLayout(InConfig.HoverLayout);
        this.SetbIsForbidHover(InConfig.bIsForbidHover);
        this.SetbClickOpenPinnedPassThrough(InConfig.bClickOpenPinnedPassThrough);
        this.SetbResponsibleForClick(InConfig.bResponsibleForClick);
        return;
    }
    void NotifyMouseEnter()
    {
        if (this.GetbIsForbidHover())
        {
            return;
        }
        if (this.GetHoverModels().IsEmpty())
        {
            return;
        }
        UWidget local_4 = this.GetHoverForWidget();
        if (!(IsValid(local_4)))
        {
            return;
        }
        if (this.HasDisplayedHover())
        {
            ::CommonPopup::SetHover(this.GetHoverHandle(), this.GetHoverModels(), this.GetManager());
            ::CommonPopup::SetHover(this.GetHoverHandle(), local_4, this.GetManager());
            return;
        }
        if (!(this.CloseExistingHover(ECommonHoverCloseReason(0))))
        {
            return;
        }
        this.SetHoverHandle(this.OpenHoverForProvider(local_4, this.ResolveParentHoverHandle(), false, false, this.GetbFocusHover()));
        return;
    }
    void NotifyMouseLeave()
    {
        this.CloseExistingHover(ECommonHoverCloseReason(0));
        return;
    }
    void NotifyGamepadFocusReceive()
    {
        if (this.GetbIsForbidHover() || this.GetHoverModels().IsEmpty())
        {
            return;
        }
        UWidget local_4 = this.GetHoverForWidget();
        if (!(IsValid(local_4)))
        {
            return;
        }
        bool local_2 = this.ShouldPreparePinnedPassThroughOnGamepadFocus();
        if (this.HasDisplayedHover())
        {
            ::CommonPopup::SetHover(this.GetHoverHandle(), this.GetHoverModels(), this.GetManager());
            ::CommonPopup::SetHover(this.GetHoverHandle(), local_4, this.GetManager());
            if (local_2)
            {
                ::CommonPopup::PinHoverPassThrough(this.GetHoverHandle(), this.GetManager());
            }
            return;
        }
        if (!(this.CloseExistingHover(ECommonHoverCloseReason(1))))
        {
            return;
        }
        FCommonHoverHandle local_16 = this.ResolveParentHoverHandle();
        this.SetHoverHandle(this.OpenHoverForProvider(local_4, local_16, false, local_2, false));
        return;
    }
    void NotifyGamepadFocusLoss()
    {
        this.CloseExistingHover(ECommonHoverCloseReason(1));
        return;
    }
    void SetSubPageConfig(const FGameplayTag &inout _SubPageTag)
    {
        this.SetSubPageTag(_SubPageTag);
        return;
    }
    bool ShouldPreparePinnedPassThroughOnGamepadFocus() const
    {
        return this.GetbClickOpenPinnedPassThrough() && this.ResolveParentHoverHandle().IsValid();
    }
    void NotifyClick()
    {
        if (this.GetbIsForbidHover())
        {
            return;
        }
        if (this.GetbClickForExecute() && this.GetSubPageTag().IsValid())
        {
            if (this.SubPageHandle.IsValid())
            {
                FEUIWidget::RemoveWidget(this.SubPageHandle);
            }
            this.SubPageHandle = FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, this.GetSubPageTag());
            return;
        }
        if (this.GetHoverModels().IsEmpty())
        {
            return;
        }
        UWidget local_6 = this.GetHoverForWidget();
        if (!(IsValid(local_6)))
        {
            return;
        }
        if (this.GetbClickOpenPinnedPassThrough())
        {
            this.PinOrOpenPinnedPassThrough();
            return;
        }
        this.OpenHoverForProvider(local_6, this.ResolveParentHoverHandle(), true, false, this.GetbFocusHover());
        return;
    }
    void PinCurrentHover()
    {
        if (!(this.HasDisplayedHover()))
        {
            return;
        }
        ::CommonPopup::PinHoverPassThrough(this.GetHoverHandle(), this.GetManager());
        return;
    }
    void PinOrOpenPinnedPassThrough()
    {
        UWidget local_6;
        if (this.HasDisplayedHover())
        {
            ::CommonPopup::SetHover(this.GetHoverHandle(), this.GetHoverModels(), this.GetManager());
            local_6 = this.GetHoverForWidget();
            if (IsValid(local_6))
            {
                ::CommonPopup::SetHover(this.GetHoverHandle(), local_6, this.GetManager());
            }
            ::CommonPopup::PinHoverPassThrough(this.GetHoverHandle(), this.GetManager());
            return;
        }
        if (this.GetbIsForbidHover() || this.GetHoverModels().IsEmpty())
        {
            return;
        }
        local_6 = this.GetHoverForWidget();
        if (!(IsValid(local_6)))
        {
            return;
        }
        FCommonHoverHandle local_14 = this.ResolveParentHoverHandle();
        this.SetHoverHandle(this.OpenHoverForProvider(local_6, local_14, false, true, false));
        return;
    }
    void BeginDestroy()
    {
        this.CloseExistingHover(ECommonHoverCloseReason(3));
        if (this.SubPageHandle.IsValid())
        {
            FEUIWidget::RemoveWidget(this.SubPageHandle);
        }
        return;
    }
    void SetHoverForWidget(const UWidget InHoverForWidget)
    {
        this.SetHoverForWidgetRef(TWeakObjectPtr<UWidget>(InHoverForWidget));
        return;
    }
    void RefreshHoverModel()
    {
        if (this.HasDisplayedHover())
        {
            ::CommonPopup::SetHover(this.GetHoverHandle(), this.GetHoverModels(), this.GetManager());
            return;
        }
        return;
    }
    bool IsHoverDisplayed()
    {
        return this.HasDisplayedHover();
    }
    UWidget GetDisplayedHoverWidget() const
    {
        if (!(this.GetHoverHandle().IsValid()) || !(::CommonPopup::IsHoverDisplayed(this.GetHoverHandle(), this.GetManager())))
        {
            return nullptr;
        }
        UEUIUserWidget local_10 = this.GetHoverHandle().WidgetRef.GetUserWidget();
        return local_10;
    }
    UWidget GetHoverForWidget() const
    {
        TWeakObjectPtr<UWidget> local_2 = this.GetHoverForWidgetRef();
        UWidget local_4;
        return local_4;
    }
    bool CloseExistingHover(const ECommonHoverCloseReason Reason)
    {
        if (!(this.GetHoverHandle().IsValid()))
        {
            return true;
        }
        if (!(::CommonPopup::IsHoverDisplayed(this.GetHoverHandle(), this.GetManager())))
        {
            this.SetHoverHandle(FCommonHoverHandle::InvalidHandle);
            return true;
        }
        FMS_CommonHoverManager& local_6 = ::FMS_CommonHoverManager::Get(this.GetManager());
        if (local_6)
        {
            if (local_6.ShouldKeepHoverForCloseReason(this.GetHoverHandle()))
            {
                return false;
            }
        }
        ::CommonPopup::CloseHover(this.GetHoverHandle(), this.GetManager(), false);
        this.SetHoverHandle(FCommonHoverHandle::InvalidHandle);
        return true;
    }
    bool HasDisplayedHover()
    {
        if (!(this.GetHoverHandle().IsValid()))
        {
            return false;
        }
        if (::CommonPopup::IsHoverDisplayed(this.GetHoverHandle(), this.GetManager()))
        {
            return true;
        }
        this.SetHoverHandle(FCommonHoverHandle::InvalidHandle);
        return false;
    }
    FCommonHoverHandle OpenHoverForProvider(const UWidget TargetHoverForWidget, const FCommonHoverHandle &inout ResolvedParentHoverHandle, const bool bClickClose, const bool bPinnedPassThrough, const bool bAllowFocusHover)
    {
        FCommonHoverHandle __r;
        FCommonHoverInfo local_62 = ::FCommonHoverInfo::MakeForWidget(TargetHoverForWidget, this.GetHoverWidgetClass(), this.GetHoverModels());
        if (!(!(!(local_62))))
        {
        }
        else
        {
            int local_117 = int(FEUIWidget::GetWidgetLayoutLayer(TargetHoverForWidget));
            this.GetOwnerWidget();
            int local_119 = int(this.GetHoverLayout());
            local_62.SetFocusHover(bAllowFocusHover && this.GetbFocusHover()).SetHoverLayout().SetTargetLayer().SetParentHoverHandle().SetCloseScopeInsideWidget();
            if (bPinnedPassThrough)
            {
                local_62.SetOutsideCloseMode(ECommonHoverOutsideCloseMode(2)).SetPinned(true);
            }
            else
            {
                local_62.SetClickClose(bClickClose);
            }
            ::CommonPopup::HoverWithCustomHoverInfo(TargetHoverForWidget, local_62);
        }
        return __r;
    }
    FCommonHoverHandle ResolveParentHoverHandle() const
    {
        FCommonHoverHandle __r;
        if (this.GetParentHoverHandle().IsValid())
        {
        }
        else
        {
            FEUIWidgetRef local_6 = this.GetOwnerWidget();
            if (FEUIWidgetRef::GetViewModel(local_6).opCall(NAME_None))
            {
            }
            else
            {
                FEUIWidgetRef::GetViewModel local_16;
                if (local_16.opCall(NAME_None))
                {
                }
                else
                {
                    FEUIWidgetRef local_4 = local_6.GetRoot();
                    if (FEUIWidgetRef::GetViewModel(local_4).opCall(NAME_None))
                    {
                    }
                    else
                    {
                        if (local_16.opCall(NAME_None))
                        {
                        }
                        else
                        {
                        }
                    }
                }
            }
        }
        return __r;
    }
    void ResetHoverModel(const FEUIModelRef &inout Model)
    {
        if (this.GetbIsForbidHover())
        {
            return;
        }
        if (Model.IsValid())
        {
            this.GetModify_HoverModels().AddModel(Model, false);
        }
        return;
    }
    void SetHoverPosition(const ECommonHoverLayout TargetHoverLayout)
    {
        if ((int(this.GetHoverLayout())) != (int(TargetHoverLayout)))
        {
            this.SetHoverLayout(ECommonHoverLayout(TargetHoverLayout));
        }
        return;
    }
    FEUIModelContainer GetHoverModels() const property
    {
        FEUIModelContainer __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelContainer GetModify_HoverModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetHoverModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_HoverModels = __Value;
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
    const FCommonHoverHandle GetParentHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FCommonHoverHandle GetModify_ParentHoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetParentHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    TWeakObjectPtr<UWidget> GetHoverForWidgetRef() const property
    {
        this.TrackPropertyRead(3);
        return this.m_HoverForWidgetRef;
    }
    void SetHoverForWidgetRef(const TWeakObjectPtr<UWidget> &inout __Value) property
    {
        if ((this.m_HoverForWidgetRef == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_HoverForWidgetRef = __Value;
        return;
    }
    bool GetbResponsibleForClick() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bResponsibleForClick;
    }
    void SetbResponsibleForClick(const bool __Value) property
    {
        if (!(this.m_bResponsibleForClick) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bResponsibleForClick = __Value;
        return;
    }
    bool GetbFocusHover() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bFocusHover;
    }
    void SetbFocusHover(const bool __Value) property
    {
        if (!(this.m_bFocusHover) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bFocusHover = __Value;
        return;
    }
    bool GetbClickForExecute() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bClickForExecute;
    }
    void SetbClickForExecute(const bool __Value) property
    {
        if (!(this.m_bClickForExecute) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bClickForExecute = __Value;
        return;
    }
    const FGameplayTag GetSubPageTag() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FGameplayTag GetModify_SubPageTag() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetSubPageTag(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_SubPageTag = __Value;
        return;
    }
    TSoftClassPtr<UUserWidget> GetHoverWidgetClass() const property
    {
        this.TrackPropertyRead(8);
        return this.m_HoverWidgetClass;
    }
    void SetHoverWidgetClass(const TSoftClassPtr<UUserWidget> &inout __Value) property
    {
        if ((this.m_HoverWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_HoverWidgetClass = __Value;
        return;
    }
    ECommonHoverLayout GetHoverLayout() const property
    {
        this.TrackPropertyRead(9);
        return this.m_HoverLayout;
    }
    void SetHoverLayout(const ECommonHoverLayout __Value) property
    {
        if (int(this.m_HoverLayout) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_HoverLayout = __Value;
        return;
    }
    bool GetbIsForbidHover() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bIsForbidHover;
    }
    void SetbIsForbidHover(const bool __Value) property
    {
        if (!(this.m_bIsForbidHover) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bIsForbidHover = __Value;
        return;
    }
    bool GetbClickOpenPinnedPassThrough() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bClickOpenPinnedPassThrough;
    }
    void SetbClickOpenPinnedPassThrough(const bool __Value) property
    {
        if (!(this.m_bClickOpenPinnedPassThrough) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bClickOpenPinnedPassThrough = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonHoverProvider
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonHoverProvider> Self;

    __GeneratedProperties_FVM_CommonHoverProvider()
    {
        return;
    }
}

namespace FVM_CommonHoverProvider
{
FVM_CommonHoverProvider& Create(const UObject ContextObject)
{
    return FVM_CommonHoverProvider::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommonHoverProvider CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommonHoverProvider __r;
    TEUIModelRef<FVM_CommonHoverProvider> local_6 = TEUIModelRef<FVM_CommonHoverProvider>(EUIInternal::MakeModelWithManager(Manager, FVM_CommonHoverProvider::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonHoverProvider>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonHoverProvider;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshHoverModel";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonHoverProvider;
}
TEUIModelRef<FVM_CommonHoverProvider> __UIGetter_Self(const FVM_CommonHoverProvider &inout Model)
{
    return TEUIModelRef<FVM_CommonHoverProvider>(Model);
}
int __IndexOf_HoverModels()
{
    return 0;
}
int __IndexOf_HoverHandle()
{
    return 1;
}
int __IndexOf_ParentHoverHandle()
{
    return 2;
}
int __IndexOf_HoverForWidgetRef()
{
    return 3;
}
int __IndexOf_bResponsibleForClick()
{
    return 4;
}
int __IndexOf_bFocusHover()
{
    return 5;
}
int __IndexOf_bClickForExecute()
{
    return 6;
}
int __IndexOf_SubPageTag()
{
    return 7;
}
int __IndexOf_HoverWidgetClass()
{
    return 8;
}
int __IndexOf_HoverLayout()
{
    return 9;
}
int __IndexOf_bIsForbidHover()
{
    return 10;
}
int __IndexOf_bClickOpenPinnedPassThrough()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_CommonHoverProvider
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
