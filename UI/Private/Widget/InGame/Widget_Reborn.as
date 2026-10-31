namespace UWidget_Reborn
{
    const int ViewID = 0;

}
class UWidget_Reborn : UEUIUserWidget
{
    UPROPERTY()
    UWidgetAnimation ShowDelay;
    UPROPERTY()
    UCanvasPanel CanvasPanel;
    UPROPERTY()
    UInputAction LookForHelpAction;
    UPROPERTY()
    UInputAction RebornAction;

    UWidget_Reborn()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.CanvasPanel.SetRenderOpacity(0.0f);
        this.PlayAnimation(this.ShowDelay, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        return;
    }
    UFUNCTION()
    FText GetLookForHelpActionText() const
    {
        FText local_4 = NSLOCTEXT("LookForHelpActionFormat", "按【{0}】寻求他人帮助");
        FText local_12;
        if (::UICommonUtil::GetInputActionKeyName(this.GetOwningLocalPlayer(), this.LookForHelpAction, local_12))
        {
            return FText::Format(local_4, local_12);
        }
        return FText();
    }
    UFUNCTION()
    FText GetRebornActionText() const
    {
        FText local_4 = NSLOCTEXT("RebornActionFormat", "按【{0}】回到最近复活点");
        FText local_12;
        if (::UICommonUtil::GetInputActionKeyName(this.GetOwningLocalPlayer(), this.RebornAction, local_12))
        {
            return FText::Format(local_4, local_12);
        }
        return FText();
    }
}

namespace UWidget_Reborn
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_Reborn;
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
