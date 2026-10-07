
namespace UWidget_CommonAvatarTeamEnter
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonAvatarTeamEnter : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonAvatarTeamEnter> TeamEnter;
    UPROPERTY()
    FGetEUIModelRef TeamEnterDelegate;

    UWidget_CommonAvatarTeamEnter()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TeamEnter.Initialize(this, FName("VM_CommonAvatarTeamEnter"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TeamEnterDelegate.IsBound())
        {
            this.TeamEnter.SetRef(this.TeamEnterDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonAvatarTeamEnter
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
