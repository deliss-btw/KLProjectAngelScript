UCLASS(Abstract)
class AGhostTrailActor : AActor
{
    AGhostTrailActor()
    {
        return;
    }
    UFUNCTION()
    void WhenSpawned_Implementation(const USkeletalMeshComponent MasterComp)
    {
        return;
    }
    void WhenSpawned(const USkeletalMeshComponent MasterComp)
    {
        __Evt_PushArgument__USkeletalMeshComponent(MasterComp);
        __Evt_Execute(this, n"WhenSpawned");
        return;
    }
}

class US_GhostTrail : UECSScriptSystem
{
    US_GhostTrail()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleSpawnGhostTrailActor(const FCE_SpawnGhostTrailActor &inout SpawnGhostTrailActor) const
    {
        UObject local_30;
        AGhostTrailActor local_58;
        int local_64 = 0;
        FECSEntity local_4 = SpawnGhostTrailActor.Receiver;
        if (local_4.GetActor() != nullptr)
        {
        }
        else
        {
        }
        USkeletalMeshComponent local_14;
        USkeletalMeshComponent local_16 = local_14;
        if (((local_4 && (local_16 != nullptr)) && !((SpawnGhostTrailActor.GhostClass == nullptr))))
        {
            local_30 = SpawnGhostTrailActor.GhostClass.ToSoftObjectPath().TryLoad();
            if (local_30 != nullptr)
            {
                local_58 = Cast<AGhostTrailActor>(SpawnActor(SpawnGhostTrailActor.GhostClass.Get(), local_16.GetWorldLocation(), local_16.GetWorldRotation(), NAME_None, false, nullptr, nullptr));
                local_58.WhenSpawned(local_16);
                local_64.Ghosts.Add(local_58);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleClearGhostTrailActor(const FCE_ClearGhostTrailActor &inout SpawnGhostTrailActor) const
    {
        Get local_4;
        const FC_GhostTrailStorage& local_6 = local_4.opCall();
        if (local_6)
        {
            for (auto local_22 : local_6.Ghosts)
            {
                if (local_22 != nullptr)
                {
                    local_22.DestroyActor();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleSpawnGhostTrailActor() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SpawnGhostTrailActor> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SpawnGhostTrailActor& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleSpawnGhostTrailActor(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleClearGhostTrailActor() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClearGhostTrailActor> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClearGhostTrailActor& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleClearGhostTrailActor(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

