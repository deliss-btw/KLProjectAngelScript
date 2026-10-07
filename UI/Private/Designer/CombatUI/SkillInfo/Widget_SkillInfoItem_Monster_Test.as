
namespace UWidget_SkillInfoItem_Monster_Test
{
    const int ViewID = 0;

}
class UWidget_SkillInfoItem_Monster_Test : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SkillInfoItem_Monster_Test> SkillInfoItem;
    UPROPERTY()
    FGetEUIModelRef SkillInfoItemDelegate;

    UWidget_SkillInfoItem_Monster_Test()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillInfoItem.Initialize(this, FName("VM_SkillInfoItem_Monster_Test"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillInfoItemDelegate.IsBound())
        {
            this.SkillInfoItem.SetRef(this.SkillInfoItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SkillInfoItem_Monster_Test
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
