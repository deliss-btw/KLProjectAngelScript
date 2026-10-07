

class US_EcologyBattleForAreaSystem : UECSScriptSystem
{
    US_EcologyBattleForAreaSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_SetupBossBattleForAreaHandle(const FCE_SetupBossBattleForAreaInstance &inout Event) const
    {
        if (!(Event.AttackerFlock.IsValid()) || !(Event.DefenderFlock.IsValid()))
        {
            return;
        }
        ::FEcologyBattleForAreaUtils::PrepareBossBattleForAreaPreContext(Event.AttackerFlock, Event.AttackerCreature, Event.DefenderFlock, Event.DefenderCreature);
        FC_BossBattleForAreaAttackerTag local_8;
        Assign local_6;
        local_6.opCall(local_8);
        XLog(ELog(0), FString().Append("[BattleForArea]: Battle State To Marked"));
        ::FEcologyBattleForAreaUtils::ModifyBattleForAreaState(Event.AttackerFlock, EBossBattleForAreaState(1));
        ::FEcologyBattleForAreaUtils::ModifyBattleForAreaState(Event.DefenderFlock, EBossBattleForAreaState(1));
        return;
    }
    UFUNCTION()
    void Job_BossBattleForAreaRunner(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_EcologyFlockBehaviorComponent &inout BehaviorComponent) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Job_BossBattleForAreaFinishHandle(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FC_EcologyFlockBehaviorComponent &inout BehaviorComponent, const FC_EcologyFlockComponent &inout FlockComp, const FC_EcologyFlockBossBattleForAreaComponent &inout BattleForAreaInfo) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        if (!(BehaviorComponent))
        {
            return;
        }
        if (!(FlockComp))
        {
            return;
        }
        if (!(BattleForAreaInfo))
        {
            return;
        }
        if (!(FECSEntity(BattleForAreaInfo.InstanceContext.AttackerBoss).IsValid()))
        {
            XLog(ELog(0), FString().Append("[BattleForArea]: FinishReason: AttackerBoss Invalid"));
            ::FEcologyBattleForAreaUtils::BossBattleForAreaFinishEnd(Entity);
            return;
        }
        if (!(FECSEntity(BattleForAreaInfo.InstanceContext.DefenderBoss).IsValid()))
        {
            XLog(ELog(0), FString().Append("[BattleForArea]: FinishReason: DefenderBoss Invalid"));
            ::FEcologyBattleForAreaUtils::BossBattleForAreaFinishEnd(Entity);
            return;
        }
        Has local_20;
        bool local_1 = local_20.opCall();
        if (local_1)
        {
            XLog(ELog(0), FString().Append("[BattleForArea]: FinishReason: AttackerBoss Death"));
            ::FEcologyBattleForAreaUtils::BossBattleForAreaFinishEnd(Entity);
            return;
        }
        bool local_1_2 = local_20.opCall();
        if (local_1_2)
        {
            XLog(ELog(0), FString().Append("[BattleForArea]: FinishReason: DefenderBoss Death"));
            ::FEcologyBattleForAreaUtils::BossBattleForAreaFinishEnd(Entity);
            return;
        }
        Get local_24;
        const FC_Transform& local_26 = local_24.opCall();
        if (local_26)
        {
            Get local_30;
            const FC_Transform& local_32 = local_30.opCall();
            if (local_32)
            {
                float local_36 = local_26.GetPosition().DistSquared(local_32.GetPosition());
                if (local_36 >= (BattleForAreaInfo.FinishEndDistance * BattleForAreaInfo.FinishEndDistance))
                {
                    XLog(ELog(0), FString().Append("[BattleForArea]: Distance: ").Append(local_36));
                    ::FEcologyBattleForAreaUtils::BossBattleForAreaFinishEnd(Entity);
                    return;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_BossBattleForAreaFinishStayHandle(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_EcologyFlockComponent &inout FlockComp, const FC_EcologyFlockBossBattleForAreaComponent &inout BattleComp) const
    {
        if (int(BattleComp.BattleForAreaState) != 5)
        {
            Remove local_8;
            local_8.opCall();
        }
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        if (float32(((FFPTime(FixedTime.Time) - BattleComp.EnterStateTime).ToSeconds())) > 15.0f)
        {
            XLog(ELog(30), FString().Append("[BattleForArea]: FinishStayзЉ¶жЂЃи¶…ж—¶пјЊејєе€¶иЅ¬жЌўе€°None"));
            ::FEcologyBattleForAreaUtils::ModifyBattleForAreaState(Entity, EBossBattleForAreaState(0));
        }
        return;
    }
    UFUNCTION()
    void Job_BossBattleForAreaFinishByChangeAreaSucc(const FCE_FlockLeaderReachedTargetResourceLevelEvent &inout Event) const
    {
        if (!(Event.FlockEntity.IsValid()))
        {
            return;
        }
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        ::FEcologyBattleForAreaUtils::BossBattleForAreaFinishEnd(Event.FlockEntity);
        return;
    }
    UFUNCTION()
    void Job_BossBattleForAreaChangeToInBattleHandle(const FCE_BattleForAreaChangeToInBattleNotify &inout Event) const
    {
        if (!(Event.AttackerFlock.IsValid()) || !(Event.DefenderFlock.IsValid()))
        {
            return;
        }
        if (!(Event.AttackerBoss.IsValid()) || !(Event.DefenderBoss.IsValid()))
        {
            return;
        }
        ::FEcologyBattleForAreaUtils::BossBattleForAreaStartInBattle(Event.AttackerFlock, Event.AttackerBoss, Event.DefenderFlock, Event.DefenderBoss);
        return;
    }
    UFUNCTION()
    void Run_Job_SetupBossBattleForAreaHandle() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SetupBossBattleForAreaInstance> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SetupBossBattleForAreaInstance& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_SetupBossBattleForAreaHandle(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BossBattleForAreaRunner_StaticReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_176 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 1;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
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
                this.Job_BossBattleForAreaRunner(local_46, local_12, local_48);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_46 = local_138.Proceed();
            ++local_104;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_BossBattleForAreaRunner(local_176, local_12, local_48);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BossBattleForAreaRunner_DefaultReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.Job_BossBattleForAreaRunner(local_44, local_12, local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_44 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.Job_BossBattleForAreaRunner(local_174, local_12, local_46);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BossBattleForAreaRunner_LocalReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_176 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 2;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
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
                this.Job_BossBattleForAreaRunner(local_46, local_12, local_48);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_46 = local_138.Proceed();
            ++local_104;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_BossBattleForAreaRunner(local_176, local_12, local_48);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BossBattleForAreaFinishHandle_StaticReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 1;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
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
                this.Job_BossBattleForAreaFinishHandle(local_46, local_12, local_48, local_54, local_60);
                local_68.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Exclude(local_106).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_106.Iterator();
        for (; local_162.CanProceed;)
        {
            local_46 = local_162.Proceed();
            ++local_128;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_BossBattleForAreaFinishHandle(local_200, local_12, local_48, local_54, local_60);
            local_68.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BossBattleForAreaFinishHandle_DefaultReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        int local_52 = 0;
        int local_58 = 0;
        MarkModifiedIfDirty local_66;
        int local_198 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.Job_BossBattleForAreaFinishHandle(local_44, local_12, local_46, local_52, local_58);
                local_66.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_104 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Exclude(local_104).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_104.Iterator();
        for (; local_160.CanProceed;)
        {
            local_44 = local_160.Proceed();
            ++local_126;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            FECSEntity::Get<FC_EcologyFlockComponent> local_56 = FECSEntity::Get<FC_EcologyFlockComponent>(local_44);
            this.Job_BossBattleForAreaFinishHandle(local_198, local_12, local_46, local_52, local_58);
            local_66.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_126);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BossBattleForAreaFinishHandle_LocalReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 2;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
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
                this.Job_BossBattleForAreaFinishHandle(local_46, local_12, local_48, local_54, local_60);
                local_68.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Exclude(local_106).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_106.Iterator();
        for (; local_162.CanProceed;)
        {
            local_46 = local_162.Proceed();
            ++local_128;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_BossBattleForAreaFinishHandle(local_200, local_12, local_48, local_54, local_60);
            local_68.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BossBattleForAreaFinishStayHandle_StaticReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 1;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
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
                this.Job_BossBattleForAreaFinishStayHandle(local_46, local_12, local_48, local_54);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_96).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_46 = local_148.Proceed();
            ++local_114;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_BossBattleForAreaFinishStayHandle(local_186, local_12, local_48, local_54);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BossBattleForAreaFinishStayHandle_DefaultReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        int local_52 = 0;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.Job_BossBattleForAreaFinishStayHandle(local_44, local_12, local_46, local_52);
            }
            local_4.UpdateCachedEntityCount(local_21);
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
        int local_22 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_44 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            FECSEntity::Get<FC_EcologyFlockBossBattleForAreaComponent> local_56 = FECSEntity::Get<FC_EcologyFlockBossBattleForAreaComponent>(local_44);
            this.Job_BossBattleForAreaFinishStayHandle(local_184, local_12, local_46, local_52);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BossBattleForAreaFinishStayHandle_LocalReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 2;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
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
                this.Job_BossBattleForAreaFinishStayHandle(local_46, local_12, local_48, local_54);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_96).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_46 = local_148.Proceed();
            ++local_114;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_BossBattleForAreaFinishStayHandle(local_186, local_12, local_48, local_54);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BossBattleForAreaFinishByChangeAreaSucc() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_FlockLeaderReachedTargetResourceLevelEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_FlockLeaderReachedTargetResourceLevelEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_BossBattleForAreaFinishByChangeAreaSucc(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BossBattleForAreaChangeToInBattleHandle() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BattleForAreaChangeToInBattleNotify> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BattleForAreaChangeToInBattleNotify& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_BossBattleForAreaChangeToInBattleHandle(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

