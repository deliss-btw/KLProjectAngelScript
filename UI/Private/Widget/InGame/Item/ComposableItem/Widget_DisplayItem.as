
namespace UWidget_DisplayItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_DisplayItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DisplayItem> DisplayItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> Selectable;
    UPROPERTY()
    EItemDisplayType CurDisplayType = EItemDisplayType(1);
    UPROPERTY()
    UEUIDynamicWidget Feature_Count;
    UPROPERTY()
    UEUIDynamicWidget Feature_Level;
    UPROPERTY()
    UEUIDynamicWidget Feature_EquipMark;
    UPROPERTY()
    UEUIDynamicWidget Feature_RedDot;
    UPROPERTY()
    UEUIDynamicWidget Feature_New;
    UPROPERTY()
    UEUIDynamicWidget Feature_Mask;
    UPROPERTY()
    UEUIDynamicWidget Feature_Tag;
    UPROPERTY()
    UEUIDynamicWidget Feature_Grade;
    UPROPERTY()
    UEUIDynamicWidget Feature_SpecialProps;
    FEUIModelWeakRef __DisplayItem;
    UPROPERTY()
    FGetEUIModelRef DisplayItemDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableDelegate;


    UFUNCTION()
    void HandleDisplayItemVMChanged()
    {
        if (this.DisplayItem.IsValid())
        {
            int(this.CurDisplayType).RebuildFeaturesWithDisplayType();
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_DisplayItem& local_6;
        TEUIModelRef<FVM_DisplayItem> local_2 = this.DisplayItem.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.DisplayItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_DisplayItem::__IndexOf_DisplayData());
                        local_6.TrackPropertyRead(::FVM_DisplayItem::__IndexOf_Scenario());
                    }
                    if (local_6)
                    {
                        this.HandleDisplayItemVMChanged();
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: HandleDisplayItemVMChanged");
            }
            return;
        }
        this.__DisplayItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DisplayItem.Initialize(this, FName("VM_DisplayItem"), EEUIWidgetRefModelCreationType(0), false);
        this.Selectable.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DisplayItemDelegate.IsBound())
        {
            this.DisplayItem.SetRef(this.DisplayItemDelegate.Execute());
        }
        if (this.SelectableDelegate.IsBound())
        {
            this.Selectable.SetRef(this.SelectableDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_DisplayItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleDisplayItemVMChanged"));
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
