

class US_MovementExternalForce : UECSScriptSystem
{
    US_MovementExternalForce()
    {
        return;
    }
    UFUNCTION()
    void Job_TickRadialForce(const FECSEntity &inout Entity, const FC_Transform &inout Tranform, FC_MovementRadialForce &inout RadialForce) const
    {
        int local_102 = 0;
        bool local_106;
        int local_170 = 0;
        FFPTime local_4 = FFPTime(this.GetECSWorld().GetFixedTime().Time);
        FECSRuntimeQuery local_48 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(Entity, Tranform.GetPosition(), RadialForce.GetRadius(), EECSQueryRegsitryType(3), false);
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        if (local_102 && (int(local_102.GetFactionId()) != 0))
        {
            int local_105 = RadialForce.GetEnableFactionRelation();
            local_48 = local_48.FilterByFaction(EFaction(local_102.GetFactionId()));
        }
        FECSRuntimeQueryIterator local_130 = local_48.Iterator();
        Has local_158;
        for (; local_130.CanProceed;)
        {
            const FECSEntity& local_154 = local_130.Proceed();
            if (this.GetECSRuntime().IsClient && !(local_158.opCall()))
            {
                continue;
            }
            if (local_154.MatchGameplayTag(ExternalForce::IgnoreExternalForceTag))
            {
                continue;
            }
            Has local_162;
            local_106 = local_162.opCall();
            if (local_106)
            {
                continue;
            }
            FVector local_192 = (FVector(Tranform.GetPosition()) - 0.GetPosition());
            float local_194 = local_192.Size();
            if (local_194 > RadialForce.GetInnerRadius())
            {
                float local_200 = 1.0 - ((local_194 - RadialForce.GetInnerRadius()) / (RadialForce.GetRadius() - RadialForce.GetInnerRadius()));
                FVector local_180 = local_192.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
                FVector local_186 = (local_170.GetForce() + ((local_180 * RadialForce.GetForce()) * local_200));
                local_170.SetForce(local_186);
                local_186 = (local_170.GetMaxVelocity() + ((local_180 * RadialForce.GetMaxSpeed()) * local_200));
                local_170.SetMaxVelocity(local_186);
            }
        }
        if (ECS::GetRuntimeInfo().IsServer)
        {
            if (FFPTime(RadialForce.GetStartSeconds()).opCmp(0.0) > 0)
            {
                FFPTime local_212 = (local_4 - RadialForce.GetStartSeconds());
                if (local_212.opCmp(RadialForce.GetDuration()) > 0)
                {
                    Has local_216;
                    if (!(local_216.opCall()))
                    {
                        Entity.DestroyDeferred();
                    }
                    else
                    {
                        Remove local_220;
                        local_220.opCall();
                    }
                }
            }
            else
            {
                RadialForce.SetStartSeconds(FFPTime(local_4.ToSeconds()));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TickBoxForce(const FECSEntity &inout Entity, const FC_Transform &inout Tranform, FC_MovementBoxForce &inout BoxForce) const
    {
        int local_138 = 0;
        bool local_142;
        int local_200 = 0;
        int local_206 = 0;
        FFPTime local_4 = FFPTime(this.GetECSWorld().GetFixedTime().Time);
        FECSRuntimeQuery local_52 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(Entity, Tranform.GetPosition(), float32(BoxForce.GetHalfExtend().GetMax()), EECSQueryRegsitryType(3), false);
        FVector local_118 = (FVector(Tranform.GetPosition()) + BoxForce.GetHalfExtend());
        FVector local_124 = (FVector(Tranform.GetPosition()) - BoxForce.GetHalfExtend());
        FBox local_106 = FBox(local_124, local_118);
        Include local_128;
        local_128.opCall();
        Include local_132;
        local_132.opCall();
        if (local_138 && (int(local_138.GetFactionId()) != 0))
        {
            int local_141 = BoxForce.GetEnableFactionRelation();
            local_52 = local_52.FilterByFaction(EFaction(local_138.GetFactionId()));
        }
        FECSRuntimeQueryIterator local_166 = local_52.Iterator();
        Has local_194;
        for (; local_166.CanProceed;)
        {
            const FECSEntity& local_190 = local_166.Proceed();
            if (this.GetECSRuntime().IsClient && !(local_194.opCall()))
            {
                continue;
            }
            if (local_190.MatchGameplayTag(ExternalForce::IgnoreExternalForceTag))
            {
                continue;
            }
            Has local_198;
            local_142 = local_198.opCall();
            if (local_142)
            {
                continue;
            }
            if (local_106.IsInside(local_200.GetPosition()))
            {
                FVector local_112 = Tranform.GetRotation().GetForwardVector();
                FVector local_118_2 = (local_206.GetForce() + (local_112 * BoxForce.GetForce()));
                local_206.SetForce(local_118_2);
                local_118_2 = (local_112 * BoxForce.GetMaxSpeed());
                FVector local_216 = (local_206.GetMaxVelocity() + local_118_2);
                local_206.SetMaxVelocity(local_216);
            }
        }
        if (ECS::GetRuntimeInfo().IsServer)
        {
            if (FFPTime(BoxForce.GetStartSeconds()).opCmp(0.0) > 0)
            {
                FFPTime local_218 = (local_4 - BoxForce.GetStartSeconds());
                if (local_218.opCmp(BoxForce.GetDuration()) > 0)
                {
                    Has local_222;
                    if (!(local_222.opCall()))
                    {
                        Entity.DestroyDeferred();
                    }
                    else
                    {
                        Remove local_226;
                        local_226.opCall();
                    }
                }
            }
            else
            {
                BoxForce.SetStartSeconds(FFPTime(local_4.ToSeconds()));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickRadialForce() const
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
                this.Job_TickRadialForce(local_36, local_38, local_44);
                local_52.opCall(local_44);
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
            this.Job_TickRadialForce(local_180, local_38, local_44);
            local_52.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickBoxForce() const
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
                this.Job_TickBoxForce(local_36, local_38, local_44);
                local_52.opCall(local_44);
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
            this.Job_TickBoxForce(local_180, local_38, local_44);
            local_52.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

