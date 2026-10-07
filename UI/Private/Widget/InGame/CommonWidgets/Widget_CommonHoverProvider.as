
namespace UWidget_CommonHoverProvider
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonHoverProvider : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonHoverProvider> HoverProvider;
    UPROPERTY()
    FEUIModelContainer HoverModels;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> HoverWidgetClass;
    UPROPERTY()
    FCommonHoverHandle ParentHoverHandle;
    UPROPERTY()
    bool bHoverAsClick = false;
    FOnButtonClickedEvent OnClickIntent;
    FOnButtonClickedEvent OnHoverIntent;
    bool bJustHover = false;
    bool bClickIntentConsumed = false;
    TWeakObjectPtr<UWidget> HoverForWidgetOverride;
    bool bHoverProviderChainNavigationBound = false;
    UPROPERTY()
    FConfigVM_CommonHoverProvider HoverProviderConfig;
    UPROPERTY()
    FGetEUIModelRef HoverProviderDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        FVM_CommonHoverProvider local_2;
        local_2.SetHoverForWidget(this.GetResolvedHoverForWidget());
        local_2.SetHoverWidgetClass(this.HoverWidgetClass);
        local_2.SetHoverModels(this.HoverModels);
        local_2.SetParentHoverHandle(this.ParentHoverHandle);
        this.RefreshProviderHoverChainNavigation();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.HoverProvider.IsValid())
        {
            this.HoverModels.SetHoverModels();
            this.ParentHoverHandle.SetParentHoverHandle();
            this.GetResolvedHoverForWidget().SetHoverForWidget();
            this.RefreshProviderHoverChainNavigation();
        }
        return;
    }
    UFUNCTION()
    void OnMouseEnter_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        if (MouseEvent.IsTouchEvent())
        {
            this.bJustHover = true;
            return;
        }
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1)
        {
            return;
        }
        if (this.bHoverAsClick)
        {
            this.HoverProvider_NotifyClick();
            return;
        }
        this.OnHoverIntent.Broadcast();
        this.HoverProvider_NotifyMouseEnter();
        return;
    }
    UFUNCTION()
    void OnMouseLeave_Implementation(const FPointerEvent &inout MouseEvent)
    {
        if (MouseEvent.IsTouchEvent())
        {
            return;
        }
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1)
        {
            return;
        }
        this.bJustHover = false;
        this.HoverProvider_NotifyMouseLeave();
        return;
    }
    UFUNCTION()
    void OnAddedToFocusPath_Implementation(const FFocusEvent &inout InFocusEvent)
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1)
        {
            this.OnHoverIntent.Broadcast();
            this.HoverProvider_NotifyGamepadFocusReceive();
            this.RefreshProviderHoverChainNavigation();
        }
        return;
    }
    UFUNCTION()
    void OnRemovedFromFocusPath_Implementation(const FFocusEvent &inout InFocusEvent)
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1)
        {
            this.HoverProvider_NotifyGamepadFocusLoss();
            this.RefreshProviderHoverChainNavigation();
        }
        return;
    }
    UFUNCTION()
    FEventReply OnMouseButtonDown_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        if (!(this.bJustHover) && MouseEvent.IsTouchEvent())
        {
            this.bJustHover = true;
            return FEventReply::Handled();
        }
        if (!(GetbResponsibleForClick()))
        {
            return FEventReply::Unhandled();
        }
        if (this.BroadcastClickIntent())
        {
            return FEventReply::Handled();
        }
        if (GetbClickForExecute() && (MouseEvent.GetEffectingButton() == EKeys::RightMouseButton))
        {
            return FEventReply::Unhandled();
        }
        if (GetbClickForExecute())
        {
            this.HoverProvider_NotifyMouseLeave();
        }
        this.bJustHover = false;
        this.HoverProvider_NotifyClick();
        return FEventReply::Handled();
    }
    UFUNCTION()
    FEventReply OnMouseButtonDoubleClick_Implementation(const FGeometry &inout InMyGeometry, const FPointerEvent &inout InMouseEvent)
    {
        if (!(this.bJustHover) && InMouseEvent.IsTouchEvent())
        {
            this.bJustHover = true;
            return FEventReply::Handled();
        }
        if (!(GetbResponsibleForClick()))
        {
            return FEventReply::Unhandled();
        }
        if (this.BroadcastClickIntent())
        {
            return FEventReply::Handled();
        }
        if (GetbClickForExecute() && (InMouseEvent.GetEffectingButton() == EKeys::RightMouseButton))
        {
            return FEventReply::Unhandled();
        }
        if (GetbClickForExecute())
        {
            this.HoverProvider_NotifyMouseLeave();
        }
        this.HoverProvider_NotifyClick();
        return FEventReply::Handled();
    }
    UFUNCTION()
    void NotifyGamepadFocusReceiveFromOwner()
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) != 1)
        {
            return;
        }
        this.OnHoverIntent.Broadcast();
        this.HoverProvider_NotifyGamepadFocusReceive();
        this.RefreshProviderHoverChainNavigation();
        return;
    }
    UFUNCTION()
    void NotifyGamepadFocusLossFromOwner()
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1)
        {
            this.HoverProvider_NotifyGamepadFocusLoss();
            this.RefreshProviderHoverChainNavigation();
        }
        return;
    }
    UFUNCTION()
    void ConsumeClickIntent()
    {
        this.bClickIntentConsumed = true;
        return;
    }
    UFUNCTION()
    void OpenByClick()
    {
        if (!(this.HoverProvider.IsValid()) || !(GetbResponsibleForClick()))
        {
            return;
        }
        this.HoverProvider_NotifyClick();
        return;
    }
    UFUNCTION()
    void PinOrOpenPinnedPassThrough()
    {
        if (!(this.HoverProvider.IsValid()))
        {
            return;
        }
        PinOrOpenPinnedPassThrough();
        return;
    }
    UFUNCTION()
    void SetHoverModels(const FEUIModelContainer &inout InHoverModels)
    {
        this.HoverModels = InHoverModels;
        if (this.HoverProvider.IsValid())
        {
            this.HoverModels.SetHoverModels();
            this.RefreshProviderHoverChainNavigation();
        }
        return;
    }
    UFUNCTION()
    bool IsHoverDisplayed()
    {
        return this.HoverProvider.IsValid() && IsHoverDisplayed();
    }
    UFUNCTION()
    void SetHoverForWidgetOverride(const UWidget InHoverForWidget)
    {
        this.HoverForWidgetOverride = InHoverForWidget;
        if (this.HoverProvider.IsValid())
        {
            this.GetResolvedHoverForWidget().SetHoverForWidget();
            this.RefreshProviderHoverChainNavigation();
        }
        return;
    }
    UFUNCTION()
    UWidget ResolveProviderHoverChainNextNavigationTarget(const EUINavigation InNavigation)
    {
        if (int(InNavigation) != 4 || !(this.HoverProvider.IsValid()))
        {
            return nullptr;
        }
        return GetDisplayedHoverWidget();
    }
    void RefreshProviderHoverChainNavigation()
    {
        bool local_2 = this.HoverProvider.IsValid() && IsValid(GetDisplayedHoverWidget());
        bool local_5 = !(this.bHoverProviderChainNavigationBound);
        if (!(local_2) == local_5)
        {
            return;
        }
        this.bHoverProviderChainNavigationBound = local_2;
        if (this.bHoverProviderChainNavigationBound)
        {
            this.SetNavigationRuleCustomWithActionDisplay(EUINavigation(4), FCustomWidgetNavigationDelegate(this, n"ResolveProviderHoverChainNextNavigationTarget"), EEUIActionDisplay(0), EEUIActionDisplaySlot(0), false);
            return;
        }
        this.ClearNavigationRuleCustomWithActionDisplay(EUINavigation(4));
        return;
    }
    bool BroadcastClickIntent()
    {
        this.bClickIntentConsumed = false;
        this.OnClickIntent.Broadcast();
        return this.bClickIntentConsumed;
    }
    UWidget GetResolvedHoverForWidget()
    {
        UWidget local_2;
        UWidget local_4;
        if (IsValid(local_2))
        {
            local_4 = local_2;
        }
        else
        {
        }
        return local_4;
    }
    UFUNCTION()
    void HoverProvider_NotifyMouseEnter() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_NotifyMouseLeave() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_NotifyGamepadFocusReceive() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_NotifyGamepadFocusLoss() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_NotifyClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_PinCurrentHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void HoverProvider_PinOrOpenPinnedPassThrough() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.HoverProvider.Initialize(this, FName("VM_CommonHoverProvider"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.HoverProviderDelegate.IsBound())
        {
            this.HoverProvider.SetRef(this.HoverProviderDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonHoverProvider
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
