namespace UWidget_CommonItemBar
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonItemBar : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonItemBar> ItemBar;
    UPROPERTY()
    UWidget_CommonHoverProvider HoverProvider;
    UWidget_ItemTooltip FixedTooltip;
    UPROPERTY()
    FEUIModelContainer ExternalTipModels;
    UPROPERTY()
    FConfigVM_CommonItemBar ItemBarConfig;
    UPROPERTY()
    FGetEUIModelRef ItemBarDelegate;

    UWidget_CommonItemBar()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.HoverProvider != nullptr)
        {
            this.ItemBar.Get().SetHoverProvider(TEUIModelWeakRef<FVM_CommonHoverProvider>(this.HoverProvider.HoverProvider.Get()));
            this.ApplyConfiguredSharedHoverAnchor();
        }
        if (this.FixedTooltip != nullptr)
        {
            this.ItemBar.Get().SetHasFixedTooltip(true);
        }
        if (!(this.ExternalTipModels.IsEmpty()))
        {
            this.ItemBar.Get().ApplyExternalTipModels(this.ExternalTipModels);
        }
        this.ItemBar.Get().SyncClickLockSetting();
        return;
    }
    UFUNCTION()
    void OnMouseEnter_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        if (MouseEvent.IsTouchEvent())
        {
            return;
        }
        if (this.ItemBar.Get().HasExternalTipTarget())
        {
            this.ItemBar.Get().NotifyExternalHoverEnter();
            return;
        }
        if (this.FixedTooltip != nullptr)
        {
            this.ShowFixedTooltip();
        }
        return;
    }
    UFUNCTION()
    void OnMouseLeave_Implementation(const FPointerEvent &inout MouseEvent)
    {
        if (MouseEvent.IsTouchEvent())
        {
            return;
        }
        if (this.ItemBar.Get().HasExternalTipTarget())
        {
            this.ItemBar.Get().NotifyExternalHoverLeave();
            return;
        }
        if (this.FixedTooltip != nullptr)
        {
            this.HideFixedTooltip();
        }
        return;
    }
    UFUNCTION()
    FEventReply OnMouseButtonDown_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        if (MouseEvent.IsTouchEvent())
        {
            return FEventReply::Unhandled();
        }
        if (!(this.ItemBar.Get().GetbEnableClickLock()))
        {
            return FEventReply::Unhandled();
        }
        if (this.ItemBar.Get().HasExternalTipTarget())
        {
            this.ItemBar.Get().NotifyExternalClick();
            return FEventReply::Handled();
        }
        return FEventReply::Unhandled();
    }
    UFUNCTION()
    void OnAddedToFocusPath_Implementation(const FFocusEvent &inout InFocusEvent)
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) != 1)
        {
            return;
        }
        if (this.ItemBar.Get().HasExternalTipTarget())
        {
            this.ItemBar.Get().NotifyExternalHoverEnter();
            return;
        }
        if (this.FixedTooltip != nullptr)
        {
            this.ShowFixedTooltip();
        }
        return;
    }
    UFUNCTION()
    void OnRemovedFromFocusPath_Implementation(const FFocusEvent &inout InFocusEvent)
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) != 1)
        {
            return;
        }
        if (this.ItemBar.Get().HasExternalTipTarget())
        {
            this.ItemBar.Get().NotifyExternalHoverLeave();
            return;
        }
        if (this.FixedTooltip != nullptr)
        {
            this.HideFixedTooltip();
        }
        return;
    }
    void SetFixedTooltip(const UWidget_ItemTooltip InTooltip)
    {
        if (this.ItemBar.IsValid())
        {
            this.ItemBar.Get().SetHasFixedTooltip((this.FixedTooltip != nullptr));
        }
        return;
    }
    UFUNCTION()
    void ApplySharedHoverAnchor(const UWidget InHoverAnchor, const ECommonHoverLayout InHoverLayout)
    {
        if (this.ItemBar.IsValid())
        {
            this.ItemBar.Get().SetSharedHoverAnchor(InHoverAnchor, ECommonHoverLayout(InHoverLayout));
        }
        if (this.HoverProvider == nullptr)
        {
            return;
        }
        this.HoverProvider.SetHoverForWidgetOverride(InHoverAnchor);
        if (this.HoverProvider.HoverProvider.IsValid())
        {
            this.HoverProvider.HoverProvider.Get().SetHoverPosition(ECommonHoverLayout(InHoverLayout));
        }
        return;
    }
    void ApplyConfiguredSharedHoverAnchor()
    {
        if (!(this.ItemBar.IsValid()))
        {
            return;
        }
        UWidget local_4 = this.ItemBar.Get().ResolveSharedHoverAnchorWidget();
        if (!(IsValid(local_4)))
        {
            return;
        }
        this.ApplySharedHoverAnchor(local_4, this.ItemBar.Get().ResolveSharedHoverLayout());
        return;
    }
    void ShowFixedTooltip()
    {
        if (this.FixedTooltip == nullptr || !(this.ItemBar.IsValid()))
        {
            return;
        }
        if (!(this.ItemBar.Get().GetTipsItem().IsValid()))
        {
            return;
        }
        this.FixedTooltip.Item.SetRef(this.ItemBar.Get().GetTipsItem());
        this.FixedTooltip.SetVisibility(ESlateVisibility(4));
        return;
    }
    void HideFixedTooltip()
    {
        if (this.FixedTooltip == nullptr)
        {
            return;
        }
        this.FixedTooltip.SetVisibility(ESlateVisibility(1));
        return;
    }
    UFUNCTION()
    int ItemBar_ItemNum() const
    {
        int local_5;
        FVM_CommonItemBar& local_2 = this.ItemBar.Get();
        if (local_2)
        {
            local_5 = local_2.GetItemNum();
        }
        else
        {
            local_5 = 0;
        }
        return local_5;
    }
    UFUNCTION()
    TEUIModelRef<FVM_Item> ItemBar_TipsItem() const
    {
        FVM_CommonItemBar& local_2 = this.ItemBar.Get();
        TEUIModelRef<FVM_Item> local_10;
        if (local_2)
        {
            local_10 = local_2.GetTipsItem();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_Item>();
        }
        return local_10;
    }
    UFUNCTION()
    void ItemBar_OpenRechargePage() const
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
        this.ItemBar.Initialize(this, FName("VM_CommonItemBar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemBarDelegate.IsBound())
        {
            this.ItemBar.SetRef(this.ItemBarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonItemBar
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_CommonItemBar;
    Result.ObservedModelChangesSubscriberCount = 0;
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
