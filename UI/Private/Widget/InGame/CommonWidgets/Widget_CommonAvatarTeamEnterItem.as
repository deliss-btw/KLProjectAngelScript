
namespace UWidget_CommonAvatarTeamEnterItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonAvatarTeamEnterItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonAvatarTeamEnterItem> TeamEnterItem;
    UPROPERTY()
    FGetEUIModelRef TeamEnterItemDelegate;

    UWidget_CommonAvatarTeamEnterItem()
    {
        return;
    }
    UFUNCTION()
    void TeamEnterItem_OnClickAdd() const
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
        this.TeamEnterItem.Initialize(this, FName("VM_CommonAvatarTeamEnterItem"), EEUIWidgetRefModelCreationType(1), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TeamEnterItemDelegate.IsBound())
        {
            this.TeamEnterItem.SetRef(this.TeamEnterItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonAvatarTeamEnterItem
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
