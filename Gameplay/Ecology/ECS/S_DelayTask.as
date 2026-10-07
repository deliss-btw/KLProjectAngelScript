

class US_EcologyDelayTaskSystem : UECSScriptSystem
{
    US_EcologyDelayTaskSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_DispatcherDelayTask(FCS_DelayTaskContainer &inout Container, FCS_EcologyDelayTaskLayer &inout TaskLayer) const
    {
        this.ExecuteLayer(TaskLayer.SpawnTaskLayer, Container, 100);
        this.ExecuteLayer(TaskLayer.TargetUpdateLayer, Container, 100);
        this.ExecuteLayer(TaskLayer.ActivityUpdateLayer, Container, 100);
        return;
    }
    void ExecuteLayer(FDelayTaskLayer &inout Layer, FCS_DelayTaskContainer &inout Container, const int Cost) const
    {
        FDelayTaskExecuteContext local_2;
        local_2.Cost = Cost;
        Container.ExecuteLayer(Layer, local_2);
        return;
    }
    UFUNCTION()
    void Run_Job_DispatcherDelayTask() const
    {
        int local_16 = 0;
        int local_22 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        this.Job_DispatcherDelayTask(local_16, local_22);
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        MarkModifiedIfDirty local_30;
        local_30.opCall(local_16);
        FECSWorldPtr local_4_6 = this.GetECSWorld();
        MarkModifiedIfDirty local_34;
        local_34.opCall(local_22);
        return;
    }
}

