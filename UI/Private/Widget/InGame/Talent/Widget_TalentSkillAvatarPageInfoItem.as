
namespace UWidget_TalentSkillAvatarPageInfoItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TalentSkillAvatarPageInfoItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarDetailSkillSelect> TalentSkillInfo;
    UPROPERTY()
    FGetEUIModelRef TalentSkillInfoDelegate;

    UWidget_TalentSkillAvatarPageInfoItem()
    {
        return;
    }
    UFUNCTION()
    void TalentSkillInfo_SetHoverSkill(const bool InbHover) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(InbHover);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TalentSkillInfo_GoToSkillDetial() const
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
        this.TalentSkillInfo.Initialize(this, FName("VM_AvatarDetailSkillSelect"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TalentSkillInfoDelegate.IsBound())
        {
            this.TalentSkillInfo.SetRef(this.TalentSkillInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentSkillAvatarPageInfoItem
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
