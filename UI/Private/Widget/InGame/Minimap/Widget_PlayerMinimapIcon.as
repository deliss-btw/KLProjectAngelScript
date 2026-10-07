
namespace UWidget_PlayerMinimapIcon
{
    const int ViewID = 0;

}
class UWidget_PlayerMinimapIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerMinimapIcon> PlayerMinimapIcon;
    UPROPERTY()
    UWidgetAnimation Anim_Tip;
    UPROPERTY()
    FGetEUIModelRef PlayerMinimapIconDelegate;

    UWidget_PlayerMinimapIcon()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        int local_16 = 0;
        if (!(this.PlayerMinimapIcon))
        {
            return;
        }
        FEUIWidgetRef local_6 = FEUIWidget::FindWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_Minimap);
        if (!(local_6))
        {
            XError(ELog(16), "Minimap page not found");
            return;
        }
        if (!(local_16))
        {
            XError(ELog(16), FString().Append("Failed to find MinimapPageLifeCycle model in widget ").Append(local_6.ToString()));
            return;
        }
        if (this.PlayerMinimapIcon.opArrow().IsSelfIcon() && !(local_16.GetbPlayedSelfIconAnim()))
        {
            this.PlayAnimation(this.Anim_Tip, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            local_16.SetbPlayedSelfIconAnim(true);
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PlayerMinimapIcon.Initialize(this, FName("VM_PlayerMinimapIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PlayerMinimapIconDelegate.IsBound())
        {
            this.PlayerMinimapIcon.SetRef(this.PlayerMinimapIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PlayerMinimapIcon
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
