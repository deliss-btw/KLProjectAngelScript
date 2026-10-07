
namespace UWidget_TeamMemberPrepareItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TeamMemberPrepareItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeamMemberPrepareItem> TeamMemberPrepareItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerBasicItemExtend> PlayerBasicItemExtend;
    UPROPERTY()
    FGetEUIModelRef TeamMemberPrepareItemDelegate;
    UPROPERTY()
    FGetEUIModelRef PlayerBasicItemExtendDelegate;

    UWidget_TeamMemberPrepareItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TeamMemberPrepareItem.Initialize(this, FName("VM_TeamMemberPrepareItem"), EEUIWidgetRefModelCreationType(0), false);
        this.PlayerBasicItemExtend.Initialize(this, FName("VM_PlayerBasicItemExtend"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TeamMemberPrepareItemDelegate.IsBound())
        {
            this.TeamMemberPrepareItem.SetRef(this.TeamMemberPrepareItemDelegate.Execute());
        }
        if (this.PlayerBasicItemExtendDelegate.IsBound())
        {
            this.PlayerBasicItemExtend.SetRef(this.PlayerBasicItemExtendDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TeamMemberPrepareItem
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
