
namespace UWidget_SideHintItem
{
    const int ViewID = 0;

}
class UWidget_SideHintItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SideHintItem> SideHintItem;
    UPROPERTY()
    URichTextBlock RichText_HintText;
    FEUIModelWeakRef __SideHintItem;
    UPROPERTY()
    FGetEUIModelRef SideHintItemDelegate;

    UWidget_SideHintItem()
    {
        return;
    }
    UFUNCTION()
    void HandleHintTextChanged(const bool bShowHint, const FText &inout HintText)
    {
        this.RichText_HintText.SetText(HintText);
        return;
    }
    UFUNCTION()
    bool SideHintItem_bShowHint() const
    {
        FVM_SideHintItem& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbShowHint();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    UTexture2D SideHintItem_Icon() const
    {
        FVM_SideHintItem& local_2;
        UTexture2D local_8;
        if (local_2)
        {
            local_8 = local_2.GetIcon();
        }
        else
        {
        }
        return local_8;
    }
    UFUNCTION()
    FText SideHintItem_HintTitle() const
    {
        FVM_SideHintItem& local_2;
        FText local_12 = local_2 ? local_2.GetHintTitle() : FText();
        return local_12;
    }
    UFUNCTION()
    FText SideHintItem_HintText() const
    {
        FVM_SideHintItem& local_2;
        FText local_12 = local_2 ? local_2.GetHintText() : FText();
        return local_12;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_SideHintItem& local_6;
        TEUIModelRef<FVM_SideHintItem> local_2 = this.SideHintItem.AsRef();
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
                    this.SideHintItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_SideHintItem::__IndexOf_bShowHint());
                        local_6.TrackPropertyRead(::FVM_SideHintItem::__IndexOf_HintText());
                    }
                    if (local_6)
                    {
                        this.HandleHintTextChanged(local_6.GetbShowHint(), local_6.GetHintText());
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
                XError(ELog(17), "Remaining observed model change: HandleHintTextChanged");
            }
            return;
        }
        this.__SideHintItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SideHintItem.Initialize(this, FName("VM_SideHintItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SideHintItemDelegate.IsBound())
        {
            this.SideHintItem.SetRef(this.SideHintItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SideHintItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleHintTextChanged"));
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
