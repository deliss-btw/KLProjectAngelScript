

class US_MarkSystem : UECSScriptSystem
{
    US_MarkSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleRequestMarkEntity(const FCE_RequestMarkEntity &inout Event) const
    {
        FECSEntity local_8 = ::FASCommonUtils::GetUniquePlayerEntity(Event.Sender);
        Has local_12;
        bool local_13 = local_12.opCall();
        if (local_13)
        {
            TDataObjectPtr<FMarkConfig> local_38 = Event.MarkConfig;
            if (local_38)
            {
                FECSEntity local_66 = ::MarkUtil::MarkEntity(local_8, FECSEntity(Event.EntityID), local_38);
            }
            else
            {
                XError(ELog(53), FString().Append("Mark config is not set for request mark entity event, entity id: ").Append(Event.EntityID));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleRequestMarkPosition(const FCE_RequestMarkLocation &inout Event) const
    {
        FECSEntity local_8 = ::FASCommonUtils::GetUniquePlayerEntity(Event.Sender);
        Has local_12;
        bool local_13 = local_12.opCall();
        if (local_13)
        {
            TDataObjectPtr<FMarkConfig> local_38 = Event.MarkConfig;
            if (local_38)
            {
                FVector local_68 = Event.Location;
                if (Event.bNeedRecalculateHeight)
                {
                    float local_76;
                    if (!(::MarkUtil::FindMarkPositionByMapPosition(Event.Sender, FVector2D(local_68.X, local_68.Y), local_68)))
                    {
                        local_76 = 0.0;
                        local_68.Z = 0.0;
                    }
                }
                FECSEntity local_4 = ::MarkUtil::MarkPosition(local_8, local_68, local_38);
                if (local_4)
                {
                    bool local_13_2 = Event.bGuideToMark;
                    if (!(local_13_2))
                    {
                        local_13_2 = false;
                    }
                    else
                    {
                        local_13_2 = ECS::GetRuntimeInfo().IsServer;
                    }
                    if (local_13_2)
                    {
                        ::FGuidingPathUtils::ServerSetGuidingPathTargetEntity(local_4, local_8, true);
                    }
                }
            }
            else
            {
                XError(ELog(53), FString().Append("Mark config is not set for request mark position event, location: ").Append(Event.Location));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleRequestFastMarkEntity(const FCE_RequestFastMarkEntity &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.EntityID);
        if (local_4)
        {
            FECSEntity local_34;
            ::MarkUtil_Internal::GetFastMarkConfigByEntity(local_34);
            if (local_34)
            {
                FECSEntity local_8 = ::MarkUtil::MarkEntity(local_34, local_4, Event.Sender);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleRequestChangeMarkConfig(const FCE_RequestChangeMarkConfig &inout Event) const
    {
        ::MarkUtil::ChangeMarkConfig(Event.Sender, FECSEntity(Event.MarkEntityID), Event.MarkConfig);
        SendEvent local_8;
        local_8.opCall(FFPTime(-1));
        return;
    }
    UFUNCTION()
    void Job_HandleRequestRemoveMark(const FCE_RequestRemoveMark &inout Event) const
    {
        ::MarkUtil::RemoveMark(Event.Sender, FECSEntity(Event.MarkOrMarkedEntityID));
        return;
    }
    UFUNCTION()
    void Monitor_HandleRemoveWhenNoLongerGuidingTarget(const FECSEntity &inout MarkEntity, const FC_GuidingPathTarget &inout C_GuidingPathTarget) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            ::MarkUtil_Internal::DestroyMarkEntity(MarkEntity);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleRemoveWhenCreaterApproachDistance(const FECSEntity &inout MarkEntity, const FC_Transform &inout C_Transform, const FC_Mark &inout C_Mark) const
    {
        float32 local_75 = 0.0f;
        ::FASCommonUtils::GetUniqueAvatarPawnEntity(C_Mark.GetCreaterPlayer());
        Get local_8;
        const FC_Transform& local_10 = local_8.opCall();
        if (local_10)
        {
            if (::MarkUtil::GetMarkConfig(MarkEntity))
            {
                if ((FVector(C_Transform.GetPosition()) - local_10.GetPosition()).SizeSquared2D() < FMath::Square(local_75))
                {
                    ::MarkUtil_Internal::DestroyMarkEntity(MarkEntity);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_OnServerNotifyUpdateMark(const FCE_ServerNotifyUpdateMark &inout Event) const
    {
        SendEvent local_4;
        local_4.opCall(FFPTime(-1));
        return;
    }
    UFUNCTION()
    void Monitor_MarkedEntityDeath(const FECSEntity &inout Entity, const FC_DeathTag &inout C_DeathTag) const
    {
        Get local_4;
        const FC_Marked& local_6 = local_4.opCall();
        if (local_6)
        {
            TArray<FECSEntity> local_12 = local_6.MarkPlayers;
            this.DestroyMarkEntitiesByMarkedEntity(Entity, local_12);
        }
        return;
    }
    UFUNCTION()
    void Job_RemoveEmptyMarkedComponent(const FECSEntity &inout Entity) const
    {
        Get local_4;
        const FC_Marked& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.MarkPlayers.IsEmpty())
            {
                Remove local_12;
                local_12.opCall();
            }
        }
        Remove local_16;
        local_16.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_ClearMarkOnPlayerLeave(const FC_PlayerMarks &inout C_PlayerMarks) const
    {
        for (auto& local_20 : C_PlayerMarks.GetAllMarks())
        {
            ::MarkUtil_Internal::DestroyMarkEntity(FECSEntity(local_20.GetKey()));
        }
        return;
    }
    UFUNCTION()
    void Monitor_SetLevelSpotConfigForMarkedEntity(const FECSEntity &inout Entity, const FC_Marked &inout C_Marked) const
    {
        Has local_4;
        const UMarkSettings local_8;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (!(C_Marked))
        {
            ::EntityLevelSpotUtils::RemoveSpotData(Entity, ELevelSpotDataSource(3));
            return;
        }
        GetGameplaySettings<UMarkSettings> local_10;
        local_8 = local_10;
        TDataObjectPtr<FPresentationConfig> local_84 = ::EntityLevelSpotUtils::GetDefaultPresentationConfig(Entity);
        if (local_84)
        {
            TDataObjectPtr<FPresentationRuleConfig> local_132;
            if (local_8.MarkedEntityPresentationRuleBySpotTypeOverrides.Find(local_84.opArrow().SpotType, local_132))
            {
                local_8.MarkedEntityPresentationRule = local_132;
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_UpdateMarkLevelSpotViewers(const FECSEntity &inout CreaterPlayer, const FC_PlayerInTeam &inout C_PlayerInTeam) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        if (!(C_PlayerInTeam) || !(C_PlayerInTeam.GetTeamEntity()))
        {
            for (auto& local_26 : local_6.GetAllMarks())
            {
                FECSEntity local_30 = FECSEntity(local_26.GetKey());
            }
            return;
        }
        for (auto& local_26 : local_6.GetAllMarks())
        {
            FECSEntity local_30_2 = FECSEntity(local_26.GetKey());
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnMarkChanged(const FC_Mark &inout Mark) const
    {
        FFPTime local_12 = FFPTime(-1);
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        SendEvent local_10;
        local_10.opCall(local_12);
        return;
    }
    UFUNCTION()
    void ClientJob_DispatchFastMarkRequest(const FECSEntity &inout PlayerEntity) const
    {
        ::MarkUtil::RequestFastMark(PlayerEntity);
        Remove local_4;
        local_4.opCall();
        return;
    }
    void DestroyMarkEntitiesByMarkedEntity(const FECSEntity &inout MarkedEntity, const TArray<FECSEntity> &inout MarkPlayers) const
    {
        for (auto& local_16 : MarkPlayers)
        {
            FECSEntity local_24 = FECSEntity(::MarkUtil_Internal::FindMarkEntityIdByMarkedEntityId(local_16, MarkedEntity.GetId()));
            if (local_24)
            {
                ::MarkUtil_Internal::DestroyMarkEntity(local_24);
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRequestMarkEntity() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RequestMarkEntity> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RequestMarkEntity& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleRequestMarkEntity(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRequestMarkPosition() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RequestMarkLocation> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RequestMarkLocation& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleRequestMarkPosition(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRequestFastMarkEntity() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RequestFastMarkEntity> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RequestFastMarkEntity& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleRequestFastMarkEntity(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRequestChangeMarkConfig() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RequestChangeMarkConfig> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RequestChangeMarkConfig& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleRequestChangeMarkConfig(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRequestRemoveMark() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RequestRemoveMark> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RequestRemoveMark& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleRequestRemoveMark(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_HandleRemoveWhenNoLongerGuidingTarget() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorGuidingPathTargetOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_HandleRemoveWhenNoLongerGuidingTarget(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRemoveWhenCreaterApproachDistance() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_176 = 0;
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
                this.Job_HandleRemoveWhenCreaterApproachDistance(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_86.Iterator();
        for (; local_138.CanProceed;)
        {
            local_36 = local_138.Proceed();
            ++local_104;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_HandleRemoveWhenCreaterApproachDistance(local_176, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OnServerNotifyUpdateMark() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerNotifyUpdateMark> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerNotifyUpdateMark& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_OnServerNotifyUpdateMark(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_MarkedEntityDeath() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorDeathTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_MarkedEntityDeath(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RemoveEmptyMarkedComponent() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
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
                this.Job_RemoveEmptyMarkedComponent(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_RemoveEmptyMarkedComponent(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClearMarkOnPlayerLeave() const
    {
        int local_50 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerMarksOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClearMarkOnPlayerLeave(local_50);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_SetLevelSpotConfigForMarkedEntity() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorMarkedOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_SetLevelSpotConfigForMarkedEntity(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorMarkedOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_SetLevelSpotConfigForMarkedEntity(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorMarkedOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_SetLevelSpotConfigForMarkedEntity(local_46, local_52);
        }
        return;
    }
    void Monitor___CacheForDefer___Monitor_UpdateMarkLevelSpotViewers(const FC_PlayerInTeam &inout MonitorComp, const FECSEntity &inout Entity) const
    {
        if (Entity.IsValid() == false)
        {
            XError(ELog(2), "Not Supported: monitor defer tag on Entity Destroy FC_UpdateMarkLevelSpotViewersDeferTag");
            return;
        }
        Has local_8;
        bool local_2 = local_8.opCall();
        if (local_2)
        {
            Remove local_12;
            local_12.opCall();
            return;
        }
        FC_UpdateMarkLevelSpotViewersDeferTag local_18;
        Assign local_16;
        local_16.opCall(local_18);
        return;
    }
    UFUNCTION()
    void Run_Monitor___CacheForDefer___Monitor_UpdateMarkLevelSpotViewers() const
    {
        int local_70 = 0;
        int local_72 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_32 = ::__GetMonitorPlayerInTeamOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_48 = local_32.Iterator();
        for (; local_48.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_62 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_63 = FECSEntityScopeCycleCounter(local_62.Entity);
            GetComponent local_68 = FECSMonitorRuntimeViewItem::GetComponent(local_62);
            this.Monitor___CacheForDefer___Monitor_UpdateMarkLevelSpotViewers(local_70, local_72);
        }
        FECSMonitorRuntimeView local_36 = ::__GetMonitorPlayerInTeamOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_60 = local_36.Iterator();
        for (; local_60.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_62_2 = local_60.Proceed();
            FECSEntityScopeCycleCounter local_63_2 = FECSEntityScopeCycleCounter(local_62_2.Entity);
            GetComponent local_68_2 = FECSMonitorRuntimeViewItem::GetComponent(local_62_2);
            this.Monitor___CacheForDefer___Monitor_UpdateMarkLevelSpotViewers(local_70, local_72);
        }
        FECSMonitorRuntimeView local_76 = ::__GetMonitorPlayerInTeamOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_48_2 = local_76.Iterator();
        for (; local_48_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_62_3 = local_48_2.Proceed();
            FECSEntityScopeCycleCounter local_63_3 = FECSEntityScopeCycleCounter(local_62_3.Entity);
            GetComponent local_68_3 = FECSMonitorRuntimeViewItem::GetComponent(local_62_3);
            this.Monitor___CacheForDefer___Monitor_UpdateMarkLevelSpotViewers(local_70, local_72);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateMarkLevelSpotViewers() const
    {
        const FECSEntity& local_120;
        int local_128 = 0;
        int local_130 = 0;
        ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        FECSRuntimeView local_44 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_48;
        local_48.opCall();
        FECSRuntimeViewIterator local_82 = local_44.Iterator();
        for (; local_82.CanProceed;)
        {
            local_120 = local_82.Proceed();
            FECSEntityScopeCycleCounter local_121 = FECSEntityScopeCycleCounter(local_120);
            this.Monitor_UpdateMarkLevelSpotViewers(local_130, local_128);
        }
        FECSMonitorRuntimeView local_136 = ::__GetMonitorPlayerInTeamOnAssignView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_152 = local_136.Iterator();
        for (; local_152.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_166 = local_152.Proceed();
            FECSEntityScopeCycleCounter local_121_2 = FECSEntityScopeCycleCounter(local_166.Entity);
            GetComponent local_170 = FECSMonitorRuntimeViewItem::GetComponent(local_166);
            this.Monitor_UpdateMarkLevelSpotViewers(local_120, local_128);
        }
        FECSMonitorRuntimeView local_140 = ::__GetMonitorPlayerInTeamOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_164 = local_140.Iterator();
        for (; local_164.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_166_2 = local_164.Proceed();
            FECSEntityScopeCycleCounter local_121_3 = FECSEntityScopeCycleCounter(local_166_2.Entity);
            GetComponent local_170_2 = FECSMonitorRuntimeViewItem::GetComponent(local_166_2);
            this.Monitor_UpdateMarkLevelSpotViewers(local_130, local_128);
        }
        FECSMonitorRuntimeView local_174 = ::__GetMonitorPlayerInTeamOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_152_2 = local_174.Iterator();
        for (; local_152_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_166_3 = local_152_2.Proceed();
            FECSEntityScopeCycleCounter local_121_4 = FECSEntityScopeCycleCounter(local_166_3.Entity);
            GetComponent local_170_3 = FECSMonitorRuntimeViewItem::GetComponent(local_166_3);
            this.Monitor_UpdateMarkLevelSpotViewers(local_120, local_128);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnMarkChanged() const
    {
        int local_50 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorMarkOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnMarkChanged(local_50);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorMarkOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_48_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnMarkChanged(local_50);
        }
        FECSMonitorRuntimeView local_54 = ::__GetMonitorMarkOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_54.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_48_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_OnMarkChanged(local_50);
        }
        FECSMonitorRuntimeView local_58 = ::__GetMonitorMarkOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40_2 = local_58.Iterator();
        for (; local_40_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_4 = local_40_2.Proceed();
            FECSEntityScopeCycleCounter local_43_4 = FECSEntityScopeCycleCounter(local_42_4.Entity);
            GetComponent local_48_4 = FECSMonitorRuntimeViewItem::GetComponent(local_42_4);
            this.Monitor_OnMarkChanged(local_50);
        }
        FECSMonitorRuntimeView local_62 = ::__GetMonitorMarkOnInactiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28_3 = local_62.Iterator();
        for (; local_28_3.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_5 = local_28_3.Proceed();
            FECSEntityScopeCycleCounter local_43_5 = FECSEntityScopeCycleCounter(local_42_5.Entity);
            GetComponent local_48_5 = FECSMonitorRuntimeViewItem::GetComponent(local_42_5);
            this.Monitor_OnMarkChanged(local_50);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DispatchFastMarkRequest() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
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
                this.ClientJob_DispatchFastMarkRequest(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_DispatchFastMarkRequest(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

