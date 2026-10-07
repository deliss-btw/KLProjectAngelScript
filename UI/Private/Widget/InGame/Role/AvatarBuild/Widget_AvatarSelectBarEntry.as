
namespace UWidget_AvatarSelectBarEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarSelectBarEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarSelectBarItem> AvatarSelectBarItem;
    UPROPERTY()
    FGetEUIModelRef AvatarSelectBarItemDelegate;

    UWidget_AvatarSelectBarEntry()
    {
        return;
    }
    UFUNCTION()
    void AvatarSelectBarItem_SelectAvatar() const
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
        this.AvatarSelectBarItem.Initialize(this, FName("VM_AvatarSelectBarItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarSelectBarItemDelegate.IsBound())
        {
            this.AvatarSelectBarItem.SetRef(this.AvatarSelectBarItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarSelectBarEntry
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
