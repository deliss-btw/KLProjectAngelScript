

class US_LogicDitherEffectSystem : UECSScriptSystem
{
    US_LogicDitherEffectSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_UpdateSyncLogicDitherRequest(const FECSEntity &inout Entity, FC_SyncDitherRequests &inout SyncDitherRequest, const FCS_FixedTime &inout FixedTime) const
    {
        int local_4 = SyncDitherRequest.GetRequests().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            const FDitherRequest& local_8 = SyncDitherRequest.GetRequests()[local_4];
            if (local_8.GetTargetValue() == 0.0f && ((local_8.GetStartTime().ToSeconds() + local_8.GetBlendDuration()) <= FixedTime.Time.ToSeconds()))
            {
                SyncDitherRequest.GetModify_Requests().RemoveAt(local_4);
            }
        }
        if (SyncDitherRequest.GetRequests().Num() == 0)
        {
            Remove local_20;
            local_20.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSyncLogicDitherRequest() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateSyncLogicDitherRequest(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateSyncLogicDitherRequest(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

