
namespace UWidget_BattleBuildEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_BattleBuildEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BattleBuildEntry> Entry;
    UPROPERTY()
    FConfigVM_BattleBuildEntry EntryConfig;
    UPROPERTY()
    FGetEUIModelRef EntryDelegate;

    UWidget_BattleBuildEntry()
    {
        return;
    }
    UFUNCTION()
    void Entry_OpenBattleBuild() const
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
        this.Entry.Initialize(this, FName("VM_BattleBuildEntry"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EntryDelegate.IsBound())
        {
            this.Entry.SetRef(this.EntryDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_BattleBuildEntry
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
