
namespace UWidget_TalentCompTypeIcon
{
    const int ViewID = 0;

}
class UWidget_TalentCompTypeIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentDivisionTypeIcon> TalentType;
    UPROPERTY()
    FGetEUIModelRef TalentTypeDelegate;

    UWidget_TalentCompTypeIcon()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TalentType.Initialize(this, FName("VM_TalentDivisionTypeIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TalentTypeDelegate.IsBound())
        {
            this.TalentType.SetRef(this.TalentTypeDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentCompTypeIcon
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
