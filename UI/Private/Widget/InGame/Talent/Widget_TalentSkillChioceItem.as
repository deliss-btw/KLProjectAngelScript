
namespace UWidget_TalentSkillChioceItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TalentSkillChioceItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentEditSkillBtn> SkillIcon;
    UPROPERTY()
    bool bTypeNameVisible = true;
    UPROPERTY()
    UWidget IconTypeName;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;
    UPROPERTY()
    FGetEUIModelRef SkillIconDelegate;


    UFUNCTION()
    void PreConstruct_Implementation(const bool IsDesignTime)
    {
        int local_2;
        if (this.bTypeNameVisible)
        {
            int local_3;
            local_3 = 0;
            local_2 = local_3;
        }
        else
        {
            int local_3;
            local_3 = 1;
            local_2 = local_3;
        }
        this.IconTypeName.SetVisibility(ESlateVisibility(local_2));
        return;
    }
    UFUNCTION()
    void SkillIcon_OnAvatarSkillDetialSelect() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SkillIcon_OnUpdateSkillSellectType() const
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
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        this.SkillIcon.Initialize(this, FName("VM_TalentEditSkillBtn"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        if (this.SkillIconDelegate.IsBound())
        {
            this.SkillIcon.SetRef(this.SkillIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentSkillChioceItem
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
