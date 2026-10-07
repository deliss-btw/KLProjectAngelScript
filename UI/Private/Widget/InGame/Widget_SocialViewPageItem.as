
namespace UWidget_SocialViewPageItem
{
    const int ViewID = 0;
}
namespace UWidget_SocialViewPageSmallItem
{
    const int ViewID = 0;

}
class UWidget_SocialViewPageItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SocialViewPageBigBtn> SocialMotionItem;
    UPROPERTY()
    FGetEUIModelRef SocialMotionItemDelegate;

    UWidget_SocialViewPageItem()
    {
        return;
    }
    UFUNCTION()
    void SocialMotionItem_OnAction() const
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
        this.SocialMotionItem.Initialize(this, FName("VM_SocialViewPageBigBtn"), EEUIWidgetRefModelCreationType(0), false);
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

class UWidget_SocialViewPageSmallItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SocialViewPageSmallBtn> SocialMotionItem;
    UPROPERTY()
    FGetEUIModelRef SocialMotionItemDelegate;

    UWidget_SocialViewPageSmallItem()
    {
        return;
    }
    UFUNCTION()
    void SocialMotionItem_OnAction() const
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
        this.SocialMotionItem.Initialize(this, FName("VM_SocialViewPageSmallBtn"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UWidget_SocialViewPageItem
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
namespace UWidget_SocialViewPageSmallItem
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
