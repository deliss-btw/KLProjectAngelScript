
namespace UWidget_PlayerInfo
{
    const int ViewID = 0;

}
class UWidget_PlayerInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerInfo> PlayerInfo;
    UPROPERTY()
    FGetEUIModelRef PlayerInfoDelegate;

    UWidget_PlayerInfo()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (!(this.PlayerInfo))
        {
            this.PlayerInfo.SetRef(TEUIModelRef<FVM_PlayerInfo>(::FVM_PlayerInfo::Create(this, ::FMS_PlayerData::Get(this).GetLocalPlayerData())));
        }
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
        this.PlayerInfo.Initialize(this, FName("VM_PlayerInfo"), EEUIWidgetRefModelCreationType(0), true);
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

namespace UWidget_PlayerInfo
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
