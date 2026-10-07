

class US_ESMBBVarLerpSystem : UECSScriptSystem
{
    UPROPERTY()
    float32 LerpLifeTime = 1.0f;


    UFUNCTION()
    void Job_ClearBBVarLerps(const FCS_FixedTime &inout FixedTime, FC_ESMBBVarLerps &inout Lerp, const FECSEntity &inout Entity) const
    {
        int local_4 = Lerp.GetLerpKeys().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            FFPTime local_10 = (FFPTime(FixedTime.Time) - Lerp.GetLerpKeys()[local_4].GetTimeEnd());
            if (local_10.opCmp(this.LerpLifeTime) >= 0)
            {
                Lerp.GetModify_LerpKeys().RemoveAt(local_4);
            }
        }
        if (Lerp.GetLerpKeys().Num() == 0)
        {
            Remove local_18;
            local_18.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_ApplyBBVarLerp(const FCS_LocalTime &inout LocalTime, const FC_ESMBBVarLerps &inout Lerp, const FECSEntity &inout Entity) const
    {
        for (auto& local_16 : Lerp.GetLerpKeys())
        {
            if (FFPTime(local_16.GetTimeEnd()).opCmp(LocalTime.LastTime) > 0)
            {
                Entity.SetBB_Float(local_16.GetVarName().opImplConv(), local_16.GetTimeStart(), local_16.GetFromValue());
                Entity.SetBB_Float(local_16.GetVarName().opImplConv(), local_16.GetTimeEnd(), local_16.GetTargetValue());
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearBBVarLerps() const
    {
        int local_6 = 0;
        int local_40 = 0;
        const FECSEntity& local_46;
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
                this.Job_ClearBBVarLerps(local_6, local_40, local_46);
                local_50.opCall(local_40);
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
            local_46 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_ClearBBVarLerps(local_6, local_40, local_174);
            local_50.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ApplyBBVarLerp() const
    {
        int local_12 = 0;
        int local_46 = 0;
        const FECSEntity& local_52;
        int local_176 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.Job_ApplyBBVarLerp(local_12, local_46, local_52);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_52 = local_138.Proceed();
            ++local_104;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_52.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_52);
            this.Job_ApplyBBVarLerp(local_12, local_46, local_176);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
}

