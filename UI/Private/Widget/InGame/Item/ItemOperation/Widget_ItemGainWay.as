
namespace UWidget_ItemGainWay
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemGainWay : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemGainWayList> ItemGainWayList;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonHoverContent> CommonHoverContent;
    UPROPERTY()
    FGetEUIModelRef ItemGainWayListDelegate;
    UPROPERTY()
    FGetEUIModelRef CommonHoverContentDelegate;

    UWidget_ItemGainWay()
    {
        return;
    }
    UFUNCTION()
    void CommonHoverContent_CloseHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommonHoverContent_PinHoverPassThrough() const
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
        this.ItemGainWayList.Initialize(this, FName("VM_ItemGainWayList"), EEUIWidgetRefModelCreationType(0), false);
        this.CommonHoverContent.Initialize(this, FName("VM_CommonHoverContent"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemGainWayListDelegate.IsBound())
        {
            this.ItemGainWayList.SetRef(this.ItemGainWayListDelegate.Execute());
        }
        if (this.CommonHoverContentDelegate.IsBound())
        {
            this.CommonHoverContent.SetRef(this.CommonHoverContentDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemGainWay
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
