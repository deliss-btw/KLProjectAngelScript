

class US_LookRequestFlowerWhipToxicSystemAS : UECSScriptSystem
{
    US_LookRequestFlowerWhipToxicSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void ClientJob_PushFlowerWhipToxicLookRequest(const FECSEntity &inout Entity, const FC_FlowerWhipToxicLook &inout Look, const FC_Transform &inout Transform, FC_LookRequestViewLocal &inout ViewLocal) const
    {
        if (!(Look.GetbRecorded()))
        {
            return;
        }
        Assign local_6;
        local_6.opCall(FC_TransformSyncDisabled());
        FVector local_14(Look.GetRecordedForward());
        Get local_18;
        const FC_ViewEntityManager& local_20 = local_18.opCall();
        if (local_20)
        {
            if (local_20.GetGameActorEntity().IsValid())
            {
                Get local_32;
                const FC_ViewEntityTransform& local_34 = local_32.opCall();
                if (local_34)
                {
                    local_14 = local_34.Transform.GetRotation().GetForwardVector();
                }
            }
        }
        FVector local_56(Transform.GetRotation().GetForwardVector());
        ::FC_LookRequest::PushOrUpdateViewBySource(Entity, EAnimLookSource(60), 60, uint8(::FAnimSnapshot::MakeSnapshotTypeMask(EAnimSnapshotType(1))), nullptr, FVector::ZeroVector, 0.2f, FRotator(0.0, (float32((FRotator::NormalizeAxis((local_56.Rotation().Yaw - local_14.Rotation().Yaw))))), 0.0));
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PushFlowerWhipToxicLookRequest() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_186 = 0;
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
                this.ClientJob_PushFlowerWhipToxicLookRequest(local_36, local_38, local_44, local_50);
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
        local_100.opCall();
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_36 = local_148.Proceed();
            ++local_114;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_PushFlowerWhipToxicLookRequest(local_186, local_38, local_44, local_50);
            local_58.opCall(local_50);
        }
        local_2.UpdateCachedEntityCount(local_114);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

