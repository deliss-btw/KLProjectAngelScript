
namespace UWidget_Crossbow
{
    const int ViewID = 0;

}
class UWidget_Crossbow : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_Crossbow> Crossbow;
    UPROPERTY()
    UTextBlock ArrowNum;
    FEUIModelWeakRef __Crossbow;

    UWidget_Crossbow()
    {
        return;
    }
    UFUNCTION()
    void ChangeText(const int ItemNumber)
    {
        FString local_8 = (FString("") + ItemNumber);
        FString local_4 = (local_8 + " / 10");
        this.ArrowNum.SetText(FText::FromString(local_4));
        return;
    }
    UFUNCTION()
    ESlateVisibility Crossbow_SlateVisibilityPanelVisible() const
    {
        FVMS_Crossbow& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.PanelVisibleAsSlateVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_Crossbow& local_6;
        TEUIModelRef<FVMS_Crossbow> local_2 = this.Crossbow.AsRef();
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
                    this.Crossbow.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_Crossbow::__IndexOf_ItemNumber());
                    }
                    if (local_6)
                    {
                        this.ChangeText(local_6.GetItemNumber());
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
                XError(ELog(17), "Remaining observed model change: ChangeText");
            }
            return;
        }
        this.__Crossbow = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Crossbow.Initialize(this, FName("VMS_Crossbow"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_Crossbow
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("ChangeText"));
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
