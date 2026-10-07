
const float32 TICK_COMBAT_SCORING_INTERVAL = 0.2f;

class US_AITargetingSystem : UECSScriptSystem
{
    UPROPERTY()
    TSubclassOf<AFXActor> TauntLinkEffect;
    UPROPERTY()
    FBuffConfigRef TargetingHintBuffRef;
    UPROPERTY()
    FName TauntLinkFXBeamStartName;
    UPROPERTY()
    FName TauntLinkFXBeamEndName;
    UPROPERTY()
    FName TauntFXTopName;

    US_AITargetingSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_ForceClearAITargeting(const FCE_ForceClearAITargeting &inout Event) const
    {
        if (Event.Sender.IsValid())
        {
            Has local_6;
            if (!(local_6.opCall()))
            {
                if (Event.bClearSelfTargeting)
                {
                    ::FAITargetingUtils::ClearSelfTargeting(Event.Sender);
                }
            }
        }
        ::FAITargetingUtils::ClearOthersRelatedTargeting(Event.Sender);
        return;
    }
    UFUNCTION()
    void Job_ClearPlayerNoiseAttraction(const FCS_AITargetingPlayerNoiseSensor &inout NoiseSensor) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Remove local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Job_ClearAttackTargetCount(FCS_AIAttackTargetCount &inout AIAttackTargetCount) const
    {
        AIAttackTargetCount.AttackerCountMap.Empty(0);
        AIAttackTargetCount.BeEngagingedTargetCountMap.Empty(0);
        return;
    }
    UFUNCTION()
    void Job_HandleAICurrentTargetChanged(const FCE_AITargetChangedV2 &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        Get local_6;
        if (local_6.opCall())
        {
            if ((FName(Event.TargetId.GetKey()) == n"TargetEntityID"))
            {
                if (Event.NewTarget.GetEntity().IsValid())
                {
                    ::FAIKnowledgeUtils::UpdateCombatKnowledgeAboutTargetV2(Event.Sender);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ForceClearAITargeting() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ForceClearAITargeting> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ForceClearAITargeting& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_ForceClearAITargeting(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearPlayerNoiseAttraction() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Job_ClearPlayerNoiseAttraction(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_ClearAttackTargetCount() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Job_ClearAttackTargetCount(local_12);
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_20;
        local_20.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAICurrentTargetChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AITargetChangedV2> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AITargetChangedV2& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleAICurrentTargetChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

