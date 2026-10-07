
namespace UWidget_Comp_Matching
{
    const int ViewID = 0;

// NOTE: class defaults are not authored in this module: UWidget_Comp_Matching (default scalar field UEUIActivatableWidget.bAutoActivate has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

}
class UWidget_Comp_Matching : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Comp_Matching> Comp_Matching;

    UWidget_Comp_Matching()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Comp_Matching.Initialize(this, FName("VM_Comp_Matching"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_Comp_Matching
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
