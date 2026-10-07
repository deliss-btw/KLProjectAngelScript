
namespace UWidget_ExitLevel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ExitLevel : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ExitLevel> ExitLevel;
    UPROPERTY()
    FEUIActionBinding ExitLevelAction;
    FEUIModelWeakRef __ExitLevel;

    UWidget_ExitLevel()
    {
        return;
    }
    UFUNCTION()
    void OnWillAutoLeaveLevelChanged(const bool bWillAutoLeaveLevel)
    {
        if (bWillAutoLeaveLevel)
        {
            this.ExitLevelAction.Register(this);
            return;
        }
        this.ExitLevelAction.UnRegister();
        return;
    }
    UFUNCTION()
    void ExitLevel_OnClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_ExitLevel& local_6;
        TEUIModelRef<FVMS_ExitLevel> local_2 = this.ExitLevel.AsRef();
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
                    this.ExitLevel.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_ExitLevel::__IndexOf_bWillAutoLeaveLevel());
                    }
                    if (local_6)
                    {
                        this.OnWillAutoLeaveLevelChanged(local_6.GetbWillAutoLeaveLevel());
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
                XError(ELog(17), "Remaining observed model change: OnWillAutoLeaveLevelChanged");
            }
            return;
        }
        this.__ExitLevel = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ExitLevel.Initialize(this, FName("VMS_ExitLevel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_ExitLevel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnWillAutoLeaveLevelChanged"));
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
