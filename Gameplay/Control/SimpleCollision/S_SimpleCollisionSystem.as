

class US_SimpleCollisionSystem : UECSScriptSystem
{
    int MaxSlideIterations = 2;


    UFUNCTION()
    void Monitor_InitSimpleCollision(const FECSEntity &inout Entity, const FC_SimpleCollisionConfig &inout Config) const
    {
        ModifyOrAdd local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_SimpleCollision(const FECSEntity &inout Entity, FC_SimpleCollision &inout SimpleCollision, const FC_SimpleCollisionConfig &inout Config, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_184;
        FVector3f local_3 = FVector3f(FVector3f::ZeroVector);
        Get local_8;
        const FC_Rigidbody& local_10 = local_8.opCall();
        if (local_10)
        {
            FVector local_26 = (FVector(local_10.GetVelocity()) * FixedTime.DeltaTime.ToSeconds());
            local_3 = FVector3f(local_26);
        }
        FQuat local_40 = Transform.GetRotation();
        FVector local_46 = (FVector(Transform.GetPosition()) + local_40.RotateVector(FVector(Config.PosOffset)));
        FQuat local_84 = (local_40 * FQuat(FRotator(Config.RotOffset)));
        FVector3f local_87 = FVector3f(FVector3f::ZeroVector);
        FVector3f local_90 = local_3;
        FVector local_96 = local_46;
        int local_97 = 0;
        for (; local_97 < this.MaxSlideIterations; ++local_97)
        {
            TArray<FHitResult> local_104;
            bool local_11 = (local_97 == 0);
            FVector local_52 = (local_96 + FVector(local_90));
            bool local_105 = this.DoSweep(Entity, SimpleCollision, Config, local_104, local_96, local_52, local_84, local_11);
            if (!(local_105))
            {
                local_87 += local_90;
                break;
            }
            FHitResult local_180;
            FVector3f local_183 = FVector3f(FVector3f::ZeroVector);
            local_184 = false;
            for (auto& local_198 : local_104)
            {
                if (local_198.GetbStartPenetrating())
                {
                    local_183 += this.ComputeSoftPushOut(local_198, Config, FixedTime.DeltaTime);
                    continue;
                }
                if (local_198.GetbBlockingHit() && !(local_184))
                {
                    local_180 = local_198;
                    local_184 = true;
                }
            }
            if (local_183.SizeSquared() > 0.0f)
            {
                local_87 += local_183;
            }
            if (!(local_184))
            {
                local_87 += local_90;
                break;
            }
            FVector3f local_29 = (local_90 * local_180.Time);
            local_87 += local_29;
            local_96 += FVector(local_29);
            FVector3f local_201 = FVector3f(local_180.Normal);
            FVector3f local_207 = (local_90 - (local_201 * local_90.DotProduct(local_201)));
            local_90 = (local_207 * Config.SlideRatio);
            if (local_90.IsNearlyZero(0.0001f))
            {
                break;
            }
        }
        SimpleCollision.ConstrainedDeltaMovement = local_87;
        return;
    }
    UFUNCTION()
    void Job_ApplySimpleCollision(const FECSEntity &inout Entity, FC_SimpleCollision &inout SimpleCollision, const FC_Transform &inout Transform) const
    {
        if (!(SimpleCollision.ConstrainedDeltaMovement.IsNearlyZero(0.0001f)))
        {
            Entity.MoveTo((FVector(Transform.GetPosition()) + FVector(SimpleCollision.ConstrainedDeltaMovement)), FFPTime(-1));
            SimpleCollision.ConstrainedDeltaMovement = FVector3f::ZeroVector;
        }
        return;
    }
    bool DoSweep(const FECSEntity &inout Entity, FC_SimpleCollision &inout SimpleCollision, const FC_SimpleCollisionConfig &inout Config, TArray<FHitResult> &inout OutResults, const FVector &inout Start, const FVector &inout End, const FQuat &inout Rot, const bool bAllowUpdateCache) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    FVector3f ComputeSoftPushOut(const FHitResult &inout Hit, const FC_SimpleCollisionConfig &inout Config, const FFPTime &inout DeltaTime) const
    {
        FVector local_6;
        ELogicPushOutCenter local_8 = FHitResultUtils::GetPushOutNormal(Hit, local_6);
        FVector3f local_11;
        if ((int(local_8)) == 1)
        {
            local_11 = FVector3f(local_6);
        }
        else
        {
            local_11 = FVector3f(Hit.Normal);
        }
        if (local_11.IsNearlyZero(0.0001f))
        {
            return FVector3f::ZeroVector;
        }
        return (local_11.GetSafeNormal(1e-8f, FVector3f::ZeroVector) * (FMath::Min(((FHitResultUtils::GetSoftPushOutSpeed(Hit, this.GetShapeRadius(Config.Shape))) * float32(DeltaTime.ToSeconds())), Hit.PenetrationDepth)));
    }
    float32 GetShapeRadius(const FCollisionShapeInfo &inout Shape) const
    {
        float32 local_4 = 0.0f;
        switch (int(Shape.GetShapeType()))
        {
        case 1:
        case 2:
        {
            return Shape.GetRadius();
        }
        case 3:
        {
            return Shape.GetHalfExtend().Size2D();
        }
        default:
        {
            local_4 = 0.0f;
        }
        }
        return local_4;
    }
    UFUNCTION()
    void Run_Monitor_InitSimpleCollision() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSimpleCollisionConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitSimpleCollision(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SimpleCollision() const
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
                this.Job_SimpleCollision(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_42);
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
        Include local_116;
        local_116.opCall();
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
            this.Job_SimpleCollision(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ApplySimpleCollision() const
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
                this.Job_ApplySimpleCollision(local_36, local_38, local_44);
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
            this.Job_ApplySimpleCollision(local_180, local_38, local_44);
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

