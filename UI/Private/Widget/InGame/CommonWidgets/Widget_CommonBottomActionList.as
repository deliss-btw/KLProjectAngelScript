
namespace UWidget_CommonBottomActionList
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonBottomActionList : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_CommonBottomActionList> InputActionList;

    UWidget_CommonBottomActionList()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.InputActionList.Initialize(this, FName("VMS_CommonBottomActionList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_CommonBottomActionList
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
