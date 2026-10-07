
namespace UWidget_BossHpBar
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_BossHpBar : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_BossHpBar> BossHpBar;
    UPROPERTY()
    UCanvasPanel ExecutionSegmentContainer;
    UPROPERTY()
    UWidgetAnimation Anim_StartTheCountdown;
    UPROPERTY()
    UWidgetAnimation Anim_EnterTheNormal;
    UPROPERTY()
    UWidgetAnimation Anim_NearDeath;
    UPROPERTY()
    TSubclassOf<UWidget_ExecutionSegment> ExecutionSegmentClass;
    UPROPERTY()
    TArray<UWidget_ExecutionSegment> ExecutionSegments;
    FEUIModelWeakRef __BossHpBar;

    UWidget_BossHpBar()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.SetTickAnimationsWhenHidden(true);
        return;
    }
    UFUNCTION()
    void HandlePostureBarSegmentChanged(const TArray<float32> &inout PosturePhaseList)
    {
        UWidget_ExecutionSegment local_14;
        int local_2 = PosturePhaseList.Num();
        if (this.ExecutionSegments.Num() < local_2)
        {
            APlayerController local_6 = Gameplay::GetPlayerController(__GetWorldContext(), 0);
            int local_12 = 0;
            for (; local_12 < (PosturePhaseList.Num() - this.ExecutionSegments.Num()); )
            {
                local_14 = Cast<UWidget_ExecutionSegment>(WidgetBlueprint::CreateWidget(__GetWorldContext(), this.ExecutionSegmentClass, local_6));
                UCanvasPanelSlot local_20 = this.ExecutionSegmentContainer.AddChildToCanvas(local_14);
                local_20.SetAnchors(FAnchors(0.0f, 0.0f, 1.0f, 1.0f));
                local_20.SetPosition(FVector2D::ZeroVector);
                local_20.SetOffsets(FMargin(0.0f, 0.0f, 0.0f, 0.0f));
                this.ExecutionSegments.Add(local_14);
                ++local_12;
            }
        }
        int local_12_2 = 0;
        for (; local_12_2 < this.ExecutionSegments.Num(); ++local_12_2)
        {
            if (local_12_2 < PosturePhaseList.Num())
            {
                local_14.SetVisibility(ESlateVisibility(4));
                local_14.SegmentSlideRatio = PosturePhaseList[local_12_2];
                continue;
            }
            local_14.SetVisibility(ESlateVisibility(1));
        }
        return;
    }
    UFUNCTION()
    void HandleCachedVisibilityChanged(const ESlateVisibility CachedVisibility)
    {
        if ((int(CachedVisibility) == 1 || (int(CachedVisibility) == 2)))
        {
            return;
        }
        this.PlayFadeIn(0.0f);
        return;
    }
    UFUNCTION()
    void HandleExecutedStateChanged(const int ExecutedState)
    {
        if (ExecutedState == 1)
        {
            this.PlayAnimationForward(this.Anim_StartTheCountdown, 1.0f, true);
            return;
        }
        if (ExecutedState == 0)
        {
            this.PlayAnimationForward(this.Anim_EnterTheNormal, 1.0f, true);
        }
        return;
    }
    UFUNCTION()
    void HandleLowHpTipsVisibilityChanged(const ESlateVisibility BossLowHpTipsVisibility)
    {
        if ((!((this.Anim_NearDeath != nullptr))))
        {
            return;
        }
        if (int(BossLowHpTipsVisibility) == 1)
        {
            this.PlayAnimation(this.Anim_NearDeath, this.Anim_NearDeath.GetEndTime(), 1, EUMGSequencePlayMode(1), 1.0f, false);
            return;
        }
        this.PlayAnimationForward(this.Anim_NearDeath, 1.0f, false);
        return;
    }
    UFUNCTION()
    TEUIModelRef<FVM_BuffInfo> BossHpBar_VM_BuffInfo() const
    {
        FVMS_BossHpBar& local_2;
        TEUIModelRef<FVM_BuffInfo> local_10;
        if (local_2)
        {
            local_10 = local_2.GetVM_BuffInfo();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_BuffInfo>();
        }
        return local_10;
    }
    UFUNCTION()
    FText BossHpBar_BossDisplayName() const
    {
        FVMS_BossHpBar& local_2;
        FText local_12 = local_2 ? local_2.GetBossDisplayName() : FText();
        return local_12;
    }
    UFUNCTION()
    float32 BossHpBar_DisplayHpBarRatio() const
    {
        FVMS_BossHpBar& local_2;
        return local_2 ? local_2.GetDisplayHpBarRatio() : 0.0f;
    }
    UFUNCTION()
    float32 BossHpBar_DisplayPreviewHpBarRatio() const
    {
        FVMS_BossHpBar& local_2;
        return local_2 ? local_2.GetDisplayPreviewHpBarRatio() : 0.0f;
    }
    UFUNCTION()
    float32 BossHpBar_PostureBarRatio() const
    {
        FVMS_BossHpBar& local_2;
        return local_2 ? local_2.GetPostureBarRatio() : 0.0f;
    }
    UFUNCTION()
    TArray<FEUIDynamicWidgetData> BossHpBar_BuffDataList() const
    {
        FVMS_BossHpBar& local_2;
        TArray<FEUIDynamicWidgetData> local_12;
        if (local_2)
        {
            local_12 = local_2.GetBuffDataList();
        }
        else
        {
            local_12 = TArray<FEUIDynamicWidgetData>();
        }
        return local_12;
    }
    UFUNCTION()
    ESlateVisibility BossHpBar_BossHpBarVisibility() const
    {
        FVMS_BossHpBar& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.BossHpBarVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_BossHpBar& local_6;
        TEUIModelRef<FVMS_BossHpBar> local_2 = this.BossHpBar.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.BossHpBar.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_BossHpBar::__IndexOf_PosturePhaseList());
                }
                if (local_6)
                {
                    this.HandlePostureBarSegmentChanged(local_6.GetPosturePhaseList());
                }
                break;
            }
            case 1:
            {
                this.BossHpBar.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_BossHpBar::__IndexOf_CachedVisibility());
                }
                if (local_6)
                {
                    this.HandleCachedVisibilityChanged(local_6.GetCachedVisibility());
                }
                break;
            }
            case 2:
            {
                this.BossHpBar.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_BossHpBar::__IndexOf_ExecutedState());
                }
                if (local_6)
                {
                    this.HandleExecutedStateChanged(local_6.GetExecutedState());
                }
                break;
            }
            case 3:
            {
                this.BossHpBar.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_BossHpBar::__IndexOf_BossLowHpTipsVisibility());
                }
                if (local_6)
                {
                    this.HandleLowHpTipsVisibilityChanged(local_6.GetBossLowHpTipsVisibility());
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
                XError(ELog(17), "Remaining observed model change: HandlePostureBarSegmentChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandleCachedVisibilityChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: HandleExecutedStateChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: HandleLowHpTipsVisibilityChanged");
            }
            return;
        }
        this.__BossHpBar = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.BossHpBar.Initialize(this, FName("VMS_BossHpBar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_BossHpBar
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandlePostureBarSegmentChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleCachedVisibilityChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleExecutedStateChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleLowHpTipsVisibilityChanged"));
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
