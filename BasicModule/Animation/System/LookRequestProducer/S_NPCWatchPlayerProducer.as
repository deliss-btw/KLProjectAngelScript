

class US_LookRequestNPCWatchPlayerProducerSystemAS : UECSScriptSystem
{
    US_LookRequestNPCWatchPlayerProducerSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    bool IsTracking(const FECSEntity &inout Entity) const
    {
        Get local_4;
        const FC_LookRequestViewLocal& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_8 = 0;
            for (; local_8 < local_6.RequestArray.Num(); ++local_8)
            {
                if (int(local_6.RequestArray[local_8].Source) == 10)
                {
                    return true;
                }
            }
        }
        return false;
    }
    bool IsTargetInsideAngle(const FC_Transform &inout NPCTransform, const FVector &inout TargetPosWS, const FNPCWatchPlayerLookPresetConfig &inout Preset) const
    {
        FVector local_12 = (TargetPosWS - NPCTransform.GetPosition());
        if (local_12.IsNearlyZero(9.999999747378752e-5))
        {
            return false;
        }
        FVector local_28 = NPCTransform.GetRotation().UnrotateVector(local_12.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
        FVector local_6 = FVector(local_28.X, local_28.Y, 0.0);
        if (local_6.IsNearlyZero(9.999999747378752e-5))
        {
            return false;
        }
        float local_38_2 = FMath::RadiansToDegrees(FMath::Atan2(local_28.Y, local_28.X));
        float32 local_40 = float32(local_38_2);
        float32 local_39 = float32((FMath::RadiansToDegrees(FMath::Atan2(local_28.Z, local_6.Size()))));
        return (local_40 >= (FMath::Min(Preset.MinYawAngle, Preset.MaxYawAngle)) && (local_40 <= (FMath::Max(Preset.MinYawAngle, Preset.MaxYawAngle))) && (local_39 >= (FMath::Min(Preset.MinPitchAngle, Preset.MaxPitchAngle))) && (local_39 <= FMath::Max(Preset.MinPitchAngle, Preset.MaxPitchAngle)));
    }
    bool TryGetPlayerLookTarget(const FECSEntity &inout PlayerEntity, FVector &inout OutTargetPosWS, FVector &inout OutRootPosWS) const
    {
        if (!(PlayerEntity.IsValid()))
        {
            return false;
        }
        Get local_6;
        const FC_Transform& local_8 = local_6.opCall();
        if (local_8)
        {
            OutRootPosWS = local_8.GetPosition();
            Get local_12;
            const FC_AimPoseConfig& local_14 = local_12.opCall();
            if (local_14)
            {
                if (local_14.HasValidLookTargetCS())
                {
                    OutTargetPosWS = (FTransformUtils::GetOffsetRefLocation(PlayerEntity, local_8.ToFTransform(), EOffsetRefType(0)) + local_8.GetRotation().RotateVector(local_14.GetLookTargetCS()));
                    return true;
                }
            }
            OutTargetPosWS = FTransformUtils::GetOffsetRefLocation(PlayerEntity, local_8.ToFTransform(), EOffsetRefType(2));
            return true;
        }
        return false;
    }
    bool TryFindNearestPlayerTarget(const FC_Transform &inout NPCTransform, const FNPCWatchPlayerLookPresetConfig &inout Preset, const float32 ThresholdSq, const bool bPreferLocal, FVector &inout OutTargetPosWS) const
    {
        FVector local_6 = NPCTransform.GetPosition();
        float32 local_7 = 3.4028235e38f;
        bool local_9 = false;
        if (bPreferLocal)
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            Get local_16;
            const FCS_LocalPlayer& local_18 = local_16.opCall();
            if (local_18)
            {
                FVector local_30;
                FVector local_24;
                if (this.TryGetPlayerLookTarget(local_18.GetPlayerPawnEntity(), local_24, local_30))
                {
                    if (float32(local_6.DistSquared(local_30)) <= ThresholdSq && this.IsTargetInsideAngle(NPCTransform, local_24, Preset))
                    {
                        OutTargetPosWS = local_24;
                        return true;
                    }
                }
            }
        }
        FECSWorldPtr local_12_2 = ECS::GetECSWorld();
        FECSRuntimeView local_78 = local_12_2.GetRuntimeView(EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Include local_86;
        local_86.opCall();
        FECSRuntimeViewIterator local_120 = local_78.Iterator();
        for (; local_120.CanProceed;)
        {
            const FECSEntity& local_156 = local_120.Proceed();
            FVector local_30;
            FVector local_24;
            if (!(this.TryGetPlayerLookTarget(local_156, local_30, local_24)))
            {
                continue;
            }
            float32 local_35 = float32(local_6.DistSquared(local_24));
            if (local_35 > ThresholdSq)
            {
                continue;
            }
            if (local_35 >= local_7)
            {
                continue;
            }
            if (!(this.IsTargetInsideAngle(NPCTransform, local_30, Preset)))
            {
                continue;
            }
            local_7 = local_35;
            OutTargetPosWS = local_30;
            local_9 = true;
        }
        return local_9;
    }
    UFUNCTION()
    void ClientJob_WatchNearestPlayer(const FECSEntity &inout Entity, const FC_Transform &inout NPCTransform, const FC_NPCInfo &inout NPCInfo, FC_LookRequestViewLocal &inout ViewLocal) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Run_ClientJob_WatchNearestPlayer() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_194 = 0;
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
                this.ClientJob_WatchNearestPlayer(local_36, local_38, local_44, local_50);
                local_58.opCall(local_50);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_96.Iterator();
        for (; local_156.CanProceed;)
        {
            local_36 = local_156.Proceed();
            ++local_122;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_WatchNearestPlayer(local_194, local_38, local_44, local_50);
            local_58.opCall(local_50);
        }
        local_2.UpdateCachedEntityCount(local_122);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

