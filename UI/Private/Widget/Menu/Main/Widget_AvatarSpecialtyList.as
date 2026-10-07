
namespace UWidget_AvatarSpecialtyList
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarSpecialtyList : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MainMenuAvatar> MainMenuAvatar;
    UPROPERTY()
    FConfigVM_MainMenuAvatar MainMenuAvatarConfig;
    UPROPERTY()
    FGetEUIModelRef MainMenuAvatarDelegate;

    UWidget_AvatarSpecialtyList()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelContainer> MainMenuAvatar_AvatarList() const
    {
        FVM_MainMenuAvatar& local_2;
        TArray<FEUIModelContainer> local_12;
        if (local_2)
        {
            local_12 = local_2.GetAvatarList();
        }
        else
        {
            local_12 = TArray<FEUIModelContainer>();
        }
        return local_12;
    }
    UFUNCTION()
    void MainMenuAvatar_SelectAvatarByIndex(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MainMenuAvatar_GotoAvatarBuildPage() const
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
        this.MainMenuAvatar.Initialize(this, FName("VM_MainMenuAvatar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MainMenuAvatarDelegate.IsBound())
        {
            this.MainMenuAvatar.SetRef(this.MainMenuAvatarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarSpecialtyList
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
