class US_EcosimAIV2TokenSystem : UECSScriptSystem
{
    US_EcosimAIV2TokenSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_InitRealWorld() const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        ModifyOrAdd local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Job_UpdateAITokenByTarget(FCS_EcosimAIV2TokenByTarget &inout TokenByTarget) const
    {
        if (TokenByTarget.DataMap.IsEmpty())
        {
            return;
        }
        for (auto& local_20 : TokenByTarget.DataMap)
        {
            if (local_20.GetValue().CurrentConsumedTokenNum == 0)
            {
                local_20.GetValue().ParallelRecoverTimers.Empty(0);
                local_20.GetValue().RecoverTokenElapsedTimeCount = 0.0;
                continue;
            }
            const FAITokenByTargetConfig& local_26 = local_20.GetValue().Config.Get();
            if (int(local_26.RecoverMode) == 1)
            {
                while (local_20.GetValue().ParallelRecoverTimers.Num() < local_20.GetValue().CurrentConsumedTokenNum)
                {
                    local_20.GetValue().ParallelRecoverTimers.Add(0.0);
                }
                int local_29 = local_20.GetValue().ParallelRecoverTimers.Num() - 1;
                for (; local_29 >= 0; --local_29)
                {
                    float local_32 = 1.0;
                    float local_24_3 = local_20.GetValue().ParallelRecoverTimers[local_29];
                    local_24_3 = local_24_3 + local_32;
                    if (local_20.GetValue().ParallelRecoverTimers[local_29] >= local_26.TokenRecoverTime)
                    {
                        local_20.GetValue().ParallelRecoverTimers.RemoveAt(local_29);
                        local_20.GetValue().CurrentConsumedTokenNum = FMath::Max(0, (local_20.GetValue().CurrentConsumedTokenNum - 1));
                    }
                }
                continue;
            }
            float local_24_4 = local_20.GetValue().RecoverTokenElapsedTimeCount + 1.0;
            local_20.GetValue().RecoverTokenElapsedTimeCount = local_24_4;
            if (local_20.GetValue().RecoverTokenElapsedTimeCount >= local_26.TokenRecoverTime)
            {
                local_20.GetValue().CurrentConsumedTokenNum = FMath::Max(0, (local_20.GetValue().CurrentConsumedTokenNum - 1));
                local_24_4 = 0.0;
                local_20.GetValue().RecoverTokenElapsedTimeCount = 0.0;
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitRealWorld() const
    {
        ECS::GetContextJob();
        this.Job_InitRealWorld();
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAITokenByTarget() const
    {
        int local_16 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        FECSWorldPtr local_10 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_10_2 = this.GetECSWorld();
        this.Job_UpdateAITokenByTarget(local_16);
        FECSWorldPtr local_10_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_24;
        local_24.opCall(local_16);
        return;
    }
}

