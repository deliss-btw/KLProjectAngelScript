
namespace UWidget_LocalPlayerUid
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_LocalPlayerUid : UEUIUserWidget
{
    UPROPERTY()
    UEUIFormatTextBlock w_formatTxt_UID;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_LocalPlayerUid> PlayerUid;
    FEUIModelWeakRef __PlayerUid;
    UPROPERTY()
    FGetEUIModelRef PlayerUidDelegate;

    UWidget_LocalPlayerUid()
    {
        return;
    }
    UFUNCTION()
    void RefreshUid(const uint Value)
    {
        FString local_8 = (FString("") + Value);
        FString local_12;
        FText::FromString(local_12);
        this.w_formatTxt_UID.SetArgument(local_12, "0");
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_LocalPlayerUid& local_6;
        TEUIModelRef<FVMS_LocalPlayerUid> local_2 = this.PlayerUid.AsRef();
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
                    this.PlayerUid.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_LocalPlayerUid::__IndexOf_LocalPlayerUid());
                    }
                    if (local_6)
                    {
                        this.RefreshUid(local_6.GetLocalPlayerUid());
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
                XError(ELog(17), "Remaining observed model change: RefreshUid");
            }
            return;
        }
        this.__PlayerUid = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PlayerUid.Initialize(this, FName("VMS_LocalPlayerUid"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PlayerUidDelegate.IsBound())
        {
            this.PlayerUid.SetRef(this.PlayerUidDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_LocalPlayerUid
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("RefreshUid"));
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
