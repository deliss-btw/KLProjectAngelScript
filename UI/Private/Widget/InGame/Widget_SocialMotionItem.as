
namespace UWidget_SocialMotionItem
{
    const int ViewID = 0;

}
class UWidget_SocialMotionItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SocialMotionItem> SocialMotionItem;
    UPROPERTY()
    FGetEUIModelRef SocialMotionItemDelegate;

    UWidget_SocialMotionItem()
    {
        return;
    }
    UFUNCTION()
    void ShowHover()
    {
        this.SocialMotionItem_ShowHover(this);
        return;
    }
    UFUNCTION()
    bool SocialMotionItem_IsLock() const
    {
        FVM_SocialMotionItem& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetIsLock();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    FText SocialMotionItem_Name() const
    {
        FVM_SocialMotionItem& local_2;
        FText local_16;
        if (local_2)
        {
            local_16 = local_2.GetName();
        }
        else
        {
            local_16 = FText();
        }
        return local_16;
    }
    UFUNCTION()
    UTexture2D SocialMotionItem_ActionIcon() const
    {
        FVM_SocialMotionItem& local_2;
        UTexture2D local_8;
        if (local_2)
        {
            local_8 = local_2.GetActionIcon();
        }
        else
        {
        }
        return local_8;
    }
    UFUNCTION()
    void SocialMotionItem_OnButtonClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SocialMotionItem_ShowHover(const UWidget Widget) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Widget);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SocialMotionItem_HideHover() const
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
        this.SocialMotionItem.Initialize(this, FName("VM_SocialMotionItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SocialMotionItemDelegate.IsBound())
        {
            this.SocialMotionItem.SetRef(this.SocialMotionItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SocialMotionItem
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
