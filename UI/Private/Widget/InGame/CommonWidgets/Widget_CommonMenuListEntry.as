
namespace UWidget_CommonMenuListEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonMenuListEntry : UEUIUserWidget
{
    UPROPERTY()
    UTextBlock Title;
    UPROPERTY()
    UEUIUserWidget RedDot;
    UPROPERTY()
    bool bSelected;
    UPROPERTY()
    int Index;
    UPROPERTY()
    FText TitleText;
    UPROPERTY()
    UWidget_CommonMenuList ParentList;

    UWidget_CommonMenuListEntry()
    {
        return;
    }
    UFUNCTION()
    void PreConstruct_Implementation(const bool IsDesignTime)
    {
        this.Title.SetText(this.TitleText);
        return;
    }
    void UpdateTitleText(const FText &inout InTitleText)
    {
        this.TitleText = InTitleText;
        if (this.Title != nullptr)
        {
            this.Title.SetText(this.TitleText);
        }
        return;
    }
    UFUNCTION()
    void Select()
    {
        this.ParentList.SetSelectedIndex(this.Index);
        return;
    }
}

namespace UWidget_CommonMenuListEntry
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
