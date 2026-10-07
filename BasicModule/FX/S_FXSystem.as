

class US_FXSystemAS : UECSScriptSystem
{
    US_FXSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_SpawnInstantFXPeriod(const FECSEntity &inout Entity, const FC_SpawnInstantFXPeriod &inout SpawnInstantFXPeriod, const FCS_FixedTime &inout FixedTime) const
    {
        if ((FMath::FloorToInt((this.GetECSRuntime().Time.ToSeconds() / SpawnInstantFXPeriod.SpawnPeriod))) == FMath::FloorToInt((this.GetECSRuntime().LastTime.ToSeconds() / SpawnInstantFXPeriod.SpawnPeriod)))
        {
            return;
        }
        for (auto& local_24 : SpawnInstantFXPeriod.SpawnFXParams)
        {
            FFXConfig local_140 = local_24.FXConfig;
            Get local_144;
            const FC_Transform& local_146 = local_144.opCall();
            if (local_146)
            {
                if (int(local_24.SpawnPositionMode) == 1)
                {
                    local_140.SetLocationOffset((FVector(local_146.GetPosition()) + local_24.SpawnPositionOffset));
                }
                if (int(local_24.SpawnRotationMode) == 1)
                {
                    local_140.SetRotationOffset((local_146.GetRotation().Rotator() + local_24.SpawnRotationOffset));
                }
            }
            local_140.SetbUseWorldOriginAsBaseTransformSource(true);
            local_140.SetLocationOffsetSpace(EFXOffsetSpace(2));
            local_140.SetRotationOffsetSpace(EFXOffsetSpace(2));
            local_140.SetbDetach(true);
            if (int(local_24.SpecialTransformOffset) == 1)
            {
                FHitResult local_240;
                FLinearColor local_252 = FLinearColor(0.0f, 1.0f, 0.0f, 1.0f);
                FLinearColor local_260 = FLinearColor(1.0f, 0.0f, 0.0f, 1.0f);
                bool local_267 = System::LineTraceSingle(__GetWorldContext(), local_140.GetLocationOffset(), FVector(local_140.GetLocationOffset().X, local_140.GetLocationOffset().Y, (local_140.GetLocationOffset().Z - local_24.MaxDropDownDistance)), ETraceTypeQuery(5), false, TArray<AActor>(), EDrawDebugTrace(0), local_240, true, local_260, local_252, 5.0f);
                if (local_267 && !(local_240.GetbStartPenetrating()))
                {
                    local_140.SetLocationOffset(local_240.Location);
                }
            }
            ECSFX::PlayFXInstant(Entity, local_140, this.GetECSRuntime().Time, 1.0f, false, true);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateAnimCurveLifetime(const FECSEntity &inout Entity, FC_FXAnimCurve &inout FxAnimCurve, const FCS_FixedTime &inout FixedTime) const
    {
        int local_4 = FxAnimCurve.GetCurves().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            const FFXAnimCurveRange& local_8 = FxAnimCurve.GetCurves()[local_4];
            if (FFPTime(FixedTime.Time).opCmp((FFPTime(local_8.GetStartTime()) + local_8.GetDuration())) >= 0)
            {
                Modify local_18;
                if (local_18.opCall())
                {
                }
                FxAnimCurve.GetModify_Curves().RemoveAt(local_4);
            }
        }
        if (FxAnimCurve.GetCurves().Num() == 0)
        {
            Remove local_24;
            local_24.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateAnimCurve(const FECSEntity &inout Entity, const FC_FXAnimCurve &inout FxAnimCurve, const FC_InterpoTime &inout InterpoTime, const FC_Owner &inout OwnerComp) const
    {
        UFXAnimCurveConfig local_40;
        float32 local_9 = float32(((FFPTime(InterpoTime.Time) - InterpoTime.LastTime).ToSeconds()));
        for (auto& local_32 : FxAnimCurve.GetCurves())
        {
            if ((FFPTime(InterpoTime.Time).opCmp(local_32.GetStartTime()) >= 0 && (FFPTime(InterpoTime.Time).opCmp((FFPTime(local_32.GetStartTime()) + local_32.GetDuration())) < 0)))
            {
                if (local_40 != nullptr)
                {
                    FFPTime local_36 = (FFPTime(InterpoTime.Time) - local_32.GetStartTime());
                    TMap<TSoftObjectPtr<UFXAnimCurveConfig>, FFXAnimCurveInterpoState> local_16;
                    local_40.AnimCurve.UpdateFX(Entity, OwnerComp.GetOwnerEntity(), local_36.ToSeconds(), InterpoTime.Time, local_9, local_16.FindOrAdd(TSoftObjectPtr<UFXAnimCurveConfig>(local_40)));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_SyncFXParamChangePointToViewEntity(const FECSEntity &inout Entity, const FC_FXParamChangePoint &inout ChangePoint) const
    {
        Get local_4;
        const FC_ViewEntityManager& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_8 = 0;
            for (; local_8 < local_6.ViewEntityDatas.Num(); ++local_8)
            {
                const FECSViewEntityData& local_12 = local_6.ViewEntityDatas[local_8];
                if (int(local_12.EntityType) == 3)
                {
                    if (FECSEntity(local_12.EntityId).IsValid())
                    {
                        Assign local_22;
                        local_22.opCall(ChangePoint);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateFXParamChange(const FECSEntity &inout Entity, const FC_InterpoTime &inout InterpoTime, const FC_ViewEntityFXData &inout FXData, FC_FXParamChangePoint &inout ChangePoint) const
    {
        bool local_15;
        FFPTime local_4 = (FFPTime(InterpoTime.LastTime) - FXData.StartTime);
        FFPTime local_8;
        Get local_12;
        const FC_ViewEntityFXUpdateTime& local_14 = local_12.opCall();
        if (local_14)
        {
            local_8 = local_14.CurrentTime;
        }
        else
        {
            local_8 = (FFPTime(InterpoTime.Time) - FXData.StartTime);
        }
        FFXOverrideParam local_58;
        for (auto& local_30 : ChangePoint.GetParamChangePoints())
        {
            if (FFPTime(local_30.GetLerpToDuration()).opCmp(0.0) > 0)
            {
                if ((local_8.opCmp(local_30.GetTime()) >= 0 && (local_8.opCmp((FFPTime(local_30.GetLerpToDuration()) + local_30.GetTime())) <= 0)))
                {
                    for (auto& local_48 : local_30.GetOverrideParams())
                    {
                        local_15 = !(ChangePoint.GetParamLerpDatas().Contains(local_48.ParamName));
                        FFXParamValueLerpTime& local_52 = ChangePoint.GetModify_ParamLerpDatas().FindOrAdd(local_48.ParamName);
                        if (FFPTime(local_52.GetEndTime()).opCmp(local_30.GetTime()) <= 0)
                        {
                            local_52.SetStartTime(local_30.GetTime());
                            FFPTime local_6 = (FFPTime(local_30.GetLerpToDuration()) + local_30.GetTime());
                            local_52.SetEndTime(local_6);
                            if (local_15)
                            {
                                local_58 = local_48;
                            }
                            else
                            {
                                local_58 = local_52.GetEndValue();
                            }
                            local_52.SetStartValue(local_58);
                            local_52.SetEndValue(local_48);
                        }
                        if (local_8.opCmp(local_52.GetStartTime()) >= 0 && (local_4.opCmp(local_52.GetEndTime()) < 0))
                        {
                            FFPTime local_6_2 = (local_8 - local_52.GetStartTime());
                            ECSFX::SetFXParameterStruct(Entity, local_48.ParamName, FFXOverrideParam::Lerp(local_52.GetStartValue(), local_52.GetEndValue(), float32(FMath::Clamp((local_6_2 / local_30.GetLerpToDuration()), 0.0, 1.0))).ParamValue);
                        }
                    }
                }
                else
                {
                    if (FFPTime(local_30.GetTime()).opCmp(local_4) > 0 && ((((FFPTime(local_30.GetTime()) + local_30.GetLerpToDuration())).opCmp(local_8) <= 0)))
                    {
                        for (auto& local_48 : local_30.GetOverrideParams())
                        {
                            ECSFX::SetFXParameterStruct(Entity, local_48.ParamName, local_48.ParamValue);
                        }
                    }
                }
                continue;
            }
            if (FFPTime(local_30.GetTime()).opCmp(local_4) > 0 && (FFPTime(local_30.GetTime()).opCmp(local_8) <= 0))
            {
                for (auto& local_48 : local_30.GetOverrideParams())
                {
                    ECSFX::SetFXParameterStruct(Entity, local_48.ParamName, local_48.ParamValue);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleSetNiagaraComponentDitherOverrideParamEvent(const FCE_SetNiagaraComponentDitherOverrideParam &inout Event) const
    {
        int local_6 = 0;
        if (local_6)
        {
            ::FFXUtils::SetNiagaraComponentDitherOverrideParam(Event.Sender, local_6, Event.CurrentTime, Event.LogicNames);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleReinitializeNiagaraComponentEvent(const FCE_ReinitializeNiagaraComponent &inout Event) const
    {
        Get local_4;
        const FC_VisualComponentToggleConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            ::FFXUtils::ReinitializeNiagaraComponent(Event.Sender, local_6, Event.LogicNames);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SpawnInstantFXPeriod() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_166 = 0;
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
                this.Job_SpawnInstantFXPeriod(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_SpawnInstantFXPeriod(local_166, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAnimCurveLifetime() const
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
                this.Job_UpdateAnimCurveLifetime(local_40, local_42, local_6);
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
            this.Job_UpdateAnimCurveLifetime(local_174, local_42, local_6);
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
    void Run_Job_UpdateAnimCurve() const
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
                this.Job_UpdateAnimCurve(local_36, local_38, local_44, local_50);
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
            this.Job_UpdateAnimCurve(local_182, local_38, local_44, local_50);
        }
        local_2.UpdateCachedEntityCount(local_110);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_SyncFXParamChangePointToViewEntity() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorFXParamChangePointOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_SyncFXParamChangePointToViewEntity(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFXParamChange() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_186 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
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
                this.Job_UpdateFXParamChange(local_36, local_38, local_44, local_50);
                local_58.opCall(local_50);
            }
            local_2.UpdateCachedEntityCount(local_13);
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
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_36 = local_148.Proceed();
            ++local_114;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateFXParamChange(local_186, local_38, local_44, local_50);
            local_58.opCall(local_50);
        }
        local_2.UpdateCachedEntityCount(local_114);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleSetNiagaraComponentDitherOverrideParamEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SetNiagaraComponentDitherOverrideParam> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SetNiagaraComponentDitherOverrideParam& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleSetNiagaraComponentDitherOverrideParamEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleReinitializeNiagaraComponentEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ReinitializeNiagaraComponent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ReinitializeNiagaraComponent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleReinitializeNiagaraComponentEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

