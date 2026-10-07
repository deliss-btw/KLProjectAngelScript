
namespace UWidget_CommissionLeaderBoardPlayer
{
    const int ViewID = 0;

}
class UWidget_CommissionLeaderBoardPlayer : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionLeaderboardPlayer> LeaderboardPlayer;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerBasicItem> PlayerBasicItem;
    FEUIModelWeakRef __LeaderboardPlayer;
    UPROPERTY()
    FGetEUIModelRef LeaderboardPlayerDelegate;
    UPROPERTY()
    FGetEUIModelRef PlayerBasicItemDelegate;

    UWidget_CommissionLeaderBoardPlayer()
    {
        return;
    }
    UFUNCTION()
    void OnPlayerModelChanged()
    {
        this.PlayerBasicItem = this.LeaderboardPlayer.opArrow().GetPlayerBasicItem().opImplConv();
        return;
    }
    UFUNCTION()
    void LeaderboardPlayer_OnClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void LeaderboardPlayer_OnGamepadSelect() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommissionLeaderboardPlayer& local_6;
        TEUIModelRef<FVM_CommissionLeaderboardPlayer> local_2 = this.LeaderboardPlayer.AsRef();
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
                    this.LeaderboardPlayer.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommissionLeaderboardPlayer::__IndexOf_PlayerModel());
                    }
                    if (local_6)
                    {
                        this.OnPlayerModelChanged();
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
                XError(ELog(17), "Remaining observed model change: OnPlayerModelChanged");
            }
            return;
        }
        this.__LeaderboardPlayer = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LeaderboardPlayer.Initialize(this, FName("VM_CommissionLeaderboardPlayer"), EEUIWidgetRefModelCreationType(0), false);
        this.PlayerBasicItem.Initialize(this, FName("VM_PlayerBasicItem"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.LeaderboardPlayerDelegate.IsBound())
        {
            this.LeaderboardPlayer.SetRef(this.LeaderboardPlayerDelegate.Execute());
        }
        if (this.PlayerBasicItemDelegate.IsBound())
        {
            this.PlayerBasicItem.SetRef(this.PlayerBasicItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionLeaderBoardPlayer
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnPlayerModelChanged"));
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
