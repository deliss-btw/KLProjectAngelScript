

class US_MovementAttributeSystem : UECSScriptSystem
{
    US_MovementAttributeSystem()
    {
        return;
    }
    void SetMovementParamByActionState(const FECSEntity &inout Entity, const FC_CharacterMovementActionState &inout CharacterMovementActionState, const FC_CharacterMovementConfig &inout CharacterMovementConfig, FC_CharacterMovementParam &inout DestMovementParam) const
    {
        float32 local_37;
        float32 local_38;
        if (CharacterMovementConfig.ConfigDataKey.IsValid())
        {
            float32 local_30;
            float32 local_29;
            FDTCharacterMovementConfig local_4;
            TDataObjectPtr<FDTCharacterMovementConfig> local_28 = TDataObjectPtr<FDTCharacterMovementConfig>(CharacterMovementConfig.ConfigDataKey);
            local_29 = 1.0f;
            if (DestMovementParam.bMoveSpeedScaledByEntityScale)
            {
                Get local_36;
                const FC_Scale& local_32 = local_36.opCall();
                if (local_32)
                {
                    local_29 = local_32.GetUniformScale();
                }
            }
            local_30 = local_4.ExternalForceMaxSpeed;
            if (CharacterMovementActionState.GetbFlyingMovement())
            {
                DestMovementParam.SetbPitchSpeedUseCurve(true);
                DestMovementParam.SetbTurnSpeedUseCurve(true);
                local_30 = local_4.FlySpeed;
                local_30 = local_30 * local_29;
                local_30 = local_4.FlyAscendSpeed;
                local_30 = local_30 * local_29;
                local_30 = local_4.FlyAcceleration;
                local_30 = local_4.FlyStopAccel;
                local_30 = local_4.FlySteerAccel;
                DestMovementParam.PitchSpeedCurve = local_4.FlyPitchSpeedCurve;
                DestMovementParam.TurnSpeedScaleCurve = local_4.FlyTurnSpeedScaleCurve;
                local_30 = local_4.FlyPitchMax;
                local_30 = local_4.FlyPitchMin;
                local_30 = local_4.FlyTurnSpeedYaw;
                if (local_30 >= 0.0f)
                {
                    local_38 = local_4.FlyTurnSpeedYaw;
                }
                else
                {
                    local_38 = local_4.TurnSpeed;
                }
                local_37 = local_4.FlyTurnAccelYaw;
                if (local_37 >= 0.0f)
                {
                    local_30 = local_4.FlyTurnAccelYaw;
                }
                else
                {
                    local_30 = local_4.TurnMaxAcceleration;
                }
                local_38 = local_4.FlyTurnSpeedPitch;
                if (local_38 >= 0.0f)
                {
                    local_37 = local_4.FlyTurnSpeedPitch;
                }
                else
                {
                    local_37 = local_4.TurnSpeed;
                }
                local_30 = local_4.FlyTurnAccelPitch;
                if (local_30 >= 0.0f)
                {
                    local_38 = local_4.FlyTurnAccelPitch;
                }
                else
                {
                    local_38 = local_4.TurnMaxAcceleration;
                }
            }
            else
            {
                local_37 = 0.0f;
                local_38 = DestMovementParam.RotatePitchMin;
                DestMovementParam.SetbPitchSpeedUseCurve(false);
                DestMovementParam.SetbTurnSpeedUseCurve(false);
                switch (int(CharacterMovementActionState.GetMovementType()))
                {
                case 1:
                {
                    local_38 = local_4.BaseNaviWalkMoveSpeed;
                    local_37 = local_38 * local_29;
                    DestMovementParam.MoveSpeedAnimCurve = local_4.NaviWalkMoveSpeedAnimCurve;
                    break;
                }
                case 4:
                {
                    local_38 = local_4.BaseStrafeWalkMoveSpeed;
                    local_30 = local_38 * local_29;
                    DestMovementParam.MoveSpeedAnimCurve = local_4.StrafeWalkMoveSpeedAnimCurve;
                    break;
                }
                case 5:
                {
                    local_30 = local_4.BaseStrafeJogMoveSpeed;
                    local_38 = local_30 * local_29;
                    DestMovementParam.MoveSpeedAnimCurve = local_4.StrafeJogMoveSpeedAnimCurve;
                    break;
                }
                case 2:
                {
                    local_38 = local_4.BaseNaviRunMoveSpeed;
                    local_30 = local_38 * local_29;
                    DestMovementParam.MoveSpeedAnimCurve = local_4.NaviRunMoveSpeedAnimCurve;
                    break;
                }
                case 3:
                {
                    local_30 = local_4.BaseNaviSprintMoveSpeed;
                    local_38 = local_30 * local_29;
                    DestMovementParam.MoveSpeedAnimCurve = local_4.NaviSprintMoveSpeedAnimCurve;
                    break;
                }
                case 6:
                {
                    local_38 = local_4.BaseNearDeathCrawlMoveSpeed;
                    local_30 = local_38 * local_29;
                    DestMovementParam.MoveSpeedAnimCurve = local_4.NearDeathCrawlMoveSpeedAnimCurve;
                    break;
                }
                }
                local_30 = local_4.MoveAcceleration;
                local_38 = local_4.MoveStopAccel;
                local_30 = local_4.MoveSteerAccel;
                local_38 = local_4.TurnSpeed;
                local_30 = local_4.TurnMaxAcceleration;
            }
            local_38 = local_4.TurnLerpRatio;
            local_30 = local_4.StepHeight;
            local_38 = local_4.MaxHoverHeight;
            if (local_38 > 0.0f)
            {
                local_37 = local_4.MaxHoverHeight;
            }
            else
            {
                local_37 = DestMovementParam.StepHeight;
            }
            DestMovementParam.bKeepStepHeightInAir = (local_4.bKeepStepHeightInAir != 0);
            DestMovementParam.bImmovableByPlayer = (local_4.bImmovableByPlayer != 0);
            local_37 = local_4.WalkableSlopDegree;
            DestMovementParam.SlopeSpeedScale = local_4.SlopeSpeedScale;
            local_38 = local_4.DitchProtectRadius;
            local_37 = local_4.EdgeProtectRadius;
            local_38 = local_4.WallRunSpeed;
            local_37 = local_4.WallRunSnapSpeed;
            local_38 = local_4.WallRunMinSlopeDegree;
            local_37 = local_4.WallRunMaxSlopeDegree;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateCharacterMovementParamAfterNetSync(const FECSEntity &inout Entity, const FC_CharacterMovementActionState &inout CharacterMovementActionState, FC_CharacterMovementParam &inout CharacterMovementParam, const FC_CharacterMovementConfig &inout CharacterMovementConfig) const
    {
        this.SetMovementParamByActionState(Entity, CharacterMovementActionState, CharacterMovementConfig, CharacterMovementParam);
        return;
    }
    UFUNCTION()
    void Monitor_UpdateMovementParamOnActionStateChanged(const FECSEntity &inout Entity, const FC_CharacterMovementActionState &inout CharacterMovementActionState) const
    {
        this.UpdateMovementParam(Entity, CharacterMovementActionState);
        return;
    }
    UFUNCTION()
    void Monitor_UpdateMovementParamOnActionStateChangedDefer(const FECSEntity &inout Entity, const FC_CharacterMovementActionState &inout CharacterMovementActionState) const
    {
        this.UpdateMovementParam(Entity, CharacterMovementActionState);
        return;
    }
    UFUNCTION()
    void Monitor_UpdateMovementParamOnScaleChanged(const FECSEntity &inout Entity, const FC_Scale &inout Scale) const
    {
        GetDefaulted local_4;
        this.UpdateMovementParam(Entity, local_4.opCall());
        return;
    }
    void UpdateMovementParam(const FECSEntity &inout Entity, const FC_CharacterMovementActionState &inout CharacterMovementActionState) const
    {
        Has local_4;
        int local_12 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        Modify local_16;
        FC_CharacterMovementParam& local_18 = local_16.opCall();
        if (local_18)
        {
            this.SetMovementParamByActionState(Entity, CharacterMovementActionState, local_12, local_18);
        }
        return;
    }
    UFUNCTION()
    void Job_TickMoveSpeedAttribute(const FECSEntity &inout Entity, const FC_GameAttribute &inout GameAttribute, FC_CharacterMovementSpeedModifier &inout CharacterMovementSpeedModifier, const FCS_FixedTime &inout FixedTime) const
    {
        if ((!((GameAttribute.GetAttributeSet() != nullptr))))
        {
            FName local_5(Entity.GetEntityName());
        }
        if (!(GameAttribute.HasAttribute(Attribute::MoveSpeedAddRatio)))
        {
            return;
        }
        CharacterMovementSpeedModifier.SetAttributeSpeedModifier(GameAttribute.GetAttributeValue(Attribute::MoveSpeedAddRatio, FixedTime.Time) + 1.0f);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateCharacterMovementParamAfterNetSync() const
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
                this.ClientJob_UpdateCharacterMovementParamAfterNetSync(local_36, local_38, local_44, local_50);
                local_58.opCall(local_44);
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
            this.ClientJob_UpdateCharacterMovementParamAfterNetSync(local_190, local_38, local_44, local_50);
            local_58.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_118);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateMovementParamOnActionStateChanged() const
    {
        int local_66 = 0;
        int local_72 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_32 = this.GetECSWorld().__GetMonitorCharacterMovementActionStateOnActiveView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_48 = local_32.Iterator();
        for (; local_48.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_62 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_63 = FECSEntityScopeCycleCounter(local_62.Entity);
            GetComponent local_70 = FECSMonitorRuntimeViewItem::GetComponent(local_62);
            this.Monitor_UpdateMovementParamOnActionStateChanged(local_66, local_72);
        }
        FECSMonitorRuntimeView local_36 = this.GetECSWorld().__GetMonitorCharacterMovementActionStateOnModifyView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_60 = local_36.Iterator();
        for (; local_60.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_62_2 = local_60.Proceed();
            FECSEntityScopeCycleCounter local_63_2 = FECSEntityScopeCycleCounter(local_62_2.Entity);
            GetComponent local_70_2 = FECSMonitorRuntimeViewItem::GetComponent(local_62_2);
            this.Monitor_UpdateMovementParamOnActionStateChanged(local_66, local_72);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateMovementParamOnActionStateChangedDefer() const
    {
        int local_66 = 0;
        int local_72 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_32 = this.GetECSWorld().__GetMonitorCharacterMovementActionStateOnActiveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_48 = local_32.Iterator();
        for (; local_48.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_62 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_63 = FECSEntityScopeCycleCounter(local_62.Entity);
            GetComponent local_70 = FECSMonitorRuntimeViewItem::GetComponent(local_62);
            this.Monitor_UpdateMovementParamOnActionStateChangedDefer(local_66, local_72);
        }
        FECSMonitorRuntimeView local_36 = this.GetECSWorld().__GetMonitorCharacterMovementActionStateOnModifyView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_60 = local_36.Iterator();
        for (; local_60.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_62_2 = local_60.Proceed();
            FECSEntityScopeCycleCounter local_63_2 = FECSEntityScopeCycleCounter(local_62_2.Entity);
            GetComponent local_70_2 = FECSMonitorRuntimeViewItem::GetComponent(local_62_2);
            this.Monitor_UpdateMovementParamOnActionStateChangedDefer(local_66, local_72);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateMovementParamOnScaleChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorScaleOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateMovementParamOnScaleChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = this.GetECSWorld().__GetMonitorScaleOnModifyView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateMovementParamOnScaleChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickMoveSpeedAttribute() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_184 = 0;
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
                this.Job_TickMoveSpeedAttribute(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_CharacterMovementSpeedModifier> local_56;
                local_56.opCall(local_48);
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
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickMoveSpeedAttribute(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_CharacterMovementSpeedModifier>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

