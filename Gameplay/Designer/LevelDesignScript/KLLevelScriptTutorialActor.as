
enum ETutorialStepResult
{
    TutorialIncomplete,
    TutorialCompleted,
}

enum ETutorialMonsterTestState
{
    MoveOnly,
    UseSkill,
    MoveToTargetOnly,
}


class AKLLevelScriptTutorialActor : AKLLevelScriptBaseActor
{
    UPROPERTY()
    FECSEntity PlayerPawnEntity;
    UPROPERTY()
    FECSEntity MonsterEntity;
    UPROPERTY()
    FTutorialInfo CurrentTutorialInfo;
    UPROPERTY()
    int StepIndex;
    TSet<int> ExecutedSteps;
    TArray<int> PendingStepQueue;
    float32 TutorialStepDelay = 1.0f;
    FLevelTimerCallback StepTimerCallback;


    UFUNCTION()
    void OnTutorialStep_Implementation(const int InStepIndex)
    {
        return;
    }
    UFUNCTION()
    void OnStepCompleted_Implementation()
    {
        return;
    }
    UFUNCTION()
    void CallTutorialStep(const int InStepIndex, const float32 Delay = 2.0f)
    {
        if (this.ExecutedSteps.Contains(InStepIndex))
        {
            return;
        }
        this.ExecutedSteps.Add(InStepIndex);
        this.StepIndex = InStepIndex;
        this.TutorialStepDelay = Delay;
        this.PendingStepQueue.Add(InStepIndex);
        this.StepTimerCallback.BindUFunction(this, n"OnTutorialStepTimer");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.StepTimerCallback, this.TutorialStepDelay, false, -1.0f);
        return;
    }
    UFUNCTION()
    void OnTutorialStepTimer()
    {
        if (this.PendingStepQueue.Num() == 0)
        {
            return;
        }
        int local_4 = this.PendingStepQueue[0];
        this.PendingStepQueue.RemoveAt(0);
        this.OnTutorialStep(local_4);
        return;
    }
    void OnTutorialStep(const int InStepIndex)
    {
        __Evt_PushArgument__int32(InStepIndex);
        __Evt_Execute(this, n"OnTutorialStep");
        return;
    }
    UFUNCTION()
    void ShowTutorialGraphic(const TDataObjectPtr<FGuideGroupConfig> &inout GraphicConfig)
    {
        ::FTutorialUtils::SendOpenTutorialGraphicEvent(this.PlayerPawnEntity, GraphicConfig);
        return;
    }
    UFUNCTION()
    void SetCombatSkillsDisabled(const bool bDisabled = true)
    {
        FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(3), bDisabled);
        FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(5), bDisabled);
        FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(6), bDisabled);
        FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(4), bDisabled);
        FSkillUtils::SetSkillSlotDisabled(this.PlayerPawnEntity, ESkillSlot(7), bDisabled);
        return;
    }
    UFUNCTION()
    void StartTutorial(const FTutorialInfo &inout Info)
    {
        this.CurrentTutorialInfo = Info;
        ::FTutorialUtils::SendOpenTutorialEvent(this.PlayerPawnEntity, Info);
        return;
    }
    UFUNCTION()
    void AdvanceTutorialStep(ETutorialStepResult &out Result, const int InStepIndex = 1, const int ProgressIndex = 1)
    {
        Result = ETutorialStepResult(0);
        if (InStepIndex != this.StepIndex)
        {
            return;
        }
        int local_3 = ProgressIndex - 1;
        if (this.CurrentTutorialInfo.GetStepProgress().IsValidIndex())
        {
            FTutorialStepProgress local_8 = this.CurrentTutorialInfo.GetModify_StepProgress()[];
            if (local_8.GetCurrentProgress() < local_8.GetMaxProgress())
            {
                local_8.SetCurrentProgress((local_8.GetCurrentProgress() + 1));
            }
        }
        Result = ETutorialStepResult(0);
        auto local_16 = this.CurrentTutorialInfo.GetStepProgress().Iterator();
        for (; local_16.CanProceed;)
        {
            FTutorialStepProgress local_8_2 = local_16.Proceed();
            if (local_8_2.GetCurrentProgress() < local_8_2.GetMaxProgress())
            {
                ::FTutorialUtils::SendOpenTutorialEvent(this.PlayerPawnEntity, this.CurrentTutorialInfo);
                return;
            }
        }
        Result = ETutorialStepResult(1);
        ::FTutorialUtils::SendOpenTutorialEvent(this.PlayerPawnEntity, this.CurrentTutorialInfo);
        return;
    }
    UFUNCTION()
    void BeginStepTutorial(FTutorialInfo &inout Info)
    {
        for (auto& local_16 : Info.GetModify_StepProgress())
        {
            local_16.SetCurrentProgress(0);
        }
        Info.SetCountdown(0.0f);
        this.StartTutorial(Info);
        return;
    }
    UFUNCTION()
    void AdvanceAndCheck(const int ProgressIndex = 1)
    {
        ETutorialStepResult local_1;
        this.AdvanceTutorialStep(local_1, this.StepIndex, ProgressIndex);
        if (int(local_1) == 1)
        {
            this.OnStepCompleted();
        }
        return;
    }
    void OnStepCompleted()
    {
        __Evt_Execute(this, n"OnStepCompleted");
        return;
    }
    UFUNCTION()
    void SetAllPlayerActionsDisabled(const bool bDisabled = true)
    {
        if (!(this.PlayerPawnEntity.IsValid()))
        {
            return;
        }
        FFPTime local_8 = FFPTime(-1);
        FCE_SetGameplayInputEnabled local_12;
        local_12.bEnabled = !(bDisabled);
        return;
    }
    void SetupMonster(const FECSEntity &inout Monster, const bool bMoveOnly, const bool bInvincible, const int SkillIndex = -1)
    {
        int local_1;
        if (bMoveOnly)
        {
            int local_2;
            local_2 = 0;
            local_1 = local_2;
        }
        else
        {
            int local_2;
            local_2 = 1;
            local_1 = local_2;
        }
        this.SetupMonsterState(Monster, ETutorialMonsterTestState(local_1));
        return;
    }
    void SetupMonsterState(const FECSEntity &inout Monster, const ETutorialMonsterTestState TestState, const bool bInvincible, const int SkillIndex = -1)
    {
        if (!(Monster.IsValid()))
        {
            return;
        }
        ::BlueprintFunctions_Level::Level_EntitySwitchAI(FECSEntityAdapter(Monster), true);
        FNameHandle_EntityBBVarBool local_14;
        local_14;
        Monster.SetBB_Bool(local_14, n"bTestMode");
        FNameHandle_EntityBBVarInt local_20;
        local_20;
        Monster.SetBB_Int(local_20, n"TestMode.iTestState");
        local_20;
        Monster.SetBB_Int(local_20, n"TestMode.iTestSkillIndex");
        if (bInvincible)
        {
            ::BlueprintFunctions_Ability::Ability_SetLockHp(FECSEntityAdapter(Monster), n"Tutorial", false, 0.0f, 1.0f);
            return;
        }
        ::BlueprintFunctions_Ability::Ability_RemoveLockHp(FECSEntityAdapter(Monster), n"Tutorial");
        return;
    }
}

