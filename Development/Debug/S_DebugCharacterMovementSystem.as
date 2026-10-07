
const FConsoleVariable CVar_Charactermovenet_Debug = FConsoleVariable();
const FConsoleVariable CVar_Charactermovenet_DebugCache = FConsoleVariable();
const FConsoleVariable CVar_Charactermovenet_DebugTraceTime = FConsoleVariable();
const FConsoleVariable CVar_Charactermovenet_DebugEntity = FConsoleVariable();

struct FDebugMovementStatLine
{
    UPROPERTY()
    FString m_Info;
    UPROPERTY()
    FLinearColor m_Color;

    FDebugMovementStatLine()
    {
        return;
    }
    FString GetInfo() const property
    {
        return this;
    }
    void SetInfo(const FString &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const FLinearColor GetColor() const property
    {
        const FLinearColor __r;
        return __r;
    }
    FLinearColor GetColor() property
    {
        FLinearColor __r;
        return __r;
    }
    void SetColor(const FLinearColor &inout __Value) property
    {
        this.m_Color = __Value;
        return;
    }
}

struct FDebugMovementCollisionInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bValid;
    UPROPERTY()
    FVector m_CollisionPosition;
    UPROPERTY()
    FQuat m_CollisionRotation;
    UPROPERTY()
    float32 m_CapsuleHalfHeight;
    UPROPERTY()
    float32 m_CapsuleRadius;
    UPROPERTY()
    FColor m_FloorColor;
    UPROPERTY()
    FVector m_FloorPosition;

    FDebugMovementCollisionInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDebugMovementCollisionInfo(const FDebugMovementCollisionInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDebugMovementCollisionInfo opAssign(const FDebugMovementCollisionInfo &inout Other)
    {
        FDebugMovementCollisionInfo __r;
        this.SetbValid(Other.GetbValid());
        this.SetCollisionPosition(Other.GetCollisionPosition());
        this.SetCollisionRotation(Other.GetCollisionRotation());
        this.SetCapsuleHalfHeight(Other.GetCapsuleHalfHeight());
        this.SetCapsuleRadius(Other.GetCapsuleRadius());
        this.SetFloorColor(Other.GetFloorColor());
        this.SetFloorPosition(Other.GetFloorPosition());
        return __r;
    }
    bool GetbValid() const property
    {
        return this.m_bValid;
    }
    void SetbValid(const bool __Value) property
    {
        if (!(this.m_bValid) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bValid = __Value;
        return;
    }
    FVector GetCollisionPosition() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_CollisionPosition() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetCollisionPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CollisionPosition = __Value;
        return;
    }
    FQuat GetCollisionRotation() const property
    {
        FQuat __r;
        return __r;
    }
    FQuat GetModify_CollisionRotation() property
    {
        FQuat __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetCollisionRotation(const FQuat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_CollisionRotation = __Value;
        return;
    }
    float32 GetCapsuleHalfHeight() const property
    {
        return this.m_CapsuleHalfHeight;
    }
    void SetCapsuleHalfHeight(const float32 __Value) property
    {
        if (this.m_CapsuleHalfHeight == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_CapsuleHalfHeight = __Value;
        return;
    }
    float32 GetCapsuleRadius() const property
    {
        return this.m_CapsuleRadius;
    }
    void SetCapsuleRadius(const float32 __Value) property
    {
        if (this.m_CapsuleRadius == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_CapsuleRadius = __Value;
        return;
    }
    const FColor GetFloorColor() const property
    {
        const FColor __r;
        return __r;
    }
    FColor GetModify_FloorColor() property
    {
        FColor __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetFloorColor(const FColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_FloorColor = __Value;
        return;
    }
    const FVector GetFloorPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_FloorPosition() property
    {
        FVector __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetFloorPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_FloorPosition = __Value;
        return;
    }
}

struct FDebugMovementStatInfo
{
    UPROPERTY()
    TFixedArray<float32, auto> SpeedBuff;
    UPROPERTY()
    TFixedArray<float32, auto> SpeedHorizontalBuff;
    UPROPERTY()
    TFixedArray<float32, auto> SpeedVerticalBuff;
    UPROPERTY()
    FVector LastPosition;
    UPROPERTY()
    float32 LastTime;
    UPROPERTY()
    float32 CurSpeed;
    UPROPERTY()
    float32 MinSpeed;
    UPROPERTY()
    float32 MaxSpeed;
    UPROPERTY()
    float32 CurSpeedHorizontal;
    UPROPERTY()
    float32 MinSpeedHorizontal;
    UPROPERTY()
    float32 MaxSpeedHorizontal;
    UPROPERTY()
    float32 CurSpeedVertical;
    UPROPERTY()
    float32 MinSpeedVertical;
    UPROPERTY()
    float32 MaxSpeedVertical;
    UPROPERTY()
    TArray<FDebugMovementStatLine> PrintLines;
    UPROPERTY()
    FDebugMovementCollisionInfo ShapeInfo;


}

class US_DebugEntityMovementSystem : UECSScriptSystem
{
    UPROPERTY()
    FInstancedStruct StatInfoData = FInstancedStruct(FDebugMovementStatInfo);

    US_DebugEntityMovementSystem()
    {
        return;
    }
    UFUNCTION()
    void Init_Implementation()
    {
        FECSDebugDraw::SetDebugKeyEnable(n"CharacterMovementDebug", CVar_Charactermovenet_Debug.GetBool());
        FECSDebugDraw::SetDebugKeyUnfiltered(n"CharacterMovementDebug", CVar_Charactermovenet_Debug.GetBool());
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return !(CVar_Charactermovenet_Debug.GetBool());
    }
    FDebugMovementStatInfo GetStatInfo() const
    {
        FDebugMovementStatInfo __r;
        TRawPtr<FDebugMovementStatInfo> local_6 = FInstancedStruct::GetMutablePtr_Const(this.StatInfoData).opCall();
        return __r;
    }
    FECSEntity GetDebugEntity() const
    {
        FECSEntity local_10 = FECSEntity(CVar_Charactermovenet_DebugEntity.GetInt());
        if ((local_10 == ENTITY_NULL))
        {
            FECSWorldPtr local_14 = this.GetECSWorld();
            GetDefaulted local_18;
            local_10 = local_18.opCall().GetPlayerPawnEntity();
        }
        Get local_22;
        const FC_PawnRiddingMount& local_24 = local_22.opCall();
        if (local_24)
        {
            local_10 = local_24.GetMountEntity();
        }
        return local_10;
    }
    void PrepareStatInfo() const
    {
        FDebugMovementStatInfo& local_2 = this.GetStatInfo();
        local_2.PrintLines.Empty(0);
        local_2.ShapeInfo.SetbValid(false);
        return;
    }
    void PrintInfo(const FString &inout Str, const FLinearColor &inout Color = FLinearColor::LucBlue) const
    {
        FDebugMovementStatInfo& local_2 = this.GetStatInfo();
        FDebugMovementStatLine local_10;
        local_10.SetInfo(Str);
        local_10.SetColor(Color);
        local_2.PrintLines.Add(local_10);
        return;
    }
    FString GetEnumShortName(const FString &inout EnumStr) const
    {
        FString local_4 = EnumStr;
        int local_5 = -1;
        if (local_4.FindLastChar(int16(58), local_5))
        {
            local_4 = local_4.RightChop(local_5 + 1);
        }
        int local_13 = -1;
        if (local_4.FindChar(int16(40), local_13))
        {
            local_4 = local_4.Left(local_13);
        }
        return local_4;
    }
    void PrintVaultPath(const FString &inout Label, const FVaultPath &inout Path) const
    {
        if (int(Path.VaultActionType) != 0)
        {
            FString local_24 = FString().Append(Label).Append(" = ").Append(this.GetEnumShortName(FString().Append(Path.VaultActionType))).Append("- Lv").Append(Path.VaultActionIndex).Append(", Start ").Append(this.GetEnumShortName(FString().Append(Path.VaultStartState)));
            int local_25 = 0;
            for (; local_25 < Path.GetPointsNum(); )
            {
                local_24 += FString().Append(", Loc").Append(local_25).Append(" (").Append(Path.GetPosition(local_25)).Append(")");
                ++local_25;
            }
            this.PrintInfo(local_24, FLinearColor::LucBlue);
        }
        return;
    }
    void PrintStates(const FECSEntity &inout Entity, const FDebugMovementStatInfo &inout Info) const
    {
        int local_6 = 0;
        int local_12 = 0;
        int local_18 = 0;
        FC_CharacterMovementParam local_24;
        int local_30 = 0;
        int local_36 = 0;
        int local_42 = 0;
        int local_48 = 0;
        this.PrepareStatInfo();
        FECSEntity::Get<FC_Rigidbody> local_40 = FECSEntity::Get<FC_Rigidbody>(Entity);
        this.PrintInfo(FString().Append("Character Movement: ").Append(Entity), FLinearColor::LucBlue);
        this.PrintInfo(FString().Append("Transform  ").Append(local_6.GetPosition()).Append(",    ").Append(local_6.GetRotation().Rotator()), FLinearColor::LucBlue);
        this.PrintInfo(FString().Append("MovePos    ").Append(local_12.GetPosition()).Append(",    Rot ").Append(local_12.GetRotation().Rotator()), FLinearColor::LucBlue);
        Get local_62;
        const FC_SnapToFloor& local_64 = local_62.opCall();
        if (local_64)
        {
            this.PrintInfo(FString().Append("SnapFloor  Loc ").Append(local_64.GetGroundPlaneLocation()).Append(",    Rot ").Append(FQuat(local_64.GetGroundPlaneRotation()).Rotator()), FLinearColor::LucBlue);
        }
        float32 local_82 = local_30.GetStepUpHeight();
        GetDefaulted local_80;
        this.PrintInfo(FString().Append("HalfHeight    ").Append(local_80.opCall().GetScaledHalfHeight()).Append(",    StepUp ").Append(local_82), FLinearColor::LucBlue);
        if (local_42)
        {
            FVector local_88 = local_42.GetVelocity();
            FString local_52 = FString();
            this.PrintInfo(local_52.Append("Velocity   ").Append(local_88).Append(", VelMag = ").Append(local_88.Size()).Append(", VelHor = ").Append(local_88.Size2D()), FLinearColor::LucBlue);
        }
        FString local_52_2 = FString();
        this.PrintInfo(local_52_2.Append("Speed        = ").Append(Info.CurSpeed).Append(", min ").Append(Info.MinSpeed).Append(", max ").Append(Info.MaxSpeed), FLinearColor::LucBlue);
        FString local_52_3 = FString();
        this.PrintInfo(local_52_3.Append("SpeedHor     = ").Append(Info.CurSpeedHorizontal).Append(", min ").Append(Info.MinSpeedHorizontal).Append(", max ").Append(Info.MaxSpeedHorizontal), FLinearColor::LucBlue);
        FString local_52_4 = FString();
        this.PrintInfo(local_52_4.Append("SpeedVer     = ").Append(Info.CurSpeedVertical).Append(", min ").Append(Info.MinSpeedVertical).Append(", max ").Append(Info.MaxSpeedVertical), FLinearColor::LucBlue);
        if (local_12.GetbAnimFakeAirFloating())
        {
            FString local_52_5 = FString();
            this.PrintInfo(local_52_5.Append("Airborne = ").Append(local_12.GetbAirborne()).Append(", FakeAir = true"), FLinearColor::Yellow);
        }
        else
        {
            if (local_12.GetbAirborne())
            {
            }
            else
            {
            }
            FString local_52_6 = FString();
            this.PrintInfo(local_52_6.Append("Airborne = ").Append(local_12.GetbAirborne()));
        }
        if (local_30)
        {
            float32 local_101;
            float32 local_100;
            float32 local_99;
            this.PrintInfo(FString().Append("bHasFloor ").Append(local_30.GetFloorInfo_New().GetbHasFloor()).Append(", FloorPoint ").Append(local_30.GetFloorInfo_New().GetFloorPoint()), FLinearColor::LucBlue);
            local_99 = local_30.GetFloorInfo_New().GetFloorSlope();
            if (local_99 > local_24.WalkableSlopDegree)
            {
            }
            else
            {
            }
            FString local_52_7 = FString();
            this.PrintInfo(local_52_7.Append("AdaptedSlope = ").Append(local_99));
            local_100 = local_30.GetFloorInfo_New().GetDebugDirectSlope();
            if (local_100 > local_24.WalkableSlopDegree)
            {
            }
            else
            {
            }
            FString local_52_8 = FString();
            this.PrintInfo(local_52_8.Append("DirectSlope = ").Append(local_100));
            local_101 = local_12.GetMoveDirSlope();
            float32 local_82_4 = FCharacterGroundMoveUtils::CalculateSlopeSpeedScale(local_101, local_24.SlopeSpeedScale);
            FString local_52_9 = FString();
            this.PrintInfo(local_52_9.Append("ForwardSlope = ").Append(local_12.GetForwardSlope()).Append(", MoveDirSlope = ").Append(local_101).Append(", SlopeSpeedScale = ").Append(local_82_4), FLinearColor::LucBlue);
            FString local_52_10 = FString();
            this.PrintInfo(local_52_10.Append("Component = ").Append(local_30.GetFloorInfo_New().GetDebugFloorComponentInfo()), FLinearColor::LucBlue);
        }
        else
        {
            this.PrintInfo(FString().Append("bHasFloor ").Append(local_12.GetFloorInfo().bHasFloor).Append(", FloorImpactPoint ").Append(local_12.GetFloorInfo().FloorImpactPoint), FLinearColor::LucBlue);
            float32 local_81_2 = FKinematicMoveCollisionUtils::GetSlopeAngle(FVector3f(local_12.GetFloorInfo().FloorNormal));
            if (local_81_2 > local_24.WalkableSlopDegree)
            {
            }
            else
            {
            }
            FString local_52_11 = FString();
            this.PrintInfo(local_52_11.Append("Slope = ").Append(local_81_2));
        }
        if (local_36)
        {
            this.PrintVaultPath("VaultAction", local_36.GetProbPath());
            this.PrintVaultPath("VaultDualAction", local_36.GetDualProbPath());
        }
        if (local_18.GetbTurningBackward() || (local_48.GetSwingTimeElapsed() >= 0.0f))
        {
            FString local_52_12 = FString();
            this.PrintInfo(local_52_12.Append("[TurningBack] ElapsedTime = ").Append(local_48.GetSwingTimeElapsed()), FLinearColor::Green);
        }
        return;
    }
    void UpdateStatBaseInfo(FDebugMovementStatInfo &inout StatInfo, const FC_Transform &inout Transform, const FC_CharacterMovement &inout CharacterMovement, const FC_CharacterMovementNew &inout CharacterMovementNew, const FC_Collision &inout Collision, const FCS_FixedTime &inout Time) const
    {
        float32 local_36;
        float32 local_37;
        float32 local_38;
        FVector3f local_19 = FVector3f((FVector(Transform.GetPosition()) - StatInfo.LastPosition));
        float32 local_21 = local_19.Size() / Time.DeltaTime;
        FVector3f local_3 = FVector3f(local_19.X, local_19.Y, 0.0f);
        FVector3f local_25 = FVector3f(0.0f, 0.0f, local_19.Z);
        float32 local_22_2 = local_3.Size() / Time.DeltaTime;
        float32 local_20_2 = local_25.Size() / Time.DeltaTime;
        if (StatInfo.SpeedBuff.Num() == 30)
        {
            StatInfo.MaxSpeed = 0.0f;
            StatInfo.MinSpeed = 3.4028235e38f;
            StatInfo.MaxSpeedHorizontal = 0.0f;
            StatInfo.MinSpeedHorizontal = 3.4028235e38f;
            StatInfo.MaxSpeedVertical = 0.0f;
            StatInfo.MinSpeedVertical = 3.4028235e38f;
            int local_35 = 0;
            while (local_35 < 0)
            {
                local_36 = StatInfo.SpeedBuff[local_35];
                if (local_36 < StatInfo.MinSpeed)
                {
                    StatInfo.MinSpeed = local_36;
                }
                if (local_36 > StatInfo.MaxSpeed)
                {
                    StatInfo.MaxSpeed = local_36;
                }
                local_37 = StatInfo.SpeedHorizontalBuff[local_35];
                if (local_37 < StatInfo.MinSpeedHorizontal)
                {
                    StatInfo.MinSpeedHorizontal = local_37;
                }
                if (local_37 > StatInfo.MaxSpeedHorizontal)
                {
                    StatInfo.MaxSpeedHorizontal = local_37;
                }
                local_38 = StatInfo.SpeedVerticalBuff[local_35];
                if (local_38 < StatInfo.MinSpeedVertical)
                {
                    StatInfo.MinSpeedVertical = local_38;
                }
                if (local_38 > StatInfo.MaxSpeedVertical)
                {
                    StatInfo.MaxSpeedVertical = local_38;
                }
                ++local_35;
            }
            StatInfo.SpeedBuff.Empty();
            StatInfo.SpeedHorizontalBuff.Empty();
            StatInfo.SpeedVerticalBuff.Empty();
        }
        StatInfo.SpeedBuff.Add(local_21);
        StatInfo.SpeedHorizontalBuff.Add(local_22_2);
        StatInfo.SpeedVerticalBuff.Add(local_20_2);
        StatInfo.CurSpeed = local_21;
        StatInfo.CurSpeedHorizontal = local_22_2;
        StatInfo.CurSpeedVertical = local_20_2;
        if (CVar_Charactermovenet_DebugTraceTime.GetFloat() > 0.0f)
        {
            float32 local_30_5 = CVar_Charactermovenet_DebugTraceTime.GetFloat();
            float32 local_26_5 = local_30_5 - (float32(Time.Time.ToSeconds()) - StatInfo.LastTime);
            if (local_26_5 > 0.0f)
            {
                FECSDebugDraw::DrawDebugLine(n"CharacterMovementDebug", StatInfo.LastPosition, Transform.GetPosition(), FColor::Red, FColor::Red, local_26_5, uint8(0), 2.0f);
                if (CharacterMovement.GetbAirborne())
                {
                }
                else
                {
                }
                FColor local_43;
                FECSDebugDraw::DrawDebugPoint(n"CharacterMovementDebug", Transform.GetPosition(), 4.0f, local_43, local_43, local_26_5, uint8(1));
            }
        }
        StatInfo.LastPosition = Transform.GetPosition();
        StatInfo.LastTime = float32(Time.Time.ToSeconds());
        return;
    }
    void UpdateStateShapeInfo(FDebugMovementStatInfo &inout StatInfo, const FC_Transform &inout Transform, const FC_CharacterMovement &inout CharacterMovement, const FC_CharacterMovementNew &inout CharacterMovementNew, const FC_Collision &inout Collision) const
    {
        FKMCContext local_148;
        FVector local_154 = CharacterMovement.GetPosition();
        FQuat local_164 = CharacterMovement.GetRotation();
        float32 local_166 = CharacterMovementNew.GetStepUpHeight();
        Collision.GetScaledShape();
        FVector local_178 = local_148.State.GetCollisionPosition();
        FQuat local_192 = local_148.State.GetCollisionRotation();
        float32 local_166_2 = float32(local_148.GetActualShape().GetExtent().Z);
        float32 local_201 = FKinematicMoveCollisionUtils::GetShapeRadiusAsCapsule(local_148.GetActualShape());
        FColor local_206;
        if (CharacterMovement.GetFloorInfo().bHasFloor)
        {
            local_206 = FColor::Green;
        }
        else
        {
            if (CharacterMovement.GetFloorInfo().bHitNonStandingSurface)
            {
                local_206 = FColor::Red;
            }
        }
        if (CharacterMovement.GetFloorInfo().bTouchingFloor == false)
        {
        }
        StatInfo.ShapeInfo.SetbValid(true);
        StatInfo.ShapeInfo.SetCollisionPosition(local_178);
        StatInfo.ShapeInfo.SetCollisionRotation(local_192);
        StatInfo.ShapeInfo.SetCapsuleHalfHeight(local_166_2);
        StatInfo.ShapeInfo.SetCapsuleRadius(local_201);
        StatInfo.ShapeInfo.SetFloorColor(local_206);
        StatInfo.ShapeInfo.SetFloorPosition(CharacterMovement.GetFloorInfo().FloorImpactPoint);
        return;
    }
    UFUNCTION()
    void DebugEntity(const FCS_FixedTime &inout Time) const
    {
        int local_32 = 0;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        if (ECS::GetRuntimeInfo().IsClient && !(Time.bLatestFrame))
        {
            return;
        }
        FECSEntity local_10 = this.GetDebugEntity();
        if (!(local_10.IsValid()) == !(false))
        {
            return;
        }
        Has local_14;
        if (ECS::GetRuntimeInfo().IsClient && !(local_14.opCall()))
        {
            const FCS_DebugStatInfo& local_22;
            this.PrepareStatInfo();
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            Get local_20;
            local_22 = local_20.opCall();
            if (local_22)
            {
                this.GetStatInfo().PrintLines = local_22.GetPrintLines();
                this.GetStatInfo().ShapeInfo = local_22.GetShapeInfo();
            }
            return;
        }
        bool local_2_2 = ECS::GetRuntimeInfo().IsServer;
        if (!(local_2_2))
        {
            local_2_2 = false;
        }
        else
        {
            Has local_26;
            local_2_2 = local_26.opCall();
        }
        if (local_2_2)
        {
            return;
        }
        if (!(local_32) || !(local_38) || !(local_44) || !(local_50))
        {
            return;
        }
        FDebugMovementStatInfo& local_52 = this.GetStatInfo();
        this.UpdateStatBaseInfo(local_52, local_32, local_38, local_44, local_50, Time);
        this.PrintStates(local_10, local_52);
        this.UpdateStateShapeInfo(local_52, local_32, local_38, local_44, local_50);
        bool local_2_3 = ECS::GetRuntimeInfo().IsServer;
        if (local_2_3)
        {
            const FCS_DebugStatInfo& local_22;
            FECSWorldPtr local_16_2 = ECS::GetECSWorld();
            local_22.SetPrintLines(local_52.PrintLines);
            local_22.SetShapeInfo(local_52.ShapeInfo);
        }
        if (CVar_Charactermovenet_DebugCache.GetBool())
        {
            Get local_60;
            const FC_VaultingQueryCache& local_62 = local_60.opCall();
            if (local_62)
            {
                local_62.Cache.DrawCacheRange(n"CharacterMovementDebug", FColor::Red, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
            }
            local_44.GetFindFloorCache().DrawCacheRange(n"CharacterMovementDebug", FColor::Green, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
            local_44.GetMoveSweepCache().DrawCacheRange(n"CharacterMovementDebug", FColor::Blue, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
        }
        return;
    }
    UFUNCTION()
    void ClientDebugPrint() const
    {
        float32 local_63 = 0.0f;
        FDebugMovementStatInfo& local_2 = this.GetStatInfo();
        int local_6 = local_2.PrintLines.Num() - 1;
        for (; local_6 >= 0; )
        {
            PrintToScreen(local_2.PrintLines[local_6].GetInfo(), 0.0f, local_2.PrintLines[local_6].GetColor());
            --local_6;
        }
        if (local_2.ShapeInfo.GetbValid())
        {
            const FC_InterpoTransform& local_26 = FECSEntity::Get<FC_InterpoTransform>(this.GetDebugEntity()).opCall();
            if (local_26)
            {
                Get local_30;
                const FC_Collision& local_32 = local_30.opCall();
                if (local_32)
                {
                    FVector local_38 = local_26.GetPosition();
                    FQuat local_48 = local_26.GetRotation();
                    FColor local_64 = FColor(uint8(0), uint8(0), uint8(0), uint8(0));
                    FECSDebugDraw::DrawDebugCapsule(n"CharacterMovementDebug", local_38, float32(local_32.GetScaledShape().GetExtent().Z), FKinematicMoveCollisionUtils::GetShapeRadiusAsCapsule(local_32.GetScaledShape()), local_48, FColor::Orange, local_64, -1.0f, uint8(0), 0.0f);
                    FECSDebugDraw::DrawDebugPoint(n"CharacterMovementDebug", local_38, 8.0f, FColor::Red, FColor::Orange, -1.0f, uint8(1));
                }
            }
            FFPTime local_72 = FFPTime(ECS::GetRuntimeInfo().Time);
            FColor local_64_2 = FLinearColor::LerpUsingHSV(FLinearColor::Purple, FLinearColor::Blue, local_63).ToFColor(false);
            FECSDebugDraw::DrawDebugCapsule(n"CharacterMovementDebug", local_2.ShapeInfo.GetCollisionPosition(), local_2.ShapeInfo.GetCapsuleHalfHeight(), local_2.ShapeInfo.GetCapsuleRadius(), local_2.ShapeInfo.GetCollisionRotation(), local_64_2, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
            if (int(local_2.ShapeInfo.GetFloorColor().A) != 0)
            {
                FECSDebugDraw::DrawDebugLine(n"CharacterMovementDebug", (FVector(local_2.ShapeInfo.GetCollisionPosition()) - FVector(0.0, 0.0, local_2.ShapeInfo.GetCapsuleHalfHeight())), local_2.ShapeInfo.GetFloorPosition(), local_2.ShapeInfo.GetFloorColor(), FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
                FECSDebugDraw::DrawDebugSphere(n"CharacterMovementDebug", local_2.ShapeInfo.GetFloorPosition(), 10.0f, 8, local_2.ShapeInfo.GetFloorColor(), FColor(uint8(0), uint8(0), uint8(0), uint8(0)), -1.0f, uint8(0), 0.0f);
            }
        }
        return;
    }
    UFUNCTION()
    void Run_DebugEntity() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        this.DebugEntity(local_6);
        return;
    }
    UFUNCTION()
    void Run_ClientDebugPrint() const
    {
        ECS::GetContextJob();
        this.ClientDebugPrint();
        return;
    }
}

namespace CharacterMovementDebug
{
bool Enabled()
{
    return CVar_Charactermovenet_Debug.GetBool();
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FDebugMovementCollisionInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FDebugMovementCollisionInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDebugMovementCollisionInfo
{
int __IndexOf_bValid()
{
    return 0;
}
int __IndexOf_CollisionPosition()
{
    return 1;
}
int __IndexOf_CollisionRotation()
{
    return 2;
}
int __IndexOf_CapsuleHalfHeight()
{
    return 3;
}
int __IndexOf_CapsuleRadius()
{
    return 4;
}
int __IndexOf_FloorColor()
{
    return 5;
}
int __IndexOf_FloorPosition()
{
    return 6;
}
}
