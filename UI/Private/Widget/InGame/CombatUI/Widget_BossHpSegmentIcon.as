
namespace UWidget_BossHpSegmentIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_BossHpSegmentIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BossHpSegmentIcon> SegmentIcon;
    UPROPERTY()
    UWidgetAnimation Anim_IconDeactive;
    UPROPERTY()
    bool bLastIconActive;
    FEUIModelWeakRef __SegmentIcon;
    UPROPERTY()
    FGetEUIModelRef SegmentIconDelegate;

    UWidget_BossHpSegmentIcon()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (!(this.SegmentIcon.IsValid()))
        {
            return;
        }
        this.bLastIconActive = GetbInitIconActive();
        if (GetbInitIconActive())
        {
            this.PlayAnimation(this.Anim_IconDeactive, this.Anim_IconDeactive.GetEndTime(), 1, EUMGSequencePlayMode(1), 1.0f, false);
            return;
        }
        this.PlayAnimation(this.Anim_IconDeactive, this.Anim_IconDeactive.GetEndTime(), 1, EUMGSequencePlayMode(0), 1.0f, false);
        return;
    }
    UFUNCTION()
    void HandleIconActiveChanged(const bool bIconActive)
    {
        if (!(this.bLastIconActive) == !(bIconActive))
        {
            return;
        }
        this.bLastIconActive = bIconActive;
        if (bIconActive)
        {
            this.PlayAnimation(this.Anim_IconDeactive, this.Anim_IconDeactive.GetEndTime(), 1, EUMGSequencePlayMode(1), 1.0f, false);
            return;
        }
        this.PlayAnimationForward(this.Anim_IconDeactive, 1.0f, false);
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_BossHpSegmentIcon& local_6;
        TEUIModelRef<FVM_BossHpSegmentIcon> local_2 = this.SegmentIcon.AsRef();
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
                    this.SegmentIcon.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_BossHpSegmentIcon::__IndexOf_bIconActive());
                    }
                    if (local_6)
                    {
                        this.HandleIconActiveChanged(local_6.GetbIconActive());
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
                XError(ELog(17), "Remaining observed model change: HandleIconActiveChanged");
            }
            return;
        }
        this.__SegmentIcon = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SegmentIcon.Initialize(this, FName("VM_BossHpSegmentIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SegmentIconDelegate.IsBound())
        {
            this.SegmentIcon.SetRef(this.SegmentIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_BossHpSegmentIcon
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleIconActiveChanged"));
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
