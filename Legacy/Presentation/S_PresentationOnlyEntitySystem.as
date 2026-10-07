

class US_PresentationOnlyEntitySystem : UECSScriptSystem
{
    US_PresentationOnlyEntitySystem()
    {
        return;
    }
    UFUNCTION()
    void Job_InitPresenationOnlyEntity(const FECSEntity &inout Entity, FC_ViewEntityManager &inout ViewEntityManager, const FC_PresentationOnlyEntityInitData &inout InitData) const
    {
        const AActor local_104;
        Remove local_4;
        local_4.opCall();
        if (!(InitData.GetParentEntity().IsValid()))
        {
            return;
        }
        FQuat local_16 = FQuat(FQuat::Identity);
        switch (int(InitData.GetSpawnRotationType()))
        {
            const FC_Transform& local_26;
            Get local_24;
        case 1:
        {
            local_26 = local_24.opCall();
            if (local_26)
            {
                local_16 = (FQuat(local_26.GetRotation()) * FQuat(InitData.GetRotationOffset().Quaternion()));
            }
            break;
        }
        case 0:
        {
            const USceneComponent local_60 = InitData.GetParentEntity().GetActorVisualSceneRoot();
            if (local_60 != nullptr)
            {
                bool local_5 = InitData.GetSocketName().IsNone();
                if (local_5)
                {
                    local_16 = (local_60.GetWorldRotation().Quaternion() * FQuat(InitData.GetRotationOffset().Quaternion()));
                }
                else
                {
                    local_16 = (FQuat(local_60.GetSocketRotation(InitData.GetSocketName())) * FQuat(InitData.GetRotationOffset().Quaternion()));
                }
            }
            break;
        }
        case 2:
        {
            local_16 = FQuat(InitData.GetRotationOffset().Quaternion());
            break;
        }
        }
        FVector local_74(FVector::ZeroVector);
        if (int(InitData.GetSpawnPositionType()) == 0 && !(InitData.GetSocketName().IsNone()))
        {
            const USceneComponent local_60_2 = InitData.GetParentEntity().GetActorVisualSceneRoot();
            if (local_60_2 != nullptr)
            {
                local_74 = (local_60_2.GetSocketLocation(InitData.GetSocketName()) + local_16.Rotator().RotateVector(InitData.GetPositionOffset()));
            }
        }
        else
        {
            const FC_Transform& local_26;
            Get local_24;
            Get local_98;
            const FC_Collision& local_100 = local_98.opCall();
            if (local_100)
            {
                local_104 = InitData.GetParentEntity().GetActor();
                if (int(InitData.GetSpawnPositionType()) == 1)
                {
                    local_74 = ((local_104.GetActorLocation() + local_16.Rotator().RotateVector(InitData.GetPositionOffset())) + (local_104.GetActorRotation().RotateVector(FVector::DownVector) * local_100.GetScaledHalfHeight()));
                }
                else
                {
                    if ((int(InitData.GetSpawnPositionType())) == 2)
                    {
                        local_74 = (local_104.GetActorLocation() + local_16.Rotator().RotateVector(InitData.GetPositionOffset()));
                    }
                    else
                    {
                        if (int(InitData.GetSpawnPositionType()) == 3)
                        {
                            FVector local_88 = (local_104.GetActorLocation() + local_16.Rotator().RotateVector(InitData.GetPositionOffset()));
                            FVector local_94_2 = (local_104.GetActorRotation().RotateVector(FVector::UpVector) * local_100.GetScaledHalfHeight());
                            local_74 = (local_88 + local_94_2);
                        }
                    }
                }
            }
            else
            {
                local_26 = local_24.opCall();
                if (local_26)
                {
                    local_74 = (FVector(local_26.GetPosition()) + local_16.Rotator().RotateVector(InitData.GetPositionOffset()));
                }
            }
        }
        FECSEntity local_112 = FECSEntity(ViewEntityManager.GetGameActorEntity());
        FTransform local_140;
        ModifyOrAdd local_144;
        local_144.opCall().Transform = local_140;
        Assign local_148;
        local_148.opCall(FC_TransformSyncDisabled());
        return;
    }
    UFUNCTION()
    void Run_Job_InitPresenationOnlyEntity() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_180 = 0;
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
                this.Job_InitPresenationOnlyEntity(local_36, local_38, local_44);
                local_52.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
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
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitPresenationOnlyEntity(local_180, local_38, local_44);
            local_52.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

