

class US_ASGameModeSystemPVB : US_ECSScriptGameModeSystemBase
{
    US_ASGameModeSystemPVB()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_Begin() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        ::FGameModeUtils::InitAttributeScale(this.GetECSWorld());
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FCS_GameModePreparingTag local_14;
        Assign local_12;
        local_12.opCall(local_14);
        return;
    }
    UFUNCTION()
    void ServerJob_TickPrepare() const
    {
        int local_22 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        if (::FLevelDataLayerUtils::IsWaitingForStreaming(this.GetWorld(), false))
        {
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            ::FGameModeUtils::InitTeamSpawner(this.GetECSWorld());
        }
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        XLog(ELog(22), "FinishPrepareGameEvent");
        local_22.SetStageType(EFCS_GameStageType(1));
        FECSWorldPtr local_2_4 = this.GetECSWorld();
        Remove local_28;
        local_28.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_Tick() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        switch (int(0.GetStageType()))
        {
        case 1:
        {
            this.TickPreparing();
            return;
        }
        case 2:
        {
            this.TickStart();
            return;
        }
        case 3:
        {
            this.TickPlaying();
            return;
        }
        case 4:
        {
            this.TickFinish();
            return;
        }
        }
        return;
    }
    void TickPreparing() const
    {
        int local_14 = 0;
        int local_176 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FECSRuntimeView local_52 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_56;
        local_56.opCall();
        Exclude(local_52).opCall();
        FECSRuntimeViewIterator local_94 = local_52.Iterator();
        for (; local_94.CanProceed;)
        {
            local_94.Proceed();
            FC_PlayerStates local_142;
            Assign local_136;
            local_136.opCall(local_142);
        }
        FCS_FixedTime local_8;
        int local_144 = int(local_8.Frame) % ECS::GetECSFixedFrameRate();
        if (local_144 == 0)
        {
            bool local_170;
            bool local_169;
            FECSRuntimeView local_32 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
            Include local_168;
            local_168.opCall();
            local_169 = true;
            local_170 = true;
            FECSRuntimeViewIterator local_128 = local_32.Iterator();
            for (; local_128.CanProceed;)
            {
                local_128.Proceed();
                local_170 = false;
                if (!(local_176.GetbReady()))
                {
                    local_169 = false;
                    break;
                }
            }
            if ((local_169 && !(local_170)))
            {
                FFPTime local_182 = (local_14.GetConfirmReadyTime() - FFPTime(1));
                local_14.SetConfirmReadyTime(local_182);
            }
            else
            {
                local_14.SetConfirmReadyTime(FFPTime(1));
            }
            if (FFPTime(local_14.GetConfirmReadyTime()).opCmp(0.0) <= 0)
            {
                FFPTime local_180 = FFPTime(-1);
                FECSWorldPtr local_2_3 = this.GetECSWorld();
                SendEvent local_188;
                local_188.opCall(ENTITY_NULL, local_180);
                local_14.SetStageType(EFCS_GameStageType(2));
                local_14.SetConfirmReadyTime(FFPTime(0));
            }
        }
        return;
    }
    void TickStart() const
    {
        int local_8 = 0;
        int local_20 = 0;
        int local_146 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        int local_21 = 0;
        FECSRuntimeView local_60 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        FECSRuntimeViewIterator local_102 = local_60.Iterator();
        for (; local_102.CanProceed;)
        {
            const FECSEntity& local_140 = local_102.Proceed();
            local_146.SetPlayerId(local_21 + 1);
            ::FGameModeUtils::SpawnAvatarsForPlayer(local_140, local_146, local_20);
            FECSEntity local_156 = FECSEntity(local_140.GetId());
            FECSWorldPtr local_2_4 = this.GetECSWorld();
            int local_22 = local_146.GetPlayerId();
            ++local_21;
        }
        local_8.SetStageType(EFCS_GameStageType(3));
        return;
    }
    void TickPlaying() const
    {
        return;
    }
    void TickFinish() const
    {
        return;
    }
    UFUNCTION()
    void Run_ServerJob_Begin() const
    {
        ECS::GetContextJob();
        this.ServerJob_Begin();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickPrepare() const
    {
        ECS::GetContextJob();
        this.ServerJob_TickPrepare();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_Tick() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        this.ServerJob_Tick();
        return;
    }
}

