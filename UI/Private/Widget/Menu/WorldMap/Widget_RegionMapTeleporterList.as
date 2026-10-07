
namespace UWidget_RegionMapTeleporterList
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_RegionMapTeleporterList : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RegionMap> RegionMap;
    UPROPERTY()
    FGetEUIModelRef RegionMapDelegate;

    UWidget_RegionMapTeleporterList()
    {
        return;
    }
    UFUNCTION()
    void RegionMap_OnItemSelected(const FEUIDynamicWidgetData &inout Item) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Item);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void RegionMap_OnMinimapSelectionChanged(const FMinimapIconHandle &inout IconHandle) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(IconHandle);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void RegionMap_OnLevelSelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.RegionMap.Initialize(this, FName("VM_RegionMap"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RegionMapDelegate.IsBound())
        {
            this.RegionMap.SetRef(this.RegionMapDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_RegionMapTeleporterList
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
