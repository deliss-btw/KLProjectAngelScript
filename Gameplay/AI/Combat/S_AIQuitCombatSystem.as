

class US_AIQuitCombatSystem : UECSScriptSystem
{
    FName MuteCombatSource = n"ReturnToHome";

    US_AIQuitCombatSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleCombatStallFallbackQuitCombat(const FCE_AICombatStallFallbackQuitCombat &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        ::FAIKnowledgeUtils::QuitCombat(local_4);
        return;
    }
    UFUNCTION()
    void Job_HandleAIEnterCombatArea(const FCE_AIEnterCombatArea &inout Event) const
    {
        Has local_32;
        int local_74 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if ((int(::FAIQuitCombatUtils::GetQuitCombatRule(local_4))) != 0)
        {
            return;
        }
        FECSEntity local_12 = ::FEcologySceneInfoUtils::FindCreatureTargetCombatRegion(local_4);
        if (local_12)
        {
            if ((local_12 == Event.CombatAreaEntity))
            {
                Has local_20;
                bool local_5 = local_20.opCall();
                if (local_5)
                {
                    Remove local_24;
                    local_24.opCall();
                }
                Has local_28;
                bool local_5_2 = local_28.opCall();
                if (local_5_2)
                {
                    if (!(local_32.opCall()))
                    {
                        local_74.ResumeCombatTime = (ECS::GetContextTime() + FFPTime(::FAIQuitCombatUtils::GetQuitCombatConfig(local_4).ResumeCombatDelay));
                    }
                }
                else
                {
                    if (!(local_32.opCall()))
                    {
                        ::FAIQuitCombatUtils::CancelReturnToHomeIntent(local_4);
                        if (::FAIKnowledgeUtils::CanMuteCombat(local_4))
                        {
                            ::FAIKnowledgeUtils::RemoveMuteCombat(local_4, this.MuteCombatSource);
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleAIExitCombatArea(const FCE_AIExitCombatArea &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if ((int(::FAIQuitCombatUtils::GetQuitCombatRule(local_4))) != 0)
        {
            return;
        }
        FECSEntity local_12 = ::FEcologySceneInfoUtils::FindCreatureTargetCombatRegion(local_4);
        if (local_12)
        {
            if ((local_12 == Event.CombatAreaEntity))
            {
                ::FAIQuitCombatUtils::BeginQuitCombatCheckWithCombatArea(local_4, local_12);
                Has local_20;
                bool local_5 = local_20.opCall();
                if (local_5)
                {
                    Remove local_24;
                    local_24.opCall();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleFlockClaimNewResource(const FCE_FlockClaimNewResourceEvent &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        FECSRuntimeView local_46 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_50;
        local_50.opCall();
        Include local_54;
        local_54.opCall();
        FECSRuntimeViewIterator local_88 = local_46.Iterator();
        for (; local_88.CanProceed;)
        {
            const FECSEntity& local_124 = local_88.Proceed();
            Get local_128;
            const FC_FlockMember& local_130 = local_128.opCall();
            if (local_130)
            {
                if ((!((local_4 == local_130.FlockProxyEntity))))
                {
                    continue;
                }
                ::FAIQuitCombatUtils::ClearReturnToHome(local_124);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_AIResumeCombatOnTimeExceed(const FECSEntity &inout Entity, const FC_AIResumeCombatTimer &inout ResumeCombatTimer) const
    {
        ::FAIKnowledgeUtils::RemoveMuteCombat(Entity, this.MuteCombatSource);
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_CheckAIQuitCombat(const FECSEntity &inout Entity, const FC_AIQuitCombatCheck &inout AIQuitCombatCheck, const FC_AIQuitCombatInfo &inout AIQuitCombatInfo, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_37;
        bool local_52;
        AECSVolumeBase local_64;
        FAIQuitCombatConfig local_18 = ::FAIQuitCombatUtils::GetQuitCombatConfig(Entity);
        local_37 = false;
        FFPTime local_46 = AIQuitCombatCheck.CheckStartTime;
        if (FFPTime(FixedTime.Time).opCmp((local_46 + FFPTime(local_18.QuitCombatDelay))) > 0)
        {
            local_37 = true;
        }
        local_52 = false;
        if (AIQuitCombatInfo.TargetCombatArea.IsValid())
        {
            Get local_56;
            const FC_RegionVolume& local_58 = local_56.opCall();
            if (local_58)
            {
                if (local_58.RegionVolume.IsValid())
                {
                    AActor local_60;
                    local_64 = (Cast<AECSVolumeBase>(local_60));
                    if (local_64 != nullptr)
                    {
                        if (float32(Transform.GetPosition().Distance(local_64.GetBounds().GetBox().GetClosestPointTo(Transform.GetPosition()))) > local_18.QuitCombatDistance)
                        {
                        }
                    }
                }
            }
        }
        else
        {
            if (AIQuitCombatInfo.bHasAnchorPosition)
            {
                local_52 = true;
                if (Transform.GetPosition().DistSquared(AIQuitCombatInfo.AnchorPosition) > FMath::Square((local_18.CombatRadius + local_18.QuitCombatDistance)))
                {
                    local_37 = true;
                }
            }
        }
        if (local_37)
        {
            Remove local_118;
            if (AIQuitCombatInfo.bHasHomeLocation)
            {
                FC_AIQuitCombatInfo local_114;
                local_114.bNeedReturnToHome = true;
                ::FAIKnowledgeUtils::SetAIBlackboardValueBool(Entity, n"bIsReturnToHome", true);
            }
            local_118.opCall();
        }
        if (!(local_52))
        {
            Remove local_118;
            local_118.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveAIReturnToHome(const FECSEntity &inout Entity, const FC_AIReturnToHomeTag &inout ReturnToHomeTag) const
    {
        ::FAIQuitCombatUtils::ResetQuitCombatInfo(Entity);
        if (::FAIKnowledgeUtils::CanMuteCombat(Entity))
        {
            ::FAIKnowledgeUtils::RemoveMuteCombat(Entity, this.MuteCombatSource);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveAIResumeCombatTimer(const FECSEntity &inout Entity, const FC_AIResumeCombatTimer &inout ResumeCombatTimer) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            if (::FAIKnowledgeUtils::CanMuteCombat(Entity))
            {
                ::FAIKnowledgeUtils::RemoveMuteCombat(Entity, this.MuteCombatSource);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_CheckAIReachHome(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FC_AIQuitCombatInfo &inout QuitCombatInfo) const
    {
        FAIQuitCombatConfig local_18 = ::FAIQuitCombatUtils::GetQuitCombatConfig(Entity);
        bool local_37 = false;
        FVector local_44(FVector::ZeroVector);
        if (QuitCombatInfo.bHasHomeLocation)
        {
            if (FECSEntity(QuitCombatInfo.HomeResource).IsValid())
            {
                Get local_52;
                const FC_Transform& local_54 = local_52.opCall();
                if (local_54)
                {
                    local_44 = local_54.GetPosition();
                    local_37 = true;
                }
            }
            if (!(local_37))
            {
                local_44 = QuitCombatInfo.HomeLocation;
                local_37 = true;
            }
        }
        if (local_37)
        {
            if (Transform.GetPosition().DistSquared(local_44) <= FMath::Square(local_18.ReturnToHomeAcceptRadius))
            {
                ::FAIQuitCombatUtils::ClearReturnToHome(Entity);
            }
        }
        if (!(local_37))
        {
            ::FAIQuitCombatUtils::ClearReturnToHome(Entity);
        }
        return;
    }
    UFUNCTION()
    void Monitor_AIEnterCombat(const FC_AICombatTag &inout EnterCombat, const FECSEntity &inout Entity) const
    {
        int local_44 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            ::FAIQuitCombatUtils::ClearReturnToHome(Entity);
        }
        Has local_10;
        bool local_5_2 = local_10.opCall();
        if (local_5_2)
        {
            Remove local_14;
            local_14.opCall();
        }
        if (int(::FAIQuitCombatUtils::GetQuitCombatRule(Entity)) == 1)
        {
            const FC_Transform& local_38;
            Get local_36;
            Get local_22;
            const FC_FlockMember& local_24 = local_22.opCall();
            if (local_24)
            {
                if (FECSEntity(local_24.FlockProxyEntity).IsValid())
                {
                    local_38 = local_36.opCall();
                    if (local_38)
                    {
                        local_44.Position = local_38.GetPosition();
                    }
                }
            }
        }
        if (int(::FAIQuitCombatUtils::GetQuitCombatRule(Entity)) == 3)
        {
            const FC_Transform& local_38;
            Get local_36;
            local_38 = local_36.opCall();
            if (local_38)
            {
                local_44.Position = local_38.GetPosition();
            }
        }
        Has local_48;
        if (!(local_48.opCall()))
        {
            const FC_Transform& local_38;
            Get local_36;
            EAIQuitCombatRule local_15 = ::FAIQuitCombatUtils::GetQuitCombatRule(Entity);
            if (int(local_15) == 1 || (int(local_15) == 0))
            {
                if (!(::FEcologySceneInfoUtils::FindCreatureTargetCombatRegion(Entity).IsValid() && (int(local_15) == 0)))
                {
                    local_38 = local_36.opCall();
                    if (local_38)
                    {
                        local_44.Position = local_38.GetPosition();
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_AIExitCombat(const FC_AICombatTag &inout ExitCombat, const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_ClearTargetsOnMuteCombat(const FECSEntity &inout Entity, const FC_AIMuteCombat &inout MuteCombat) const
    {
        Modify local_10;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            FC_AITargetingV2& local_12 = local_10.opCall();
            if (local_12)
            {
                if (DelayTask::IsValidHandle(local_12.UpdateTargetingTaskHandle))
                {
                    DelayTask::CancelTask(local_12.UpdateTargetingTaskHandle);
                    local_12.UpdateTargetingTaskHandle = FDelayTaskConst::EmptyDelayTaskHandle;
                }
            }
            XLog(ELog(14), FString().Append(Entity.GetEntityName()).Append(" MuteCombat Pending - defer clear to BT root"));
            return;
        }
        ::FAITargetingUtils::ClearSelfTargeting(Entity);
        FC_AITargetingV2& local_12_2 = local_10.opCall();
        if (local_12_2)
        {
            if (DelayTask::IsValidHandle(local_12_2.UpdateTargetingTaskHandle))
            {
                DelayTask::CancelTask(local_12_2.UpdateTargetingTaskHandle);
                local_12_2.UpdateTargetingTaskHandle = FDelayTaskConst::EmptyDelayTaskHandle;
            }
        }
        FC_AINeedUpdateAITargetingTag local_26;
        Assign local_24;
        local_24.opCall(local_26);
        XLog(ELog(14), FString().Append(Entity.GetEntityName()).Append(" Clear Targets On Mute Combat"));
        return;
    }
    UFUNCTION()
    void Job_CheckExitAnchorCombatArea(const FECSEntity &inout Entity, const FC_AIQuitCombatFixedFlockAnchor &inout QuitCombatAnchor, const FC_Transform &inout Transform) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_RemoveResumeCombatTimerOnExitCombatRange(const FECSEntity &inout Entity, const FC_AIResumeCombatTimer &inout ResumeCombatTimer, const FC_AIQuitCombatInfo &inout QuitCombatInfo, const FC_Transform &inout Transform) const
    {
        FAIQuitCombatConfig local_18 = ::FAIQuitCombatUtils::GetQuitCombatConfig(Entity);
        Has local_40;
        if (!(local_40.opCall()))
        {
            return;
        }
        if (::FAIQuitCombatUtils::CheckIsInCombatRange(Entity, QuitCombatInfo, Transform, local_18, false))
        {
            Remove local_46;
            local_46.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_RemoveQuitCombatCheckOnEnterCombatRange(const FECSEntity &inout Entity, const FC_AIQuitCombatCheck &inout QuitCombatCheck, const FC_AIQuitCombatInfo &inout QuitCombatInfo, const FC_Transform &inout Transform) const
    {
        FAIQuitCombatConfig local_18 = ::FAIQuitCombatUtils::GetQuitCombatConfig(Entity);
        Has local_40;
        if (!(local_40.opCall()))
        {
            return;
        }
        if (::FAIQuitCombatUtils::CheckIsInCombatRange(Entity, QuitCombatInfo, Transform, local_18, true))
        {
            Remove local_46;
            local_46.opCall();
            Has local_54;
            Has local_50;
            if (!(local_50.opCall()) && !(local_54.opCall()))
            {
                if (::FAIKnowledgeUtils::CanMuteCombat(Entity))
                {
                    ::FAIKnowledgeUtils::RemoveMuteCombat(Entity, this.MuteCombatSource);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleReturnToHomeOnEnterCombatRange(const FECSEntity &inout Entity, const FC_AIQuitCombatInfo &inout QuitCombatInfo, const FC_Transform &inout Transform) const
    {
        int local_52 = 0;
        FAIQuitCombatConfig local_18 = ::FAIQuitCombatUtils::GetQuitCombatConfig(Entity);
        Has local_40;
        if (!(local_40.opCall()))
        {
            return;
        }
        if (::FAIQuitCombatUtils::CheckIsInCombatRange(Entity, QuitCombatInfo, Transform, local_18, true))
        {
            Has local_46;
            if (!(local_46.opCall()))
            {
                local_52.ResumeCombatTime = (ECS::GetContextTime() + FFPTime(local_18.ResumeCombatDelay));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_SafetyCheckMuteCombatPending(const FECSEntity &inout Entity) const
    {
        if (!(::FAIKnowledgeUtils::HasRunningBehaviorTree(Entity)))
        {
            Remove local_6;
            local_6.opCall();
            ::FAITargetingUtils::ClearSelfTargeting(Entity);
            if (::FAIKnowledgeUtils::CanMuteCombat(Entity))
            {
                ::FAIKnowledgeUtils::QuitCombat(Entity);
            }
            XLog(ELog(14), FString().Append(Entity.GetEntityName()).Append(" MuteCombatPending safety cleared - BT not running"));
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleCombatStallFallbackQuitCombat() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AICombatStallFallbackQuitCombat> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AICombatStallFallbackQuitCombat& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleCombatStallFallbackQuitCombat(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAIEnterCombatArea() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIEnterCombatArea> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIEnterCombatArea& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleAIEnterCombatArea(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAIExitCombatArea() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIExitCombatArea> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIExitCombatArea& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleAIExitCombatArea(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleFlockClaimNewResource() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_FlockClaimNewResourceEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_FlockClaimNewResourceEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleFlockClaimNewResource(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_AIResumeCombatOnTimeExceed(const FC_AIResumeCombatTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.ResumeCombatTime;
        FName local_8 = FName("S_AIQuitCombatSystem::Job_AIResumeCombatOnTimeExceed");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_AIResumeCombatOnTimeExceed(const FC_AIResumeCombatTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.ResumeCombatTime;
        FName local_8 = FName("S_AIQuitCombatSystem::Job_AIResumeCombatOnTimeExceed");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_AIResumeCombatOnTimeExceed() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorAIResumeCombatTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_AIResumeCombatOnTimeExceed(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorAIResumeCombatTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_AIResumeCombatOnTimeExceed(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_AIResumeCombatOnTimeExceed() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorAIResumeCombatTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_AIResumeCombatOnTimeExceed(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorAIResumeCombatTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_AIResumeCombatOnTimeExceed(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_AIResumeCombatOnTimeExceed() const
    {
        int local_38 = 0;
        int local_46 = 0;
        int local_48 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        local_2.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_10 = local_2.GetExternalEntityList();
        FECSEntity local_28;
        for (auto& local_24 : local_10)
        {
            local_24;
            FECSEntityScopeCycleCounter local_29 = FECSEntityScopeCycleCounter(local_28);
            bool local_7 = false;
            bool local_31 = !(false);
            if (!(local_28.IsActive()) == local_31)
            {
                continue;
            }
            if (!(local_38))
            {
                continue;
            }
            FFPTime local_40 = local_38.ResumeCombatTime;
            if (local_40.opCmp(0.0) < 0 || (local_38.ResumeCombatTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_7)
            {
                continue;
            }
            this.Job_AIResumeCombatOnTimeExceed(local_46, local_48);
        }
        local_2.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_CheckAIQuitCombat() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
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
                this.Job_CheckAIQuitCombat(local_40, local_42, local_48, local_54, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_40 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_CheckAIQuitCombat(local_186, local_42, local_48, local_54, local_6);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveAIReturnToHome() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAIReturnToHomeTagOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveAIReturnToHome(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveAIResumeCombatTimer() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAIResumeCombatTimerOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveAIResumeCombatTimer(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CheckAIReachHome() const
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
                this.Job_CheckAIReachHome(local_36, local_38, local_44);
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
            this.Job_CheckAIReachHome(local_176, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_AIEnterCombat() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAICombatTagOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AIEnterCombat(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_AIExitCombat() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAICombatTagOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AIExitCombat(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClearTargetsOnMuteCombat() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAIMuteCombatOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClearTargetsOnMuteCombat(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CheckExitAnchorCombatArea() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_184 = 0;
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
                this.Job_CheckExitAnchorCombatArea(local_36, local_38, local_44);
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
        Exclude(local_86).opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_86.Iterator();
        for (; local_146.CanProceed;)
        {
            local_36 = local_146.Proceed();
            ++local_112;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_CheckExitAnchorCombatArea(local_184, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_112);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RemoveResumeCombatTimerOnExitCombatRange() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        int local_182 = 0;
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
                this.Job_RemoveResumeCombatTimerOnExitCombatRange(local_36, local_38, local_44, local_50);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_92.Iterator();
        for (; local_144.CanProceed;)
        {
            local_36 = local_144.Proceed();
            ++local_110;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_RemoveResumeCombatTimerOnExitCombatRange(local_182, local_38, local_44, local_50);
        }
        local_2.UpdateCachedEntityCount(local_110);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RemoveQuitCombatCheckOnEnterCombatRange() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        int local_182 = 0;
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
                this.Job_RemoveQuitCombatCheckOnEnterCombatRange(local_36, local_38, local_44, local_50);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_92.Iterator();
        for (; local_144.CanProceed;)
        {
            local_36 = local_144.Proceed();
            ++local_110;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_RemoveQuitCombatCheckOnEnterCombatRange(local_182, local_38, local_44, local_50);
        }
        local_2.UpdateCachedEntityCount(local_110);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleReturnToHomeOnEnterCombatRange() const
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
                this.Job_HandleReturnToHomeOnEnterCombatRange(local_36, local_38, local_44);
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
            this.Job_HandleReturnToHomeOnEnterCombatRange(local_176, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SafetyCheckMuteCombatPending() const
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
                this.Job_SafetyCheckMuteCombatPending(local_36);
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
            this.Job_SafetyCheckMuteCombatPending(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

