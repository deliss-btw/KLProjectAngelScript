

class AKLLevelScriptTutorialCombatBoss : AKLLevelScriptTutorialActor
{
    UPROPERTY()
    FECSEntity BossSword;
    UPROPERTY()
    FECSEntity BossQiong;
    UPROPERTY()
    TDataObjectPtr<FCombatItemConfig> ArmorBreakerConfig;
    UPROPERTY()
    TDataObjectPtr<FCombatItemConfig> SkyfallArrowConfig;
    UPROPERTY()
    TDataObjectPtr<FCombatItemConfig> FlashBombConfig;
    UPROPERTY()
    FBuffConfigRef PlayerInvincibleBuffConfig;
    UPROPERTY()
    FBuffConfigRef PlayerLockHpBuffConfig;
    UPROPERTY()
    FBuffConfigRef StaggerBossBuffConfig;
    UPROPERTY()
    FBuffConfigRef IgniteBossBuffConfig;
    UPROPERTY()
    FBuffConfigRef IgnitePostureZeroBuffConfig;
    UPROPERTY()
    FBuffConfigRef BreakBossBuffConfig;
    UPROPERTY()
    int DivineStolenBossSkillIndex = -1;
    UPROPERTY()
    int BreakDefenseBossSkillIndex = -1;
    UPROPERTY()
    TArray<FName> BreakDefenseESMStateNames;
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
    FTutorialInfo Step9Info;
    UPROPERTY()
    FTutorialInfo Step10Info;
    UPROPERTY()
    FTutorialInfo Step11Info;
    UPROPERTY()
    FECSEntity PlayerEntity;
    int CurrentStep = 0;
    FECSEntity LastLockTarget;
    FECSEntity PlayerInvincibleBuffEntity;
    FECSEntity PlayerLockHpBuffEntity;
    FECSEntity StepBossBuffEntity;
    FECSEntity StepBossBuffOwner;
    FECSEntity IgnitePostureZeroBuffEntity;
    FLevelTimerCallback StaggerCheckTimer;
    FLevelTimerCallback IgniteCheckTimer;
    FLevelTimerCallback BreakCheckTimer;
    FLevelTimerCallback StealDivineCheckTimer;
    FLevelTimerCallback DivineEnhanceCheckTimer;
    bool bDivineEnhanceBuffDetected = false;
    FLevelTimerCallback DivineStolenCheckTimer;
    FLevelTimerCallback BreakDefenseCheckTimer;
    FLevelTimerCallback ItemHintAutoCompleteTimer;
    FLevelTimerCallback DivineStolenHintAutoCompleteTimer;
    FLevelTimerCallback RestoreInvincibleTimer;
    TDataObjectPtr<FItemConfig> SavedCombatSlot1Item;
    TDataObjectPtr<FItemConfig> SavedCombatSlot2Item;
    bool bBreakItemSlotsSnapshotted = false;
    int LastStep = 11;
    TArray<FName> StepConfigKeys;


    UFUNCTION()
    void OnTutorialStep_Implementation(const int InStepIndex)
    {
        this.CurrentStep = InStepIndex;
        switch (InStepIndex)
        {
        case 1:
        {
            this.SetupStep_Lock();
            return;
        }
        case 2:
        {
            this.SetupStep_Stagger();
            return;
        }
        case 3:
        {
            this.SetupStep_Ignite();
            return;
        }
        case 4:
        {
            this.SetupStep_Break();
            return;
        }
        case 5:
        {
            this.SetupStep_StealDivine();
            return;
        }
        case 6:
        {
            this.SetupStep_DivineEnhance();
            return;
        }
        case 7:
        {
            this.SetupStep_DivineStolen();
            return;
        }
        case 8:
        {
            this.SetupStep_BreakDefense();
            return;
        }
        case 9:
        {
            this.SetupStep_ItemHint();
            return;
        }
        case 10:
        {
            this.SetupStep_DivineStolenHint();
            return;
        }
        case 11:
        {
            this.SetupStep_FreePractice();
        }
        }
        return;
    }
    UFUNCTION()
    void OnStepCompleted_Implementation()
    {
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.StaggerCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.StaggerCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.IgniteCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.IgniteCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.BreakCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.BreakCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.StealDivineCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.StealDivineCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.DivineEnhanceCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.DivineEnhanceCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.DivineStolenCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.DivineStolenCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.BreakDefenseCheckTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.BreakDefenseCheckTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.ItemHintAutoCompleteTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.ItemHintAutoCompleteTimer);
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.DivineStolenHintAutoCompleteTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.DivineStolenHintAutoCompleteTimer);
        }
        if (this.CurrentStep == 7)
        {
            FNameHandle_EntityBBVarBool local_8;
            Super::SetAllPlayerActionsDisabled(false);
            if (this.BossSword.IsValid())
            {
                local_8;
                this.BossSword.SetBB_Bool(local_8, n"bTestMode");
            }
            this.RestoreInvincibleTimer.BindUFunction(this, n"OnRestoreInvincible");
            UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.RestoreInvincibleTimer, 5.0f, false, -1.0f);
        }
        if (this.CurrentStep == 8)
        {
            FNameHandle_EntityBBVarBool local_8;
            if (this.BossSword.IsValid())
            {
                local_8;
                this.BossSword.SetBB_Bool(local_8, n"bTestMode");
            }
            this.RestoreBreakDefenseItemSlots();
        }
        this.ClearBossStepBuff();
        int local_2 = this.CurrentStep + 1;
        if (this.CurrentStep == 7)
        {
            local_2 = 10;
        }
        else
        {
            if (this.CurrentStep == 10)
            {
                local_2 = 8;
            }
            else
            {
                if (this.CurrentStep == 9)
                {
                    local_2 = this.LastStep;
                }
            }
        }
        if (local_2 <= this.LastStep)
        {
            Super::CallTutorialStep(local_2, 2.0f);
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
        this.HideMonster(this.BossSword);
        this.HideMonster(this.BossQiong);
        this.InitAllStepInfos();
        this.RegisterAllEvents();
        this.SetPlayerInvincible(true);
        this.SetPlayerLockHp(true);
        int local_14 = FMath::Clamp(this.TestStartStep, 1, this.LastStep);
        Super::CallTutorialStep(local_14, 2.0f);
        return;
    }
    UFUNCTION()
    void ECSEndPlayBP_Implementation()
    {
        this.RestoreBreakDefenseItemSlots();
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
        this.StepConfigKeys[0] = n"CombatTutorialBoss_0_Lock";
        this.StepConfigKeys[1] = n"CombatTutorialBoss_1_Stagger";
        this.StepConfigKeys[2] = n"CombatTutorialBoss_2_Ignite";
        this.StepConfigKeys[3] = n"CombatTutorialBoss_3_Break";
        this.StepConfigKeys[4] = n"CombatTutorialBoss_3_StealDivine";
        this.StepConfigKeys[5] = n"CombatTutorialBoss_4_DivineEnhance";
        this.StepConfigKeys[6] = n"CombatTutorialBoss_5_DivineStolen";
        this.StepConfigKeys[7] = n"CombatTutorialBoss_6_BreakDefense";
        this.StepConfigKeys[8] = n"CombatTutorialBoss_7_ItemHint";
        this.StepConfigKeys[9] = n"CombatTutorialBoss_8_DivineStolenHint";
        this.StepConfigKeys[10] = n"CombatTutorialBoss_9_FreePractice";
        return;
    }
    FTutorialInfo GetStepInfo(const int Step)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FTutorialInfo __r; return __r;
    }
    void InitAllStepInfos()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RegisterAllEvents()
    {
        this.RegisterLevelEventCallback(n"OnLockEvent", FCE_LockTargetChangeEvent, this.PlayerPawnEntity);
        this.RegisterLevelEventCallback(n"OnCustomEvent", FCE_CustomLevelEvent, ENTITY_NULL);
        this.RegisterLevelEventCallback(n"OnItemEvent", FCE_ConsumeCombatItemEvent, this.PlayerPawnEntity);
        return;
    }
    void SetupStep_Lock()
    {
        Super::BeginStepTutorial(this.Step1Info);
        this.ShowSwordBoss();
        return;
    }
    void SetupStep_Stagger()
    {
        Super::BeginStepTutorial(this.Step2Info);
        this.ShowSwordBoss();
        this.SetBossStepBuff(this.BossSword, this.StaggerBossBuffConfig);
        this.StaggerCheckTimer.BindUFunction(this, n"OnStaggerCheckTick");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.StaggerCheckTimer, 0.2f, true, -1.0f);
        return;
    }
    void SetupStep_Ignite()
    {
        Super::BeginStepTutorial(this.Step3Info);
        this.ShowSwordBoss();
        this.SetBossStepBuff(this.BossSword, this.IgniteBossBuffConfig);
        if (this.BossSword.IsValid() && this.IgnitePostureZeroBuffConfig.IsValid())
        {
            this.IgnitePostureZeroBuffEntity = ::BlueprintFunctions_Level::LevelAddBuff(FECSEntityAdapter(this.BossSword), this.BossSword, this.IgnitePostureZeroBuffConfig, -1.0f);
        }
        this.IgniteCheckTimer.BindUFunction(this, n"OnIgniteCheckTick");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.IgniteCheckTimer, 0.2f, true, -1.0f);
        return;
    }
    void SetupStep_Break()
    {
        Super::BeginStepTutorial(this.Step4Info);
        this.ShowSwordBoss();
        this.SetBossStepBuff(this.BossSword, this.BreakBossBuffConfig);
        this.BreakCheckTimer.BindUFunction(this, n"OnBreakCheckTick");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.BreakCheckTimer, 0.2f, true, -1.0f);
        return;
    }
    void SetupStep_StealDivine()
    {
        Super::BeginStepTutorial(this.Step5Info);
        this.ShowSwordBoss();
        this.StealDivineCheckTimer.BindUFunction(this, n"OnStealDivineCheckTick");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.StealDivineCheckTimer, 0.2f, true, -1.0f);
        return;
    }
    void SetupStep_DivineEnhance()
    {
        Super::BeginStepTutorial(this.Step6Info);
        this.ShowSwordBoss();
        this.bDivineEnhanceBuffDetected = false;
        this.DivineEnhanceCheckTimer.BindUFunction(this, n"OnDivineEnhanceCheckTick");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.DivineEnhanceCheckTimer, 0.2f, true, -1.0f);
        return;
    }
    void SetupStep_DivineStolen()
    {
        Super::BeginStepTutorial(this.Step7Info);
        this.ShowSwordBoss();
        Super::SetupMonster(this.BossSword, false, true, this.DivineStolenBossSkillIndex);
        Super::SetAllPlayerActionsDisabled(true);
        this.SetPlayerInvincible(false);
        this.DivineStolenCheckTimer.BindUFunction(this, n"OnDivineStolenCheckTick");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.DivineStolenCheckTimer, 0.2f, true, -1.0f);
        return;
    }
    void SetupStep_BreakDefense()
    {
        Super::BeginStepTutorial(this.Step8Info);
        this.SetupBreakDefenseItemSlots();
        this.ShowSwordBoss();
        Super::SetupMonster(this.BossSword, false, true, this.BreakDefenseBossSkillIndex);
        if (this.BreakDefenseESMStateNames.Num() > 0)
        {
            this.BreakDefenseCheckTimer.BindUFunction(this, n"OnBreakDefenseCheckTick");
            UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.BreakDefenseCheckTimer, 0.2f, true, -1.0f);
        }
        return;
    }
    void SetupStep_ItemHint()
    {
        Super::BeginStepTutorial(this.Step9Info);
        this.ItemHintAutoCompleteTimer.BindUFunction(this, n"OnItemHintAutoComplete");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.ItemHintAutoCompleteTimer, 5.0f, true, -1.0f);
        return;
    }
    void SetupStep_DivineStolenHint()
    {
        Super::BeginStepTutorial(this.Step10Info);
        this.DivineStolenHintAutoCompleteTimer.BindUFunction(this, n"OnDivineStolenHintAutoComplete");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.DivineStolenHintAutoCompleteTimer, 5.0f, true, -1.0f);
        return;
    }
    void SetupStep_FreePractice()
    {
        Super::BeginStepTutorial(this.Step11Info);
        this.ShowSwordBoss();
        ::BlueprintFunctions_Level::Level_FinishTraining();
        return;
    }
    void ShowSwordBoss()
    {
        this.ShowMonster(this.BossSword);
        this.HideMonster(this.BossQiong);
        return;
    }
    UFUNCTION()
    void OnLockEvent(const FCE_LockTargetChangeEvent &inout Event)
    {
        FECSEntity local_4 = FECSEntity(Event.TargetEntity);
        if (this.CurrentStep == 1 && !(this.LastLockTarget.IsValid()) && local_4.IsValid())
        {
            this.AdvanceLastProgress();
        }
        this.LastLockTarget = local_4;
        return;
    }
    UFUNCTION()
    void OnStaggerCheckTick()
    {
        if (this.CurrentStep != 2)
        {
            return;
        }
        Has local_8;
        if (!(this.BossSword.IsValid()) || !(local_8.opCall()))
        {
            return;
        }
        Get local_14;
        if (int(local_14.opCall().GetCurrentHitState()) == 7)
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.StaggerCheckTimer);
            this.AdvanceLastProgress();
        }
        return;
    }
    UFUNCTION()
    void OnIgniteCheckTick()
    {
        int local_12;
        if (this.CurrentStep != 3)
        {
            return;
        }
        Has local_8;
        if (!(this.BossSword.IsValid()) || !(local_8.opCall()))
        {
            return;
        }
        for (auto& local_30 : local_12)
        {
            if (int(local_30.GetAbnormalStateType()) == 1 && (int(local_30.GetActiveState()) == 1 || (int(local_30.GetActiveState()) == 2)))
            {
                UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.IgniteCheckTimer);
                this.AdvanceLastProgress();
                break;
            }
        }
        return;
    }
    UFUNCTION()
    void OnBreakCheckTick()
    {
        if (this.CurrentStep != 4)
        {
            return;
        }
        Has local_8;
        if (!(this.BossSword.IsValid()) || !(local_8.opCall()))
        {
            return;
        }
        Get local_14;
        if (int(local_14.opCall().GetCurrentHitState()) == 9)
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.BreakCheckTimer);
            this.AdvanceLastProgress();
        }
        return;
    }
    UFUNCTION()
    void OnStealDivineCheckTick()
    {
        if (this.CurrentStep != 5)
        {
            return;
        }
        if (this.PlayerPawnEntity.IsValid() && this.PlayerPawnEntity.MatchGameplayTag(GameplayTags::CombatState_DivineBurst))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.StealDivineCheckTimer);
            this.AdvanceLastProgress();
        }
        return;
    }
    UFUNCTION()
    void OnDivineEnhanceCheckTick()
    {
        if (this.CurrentStep != 6)
        {
            return;
        }
        if ((this.PlayerPawnEntity.IsValid() && this.PlayerPawnEntity.MatchGameplayTag(GameplayTags::CombatState_DivineBurst)))
        {
            this.bDivineEnhanceBuffDetected = true;
            return;
        }
        if (this.bDivineEnhanceBuffDetected)
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.DivineEnhanceCheckTimer);
            this.AdvanceLastProgress();
        }
        return;
    }
    UFUNCTION()
    void OnDivineStolenCheckTick()
    {
        if (this.CurrentStep != 7)
        {
            return;
        }
        if (this.PlayerPawnEntity.IsValid() && this.PlayerPawnEntity.MatchGameplayTag(GameplayTags::CombatState_DivineChaos))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.DivineStolenCheckTimer);
            this.AdvanceLastProgress();
        }
        return;
    }
    UFUNCTION()
    void OnBreakDefenseCheckTick()
    {
        int local_20 = 0;
        int local_26 = 0;
        if (this.CurrentStep != 8)
        {
            return;
        }
        Has local_8;
        Has local_14;
        if (!(this.BossSword.IsValid()) || !(local_8.opCall()) || !(local_14.opCall()))
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
            if (local_36 != nullptr && this.BreakDefenseESMStateNames.Contains(local_36.GetDataName()))
            {
                UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.BreakDefenseCheckTimer);
                this.AdvanceLastProgress();
                break;
            }
        }
        return;
    }
    UFUNCTION()
    void OnDivineStolenHintAutoComplete()
    {
        if (this.CurrentStep != 10)
        {
            return;
        }
        UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.DivineStolenHintAutoCompleteTimer);
        this.AdvanceLastProgress();
        return;
    }
    UFUNCTION()
    void OnItemHintAutoComplete()
    {
        if (this.CurrentStep != 9)
        {
            return;
        }
        UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.ItemHintAutoCompleteTimer);
        this.AdvanceLastProgress();
        return;
    }
    UFUNCTION()
    void OnRestoreInvincible()
    {
        this.SetPlayerInvincible(true);
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
        int local_1 = this.CurrentStep - 2;
        if (this.StepCompletionEvents.IsValidIndex(local_1) && !(this.StepCompletionEvents[local_1].IsNone()) && (Event.CustomName == this.StepCompletionEvents[local_1]))
        {
            this.AdvanceLastProgress();
        }
        return;
    }
    UFUNCTION()
    void OnItemEvent(const FCE_ConsumeCombatItemEvent &inout Event)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void OnTutorialFinished()
    {
        Super::SetAllPlayerActionsDisabled(false);
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.RestoreInvincibleTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.RestoreInvincibleTimer);
        }
        this.HideMonster(this.BossSword);
        this.HideMonster(this.BossQiong);
        this.SetPlayerInvincible(false);
        this.SetPlayerLockHp(false);
        this.RestoreBreakDefenseItemSlots();
        return;
    }
    void SetupBreakDefenseItemSlots()
    {
        if (this.bBreakItemSlotsSnapshotted)
        {
            return;
        }
        if (!(this.PlayerEntity.IsValid()) || !(this.ArmorBreakerConfig.IsSet()))
        {
            return;
        }
        FECSEntity local_10 = ::FASCommonUtils::GetUniquePlayerEntity(this.PlayerEntity);
        if (!(local_10.IsValid()))
        {
            return;
        }
        TDataObjectPtr<FItemQuickSlotConfig> local_36 = ::InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_Attack_1");
        TDataObjectPtr<FItemQuickSlotConfig> local_60 = ::InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_Attack_2");
        if (((local_36 == nullptr) || (local_60 == nullptr)))
        {
            return;
        }
        this.SavedCombatSlot1Item = ::InventoryUtils::GetQuickSlotItem(local_10, local_36);
        this.SavedCombatSlot2Item = ::InventoryUtils::GetQuickSlotItem(local_10, local_60);
        this.bBreakItemSlotsSnapshotted = true;
        CastTo local_136;
        TDataObjectPtr<FItemConfig> local_132 = local_136.opCall();
        if (local_132.IsSet())
        {
            ::InventoryUtils::AddInventoryItem(this.PlayerPawnEntity, local_132, 1);
        }
        TDataObjectPtr<FItemConfig> local_160;
        ::InventoryUtils::ForceSetQuickSlotItem_Internal(local_10, local_60, local_160);
        ::InventoryUtils::ForceSetQuickSlotItem_Internal(local_10, local_36, local_132);
        return;
    }
    void RestoreBreakDefenseItemSlots()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void ShowMonster(const FECSEntity &inout Monster)
    {
        if (!(Monster.IsValid()))
        {
            return;
        }
        ::BlueprintFunctions_Level::Level_EntitySwitchAI(FECSEntityAdapter(Monster), true);
        return;
    }
    void HideMonster(const FECSEntity &inout Monster)
    {
        if (!(Monster.IsValid()))
        {
            return;
        }
        ::BlueprintFunctions_Level::Level_EntitySwitchAI(FECSEntityAdapter(Monster), false);
        return;
    }
    void SetBossStepBuff(const FECSEntity &inout Boss, const FBuffConfigRef &inout BuffConfig)
    {
        this.ClearBossStepBuff();
        if (!(Boss.IsValid()) || !(BuffConfig.IsValid()))
        {
            return;
        }
        this.StepBossBuffOwner = Boss;
        this.StepBossBuffEntity = ::BlueprintFunctions_Level::LevelAddBuff(FECSEntityAdapter(Boss), Boss, BuffConfig, -1.0f);
        return;
    }
    void ClearBossStepBuff()
    {
        if (this.StepBossBuffEntity.IsValid() && this.StepBossBuffOwner.IsValid())
        {
            ::BlueprintFunctions_Level::LevelRemoveBuffById(FECSEntityAdapter(this.StepBossBuffOwner), this.StepBossBuffEntity);
            this.StepBossBuffEntity = FECSEntity();
            this.StepBossBuffOwner = FECSEntity();
        }
        if (this.IgnitePostureZeroBuffEntity.IsValid())
        {
            if (this.BossSword.IsValid())
            {
                ::BlueprintFunctions_Level::LevelRemoveBuffById(FECSEntityAdapter(this.BossSword), this.IgnitePostureZeroBuffEntity);
            }
            this.IgnitePostureZeroBuffEntity = FECSEntity();
        }
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
    void SetPlayerLockHp(const bool bEnable)
    {
        if (!(this.PlayerPawnEntity.IsValid()) || !(this.PlayerLockHpBuffConfig.IsValid()))
        {
            return;
        }
        if (bEnable)
        {
            FECSEntity local_14;
            if (!(this.PlayerLockHpBuffEntity.IsValid()))
            {
                local_14 = ::BlueprintFunctions_Level::LevelAddBuff(FECSEntityAdapter(this.PlayerPawnEntity), this.PlayerPawnEntity, this.PlayerLockHpBuffConfig, -1.0f);
                this.PlayerLockHpBuffEntity = local_14;
            }
            return;
        }
        if (this.PlayerLockHpBuffEntity.IsValid())
        {
            FECSEntity local_14;
            ::BlueprintFunctions_Level::LevelRemoveBuffById(FECSEntityAdapter(this.PlayerPawnEntity), this.PlayerLockHpBuffEntity);
            this.PlayerLockHpBuffEntity = local_14;
        }
        return;
    }
}

