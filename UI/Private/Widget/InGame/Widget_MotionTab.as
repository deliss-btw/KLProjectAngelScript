
namespace UWidget_MotionTab
{
    const int ViewID = 0;

}
class UWidget_MotionTab : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MotionTab> Tab;
    UPROPERTY()
    FGetEUIModelRef TabDelegate;

    UWidget_MotionTab()
    {
        return;
    }
    UFUNCTION()
    FText Tab_TabName() const
    {
        FVM_MotionTab& local_2;
        FText local_12 = local_2 ? local_2.GetTabName() : FText();
        return local_12;
    }
    UFUNCTION()
    FLinearColor Tab_TabColor() const
    {
        FVM_MotionTab& local_2;
        FLinearColor local_11 = local_2 ? local_2.GetTabColor() : FLinearColor();
        return local_11;
    }
    UFUNCTION()
    void Tab_SelectCurrentTab() const
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
        this.Tab.Initialize(this, FName("VM_MotionTab"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TabDelegate.IsBound())
        {
            this.Tab.SetRef(this.TabDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MotionTab
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
