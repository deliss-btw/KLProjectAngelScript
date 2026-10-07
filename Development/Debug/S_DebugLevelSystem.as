

class US_DebugLevelSystem : UECSScriptSystem
{
    US_DebugLevelSystem()
    {
        return;
    }
    void DebugSetDataLayerRuntimeState(const FName &inout DataLayerShortName, const bool bActivate) const
    {
        UKLDataLayerInstance local_38;
        UDataLayerManager local_6 = this.GetWorld().GetDataLayerManager();
        if (local_6 != nullptr)
        {
            TArray<UDataLayerInstance> local_12 = local_6.GetDataLayerInstances();
            for (auto local_30 : local_12)
            {
                if ((DataLayerShortName == local_30.GetDataLayerShortName()))
                {
                    local_38 = Cast<UKLDataLayerInstance>(local_30);
                    if (local_38 != nullptr)
                    {
                        if (bActivate)
                        {
                            KLDataLayer::SetDataLayerRuntimeStateByLBPClass(__GetWorldContext(), local_38.KLLevelClass, EDataLayerRuntimeState(2));
                        }
                        else
                        {
                            KLDataLayer::SetDataLayerRuntimeStateByLBPClass(__GetWorldContext(), local_38.KLLevelClass, EDataLayerRuntimeState(0));
                        }
                    }
                    break;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DebugLoadDataLayerEvent(const FCE_DebugLoadDataLayerEvent &inout Event) const
    {
        this.DebugSetDataLayerRuntimeState(Event.DataLayerShortName, true);
        return;
    }
    UFUNCTION()
    void ServerJob_DebugUnloadDataLayerEvent(const FCE_DebugUnloadDataLayerEvent &inout Event) const
    {
        this.DebugSetDataLayerRuntimeState(Event.DataLayerShortName, false);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DebugLoadDataLayerEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DebugLoadDataLayerEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DebugLoadDataLayerEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DebugLoadDataLayerEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DebugUnloadDataLayerEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DebugUnloadDataLayerEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DebugUnloadDataLayerEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DebugUnloadDataLayerEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

