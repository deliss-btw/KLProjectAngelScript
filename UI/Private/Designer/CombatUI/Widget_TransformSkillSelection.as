
namespace UWidget_TransformSkillSelection
{
    const int ViewID = 0;

}
class UWidget_TransformSkillSelection : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_TransformSkillSelection> TransformSkillSelection;
    UPROPERTY()
    UEUICanvasPanel Panel;
    UPROPERTY()
    UEUIButton Button_1;
    UPROPERTY()
    UEUIButton Button_2;
    UPROPERTY()
    UEUIButton Button_3;
    UPROPERTY()
    UEUIButton Button_4;
    UPROPERTY()
    UWidgetAnimation TransformSkillPanelAnim;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> ItemConfig;

    UWidget_TransformSkillSelection()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.Button_1.OnClicked.AddUFunction(this, n"TransformSkill");
        this.Button_2.OnClicked.AddUFunction(this, n"TransformSkill");
        this.Button_3.OnClicked.AddUFunction(this, n"TransformSkill");
        this.Button_4.OnClicked.AddUFunction(this, n"TransformSkill");
        return;
    }
    UFUNCTION()
    void ShowTransformSkillPanel(const bool show)
    {
        return;
    }
    UFUNCTION()
    void TransformSkill()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    float32 TransformSkillSelection_TeamLinkEnergy() const
    {
        FVMS_TransformSkillSelection& local_2;
        return local_2 ? local_2.GetTeamLinkEnergy() : 0.0f;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TransformSkillSelection.Initialize(this, FName("VMS_TransformSkillSelection"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_TransformSkillSelection
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
