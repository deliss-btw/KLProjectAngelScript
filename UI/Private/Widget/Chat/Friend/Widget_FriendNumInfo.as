
namespace UWidget_FriendNumInfo
{
    const int ViewID = 0;

}
class UWidget_FriendNumInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_FriendNumInfo> FriendNumInfo;
    UPROPERTY()
    FGetEUIModelRef FriendNumInfoDelegate;

    UWidget_FriendNumInfo()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.FriendNumInfo.Initialize(this, FName("VM_FriendNumInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.FriendNumInfoDelegate.IsBound())
        {
            this.FriendNumInfo.SetRef(this.FriendNumInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_FriendNumInfo
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
