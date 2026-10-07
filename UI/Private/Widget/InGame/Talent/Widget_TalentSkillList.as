
namespace UWidget_TalentSkillList
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TalentSkillList : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentEditPage> TalentEditPage;
    UPROPERTY()
    FGetEUIModelRef TalentEditPageDelegate;

    UWidget_TalentSkillList()
    {
        return;
    }
    UFUNCTION()
    void TalentEditPage_OnSkillItemSelected(const FEUIModelContainer &inout SkillItem) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(SkillItem);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_OnSkillItemSelectedSlot(const ESkillSlot SkillSlot) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(SkillSlot);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_SelectNextSkill() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_SelectPrevSkill() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_SelectFirst() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_ClosePage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_OnBlankClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_CloseSkillChoice() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_UpdateSkillSellectType(const ESkillSlot SkillSlot, const ESkillType SkillType) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(SkillSlot);
        FEUIWidgetModelCallbackBuilder::PushArg local_46;
        local_46.opCall(SkillType);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_OnSwitchCurSelectChoiceEquip() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentEditPage_ShowTalentNodeHoverOpenDetails() const
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
        this.TalentEditPage.Initialize(this, FName("VM_TalentEditPage"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TalentEditPageDelegate.IsBound())
        {
            this.TalentEditPage.SetRef(this.TalentEditPageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentSkillList
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
