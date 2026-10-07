
const FConsoleVariable CVar_DebugEntityHistoryPosition = FConsoleVariable();

class US_DebugEntityHistoryPosition : UECSScriptSystem
{
    US_DebugEntityHistoryPosition()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return (CVar_DebugEntityHistoryPosition.GetInt() == 0);
    }
    UFUNCTION()
    void DebugEntityHistoryPosition(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_TransformHistory &inout TransformHistory, const FC_Input &inout Input, const FCS_FixedTime &inout Time) const
    {
        UWorld local_2 = ECS::GetUEWorld();
        if (local_2 == nullptr)
        {
            return;
        }
        FVector local_12 = Transform.GetPosition();
        DebugDraw::DrawDebugPoint(local_2, local_12, 5.0f, FColor::Red, false, 5.0f, uint8(0));
        return;
    }
    UFUNCTION()
    void Run_DebugEntityHistoryPosition() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
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
                this.DebugEntityHistoryPosition(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_100).opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.DebugEntityHistoryPosition(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

