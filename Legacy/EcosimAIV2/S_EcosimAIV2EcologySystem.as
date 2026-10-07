

class US_EcosimAIV2EcologySystem : UECSScriptSystem
{
    UPROPERTY()
    UEcosimAIV2CreaturePrefabDataAsset EcosimAIV2CreaturePrefabDataAsset;
    UPROPERTY()
    UDataTable EcosimAIV2UnitDataTable;

    US_EcosimAIV2EcologySystem()
    {
        return;
    }
    UFUNCTION()
    void Job_InitEcosimAIV2EcologySystem() const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        0.EcosimAIV2UnitDataTable = this.EcosimAIV2UnitDataTable;
        return;
    }
    UFUNCTION()
    void Job_HandleEcosimAIV2InitHumanEcology(const FCE_EcosimAIV2InitEcology &inout Event) const
    {
        XLog(ELog(0), "Job_HandleEcosimAIV2InitHumanEcology");
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        ::FEcosimAIV2Utils::DestroyAllEntities();
        return;
    }
    UFUNCTION()
    void Run_Job_InitEcosimAIV2EcologySystem() const
    {
        ECS::GetContextJob();
        this.Job_InitEcosimAIV2EcologySystem();
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEcosimAIV2InitHumanEcology() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2InitEcology> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2InitEcology& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEcosimAIV2InitHumanEcology(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

