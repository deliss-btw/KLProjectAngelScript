
namespace UWidget_TeamPanel
{
    const int ViewID = 0;

}
class UWidget_TeamPanel : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_TeamPanel> TeamPanel;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_LinkSkillInfo> LinkSkillInfo;
    UPROPERTY()
    UTextBlock LinkEnergyText;
    UPROPERTY()
    UImage LinkEnergyImage;
    UPROPERTY()
    UProgressBar ProgressBar_BuffTimer;
    UPROPERTY()
    UProgressBar ProgressBar_BuffTimer_BG;
    UPROPERTY()
    UProgressBar ProgressBar_LinkEnergy;
    UPROPERTY()
    UProgressBar ProgressBar_DivineBurst;
    UPROPERTY()
    UEUICanvasPanel TeamCanvasPanel;
    UPROPERTY()
    UEUICanvasPanel DivineBurstEffectPanel;
    UPROPERTY()
    float BuffTimer;
    UPROPERTY()
    float BuffDuration;
    UPROPERTY()
    bool HasBuff;
    FEUIModelWeakRef __TeamPanel;

    UWidget_TeamPanel()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        FECSEntity local_10 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        FVMS_TeamPanel local_2;
        bool local_12 = local_2.GetTeamInfoList().IsEmpty();
        if (local_12)
        {
            this.TeamCanvasPanel.SetVisibility(ESlateVisibility(2));
            return;
        }
        this.TeamCanvasPanel.SetVisibility(ESlateVisibility(0));
        float local_20 = ECS::GetContextTime().ToSeconds();
        if (this.BuffTimer > local_20)
        {
            float local_16 = (this.BuffTimer - local_20) / this.BuffDuration;
            this.ProgressBar_DivineBurst.SetPercent(float32(local_16));
            if (this.HasBuff)
            {
                local_16 = this.BuffTimer - local_20;
                this.ProgressBar_LinkEnergy.SetPercent(float32((local_16 / this.BuffDuration)));
            }
        }
        return;
    }
    UFUNCTION()
    void OnExecuteBuffStateChanged(const bool bHasExecuteBuff, const float InBuffDuration, const int Stack, const float32 TeamLinkEnergy)
    {
        this.HasBuff = bHasExecuteBuff;
        if (bHasExecuteBuff)
        {
            this.LinkEnergyText.SetText(NSLOCTEXT("TeamPanel", "TeamPanel_DivineBurst", "зҐћж јз€†еЏ‘пјЃ"));
            this.ProgressBar_DivineBurst.SetVisibility(ESlateVisibility(0));
            this.ProgressBar_LinkEnergy.SetFillColorAndOpacity(FLinearColor(1.0f, 0.4f, 0.7f, 1.0f));
            this.DivineBurstEffectPanel.SetVisibility(ESlateVisibility(0));
            this.LinkEnergyText.SetColorAndOpacity(FSlateColor(FLinearColor(1.0f, 0.9f, 0.6f, 1.0f)));
            this.BuffDuration = InBuffDuration;
            this.BuffTimer = (ECS::GetContextTime().ToSeconds() + this.BuffDuration);
            return;
        }
        this.UpdateLinkEnergyUIPanel(TeamLinkEnergy);
        this.ProgressBar_DivineBurst.SetVisibility(ESlateVisibility(2));
        this.DivineBurstEffectPanel.SetVisibility(ESlateVisibility(2));
        return;
    }
    UFUNCTION()
    void UpdateLinkEnergy(const float32 TeamLinkEnergy)
    {
        return;
    }
    void UpdateLinkEnergyUIPanel(const float32 TeamLinkEnergy)
    {
        FText local_6;
        FText::AsNumber(uint(TeamLinkEnergy), local_6);
        this.LinkEnergyText.SetText(FText::Format(NSLOCTEXT("TeamPanel", "TeamPanel_SyncEnergy", "SYNC {0}%"), local_6));
        this.LinkEnergyText.SetColorAndOpacity(FSlateColor(this.GetUIColor(TeamLinkEnergy)));
        this.LinkEnergyImage.SetColorAndOpacity(this.GetUIColor(TeamLinkEnergy));
        this.ProgressBar_LinkEnergy.SetPercent(TeamLinkEnergy / 100.0f);
        this.ProgressBar_LinkEnergy.SetFillColorAndOpacity(this.GetUIColor(TeamLinkEnergy));
        return;
    }
    FLinearColor GetUIColor(const float32 TeamLinkEnergy)
    {
        if (TeamLinkEnergy <= 33.0f)
        {
            return FLinearColor(1.0f, 1.0f, 1.0f, 1.0f);
        }
        else
        {
            if (TeamLinkEnergy <= 66.0f)
            {
                return FLinearColor(1.0f, 0.9f, 0.35f, 1.0f);
            }
            else
            {
                if (TeamLinkEnergy <= 99.0f)
                {
                    return FLinearColor(1.0f, 0.6f, 0.35f, 1.0f);
                }
                else
                {
                    return FLinearColor(1.0f, 0.4f, 0.35f, 1.0f);
                }
            }
        }
    }
    UFUNCTION()
    float32 TeamPanel_TeamLinkEnergy() const
    {
        FVMS_TeamPanel& local_2;
        return local_2 ? local_2.GetTeamLinkEnergy() : 0.0f;
    }
    UFUNCTION()
    float32 TeamPanel_TeamLinkEnergyRatio() const
    {
        FVMS_TeamPanel& local_2;
        return local_2 ? local_2.GetTeamLinkEnergyRatio() : 0.0f;
    }
    UFUNCTION()
    bool TeamPanel_bCanLeaveTeam() const
    {
        FVMS_TeamPanel& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbCanLeaveTeam();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> TeamPanel_TeamInfoList() const
    {
        FVMS_TeamPanel& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetTeamInfoList());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void TeamPanel_OnLeaveTeam() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    FEUIModelRef LinkSkillInfo_VM_LinkSkillButton() const
    {
        FVMS_LinkSkillInfo& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_LinkSkillButton() : FEUIModelRef();
        return local_8;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_TeamPanel& local_6;
        TEUIModelRef<FVMS_TeamPanel> local_2 = this.TeamPanel.AsRef();
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
                    this.TeamPanel.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_TeamPanel::__IndexOf_bHasExecuteBuff());
                        local_6.TrackPropertyRead(::FVMS_TeamPanel::__IndexOf_BuffDuration());
                        local_6.TrackPropertyRead(::FVMS_TeamPanel::__IndexOf_Stack());
                        local_6.TrackPropertyRead(::FVMS_TeamPanel::__IndexOf_TeamLinkEnergy());
                    }
                    if (local_6)
                    {
                        int local_58 = local_6.GetStack();
                        this.OnExecuteBuffStateChanged(local_6.GetbHasExecuteBuff(), int(local_6.GetBuffDuration()), int(local_6.GetTeamLinkEnergy()));
                    }
                    this.TeamPanel.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_TeamPanel::__IndexOf_TeamLinkEnergy());
                    }
                    if (local_6)
                    {
                        this.UpdateLinkEnergy(int(local_6.GetTeamLinkEnergy()));
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
                XError(ELog(17), "Remaining observed model change: OnExecuteBuffStateChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: UpdateLinkEnergy");
            }
            return;
        }
        this.__TeamPanel = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TeamPanel.Initialize(this, FName("VMS_TeamPanel"), EEUIWidgetRefModelCreationType(0), false);
        this.LinkSkillInfo.Initialize(this, FName("VMS_LinkSkillInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_TeamPanel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnExecuteBuffStateChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("UpdateLinkEnergy"));
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
