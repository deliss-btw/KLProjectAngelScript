
namespace UWidget_TeamTab
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TeamTab : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeamPanelTypeItem> TeamTypeItem;
    UPROPERTY()
    FGetEUIModelRef TeamTypeItemDelegate;

    UWidget_TeamTab()
    {
        return;
    }
    UFUNCTION()
    void TeamTypeItem_ChangeToTeamType() const
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
        this.TeamTypeItem.Initialize(this, FName("VM_TeamPanelTypeItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TeamTypeItemDelegate.IsBound())
        {
            this.TeamTypeItem.SetRef(this.TeamTypeItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TeamTab
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
