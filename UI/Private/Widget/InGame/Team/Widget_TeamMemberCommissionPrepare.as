
namespace UWidget_TeamMemberCommissionPrepare
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TeamMemberCommissionPrepare : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DraftPlayerInfo> DraftPlayer;
    UPROPERTY()
    FGetEUIModelRef DraftPlayerDelegate;

    UWidget_TeamMemberCommissionPrepare()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DraftPlayer.Initialize(this, FName("VM_DraftPlayerInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DraftPlayerDelegate.IsBound())
        {
            this.DraftPlayer.SetRef(this.DraftPlayerDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TeamMemberCommissionPrepare
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
