

class US_EnvBreakDamageSystem : UECSScriptSystem
{
    US_EnvBreakDamageSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_ClearExpireEnvBreakDamageData(const FECSEntity &inout Entity, FC_EnvBreakDamageReceiver &inout DamageReceriver) const
    {
        int local_1 = 0;
        for (auto& local_18 : DamageReceriver.GetEnvBreakDamageDatas())
        {
            if (!(local_18.GetbHasResolved()))
            {
                break;
            }
            ++local_1;
        }
        if (local_1 > 0)
        {
            DamageReceriver.GetModify_EnvBreakDamageDatas().RemoveAt(0, local_1);
        }
        if (DamageReceriver.GetEnvBreakDamageDatas().IsEmpty())
        {
            Remove local_22;
            local_22.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_EnvBreakDamageResolve(const FECSEntity &inout Entity, FC_EnvBreakDamageReceiver &inout DamageReceriver, const FCS_FixedTime &inout FixedTime) const
    {
        int local_24 = 0;
        float32 local_41;
        int local_54 = 0;
        int local_64 = 0;
        if (DamageReceriver.GetEnvBreakDamageDatas().IsEmpty())
        {
            return;
        }
        Has local_6;
        Has local_10;
        Has local_16;
        if (local_6.opCall() || !(local_10.opCall()) || !(local_16.opCall()) || Entity.MatchGameplayTag(GameplayTags::CombatState_Invincible))
        {
            DamageReceriver.GetModify_EnvBreakDamageDatas().Reset(0);
            return;
        }
        for (auto& local_38 : DamageReceriver.GetModify_EnvBreakDamageDatas())
        {
            if (local_38.GetbHasResolved())
            {
                continue;
            }
            if (FFPTime(local_38.GetTime()).opCmp(FixedTime.Time) > 0)
            {
                break;
            }
            local_41 = local_38.GetEnvBreakDamage();
            float32 local_42 = local_24.GetAttributeValue(Attribute::EnvBreakHP, local_38.GetTime());
            if (local_41 > local_42)
            {
                local_41 = local_42;
            }
            FGameAttributeUtils::Consume(Entity, Attribute::EnvBreakHP, local_38.GetTime(), local_41);
            if (((local_42 - local_41) <= 0.0f && (local_42 > 0.0f)))
            {
                Get local_48;
                bool local_11 = local_48.opCall().bAutoDeadWhenEnvHPZero;
                if (local_11)
                {
                    local_54.KilledByEntity = local_38.GetFinalDamageSource().GetId();
                }
                else
                {
                    FECSWorldPtr local_58 = this.GetECSWorld();
                    local_64.FinalDamageSource = local_38.GetFinalDamageSource();
                }
            }
            local_38.SetbHasResolved(true);
        }
        return;
    }
    UFUNCTION()
    void Job_EnvBreakHPRecoverPhaseChange(const FECSEntity &inout Entity, const FC_GameAttribute &inout GameAttribute, const FC_PropEnvBreakableConfig &inout PropEnvConfig, const FC_GameAttributeChanged &inout GameAttributeChanged, const FC_GameAttributeSnapshot &inout GameAttributeSnapshot, const FCS_FixedTime &inout FixedTime) const
    {
        float32 local_50;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return;
        }
        bool local_6 = false;
        int local_7 = -1;
        int local_9 = 0;
        for (; local_9 < GameAttributeChanged.GetChangedAttributeNum(); ++local_9)
        {
            int local_10 = GameAttributeChanged.GetChangedAttributeLocalIndex(local_9);
            FGameAttributeRef local_26 = GameAttribute.GetAttributeRef(local_10);
            if (local_26.GetGlobalIndex() == Attribute::EnvBreakHP.GetGlobalIndex())
            {
                local_6 = true;
                local_7 = local_10;
            }
        }
        if (!(local_6))
        {
            return;
        }
        float32 local_43 = GameAttributeSnapshot.GetAttributeValue(local_7, FixedTime.Time);
        float32 local_42 = GameAttribute.GetAttributeValue(local_7, FixedTime.Time);
        float32 local_44 = GameAttribute.GetAttributeValue(Attribute::EnvBreakHPMax, FixedTime.Time);
        if (local_44 > 0.0f && (local_43 != local_42))
        {
            float32 local_45 = local_43 / local_44;
            float32 local_47 = local_42 / local_44;
            int local_41 = PropEnvConfig.BreakPhases.Num();
            int local_11 = PropEnvConfig.BreakPhases.Num();
            int local_10_2 = PropEnvConfig.BreakPhases.Num() - 1;
            for (; local_10_2 >= 0; --local_10_2)
            {
                local_50 = PropEnvConfig.BreakPhases[local_10_2];
                if (local_45 > local_50)
                {
                    local_41 = local_10_2;
                }
                if (local_47 > local_50)
                {
                    local_11 = local_10_2;
                }
            }
            if (local_41 != local_11)
            {
                FCE_EnvBreakablePropPhaseChangedEvent local_58;
                FECSWorldPtr local_52 = this.GetECSWorld();
                local_58.OldPhase = local_41;
                local_58.NewPhase = local_11;
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearExpireEnvBreakDamageData() const
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
                this.Job_ClearExpireEnvBreakDamageData(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
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
            this.Job_ClearExpireEnvBreakDamageData(local_170, local_38);
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
    void Run_Job_EnvBreakDamageResolve() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
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
                this.Job_EnvBreakDamageResolve(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_EnvBreakDamageResolve(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_EnvBreakHPRecoverPhaseChange() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        int local_200 = 0;
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
                this.Job_EnvBreakHPRecoverPhaseChange(local_40, local_42, local_48, local_54, local_60, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_102 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Exclude(local_102).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_102.Iterator();
        for (; local_162.CanProceed;)
        {
            local_40 = local_162.Proceed();
            ++local_128;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_EnvBreakHPRecoverPhaseChange(local_200, local_42, local_48, local_54, local_60, local_6);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

