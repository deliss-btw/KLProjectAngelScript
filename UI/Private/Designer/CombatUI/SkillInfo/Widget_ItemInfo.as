namespace UWidget_ItemInfo
{
    const int ViewID = 0;

}
class UWidget_ItemInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ItemInfo> ItemInfo;
    UPROPERTY()
    UCanvasPanel KeyboardInputPanel;
    UPROPERTY()
    UCanvasPanel GamepadInputPanel;

    UWidget_ItemInfo()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (UICommonUtil::CVar_UI_DebugEnableNewItemBtns.GetBool())
        {
            return;
        }
        FECSEntity local_10 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (local_10.MatchGameplayTag(GameplayTags::CombatState_ControlMonster))
        {
            this.KeyboardInputPanel.SetVisibility(ESlateVisibility(2));
            this.GamepadInputPanel.SetVisibility(ESlateVisibility(2));
        }
        else
        {
            switch (int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())))
            {
            case 1:
            {
                this.KeyboardInputPanel.SetVisibility(ESlateVisibility(2));
                this.GamepadInputPanel.SetVisibility(ESlateVisibility(0));
                break;
            }
            case 0:
            {
                this.KeyboardInputPanel.SetVisibility(ESlateVisibility(0));
                this.GamepadInputPanel.SetVisibility(ESlateVisibility(2));
                break;
            }
            }
        }
        return;
    }
    UFUNCTION()
    FEUIModelRef ItemInfo_VM_HealItemButton() const
    {
        FVMS_ItemInfo& local_2 = this.ItemInfo.Get();
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_HealItemButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef ItemInfo_VM_CombatItemButton_1() const
    {
        FVMS_ItemInfo& local_2 = this.ItemInfo.Get();
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_CombatItemButton_1() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef ItemInfo_VM_CombatItemButton_2() const
    {
        FVMS_ItemInfo& local_2 = this.ItemInfo.Get();
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_CombatItemButton_2() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef ItemInfo_VM_CombatItemButton_Temp() const
    {
        FVMS_ItemInfo& local_2 = this.ItemInfo.Get();
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_CombatItemButton_Temp() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef ItemInfo_VM_LinkSkillButton() const
    {
        FVMS_ItemInfo& local_2 = this.ItemInfo.Get();
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_LinkSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ItemInfo.Initialize(this, FName("VMS_ItemInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_ItemInfo
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_ItemInfo;
    Result.ObservedModelChangesSubscriberCount = 0;
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
