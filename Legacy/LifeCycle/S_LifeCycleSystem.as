

class US_LifeCycleSystem : UECSScriptSystem
{
    US_LifeCycleSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_PrepareEntityDestroy(const FECSEntity &inout Entity) const
    {
        ::FLifeCycleUtils::DeactiveComps(Entity);
        return;
    }
    UFUNCTION()
    void Job_HandleEntityDisappear(const FCE_EntityDisappear &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        Has local_10;
        if (!(this.GetECSRuntime().IsServer) && !(local_10.opCall()))
        {
            return;
        }
        bool local_11 = Event.bDisableHitBox;
        if (local_11)
        {
            Modify local_16;
            FC_HitBox& local_18 = local_16.opCall();
            if (local_18)
            {
                local_18.GetOptions().DisableByReason(ECollisionDisableReason(2));
            }
        }
        if ((Event.bDisableMoveCollision || Event.bDisableOverlapCollision))
        {
            Modify local_24;
            FC_Collision& local_26 = local_24.opCall();
            if (local_26)
            {
                if (Event.bDisableMoveCollision)
                {
                    local_26.GetMoveCollisionOptions().DisableByReason(ECollisionDisableReason(2));
                    local_26.GetPushColliderOptions().DisableByReason(ECollisionDisableReason(2));
                }
                if (Event.bDisableOverlapCollision)
                {
                    local_26.GetOverlapOptions().DisableByReason(ECollisionDisableReason(2));
                    local_26.GetOverlapTestOptions().DisableByReason(ECollisionDisableReason(2));
                }
            }
        }
        ::FDitherEffectUtils::RequestDitherEffect(local_4, n"Disappear", float32(Event.FadeOutDuration.ToSeconds()), true);
        SendEvent local_34;
        local_34.opCall((FFPTime(Event.Time) + Event.FadeOutDuration));
        return;
    }
    UFUNCTION()
    void Job_HandleDeathDestroy(const FCE_EntityDestroyRequest &inout Event) const
    {
        Get local_4;
        if (!(!(Event.bSkipPlayerControlled)) && local_4.opCall())
        {
            return;
        }
        Modify local_10;
        FC_Buff& local_12 = local_10.opCall();
        if (local_12)
        {
            local_12.SetbActive(false);
            FBuffUtils::RemoveBuffAll(Event.Sender, Event.Time, EBuffEndType(0), true);
        }
        Modify local_18;
        FC_EASAbility& local_20 = local_18.opCall();
        if (local_20)
        {
            local_20.bActive = false;
            TArray<FECSEntityId> local_24 = local_20.Instances;
            for (auto& local_38 : local_24)
            {
                FECSEntity local_42 = FECSEntity(local_38);
                FAbilityUtils::RemoveAbility(local_42, EEASAbilityEndType(0));
                local_42.DestroyDeferred();
            }
        }
        const FC_ControlledByPlayer& local_46 = local_4.opCall();
        if (local_46)
        {
            if (local_46.GetPlayerEntity().IsValid())
            {
                Modify local_50;
                FC_DivineSkill& local_52 = local_50.opCall();
                if (local_52)
                {
                    ::DivineSkillUtils::RemoveDivineSkillModifier(Event.Sender, local_52);
                }
            }
        }
        Get local_56;
        if (local_56.opCall())
        {
            Modify local_62;
            if (local_62.opCall())
            {
            }
        }
        Get local_68;
        const FC_CharacterWeapon& local_70 = local_68.opCall();
        if (local_70)
        {
            if (local_70.GetCurrentWeaponEntity().IsValid())
            {
                local_70.GetCurrentWeaponEntity().DestroyDeferred();
            }
        }
        Event.Sender.DestroyDeferred();
        return;
    }
    UFUNCTION()
    void Job_InitEntitySpawnAppear(const FECSEntity &inout Entity, const FC_SpawnAppearConfig &inout SpawnAppearConfig) const
    {
        if (SpawnAppearConfig.SpawnAppearDuration > 0.0f)
        {
            ::FDitherEffectUtils::RequestDitherAppearEffect(Entity, n"Appear", SpawnAppearConfig.SpawnAppearDuration);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_PrepareEntityDestroy_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_154 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_PrepareEntityDestroy(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_82 = 0;
        FECSRuntimeViewIterator local_116 = local_76.Iterator();
        for (; local_116.CanProceed;)
        {
            local_38 = local_116.Proceed();
            ++local_82;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_PrepareEntityDestroy(local_154);
        }
        local_4.UpdateCachedEntityCount(local_82);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_PrepareEntityDestroy_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_154 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_PrepareEntityDestroy(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_82 = 0;
        FECSRuntimeViewIterator local_116 = local_76.Iterator();
        for (; local_116.CanProceed;)
        {
            local_38 = local_116.Proceed();
            ++local_82;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_PrepareEntityDestroy(local_154);
        }
        local_4.UpdateCachedEntityCount(local_82);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEntityDisappear() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityDisappear> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityDisappear& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEntityDisappear(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleDeathDestroy() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityDestroyRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityDestroyRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleDeathDestroy(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitEntitySpawnAppear() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
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
                this.Job_InitEntitySpawnAppear(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitEntitySpawnAppear(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

