

class AKLLevelScriptTutorialCombatEasy : AKLLevelScriptTutorialActor
{
    UPROPERTY()
    FECSEntity MonsterHammer;
    UPROPERTY()
    int MonsterHammerSkillIndex = -1;
    UPROPERTY()
    FECSEntity MonsterThrower;
    UPROPERTY()
    int MonsterThrowerSkillIndex = -1;
    UPROPERTY()
    FECSEntity MonsterHammerKillable;
    UPROPERTY()
    int MonsterHammerKillableSkillIndex = -1;
    UPROPERTY()
    TDataObjectPtr<FSystemControlConfig> ItemBarSystemControl;
    UPROPERTY()
    TDataObjectPtr<FCombatItemConfig> ArmorBreakerConfig;
    UPROPERTY()
    TDataObjectPtr<FCombatItemConfig> HealthPotionConfig;
    UPROPERTY()
    TDataObjectPtr<FCombatItemConfig> MaxPotionConfig;
    UPROPERTY()
    FVector DodgeMonsterSpawnLocation;
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> DodgeMonsterConfig;
    UPROPERTY()
    int DodgeMonsterSkillIndex = -1;
    UPROPERTY()
    FBuffConfigRef EndureBuffConfig;
    UPROPERTY()
    FBuffConfigRef PlayerInvincibleBuffConfig;
    UPROPERTY()
    TArray<FName> SimpleSkillTriggerNames;
    UPROPERTY()
    TArray<FName> UltraSkillTriggerNames;
    UPROPERTY()
    TArray<FName> DivineSkillTriggerNames;
    UPROPERTY()
    FName ExitInteractEventName = n"Tutorial_Exit";
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
    FTutorialInfo Step12Info;
    UPROPERTY()
    FTutorialInfo Step13Info;
    UPROPERTY()
    FTutorialInfo Step14Info;
    UPROPERTY()
    FTutorialInfo Step15Info;
    UPROPERTY()
    FECSEntity PlayerEntity;
    int CurrentStep = 0;
    FECSEntity LastLockTarget;
    FFPTime LastDodgeCheckTime;
    FECSEntity SpawnedDodgeMonster;
    FLevelTimerCallback DodgePollTimerCallback;
    FECSEntity PlayerInvincibleBuffEntity;
    TDataObjectPtr<FItemConfig> SavedCombatSlot1Item;
    TDataObjectPtr<FItemConfig> SavedCombatSlot2Item;
    bool bCombatItemSlotsSnapshotted = false;


    UFUNCTION()
    void OnTutorialStep_Implementation(const int InStepIndex)
    {
        this.SetupTutorialCombatItemSlots();
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
            this.SetupStep_SwitchLock();
            return;
        }
        case 3:
        {
            this.SetupStep_NormalSpecialAttack();
            return;
        }
        case 4:
        {
            this.SetupStep_KillMonsters();
            return;
        }
        case 5:
        {
            this.SetupStep_Potion();
            return;
        }
        case 6:
        {
            this.SetupStep_Dodge();
            return;
        }
        case 7:
        {
            this.SetupStep_SimpleSkill();
            return;
        }
        case 8:
        {
            this.SetupStep_UltraSkill();
            return;
        }
        case 9:
        {
            this.SetupStep_DivineSkill();
            return;
        }
        case 10:
        {
            this.SetupStep_ArmorBreaker();
            return;
        }
        case 11:
        {
            this.SetupStep_HealingPotion();
            return;
        }
        case 12:
        {
            this.SetupStep_Mark();
            return;
        }
        case 13:
        {
            this.SetupStep_Emote();
            return;
        }
        case 14:
        {
            this.SetupStep_SocialAction();
            return;
        }
        case 15:
        {
            this.SetupStep_FreePractice();
        }
        }
        return;
    }
    UFUNCTION()
    void OnStepCompleted_Implementation()
    {
        int local_2 = this.CurrentStep + 1;
        if (this.CurrentStep == 10)
        {
            local_2 = 12;
        }
        if (local_2 <= 15)
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
        this.RegisterAllEvents();
        this.SetPlayerInvincible(true);
        int local_14 = FMath::Clamp(this.TestStartStep, 1, 15);
        Super::CallTutorialStep(local_14, 2.0f);
        return;
    }
    UFUNCTION()
    void ECSEndPlayBP_Implementation()
    {
        this.RestoreTutorialCombatItemSlots();
        return;
    }
    void RegisterAllEvents()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void OnSkillTriggerResponded(const FECSEntity &inout Entity, const FName &inout TriggerName, const int StateMachineIndex)
    {
        if ((!((Entity == this.PlayerPawnEntity))))
        {
            return;
        }
        if (this.CurrentStep == 7 && this.SimpleSkillTriggerNames.Contains(TriggerName))
        {
            Super::AdvanceAndCheck(1);
            return;
        }
        if (this.CurrentStep == 8 && this.UltraSkillTriggerNames.Contains(TriggerName))
        {
            Super::AdvanceAndCheck(1);
            return;
        }
        if (this.CurrentStep == 9 && this.DivineSkillTriggerNames.Contains(TriggerName))
        {
            Super::AdvanceAndCheck(1);
        }
        return;
    }
    void SetupStep_Lock()
    {
        Super::BeginStepTutorial(this.Step1Info);
        this.DisableItemBar(true);
        this.SetMountDisabled(true);
        Super::SetCombatSkillsDisabled(true);
        Super::SetupMonster(this.MonsterHammer, true, true, -1);
        Super::SetupMonster(this.MonsterThrower, true, true, -1);
        this.HideMonster(this.MonsterThrower);
        this.HideMonster(this.MonsterHammerKillable);
        return;
    }
    void SetupStep_NormalSpecialAttack()
    {
        Super::BeginStepTutorial(this.Step2Info);
        this.DisableItemBar(true);
        this.SetMountDisabled(true);
        Super::SetCombatSkillsDisabled(true);
        this.RecoverPlayerCustomSkillEnergy();
        Super::SetupMonster(this.MonsterHammer, true, true, -1);
        Super::SetupMonster(this.MonsterThrower, true, true, -1);
        return;
    }
    void SetupStep_SwitchLock()
    {
        Super::BeginStepTutorial(this.Step3Info);
        this.DisableItemBar(true);
        this.SetMountDisabled(true);
        Super::SetCombatSkillsDisabled(true);
        Super::SetupMonster(this.MonsterHammer, true, true, -1);
        Super::SetupMonster(this.MonsterThrower, true, true, -1);
        return;
    }
    void SetupStep_KillMonsters()
    {
        if (this.Step4Info.GetStepProgress().Num() < 1)
        {
            this.Step4Info.GetModify_StepProgress().SetNum(1);
        }
        this.Step4Info.GetModify_StepProgress()[0].SetMaxProgress(2);
        Super::BeginStepTutorial(this.Step4Info);
        this.DisableItemBar(true);
        this.SetMountDisabled(true);
        Super::SetCombatSkillsDisabled(true);
        Super::SetupMonster(this.MonsterHammer, true, false, -1);
        Super::SetupMonster(this.MonsterThrower, true, false, -1);
        this.HideMonster(this.MonsterHammerKillable);
        return;
    }
    void SetupStep_Potion()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void SetupStep_Dodge()
    {
        this.Step6Info.GetModify_StepProgress().SetNum(2);
        this.Step6Info.GetModify_StepProgress()[0].SetMaxProgress(3);
        this.Step6Info.GetModify_StepProgress()[1].SetMaxProgress(1);
        Super::BeginStepTutorial(this.Step6Info);
        this.SetMountDisabled(true);
        Super::SetCombatSkillsDisabled(true);
        this.DisableItemBar(false);
        this.SpawnDodgeMonster();
        FECSWorldPtr local_6 = this.PlayerPawnEntity.GetWorld();
        Get local_10;
        this.LastDodgeCheckTime = local_10.opCall().Time;
        this.DodgePollTimerCallback.BindUFunction(this, n"OnDodgeInputPoll");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.DodgePollTimerCallback, 0.15f, true, -1.0f);
        return;
    }
    void SetupStep_SimpleSkill()
    {
        this.Step7Info.GetModify_StepProgress().SetNum(1);
        this.Step7Info.GetModify_StepProgress()[0].SetMaxProgress(1);
        Super::BeginStepTutorial(this.Step7Info);
        this.SetMountDisabled(true);
        this.ResetCombatSkillSlots();
        FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(4), true);
        FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(7), true);
        Super::SetupMonster(this.SpawnedDodgeMonster, false, true, this.DodgeMonsterSkillIndex);
        return;
    }
    void SetupStep_UltraSkill()
    {
        this.Step8Info.GetModify_StepProgress().SetNum(1);
        this.Step8Info.GetModify_StepProgress()[0].SetMaxProgress(1);
        Super::BeginStepTutorial(this.Step8Info);
        this.SetMountDisabled(true);
        this.ResetCombatSkillSlots();
        FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(7), true);
        Super::SetupMonster(this.SpawnedDodgeMonster, false, true, this.DodgeMonsterSkillIndex);
        this.RecoverPlayerUltraEnergy();
        return;
    }
    void SetupStep_DivineSkill()
    {
        this.Step9Info.GetModify_StepProgress().SetNum(1);
        this.Step9Info.GetModify_StepProgress()[0].SetMaxProgress(1);
        Super::BeginStepTutorial(this.Step9Info);
        this.SetMountDisabled(true);
        this.ResetCombatSkillSlots();
        Super::SetupMonster(this.SpawnedDodgeMonster, false, true, this.DodgeMonsterSkillIndex);
        return;
    }
    void SetupStep_ArmorBreaker()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void SetupStep_HealingPotion()
    {
        Super::BeginStepTutorial(this.Step11Info);
        this.SetMountDisabled(true);
        Super::SetCombatSkillsDisabled(false);
        this.DisableItemBar(false);
        Super::SetupMonster(this.SpawnedDodgeMonster, false, true, this.DodgeMonsterSkillIndex);
        ::BlueprintFunctions_Level::Level_SetHPToRatio(FECSEntityAdapter(this.PlayerPawnEntity), 0.1f);
        return;
    }
    void SetupStep_Mark()
    {
        Super::BeginStepTutorial(this.Step12Info);
        this.SetMountDisabled(true);
        Super::SetCombatSkillsDisabled(false);
        this.DisableItemBar(false);
        Super::SetupMonster(this.SpawnedDodgeMonster, false, true, this.DodgeMonsterSkillIndex);
        return;
    }
    void SetupStep_Emote()
    {
        Super::BeginStepTutorial(this.Step13Info);
        this.SetMountDisabled(true);
        this.DestroyDodgeMonster();
        return;
    }
    void SetupStep_SocialAction()
    {
        Super::BeginStepTutorial(this.Step14Info);
        this.SetMountDisabled(true);
        return;
    }
    void SetupStep_FreePractice()
    {
        Super::BeginStepTutorial(this.Step15Info);
        this.SetMountDisabled(true);
        Super::SetCombatSkillsDisabled(false);
        this.DisableItemBar(false);
        Super::SetupMonster(this.SpawnedDodgeMonster, false, true, this.DodgeMonsterSkillIndex);
        ::BlueprintFunctions_Level::Level_FinishTraining();
        return;
    }
    UFUNCTION()
    void OnLockEvent(const FCE_LockTargetChangeEvent &inout Event)
    {
        FECSEntity local_4 = FECSEntity(Event.TargetEntity);
        if (this.CurrentStep == 1)
        {
            if (!(this.LastLockTarget.IsValid()) && local_4.IsValid())
            {
                Super::AdvanceAndCheck(1);
            }
        }
        else
        {
            if (this.CurrentStep == 2)
            {
                if (this.LastLockTarget.IsValid() && local_4.IsValid() && !((this.LastLockTarget == local_4)))
                {
                    Super::AdvanceAndCheck(1);
                }
            }
        }
        this.LastLockTarget = local_4;
        return;
    }
    UFUNCTION()
    void OnHitEvent(const FCE_HitEvent &inout HitEvent)
    {
        int local_7 = 0;
        if ((!((HitEvent.Attacker == this.PlayerPawnEntity))))
        {
            return;
        }
        if (!(HitEvent.AttackData.IsSet()))
        {
            return;
        }
        int local_6 = local_7;
        if (this.CurrentStep == 3)
        {
            if (::BlueprintFunctions_Ability::MatchAttackCategory(local_6, EAttackCategory(0)))
            {
                Super::AdvanceAndCheck(1);
            }
            if (::BlueprintFunctions_Ability::MatchAttackCategory(local_6, EAttackCategory(1)))
            {
                Super::AdvanceAndCheck(2);
            }
        }
        return;
    }
    UFUNCTION()
    void OnDeathEvent(const FCE_DeathEvent &inout DeathEvent)
    {
        if (this.CurrentStep != 4)
        {
            return;
        }
        FECSEntity local_8 = FECSEntity(DeathEvent.Sender);
        if (((local_8 == this.MonsterHammer) || (local_8 == this.MonsterThrower) || (local_8 == this.MonsterHammerKillable)))
        {
            Super::AdvanceAndCheck(1);
        }
        return;
    }
    UFUNCTION()
    void OnDodgeInputPoll()
    {
        int local_12 = 0;
        if (this.CurrentStep != 6)
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.DodgePollTimerCallback);
            return;
        }
        FECSWorldPtr local_6 = this.PlayerPawnEntity.GetWorld();
        if (FCharacterInputUtils::IsInputSlotJustPressed(this.PlayerPawnEntity, EESMTriggerInputSlot(40), this.LastDodgeCheckTime, local_12.Time))
        {
            Super::AdvanceAndCheck(1);
        }
        this.LastDodgeCheckTime = local_12.Time;
        return;
    }
    UFUNCTION()
    void OnPerfectDodgeEvent(const FCE_PerfectDodgeEvent &inout Event)
    {
        if (this.CurrentStep == 6)
        {
            Super::AdvanceAndCheck(2);
        }
        return;
    }
    UFUNCTION()
    void OnItemEvent(const FCE_ConsumeCombatItemEvent &inout Event)
    {
        bool local_77;
        if (this.CurrentStep == 5)
        {
            FDataObjectPtr local_76;
            bool local_3;
            if (!(this.HealthPotionConfig.IsSet()))
            {
                local_3 = false;
            }
            else
            {
                TDataObjectPtr<FCombatItemConfig> local_28;
                local_28 = Event.CombatItemConfig;
                local_76;
                local_3 = (local_28 == local_76);
            }
            if (local_3)
            {
                Super::AdvanceAndCheck(1);
            }
            return;
        }
        if (this.CurrentStep == 10)
        {
            FDataObjectPtr local_76;
            if (!(this.ArmorBreakerConfig.IsSet()))
            {
                local_77 = false;
            }
            else
            {
                local_76;
                local_77 = (Event.CombatItemConfig == local_76);
            }
            if (local_77)
            {
                Super::AdvanceAndCheck(1);
            }
            return;
        }
        if (this.CurrentStep == 11)
        {
            FDataObjectPtr local_76;
            bool local_3;
            if (!(this.MaxPotionConfig.IsSet()))
            {
                local_3 = false;
            }
            else
            {
                TDataObjectPtr<FCombatItemConfig> local_28;
                local_76;
                local_3 = (Event.CombatItemConfig == local_76);
            }
            if (local_3)
            {
                Super::AdvanceAndCheck(1);
            }
        }
        return;
    }
    UFUNCTION()
    void OnSocialEvent(const FCE_SocialActionAnimEvent &inout Event)
    {
        if (this.CurrentStep == 14)
        {
            Super::AdvanceAndCheck(1);
        }
        return;
    }
    UFUNCTION()
    void OnMarkLocationEvent(const FCE_RequestMarkLocation &inout Event)
    {
        if (this.CurrentStep == 12)
        {
            Super::AdvanceAndCheck(1);
        }
        return;
    }
    UFUNCTION()
    void OnMarkEntityEvent(const FCE_RequestMarkEntity &inout Event)
    {
        if (this.CurrentStep == 12)
        {
            Super::AdvanceAndCheck(2);
        }
        return;
    }
    UFUNCTION()
    void OnCustomWheelEvent(const FCE_ShowCustomWheelOptionRequest &inout Event)
    {
        int local_5 = 0;
        bool local_3 = this.CurrentStep == 13 && Event.OptionConfig.IsSet();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            int local_1 = local_5;
            local_3 = (local_1 == 0);
        }
        if (local_3)
        {
            Super::AdvanceAndCheck(1);
        }
        return;
    }
    UFUNCTION()
    void OnCustomEvent(const FCE_CustomLevelEvent &inout Event)
    {
        if (this.CurrentStep == 15)
        {
            if ((Event.CustomName == this.ExitInteractEventName))
            {
                this.OnTutorialFinished();
            }
        }
        return;
    }
    void OnTutorialFinished()
    {
        Super::SetCombatSkillsDisabled(false);
        this.SetMountDisabled(false);
        this.DisableItemBar(false);
        this.HideMonster(this.MonsterHammer);
        this.HideMonster(this.MonsterThrower);
        this.HideMonster(this.MonsterHammerKillable);
        this.DestroyDodgeMonster();
        this.SetPlayerInvincible(false);
        this.RestoreTutorialCombatItemSlots();
        return;
    }
    void SetupTutorialCombatItemSlots()
    {
        if (this.bCombatItemSlotsSnapshotted)
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
        this.bCombatItemSlotsSnapshotted = true;
        TDataObjectPtr<FItemConfig> local_132;
        ::InventoryUtils::ForceSetQuickSlotItem_Internal(local_10, local_60, local_132);
        CastTo local_136;
        ::InventoryUtils::ForceSetQuickSlotItem_Internal(local_10, local_36, local_136.opCall());
        return;
    }
    void RestoreTutorialCombatItemSlots()
    {
        if (!(this.bCombatItemSlotsSnapshotted))
        {
            return;
        }
        this.bCombatItemSlotsSnapshotted = false;
        if (!(this.PlayerEntity.IsValid()))
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
        if ((!((local_36 == nullptr))))
        {
            ::InventoryUtils::ForceSetQuickSlotItem_Internal(local_10, local_36, this.SavedCombatSlot1Item);
        }
        if ((!((local_60 == nullptr))))
        {
            ::InventoryUtils::ForceSetQuickSlotItem_Internal(local_10, local_60, this.SavedCombatSlot2Item);
        }
        return;
    }
    void SetMonsterEndure(const FECSEntity &inout Monster, const bool bEnable)
    {
        if (!(Monster.IsValid()) || !(this.EndureBuffConfig.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        if (!(local_6.IsValid()))
        {
            return;
        }
        if (bEnable)
        {
            FBuffUtils::AddBuff(Monster, this.EndureBuffConfig, local_6.GetFixedTime().Time, Monster, false, -1.0f, 1, false);
        }
        else
        {
            FBuffUtils::RemoveBuff(Monster, this.EndureBuffConfig, local_6.GetFixedTime().Time, EBuffEndType(0));
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
    void RecoverPlayerUltraEnergy()
    {
        if (!(this.PlayerPawnEntity.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        if (!(local_6.IsValid()))
        {
            return;
        }
        FGameAttributeUtils::Recover(this.PlayerPawnEntity, Attribute::UltraSkillEnergy, local_6.GetFixedTime().Time, FGameAttributeUtils::GetAttributeValue(this.PlayerPawnEntity, Attribute::UltraSkillEnergyMax, local_6.GetFixedTime().Time, false, 0.0f, false, FGameAttributeModificationValue()), -1.0f);
        return;
    }
    void RecoverPlayerCustomSkillEnergy()
    {
        if (!(this.PlayerPawnEntity.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        if (!(local_6.IsValid()))
        {
            return;
        }
        FGameAttributeUtils::Recover(this.PlayerPawnEntity, Attribute::CustomSkillEnergy, local_6.GetFixedTime().Time, FGameAttributeUtils::GetAttributeValue(this.PlayerPawnEntity, Attribute::CustomSkillEnergyMax, local_6.GetFixedTime().Time, false, 0.0f, false, FGameAttributeModificationValue()), -1.0f);
        return;
    }
    void ResetCombatSkillSlots()
    {
        if (!(this.PlayerPawnEntity.IsValid()))
        {
            return;
        }
        int local_2 = 16;
        int local_4 = 0;
        for (; local_4 < 16; )
        {
            FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(3), false);
            FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(5), false);
            FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(6), false);
            FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(4), false);
            FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(7), false);
            ++local_4;
        }
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
    void SpawnDodgeMonster()
    {
        this.DestroyDodgeMonster();
        if (!(this.DodgeMonsterConfig.IsSet()))
        {
            return;
        }
        FQuat local_16 = FQuat(FQuat::Identity);
        this.SpawnedDodgeMonster = ::BlueprintFunctions_Ecology::SpawnMonsterByMonsterId(this.DodgeMonsterConfig, this.DodgeMonsterSpawnLocation, local_16, nullptr, NAME_None, false);
        if (this.SpawnedDodgeMonster.IsValid())
        {
            FEntityCreateFinishDelegate local_24;
            local_24.BindUFunction(this, n"OnDodgeMonsterCreateFinish");
            ULevelEventManager local_28 = ::ULevelEventManager::Get();
        }
        return;
    }
    UFUNCTION()
    void OnDodgeMonsterCreateFinish(const FECSEntity &inout Entity)
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        Super::SetupMonster(Entity, false, true, this.DodgeMonsterSkillIndex);
        this.SetMonsterEndure(Entity, true);
        return;
    }
    void DestroyDodgeMonster()
    {
        if (this.SpawnedDodgeMonster.IsValid())
        {
            ::BlueprintFunctions_Level::Level_RemoveEntity(FECSEntityAdapter(this.SpawnedDodgeMonster));
            this.SpawnedDodgeMonster = FECSEntity();
        }
        return;
    }
    void SetMountDisabled(const bool bDisabled)
    {
        if (!(this.PlayerPawnEntity.IsValid()))
        {
            return;
        }
        ModifyOrAdd local_6;
        local_6.opCall().SetbIsDisallowed(bDisabled);
        return;
    }
    void DisableItemBar(const bool bDisabled)
    {
        if (!(this.PlayerEntity.IsValid()) || !(this.ItemBarSystemControl.IsSet()))
        {
            return;
        }
        if (bDisabled)
        {
            ::BlueprintFunctions_Level::Level_DisableSystemControl(this.PlayerEntity, this.ItemBarSystemControl);
            return;
        }
        ::BlueprintFunctions_Level::Level_EnableSystemControl(this.PlayerEntity, this.ItemBarSystemControl);
        return;
    }
}

