
const FConsoleVariable CVar_HitTest_HitFrameDebug = FConsoleVariable();
const FName DebugDrawKey_ArealStrike = n"ArealStrike";
const FName DebugDrawKey_ArealStrikeHit = n"ArealStrikeHit";
const FConsoleCommand CVar_Debug_DrawArealStrike = FConsoleCommand();

struct FHitTestEvaluateResult
{
    UPROPERTY()
    FVector HitResultLocation;
    UPROPERTY()
    FVector HitPoint;
    UPROPERTY()
    float32 Scroe = 0.0f;
    UPROPERTY()
    int HitBoxDataIndex = -1;
    UPROPERTY()
    FHitTestCheckResult HitTestCheckResult;
    UPROPERTY()
    UCharacterBodyPartDataAsset BodyPartData = nullptr;


}

class US_HitTestSystemAS : UECSScriptSystem
{
    US_HitTestSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    FCE_HitEvent& MakeHitEventByStrike(const FECSEntity &inout Sender, const FECSEntity &inout HitEntity, const FFPTime &inout Time, const FTransform &inout HitTestTramsform, const FVector &inout HitPoint, const FAttackData &inout AttackData, const FName &inout StrikeKey, const FStrikeEventData &inout StrikeData, const FDataObjectPtr &inout HitDecalConfig, const FHitBoxData &inout HitBoxData, const bool bHitWeakness, const bool bPredicatable, const bool bClientWaitForServerOnHit, const bool bNeedHitMeshPresentation, const bool bAttackHitFXSpawnToStrikeCenterLine) const
    {
        FECSEntity local_4 = Sender;
        if (FECSEntity::Has<FC_ControlledByPlayer>(HitEntity).opCall() && !(FECSEntity::Has<FC_ControlledByPlayer>(Sender).opCall()))
        {
            local_4 = HitEntity;
        }
        FHitEventParam local_132;
        local_132.bPredictable = (!(this.GetECSRuntime().IsServer) || bPredicatable);
        local_132.bClientWaitForServerOnHit = bClientWaitForServerOnHit;
        local_132.bNeedHitMeshPresentation = bNeedHitMeshPresentation;
        local_132.bAttackHitFXSpawnToStrikeCenterLine = bAttackHitFXSpawnToStrikeCenterLine;
        local_132.HitPosition = HitPoint;
        local_132.bHitWeakness = bHitWeakness;
        local_132.HitShakeBodyType = HitBoxData.BoneShakeBodyType;
        local_132.HitBoneName = HitBoxData.AttachInfo.AttachToName;
        local_132.HitBodyPart = HitBoxData.BodyPartKey;
        local_132.OverrideAnimSocket = HitBoxData.OverrideAnimSocket;
        local_132.PhysicalMaterial = HitBoxData.HitMaterial;
        local_132.StrikeData = StrikeData;
        local_132.CustomStrikeTransform = HitTestTramsform;
        local_132.HitDecalConfig = HitDecalConfig;
        local_132.StrikeKey = StrikeKey;
        TDataObjectPtr<FAttackData> local_158;
        local_132.AttackData = local_158;
        return (::FCombatUtils::MakeHitEvent(local_4, Sender, HitEntity, Time, local_132));
    }
    bool CheckEntityControlledByPlayer(const FECSEntity &inout ControlledEntity, const FECSEntity &inout PlayerEntity) const
    {
        Get local_4;
        const FC_ControlledByPlayer& local_6 = local_4.opCall();
        if (local_6)
        {
            return (FECSEntity(local_6.GetPlayerEntity()) == PlayerEntity);
        }
        return false;
    }
    FVector GetImpactDir(const FECSEntity &inout Attacker, const FCE_ArealStrikeRequestEvent &inout Event, const FHitTestResult &inout Result, const FAttackData &inout AttackData) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FVector __r; return __r;
    }
    void TryPausePIEOnHit(const bool bPausePIEOnHit) const
    {
        return;
    }
    void RecordMeleeStrikeHitDebug(const FCE_ArealStrikeRequestEvent &inout Event, const FCS_FixedTime &inout FixedTime, const FFPTime &inout Time, const bool bPerEntityQuest, const TArray<FECSEntityId> &inout HitEntityIds) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    bool HandleArealStrike(const FCE_ArealStrikeRequestEvent &inout Event, const FCS_FixedTime &inout FixedTime, const bool bPerEntityQuest, const FECSEntity &inout ForSpecificReceiverEntity, const FFPTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    UFUNCTION()
    void Job_RemoveEnvSurfaceImpactFXRecord(const FCE_EnvSurfaceImpactFXRecordToRemove &inout RecordToRemove) const
    {
        Modify local_4;
        FC_EnvSurfaceImpactFXRecord& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.AttackIdentifierSet = local_6.AttackIdentifierSet.Difference(RecordToRemove.AttackIdentifierSet);
        }
        return;
    }
    UFUNCTION()
    void Job_CalcArealStrikeHitTestBaseDamage(FCE_ArealStrikeRequestEvent &inout Event) const
    {
        bool local_7;
        int local_34 = 0;
        if (!(Event.Sender.IsValid()))
        {
            local_7 = true;
        }
        else
        {
            Has local_6;
            local_7 = this.GetECSRuntime().IsClient && !(local_6.opCall());
        }
        if (local_7)
        {
            return;
        }
        if (!(Event.AttackInfo.AttackData))
        {
            return;
        }
        TDataObjectPtr<FAttackData> local_32 = TDataObjectPtr<FAttackData>(Event.AttackInfo.AttackData);
        Event.Damage = ::FDamageUtils::CalcAttackBaseDamageValue(Event.Sender, local_34, Event.Time, false, FCapabilityInstanceId());
        Event.DamageToAvatar = ::FDamageUtils::CalcAttackBaseDamageValue(Event.Sender, local_34, Event.Time, true, FCapabilityInstanceId());
        return;
    }
    UFUNCTION()
    void Job_ArealStrikeHitTest(const FCE_ArealStrikeRequestEvent &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        this.HandleArealStrike(Event, FixedTime, false, ENTITY_NULL, Event.Time);
        return;
    }
    FFPTime CalculateOffsetTime(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        GetDefaulted local_4;
        return local_4.opCall().GetOffsetTime((int(FixedTime.Frame) - 1));
    }
    void CalcFilterTime(const FECSEntity &inout Entity, FC_ArealStrikeTimeFilter &inout TimeFilter, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_4 = this.CalculateOffsetTime(Entity, FixedTime);
        if (FFPTime(TimeFilter.GetCurFilterTime()).opCmp(0.0) > 0)
        {
            if (FFPTime(TimeFilter.GetLastFilterTime()).opCmp(TimeFilter.GetCurFilterTime()) < 0)
            {
                TimeFilter.SetLastFilterTime(TimeFilter.GetCurFilterTime());
            }
        }
        else
        {
            TimeFilter.SetLastFilterTime((FFPTime(FixedTime.LastTime) - local_4));
        }
        TimeFilter.SetCurFilterTime(((FFPTime(FixedTime.Time) - local_4) - FECSWorld::FixedFrameInterval));
        return;
    }
    void GetFilterTime(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FFPTime &inout OutLastFilterTime, FFPTime &inout OutCurFilterTime) const
    {
        Has local_4;
        int local_24 = 0;
        if (!(local_4.opCall()))
        {
            FC_ArealStrikeTimeFilter local_18;
            Assign local_10;
            this.CalcFilterTime(Entity, local_10.opCall(local_18), FixedTime);
        }
        OutLastFilterTime = local_24.GetLastFilterTime();
        OutCurFilterTime = local_24.GetCurFilterTime();
        return;
    }
    UFUNCTION()
    void Job_ArealStrikeTimeFilterUpdate(const FECSEntity &inout Entity, FC_ArealStrikeTimeFilter &inout TimeFilter, const FCS_FixedTime &inout FixedTime) const
    {
        this.CalcFilterTime(Entity, TimeFilter, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_ArealStrikeHitTestForPlayer(const FCE_PerReceiverArealStrikeRequest &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        Has local_6;
        if (!(Event.Sender.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        FFPTime local_10 = FFPTime();
        FFPTime local_10_2 = -1;
        FFPTime local_14 = FFPTime();
        FFPTime local_14_2 = -1;
        this.GetFilterTime(Event.Sender, FixedTime, local_10_2, local_14_2);
        bool local_15 = false;
        if (int(Event.CreatedFrame) == int(FixedTime.Frame) || (int(Event.CreatedFrame) == (int(FixedTime.Frame) - 1) && Event.IsCreatedAfterCurrentJob()))
        {
            FFPTime local_20 = FFPTime(Event.Time);
            if (local_20.opCmp(local_10_2) >= 0 && ((FFPTime(Event.Time).opCmp(local_14_2) <= 0)))
            {
                local_15 = true;
            }
        }
        else
        {
            FFPTime local_20_2 = FFPTime(Event.Time);
            if (local_20_2.opCmp(local_10_2) > 0 && ((FFPTime(Event.Time).opCmp(local_14_2) <= 0)))
            {
                local_15 = true;
            }
        }
        if (local_15)
        {
            FECSWorldPtr local_22 = this.GetECSWorld();
            GetEvent local_26 = FECSWorldPtr::GetEvent(local_22);
            this.HandleArealStrike(local_26.opCall(int(Event.ArealStrikeRequestEventId)), FixedTime, true, Event.Sender, FixedTime.LastTime);
            if (this.GetECSRuntime().IsServer)
            {
                FECSWorldPtr local_22_2 = this.GetECSWorld();
                ModifyOrAdd local_30;
                local_30.opCall().EventIds.Add(Event.EventId);
            }
        }
        Modify local_34;
        FC_ArealStrikeTimeFilter& local_36 = local_34.opCall();
        if (local_36)
        {
            local_36.SetLastEventCheckJobTime(FixedTime.Time);
        }
        return;
    }
    UFUNCTION()
    void Job_ArealStrikeTimeFilterFlush(const FECSEntity &inout Entity, FC_ArealStrikeTimeFilter &inout FilterTime, const FCS_FixedTime &inout FixedTime) const
    {
        if (FFPTime(FilterTime.GetLastEventCheckJobTime()).opCmp((FFPTime(FixedTime.Time) - FFPTime(1))) < 0)
        {
            Remove local_16;
            local_16.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_ClearPerReceiverArealStrikeRequest(const FCS_PerReceiverArealStrikeRequestClear &inout ClearRequest) const
    {
        auto local_6 = ClearRequest.EventIds.Iterator();
        for (; local_6.CanProceed;)
        {
            this.GetECSWorld().RemoveEvent(FCE_PerReceiverArealStrikeRequest, local_6.Proceed());
        }
        FECSWorldPtr local_18 = this.GetECSWorld();
        Remove local_24;
        local_24.opCall();
        return;
    }
    UFUNCTION()
    void Job_AssignProjectileMeleeStrike(FCE_ArealStrikeRequestEvent &inout Event) const
    {
        int local_8 = 0;
        int local_14 = 0;
        if ((FECSEntityId(Event.CollisionEntityId) == ENTITY_ID_NULL))
        {
            return;
        }
        if (!(FECSEntity(Event.CollisionEntityId)))
        {
            return;
        }
        if ((!(local_8) || !(local_14)))
        {
            return;
        }
        Event.TransformPos = local_14.GetPosition();
        Event.TransformRot = FQuat4f(local_14.GetRotation());
        GetDefaulted local_28;
        float32 local_29 = local_28.opCall().GetUniformScale();
        Event.SweepFromOffset = FVector3f(local_8.GetDeltaMovement().opNeg());
        Event.SweepFromRotation = FQuat4f(local_14.GetRotation());
        Event.StrikeEventData.StrikeDirection = local_8.GetDeltaMovement().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        return;
    }
    UFUNCTION()
    void Job_DelayArealStrike(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_DelayArealStrike &inout DelayArealStrike, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_5;
        Remove local_30;
        FECSEntity local_4 = Entity;
        Has local_10;
        while (local_4)
        {
            if (!(local_10.opCall()))
            {
                local_5 = false;
            }
            else
            {
                Has local_14;
                local_5 = local_14.opCall();
            }
            if (local_5)
            {
                break;
            }
            Get local_20;
            const FC_Owner& local_22 = local_20.opCall();
            if (local_22)
            {
                local_4 = local_22.GetOwnerEntity();
            }
        }
        if (!(local_4.IsValid()))
        {
            local_30.opCall();
            return;
        }
        FFPTime local_32 = FFPTime(FixedTime.Time);
        if (DelayArealStrike.DelayTime.opCmp(0.0) > 0)
        {
            local_32 += DelayArealStrike.DelayTime;
        }
        SendEvent local_42;
        FCE_ArealStrikeRequestEvent& local_44 = local_42.opCall(local_32);
        if (local_44)
        {
            local_44.TransformPos = (FVector(Transform.GetPosition()) + Transform.GetRotation().RotateVector(DelayArealStrike.PostionOffset));
            local_44.TransformRot = FQuat4f(Transform.GetRotation());
            local_44.SweepFromOffset = FVector3f::ZeroVector;
            local_44.Shape = DelayArealStrike.HitTestShape;
            local_44.AttackInfo.AttackData = DelayArealStrike.AttackData;
            local_44.StrikeEventData.StrikeShape = DelayArealStrike.StrikeShape;
            local_44.StrikeEventData.StrikeDirection = Transform.GetRotation().RotateVector(FVector(DelayArealStrike.StrikeDirection));
        }
        local_30.opCall();
        return;
    }
    UFUNCTION()
    void Job_ClearHitTestProtectRecord(const FECSEntity &inout Entity, FC_HitTestProtectRecord &inout HitTestProtectRecord, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_26;
        TArray<FName> local_4;
        for (auto& local_24 : HitTestProtectRecord.GetDodgeProtect())
        {
            if (local_26.opCmp(FixedTime.Time) < 0)
            {
                local_4.Add(local_24.GetKey());
            }
        }
        for (auto& local_42 : local_4)
        {
            local_42;
        }
        local_4.Reset(0);
        for (auto& local_24_2 : HitTestProtectRecord.GetMultiStrikeProtect())
        {
            if (local_26.opCmp(FixedTime.Time) < 0)
            {
                local_4.Add(local_24_2.GetKey());
            }
        }
        for (auto& local_42 : local_4)
        {
            local_42;
        }
        local_4.Reset(0);
        for (auto& local_24_3 : HitTestProtectRecord.GetForceHitInvincible())
        {
            if (local_26.opCmp(FixedTime.Time) < 0)
            {
                local_4.Add(local_24_3.GetKey());
            }
        }
        for (auto& local_42 : local_4)
        {
            local_42;
        }
        if (HitTestProtectRecord.GetDodgeProtect().IsEmpty() && HitTestProtectRecord.GetMultiStrikeProtect().IsEmpty() && HitTestProtectRecord.GetForceHitInvincible().IsEmpty())
        {
            Remove local_48;
            local_48.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RemoveEnvSurfaceImpactFXRecord() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EnvSurfaceImpactFXRecordToRemove> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EnvSurfaceImpactFXRecordToRemove& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_RemoveEnvSurfaceImpactFXRecord(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CalcArealStrikeHitTestBaseDamage() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_ArealStrikeRequestEvent> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_ArealStrikeRequestEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_CalcArealStrikeHitTestBaseDamage(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ArealStrikeHitTest() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ArealStrikeRequestEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_ArealStrikeRequestEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_ArealStrikeHitTest(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ArealStrikeTimeFilterUpdate() const
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
                this.Job_ArealStrikeTimeFilterUpdate(local_40, local_42, local_6);
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
            this.Job_ArealStrikeTimeFilterUpdate(local_174, local_42, local_6);
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
    void Run_Job_ArealStrikeHitTestForPlayer() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventIterator<FCE_PerReceiverArealStrikeRequest> local_40 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(3)).Iterator();
        for (; local_40.CanProceed;)
        {
            FCE_PerReceiverArealStrikeRequest& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            local_64.NoTimeFilterOverrideKeepHistoryDuration = FFPTime(1);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_ArealStrikeHitTestForPlayer(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ArealStrikeTimeFilterFlush() const
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
                this.Job_ArealStrikeTimeFilterFlush(local_40, local_42, local_6);
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
            this.Job_ArealStrikeTimeFilterFlush(local_174, local_42, local_6);
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
    void Run_Job_ClearPerReceiverArealStrikeRequest() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Job_ClearPerReceiverArealStrikeRequest(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_AssignProjectileMeleeStrike() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_ArealStrikeRequestEvent> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_ArealStrikeRequestEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_AssignProjectileMeleeStrike(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DelayArealStrike() const
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
                this.Job_DelayArealStrike(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_DelayArealStrike> local_56;
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
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_94.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_DelayArealStrike(local_180, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_DelayArealStrike>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearHitTestProtectRecord() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(5.0))))
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
                this.Job_ClearHitTestProtectRecord(local_44, local_46, local_12);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_92.Iterator();
        for (; local_140.CanProceed;)
        {
            local_44 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.Job_ClearHitTestProtectRecord(local_178, local_46, local_12);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
}

void CMD_EnableDebugDrawArealStrike(const TArray<FString> &inout Arguments)
{
    if (Arguments.Num() == 0 || (FString(Arguments[0]) == "1") || (Arguments[0].ToLower() == "true"))
    {
        FECSDebugDraw::SetDebugKeyEnable(DebugDrawKey_ArealStrike, true);
        return;
    }
    FECSDebugDraw::SetDebugKeyEnable(DebugDrawKey_ArealStrike, false);
    return;
}
