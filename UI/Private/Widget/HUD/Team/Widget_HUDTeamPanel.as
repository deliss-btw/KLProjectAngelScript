
namespace UWidget_HUDTeamPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_HUDTeamPanel : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeamPanel> TeamPanel;
    UPROPERTY()
    UWidgetAnimation Anim_LB_Pressed;
    UPROPERTY()
    UWidgetAnimation Anim_LB_Released;
    UPROPERTY()
    UWidget BtnsList;
    UPROPERTY()
    UWidget TeammerList;
    FEUIModelWeakRef __TeamPanel;
    UPROPERTY()
    FGetEUIModelRef TeamPanelDelegate;

    UWidget_HUDTeamPanel()
    {
        return;
    }
    UFUNCTION()
    void OnGamepadLeftShoulderPressChanged(const bool bGamepadLeftShoulderPress)
    {
        if ((this.Anim_LB_Pressed == nullptr || ((this.Anim_LB_Released == nullptr))))
        {
            return;
        }
        if (bGamepadLeftShoulderPress)
        {
            this.StopAnimation(this.Anim_LB_Released);
            this.PlayAnimation(this.Anim_LB_Pressed, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            return;
        }
        this.StopAnimation(this.Anim_LB_Pressed);
        this.PlayAnimation(this.Anim_LB_Released, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        NotifyShoulderReleased();
        return;
    }
    UFUNCTION()
    void OnTriggerLeftShoulderPress()
    {
        1.SetbGamepadLeftShoulderPress();
        return;
    }
    UFUNCTION()
    void OnTriggerLeftShoulderRelease()
    {
        0.SetbGamepadLeftShoulderPress();
        return;
    }
    UFUNCTION()
    bool HasAnyTeamOperatorBtns() const
    {
        if (!(this.TeamPanel.IsValid()))
        {
            return false;
        }
        return (GetTeamOperatorBtns().Num() > 0);
    }
    UFUNCTION()
    bool HasAnyOtherTeammer() const
    {
        if (!(this.TeamPanel.IsValid()))
        {
            return false;
        }
        return (GetDisplayingTeammates().Num() > 1);
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
        FVM_TeamPanel& local_6;
        TEUIModelRef<FVM_TeamPanel> local_2 = this.TeamPanel.AsRef();
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
                    this.TeamPanel.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TeamPanel::__IndexOf_bGamepadLeftShoulderPress());
                    }
                    if (local_6)
                    {
                        this.OnGamepadLeftShoulderPressChanged(local_6.GetbGamepadLeftShoulderPress());
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
                XError(ELog(17), "Remaining observed model change: OnGamepadLeftShoulderPressChanged");
            }
            return;
        }
        this.__TeamPanel = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TeamPanel.Initialize(this, FName("VM_TeamPanel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TeamPanelDelegate.IsBound())
        {
            this.TeamPanel.SetRef(this.TeamPanelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_HUDTeamPanel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnGamepadLeftShoulderPressChanged"));
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
