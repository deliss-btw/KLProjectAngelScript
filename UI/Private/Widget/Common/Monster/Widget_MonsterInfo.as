
namespace UWidget_MonsterInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MonsterInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MonsterInfo> MonsterInfo;
    UPROPERTY()
    FGetEUIModelRef MonsterInfoDelegate;

    UWidget_MonsterInfo()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MonsterInfo.Initialize(this, FName("VM_MonsterInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MonsterInfoDelegate.IsBound())
        {
            this.MonsterInfo.SetRef(this.MonsterInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MonsterInfo
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
