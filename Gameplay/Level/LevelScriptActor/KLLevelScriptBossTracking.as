

class AKLLevelScriptBossTracking : AKLLevelScriptBaseActor
{
    UPROPERTY()
    float32 HideIconDelaySeconds = 3.0f;
    UPROPERTY()
    float32 DiscoverDistance = 3000.0f;
    UPROPERTY()
    float32 DiscoverCheckInterval = 0.5f;
    UPROPERTY()
    float32 TrackingAreaFallbackRadius = 5000.0f;
    FLevelTimerCallback HideIconTimer;
    FLevelTimerCallback DiscoverCheckTimer;
    bool bBossDiscovered = false;
    bool bTrackingActive = false;


    UFUNCTION()
    void ECSBeginPlayBP_Implementation()
    {
        if (!(::BlueprintFunctions_BossTracking::BossTracking_IsBossTrackingRule()))
        {
            XLog(ELog(22), "BossTracking LBP: not BossTracking rule, skip");
            return;
        }
        XLog(ELog(22), FString().Append("BossTracking LBP: ECSBeginPlay, scheduling hide icons in ").Append(this.HideIconDelaySeconds).Append("s"));
        this.HideIconTimer.BindUFunction(this, n"OnHideIconTimerFired");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.HideIconTimer, this.HideIconDelaySeconds, false, -1.0f);
        this.RegisterLevelEventCallback(n"OnFlockStateChanged", FCE_OnFlockStateChangeLevelEvent, ENTITY_NULL);
        return;
    }
    UFUNCTION()
    void OnBossIconsHidden_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnBossDiscovered_Implementation(const FECSEntity &inout DiscoveredBossEntity)
    {
        return;
    }
    UFUNCTION()
    void OnBossChangeAreaStarted_Implementation(const FECSEntity &inout BossEntity, const FECSEntity &inout FlockEntity)
    {
        return;
    }
    UFUNCTION()
    void OnBossChangeAreaFinished_Implementation(const FECSEntity &inout BossEntity, const FECSEntity &inout FlockEntity)
    {
        return;
    }
    UFUNCTION()
    void OnHideIconTimerFired()
    {
        XLog(ELog(22), "BossTracking LBP: hiding commission target minimap icons");
        ::BlueprintFunctions_BossTracking::BossTracking_HideCommissionTargetMinimapIcons();
        this.bTrackingActive = true;
        this.ShowTrackingAreaOnBoss();
        this.StartDiscoverDetection();
        this.OnBossIconsHidden();
        return;
    }
    void ShowTrackingAreaOnBoss()
    {
        TArray<FECSEntity> local_4;
        ::BlueprintFunctions_BossTracking::BossTracking_GetCommissionTargetEntities(local_4);
        if (local_4.Num() == 0)
        {
            XWarning(ELog(22), "BossTracking LBP: no commission targets, cannot show tracking area");
            return;
        }
        Has local_16;
        if (!(FECSEntity(local_4[0]).IsValid()) || !(local_16.opCall()))
        {
            XWarning(ELog(22), "BossTracking LBP: boss entity invalid or missing transform");
            return;
        }
        Get local_28;
        FVector local_24 = local_28.opCall().GetPosition();
        if (!(::BlueprintFunctions_BossTracking::BossTracking_ShowTrackingAreaFromVolume(local_24)))
        {
            XLog(ELog(22), FString().Append("BossTracking LBP: no volume overlaps boss, fallback to radius=").Append(this.TrackingAreaFallbackRadius));
            ::BlueprintFunctions_BossTracking::BossTracking_ShowTrackingArea(local_24, this.TrackingAreaFallbackRadius);
        }
        return;
    }
    void StartDiscoverDetection()
    {
        this.RegisterLevelEventCallback(n"OnBossHitEvent", FCE_HitEvent, ENTITY_NULL);
        this.DiscoverCheckTimer.BindUFunction(this, n"OnDiscoverCheckTick");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.DiscoverCheckTimer, this.DiscoverCheckInterval, true, -1.0f);
        XLog(ELog(22), FString().Append("BossTracking LBP: discover detection started (distance=").Append(this.DiscoverDistance).Append(", interval=").Append(this.DiscoverCheckInterval).Append(")"));
        return;
    }
    void StopDiscoverDetection()
    {
        this.UnregisterLevelEventCallback(n"OnBossHitEvent", FCE_HitEvent, ENTITY_NULL);
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.DiscoverCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.DiscoverCheckTimer);
        }
        XLog(ELog(22), "BossTracking LBP: discover detection stopped");
        return;
    }
    UFUNCTION()
    void OnDiscoverCheckTick()
    {
        if ((this.bBossDiscovered || !(this.bTrackingActive)))
        {
            return;
        }
        FECSEntity local_6;
        if (::BlueprintFunctions_BossTracking::BossTracking_CheckAnyTargetDiscovered(this.DiscoverDistance, local_6))
        {
            this.TriggerBossDiscovered(local_6);
        }
        return;
    }
    UFUNCTION()
    void OnBossHitEvent(const FCE_HitEvent &inout HitEvent)
    {
        if ((this.bBossDiscovered || !(this.bTrackingActive)))
        {
            return;
        }
        if (!(HitEvent.Receiver.IsValid()))
        {
            return;
        }
        if (::CommissionUtils::IsCommissionTarget(HitEvent.Receiver))
        {
            XLog(ELog(22), FString().Append("BossTracking LBP: boss hit detected, attacker=").Append(HitEvent.Attacker.ToString()));
            this.TriggerBossDiscovered(HitEvent.Receiver);
        }
        return;
    }
    void TriggerBossDiscovered(const FECSEntity &inout DiscoveredBossEntity)
    {
        if (this.bBossDiscovered)
        {
            return;
        }
        this.bBossDiscovered = true;
        this.StopDiscoverDetection();
        XLog(ELog(22), FString().Append("BossTracking LBP: Boss discovered! entity=").Append(DiscoveredBossEntity.ToString()));
        ::BlueprintFunctions_BossTracking::BossTracking_ClearTrackingArea();
        ::BlueprintFunctions_BossTracking::BossTracking_ShowCommissionTargetMinimapIcons();
        this.OnBossDiscovered(DiscoveredBossEntity);
        return;
    }
    UFUNCTION()
    void OnFlockStateChanged(const FCE_OnFlockStateChangeLevelEvent &inout Event)
    {
        if (!(this.bTrackingActive) || !(Event.LeaderEntity.IsValid()))
        {
            return;
        }
        if (!(::CommissionUtils::IsCommissionTarget(Event.LeaderEntity)))
        {
            return;
        }
        if (int(Event.NewState) == 2 && (int(Event.OldState) != 2))
        {
            XLog(ELog(22), FString().Append("BossTracking LBP: target boss started ChangeArea, flock=").Append(Event.FlockEntity.ToString()));
            this.OnBossChangeAreaStarted(Event.LeaderEntity, Event.FlockEntity);
            return;
        }
        if (int(Event.OldState) == 2 && (int(Event.NewState) != 2))
        {
            XLog(ELog(22), FString().Append("BossTracking LBP: target boss finished ChangeArea, flock=").Append(Event.FlockEntity.ToString()));
            if (!(this.bBossDiscovered))
            {
                this.RefreshTrackingAreaOnBoss(Event.LeaderEntity);
            }
            this.OnBossChangeAreaFinished(Event.LeaderEntity, Event.FlockEntity);
        }
        return;
    }
    void RefreshTrackingAreaOnBoss(const FECSEntity &inout BossEntity)
    {
        Has local_6;
        if (!(BossEntity.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        Get local_18;
        FVector local_14 = local_18.opCall().GetPosition();
        if (!(::BlueprintFunctions_BossTracking::BossTracking_ShowTrackingAreaFromVolume(local_14)))
        {
            XLog(ELog(22), FString().Append("BossTracking LBP: refreshing tracking area, fallback to radius=").Append(this.TrackingAreaFallbackRadius));
            ::BlueprintFunctions_BossTracking::BossTracking_ShowTrackingArea(local_14, this.TrackingAreaFallbackRadius);
            return;
        }
        XLog(ELog(22), "BossTracking LBP: tracking area refreshed via volume after ChangeArea");
        return;
    }
    void OnBossIconsHidden()
    {
        __Evt_Execute(this, n"OnBossIconsHidden");
        return;
    }
    void OnBossDiscovered(const FECSEntity &inout DiscoveredBossEntity)
    {
        __Evt_PushArgument__FECSEntity(DiscoveredBossEntity);
        __Evt_Execute(this, n"OnBossDiscovered");
        return;
    }
    void OnBossChangeAreaStarted(const FECSEntity &inout BossEntity, const FECSEntity &inout FlockEntity)
    {
        __Evt_PushArgument__FECSEntity(BossEntity);
        __Evt_PushArgument__FECSEntity(FlockEntity);
        __Evt_Execute(this, n"OnBossChangeAreaStarted");
        return;
    }
    void OnBossChangeAreaFinished(const FECSEntity &inout BossEntity, const FECSEntity &inout FlockEntity)
    {
        __Evt_PushArgument__FECSEntity(BossEntity);
        __Evt_PushArgument__FECSEntity(FlockEntity);
        __Evt_Execute(this, n"OnBossChangeAreaFinished");
        return;
    }
}

