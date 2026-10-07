

class US_EcosimAIV2QuestSystem : UECSScriptSystem
{
    UPROPERTY()
    UDataTable QuestDataTable;

    US_EcosimAIV2QuestSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleStartQuestByName(const FCE_EcosimAIV2StartQuest &inout Event) const
    {
        FEcsoimAIV2QuestData local_20;
        if (this.QuestDataTable != nullptr && this.QuestDataTable.FindRow(Event.QuestName, local_20))
        {
            FC_HTNInstance local_44;
            if (local_20.QuestHTNAsset.IsNull() || local_20.QuestBlackboardAsset.IsNull())
            {
                return;
            }
            FECSEntity local_34 = ECS::GetECSWorld().Create(EEntityType(9), n"EcosimAIV2_QuestEntity");
            local_44.bRunAtInitialization = true;
            local_44.HTNAsset = local_20.QuestHTNAsset;
            local_44.BlackboardAsset = local_20.QuestBlackboardAsset;
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleStartQuestByName() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2StartQuest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2StartQuest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleStartQuestByName(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

