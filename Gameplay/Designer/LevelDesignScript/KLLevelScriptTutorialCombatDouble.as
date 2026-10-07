

class AKLLevelScriptTutorialCombatDouble : AKLLevelScriptTutorialActor
{
    UPROPERTY()
    FVector MobHammerSpawnPos = FVector(23640.0, 59780.0, 36720.0);
    UPROPERTY()
    FVector QinYuanMeleeSpawnPos = FVector(23850.0, 59780.0, 36930.0);
    UPROPERTY()
    FVector QinYuanRangedSpawnPos = FVector(24970.0, 59780.0, 37410.0);
    TDataObjectPtr<FMonsterMainConfig> MobHammerMonsterConfig;
    TDataObjectPtr<FMonsterMainConfig> QinYuanMonsterConfig;
    UPROPERTY()
    TDataObjectPtr<FCombatItemConfig> HealthPotionConfig;
    UPROPERTY()
    TArray<FName> DivineSkillTriggerNames;
    UPROPERTY()
    FBuffConfigRef PlayerInvincibleBuffConfig;
    UPROPERTY()
    FBuffConfigRef MeleeTraitMonsterBuffConfig;
    UPROPERTY()
    FName ExitInteractEventName = n"Tutorial_Exit";
    UPROPERTY()
    TArray<FName> StepCompletionEvents;
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
    FECSEntity PlayerEntity;
    int CurrentStep = 0;
    FECSEntity PlayerInvincibleBuffEntity;
    FECSEntity SpawnedMobHammer;
    TArray<FECSEntity> SpawnedStep6Monsters;
    FECSEntity StepMonsterBuffEntity;
    FECSEntity StepMonsterBuffOwner;
    int LastStep = 8;
    FLevelTimerCallback DivinePositionAutoCompleteTimer;
    TArray<FName> StepConfigKeys;
    bool bPendingMobMoveOnly = false;
    bool bPendingMobInvincible = false;


    UFUNCTION()
    void OnTutorialStep_Implementation(const int InStepIndex)
    {
        this.CurrentStep = InStepIndex;
        switch (InStepIndex)
        {
        case 1:
        {
            this.SetupStep_SwitchChar();
            return;
        }
        case 2:
        {
            this.SetupStep_UsePotion();
            return;
        }
        case 3:
        {
            this.SetupStep_UseDivineSkill();
            return;
        }
        case 4:
        {
            this.SetupStep_SwitchAttack();
            return;
        }
        case 5:
        {
            this.SetupStep_MeleeTrait();
            return;
        }
        case 6:
        {
            this.SetupStep_RangedTrait();
            return;
        }
        case 7:
        {
            this.SetupStep_DivinePosition();
            return;
        }
        case 8:
        {
            this.SetupStep_FreePractice();
        }
        }
        return;
    }
    UFUNCTION()
    void OnStepCompleted_Implementation()
    {
        this.ClearStepMonsterBuff();
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.DivinePositionAutoCompleteTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.DivinePositionAutoCompleteTimer);
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
        this.InitAllStepInfos();
        this.RegisterAllEvents();
        this.SetPlayerInvincible(true);
        int local_14 = FMath::Clamp(this.TestStartStep, 1, this.LastStep);
        Super::CallTutorialStep(local_14, 2.0f);
        return;
    }
    void AdvanceLastProgress()
    {
        Super::AdvanceAndCheck(this.CurrentTutorialInfo.GetStepProgress().Num());
        return;
    }
    void InitStepConfigKeys()
    {
        this.StepConfigKeys.SetNum(this.LastStep);
        this.StepConfigKeys[0] = n"CombatTutorialDouble_1_SwitchChar";
        this.StepConfigKeys[1] = n"CombatTutorialDouble_2_UsePotion";
        this.StepConfigKeys[2] = n"CombatTutorialDouble_3_UseDivineSkill";
        this.StepConfigKeys[3] = n"CombatTutorialDouble_4_SwitchAttack";
        this.StepConfigKeys[4] = n"CombatTutorialDouble_5_MeleeTrait";
        this.StepConfigKeys[5] = n"CombatTutorialDouble_6_RangedTrait";
        this.StepConfigKeys[6] = n"CombatTutorialDouble_7_DivinePosition";
        this.StepConfigKeys[7] = n"CombatTutorialDouble_8_FreePractice";
        return;
    }
    FTutorialInfo GetStepInfo(const int Step)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FTutorialInfo __r; return __r;
    }
    void InitAllStepInfos()
    {
        bool local_147 = false;
        this.InitStepConfigKeys();
        TMap<FName, TDataObjectPtr<FTutorialInfoConfig>> local_20;
        TDataObjectIterator<FTutorialInfoConfig> local_36;
        for (; local_36; )
        {
            TDataObjectPtr<FTutorialInfoConfig> local_78 = local_36.GetDataPtr();
            local_20.Add(local_78.GetDataName(), local_78);
            local_36.Next();
        }
        int local_105 = 0;
        for (; local_105 < this.LastStep; ++local_105)
        {
            FTutorialInfo& local_110 = this.GetStepInfo(local_105 + 1);
            if (local_20.Contains(this.StepConfigKeys[local_105]))
            {
                const FTutorialInfoConfig& local_112;
                local_110.SetTutorialInfoId(local_20[this.StepConfigKeys[local_105]]);
                local_110.GetModify_StepProgress().SetNum(local_112.Steps.Num());
                int local_113 = 0;
                for (; local_113 < local_112.Steps.Num(); )
                {
                    local_110.GetModify_StepProgress()[local_113].SetMaxProgress(1);
                    ++local_113;
                }
            }
        }
        int local_113_2 = 0;
        TDataObjectIterator<FMonsterMainConfig> local_130;
        while (local_147)
        {
            TDataObjectPtr<FMonsterMainConfig> local_172 = local_130.GetDataPtr();
            FName local_104 = local_172.GetDataName();
            if ((local_104 == n"PublicEco_Monster_GolemSmasher"))
            {
                this.MobHammerMonsterConfig = local_172;
                ++local_113_2;
            }
            else
            {
                if ((local_104 == n"PublicEco_Monster_NoxiousInsect"))
                {
                    this.QinYuanMonsterConfig = local_172;
                    ++local_113_2;
                }
            }
            local_130.Next();
            if (!(local_130))
            {
                local_147 = false;
                continue;
            }
            local_147 = (local_113_2 < 2);
        }
        return;
    }
    void RegisterAllEvents()
    {
        this.RegisterLevelEventCallback(n"OnCustomEvent", FCE_CustomLevelEvent, ENTITY_NULL);
        this.RegisterLevelEventCallback(n"OnDeathEvent", FCE_DeathEvent, ENTITY_NULL);
        this.RegisterLevelEventCallback(n"OnSwitchEvent", FCE_PlayerSwitchSuccess, ENTITY_NULL);
        this.RegisterLevelEventCallback(n"OnHitEvent", FCE_HitEvent, ENTITY_NULL);
        TArray<FECSEntity> local_8;
        Has local_12;
        bool local_13 = local_12.opCall();
        if (local_13)
        {
            Get local_18;
            local_8 = local_18.opCall().GetAllPlayerPawnEntities();
        }
        if (local_8.Num() == 0 && this.PlayerPawnEntity.IsValid())
        {
            local_8.Add(this.PlayerPawnEntity);
        }
        auto local_26 = local_8.Iterator();
        for (; local_26.CanProceed;)
        {
            this.RegisterLevelEventCallback(n"OnItemEvent", FCE_ConsumeCombatItemEvent, local_26.Proceed());
        }
        FESMTriggerRespondedDelegate local_38;
        local_38.BindUFunction(this, n"OnSkillTriggerResponded");
        if (this.DivineSkillTriggerNames.Num() == 0)
        {
            XWarning(ELog(22), "[TutorialDouble] DivineSkillTriggerNames жњЄй…ЌзЅ®пјЊstep3 зҐћж јжЉЂе€¤е®ље°†ж— жі•е®Њж€ђ");
        }
        for (auto& local_34 : local_8)
        {
            for (auto& local_54 : this.DivineSkillTriggerNames)
            {
                ::ULevelEventManager::Get().RegisterESMTriggerCallback(local_34, local_54, local_38);
            }
        }
        return;
    }
    void SetupStep_SwitchChar()
    {
        int local_2 = this.Step1Info.GetModify_StepProgress().Num() - 1;
        if (local_2 < 0)
        {
            this.Step1Info.GetModify_StepProgress().SetNum(1);
            local_2 = 0;
        }
        int local_5 = 0;
        for (; local_5 < local_2; )
        {
            this.Step1Info.GetModify_StepProgress()[0].SetMaxProgress();
            ++local_5;
        }
        this.Step1Info.GetModify_StepProgress()[2].SetMaxProgress();
        Super::BeginStepTutorial(this.Step1Info);
        this.DestroyAllMonsters();
        return;
    }
    void SetupStep_UsePotion()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void SetupStep_UseDivineSkill()
    {
        if (this.Step3Info.GetStepProgress().Num() > 1)
        {
            this.Step3Info.GetModify_StepProgress()[0].SetMaxProgress(0);
        }
        Super::BeginStepTutorial(this.Step3Info);
        this.ResetDivineSkillCD();
        return;
    }
    void ResetDivineSkillCD()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void SetupStep_SwitchAttack()
    {
        int local_2 = this.Step4Info.GetModify_StepProgress().Num() - 1;
        if (local_2 < 0)
        {
            this.Step4Info.GetModify_StepProgress().SetNum(1);
            local_2 = 0;
        }
        int local_5 = 0;
        for (; local_5 < local_2; )
        {
            this.Step4Info.GetModify_StepProgress()[0].SetMaxProgress();
            ++local_5;
        }
        this.Step4Info.GetModify_StepProgress()[2].SetMaxProgress();
        Super::BeginStepTutorial(this.Step4Info);
        this.SpawnMobHammer(true, true);
        return;
    }
    void SetupStep_MeleeTrait()
    {
        int local_1 = 0;
        for (; local_1 < (this.Step5Info.GetModify_StepProgress().Num() - 1); )
        {
            this.Step5Info.GetModify_StepProgress()[0].SetMaxProgress();
            ++local_1;
        }
        Super::BeginStepTutorial(this.Step5Info);
        Super::SetupMonster(this.SpawnedMobHammer, false, false, -1);
        this.SetStepMonsterBuff(this.SpawnedMobHammer, this.MeleeTraitMonsterBuffConfig);
        return;
    }
    void SetupStep_RangedTrait()
    {
        int local_2 = this.Step6Info.GetModify_StepProgress().Num() - 1;
        if (local_2 < 0)
        {
            this.Step6Info.GetModify_StepProgress().SetNum(1);
            local_2 = 0;
        }
        int local_5 = 0;
        for (; local_5 < local_2; )
        {
            this.Step6Info.GetModify_StepProgress()[0].SetMaxProgress();
            ++local_5;
        }
        this.Step6Info.GetModify_StepProgress()[2].SetMaxProgress();
        Super::BeginStepTutorial(this.Step6Info);
        this.DestroyMobHammer();
        this.SpawnStep6Monsters();
        return;
    }
    void SetupStep_DivinePosition()
    {
        int local_1 = 0;
        for (; local_1 < this.Step7Info.GetModify_StepProgress().Num(); )
        {
            this.Step7Info.GetModify_StepProgress()[0].SetMaxProgress();
            ++local_1;
        }
        Super::BeginStepTutorial(this.Step7Info);
        this.DestroyStep6Monsters();
        this.DivinePositionAutoCompleteTimer.BindUFunction(this, n"OnDivinePositionAutoComplete");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.DivinePositionAutoCompleteTimer, 8.0f, true, -1.0f);
        return;
    }
    void SetupStep_FreePractice()
    {
        int local_1 = 0;
        for (; local_1 < this.Step8Info.GetModify_StepProgress().Num(); )
        {
            this.Step8Info.GetModify_StepProgress()[0].SetMaxProgress();
            ++local_1;
        }
        Super::BeginStepTutorial(this.Step8Info);
        ::BlueprintFunctions_Level::Level_FinishTraining();
        return;
    }
    UFUNCTION()
    void OnSwitchEvent(const FCE_PlayerSwitchSuccess &inout Event)
    {
        if (Event.SwitchInPawn.IsValid())
        {
            this.PlayerPawnEntity = Event.SwitchInPawn;
        }
        if (this.CurrentStep == 1)
        {
            this.AdvanceLastProgress();
        }
        return;
    }
    UFUNCTION()
    void OnItemEvent(const FCE_ConsumeCombatItemEvent &inout Event)
    {
        bool local_3 = this.CurrentStep == 2 && this.HealthPotionConfig.IsSet();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            FDataObjectPtr local_76;
            local_76;
            local_3 = (Event.CombatItemConfig == local_76);
        }
        if (local_3)
        {
            Super::AdvanceAndCheck(2);
        }
        return;
    }
    UFUNCTION()
    void OnSkillTriggerResponded(const FECSEntity &inout Entity, const FName &inout TriggerName, const int StateMachineIndex)
    {
        if ((!((Entity == this.PlayerPawnEntity))))
        {
            return;
        }
        if (this.CurrentStep == 3 && this.DivineSkillTriggerNames.Contains(TriggerName))
        {
            Super::AdvanceAndCheck(2);
        }
        return;
    }
    UFUNCTION()
    void OnHitEvent(const FCE_HitEvent &inout HitEvent)
    {
        int local_3 = 0;
        if (!(HitEvent.AttackData.IsSet()))
        {
            return;
        }
        int local_2 = local_3;
        if (this.CurrentStep == 4 && ::BlueprintFunctions_Ability::MatchAttackCategory(local_2, EAttackCategory(4)))
        {
            this.AdvanceLastProgress();
        }
        return;
    }
    UFUNCTION()
    void OnDeathEvent(const FCE_DeathEvent &inout DeathEvent)
    {
        FECSEntity local_4 = FECSEntity(DeathEvent.Sender);
        if ((this.CurrentStep == 5 && (local_4 == this.SpawnedMobHammer)))
        {
            this.AdvanceLastProgress();
        }
        else
        {
            if (this.CurrentStep == 6 && this.SpawnedStep6Monsters.Contains(local_4))
            {
                this.AdvanceLastProgress();
            }
        }
        return;
    }
    UFUNCTION()
    void OnDivinePositionAutoComplete()
    {
        if (this.CurrentStep != 7)
        {
            return;
        }
        UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.DivinePositionAutoCompleteTimer);
        this.AdvanceLastProgress();
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
        this.ClearStepMonsterBuff();
        this.DestroyAllMonsters();
        this.SetPlayerInvincible(false);
        return;
    }
    void SetStepMonsterBuff(const FECSEntity &inout Monster, const FBuffConfigRef &inout BuffConfig)
    {
        this.ClearStepMonsterBuff();
        if (!(Monster.IsValid()) || !(BuffConfig.IsValid()))
        {
            return;
        }
        this.StepMonsterBuffOwner = Monster;
        this.StepMonsterBuffEntity = ::BlueprintFunctions_Level::LevelAddBuff(FECSEntityAdapter(Monster), Monster, BuffConfig, -1.0f);
        return;
    }
    void ClearStepMonsterBuff()
    {
        if (this.StepMonsterBuffEntity.IsValid() && this.StepMonsterBuffOwner.IsValid())
        {
            ::BlueprintFunctions_Level::LevelRemoveBuffById(FECSEntityAdapter(this.StepMonsterBuffOwner), this.StepMonsterBuffEntity);
            this.StepMonsterBuffEntity = FECSEntity();
            this.StepMonsterBuffOwner = FECSEntity();
        }
        return;
    }
    void DestroyAllMonsters()
    {
        this.DestroyMobHammer();
        this.DestroyStep6Monsters();
        return;
    }
    FECSEntity SpawnMonsterAt(const TDataObjectPtr<FMonsterMainConfig> &inout Config, const FVector &inout Pos, const FName &inout CallbackName)
    {
        FQuat local_8 = FQuat(FQuat::Identity);
        FECSEntity local_18 = ::BlueprintFunctions_Ecology::SpawnMonsterByMonsterId(Config, Pos, local_8, nullptr, NAME_None, false);
        if (local_18.IsValid())
        {
            FEntityCreateFinishDelegate local_22;
            local_22.BindUFunction(this, CallbackName);
            ::ULevelEventManager::Get().RegisterCreatureCreateFinishCallback(local_18, local_22);
        }
        return local_18;
    }
    void DestroyEntity(FECSEntity &inout Entity)
    {
        if (Entity.IsValid())
        {
            ::FEcologyLifeCycleUtils::MarkEntityWaitDestroy(Entity, ECS::GetECSWorld().GetLocalTime().Time);
            Entity = FECSEntity();
        }
        return;
    }
    void SpawnMobHammer(const bool bMoveOnly, const bool bInvincible)
    {
        if (!(this.MobHammerMonsterConfig.IsSet()))
        {
            XWarning(ELog(22), "[TutorialDouble] MobHammerMonsterConfig not set!");
            return;
        }
        this.DestroyMobHammer();
        this.bPendingMobMoveOnly = bMoveOnly;
        this.bPendingMobInvincible = bInvincible;
        this.SpawnedMobHammer = this.SpawnMonsterAt(this.MobHammerMonsterConfig, this.MobHammerSpawnPos, n"OnMobHammerCreateFinish");
        return;
    }
    UFUNCTION()
    void OnMobHammerCreateFinish(const FECSEntity &inout Entity)
    {
        this.SpawnedMobHammer = Entity;
        Super::SetupMonster(Entity, this.bPendingMobMoveOnly, this.bPendingMobInvincible, -1);
        return;
    }
    void DestroyMobHammer()
    {
        this.DestroyEntity(this.SpawnedMobHammer);
        return;
    }
    void SpawnStep6Monsters()
    {
        if (!(this.QinYuanMonsterConfig.IsSet()))
        {
            XWarning(ELog(22), "[TutorialDouble] QinYuanMonsterConfig not set!");
            return;
        }
        this.DestroyStep6Monsters();
        this.SpawnMonsterAt(this.QinYuanMonsterConfig, this.QinYuanMeleeSpawnPos, n"OnStep6MonsterCreateFinish");
        this.SpawnMonsterAt(this.QinYuanMonsterConfig, this.QinYuanRangedSpawnPos, n"OnStep6MonsterCreateFinish");
        return;
    }
    UFUNCTION()
    void OnStep6MonsterCreateFinish(const FECSEntity &inout Entity)
    {
        this.SpawnedStep6Monsters.Add(Entity);
        Super::SetupMonster(Entity, false, false, -1);
        return;
    }
    void DestroyStep6Monsters()
    {
        for (auto& local_16 : this.SpawnedStep6Monsters)
        {
            this.DestroyEntity(local_16);
        }
        this.SpawnedStep6Monsters.Empty(0);
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

