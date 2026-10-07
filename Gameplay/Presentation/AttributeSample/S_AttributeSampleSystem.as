

class US_AttributeSampleSystem : UECSScriptSystem
{
    US_AttributeSampleSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_AttributeSampleChanged(const FECSEntity &inout Entity, const FC_AttributeSample &inout C_AttributeSample) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Monitor_AttributeSampleRemoved(const FECSEntity &inout Entity, const FC_AttributeSample &inout C_AttributeSample) const
    {
        TArray<FECSEntity> local_32;
        Get local_6;
        const FC_AttributeSampleSnapshot& local_8 = local_6.opCall();
        if (local_8)
        {
            for (auto& local_28 : local_8.AttributeSamples)
            {
                local_32.GetAllSamplers();
                auto local_38 = local_32.Iterator();
                for (; local_38.CanProceed;)
                {
                    this.OnAttributeSampleRemove(local_38.Proceed(), Entity.GetId(), EAttributeSampleType(local_28.GetKey()));
                }
            }
            Remove local_52;
            local_52.opCall();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_FullySyncAttributes(const FECSEntity &inout Entity, const FC_AttributeSample &inout C_AttributeSample) const
    {
        FBitSet32 local_2;
        for (auto& local_22 : C_AttributeSample.AttributeSamples)
        {
            local_2.opOrAssign(FBitSet32(int(local_22.GetKey())));
        }
        this.SyncAttributes(Entity, local_2);
        return;
    }
    void OnAttributeSampleAdd(const FECSEntity &inout Sampler, const FECSEntityId &inout SampledEntityId, const EAttributeSampleType SampledAttribute) const
    {
        if ((Sampler == ENTITY_NULL))
        {
            FECSWorldPtr local_4 = this.GetECSWorld();
            ModifyOrAdd local_8;
            FCS_GlobalAttributeSampler& local_10 = local_8.opCall();
            if (local_10)
            {
                local_10.GetModify_AttributeSampleEntities().FindOrAdd(SampledEntityId).opOrAssign(FBitSet32(int(SampledAttribute)));
            }
            return;
        }
        ModifyOrAdd local_18;
        FC_AttributeSampler& local_20 = local_18.opCall();
        if (local_20)
        {
            local_20.GetModify_AttributeSampleEntities().FindOrAdd(SampledEntityId).opOrAssign(FBitSet32(int(SampledAttribute)));
        }
        return;
    }
    void OnAttributeSampleRemove(const FECSEntity &inout Sampler, const FECSEntityId &inout SampledEntityId, const EAttributeSampleType SampledAttribute) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void SyncAttributes(const FECSEntity &inout SampledEntity, const FBitSet32 &inout SampledAttributes) const
    {
        if (SampledAttributes.IsIntersect(FBitSet32(15)))
        {
            this.SyncTransformAttributes(SampledEntity, SampledAttributes);
        }
        if (SampledAttributes.IsIntersect(FBitSet32(16)))
        {
            this.SyncHPAttribute(SampledEntity, EAttributeSampleType(16));
        }
        return;
    }
    void SyncTransformAttributes(const FECSEntity &inout SampledEntity, const FBitSet32 &inout SampledAttributes) const
    {
        FTransform local_28 = FTransformUtils::GetTransform(SampledEntity, FFPTime(-1));
        if (SampledAttributes.IsIntersect(FBitSet32(3)))
        {
            this.SyncPositionAttributes(SampledEntity, local_28.GetLocation(), SampledAttributes);
        }
        if (SampledAttributes.IsIntersect(FBitSet32(12)))
        {
            this.SyncRotationAttributes(SampledEntity, FVector3f(local_28.GetRotation().Euler()), SampledAttributes);
        }
        return;
    }
    void SyncPositionAttributes(const FECSEntity &inout SampledEntity, const FVector &inout Position, const FBitSet32 &inout SampledAttributes) const
    {
        if (SampledAttributes.IsIntersect(FBitSet32(1)))
        {
            FECSWorldPtr local_6 = this.GetECSWorld();
            ModifyOrAdd local_10;
            FCS_Position2DAttributeSample& local_12 = local_10.opCall();
            if (local_12)
            {
                local_12.GetModify_Position2DMap().Add(SampledEntity.GetId(), FVector2D(Position.X, Position.Y));
            }
        }
        if (SampledAttributes.IsIntersect(FBitSet32(2)))
        {
            FECSWorldPtr local_6_2 = this.GetECSWorld();
            ModifyOrAdd local_26;
            FCS_PositionZAttributeSample& local_28 = local_26.opCall();
            if (local_28)
            {
                local_28.GetModify_PositionZMap().Add(SampledEntity.GetId(), float32(Position.Z));
            }
        }
        return;
    }
    void SyncRotationAttributes(const FECSEntity &inout SampledEntity, const FVector3f &inout Rotation, const FBitSet32 &inout SampledAttributes) const
    {
        if (SampledAttributes.IsIntersect(FBitSet32(4)))
        {
            FECSWorldPtr local_6 = this.GetECSWorld();
            ModifyOrAdd local_10;
            FCS_RotationXYAttributeSample& local_12 = local_10.opCall();
            if (local_12)
            {
                local_12.GetModify_RotationXYMap().Add(SampledEntity.GetId(), FVector2f(Rotation.X, Rotation.Y));
            }
        }
        if (SampledAttributes.IsIntersect(FBitSet32(8)))
        {
            FECSWorldPtr local_6_2 = this.GetECSWorld();
            ModifyOrAdd local_22;
            FCS_RotationZAttributeSample& local_24 = local_22.opCall();
            if (local_24)
            {
                float32 local_15_2 = Rotation.Z;
                local_24.GetModify_RotationZMap().Add(SampledEntity.GetId(), local_15_2);
            }
        }
        return;
    }
    void SyncHPAttribute(const FECSEntity &inout SampledEntity, const EAttributeSampleType SampledAttribute) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        ModifyOrAdd local_6;
        FCS_HPAttributeSample& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.GetModify_HPMap().Add(SampledEntity.GetId(), FGameAttributeUtils::GetAttributeValue(SampledEntity, Attribute::HP, ECS::GetContextTime(), false, 0.0f, false, FGameAttributeModificationValue()));
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_AttributeSampleChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAttributeSampleOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AttributeSampleChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorAttributeSampleOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_AttributeSampleChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_AttributeSampleRemoved() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAttributeSampleOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AttributeSampleRemoved(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_FullySyncAttributes() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_168 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_11 = 0;
        int local_10 = local_11;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.ServerJob_FullySyncAttributes(local_42, local_44);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Exclude(local_86).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_86.Iterator();
        for (; local_130.CanProceed;)
        {
            local_42 = local_130.Proceed();
            ++local_96;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.ServerJob_FullySyncAttributes(local_168, local_44);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
}

