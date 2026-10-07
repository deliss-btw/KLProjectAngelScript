

class AKLLevelScriptAllyAssist : AKLLevelScriptBaseActor
{
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> AllyNPCConfig;
    UPROPERTY()
    int AllyCount = 3;
    UPROPERTY()
    float32 NPCSpawnMinRadius = 5000.0f;
    UPROPERTY()
    float32 NPCSpawnMaxRadius = 10000.0f;
    UPROPERTY()
    float32 SpawnPointMinRadius = 3000.0f;
    UPROPERTY()
    float32 SpawnPointMaxRadius = 8000.0f;
    UPROPERTY()
    float32 WaitForBossInterval = 0.5f;
    TArray<FECSEntity> SpawnedAllies;
    FLevelTimerCallback WaitBossTimer;
    bool bAlliesActive = false;


    UFUNCTION()
    void ECSBeginPlayBP_Implementation()
    {
        if (!(::BlueprintFunctions_AllyAssist::AllyAssist_IsAllyAssistRule()))
        {
            XLog(ELog(22), "AllyAssist LBP: not AllyAssist rule, skip");
            return;
        }
        XLog(ELog(22), "AllyAssist LBP: starting, waiting for Boss to spawn...");
        this.WaitBossTimer.BindUFunction(this, n"OnWaitForBossTimer");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.WaitBossTimer, this.WaitForBossInterval, true, -1.0f);
        this.RegisterLevelEventCallback(n"OnFlockStateChanged", FCE_OnFlockStateChangeLevelEvent, ENTITY_NULL);
        return;
    }
    UFUNCTION()
    void OnAlliesSpawned_Implementation(const TArray<FECSEntity> &inout Allies)
    {
        return;
    }
    UFUNCTION()
    void OnBossChangeArea_AlliesStopped_Implementation(const FECSEntity &inout BossEntity)
    {
        return;
    }
    UFUNCTION()
    void OnWaitForBossTimer()
    {
        TArray<FECSEntity> local_4;
        ::BlueprintFunctions_BossTracking::BossTracking_GetCommissionTargetEntities(local_4);
        if (local_4.Num() == 0)
        {
            return;
        }
        UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.WaitBossTimer);
        FECSEntity local_12 = FECSEntity(local_4[0]);
        XLog(ELog(22), FString().Append("AllyAssist LBP: Boss found, entity=").Append(local_12.ToString()));
        this.OnBossReady(local_12);
        return;
    }
    void OnBossReady(const FECSEntity &inout BossEntity)
    {
        ::BlueprintFunctions_AllyAssist::AllyAssist_TeleportPlayersNearBoss(BossEntity, this.SpawnPointMinRadius, this.SpawnPointMaxRadius);
        ::BlueprintFunctions_AllyAssist::AllyAssist_SpawnAllies(BossEntity, this.AllyNPCConfig, this.AllyCount, this.NPCSpawnMinRadius, this.NPCSpawnMaxRadius, this.SpawnedAllies);
        XLog(ELog(22), FString().Append("AllyAssist LBP: spawned ").Append(this.SpawnedAllies.Num()).Append(" allies"));
        ::BlueprintFunctions_AllyAssist::AllyAssist_ForceAlliesAttackTarget(this.SpawnedAllies, BossEntity);
        this.bAlliesActive = true;
        this.OnAlliesSpawned(this.SpawnedAllies);
        return;
    }
    UFUNCTION()
    void OnFlockStateChanged(const FCE_OnFlockStateChangeLevelEvent &inout Event)
    {
        if (!(this.bAlliesActive) || !(Event.LeaderEntity.IsValid()))
        {
            return;
        }
        if (!(::CommissionUtils::IsCommissionTarget(Event.LeaderEntity)))
        {
            return;
        }
        if ((int(Event.NewState) == 2 && (int(Event.OldState) != 2)))
        {
            XLog(ELog(22), "AllyAssist LBP: Boss ChangeArea started, clearing NPC force targets");
            ::BlueprintFunctions_AllyAssist::AllyAssist_ClearAlliesForceTarget(this.SpawnedAllies);
            this.OnBossChangeArea_AlliesStopped(Event.LeaderEntity);
        }
        return;
    }
    void OnAlliesSpawned(const TArray<FECSEntity> &inout Allies)
    {
        __Evt_PushArgument(Allies);
        __Evt_Execute(this, n"OnAlliesSpawned");
        return;
    }
    void OnBossChangeArea_AlliesStopped(const FECSEntity &inout BossEntity)
    {
        __Evt_PushArgument__FECSEntity(BossEntity);
        __Evt_Execute(this, n"OnBossChangeArea_AlliesStopped");
        return;
    }
}

