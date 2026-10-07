

class US_AIMovementOptimizeSystem : UECSScriptSystem
{
    UPROPERTY()
    float AIMovementOptimizeDistanceSQ = 25000000.0;
    float32 VisualCastGroundOffsetDistance = 1000.0f;
    float32 VisualTransformBlendDuration = 2.5f;


    bool FindGround(const FECSEntity &inout Entity, const FC_Collision &inout Collision, const FVector &inout EntityPosition, FHitResult &inout HitResult) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    void MarkColtrollerImportant(const FECSEntity &inout Entity, const bool bImportant) const
    {
        Get local_4;
        const FC_ControlledByAI& local_6 = local_4.opCall();
        if (local_6)
        {
            if (FECSEntity(local_6.GetControllerEntity()).IsValid())
            {
                if (bImportant)
                {
                    Assign local_16;
                    local_16.opCall(FC_AIControllerImportantTag());
                }
                else
                {
                    Remove local_22;
                    local_22.opCall();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_MarkSampleMovementOptimize(const TArray<FVector> &inout TestPositions, const FECSEntity &inout Entity, const FC_Transform &inout Transform) const
    {
        bool local_1 = true;
        Has local_6;
        bool local_2 = local_6.opCall() || ::FASCommonUtils::IsBossPrefab(Entity);
        if (local_2)
        {
            local_2 = true;
        }
        else
        {
            Has local_12;
            local_2 = local_12.opCall();
        }
        if (local_2)
        {
            local_1 = false;
        }
        if (local_1)
        {
            for (auto& local_26 : TestPositions)
            {
                if (Transform.GetPosition().DistSquared2D(local_26) <= this.AIMovementOptimizeDistanceSQ)
                {
                    local_1 = false;
                    break;
                }
            }
        }
        if (local_1)
        {
            ModifyOrAdd local_34;
            local_34.opCall();
            FC_AISimpleMovementNeedEnableTag local_40;
            Assign local_38;
            local_38.opCall(local_40);
            if (!(local_6.opCall()))
            {
                this.MarkColtrollerImportant(Entity, false);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateNeedSnapToGround(const FECSEntity &inout Entity, FC_AISimpleMovement &inout AISimpleMovement, const FC_CharacterMovementControl &inout MovementControl) const
    {
        bool local_14;
        if (MovementControl.GetbFlyingMovement())
        {
            local_14 = true;
        }
        else
        {
            FNameHandle_EntityBBVar local_6;
            local_6;
            bool local_7 = Entity.HasEntityBB(local_6);
            if (!(local_7))
            {
                local_7 = false;
            }
            else
            {
                FNameHandle_EntityBBVarBool local_12;
                local_12;
                local_7 = Entity.GetBB_Bool(local_12);
            }
            local_14 = local_7;
        }
        AISimpleMovement.SetbInAir(local_14);
        return;
    }
    UFUNCTION()
    void Job_CleanUpSimpleMovementTag(const FECSEntity &inout Entity, const FC_AISimpleMovement &inout AISimpleMovement, const FC_Collision &inout Collision, const FC_Transform &inout Transform) const
    {
        if (!(AISimpleMovement.GetbInAir()))
        {
            FHitResult local_68;
            if (this.FindGround(Entity, Collision, Transform.GetPosition(), local_68))
            {
                FVector local_88 = Transform.GetPosition().NewZ(((local_68.ImpactPoint.Z + Collision.GetScaledHalfHeight()) + 0.05));
                Entity.MoveTo(local_88, FFPTime(-1));
            }
        }
        Remove local_96;
        local_96.opCall();
        this.MarkColtrollerImportant(Entity, true);
        return;
    }
    UFUNCTION()
    void Job_GetPlayerPawnPositions(TArray<FVector> &inout OutPositions, const FC_Transform &inout Transform) const
    {
        OutPositions.Add(Transform.GetPosition());
        return;
    }
    UFUNCTION()
    void ServerJob_TickAISampleMovementOptimize() const
    {
        TArray<FVector> local_4;
        this.Run_Job_GetPlayerPawnPositions(local_4);
        this.Run_Job_MarkSampleMovementOptimize(local_4);
        this.Run_Job_UpdateNeedSnapToGround();
        this.Run_Job_CleanUpSimpleMovementTag();
        FECSWorldPtr local_6 = this.GetECSWorld();
        FECSWorldPtr::Clear(local_6).opCall(EECSRegType(0));
        return;
    }
    UFUNCTION()
    void Monitor_EnterCombat(const FECSEntity &inout Entity, const FC_AICombatTag &inout Tag) const
    {
        this.MarkColtrollerImportant(Entity, true);
        return;
    }
    UFUNCTION()
    void Monitor_AISimpleMovementAssign(const FECSEntity &inout Entity, const FC_AISimpleMovement &inout SimpleMovement) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            int local_25 = 1065353216;
            FC_VisualTransformOffset local_24;
            Assign local_10;
            local_10.opCall(local_24).BlendWeight = local_25;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_ProjectOptimizeEntityOnGround(const FECSEntity &inout Entity, FC_VisualTransformOffset &inout VisualTransform, const FC_Collision &inout Collision, const FC_InterpoTransform &inout InterpoTransform, const FCS_LocalTime &inout LocalTime) const
    {
        if (FFPTime(LocalTime.DeltaTime).opCmp(0.0) <= 0)
        {
            return;
        }
        float32 local_8 = float32((LocalTime.DeltaTime.ToSeconds() / this.VisualTransformBlendDuration));
        Get local_14;
        const FC_AISimpleMovement& local_16 = local_14.opCall();
        if (local_16)
        {
            float32 local_17;
            float32 local_7 = VisualTransform.BlendWeight + local_8;
            local_17 = 0.0f;
            if (!(local_16.GetbInAir()))
            {
                FHitResult local_84;
                if (this.FindGround(Entity, Collision, InterpoTransform.GetPosition(), local_84))
                {
                    float local_4_2 = local_84.ImpactPoint.Z + Collision.GetScaledHalfHeight();
                    local_17 = FMath::Clamp(float32((local_4_2 - InterpoTransform.GetPosition().Z)), -100.0f, 100.0f);
                }
            }
            VisualTransform.PositionOffset.Z = FMath::Lerp(VisualTransform.PositionOffset.Z, local_17, 0.75f);
        }
        else
        {
            float32 local_7_2 = VisualTransform.BlendWeight - local_8;
            if (VisualTransform.BlendWeight <= 0.0f)
            {
                Remove local_94;
                local_94.opCall();
                return;
            }
        }
        float32 local_7_3 = float32((FMath::Clamp(VisualTransform.BlendWeight, 0.0, 1.0)));
        VisualTransform.PositionOffset.Y = 0.0f;
        VisualTransform.PositionOffset.X = VisualTransform.PositionOffset.Y;
        return;
    }
    UFUNCTION()
    void Run_Job_MarkSampleMovementOptimize(const TArray<FVector> &inout Arg0) const
    {
        int local_144 = 0;
        int local_146 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_AIMovementOptimizeSystem::Job_MarkSampleMovementOptimize"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_102 = local_48.Iterator();
        for (; local_102.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_141 = FECSEntityScopeCycleCounter(local_102.Proceed());
            this.Job_MarkSampleMovementOptimize(Arg0, local_144, local_146);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateNeedSnapToGround() const
    {
        int local_148 = 0;
        int local_150 = 0;
        int local_156 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_AIMovementOptimizeSystem::Job_UpdateNeedSnapToGround"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Include local_60;
        local_60.opCall();
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_106 = local_48.Iterator();
        for (; local_106.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_145 = FECSEntityScopeCycleCounter(local_106.Proceed());
            this.Job_UpdateNeedSnapToGround(local_148, local_150, local_156);
            MarkModifiedIfDirty local_164;
            local_164.opCall(local_150);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanUpSimpleMovementTag() const
    {
        int local_144 = 0;
        int local_146 = 0;
        int local_152 = 0;
        int local_158 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_AIMovementOptimizeSystem::Job_CleanUpSimpleMovementTag"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Include local_60;
        local_60.opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_102 = local_48.Iterator();
        for (; local_102.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_141 = FECSEntityScopeCycleCounter(local_102.Proceed());
            this.Job_CleanUpSimpleMovementTag(local_144, local_146, local_152, local_158);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_GetPlayerPawnPositions(TArray<FVector> &inout Arg0) const
    {
        int local_136 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_AIMovementOptimizeSystem::Job_GetPlayerPawnPositions"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_94 = local_48.Iterator();
        for (; local_94.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_133 = FECSEntityScopeCycleCounter(local_94.Proceed());
            this.Job_GetPlayerPawnPositions(Arg0, local_136);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickAISampleMovementOptimize() const
    {
        ECS::GetContextJob();
        this.ServerJob_TickAISampleMovementOptimize();
        return;
    }
    UFUNCTION()
    void Run_Monitor_EnterCombat() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAICombatTagOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_EnterCombat(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_AISimpleMovementAssign() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorAISimpleMovementOnAssignView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AISimpleMovementAssign(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ProjectOptimizeEntityOnGround() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_200 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
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
                this.ClientJob_ProjectOptimizeEntityOnGround(local_46, local_48, local_54, local_60, local_12);
                local_68.opCall(local_48);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Exclude(local_106).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_106.Iterator();
        for (; local_162.CanProceed;)
        {
            local_46 = local_162.Proceed();
            ++local_128;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_ProjectOptimizeEntityOnGround(local_200, local_48, local_54, local_60, local_12);
            local_68.opCall(local_48);
        }
        local_2.UpdateCachedEntityCount(local_128);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
}

