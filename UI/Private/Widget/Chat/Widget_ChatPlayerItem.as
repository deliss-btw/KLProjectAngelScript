
namespace UWidget_ChatPlayerItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ChatPlayerItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_FriendItem> PlayerItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> Selectable;
    UPROPERTY()
    UEUIImage w_img_selected;
    FEUIModelWeakRef __Selectable;
    UPROPERTY()
    FGetEUIModelRef PlayerItemDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableDelegate;

    UWidget_ChatPlayerItem()
    {
        return;
    }
    UFUNCTION()
    void OnSelected(const bool bIsSelected)
    {
        int local_4;
        int local_5;
        if (this.w_img_selected != nullptr)
        {
            if (bIsSelected)
            {
                local_5 = 4;
                local_4 = local_5;
            }
            else
            {
                local_5 = 1;
                local_4 = local_5;
            }
            this.w_img_selected.SetVisibility(ESlateVisibility(local_4));
        }
        return;
    }
    UFUNCTION()
    void PlayerItem_OnRedDotClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PlayerItem_ChatWithPlayer() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PlayerItem_AddFriend() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PlayerItem_RefuseApplyFriend() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PlayerItem_AcceptApplyFriend() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_SelectableItem& local_6;
        TEUIModelRef<FVM_SelectableItem> local_2 = this.Selectable.AsRef();
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
                    this.Selectable.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_SelectableItem::__IndexOf_bIsSelected());
                    }
                    if (local_6)
                    {
                        this.OnSelected(local_6.GetbIsSelected());
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
                XError(ELog(17), "Remaining observed model change: OnSelected");
            }
            return;
        }
        this.__Selectable = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PlayerItem.Initialize(this, FName("VM_FriendItem"), EEUIWidgetRefModelCreationType(0), false);
        this.Selectable.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PlayerItemDelegate.IsBound())
        {
            this.PlayerItem.SetRef(this.PlayerItemDelegate.Execute());
        }
        if (this.SelectableDelegate.IsBound())
        {
            this.Selectable.SetRef(this.SelectableDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChatPlayerItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelected"));
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
