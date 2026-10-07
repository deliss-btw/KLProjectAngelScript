
namespace UWidget_InvitationPlayerBasicItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_InvitationPlayerBasicItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerInfo> PlayerInfo;
    UPROPERTY()
    FGetEUIModelRef PlayerInfoDelegate;

    UWidget_InvitationPlayerBasicItem()
    {
        return;
    }
    UFUNCTION()
    void OnPlayerBasicItemClicked()
    {
        XLog(ELog(74), FString().Append("OnPlayerBasicItemClicked: ").Append(GetPlayerUid()));
        return;
    }
    UFUNCTION()
    void PlayerInfo_CopyUidToClipboard() const
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
        this.PlayerInfo.Initialize(this, FName("VM_PlayerInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PlayerInfoDelegate.IsBound())
        {
            this.PlayerInfo.SetRef(this.PlayerInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_InvitationPlayerBasicItem
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
