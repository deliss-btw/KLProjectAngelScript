
namespace UWidget_PVX_Match
{
    const int ViewID = 0;

}
class UWidget_PVX_Match : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVX_Match> PVX_Match;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeamPanel> TeamPanel;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarShowcase> Showcase;
    UPROPERTY()
    FEUIInputActionDataRow StartMatchIARow;
    UPROPERTY()
    FEUIInputActionDataRow CancelMatchIARow;
    UPROPERTY()
    FEUIActionBinding MatchActionBinding;
    UPROPERTY()
    UWidget_PVX_Match_CampusItem UI_PVX_Campus_People;
    UPROPERTY()
    UWidget_PVX_Match_CampusItem UI_PVX_Campus_Monster;
    UPROPERTY()
    FEUIActionBinding BackActionBinding;
    UPROPERTY()
    FConfigVM_PVX_Match PVX_MatchConfig;
    UPROPERTY()
    FConfigVM_AvatarShowcase ShowcaseConfig;
    FEUIModelWeakRef __PVX_Match;
    UPROPERTY()
    FGetEUIModelRef PVX_MatchDelegate;
    UPROPERTY()
    FGetEUIModelRef TeamPanelDelegate;
    UPROPERTY()
    FGetEUIModelRef ShowcaseDelegate;

    UWidget_PVX_Match()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.BackActionBinding.Register(this);
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        this.BackActionBinding.UnRegister();
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        TEUIModelRef<FVM_TeamPanel> local_2;
        local_2.Setup();
        this.ApplyMatchActionDisabled();
        TEUIModelRef<FVM_AvatarShowcase> local_4;
        local_4;
        local_4.SetCurrentShowcase();
        return;
    }
    UFUNCTION()
    void HandlePVXMatchChage(const bool bMatching)
    {
        if (bMatching)
        {
        }
        else
        {
        }
        this.MatchActionBinding.SetInputAction();
        this.ApplyMatchActionDisabled();
        if (this.UI_PVX_Campus_People != nullptr)
        {
            bool local_3 = !(bMatching);
            this.UI_PVX_Campus_People.SetIsEnabled(local_3);
        }
        if (this.UI_PVX_Campus_Monster != nullptr)
        {
            this.UI_PVX_Campus_Monster.SetIsEnabled(!(bMatching));
        }
        return;
    }
    UFUNCTION()
    void HandlePVXOpenPeriodChange(const bool bInOpenPeriod)
    {
        this.ApplyMatchActionDisabled();
        return;
    }
    void ApplyMatchActionDisabled()
    {
        bool local_1;
        bool local_3;
        local_1 = GetbInOpenPeriod();
        local_3 = GetbMatching();
        this.MatchActionBinding.SetDisabled(!(local_1) && !(local_3));
        return;
    }
    UFUNCTION()
    void OnBackAction()
    {
        FEUIWidgetRef local_4 = FEUIWidget::FindWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_Mode_PVX_Match);
        if (local_4)
        {
            FEUIWidget::RemoveWidget(local_4);
        }
        return;
    }
    UFUNCTION()
    void PVX_Match_LeaveTeam() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PVX_Match_OnMatchActionConfirm() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TeamPanel_InviteTeam() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TeamPanel_InviteTeamIntoDS() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TeamPanel_LeaveTeam() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_PVX_Match& local_6;
        TEUIModelRef<FVM_PVX_Match> local_2 = this.PVX_Match.AsRef();
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
                    this.PVX_Match.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_PVX_Match::__IndexOf_bMatching());
                    }
                    if (local_6)
                    {
                        this.HandlePVXMatchChage(local_6.GetbMatching());
                    }
                    this.PVX_Match.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_PVX_Match::__IndexOf_bInOpenPeriod());
                    }
                    if (local_6)
                    {
                        this.HandlePVXOpenPeriodChange(local_6.GetbInOpenPeriod());
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
                XError(ELog(17), "Remaining observed model change: HandlePVXMatchChage");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandlePVXOpenPeriodChange");
            }
            return;
        }
        this.__PVX_Match = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PVX_Match.Initialize(this, FName("VM_PVX_Match"), EEUIWidgetRefModelCreationType(0), false);
        this.TeamPanel.Initialize(this, FName("VM_TeamPanel"), EEUIWidgetRefModelCreationType(0), false);
        this.Showcase.Initialize(this, FName("VM_AvatarShowcase"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PVX_MatchDelegate.IsBound())
        {
            this.PVX_Match.SetRef(this.PVX_MatchDelegate.Execute());
        }
        if (this.TeamPanelDelegate.IsBound())
        {
            this.TeamPanel.SetRef(this.TeamPanelDelegate.Execute());
        }
        if (this.ShowcaseDelegate.IsBound())
        {
            this.Showcase.SetRef(this.ShowcaseDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PVX_Match
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandlePVXMatchChage"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandlePVXOpenPeriodChange"));
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
