

class US_CombatActionTimelineSystem : UECSScriptSystem
{
    US_CombatActionTimelineSystem()
    {
        return;
    }
    void DoMeleeStrikeAction(const FECSEntity &inout Entity, const FFPTime &inout EventTime, const FTransform &inout Transform, const FCombatTimelineActionHitTest &inout Action) const
    {
        FVector local_12 = Transform.TransformPosition(Action.PositionOffset);
        FQuat4f local_36 = (FQuat4f(Transform.GetRotation()) * Action.RotationOffset.Quaternion());
        FECSEntity local_40;
        while (Entity)
        {
            Has local_46;
            bool local_41 = local_46.opCall();
            if (local_41)
            {
                break;
            }
            Get local_50;
            const FC_Owner& local_52 = local_50.opCall();
            if (local_52)
            {
                local_40 = local_52.GetOwnerEntity();
            }
            else
            {
                break;
            }
        }
        SendEvent local_60;
        FCE_ArealStrikeRequestEvent& local_62 = local_60.opCall(EventTime);
        if (local_62)
        {
            local_62.TransformPos = local_12;
            local_62.TransformRot = local_36;
            local_62.SweepFromOffset = FVector3f::ZeroVector;
            local_62.Shape = Action.HitTestShape;
            local_62.AttackInfo.AttackData = Action.AttackData;
            local_62.StrikeEventData.StrikeShape = Action.StrikeShape;
            local_62.StrikeEventData.StrikeDirection = Transform.GetRotation().RotateVector(FVector(Action.StrikeDirection));
            local_62.StrikeEventData.bUseHitTestPosStrikeOrigin = true;
        }
        return;
    }
    void DoPlayFX(const FECSEntity &inout Entity, const FTransform &inout Transform, const FFXConfig &inout FXConfig, const bool bDetach, const EAttachFXStopMethod StopMethod, const FFPTime &inout Time, const bool bPredictable) const
    {
        if (bDetach)
        {
            FFXConfig local_116 = FXConfig;
            local_116.SetLocationOffset(Transform.TransformPosition(FXConfig.GetLocationOffset()));
            local_116.SetRotationOffset(Transform.TransformRotation(FXConfig.GetRotationOffset()));
            local_116.SetbUseWorldOriginAsBaseTransformSource(true);
            local_116.SetLocationOffsetSpace(EFXOffsetSpace(2));
            local_116.SetRotationOffsetSpace(EFXOffsetSpace(2));
            local_116.SetbDetach(true);
            ECSFX::PlayFXInstant(Entity, local_116, Time, 1.0f, true, bPredictable);
            return;
        }
        if (int(StopMethod) == 4)
        {
            ECSFX::PlayFXInstant(Entity, FXConfig, Time, 1.0f, true, bPredictable);
            return;
        }
        ECSFX::PlayFXDurationalEx(Entity, FXConfig, Time, 1.0f, true, Entity, EAttachFXStopMethod(StopMethod), false);
        return;
    }
    void DoAbilityEffectEvent(const FECSEntity &inout Entity, const FTransform &inout Transform, const FCombatTimelineActionAbilityEffectEvent &inout Action, const FFPTime &inout EventTime) const
    {
        int local_28 = 0;
        int local_50 = 0;
        int local_60 = 0;
        FECSEntity local_4 = Entity;
        Has local_10;
        while (local_4.IsValid() && !(local_10.opCall()))
        {
            Get local_16;
            const FC_Owner& local_18 = local_16.opCall();
            if (local_18)
            {
                local_4 = local_18.GetOwnerEntity();
            }
            else
            {
                break;
            }
        }
        if (local_4.IsValid())
        {
            FECSEntity local_22 = FECSEntity(local_28.GetInstanceEntityId(FSoftClassPath(Action.AbilityClass)));
            if (local_22.IsValid())
            {
                FAbilityEffectEventContext& local_54 = FAbilityUtils::CreateAbilityEffectEvent(local_50, EAbilityEffectEvent(0), Action.EventName, EventTime);
                FAbilityEffectEventContext::InitializeEventData(local_54);
                local_60.SetEntity(Entity);
                local_60.SetPosition(Transform.GetLocation());
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TriggerCombatActions(const FECSEntity &inout Entity, const FC_CombatActionTimelineConfig &inout ActionConfig, FC_CombatActionPendingTrigger &inout ActionPendingTrigger, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_1 = false;
        FTransform local_28;
        FFPTime local_30 = FFPTime();
        FFPTime local_30_2 = -1;
        int local_32 = 0;
        for (; local_32 < ActionPendingTrigger.GetWaitingActionTriggers().Num(); ++local_32)
        {
            const FCombatActionTrigger& local_36 = ActionPendingTrigger.GetWaitingActionTriggers()[local_32];
            FFPTime local_38 = FFPTime(FixedTime.Time);
            if (local_38.opCmp(local_36.GetTriggerTime()) >= 0)
            {
                if (ActionConfig.ActionTimePoints.IsValidIndex(local_36.GetIndexInConfig()))
                {
                    if (!(local_1))
                    {
                        local_28 = FTransformUtils::GetTransform(Entity, FixedTime.Time);
                        local_1 = true;
                    }
                    const FCombatTimelineActionPoint& local_66 = ActionConfig.ActionTimePoints[local_36.GetIndexInConfig()];
                    for (auto& local_80 : local_66.SpawnFXActions)
                    {
                        bool local_2 = Entity.IsActive();
                        FFPTime local_82 = (FFPTime(FixedTime.Time) + local_80.SpawnFXDelayTime);
                        this.DoPlayFX(Entity, local_28, local_80.FXConfig, local_80.FXConfig.GetbDetach() || !(Entity.IsActive()));
                    }
                    for (auto& local_100 : local_66.HitTestActions)
                    {
                        this.DoMeleeStrikeAction(Entity, (FFPTime(FixedTime.Time) + local_100.HitTestDelayTime), local_28, local_100);
                    }
                    for (auto& local_114 : local_66.AbilityEffectEventActions)
                    {
                        this.DoAbilityEffectEvent(Entity, local_28, local_114, FixedTime.Time);
                    }
                }
                ActionPendingTrigger.GetModify_WaitingActionTriggers().RemoveAtSwap(local_32);
                --local_32;
                continue;
            }
            if ((local_30_2 == -1.0) || ((FFPTime(local_36.GetTriggerTime()).opCmp(local_30_2) < 0)))
            {
                local_30_2 = local_36.GetTriggerTime();
            }
        }
        if (!((local_30_2 == ActionPendingTrigger.GetNextTriggerTime())))
        {
            ActionPendingTrigger.SetNextTriggerTime(local_30_2);
        }
        if (ActionPendingTrigger.GetWaitingActionTriggers().IsEmpty())
        {
            Modify local_120;
            FC_DelayDestroyCounter& local_122 = local_120.opCall();
            if (local_122)
            {
                local_122.SetRefCount((local_122.GetRefCount() - 1));
            }
            Remove local_126;
            local_126.opCall();
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_TriggerCombatActions(const FC_CombatActionPendingTrigger &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextTriggerTime());
        FName local_8 = FName("S_CombatActionTimelineSystem::Job_TriggerCombatActions");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_TriggerCombatActions(const FC_CombatActionPendingTrigger &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextTriggerTime());
        FName local_8 = FName("S_CombatActionTimelineSystem::Job_TriggerCombatActions");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_TriggerCombatActions(const FC_CombatActionPendingTrigger &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextTriggerTime());
        FName local_8 = FName("S_CombatActionTimelineSystem::Job_TriggerCombatActions");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_TriggerCombatActions() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatActionPendingTriggerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_TriggerCombatActions(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatActionPendingTriggerOnAssignView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_TriggerCombatActions(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_TriggerCombatActions() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatActionPendingTriggerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_TriggerCombatActions(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatActionPendingTriggerOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_TriggerCombatActions(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_TriggerCombatActions() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatActionPendingTriggerOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_TriggerCombatActions(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatActionPendingTriggerOnAssignView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_TriggerCombatActions(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TriggerCombatActions() const
    {
        int local_6 = 0;
        bool local_34;
        int local_40 = 0;
        int local_66 = 0;
        int local_68 = 0;
        int local_74 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_50;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            if (!(local_40))
            {
                continue;
            }
            FFPTime local_42 = FFPTime(local_40.GetNextTriggerTime());
            if (local_42.opCmp(0.0) < 0 || (FFPTime(local_40.GetNextTriggerTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_50.opCall()) == !(false))
            {
                FString local_54 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_58 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_TriggerCombatActions(local_66, local_68, local_74, local_6);
            MarkModifiedIfDirty local_82;
            local_82.opCall(local_74);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
}

