
const FConsoleVariable CVar_UseAngelScript = FConsoleVariable();
const FConsoleVariable CVar_DebugDisableCollision = FConsoleVariable();
const FConsoleVariable CVar_SmoothDepenetrateDecay = FConsoleVariable();
const FConsoleVariable CVar_LandPredictDistRatio = FConsoleVariable();
const FConsoleVariable CVar_LandHardSnapDistRatio = FConsoleVariable();
const FConsoleVariable CVar_ExtendCapsuleHeightInAir = FConsoleVariable();
const FConsoleVariable CVar_ConstrainCharacterMoveCacheEnable = FConsoleVariable();
const FConsoleVariable CVar_ConstrainCharacterMoveCacheVerify = FConsoleVariable();

class US_CharacterMovementNewCollisionSystem : UECSScriptSystem
{
    float32 DefaultSlideModifyRatio = 0.0f;
    float32 DefaultNerfSlideAngle = 0.0f;


    UFUNCTION()
    void Init_Implementation()
    {
        US_CharacterMovementCollisionSystem local_6 = Cast<US_CharacterMovementCollisionSystem>(AECSGameManagerActor::GetSystem(ECS::GetUEWorld(), US_CharacterMovementCollisionSystem));
        if (local_6 != nullptr)
        {
            this.DefaultSlideModifyRatio = local_6.DefaultSlideModifyRatio;
            this.DefaultNerfSlideAngle = local_6.DefaultNerfSlideAngle;
        }
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return !(CVar_UseAngelScript.GetBool());
    }
    void CollisionInternal_New(const FECSEntity &inout Entity, FC_Rigidbody &inout Rigidbody, FC_CharacterMovement &inout CharacterMovement, FC_CharacterMovementNew &inout CharacterMovementNew, const FC_CharacterMovementConfig &inout CharacterMovementConfig, const FC_CharacterMovementParam &inout CharacterMovementParam, const FC_CharacterMovementControl &inout CharacterMovementControl, const FC_Collision &inout Collision, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void ValidateFloorInfo(FKMCFloorInfo &inout FloorInfo, const FVector &inout Position, const FCollisionShape &inout Shape, const float32 StepHeight) const
    {
        if ((FVector(Position.X, Position.Y, ((Position.Z - Shape.GetExtent().Z) - StepHeight)) - FloorInfo.GetDetectPosition()).SizeSquared() > 0.01)
        {
            FloorInfo.SetNoFloor();
            FloorInfo.SetbValid(false);
        }
        return;
    }
    void TryExtraFloorDetection(FKMCContext &inout KMCContext, FC_CharacterMovementNew &inout CharacterMovementNew, FC_CharacterMovement &inout CharacterMovement) const
    {
        bool local_4;
        if (CharacterMovementNew.GetExtraFloorDetectRange() <= 0.0f)
        {
            return;
        }
        local_4 = CharacterMovementNew.GetFloorInfo_New().GetbValid();
        bool local_6 = local_4 && CharacterMovementNew.GetFloorInfo_New().GetbHasFloor();
        bool local_5 = local_4 && CharacterMovementNew.GetFloorInfo_New().GetbHitNonStandingSurface();
        bool local_7 = local_4 && CharacterMovementNew.GetFloorInfo_New().GetbEdge();
        if (local_6 || local_5)
        {
            return;
        }
        FCollisionRollbackScope local_10 = FCollisionRollbackScope(KMCContext.Entity);
        FKMCFloorInfo local_76 = ::FKinematicMoveCollisionUtils::FindFloor(KMCContext, KMCContext.State.GetCollisionPosition(), KMCContext.State.GetCollisionRotation(), CharacterMovementNew.GetExtraFloorDetectRange());
        if (!(local_76.GetbHasFloor()) && !(local_76.GetbHitNonStandingSurface()))
        {
            return;
        }
        CharacterMovementNew.SetFloorInfo_New(local_76);
        CharacterMovementNew.GetFloorInfo_New().SetbHasFloor(local_6);
        CharacterMovementNew.GetFloorInfo_New().SetbHitNonStandingSurface(local_5);
        CharacterMovementNew.GetFloorInfo_New().SetbEdge(local_7);
        CharacterMovement.SetFloorInfo(CharacterMovementNew.GetFloorInfo_New().ToFloorInfo(KMCContext.GetActualShape()));
        return;
    }
    UFUNCTION()
    void Job_CollisionInternal_CommonPass_NewCollision(const FECSEntity &inout Entity, FC_Rigidbody &inout Rigidbody, FC_CharacterMovement &inout Movement, FC_CharacterMovementNew &inout MovementNew, const FC_CharacterMovementConfig &inout Config, const FC_CharacterMovementParam &inout Param, const FC_CharacterMovementControl &inout Control, const FC_Collision &inout Collision, const FCS_FixedTime &inout FixedTime) const
    {
        this.CollisionInternal_New(Entity, Rigidbody, Movement, MovementNew, Config, Param, Control, Collision, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_ValidateFloorInfo(const FECSEntity &inout Entity, FC_CharacterMovementNew &inout MovementNew, FC_CharacterMovement &inout Movement, const FC_Collision &inout Collision, const FCS_FixedTime &inout FixedTime) const
    {
        if (!(MovementNew.GetFloorInfo_New().GetbValid()) || (MovementNew.GetFloorInfo_New().GetLastValidateFrame() >= int(FixedTime.Frame)))
        {
            return;
        }
        FCollisionShape local_12 = Collision.GetScaledShape();
        this.ValidateFloorInfo(MovementNew.GetFloorInfo_New(), Movement.GetPosition(), local_12, 0.0f);
        if (!(MovementNew.GetFloorInfo_New().GetbValid()))
        {
            Movement.SetFloorInfo(MovementNew.GetFloorInfo_New().ToFloorInfo(local_12));
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CollisionInternal_CommonPass_NewCollision() const
    {
        int local_6 = 0;
        int local_172 = 0;
        int local_174 = 0;
        int local_180 = 0;
        int local_186 = 0;
        int local_192 = 0;
        int local_198 = 0;
        int local_204 = 0;
        int local_210 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        FECSRuntimeView::Include<FC_CharacterMovement>(local_48).opCall();
        Include local_60;
        local_60.opCall();
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        Include local_72;
        local_72.opCall();
        Include local_76;
        local_76.opCall();
        Include local_80;
        local_80.opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_130 = local_48.Iterator();
        for (; local_130.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_169 = FECSEntityScopeCycleCounter(local_130.Proceed());
            this.Job_CollisionInternal_CommonPass_NewCollision(local_172, local_174, local_180, local_186, local_192, local_198, local_204, local_210, local_6);
            MarkModifiedIfDirty local_218;
            local_218.opCall(local_174);
            MarkModifiedIfDirty local_222;
            local_222.opCall(local_180);
            MarkModifiedIfDirty local_226;
            local_226.opCall(local_186);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ValidateFloorInfo() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        MarkModifiedIfDirty local_66;
        int local_202 = 0;
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
                this.Job_ValidateFloorInfo(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_42);
                local_66.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
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
        Exclude(local_104).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_130 = 0;
        FECSRuntimeViewIterator local_164 = local_104.Iterator();
        for (; local_164.CanProceed;)
        {
            local_40 = local_164.Proceed();
            ++local_130;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ValidateFloorInfo(local_202, local_42, local_48, local_54, local_6);
            local_62.opCall(local_42);
            local_66.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_130);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

