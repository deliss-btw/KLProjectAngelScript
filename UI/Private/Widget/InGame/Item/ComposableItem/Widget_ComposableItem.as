
namespace UWidget_ComposableItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ComposableItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ComposableItem> ComposableItem;
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
    UEUIDynamicWidget Feature_SpecialProps;
    UPROPERTY()
    UEUIDynamicWidget Feature_SpecialBg;
    FEUIModelWeakRef __ComposableItem;
    UPROPERTY()
    FGetEUIModelRef ComposableItemDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableDelegate;


    UFUNCTION()
    void HandleComposableItemVMChanged()
    {
        if (this.ComposableItem.IsValid())
        {
            int(this.CurDisplayType).RebuildFeaturesWithDisplayType();
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_ComposableItem& local_6;
        TEUIModelRef<FVM_ComposableItem> local_2 = this.ComposableItem.AsRef();
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
                    this.ComposableItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_ComposableItem::__IndexOf_ItemDataModel());
                        local_6.TrackPropertyRead(::FVM_ComposableItem::__IndexOf_Scenario());
                    }
                    if (local_6)
                    {
                        this.HandleComposableItemVMChanged();
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
                XError(ELog(17), "Remaining observed model change: HandleComposableItemVMChanged");
            }
            return;
        }
        this.__ComposableItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ComposableItem.Initialize(this, FName("VM_ComposableItem"), EEUIWidgetRefModelCreationType(0), false);
        this.Selectable.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ComposableItemDelegate.IsBound())
        {
            this.ComposableItem.SetRef(this.ComposableItemDelegate.Execute());
        }
        if (this.SelectableDelegate.IsBound())
        {
            this.Selectable.SetRef(this.SelectableDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ComposableItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleComposableItemVMChanged"));
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
