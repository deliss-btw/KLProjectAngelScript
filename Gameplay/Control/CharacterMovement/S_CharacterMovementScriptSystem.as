

class US_CharacterMovementScriptSystem : UECSScriptSystem
{
    UESMInputTriggerAsset SprintTrigger;
    UESMInputTriggerAsset StanceTrigger;

    US_CharacterMovementScriptSystem()
    {
        return;
    }
    UFUNCTION()
    void Init_Implementation()
    {
        UCharacterGlobalSetting local_4 = ::UCharacterGlobalSetting::Get();
        this.SprintTrigger = local_4.SprintTrigger;
        if (this.SprintTrigger != nullptr)
        {
            local_4.KeepSprintCondition.InitConditionRuntime(false);
        }
        this.StanceTrigger = local_4.StanceTrigger;
        return;
    }
    void UpdateExternallyDrivenMovementTag(const FECSEntity &inout Entity) const
    {
        Has local_4;
        bool local_5;
        if (local_4.opCall())
        {
            local_5 = true;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            Assign local_16;
            local_16.opCall(FC_ExternallyDrivenMovementTag());
            return;
        }
        Remove local_22;
        local_22.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_UpdateExternallyDrivenMovementTagOnAttach(const FECSEntity &inout Entity, const FC_TransformAttachmentLogic &inout TransformAttachment) const
    {
        this.UpdateExternallyDrivenMovementTag(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_UpdateExternallyDrivenMovementTagOnChain(const FECSEntity &inout Entity, const FC_ChainParentInfo &inout ChainParentInfo) const
    {
        this.UpdateExternallyDrivenMovementTag(Entity);
        return;
    }
    UFUNCTION()
    void Job_TickCharacterMoveStanceState(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, FC_CharacterMovementControl &inout CharacterMovementControl, const FC_ESMTrigger &inout ESMTrigger) const
    {
        if (CharacterMovementControl.GetbCachedModifyMoveStanceByScript())
        {
            return;
        }
        UCharacterGlobalSetting local_6 = ::UCharacterGlobalSetting::Get();
        int local_7 = local_6.WalkDeferFrames;
        FVector local_22 = FCharacterInputUtils::GetLocalMoveInput(Entity, FixedTime.Time, FFPTime(0));
        if ((local_22 == FVector::ZeroVector))
        {
            if (local_7 > 0)
            {
                CharacterMovementControl.SetWalkDeferCounter(FMath::Max((CharacterMovementControl.GetWalkDeferCounter() - 1), 0));
            }
            return;
        }
        if (FCharacterInputUtils::TestTrigger(this.StanceTrigger, Entity, FixedTime.LastTime, FixedTime.Time, ESMTrigger.Storage).bActive)
        {
            if (local_7 > 0)
            {
                CharacterMovementControl.SetWalkDeferCounter(local_7);
            }
            FCharacterCommonMoveUtils::SetMoveStanceAtLayer(CharacterMovementControl, ECharacterMoveStanceLayer(1), ECharacterMoveStance(2));
            return;
        }
        if (local_22.Size2D() >= FMath::Min(local_6.StanceThrethold, 0.98f))
        {
            if (local_7 > 0)
            {
                CharacterMovementControl.SetWalkDeferCounter(local_7);
            }
            FCharacterCommonMoveUtils::SetMoveStanceAtLayer(CharacterMovementControl, ECharacterMoveStanceLayer(1), ECharacterMoveStance(1));
            return;
        }
        if (local_7 > 0)
        {
            CharacterMovementControl.SetWalkDeferCounter(FMath::Min((CharacterMovementControl.GetWalkDeferCounter() + 1), local_7));
            if (CharacterMovementControl.GetWalkDeferCounter() < local_7)
            {
                FCharacterCommonMoveUtils::SetMoveStanceAtLayer(CharacterMovementControl, ECharacterMoveStanceLayer(1), ECharacterMoveStance(0));
                return;
            }
        }
        FCharacterCommonMoveUtils::SetMoveStanceAtLayer(CharacterMovementControl, ECharacterMoveStanceLayer(1), ECharacterMoveStance(2));
        return;
    }
    void StopKeepSprint(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        Modify local_10;
        local_10.opCall().SetbSprintOn(false);
        return;
    }
    UFUNCTION()
    void Job_TickCharacterSprintTrigger(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_CharacterMovementControl &inout CharacterMovementControl, const FC_ESMTrigger &inout ESMTrigger) const
    {
        Modify local_42;
        if (this.SprintTrigger != nullptr)
        {
            FActiveTriggerResult local_20 = FCharacterInputUtils::TestTrigger(this.SprintTrigger, Entity, FixedTime.LastTime, FixedTime.Time, ESMTrigger.Storage);
            if (local_20.bActive)
            {
                if (!(CharacterMovementControl.GetbSprintOn()))
                {
                    bool local_3;
                    Has local_24;
                    local_3 = local_24.opCall();
                    if (local_3)
                    {
                        Has local_28;
                        if (!(local_28.opCall()))
                        {
                            FC_CharacterKeepSprint local_38;
                            local_38 = FC_CharacterKeepSprint();
                            Assign local_32;
                            local_32.opCall(local_38).SetSprintOnTime(local_20.TriggerTime);
                        }
                    }
                    local_42.opCall().SetbSprintOn(true);
                }
            }
            else
            {
                if (CharacterMovementControl.GetbSprintOn())
                {
                    Get local_46;
                    const FC_CharacterKeepSprint& local_48 = local_46.opCall();
                    if (local_48)
                    {
                        FFPTime local_54 = (FFPTime(FixedTime.LastTime) - local_48.GetSprintOnTime());
                        if (local_54.opCmp(::UCharacterGlobalSetting::Get().KeepSprintDelay) < 0)
                        {
                            this.StopKeepSprint(Entity);
                        }
                    }
                    else
                    {
                        Get local_70;
                        Has local_66;
                        if (local_66.opCall() && local_70.opCall().IsDriverActive())
                        {
                        }
                        else
                        {
                            Has local_76;
                            bool local_71 = local_76.opCall();
                            if (local_71)
                            {
                            }
                            else
                            {
                                local_42.opCall().SetbSprintOn(false);
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TickInactiveCharacterKeepSprint(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_CharacterKeepSprint &inout CharacterKeepSprint) const
    {
        FFPTime local_6 = (FFPTime(FixedTime.LastTime) - CharacterKeepSprint.GetSprintOnTime());
        if (local_6.opCmp(::UCharacterGlobalSetting::Get().KeepSprintDelay) < 0)
        {
            this.StopKeepSprint(Entity);
        }
        return;
    }
    UFUNCTION()
    void Job_TickCharacterKeepSprint(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_CharacterKeepSprint &inout KeepSprint) const
    {
        if (!(::UCharacterGlobalSetting::Get().KeepSprintCondition.Evaluate(Entity)))
        {
            this.StopKeepSprint(Entity);
        }
        return;
    }
    UFUNCTION()
    void Job_TickCharacterOverrideVelocityDeferred(const FECSEntity &inout Entity, const FC_OverrideVelocityDeferred &inout OverrideVelocityDeferred, const FC_Transform &inout Transform, FC_Rigidbody &inout RigidBody) const
    {
        float local_30;
        FVector local_20;
        if (OverrideVelocityDeferred.GetbIsLocalSpace())
        {
            local_20 = Transform.GetRotation().UnrotateVector(RigidBody.GetVelocity());
        }
        else
        {
            local_20 = RigidBody.GetVelocity();
        }
        if (OverrideVelocityDeferred.GetbOverrideX())
        {
            float local_28;
            if (OverrideVelocityDeferred.GetbIsAbsoluteValueX())
            {
                local_28 = OverrideVelocityDeferred.GetVelocity().X;
            }
            else
            {
                float local_26 = OverrideVelocityDeferred.GetVelocity().X;
                local_28 = local_20.X * local_26;
            }
            local_20.X = local_28;
        }
        if (OverrideVelocityDeferred.GetbOverrideY())
        {
            if (OverrideVelocityDeferred.GetbIsAbsoluteValueY())
            {
                local_30 = OverrideVelocityDeferred.GetVelocity().Y;
            }
            else
            {
                local_30 = local_20.Y * OverrideVelocityDeferred.GetVelocity().Y;
            }
            local_20.Y = local_30;
        }
        if (OverrideVelocityDeferred.GetbOverrideZ())
        {
            float local_28;
            if (OverrideVelocityDeferred.GetbIsAbsoluteValueZ())
            {
                local_28 = OverrideVelocityDeferred.GetVelocity().Z;
            }
            else
            {
                local_28 = local_20.Z * OverrideVelocityDeferred.GetVelocity().Z;
            }
            local_20.Z = local_28;
        }
        FVector local_14;
        if (OverrideVelocityDeferred.GetbIsLocalSpace())
        {
            local_14 = Transform.GetRotation().RotateVector(local_20);
        }
        else
        {
            local_14 = local_20;
        }
        RigidBody.SetVelocity(local_14);
        Modify local_34;
        FC_CharacterMovementControl& local_36 = local_34.opCall();
        if (local_36)
        {
            local_36.SetInternalVelocity(RigidBody.GetVelocity());
        }
        Remove local_40;
        local_40.opCall();
        return;
    }
    UFUNCTION()
    void Job_DetectStuck(const FECSEntity &inout Entity, const FC_CharacterMovement &inout Movement, const FC_CharacterMovementNew &inout MovementNew, const FC_CharacterMovementControl &inout MovementControl, const FCS_FixedTime &inout FixedTime) const
    {
        int local_24 = 0;
        int local_1 = 1120403456;
        int local_3 = -1090519040;
        int local_4 = 1065353216;
        int local_5 = 1082130432;
        int local_6 = 1090519040;
        int local_7 = 3;
        if (!(Movement.GetbAirborne()) || MovementControl.GetbFlyingMovement() || Movement.GetbAnimFakeAirFloating() || MovementControl.GetInternalVelocity().IsNearlyZero(1.0) || (Movement.GetDeltaMovement().SizeSquared() > 100.0))
        {
            Remove local_18;
            local_18.opCall();
            return;
        }
        if (!(local_24))
        {
            FC_CharacterStuckInfo& local_50;
            local_50.Reset(FixedTime.Time, Movement.GetPosition());
            return;
        }
        if (((FVector(Movement.GetPosition()) + Movement.GetDeltaMovement()) - local_24.GetStartPosition()).SizeSquared() > 100.0)
        {
            Modify local_72;
            FC_CharacterStuckInfo& local_50;
            local_50 = local_72.opCall();
            if (local_50)
            {
                local_50.Reset(FixedTime.Time, Movement.GetPosition());
            }
            return;
        }
        if (local_24.GetbVerified())
        {
            return;
        }
        FFPTime local_78 = (FFPTime(FixedTime.Time) - local_24.GetStuckStartTime());
        if (local_78.opCmp(1.0) < 0)
        {
            return;
        }
        int local_79 = local_24.GetSwingCount();
        FVector3f local_82 = FVector3f(local_24.GetInputDir1());
        FVector3f local_85 = FVector3f(local_24.GetInputDir2());
        FVector3f local_94 = FVector3f(MovementControl.GetMovementInput()).GetSafeNormal2D(1e-8f, FVector3f::ZeroVector);
        if (local_82.IsNearlyZero(0.0001f))
        {
            local_82 = local_94;
        }
        else
        {
            if (local_85.IsNearlyZero(0.0001f))
            {
                local_85 = local_94;
            }
            else
            {
                if (!(local_94.IsNearlyZero(0.0001f)))
                {
                    float32 local_2 = local_82.DotProduct(local_94);
                    float32 local_95 = local_85.DotProduct(local_94);
                    if (local_2 < -0.5f || (local_95 < -0.5f))
                    {
                        local_79 = local_79 + 1;
                        local_82 = local_94;
                        local_85 = FVector3f::ZeroVector;
                    }
                    else
                    {
                        float32 local_96 = local_85.DotProduct(local_82);
                        if ((local_94.DotProduct((local_85 - local_82)) > 0.0f))
                        {
                            if (local_2 < local_96)
                            {
                                local_85 = local_94;
                            }
                        }
                        else
                        {
                            if (local_95 < local_96)
                            {
                                local_82 = local_94;
                            }
                        }
                    }
                }
            }
        }
        if (FCharacterInputUtils::IsInputSlotJustPressed(Entity, EESMTriggerInputSlot(41), FixedTime.LastTime, FixedTime.Time) || FCharacterInputUtils::IsInputSlotJustPressed(Entity, EESMTriggerInputSlot(40), FixedTime.LastTime, FixedTime.Time))
        {
            local_79 = local_79 + 1;
        }
        if (FixedTime.bClientSingularTick && ::CharacterMovementDebug::Enabled())
        {
            float32 local_99 = local_78 / 4.0f;
            FColor local_108 = FLinearColor::LerpUsingHSV(FLinearColor::Green, FLinearColor::Red, FMath::Clamp(local_99, 0.0f, 1.0f)).ToFColor(true);
            FVector local_62_2 = (FVector(local_82) * 30.0);
            FECSDebugDraw::DrawDebugDirectionalArrow(NAME_None, local_24.GetStartPosition(), (FVector(local_24.GetStartPosition()) + local_62_2), 3.0f, local_108, local_108, -1.0f, uint8(1), 1.0f);
            FECSDebugDraw::DrawDebugDirectionalArrow(NAME_None, local_24.GetStartPosition(), (FVector(local_24.GetStartPosition()) + (FVector(local_85) * 30.0)), 3.0f, local_108, local_108, -1.0f, uint8(1), 1.0f);
            FColor local_101 = FColor(uint8(0), uint8(0), uint8(0), uint8(0));
            if (local_78.opCmp(4.0) > 0)
            {
                local_99 = 8.0f;
            }
            else
            {
                local_99 = 4.0f;
            }
            FString local_124 = FString::ApplyFormat(local_78, ".1");
            FString local_120 = FString();
            FVector local_62_3 = FVector(local_24.GetStartPosition());
            FVector3f local_91 = (local_82 + local_85);
            FECSDebugDraw::DrawDebugString(NAME_None, (local_62_3 + (FVector(local_91) * 15.0)), local_120.Append("Time=").Append(local_124).Append("/").Append(local_99).Append().Append().Append().Append());
        }
        if (local_78.opCmp(4.0) > 0)
        {
            Modify local_72;
            FC_CharacterStuckInfo& local_50;
            if (local_79 >= 3 || (local_78.opCmp(8.0) > 0))
            {
                Get local_134;
                const FC_LastValidGround& local_136 = local_134.opCall();
                if (local_136)
                {
                    ::BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(Entity), local_136.GetLastGroundPosition(), Movement.GetRotation().Rotator(), false, FRotator::ZeroRotator, true, false, ELoadingScreenAction(0), false);
                }
                if (!(!(this.GetECSRuntime().bAdvanceNewFrame)) && FixedTime.bLatestFrame)
                {
                    FDebugReportUtils::UploadLog(ELog(11), "StuckRecord", FString().Append("DebugStuck ").Append(local_24.GetStartPosition().X).Append(", ").Append(local_24.GetStartPosition().Y).Append(", ").Append(local_24.GetStartPosition().Z).Append(", ").Append(MovementNew.GetStepUpHeight()).Append(" @ ").Append(Gameplay::GetCurrentLevelName(__GetWorldContext(), true)).Append(", ").Append(Entity));
                }
                local_50 = local_72.opCall();
                if (local_50)
                {
                    local_50.SetbVerified(true);
                    local_50.SetSwingCount(local_79);
                    local_50.SetInputDir1(local_82);
                    local_50.SetInputDir2(local_85);
                }
                return;
            }
            FFPTime local_76 = (local_78 - FixedTime.DeltaTime);
            if (local_76.opCmp(4.0) <= 0)
            {
                if (!(!(this.GetECSRuntime().bAdvanceNewFrame)) && FixedTime.bLatestFrame)
                {
                    FDebugReportUtils::UploadLog(ELog(11), "StuckRecordVerbose", FString().Append("DebugStuck ").Append(local_24.GetStartPosition().X).Append(", ").Append(local_24.GetStartPosition().Y).Append(", ").Append(local_24.GetStartPosition().Z).Append(", ").Append(MovementNew.GetStepUpHeight()).Append(" @ ").Append(Gameplay::GetCurrentLevelName(__GetWorldContext(), true)).Append(", ").Append(Entity));
                }
            }
        }
        if ((local_79 != local_24.GetSwingCount() || !((local_82 == local_24.GetInputDir1()))) || !((local_85 == local_24.GetInputDir2())))
        {
            Modify local_72;
            FC_CharacterStuckInfo& local_50;
            local_50 = local_72.opCall();
            if (local_50)
            {
                local_50.SetSwingCount(local_79);
                local_50.SetInputDir1(local_82);
                local_50.SetInputDir2(local_85);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateTeleportToEntityRequest(const FCE_UnstuckTeleportRequest &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        bool local_5 = false;
        FVector local_12(FVector::ZeroVector);
        Get local_16;
        const FC_LastValidNavGround& local_18 = local_16.opCall();
        if (local_18)
        {
            local_5 = true;
            local_12 = local_18.GetLastNavGroundPosition();
        }
        else
        {
            Get local_22;
            const FC_LastValidGround& local_24 = local_22.opCall();
            if (local_24)
            {
                local_5 = true;
                local_12 = local_24.GetLastGroundPosition();
            }
        }
        if (local_5)
        {
            Get local_28;
            ::BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(local_4), local_12, local_28.opCall().GetRotation().Rotator(), false, FRotator::ZeroRotator, true, false, ELoadingScreenAction(0), false);
        }
        else
        {
            XError(ELog(22), FString().Append("No valid position found for unstuck teleport, entity ").Append(local_4));
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateExternallyDrivenMovementTagOnAttach() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTransformAttachmentLogicOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateExternallyDrivenMovementTagOnAttach(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorTransformAttachmentLogicOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateExternallyDrivenMovementTagOnAttach(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateExternallyDrivenMovementTagOnChain() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorChainParentInfoOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateExternallyDrivenMovementTagOnChain(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorChainParentInfoOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateExternallyDrivenMovementTagOnChain(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCharacterMoveStanceState() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_188 = 0;
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
                this.Job_TickCharacterMoveStanceState(local_6, local_40, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_CharacterMovementControl> local_56;
                local_56.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_94.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickCharacterMoveStanceState(local_6, local_188, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_CharacterMovementControl>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCharacterSprintTrigger() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_180 = 0;
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
                this.Job_TickCharacterSprintTrigger(local_6, local_40, local_42, local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
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
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickCharacterSprintTrigger(local_6, local_180, local_42, local_48);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickInactiveCharacterKeepSprint() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_170 = 0;
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
                this.Job_TickInactiveCharacterKeepSprint(local_6, local_40, local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickInactiveCharacterKeepSprint(local_6, local_170, local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCharacterKeepSprint() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_170 = 0;
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
                this.Job_TickCharacterKeepSprint(local_6, local_40, local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickCharacterKeepSprint(local_6, local_170, local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCharacterOverrideVelocityDeferred() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_190 = 0;
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
                this.Job_TickCharacterOverrideVelocityDeferred(local_36, local_38, local_44, local_50);
                local_58.opCall(local_50);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_118 = 0;
        FECSRuntimeViewIterator local_152 = local_96.Iterator();
        for (; local_152.CanProceed;)
        {
            local_36 = local_152.Proceed();
            ++local_118;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_TickCharacterOverrideVelocityDeferred(local_190, local_38, local_44, local_50);
            local_58.opCall(local_50);
        }
        local_2.UpdateCachedEntityCount(local_118);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DetectStuck() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_210 = 0;
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
                this.Job_DetectStuck(local_40, local_42, local_48, local_54, local_6);
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
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_138 = 0;
        FECSRuntimeViewIterator local_172 = local_96.Iterator();
        for (; local_172.CanProceed;)
        {
            local_40 = local_172.Proceed();
            ++local_138;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_DetectStuck(local_210, local_42, local_48, local_54, local_6);
        }
        local_4.UpdateCachedEntityCount(local_138);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateTeleportToEntityRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_UnstuckTeleportRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_UnstuckTeleportRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_UnstuckTeleportRequest, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_UpdateTeleportToEntityRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

