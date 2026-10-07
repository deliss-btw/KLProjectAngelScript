

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
        int local_21 = 0;
        int local_22 = 0;
        float local_24 = 0.0;
        const FAITokenByTargetConfig& local_26;
        int local_28 = 0;
        if (TokenByTarget.DataMap.IsEmpty())
        {
            return;
        }
        for (auto& local_20 : TokenByTarget.DataMap)
        {
            local_20;
            if (local_21 == 0)
            {
                local_24 = 0.0;
                continue;
            }
            local_21 = int(local_26.RecoverMode);
            if (local_21 == 1)
            {
                while (local_22 < local_21)
                {
                    local_24 = 0.0;
                }
                int local_29 = local_22 - 1;
                for (; local_29 >= 0; --local_29)
                {
                    float local_32 = 1.0;
                    local_24 = local_24 + local_32;
                    local_24 = local_26.TokenRecoverTime;
                    if (local_32 >= local_24)
                    {
                        local_28 = local_28 - 1;
                        int local_35 = FMath::Max(0, local_28);
                    }
                }
                continue;
            }
            float local_32_2 = 1.0;
            local_24 = local_24 + local_32_2;
            if (local_32_2 >= local_26.TokenRecoverTime)
            {
                local_21 = FMath::Max(0, local_21 - 1);
                local_24 = 0.0;
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

