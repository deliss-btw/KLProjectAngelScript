
namespace UWidget_PVX_Match_CampusItem
{
    const int ViewID = 0;

}
class UWidget_PVX_Match_CampusItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVX_Match_CampusItem> PVX_Match_CampusItem;
    UPROPERTY()
    UEUIInputButtonBase UI_Common_Key_Text;
    UPROPERTY()
    FEUIInputActionDataRow SelectIARow;
    UPROPERTY()
    FEUIInputActionDataRow CancelIARow;
    UPROPERTY()
    UImage Join;
    UPROPERTY()
    UImage Join_1;
    UPROPERTY()
    UEUITextBlock w_txt_num;
    UPROPERTY()
    UEUITextBlock w_txt_numSelection;
    UPROPERTY()
    FLinearColor NormalColorOverride;
    UPROPERTY()
    FLinearColor SelectedColorOverride;
    UPROPERTY()
    FLinearColor InvalidColorOverride;
    FEUIModelWeakRef __PVX_Match_CampusItem;
    UPROPERTY()
    FGetEUIModelRef PVX_Match_CampusItemDelegate;

    UWidget_PVX_Match_CampusItem()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnHovered()
    {
        if (this.PVX_Match_CampusItem.IsValid())
        {
            1.SetbHovered();
        }
        return;
    }
    UFUNCTION()
    void OnUnhovered()
    {
        if (this.PVX_Match_CampusItem.IsValid())
        {
            0.SetbHovered();
        }
        return;
    }
    UFUNCTION()
    void OnClicked()
    {
        int local_4 = 0;
        if (this.PVX_Match_CampusItem.IsValid())
        {
            FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
            TEUIModelWeakRef<FVM_PVX_Match_CampusItem> local_10;
            local_4.ClickCampusItem = local_10;
        }
        return;
    }
    UFUNCTION()
    void HandleCampusItemSelected(const bool bSelected)
    {
        if (this.UI_Common_Key_Text != nullptr)
        {
            if (bSelected)
            {
            }
            else
            {
            }
            this.UI_Common_Key_Text.SetInputTableRowAction();
        }
        return;
    }
    UFUNCTION()
    void HandleCampusItemCanMatch(const bool bCanMatch)
    {
        if (this.Join != nullptr)
        {
            FSlateColor local_8;
            if (bCanMatch)
            {
            }
            else
            {
            }
            this.Join.SetBrushTintColor(local_8);
        }
        if (this.Join_1 != nullptr)
        {
            FSlateColor local_8;
            if (bCanMatch)
            {
            }
            else
            {
            }
            this.Join_1.SetBrushTintColor(local_8);
        }
        if (this.w_txt_num != nullptr)
        {
            if (bCanMatch)
            {
            }
            else
            {
            }
            this.w_txt_num.SetColor();
        }
        if (this.w_txt_numSelection != nullptr)
        {
            if (bCanMatch)
            {
            }
            else
            {
            }
            this.w_txt_numSelection.SetColor();
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_PVX_Match_CampusItem& local_6;
        TEUIModelRef<FVM_PVX_Match_CampusItem> local_2 = this.PVX_Match_CampusItem.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.PVX_Match_CampusItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_PVX_Match_CampusItem::__IndexOf_bSelected());
                    }
                    if (local_6)
                    {
                        this.HandleCampusItemSelected(local_6.GetbSelected());
                    }
                    this.PVX_Match_CampusItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_PVX_Match_CampusItem::__IndexOf_bCanMatch());
                    }
                    if (local_6)
                    {
                        this.HandleCampusItemCanMatch(local_6.GetbCanMatch());
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
                XError(ELog(17), "Remaining observed model change: HandleCampusItemSelected");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandleCampusItemCanMatch");
            }
            return;
        }
        this.__PVX_Match_CampusItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PVX_Match_CampusItem.Initialize(this, FName("VM_PVX_Match_CampusItem"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PVX_Match_CampusItemDelegate.IsBound())
        {
            this.PVX_Match_CampusItem.SetRef(this.PVX_Match_CampusItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PVX_Match_CampusItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleCampusItemSelected"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleCampusItemCanMatch"));
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
