
namespace UWidget_ItemFeature_EquipMark
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemFeature_EquipMark : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemFeature_EquipMark> EquipMarkFeature;
    UPROPERTY()
    UEUIFormatTextBlock w_formatTxt_level;
    FEUIModelWeakRef __EquipMarkFeature;
    UPROPERTY()
    FGetEUIModelRef EquipMarkFeatureDelegate;

    UWidget_ItemFeature_EquipMark()
    {
        return;
    }
    UFUNCTION()
    void RefreshLimitCount()
    {
        if (this.w_formatTxt_level != nullptr)
        {
            FString local_18;
            int local_9 = this.EquipMarkFeature.opArrow().GetLimitCount();
            FString local_14 = (FString("") + local_9);
            FText::FromString(local_18);
            this.w_formatTxt_level.SetArgument(local_18, "0");
        }
        return;
    }
    UFUNCTION()
    void EquipMarkFeature_OnItemSelect() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_ItemFeature_EquipMark& local_6;
        TEUIModelRef<FVM_ItemFeature_EquipMark> local_2 = this.EquipMarkFeature.AsRef();
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
                    this.EquipMarkFeature.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_ItemFeature_EquipMark::__IndexOf_LimitCount());
                    }
                    if (local_6)
                    {
                        this.RefreshLimitCount();
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
                XError(ELog(17), "Remaining observed model change: RefreshLimitCount");
            }
            return;
        }
        this.__EquipMarkFeature = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.EquipMarkFeature.Initialize(this, FName("VM_ItemFeature_EquipMark"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EquipMarkFeatureDelegate.IsBound())
        {
            this.EquipMarkFeature.SetRef(this.EquipMarkFeatureDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemFeature_EquipMark
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("RefreshLimitCount"));
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
