
namespace UWidget_AvatarItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarInfo> Avatar;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarInfoExtend> AvatarInfoExtend;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RedDot> RedDotVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> Selectable;
    UPROPERTY()
    UEUITextBlock W_txt_num;
    UPROPERTY()
    UEUIButton HoverBtn;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonHoverProvider> HoverProvider;
    UPROPERTY()
    TSoftClassPtr<UWidget_AttitudeHoverTips> HoverWidgetClass;
    UPROPERTY()
    FConfigVM_RedDot RedDotVMConfig;
    UPROPERTY()
    FConfigVM_CommonHoverProvider HoverProviderConfig;
    UPROPERTY()
    FGetEUIModelRef AvatarDelegate;
    UPROPERTY()
    FGetEUIModelRef AvatarInfoExtendDelegate;
    UPROPERTY()
    FGetEUIModelRef RedDotVMDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableDelegate;
    UPROPERTY()
    FGetEUIModelRef HoverProviderDelegate;

    UWidget_AvatarItem()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.HoverBtn != nullptr)
        {
            FVM_CommonHoverProvider& local_6;
            if (!(local_6.GetbIsForbidHover()))
            {
                local_6.SetHoverForWidget(this.HoverBtn);
                local_6.SetHoverWidgetClass(this.HoverWidgetClass);
            }
        }
        return;
    }
    UFUNCTION()
    void HideIndexText()
    {
        if (this.W_txt_num != nullptr)
        {
            this.W_txt_num.SetVisibility(ESlateVisibility(1));
        }
        return;
    }
    UFUNCTION()
    void OnHover()
    {
        if (this.HoverBtn != nullptr && this.HoverProvider.IsValid())
        {
            if (this.Avatar.IsValid())
            {
                FEUIModelRef local_8;
                local_8.ResetHoverModel();
                NotifyMouseEnter();
            }
        }
        return;
    }
    UFUNCTION()
    void OnUnhover()
    {
        if (this.HoverBtn != nullptr && this.HoverProvider.IsValid())
        {
            FVM_CommonHoverProvider& local_8;
            if (!(local_8.GetbIsForbidHover()))
            {
                local_8.NotifyMouseLeave();
            }
        }
        return;
    }
    UFUNCTION()
    void Avatar_OnChangeSpecialty() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Avatar_OnCurrentAvatarsChanged() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
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
        this.Avatar.Initialize(this, FName("VM_AvatarInfo"), EEUIWidgetRefModelCreationType(0), false);
        this.AvatarInfoExtend.Initialize(this, FName("VM_AvatarInfoExtend"), EEUIWidgetRefModelCreationType(0), true);
        this.RedDotVM.Initialize(this, FName("VM_RedDot"), EEUIWidgetRefModelCreationType(0), true);
        this.Selectable.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        this.HoverProvider.Initialize(this, FName("VM_CommonHoverProvider"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarDelegate.IsBound())
        {
            this.Avatar.SetRef(this.AvatarDelegate.Execute());
        }
        if (this.AvatarInfoExtendDelegate.IsBound())
        {
            this.AvatarInfoExtend.SetRef(this.AvatarInfoExtendDelegate.Execute());
        }
        if (this.RedDotVMDelegate.IsBound())
        {
            this.RedDotVM.SetRef(this.RedDotVMDelegate.Execute());
        }
        if (this.SelectableDelegate.IsBound())
        {
            this.Selectable.SetRef(this.SelectableDelegate.Execute());
        }
        if (this.HoverProviderDelegate.IsBound())
        {
            this.HoverProvider.SetRef(this.HoverProviderDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarItem
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
