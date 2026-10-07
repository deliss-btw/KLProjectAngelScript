

class AKLLevelScriptTutorialLevelItem : AKLLevelScriptTutorialActor
{
    UPROPERTY()
    FBuffConfigRef PlayerInvincibleBuffConfig;
    UPROPERTY()
    FBuffConfigRef LifeChainBuffConfig;
    UPROPERTY()
    FBuffConfigRef StaminaBuffConfig;
    UPROPERTY()
    FBuffConfigRef PoisonBuffConfig;
    UPROPERTY()
    TDataObjectPtr<FAttackData> ExplodeBarrelAttackData;
    UPROPERTY()
    TDataObjectPtr<FAttackData> BallistaAttackData;
    UPROPERTY()
    TDataObjectPtr<FRemnantItemConfig> PickupRemnantConfig;
    UPROPERTY()
    TArray<FECSEntity> EnvDestroyOres;
    UPROPERTY()
    TArray<FName> TrapESMStateNames;
    UPROPERTY()
    FName ExitInteractEventName = n"Tutorial_Exit";
    UPROPERTY()
    TArray<FName> StepCompletionEvents;
    UPROPERTY()
    TArray<int> StepRequiredCounts;
    UPROPERTY()
    int TestStartStep = 1;
    UPROPERTY()
    FTutorialInfo Step1Info;
    UPROPERTY()
    FTutorialInfo Step2Info;
    UPROPERTY()
    FTutorialInfo Step3Info;
    UPROPERTY()
    FTutorialInfo Step4Info;
    UPROPERTY()
    FTutorialInfo Step5Info;
    UPROPERTY()
    FTutorialInfo Step6Info;
    UPROPERTY()
    FTutorialInfo Step7Info;
    UPROPERTY()
    FTutorialInfo Step8Info;
    UPROPERTY()
    FTutorialInfo Step9Info;
    UPROPERTY()
    FTutorialInfo Step10Info;
    UPROPERTY()
    FECSEntity PlayerEntity;
    int CurrentStep = 0;
    FECSEntity PlayerInvincibleBuffEntity;
    FLevelTimerCallback BuffStackCheckTimer;
    FBuffConfigRef ActiveBuffStackConfig;
    FECSEntity BuffStackTarget;
    int BuffStackStep = 0;
    bool bBuffPresenceMode = false;
    int BuffStackBase = 0;
    int BuffStackProgress = 0;
    int EnvDestroyBrokenCount = 0;
    FLevelTimerCallback UltraEnergyCheckTimer;
    FLevelTimerCallback TrapESMCheckTimer;
    FECSEntity InfiniteAmmoTurret;
    FLevelTimerCallback InfiniteAmmoTimer;
    TArray<FECSEntityId> PoisonSnailRemainingIds;
    TArray<FECSEntityId> ExplodeBarrelRemainingIds;
    int LastStep = 10;


    UFUNCTION()
    void OnTutorialStep_Implementation(const int InStepIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void OnStepCompleted_Implementation()
    {
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.BuffStackCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.BuffStackCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.UltraEnergyCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.UltraEnergyCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.TrapESMCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.TrapESMCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.InfiniteAmmoTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.InfiniteAmmoTimer);
        }
        int local_3 = this.CurrentStep + 1;
        if (local_3 <= this.LastStep)
        {
            Super::CallTutorialStep(local_3, 2.0f);
        }
        return;
    }
    UFUNCTION()
    void OnPlayerJoinGameBP_Implementation(const FECSEntity &inout PlayerControllerEntity)
    {
        this.PlayerEntity = PlayerControllerEntity;
        FECSEntity local_8 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(this.PlayerEntity);
        if (local_8.IsValid())
        {
            this.PlayerPawnEntity = local_8;
        }
        this.RegisterAllEvents();
        this.SetPlayerInvincible(true);
        int local_14 = FMath::Clamp(this.TestStartStep, 1, this.LastStep);
        Super::CallTutorialStep(local_14, 2.0f);
        return;
    }
    UFUNCTION()
    void OnPoisonSnailsAllUsedUp_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnExplodeBarrelsAllUsedUp_Implementation()
    {
        return;
    }
    int GetProgressLineIndex(const FTutorialInfo &inout Info)
    {
        int local_6;
        int local_1 = 0;
        for (; local_1 < Info.GetStepProgress().Num(); ++local_1)
        {
            if (Info.GetStepProgress()[local_1].GetMaxProgress() > 0)
            {
                return local_1;
            }
        }
        if (Info.GetStepProgress().Num() > 0)
        {
            local_6 = Info.GetStepProgress().Num() - 1;
        }
        else
        {
            local_6 = 0;
        }
        return local_6;
    }
    void AdvanceLastProgress()
    {
        Super::AdvanceAndCheck((this.GetProgressLineIndex(this.CurrentTutorialInfo) + 1));
        return;
    }
    void RegisterAllEvents()
    {
        this.RegisterLevelEventCallback(n"OnCustomEvent", FCE_CustomLevelEvent, ENTITY_NULL);
        this.RegisterLevelEventCallback(n"OnHitEvent", FCE_HitEvent, ENTITY_NULL);
        this.RegisterLevelEventCallback(n"OnRemnantSlotChanged", FCE_RemnantSlotChangedEvent, this.PlayerEntity);
        return;
    }
    FTutorialInfo GetStepInfo(const int InStepIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FTutorialInfo __r; return __r;
    }
    void SetupStep_LifeChain()
    {
        Super::BeginStepTutorial(this.Step1Info);
        this.StartBuffStackListen(this.PlayerPawnEntity, this.LifeChainBuffConfig, "step1 з”џе‘Ѕй”Ѓй“ѕ", false);
        return;
    }
    void SetupStep_AttackDisc()
    {
        Super::BeginStepTutorial(this.Step2Info);
        this.StartBuffStackListen(this.PlayerPawnEntity, this.StaminaBuffConfig, "step2 иЂђеЉ›жЏђеЌ‡", false);
        return;
    }
    UFUNCTION()
    void SetEnvDestroyOres(const TArray<FECSEntity> &inout InOres)
    {
        this.EnvDestroyOres = InOres;
        return;
    }
    UFUNCTION()
    void StartEnvDestroyListen()
    {
        int local_22 = 0;
        APropPrefabScriptBase local_28;
        this.StepIndex = 3;
        this.CurrentStep = 3;
        this.EnvDestroyBrokenCount = 0;
        int local_2 = 0;
        for (auto& local_18 : this.EnvDestroyOres)
        {
            if (local_18.IsValid())
            {
                ++local_2;
            }
        }
        if (this.Step3Info.GetStepProgress().Num() < 1)
        {
            this.Step3Info.GetModify_StepProgress().SetNum(1);
        }
        int local_1 = this.GetProgressLineIndex(this.Step3Info);
        this.Step3Info.GetModify_StepProgress()[].SetMaxProgress();
        Super::BeginStepTutorial(this.Step3Info);
        if (local_2 == 0)
        {
            XWarning(ELog(22), "[TutorialLevelItem] step3 жњЄи®ѕзЅ®зџїзџіе®ћдЅ“(EnvDestroyOres)пјЊиЇ·е…€и°ѓз”Ё SetEnvDestroyOresпјЊиЇҐж­ҐйЄ¤е°†ж— жі•е®Њж€ђ");
        }
        for (auto& local_18 : this.EnvDestroyOres)
        {
            if (!(local_18.IsValid()))
            {
                continue;
            }
            if (!(local_22))
            {
                continue;
            }
            local_28 = Cast<APropPrefabScriptBase>(local_22.TryGetPrefabActor());
            if (local_28 != nullptr)
            {
                local_28.OnEntityDie.AddUFunction(this, n"OnOreDestroyed");
            }
        }
        return;
    }
    UFUNCTION()
    void StartPoisonBuffListen(const FECSEntity &inout BossEntity)
    {
        this.StepIndex = 4;
        this.CurrentStep = 4;
        this.MonsterEntity = BossEntity;
        Super::BeginStepTutorial(this.Step4Info);
        this.StartBuffStackListen(BossEntity, this.PoisonBuffConfig, "step4 жЇ’ињ—з‰›дё­жЇ’", true);
        Super::SetupMonster(BossEntity, true, true, -1);
        return;
    }
    UFUNCTION()
    void StartTurretInfiniteAmmo(const FECSEntity &inout TurretEntity)
    {
        this.InfiniteAmmoTurret = TurretEntity;
        this.RefillTurretAmmo();
        if (!(UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.InfiniteAmmoTimer)))
        {
            this.InfiniteAmmoTimer.BindUFunction(this, n"OnInfiniteAmmoTick");
            UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.InfiniteAmmoTimer, 0.1f, true, -1.0f);
        }
        return;
    }
    UFUNCTION()
    void StopTurretInfiniteAmmo()
    {
        this.InfiniteAmmoTurret = FECSEntity();
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.InfiniteAmmoTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.InfiniteAmmoTimer);
        }
        return;
    }
    UFUNCTION()
    void OnInfiniteAmmoTick()
    {
        bool local_4;
        bool local_3 = this.CurrentStep == 6 && this.PlayerPawnEntity.IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            Has local_8;
            local_3 = local_8.opCall();
        }
        if (local_3)
        {
            Get local_16;
            FECSEntity local_12 = local_16.opCall().GetManipulatedPropEntity();
            if (!(local_12.IsValid()))
            {
                local_4 = false;
            }
            else
            {
                Has local_20;
                local_4 = local_20.opCall();
            }
            if (local_4)
            {
                this.InfiniteAmmoTurret = local_12;
            }
        }
        this.RefillTurretAmmo();
        return;
    }
    void RefillTurretAmmo()
    {
        int local_18 = 0;
        int local_24 = 0;
        float32 local_35;
        Has local_6;
        Has local_12;
        if (!(this.InfiniteAmmoTurret.IsValid()) || !(local_6.opCall()) || !(local_12.opCall()))
        {
            return;
        }
        int local_26 = local_24.GetValues().Num();
        int local_28 = FMath::Min(local_18.ScalerResourceConfigData.Num());
        int local_29 = 0;
        for (; local_29 < local_28; )
        {
            const FScalerResourceConfigData& local_32 = local_18.ScalerResourceConfigData[local_29];
            if (((int(local_32.ChangeType) == 0) || (int(local_32.ChangeType) == 1)))
            {
                local_35 = local_32.ValueMax;
            }
            else
            {
                local_35 = local_32.ValueMin;
            }
            local_24.GetModify_Values()[local_29] = local_35;
            ++local_29;
        }
        return;
    }
    TArray<FECSEntityId> BindUsedUpWatch(const TArray<FECSEntity> &inout Entities, const FName &inout CallbackName)
    {
        TArray<FECSEntityId> local_4;
        int local_22 = 0;
        APropPrefabScriptBase local_28;
        for (auto& local_20 : Entities)
        {
            if (!(local_20.IsValid()))
            {
                continue;
            }
            if (!(local_22))
            {
                continue;
            }
            local_28 = Cast<APropPrefabScriptBase>(local_22.TryGetPrefabActor());
            if (local_28 == nullptr)
            {
                continue;
            }
            local_28.OnEntityDie.AddUFunction(this, CallbackName);
            local_28.OnEntityPendingDestroy.AddUFunction(this, CallbackName);
            local_4.AddUnique(local_20.GetId());
        }
        return local_4;
    }
    UFUNCTION()
    void WatchPoisonSnailsUsedUp(const TArray<FECSEntity> &inout Snails)
    {
        this.PoisonSnailRemainingIds = this.BindUsedUpWatch(Snails, n"OnPoisonSnailUsedUp");
        if (this.PoisonSnailRemainingIds.Num() == 0)
        {
            XWarning(ELog(22), "[TutorialLevelItem] WatchPoisonSnailsUsedUp дј е…Ґзљ„жЇ’ињ—з‰›е®ћдЅ“еќ‡ж— ж•€пјЊе€·ж–°е›ћи°ѓе°†дёЌдјљи§¦еЏ‘");
        }
        return;
    }
    UFUNCTION()
    void OnPoisonSnailUsedUp(const FECSEntity &inout Entity)
    {
        FECSEntityId local_1 = Entity.GetId();
        if (0 == 0)
        {
            return;
        }
        if (this.PoisonSnailRemainingIds.Num() == 0)
        {
            this.OnPoisonSnailsAllUsedUp();
        }
        return;
    }
    void OnPoisonSnailsAllUsedUp()
    {
        __Evt_Execute(this, n"OnPoisonSnailsAllUsedUp");
        return;
    }
    UFUNCTION()
    void WatchExplodeBarrelsUsedUp(const TArray<FECSEntity> &inout Barrels)
    {
        this.ExplodeBarrelRemainingIds = this.BindUsedUpWatch(Barrels, n"OnExplodeBarrelUsedUp");
        if (this.ExplodeBarrelRemainingIds.Num() == 0)
        {
            XWarning(ELog(22), "[TutorialLevelItem] WatchExplodeBarrelsUsedUp дј е…Ґзљ„з€†з‚ёжЎ¶е®ћдЅ“еќ‡ж— ж•€пјЊе€·ж–°е›ћи°ѓе°†дёЌдјљи§¦еЏ‘");
        }
        return;
    }
    UFUNCTION()
    void OnExplodeBarrelUsedUp(const FECSEntity &inout Entity)
    {
        FECSEntityId local_1 = Entity.GetId();
        if (0 == 0)
        {
            return;
        }
        if (this.ExplodeBarrelRemainingIds.Num() == 0)
        {
            this.OnExplodeBarrelsAllUsedUp();
        }
        return;
    }
    void OnExplodeBarrelsAllUsedUp()
    {
        __Evt_Execute(this, n"OnExplodeBarrelsAllUsedUp");
        return;
    }
    void SetupStep_ExplodeBarrel()
    {
        Super::BeginStepTutorial(this.Step5Info);
        return;
    }
    void SetupStep_Ballista()
    {
        Super::BeginStepTutorial(this.Step6Info);
        if (!(UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.InfiniteAmmoTimer)))
        {
            this.InfiniteAmmoTimer.BindUFunction(this, n"OnInfiniteAmmoTick");
            UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.InfiniteAmmoTimer, 0.1f, true, -1.0f);
        }
        return;
    }
    void SetupStep_PickupRemnant()
    {
        Super::BeginStepTutorial(this.Step7Info);
        return;
    }
    void SetupStep_UseRemnant()
    {
        Super::BeginStepTutorial(this.Step8Info);
        this.UltraEnergyCheckTimer.BindUFunction(this, n"OnUltraEnergyCheckTick");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.UltraEnergyCheckTimer, 0.2f, true, -1.0f);
        return;
    }
    void SetupStep_Trap()
    {
        Super::BeginStepTutorial(this.Step9Info);
        Super::SetupMonsterState(this.MonsterEntity, ETutorialMonsterTestState(2), true, -1);
        if (this.TrapESMStateNames.Num() > 0)
        {
            this.TrapESMCheckTimer.BindUFunction(this, n"OnTrapESMCheckTick");
            UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.TrapESMCheckTimer, 0.2f, true, -1.0f);
        }
        return;
    }
    void SetupStep_FreePractice()
    {
        Super::BeginStepTutorial(this.Step10Info);
        ::BlueprintFunctions_Level::Level_FinishTraining();
        return;
    }
    void StartBuffStackListen(const FECSEntity &inout Target, const FBuffConfigRef &inout BuffConfig, const FString &inout StepDesc, const bool bPresenceOnly = false)
    {
        this.ActiveBuffStackConfig = BuffConfig;
        this.BuffStackTarget = Target;
        this.BuffStackStep = this.CurrentStep;
        this.bBuffPresenceMode = bPresenceOnly;
        this.BuffStackProgress = 0;
        this.BuffStackBase = Target.IsValid() ? ::BlueprintFunctions_Common::GetBuffStackNum(FECSEntityAdapter(Target), BuffConfig) : 0;
        if (!(Target.IsValid()))
        {
            FString local_18 = (FString("[TutorialLevelItem] ") + StepDesc);
            FString local_14 = (local_18 + " з›‘еђ¬з›®ж ‡е®ћдЅ“ж— ж•€пјЊиЇҐж­ҐйЄ¤е°†ж— жі•е®Њж€ђ");
            XWarning(ELog(22), local_14);
        }
        if (!(BuffConfig.IsValid()))
        {
            FString local_18_2 = (FString("[TutorialLevelItem] ") + StepDesc);
            FString local_14_2 = (local_18_2 + " Buff жњЄй…ЌзЅ®пјЊиЇҐж­ҐйЄ¤е°†ж— жі•е®Њж€ђ");
            XWarning(ELog(22), local_14_2);
        }
        this.BuffStackCheckTimer.BindUFunction(this, n"OnBuffStackCheckTick");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.BuffStackCheckTimer, 0.2f, true, -1.0f);
        return;
    }
    UFUNCTION()
    void OnBuffStackCheckTick()
    {
        int local_9;
        if (this.CurrentStep != this.BuffStackStep)
        {
            return;
        }
        if (!(this.BuffStackTarget.IsValid()))
        {
            return;
        }
        FTutorialInfo& local_6 = this.GetStepInfo(this.CurrentStep);
        int local_2 = this.GetProgressLineIndex(local_6);
        int local_1 = local_6.GetStepProgress().IsValidIndex(local_2) ? local_6.GetStepProgress()[local_2].GetMaxProgress() : 0;
        if (local_1 <= 0)
        {
            return;
        }
        if (this.bBuffPresenceMode)
        {
            int local_7 = ::BlueprintFunctions_Common::HasDesignatedBuff(FECSEntityAdapter(this.BuffStackTarget), this.ActiveBuffStackConfig) ? local_1 : 0;
            local_9 = local_7;
        }
        else
        {
            local_9 = FMath::Clamp((::BlueprintFunctions_Common::GetBuffStackNum(FECSEntityAdapter(this.BuffStackTarget), this.ActiveBuffStackConfig) - this.BuffStackBase), 0, local_1);
        }
        while (this.BuffStackProgress < local_9)
        {
            ++this.BuffStackProgress;
            this.AdvanceLastProgress();
        }
        return;
    }
    UFUNCTION()
    void OnUltraEnergyCheckTick()
    {
        if (this.CurrentStep != 8)
        {
            return;
        }
        if (!(this.PlayerPawnEntity.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        if (!(local_8.IsValid()))
        {
            return;
        }
        float32 local_21 = FGameAttributeUtils::GetAttributeValue(this.PlayerPawnEntity, Attribute::UltraSkillEnergyMax, local_8.GetFixedTime().Time, false, 0.0f, false, FGameAttributeModificationValue());
        if ((local_21 > 0.0f && (FGameAttributeUtils::GetAttributeValue(this.PlayerPawnEntity, Attribute::UltraSkillEnergy, local_8.GetFixedTime().Time, false, 0.0f, false, FGameAttributeModificationValue()) >= local_21)))
        {
            this.AdvanceLastProgress();
        }
        return;
    }
    UFUNCTION()
    void OnTrapESMCheckTick()
    {
        int local_20 = 0;
        int local_26 = 0;
        if (this.CurrentStep != 9)
        {
            return;
        }
        Has local_8;
        Has local_14;
        if (!(this.MonsterEntity.IsValid()) || !(local_8.opCall()) || !(local_14.opCall()))
        {
            return;
        }
        int local_27 = 0;
        for (; local_27 < local_26.Player.GetSMRuntime().Num(); ++local_27)
        {
            UESMStateMachine local_32 = local_20.Asset.GetStateMachine(local_27);
            if (local_32 == nullptr)
            {
                continue;
            }
            UESMBaseState local_36 = local_32.GetBaseState(local_26.Player.GetSMRuntime()[].GetStateIndex());
            if (local_36 != nullptr && this.TrapESMStateNames.Contains(local_36.GetDataName()))
            {
                UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.TrapESMCheckTimer);
                this.AdvanceLastProgress();
                break;
            }
        }
        return;
    }
    UFUNCTION()
    void OnOreDestroyed(const FECSEntity &inout Entity)
    {
        if (this.CurrentStep != 3)
        {
            return;
        }
        FTutorialInfo& local_6 = this.GetStepInfo(this.CurrentStep);
        int local_2 = this.GetProgressLineIndex(local_6);
        int local_1 = local_6.GetStepProgress().IsValidIndex(local_2) ? local_6.GetStepProgress()[local_2].GetMaxProgress() : 0;
        if (local_1 <= 0)
        {
            return;
        }
        if (this.EnvDestroyBrokenCount < local_1)
        {
            ++this.EnvDestroyBrokenCount;
            this.AdvanceLastProgress();
        }
        return;
    }
    UFUNCTION()
    void OnHitEvent(const FCE_HitEvent &inout HitEvent)
    {
        bool local_11;
        if (!(HitEvent.AttackData.IsSet()))
        {
            return;
        }
        FECSEntity local_6 = HitEvent.Receiver;
        if (this.MonsterEntity.IsValid())
        {
            local_11 = (local_6 == this.MonsterEntity);
        }
        else
        {
            local_11 = local_6.IsValid() && !((local_6 == this.PlayerPawnEntity));
        }
        if (!(local_11))
        {
            return;
        }
        FName local_15 = HitEvent.AttackData.GetDataName();
        if ((this.CurrentStep == 5 && this.ExplodeBarrelAttackData.IsSet()) && (local_15 == this.ExplodeBarrelAttackData.GetDataName()))
        {
            this.AdvanceLastProgress();
        }
        else
        {
            if ((this.CurrentStep == 6 && this.BallistaAttackData.IsSet()) && (local_15 == this.BallistaAttackData.GetDataName()))
            {
                this.AdvanceLastProgress();
            }
        }
        return;
    }
    UFUNCTION()
    void OnRemnantSlotChanged(const FCE_RemnantSlotChangedEvent &inout Event)
    {
        int local_10 = 0;
        if (this.CurrentStep != 7)
        {
            return;
        }
        if (!(this.PickupRemnantConfig.IsSet()) || !(this.PlayerEntity.IsValid()))
        {
            return;
        }
        if (!(local_10))
        {
            return;
        }
        TDataObjectPtr<FRemnantItemConfig> local_34;
        local_34 = local_10.GetRemnantItemConfig();
        FDataObjectPtr local_82;
        local_82;
        if ((local_34 == local_82))
        {
            this.AdvanceLastProgress();
        }
        return;
    }
    UFUNCTION()
    void OnCustomEvent(const FCE_CustomLevelEvent &inout Event)
    {
        if (this.CurrentStep == this.LastStep)
        {
            if ((Event.CustomName == this.ExitInteractEventName))
            {
                this.OnTutorialFinished();
            }
            return;
        }
        int local_1 = this.CurrentStep - 1;
        if (this.StepCompletionEvents.IsValidIndex(local_1) && !(this.StepCompletionEvents[local_1].IsNone()) && (Event.CustomName == this.StepCompletionEvents[local_1]))
        {
            Super::AdvanceAndCheck(1);
        }
        return;
    }
    void OnTutorialFinished()
    {
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.BuffStackCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.BuffStackCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.UltraEnergyCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.UltraEnergyCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.TrapESMCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.TrapESMCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.InfiniteAmmoTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.InfiniteAmmoTimer);
        }
        this.SetPlayerInvincible(false);
        return;
    }
    void SetPlayerInvincible(const bool bEnable)
    {
        if (!(this.PlayerPawnEntity.IsValid()) || !(this.PlayerInvincibleBuffConfig.IsValid()))
        {
            return;
        }
        if (bEnable)
        {
            FECSEntity local_14;
            if (!(this.PlayerInvincibleBuffEntity.IsValid()))
            {
                local_14 = ::BlueprintFunctions_Level::LevelAddBuff(FECSEntityAdapter(this.PlayerPawnEntity), this.PlayerPawnEntity, this.PlayerInvincibleBuffConfig, -1.0f);
                this.PlayerInvincibleBuffEntity = local_14;
            }
            return;
        }
        if (this.PlayerInvincibleBuffEntity.IsValid())
        {
            FECSEntity local_14;
            ::BlueprintFunctions_Level::LevelRemoveBuffById(FECSEntityAdapter(this.PlayerPawnEntity), this.PlayerInvincibleBuffEntity);
            this.PlayerInvincibleBuffEntity = local_14;
        }
        return;
    }
}

