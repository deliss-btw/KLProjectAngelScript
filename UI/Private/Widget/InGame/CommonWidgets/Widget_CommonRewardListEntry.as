
namespace UWidget_CommonRewardListEntry
{
    const int ViewID = 0;
}
namespace UWidget_CommonRewardItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonRewardListEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonRewardItem> RewardItem;
    UPROPERTY()
    FGetEUIModelRef RewardItemDelegate;

    UWidget_CommonRewardListEntry()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.RewardItem.Initialize(this, FName("VM_CommonRewardItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RewardItemDelegate.IsBound())
        {
            this.RewardItem.SetRef(this.RewardItemDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommonRewardItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonRewardItem> RewardItem;
    UPROPERTY()
    FGetEUIModelRef RewardItemDelegate;

    UWidget_CommonRewardItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.RewardItem.Initialize(this, FName("VM_CommonRewardItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RewardItemDelegate.IsBound())
        {
            this.RewardItem.SetRef(this.RewardItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonRewardListEntry
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
namespace UWidget_CommonRewardItem
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
