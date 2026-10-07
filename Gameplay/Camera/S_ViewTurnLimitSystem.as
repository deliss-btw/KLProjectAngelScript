
const FConsoleVariable CVar_Camera_ViewTurnLimitEnableCorrection = FConsoleVariable();

namespace __ConsoleCommond
{
class UAimViewTurnSpeedConsoleCommand : UKLConsoleCommandLibrary
{
    default Category = n"Camera";

    UAimViewTurnSpeedConsoleCommand()
    {
        return;
    }
    UFUNCTION()
    void TestViewDirJitter_Implementation(const float32 MaxYaw = 3.f, const float32 MaxPitch = 1.f, const float32 ChancePerFrame = 0.03f)
    {
        US_ViewTurnLimitSystem local_6 = Cast<US_ViewTurnLimitSystem>(AECSGameManagerActor::GetSystem(ECS::GetUEWorld(), US_ViewTurnLimitSystem));
        if (local_6 == nullptr)
        {
            XLog(ELog(10), "[TestViewDirJitter] ViewTurnLimitSystem not found");
            return;
        }
        local_6.StartTestJitter(MaxYaw, MaxPitch, ChancePerFrame);
        return;
    }
    UFUNCTION()
    void StopTestViewDirJitter_Implementation()
    {
        US_ViewTurnLimitSystem local_6 = Cast<US_ViewTurnLimitSystem>(AECSGameManagerActor::GetSystem(ECS::GetUEWorld(), US_ViewTurnLimitSystem));
        if (local_6 == nullptr)
        {
            return;
        }
        local_6.StopTestJitter();
        return;
    }
    void TestViewDirJitter(const float32 MaxYaw = 3.f, const float32 MaxPitch = 1.f, const float32 ChancePerFrame = 0.03f)
    {
        __Evt_PushArgument__float(MaxYaw);
        __Evt_PushArgument__float(MaxPitch);
        __Evt_PushArgument__float(ChancePerFrame);
        __Evt_Execute(this, n"TestViewDirJitter");
        return;
    }
    void StopTestViewDirJitter()
    {
        __Evt_Execute(this, n"StopTestViewDirJitter");
        return;
    }
}

}
class US_ViewTurnLimitSystem : UECSScriptSystem
{
    bool bTestJitterActive = false;
    float32 TestJitterMaxYaw = 5.0f;
    float32 TestJitterMaxPitch = 1.0f;
    float32 TestJitterChancePerFrame = 0.9f;


    void StartTestJitter(const float32 InMaxYaw, const float32 InMaxPitch, const float32 InChance)
    {
        this.bTestJitterActive = true;
        this.TestJitterMaxYaw = InMaxYaw;
        this.TestJitterMaxPitch = InMaxPitch;
        this.TestJitterChancePerFrame = InChance;
        XLog(ELog(10), FString().Append("[TestJitter] Started: MaxYaw=").Append(InMaxYaw).Append(" MaxPitch=").Append(InMaxPitch).Append(" Chance=").Append(InChance));
        return;
    }
    void StopTestJitter()
    {
        this.bTestJitterActive = false;
        XLog(ELog(10), "[TestJitter] Stopped");
        return;
    }
    FRotator ClampViewDirDelta(const FRotator &inout LastDir, const FRotator &inout TargetDir, const float32 MaxDeg) const
    {
        FRotator local_6;
        float32 local_7 = -MaxDeg;
        local_6.Yaw = (LastDir.Yaw + (FMath::Clamp(FMath::UnwindDegrees((TargetDir.Yaw - LastDir.Yaw)), local_7, MaxDeg)));
        local_6.Pitch = (LastDir.Pitch + (FMath::Clamp(TargetDir.Pitch - LastDir.Pitch, -MaxDeg, MaxDeg)));
        local_6.Roll = TargetDir.Roll;
        return local_6.GetNormalized();
    }
    UFUNCTION()
    void Job_RemoveExpiredTurnSpeedLimit(const FECSEntity &inout Entity, const FC_ViewTurnSpeedLimit &inout Limit) const
    {
        if (Limit.GetCounter() <= 0)
        {
            Remove local_8;
            local_8.opCall();
            Remove local_12;
            local_12.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_AddViewComponents(const FECSEntity &inout Entity, const FC_ViewTurnSpeedLimit &inout Limit) const
    {
        if (Limit.GetCounter() > 0)
        {
            FECSWorldPtr local_12 = this.GetECSWorld();
            FCS_FixedTime local_18;
            int local_1 = int(local_18.Frame);
            ModifyOrAdd local_22;
            local_22.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_RemoveViewComponents(const FECSEntity &inout Entity, FC_CorrectedInputDeltaRecords &inout History) const
    {
        Remove local_4;
        local_4.opCall();
        Remove local_10;
        local_10.opCall();
        return;
    }
    UFUNCTION()
    void Job_CacheServerDir(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_Input &inout Input, const FC_ViewTurnSpeedLimit &inout Limit) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        FCS_ServerTime local_8;
        if (int(FixedTime.Frame) != (int(local_8.Frame) + 1))
        {
            return;
        }
        FName local_20 = FCharacterInputUtils::GetCorrectedViewDirInputName();
        FC_ServerViewDirCache local_18;
        local_18.CachedServerDir = Input.State.GetAxisAsRotatorNoCheck(local_20, local_8.Time);
        return;
    }
    UFUNCTION()
    void Job_ClampCameraDirInput(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, FC_Input &inout Input, FC_ViewTurnSpeedLimit &inout Limit) const
    {
        float32 local_1 = 2.0f;
        FName local_11 = FCharacterInputUtils::GetViewDirInputName();
        FRotator local_24 = Input.State.GetAxisAsRotatorNoCheck(local_11, FixedTime.Time);
        FName local_26 = FCharacterInputUtils::GetCorrectedViewDirInputName();
        FRotator local_18 = Input.State.GetAxisAsRotatorNoCheck(local_26, FixedTime.LastTime);
        Limit.SetCacheDir(local_24);
        if (local_24.Equals(local_18, 0.01))
        {
            return;
        }
        FRotator local_40;
        local_40 = this.ClampViewDirDelta(local_18, local_24, (Limit.GetMaxTurnSpeed() * (float32((FixedTime.DeltaTime.ToSeconds() * local_1)))));
        if (!(local_40.Equals(local_24, 0.01)))
        {
            FRotator local_46;
            local_46.Yaw = FMath::UnwindDegrees((local_24.Yaw - local_18.Yaw));
            local_46.Pitch = (local_24.Pitch - local_18.Pitch);
            FVector local_52 = FVector(local_40.Yaw, local_40.Pitch, local_40.Roll);
            Input.State.OverwriteLatestAxis(local_11, local_52);
            FInputData local_64;
            local_64.Name = local_11;
            local_64.Time = FixedTime.Time;
            local_64.Value = local_52;
            Input.GetOrAddPacket(int(FixedTime.Frame)).ReplaceOrAdd(local_64);
        }
        return;
    }
    UFUNCTION()
    void Job_ClampCorrectedDirInput(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, FC_Input &inout Input, const FC_ViewTurnSpeedLimit &inout Limit) const
    {
        FName local_2 = FCharacterInputUtils::GetCorrectedViewDirInputName();
        FRotator local_14 = Input.State.GetAxisAsRotatorNoCheck(local_2, FixedTime.Time);
        if (Limit.GetbOnlyLimitPlayerInput())
        {
            return;
        }
        FRotator local_8 = Input.State.GetAxisAsRotatorNoCheck(local_2, FixedTime.LastTime);
        float32 local_23 = 2.0f;
        FName local_33 = FCharacterInputUtils::GetViewOffsetInputName();
        if (local_14.Equals(local_8, 0.01))
        {
            return;
        }
        FRotator local_22 = this.ClampViewDirDelta(local_8, local_14, (Limit.GetMaxTurnSpeed() * (float32((FixedTime.DeltaTime.ToSeconds() * local_23)))));
        if (!(local_22.Equals(local_14, 0.01)))
        {
            FRotator local_46;
            local_46.Yaw = FMath::UnwindDegrees((local_14.Yaw - local_8.Yaw));
            local_46.Pitch = (local_14.Pitch - local_8.Pitch);
            FVector local_52 = FVector(local_22.Yaw, local_22.Pitch, local_22.Roll);
            Input.State.OverwriteLatestAxis(local_2, local_52);
            FInputData local_64;
            local_64.Name = local_2;
            local_64.Time = FixedTime.Time;
            local_64.Value = local_52;
            Input.GetOrAddPacket(int(FixedTime.Frame)).ReplaceOrAdd(local_64);
            FVector local_78 = Input.State.GetAxisAsVectorNoCheck(local_33, FixedTime.Time);
            if (!(local_78.IsNearlyZero(0.1)))
            {
                FQuat local_92 = FQuat((local_22 - local_14));
                FVector local_72 = local_92.RotateVector(local_78);
                if (!(local_78.Equals(local_72, 0.1)))
                {
                    Input.State.OverwriteLatestAxis(local_33, local_72);
                    FInputData local_108;
                    local_108.Name = local_33;
                    local_108.Time = FixedTime.Time;
                    local_108.Value = local_72;
                    Input.GetOrAddPacket(int(FixedTime.Frame)).ReplaceOrAdd(local_108);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_ReconstructViewDirAfterRollback(FCS_InputLocal &inout InputLocal, const FECSEntity &inout Entity, const FC_Input &inout Input, const FC_ViewTurnSpeedLimit &inout Limit, const FC_ServerViewDirCache &inout Cache, const FC_CorrectedInputDeltaRecords &inout History) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        FCS_ServerTime local_8;
        int local_9 = int(local_8.Frame);
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FCS_FixedTime local_16;
        int local_17 = int(local_16.Frame);
        if ((local_9 >= local_17 || (local_9 <= 0)))
        {
            return;
        }
        int local_10 = local_17 - local_9;
        if (local_10 >= int(History.MaxBufferSize))
        {
            return;
        }
        if (local_9 < int(History.StartFrame))
        {
            return;
        }
        if (int(Cache.CachedServerFrame) != local_9)
        {
            return;
        }
        FRotator local_26 = FRotator(Cache.CachedServerDir);
        FRotator local_32 = FRotator(InputLocal.ViewDir);
        FRotator local_38 = FRotator(FRotator::ZeroRotator);
        FRotator local_44 = FRotator(FRotator::ZeroRotator);
        FRotator local_50 = FRotator(FRotator::ZeroRotator);
        FName local_52 = FCharacterInputUtils::GetViewDirInputName();
        FRotator local_64 = Input.State.GetAxisAsRotatorNoCheck(local_52, local_16.Time);
        int local_10_2 = local_9 + 1;
        for (; local_10_2 <= local_17; )
        {
            FRotator local_58 = FCameraUtils::GetHistoryAimCorrDelta(Entity, local_10_2);
            FRotator local_72 = FCameraUtils::GetHistoryViewInputDelta(Entity, local_10_2);
            float local_84 = local_38.Yaw;
            local_38.Yaw = (local_84 + (local_72.Yaw + local_58.Yaw));
            local_84 = local_72.Pitch + local_58.Pitch;
            local_38.Pitch += local_84;
            local_44 += local_72;
            local_50 += local_58;
            ++local_10_2;
        }
        FRotator local_78 = ((local_26 + local_38) - InputLocal.ViewDir).GetNormalized();
        if (!(CVar_Camera_ViewTurnLimitEnableCorrection.GetBool()))
        {
            if (!(local_78.IsNearlyZero(0.01)))
            {
                XLog(ELog(10), FString().Append("[ViewDirReconstruct] Rollback detected. SF=").Append(local_9).Append(", CF=").Append(local_17).Append(", Error=(").Append(local_78).Append(")"));
            }
            return;
        }
        if (!(local_78.IsNearlyZero(0.01)))
        {
            FC_ViewDirCorrection local_104;
            local_104.ErrorToCorrect = local_78;
            local_104.bActive = true;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_SmoothViewDirCorrection(FCS_InputLocal &inout InputLocal, const FECSEntity &inout Entity, FC_ViewDirCorrection &inout Correction, const FC_ViewTurnSpeedLimit &inout Limit) const
    {
        if (!(CVar_Camera_ViewTurnLimitEnableCorrection.GetBool()))
        {
            return;
        }
        if (!(Correction.bActive))
        {
            return;
        }
        FRotator local_8 = FRotator(Correction.ErrorToCorrect);
        int local_9 = 1092616192;
        if (FMath::Abs(local_8.Yaw) > 10.0 || (FMath::Abs(local_8.Pitch) > 10.0))
        {
            InputLocal.ViewDir += local_8;
            Correction.ErrorToCorrect = FRotator::ZeroRotator;
            Correction.bActive = false;
            return;
        }
        FRotator local_30;
        float32 local_10 = float32(ECS::GetContextDeltaTime().ToSeconds());
        float32 local_37 = float32(this.GetECSWorld().GetFixedTime().DeltaTime.ToSeconds());
        local_10 = local_10 / local_37;
        float32 local_37_2 = FMath::Clamp(local_10, 0.0f, 1.0f);
        local_30.Yaw = (local_8.Yaw * local_37_2);
        local_30.Pitch = (local_8.Pitch * local_37_2);
        local_30.Roll = 0.0;
        InputLocal.ViewDir += local_30;
        Correction.ErrorToCorrect -= local_30;
        if (Correction.ErrorToCorrect.IsNearlyZero(0.01))
        {
            Correction.ErrorToCorrect = FRotator::ZeroRotator;
            Correction.bActive = false;
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RemoveExpiredTurnSpeedLimit() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_RemoveExpiredTurnSpeedLimit(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_RemoveExpiredTurnSpeedLimit(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_AddViewComponents() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_AddViewComponents(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_AddViewComponents(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_RemoveViewComponents() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_RemoveViewComponents(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_RemoveViewComponents(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CacheServerDir() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_180 = 0;
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
                this.Job_CacheServerDir(local_6, local_40, local_42, local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_CacheServerDir(local_6, local_180, local_42, local_48);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClampCameraDirInput() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_60;
        int local_188 = 0;
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
                this.Job_ClampCameraDirInput(local_6, local_40, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_Input> local_56;
                local_56.opCall(local_42);
                local_60.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_98).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_98.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ClampCameraDirInput(local_6, local_188, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_Input>(local_40).opCall(local_42);
            local_60.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClampCorrectedDirInput() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_184 = 0;
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
                this.Job_ClampCorrectedDirInput(local_6, local_40, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_Input> local_56;
                local_56.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ClampCorrectedDirInput(local_6, local_184, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_Input>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ReconstructViewDirAfterRollback() const
    {
        int local_12 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        int local_66 = 0;
        int local_202 = 0;
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
            const FECSEntity& local_46;
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
                this.ClientJob_ReconstructViewDirAfterRollback(local_12, local_46, local_48, local_54, local_60, local_66);
            }
            local_2.UpdateCachedEntityCount(local_23);
        }
        else
        {
            const FECSEntity& local_46;
            FECSRuntimeView local_108 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
            Include local_112;
            local_112.opCall();
            Include local_116;
            local_116.opCall();
            Include local_120;
            local_120.opCall();
            Include local_124;
            local_124.opCall();
            Exclude(local_108).opCall();
            bool local_9 = local_2.BeginViewCacheBuild();
            int local_24 = local_2.GetViewCacheEpoch();
            int local_130 = 0;
            FECSRuntimeViewIterator local_164 = local_108.Iterator();
            for (; local_164.CanProceed;)
            {
                local_46 = local_164.Proceed();
                ++local_130;
                if (local_9)
                {
                    local_2.AddViewCacheEntity(local_46.GetId());
                }
                FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
                this.ClientJob_ReconstructViewDirAfterRollback(local_12, local_202, local_48, local_54, local_60, local_66);
            }
            local_2.UpdateCachedEntityCount(local_130);
            if (local_9)
            {
                local_2.CommitViewCacheBuild(local_24);
            }
        }
        FECSWorldPtr local_20 = this.GetECSWorld();
        MarkModifiedIfDirty local_206;
        local_206.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_SmoothViewDirCorrection() const
    {
        int local_12 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
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
            MarkModifiedIfDirty local_62;
            const FECSEntity& local_46;
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
                this.ClientJob_SmoothViewDirCorrection(local_12, local_46, local_48, local_54);
                local_62.opCall(local_48);
            }
            local_2.UpdateCachedEntityCount(local_23);
        }
        else
        {
            MarkModifiedIfDirty local_62;
            const FECSEntity& local_46;
            FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
            Include local_104;
            local_104.opCall();
            Include local_108;
            local_108.opCall();
            Exclude(local_100).opCall();
            bool local_9 = local_2.BeginViewCacheBuild();
            int local_24 = local_2.GetViewCacheEpoch();
            int local_114 = 0;
            FECSRuntimeViewIterator local_148 = local_100.Iterator();
            for (; local_148.CanProceed;)
            {
                local_46 = local_148.Proceed();
                ++local_114;
                if (local_9)
                {
                    local_2.AddViewCacheEntity(local_46.GetId());
                }
                FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
                this.ClientJob_SmoothViewDirCorrection(local_12, local_186, local_48, local_54);
                local_62.opCall(local_48);
            }
            local_2.UpdateCachedEntityCount(local_114);
            if (local_9)
            {
                local_2.CommitViewCacheBuild(local_24);
            }
        }
        FECSWorldPtr local_20 = this.GetECSWorld();
        MarkModifiedIfDirty local_190;
        local_190.opCall(local_12);
        return;
    }
}

