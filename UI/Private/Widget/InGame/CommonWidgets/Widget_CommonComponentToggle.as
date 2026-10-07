
namespace UWidget_CommonComponentToggle
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonComponentToggle : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonComponentToggle> ComponentToggle;
    UPROPERTY()
    UEUIDynamicEntryBox w_entry_mult;
    FEUIModelWeakRef __ComponentToggle;
    UPROPERTY()
    FGetEUIModelRef ComponentToggleDelegate;

    UWidget_CommonComponentToggle()
    {
        return;
    }
    UFUNCTION()
    void OnMouseLeave_Implementation(const FPointerEvent &inout MouseEvent)
    {
        if (GetRightArrowEnabled())
        {
        }
        else
        {
        }
        SetRightArrowHoverState();
        if (GetLeftArrowEnabled())
        {
        }
        else
        {
        }
        SetLeftArrowHoverState();
        0.SetBtnHoverState();
        return;
    }
    UFUNCTION()
    void OnMouseEnter_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        1.SetBtnHoverState();
        return;
    }
    UFUNCTION()
    void GenerateEntryDataList()
    {
        if (GetMultipleSelectionState() == 1)
        {
            TArray<FEUIDynamicWidgetData> local_8;
            int local_9 = 0;
            for (; local_9 < GetOptionTexts().Num(); )
            {
                FEUIDynamicWidgetData local_34;
                FEUIModelContainer local_48;
                local_34.ModelContainer = local_48;
                local_8.Add(local_34);
                ++local_9;
            }
            this.w_entry_mult.SetEntryDataList(local_8);
        }
        return;
    }
    UFUNCTION()
    void OnSelectedIndexChanged()
    {
        float32 local_10;
        if (GetMultipleSelectionState() == 0)
        {
            return;
        }
        TArray<UUserWidget> local_8 = this.w_entry_mult.GetAllEntries();
        int local_9 = 0;
        for (; local_9 < local_8.Num(); )
        {
            if (local_9 == GetCurrentSelectedIndex())
            {
                local_10 = 1.0f;
            }
            else
            {
                local_10 = 0.3f;
            }
            local_8[local_9].SetRenderOpacity(local_10);
            ++local_9;
        }
        return;
    }
    UFUNCTION()
    void ComponentToggle_IncreaseCurrentSelectedIndex() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ComponentToggle_DecreaseCurrentSelectedIndex() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommonComponentToggle& local_6;
        TEUIModelRef<FVM_CommonComponentToggle> local_2 = this.ComponentToggle.AsRef();
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
                    this.ComponentToggle.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommonComponentToggle::__IndexOf_OptionTexts());
                    }
                    if (local_6)
                    {
                        this.GenerateEntryDataList();
                    }
                    this.ComponentToggle.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommonComponentToggle::__IndexOf_CurrentSelectedIndex());
                    }
                    if (local_6)
                    {
                        this.OnSelectedIndexChanged();
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
                XError(ELog(17), "Remaining observed model change: GenerateEntryDataList");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnSelectedIndexChanged");
            }
            return;
        }
        this.__ComponentToggle = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ComponentToggle.Initialize(this, FName("VM_CommonComponentToggle"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ComponentToggleDelegate.IsBound())
        {
            this.ComponentToggle.SetRef(this.ComponentToggleDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonComponentToggle
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("GenerateEntryDataList"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedIndexChanged"));
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
