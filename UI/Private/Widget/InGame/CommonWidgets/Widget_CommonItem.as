
namespace UWidget_CommonItem
{
    const int ViewID = 0;
}
namespace UWidget_CommonItem_Rectangle
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonItem> CommonItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    FEUIModelWeakRef __CommonItem;
    UPROPERTY()
    FGetEUIModelRef CommonItemDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;

    UWidget_CommonItem()
    {
        return;
    }
    UFUNCTION()
    void HandleCustomSelectedChanged(const bool bIsCustomSelected)
    {
        UWidgetAnimation local_2;
        UWidgetAnimation local_6;
        if (bIsCustomSelected)
        {
            local_2 = this.Anim_Unselected;
            if (local_2 != nullptr)
            {
                this.StopAnimation(this.Anim_Unselected);
            }
            local_6 = this.Anim_Selected;
            if (local_6 != nullptr)
            {
                this.PlayAnimation(this.Anim_Selected, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            }
            return;
        }
        UWidgetAnimation local_16 = this.Anim_Selected;
        if (local_16 != nullptr)
        {
            this.StopAnimation(this.Anim_Selected);
        }
        UWidgetAnimation local_18 = this.Anim_Unselected;
        if (local_18 != nullptr)
        {
            this.PlayAnimation(this.Anim_Unselected, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        return;
    }
    UFUNCTION()
    void CommonItem_HandleCommonItemClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommonItem& local_6;
        TEUIModelRef<FVM_CommonItem> local_2 = this.CommonItem.AsRef();
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
                    this.CommonItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommonItem::__IndexOf_bIsCustomSelected());
                    }
                    if (local_6)
                    {
                        this.HandleCustomSelectedChanged(local_6.GetbIsCustomSelected());
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
                XError(ELog(17), "Remaining observed model change: HandleCustomSelectedChanged");
            }
            return;
        }
        this.__CommonItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonItem.Initialize(this, FName("VM_CommonItem"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonItemDelegate.IsBound())
        {
            this.CommonItem.SetRef(this.CommonItemDelegate.Execute());
        }
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommonItem_Rectangle : UWidget_CommonItem
{
    UWidget_CommonItem_Rectangle()
    {
        super();
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.CommonItem.IsValid())
        {
            2.RefreshDisplay();
        }
        return;
    }
}

namespace UWidget_CommonItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleCustomSelectedChanged"));
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
namespace UWidget_CommonItem_Rectangle
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
