
namespace UWidget_TalentSkillTypeBG
{
    const int ViewID = 0;

}
class UWidget_TalentSkillTypeBG : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentSkillTypeBG> TalentSkillTypeBG;
    UPROPERTY()
    FGetEUIModelRef TalentSkillTypeBGDelegate;

    UWidget_TalentSkillTypeBG()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TalentSkillTypeBG.Initialize(this, FName("VM_TalentSkillTypeBG"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TalentSkillTypeBGDelegate.IsBound())
        {
            this.TalentSkillTypeBG.SetRef(this.TalentSkillTypeBGDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentSkillTypeBG
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
