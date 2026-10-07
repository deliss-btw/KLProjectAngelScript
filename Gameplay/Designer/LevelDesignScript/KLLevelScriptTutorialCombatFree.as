

class AKLLevelScriptTutorialCombatFree : AKLLevelScriptTutorialActor
{
    UPROPERTY()
    FECSEntity PracticeMonster;
    UPROPERTY()
    FBuffConfigRef PlayerInvincibleBuffConfig;
    UPROPERTY()
    FName ExitInteractEventName = n"Tutorial_Exit";
    UPROPERTY()
    FTutorialInfo Step1Info;
    UPROPERTY()
    FECSEntity PlayerEntity;
    int CurrentStep = 0;
    FECSEntity PlayerInvincibleBuffEntity;


    UFUNCTION()
    void OnTutorialStep_Implementation(const int InStepIndex)
    {
        this.CurrentStep = InStepIndex;
        if (InStepIndex <= 1)
        {
            if (InStepIndex != 1)
            {
                return;
            }
            this.SetupStep_FreePractice();
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
        Super::CallTutorialStep(1, 2.0f);
        return;
    }
    void RegisterAllEvents()
    {
        this.RegisterLevelEventCallback(n"OnCustomEvent", FCE_CustomLevelEvent, ENTITY_NULL);
        return;
    }
    void SetupStep_FreePractice()
    {
        Super::BeginStepTutorial(this.Step1Info);
        this.SetMountDisabled(false);
        Super::SetCombatSkillsDisabled(false);
        return;
    }
    UFUNCTION()
    void OnCustomEvent(const FCE_CustomLevelEvent &inout Event)
    {
        if ((this.CurrentStep == 1 && (Event.CustomName == this.ExitInteractEventName)))
        {
            this.OnTutorialFinished();
        }
        return;
    }
    void OnTutorialFinished()
    {
        this.SetPlayerInvincible(false);
        ::BlueprintFunctions_Level::Level_FinishTraining();
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
}

