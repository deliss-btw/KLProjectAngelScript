

class US_MovementSystem : UECSScriptSystem
{
    US_MovementSystem()
    {
        return;
    }
    bool IsActiveCanonicalPropPredictPath(const FECSEntity &inout Entity) const
    {
        bool local_7;
        Get local_4;
        const FC_ThrowPredictPathKey& local_6 = local_4.opCall();
        if (local_6)
        {
            if (!((int(local_6.GetKeyInfo().GetTargetType())) == 1 && (FECSEntityId(local_6.GetKeyInfo().GetPropEntityId()) == Entity.GetId())))
            {
                local_7 = false;
            }
            else
            {
                Has local_18;
                local_7 = local_18.opCall();
            }
            return local_7;
        }
        return false;
    }
    void StopCanonicalPropPredictPathOnAuthoritativeHit(const FECSEntity &inout Entity) const
    {
        if (!(this.IsActiveCanonicalPropPredictPath(Entity)))
        {
            return;
        }
        Remove local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Job_InitMovementInfo(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_2 = FFPTime(MovementInfo.GetMoveBeginTime());
        if ((local_2 == 0.0))
        {
            Get local_10;
            const FC_LifeTime& local_12 = local_10.opCall();
            if (local_12)
            {
                MovementInfo.SetMoveBeginTime(local_12.GetSpawnTime());
                MovementInfo.SetMoveTotalTime(local_12.GetLifeDuration());
            }
            else
            {
                MovementInfo.SetMoveBeginTime(FixedTime.Time);
            }
            MovementInfo.SetInitRotation(Transform.ToFTransform().GetRotation());
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateMovementInfoTime(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FCS_FixedTime &inout FixedTime) const
    {
        int local_144 = 0;
        int local_150 = 0;
        if (FFPTime(MovementInfo.GetMoveBeginTime()).opCmp(FixedTime.Time) > 0)
        {
            return;
        }
        FFPTime local_6 = FFPTime(FixedTime.LastTime);
        if (FFPTime(FixedTime.LastTime).opCmp(MovementInfo.GetMoveBeginTime()) < 0)
        {
            local_6 = MovementInfo.GetMoveBeginTime();
        }
        FFPTime local_8;
        Get local_12;
        const FC_LifeTime& local_14 = local_12.opCall();
        if (local_14)
        {
            Get local_18;
            local_8 = FProjectileTimeUtils::GetFrameTime(local_14, local_18.opCall(), local_6, FixedTime.Time).DeltaTime;
        }
        else
        {
            local_8 = (FFPTime(FixedTime.Time) - local_6);
        }
        MovementInfo.SetLastMoveTime(MovementInfo.GetMoveTime());
        FFPTime local_2 = (MovementInfo.GetMoveTime() + local_8);
        MovementInfo.SetMoveTime(local_2);
        if (FFPTime(MovementInfo.GetMoveTotalTime()).opCmp(0.0) >= 0 && (FFPTime(MovementInfo.GetMoveTime()).opCmp(MovementInfo.GetMoveTotalTime()) > 0))
        {
            bool local_4;
            MovementInfo.SetMoveBeginTime(FFPTime(0));
            MovementInfo.SetMoveTotalTime(FFPTime(-1));
            MovementInfo.SetMoveTime(FFPTime(0));
            MovementInfo.SetLastMoveTime(FFPTime(-1));
            Remove local_34;
            local_34.opCall();
            Remove local_38;
            local_38.opCall();
            Remove local_42;
            local_42.opCall();
            Remove local_46;
            local_46.opCall();
            Remove local_50;
            local_50.opCall();
            Remove local_54;
            local_54.opCall();
            Remove local_58;
            local_58.opCall();
            Remove local_62;
            local_62.opCall();
            Remove local_66;
            local_66.opCall();
            Remove local_70;
            local_70.opCall();
            Remove local_74;
            local_74.opCall();
            Remove local_78;
            local_78.opCall();
            Has local_82;
            local_4 = local_82.opCall();
            if (local_4)
            {
                Remove local_86;
                local_86.opCall();
                SendEvent local_90;
                local_90.opCall(FixedTime.Time);
            }
            Get local_94;
            const FC_MovementEndAbilitySignal& local_96 = local_94.opCall();
            if (local_96)
            {
                FECSEntity local_100 = FECSEntity(local_96.GetNotifyEntity());
                TSoftClassPtr<UEASAbility> local_110 = TSoftClassPtr<UEASAbility>(local_96.GetAbilityClass());
                FName local_112(local_96.GetSignalName());
                Remove local_118;
                local_118.opCall();
                if (local_100.IsValid() && local_110.IsValid())
                {
                    Modify local_122;
                    FC_EASAbility& local_124 = local_122.opCall();
                    if (local_124)
                    {
                        int local_3 = FAbilityUtils::GetAbilityIndexByClass(local_100, local_110.Get());
                        if (local_3 >= 0)
                        {
                            FAbilityUtils::InvokeSignal(local_124.ModifyAbilityInstance(local_3), local_100, local_112, FixedTime.Time, true);
                        }
                    }
                }
            }
            Get local_132;
            const FC_MovementEndEventToESMTriggerFilterSignal& local_134 = local_132.opCall();
            if (local_134)
            {
                FECSEntity local_100_2 = FECSEntity(local_134.GetNotifyEntity());
                FName local_112_2(local_134.GetEventName());
                Remove local_138;
                local_138.opCall();
                if (local_100_2.IsValid())
                {
                    if (!(!(local_144)) && local_150)
                    {
                        int local_3_2 = 0;
                        for (; local_3_2 < 8; ++local_3_2)
                        {
                            int local_151 = (1 << local_3_2) & local_150.GetActivatedIndexMask();
                            if (local_151 != 0 && (local_3_2 < local_144.MovementEndEventToESMTriggerFilter.Num()))
                            {
                                const FEventToESMTriggerFilterConfigItem_MovementEnd& local_156 = local_144.MovementEndEventToESMTriggerFilter[local_3_2];
                                if (local_156.EvaluateAndTrigger(local_112_2, local_100_2))
                                {
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_InitLinearMovement(FC_MovementInfo &inout MovementInfo, const FC_LinearMovementConfig &inout Config, const FC_Transform &inout Transform) const
    {
        MovementInfo.SetVelocity((Transform.GetRotation().GetForwardVector() * Config.Speed));
        return;
    }
    UFUNCTION()
    void Job_UpdateLinearMovement(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_MovementInfo &inout MovementInfo, const FC_LinearMovementConfig &inout Config) const
    {
        int local_6 = 0;
        local_6.SetDeltaMovement((FVector(MovementInfo.GetVelocity()) * (FFPTime(MovementInfo.GetMoveTime()) - MovementInfo.GetLastMoveTime()).ToSeconds()));
        if (Config.bRotateToMoveDir)
        {
            local_6.SetNextRotation(FQuat4f(local_6.GetDeltaMovement().ToOrientationRotator().Quaternion()));
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateLinearMovementOverride(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_MovementInfo &inout MovementInfo, const FC_LinearMovementOverride &inout Config) const
    {
        int local_6 = 0;
        local_6.SetDeltaMovement((FVector(Config.GetVelocity()) * (FFPTime(MovementInfo.GetMoveTime()) - MovementInfo.GetLastMoveTime()).ToSeconds()));
        if (Config.GetbRotateToMoveDir())
        {
            local_6.SetNextRotation(FQuat4f(local_6.GetDeltaMovement().ToOrientationRotator().Quaternion()));
        }
        return;
    }
    UFUNCTION()
    void Monitor_InitSimpleProjectileMove(const FECSEntity &inout Entity, const FC_SimpleProjectileMovementConfig &inout Config) const
    {
        Has local_4;
        bool local_5;
        if (!(local_4.opCall()))
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
            local_5 = true;
        }
        else
        {
            Has local_16;
            local_5 = local_16.opCall();
        }
        if (local_5)
        {
            return;
        }
        Modify local_20;
        FC_MovementInfo& local_22 = local_20.opCall();
        if (local_22)
        {
            if (local_22.GetbModifyVelocityInTick())
            {
                float local_36 = Config.Data.GetInitSpeed();
                GetDefaulted local_26;
                local_22.SetVelocity((local_26.opCall().GetRotation().GetForwardVector() * local_36));
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_InitSimpleProjectileMoveLate(const FECSEntity &inout Entity, const FC_SimpleProjectileMovementConfig &inout Config) const
    {
        Has local_4;
        bool local_5;
        if (!(local_4.opCall()))
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
            local_5 = true;
        }
        else
        {
            Has local_16;
            local_5 = local_16.opCall();
        }
        if (local_5)
        {
            return;
        }
        Modify local_20;
        FC_MovementInfo& local_22 = local_20.opCall();
        if (local_22)
        {
            if (local_22.GetbModifyVelocityInTick())
            {
                float local_36 = Config.Data.GetInitSpeed();
                GetDefaulted local_26;
                local_22.SetVelocity((local_26.opCall().GetRotation().GetForwardVector() * local_36));
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_InitSimpleProjectileMovementOverride(const FECSEntity &inout Entity, const FC_SimpleProjectileMovementOverride &inout Config) const
    {
        Has local_4;
        bool local_5;
        if (!(local_4.opCall()))
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
            return;
        }
        Modify local_16;
        FC_MovementInfo& local_18 = local_16.opCall();
        if (local_18)
        {
            if (local_18.GetbModifyVelocityInTick())
            {
                float local_32 = Config.GetData().GetInitSpeed();
                GetDefaulted local_22;
                local_18.SetVelocity((local_22.opCall().GetRotation().GetForwardVector() * local_32));
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_InitThrowMovement(const FECSEntity &inout Entity, const FC_ThrowMovementConfig &inout Config) const
    {
        Has local_4;
        bool local_5;
        if (!(local_4.opCall()))
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
            local_5 = true;
        }
        else
        {
            Has local_16;
            local_5 = local_16.opCall();
        }
        if (local_5)
        {
            return;
        }
        Modify local_20;
        FC_MovementInfo& local_22 = local_20.opCall();
        if (local_22)
        {
            if (local_22.GetbModifyVelocityInTick())
            {
                float local_36 = Config.Data.GetInitSpeed();
                GetDefaulted local_26;
                local_22.SetVelocity((local_26.opCall().GetRotation().GetForwardVector() * local_36));
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_InitThrowMovementOverride(const FECSEntity &inout Entity, const FC_ThrowMovementOverride &inout Config) const
    {
        Has local_4;
        bool local_5;
        if (!(local_4.opCall()))
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
            return;
        }
        Modify local_16;
        FC_MovementInfo& local_18 = local_16.opCall();
        if (local_18)
        {
            if (local_18.GetbModifyVelocityInTick())
            {
                float local_32 = Config.GetData().GetInitSpeed();
                GetDefaulted local_22;
                local_18.SetVelocity((local_22.opCall().GetRotation().GetForwardVector() * local_32));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_InitAutoCalcProjectileMovement(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_MovementInfo &inout MovementInfo, const FC_AutoCalcProjectileMovement &inout AutoCalcProjectileMovement) const
    {
        Remove local_14;
        int local_20 = 0;
        float local_76;
        const FProjectileMovementCalculationData& local_2 = AutoCalcProjectileMovement.GetData().GetConfig();
        if (int(local_2.GetMethod()) == 1 && (local_2.GetOverrideMoveTime() <= 0.0f))
        {
            XWarning(ELog(48), "[Job_InitAutoCalcProjectileMovement]: OverrideMoveTime <= 0");
            local_14.opCall();
            return;
        }
        if (!(local_20))
        {
            local_14.opCall();
            return;
        }
        if (!(FECSEntity(local_20.GetOwnerEntity()).IsValid()))
        {
            local_14.opCall();
            return;
        }
        FSimpleProjectileMovementConfigData local_32;
        Get local_36;
        const FC_SimpleProjectileMovementOverride& local_38 = local_36.opCall();
        if (local_38)
        {
            local_32 = local_38.GetData();
        }
        else
        {
            Get local_42;
            const FC_SimpleProjectileMovementConfig& local_44 = local_42.opCall();
            if (local_44)
            {
                local_32 = local_44.Data;
            }
            else
            {
                local_14.opCall();
                return;
            }
        }
        FVector local_50 = Transform.GetPosition();
        FVector local_56(FVector::ZeroVector);
        bool local_57 = false;
        if (int(AutoCalcProjectileMovement.GetData().GetTargetType()) == 1)
        {
            local_56 = AutoCalcProjectileMovement.GetData().GetTargetPosition();
            local_57 = true;
        }
        else
        {
            if (int(AutoCalcProjectileMovement.GetData().GetTargetType()) == 2)
            {
                if (AutoCalcProjectileMovement.GetData().GetTargetEntity().IsValid())
                {
                    GetDefaulted local_62;
                    local_56 = local_62.opCall().GetPosition();
                    local_57 = true;
                }
            }
        }
        if (!(local_57))
        {
            if (local_2.GetAddtionalPitchWithoutTarget() != 0.0f)
            {
                FRotator local_74 = MovementInfo.GetVelocity().ToOrientationRotator();
                float32 local_8 = local_2.GetAddtionalPitchWithoutTarget();
                float local_78 = local_8;
                local_74.Pitch += local_78;
                local_78 = MovementInfo.GetVelocity().Size();
                MovementInfo.SetVelocity((local_74.GetForwardVector() * local_78));
            }
            local_14.opCall();
            return;
        }
        float32 local_8_2 = local_32.GetGravityScale() * 980.0f;
        float local_92 = local_8_2;
        FVector local_90 = (local_56 - local_50);
        local_76 = local_90.DistXY(FVector::ZeroVector);
        local_8_2 = local_2.GetMinDistance();
        if (local_8_2 > 0.0f)
        {
            float local_100 = local_2.GetMinDistance();
            local_76 = FMath::Max(local_76, local_100);
        }
        if (local_2.GetMaxDistance() > 0.0f)
        {
            local_8_2 = local_2.GetMaxDistance();
            if (local_76 > local_8_2)
            {
                local_8_2 = local_2.GetMaxDistance();
                local_76 = local_8_2;
            }
        }
        if (local_76 > 0.0 && (local_92 != 0.0))
        {
            if (int(local_2.GetMethod()) == 0)
            {
                FVector local_98 = local_90.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
                local_8_2 = local_32.GetInitSpeed();
                float local_108 = local_8_2;
                float local_100_2 = local_108 * local_108;
                float local_78_3 = local_76 * local_76;
                float local_110 = local_100_2 * local_100_2;
                float local_112 = local_110 * local_78_3;
                local_110 = local_92 * local_78_3;
                float local_120 = 2.0 * local_90.Z;
                float local_118 = local_120 * local_100_2;
                local_120 = (local_92 * local_78_3) + local_118;
                local_118 = local_110 * local_120;
                local_120 = local_112 - local_118;
                if (local_120 < 0.0)
                {
                    float local_114 = FMath::Sqrt(2.0);
                    local_112 = local_114 * local_108;
                    local_114 = local_112 / 2.0;
                    float local_122 = local_98.Y * local_114;
                    local_112 = local_98.X * local_114;
                    MovementInfo.SetVelocity(FVector(local_112, local_122, local_114));
                }
                else
                {
                    local_110 = local_100_2 * local_76;
                    local_112 = local_110 - FMath::Sqrt(local_120);
                    float local_116 = FMath::Atan(local_112 / (local_92 * local_78_3));
                    local_112 = FMath::Sin(local_116);
                    float local_114_2 = local_112 * local_108;
                    local_112 = FMath::Cos(local_116);
                    float local_124 = local_112 * local_108;
                    float local_126 = local_98.Y * local_124;
                    MovementInfo.SetVelocity(FVector(local_98.X * local_124, local_126, local_114_2));
                }
            }
            else
            {
                if (int(local_2.GetMethod()) == 1)
                {
                    FVector local_84_2 = local_90.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
                    local_8_2 = local_2.GetOverrideMoveTime();
                    float local_108_2 = FMath::Max(local_8_2, 0.01f);
                    float local_122_2 = local_76 / local_108_2;
                    float local_112_2 = local_90.Z / local_108_2;
                    float local_118_2 = 0.5 * local_92;
                    float local_100_3 = local_118_2 * local_108_2;
                    local_118_2 = local_112_2 + local_100_3;
                    float local_78_4 = local_84_2.Y * local_122_2;
                    local_112_2 = local_84_2.X * local_122_2;
                    MovementInfo.SetVelocity(FVector(local_112_2, local_78_4, local_118_2));
                }
                else
                {
                    if (int(local_2.GetMethod()) == 2)
                    {
                        FVector local_98_2 = Transform.GetRotation().GetForwardVector().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                        float local_100_4;
                        float local_110_2 = local_98_2.X * local_98_2.X;
                        float local_126_2 = local_98_2.Y;
                        float local_78_5 = FMath::Sqrt(local_110_2 + (local_98_2.Y * local_126_2));
                        if (local_78_5 > 0.001)
                        {
                            local_126_2 = local_98_2.Z / local_78_5;
                            local_110_2 = local_76 * local_126_2;
                            float local_112_3 = local_110_2 - local_90.Z;
                            if (local_112_3 > 0.01)
                            {
                                float local_120_2 = local_92 * local_76;
                                local_110_2 = local_120_2 * local_76;
                                local_120_2 = 2.0;
                                local_120_2 = (local_120_2 * local_78_5) * local_78_5;
                                local_120_2 = local_110_2 / (local_120_2 * local_112_3);
                                if (local_120_2 > 0.0)
                                {
                                    float local_122_3 = FMath::Sqrt(local_120_2);
                                    MovementInfo.SetVelocity((local_98_2 * local_122_3));
                                }
                                else
                                {
                                    XWarning(ELog(48), "[InitDirection]: Target unreachable with given angle");
                                    MovementInfo.SetVelocity((local_98_2 * local_32.GetInitSpeed()));
                                }
                            }
                            else
                            {
                                MovementInfo.SetVelocity((local_98_2 * local_32.GetInitSpeed()));
                            }
                        }
                        else
                        {
                            local_100_4 = local_32.GetInitSpeed();
                            MovementInfo.SetVelocity((local_98_2 * local_100_4));
                        }
                    }
                }
            }
        }
        else
        {
            if (local_76 > 0.0)
            {
                if (int(local_2.GetMethod()) == 1 && (local_2.GetOverrideMoveTime() > 0.0f))
                {
                    FVector local_106 = FVector(FVector::UpVector);
                    float local_110_3 = local_90.Size() / local_2.GetOverrideMoveTime();
                    MovementInfo.SetVelocity((local_106 * local_110_3));
                }
            }
            else
            {
                if (int(local_2.GetMethod()) == 0)
                {
                    float local_110_4 = local_32.GetInitSpeed();
                    MovementInfo.SetVelocity((FVector(FVector::UpVector) * local_110_4));
                }
                else
                {
                    if (int(local_2.GetMethod()) == 1)
                    {
                        float local_110_5;
                        if ((local_56.Z - local_50.Z) > 0.0)
                        {
                            local_110_5 = local_32.GetInitSpeed();
                            MovementInfo.SetVelocity((FVector(FVector::UpVector) * local_110_5));
                        }
                        else
                        {
                            MovementInfo.SetVelocity(FVector::ZeroVector);
                        }
                    }
                    else
                    {
                        if (int(local_2.GetMethod()) == 2)
                        {
                            MovementInfo.SetVelocity(FVector::ZeroVector);
                        }
                    }
                }
            }
        }
        if (local_2.GetbAddRotationOnResult() && (int(local_2.GetMethod()) != 2))
        {
            FRotator local_68 = MovementInfo.GetVelocity().ToOrientationRotator();
            local_68 += FRotator(AutoCalcProjectileMovement.GetData().GetAdditionalRotation());
            FVector local_84_3 = local_68.GetForwardVector();
            MovementInfo.SetVelocity((local_84_3 * MovementInfo.GetVelocity().Size()));
        }
        MovementInfo.SetbModifyVelocityInTick(false);
        local_14.opCall();
        return;
    }
    UFUNCTION()
    void Job_TickSimpleProjectileMovement(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_SimpleProjectileMovementConfig &inout Config, const FC_Transform &inout Transform) const
    {
        ::FMovementUtils::TickSimpleProjectileMovement(Entity, MovementInfo, Config.Data, Transform);
        return;
    }
    UFUNCTION()
    void Job_TickSimpleProjectileMovementOverride(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_SimpleProjectileMovementOverride &inout Config, const FC_Transform &inout Transform) const
    {
        ::FMovementUtils::TickSimpleProjectileMovement(Entity, MovementInfo, Config.GetData(), Transform);
        return;
    }
    UFUNCTION()
    void Job_TickThrowMovement(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_ThrowMovementConfig &inout Config, const FC_Transform &inout Transform) const
    {
        ::FMovementUtils::TickThrowMovement(Entity, MovementInfo, Config.Data, Transform);
        return;
    }
    UFUNCTION()
    void Job_TickThrowMovementOverride(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_ThrowMovementOverride &inout Config, const FC_Transform &inout Transform) const
    {
        ::FMovementUtils::TickThrowMovement(Entity, MovementInfo, Config.GetData(), Transform);
        return;
    }
    UFUNCTION()
    void Job_TickCurveMovement(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_CurveMovementConfig &inout CurveMove, const FC_Transform &inout Transform) const
    {
        float32 local_7;
        if (CurveMove.Data.GetCurveTotalTime() > 0.0f)
        {
            local_7 = CurveMove.Data.GetCurveTotalTime();
        }
        else
        {
            local_7 = float32(MovementInfo.GetMoveTotalTime().ToSeconds());
        }
        if (local_7 <= 0.0f)
        {
            return;
        }
        float32 local_3 = float32((MovementInfo.GetLastMoveTime().ToSeconds() / local_7));
        float local_6_2 = MovementInfo.GetMoveTime().ToSeconds();
        local_6_2 = local_6_2 / local_7;
        ::FMovementUtils::TickCurveMovement(Entity, CurveMove.Data, Transform, MovementInfo.GetInitRotation(), local_3, float32(local_6_2));
        return;
    }
    UFUNCTION()
    void Job_TickCurveMovementOverride(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, FC_CurveMovementOverride &inout CurveMove, const FC_Transform &inout Transform) const
    {
        float32 local_1;
        float32 local_2;
        if (CurveMove.GetbUseCustomSampleTime())
        {
            if (CurveMove.GetKeepMoveAfterExit())
            {
                CurveMove.SetSampleTime((CurveMove.GetSampleLastTime() + (float32((MovementInfo.GetMoveTime().ToSeconds() - MovementInfo.GetLastMoveTime().ToSeconds())))));
            }
            if ((CurveMove.GetSampleTime() - CurveMove.GetDelaySampleTime()) >= CurveMove.GetFirstSampleTime())
            {
                CurveMove.SetSampleTime((CurveMove.GetSampleTime() - CurveMove.GetDelaySampleTime()));
            }
            else
            {
                CurveMove.SetSampleTime(CurveMove.GetFirstSampleTime());
            }
            local_2 = CurveMove.GetSampleTime();
            local_1 = CurveMove.GetSampleLastTime();
        }
        else
        {
            float local_8 = MovementInfo.GetLastMoveTime().ToSeconds();
            float local_6_2 = CurveMove.GetData().GetCurveTotalTime();
            local_8 = local_8 / local_6_2;
            local_1 = float32(local_8);
            float local_8_2 = MovementInfo.GetMoveTime().ToSeconds();
            local_6_2 = CurveMove.GetData().GetCurveTotalTime();
            local_8_2 = local_8_2 / local_6_2;
            local_2 = float32(local_8_2);
        }
        FQuat local_20 = Transform.GetRotation();
        if (CurveMove.GetCurveRotationFollowEntity().IsValid())
        {
            GetDefaulted local_24;
            local_20 = local_24.opCall().GetRotation();
        }
        ::FMovementUtils::TickCurveMovement(Entity, CurveMove.GetData(), Transform, local_20, local_1, local_2);
        if (CurveMove.GetbUseCustomSampleTime())
        {
            CurveMove.SetSampleLastTime(CurveMove.GetSampleTime());
        }
        return;
    }
    UFUNCTION()
    void Job_TickCurveRotation(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_CurveRotationConfig &inout CurveRotation, const FC_Transform &inout Transform) const
    {
        float32 local_7;
        if (CurveRotation.Data.GetCurveTotalTime() > 0.0f)
        {
            local_7 = CurveRotation.Data.GetCurveTotalTime();
        }
        else
        {
            local_7 = float32(MovementInfo.GetMoveTotalTime().ToSeconds());
        }
        if (local_7 <= 0.0f)
        {
            return;
        }
        float32 local_3 = float32((MovementInfo.GetLastMoveTime().ToSeconds() / local_7));
        float local_6_2 = MovementInfo.GetMoveTime().ToSeconds();
        local_6_2 = local_6_2 / local_7;
        ::FMovementUtils::TickCurveRotation(Entity, CurveRotation.Data, Transform, local_3, float32(local_6_2));
        return;
    }
    UFUNCTION()
    void Job_TickCurveRotationOverride(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, FC_CurveRotationOverride &inout CurveRotation, const FC_Transform &inout Transform) const
    {
        float32 local_1;
        float32 local_2;
        if (CurveRotation.GetbUseCustomSampleTime())
        {
            if (CurveRotation.GetKeepMoveAfterExit())
            {
                CurveRotation.SetSampleTime((CurveRotation.GetSampleLastTime() + (float32((MovementInfo.GetMoveTime().ToSeconds() - MovementInfo.GetLastMoveTime().ToSeconds())))));
            }
            if ((CurveRotation.GetSampleTime() - CurveRotation.GetDelaySampleTime()) >= CurveRotation.GetFirstSampleTime())
            {
                CurveRotation.SetSampleTime((CurveRotation.GetSampleTime() - CurveRotation.GetDelaySampleTime()));
            }
            else
            {
                CurveRotation.SetSampleTime(CurveRotation.GetFirstSampleTime());
            }
            local_1 = CurveRotation.GetSampleLastTime();
            local_2 = CurveRotation.GetSampleTime();
        }
        else
        {
            float local_8 = MovementInfo.GetLastMoveTime().ToSeconds();
            float local_6_2 = CurveRotation.GetData().GetCurveTotalTime();
            local_8 = local_8 / local_6_2;
            local_1 = float32(local_8);
            float local_8_2 = MovementInfo.GetMoveTime().ToSeconds();
            local_6_2 = CurveRotation.GetData().GetCurveTotalTime();
            local_8_2 = local_8_2 / local_6_2;
            local_2 = float32(local_8_2);
        }
        ::FMovementUtils::TickCurveRotation(Entity, CurveRotation.GetData(), Transform, local_1, local_2);
        if (CurveRotation.GetbUseCustomSampleTime())
        {
            CurveRotation.SetSampleLastTime(CurveRotation.GetSampleTime());
        }
        return;
    }
    UFUNCTION()
    void Job_TickTrackMovement(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_TrackMovementConfig &inout Config, FC_TrackRuntime &inout Track, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        ::FMovementUtils::TickTrackMovement(Entity, MovementInfo, Config.Data, Track, Transform, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_TickTrackMovementOverride(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_TrackMovementOverride &inout Config, FC_TrackRuntime &inout Track, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_TickOrbitMovement(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, FC_OrbitMovementRuntime &inout Orbit, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_11;
        float32 local_79;
        int local_102 = 0;
        float local_8 = (FFPTime(MovementInfo.GetMoveTime()) - MovementInfo.GetLastMoveTime()).ToSeconds();
        float32 local_9 = float32(local_8);
        if (local_9 <= 0.0f)
        {
            return;
        }
        local_11 = true;
        FVector local_18;
        if ((int(Orbit.GetTargetType())) == 0)
        {
            local_11 = false;
            local_18 = Orbit.GetTargetPos();
        }
        else
        {
            if ((int(Orbit.GetTargetType())) == 1)
            {
                if (Orbit.GetTargetEntity().IsValid())
                {
                    Get local_26;
                    const FC_Transform& local_28 = local_26.opCall();
                    if (local_28)
                    {
                        local_18 = local_28.GetPosition();
                    }
                }
            }
        }
        FVector local_46 = (FVector(Transform.GetPosition()) - local_18);
        float local_8_2 = local_46.DotProduct(Orbit.GetAxis());
        float32 local_1 = float32(local_8_2);
        FVector local_34_2 = (local_18 + (FVector(Orbit.GetAxis()) * local_1));
        FVector local_54 = (FVector(Transform.GetPosition()) - local_34_2);
        if (local_54.IsNearlyZero(9.999999747378752e-5))
        {
            local_11 = true;
        }
        if (local_11)
        {
            Remove local_64;
            if (Orbit.GetbStopWhenReachCenter())
            {
                MovementInfo.SetMoveTotalTime(FFPTime(0));
                local_64.opCall();
            }
            return;
        }
        float local_8_4 = MovementInfo.GetMoveTime().ToSeconds();
        float32 local_47 = float32(local_8_4);
        float local_8_5 = MovementInfo.GetMoveTime().ToSeconds();
        float32 local_65 = float32(local_8_5);
        float local_8_6 = MovementInfo.GetMoveTime().ToSeconds();
        float32 local_67 = float32(local_8_6);
        float32 local_67_2 = 0.0f * local_9;
        float32 local_68 = local_47 * local_9;
        float32 local_71 = Orbit.GetCurDistanceToCenter();
        FVector local_78;
        if (!(Orbit.GetbKeepRelativePosAfterTargetEntityMove()))
        {
            float local_8_7 = local_54.Size();
            local_71 = float32(local_8_7);
        }
        local_71 = local_71 - local_68;
        if (local_71 < 0.0f)
        {
            local_71 = 0.0f;
            if (Orbit.GetbStopWhenReachCenter())
            {
                local_11 = true;
            }
        }
        local_79 = 0.0f;
        if (Orbit.GetbAxisMoveToTargetPlane())
        {
            if (Orbit.GetbAutoCalcAxisVelocity() && (local_47 > 0.0f))
            {
                float32 local_70 = Orbit.GetCurDistanceToCenter() / local_47;
                if (local_70 > 0.0f)
                {
                    if (local_70 <= local_9)
                    {
                        float32 local_69 = -local_1;
                        local_79 = local_69;
                    }
                    else
                    {
                        float32 local_81 = -local_1;
                        float32 local_69_2 = local_81 / local_70;
                        local_79 = local_69_2 * local_9;
                    }
                }
            }
            else
            {
                if (local_65 != 0.0f)
                {
                    float32 local_81_2 = -local_1;
                    if (FMath::Abs(((local_65 * local_9) * FMath::Sign(local_81_2))) > FMath::Abs(local_1))
                    {
                        local_81_2 = local_1;
                        local_81_2 = -local_81_2;
                        local_79 = local_81_2;
                    }
                }
            }
        }
        else
        {
            local_79 = local_65 * local_9;
        }
        FVector local_40_2 = ((local_54.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).RotateAngleAxis(local_67_2, Orbit.GetAxis())) * local_71);
        FVector local_60_2 = (local_34_2 + local_40_2);
        local_78 = (local_60_2 + (FVector(Orbit.GetAxis()) * local_79));
        FVector local_60_3 = (local_78 - Transform.GetPosition());
        if (!(local_60_3.IsZero()))
        {
            local_102.SetDeltaMovement(local_60_3);
            FRotator local_108;
            if (Orbit.GetbRotateToCircleTangentDir())
            {
                local_60_3 = (local_54.RotateAngleAxis(local_67_2, Orbit.GetAxis()) - local_54);
            }
            if (!(local_60_3.IsZero()))
            {
                local_108 = local_60_3.ToOrientationRotator();
                local_108.Roll = Transform.GetRotation().Rotator().Roll;
                local_102.SetNextRotation(FQuat4f(local_108.Quaternion()));
            }
        }
        Orbit.SetCurDistanceToCenter(local_71);
        if (local_11)
        {
            Remove local_64;
            MovementInfo.SetMoveTotalTime(FFPTime(0));
            local_64.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_TickFixedDurationMovement(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_FixedDurationMovementConfig &inout Config, const FC_FixedDurationMovementRuntime &inout Runtime, const FC_Transform &inout Transform) const
    {
        ::FMovementUtils::TickFixedDurationMovement(Entity, MovementInfo, Config.Data, Runtime, Transform);
        return;
    }
    UFUNCTION()
    void Job_TickFixedDurationMovementOverride(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_FixedDurationMovementOverride &inout Config, const FC_FixedDurationMovementRuntime &inout Runtime, const FC_Transform &inout Transform) const
    {
        ::FMovementUtils::TickFixedDurationMovement(Entity, MovementInfo, Config.GetData(), Runtime, Transform);
        return;
    }
    UFUNCTION()
    void Job_TickGravityFallingMovement(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_GravityFallingMovementRuntime &inout GravityFallingMovement) const
    {
        int local_16 = 0;
        float local_6 = (FFPTime(MovementInfo.GetMoveTime()) - MovementInfo.GetLastMoveTime()).ToSeconds();
        if (local_6 <= 0.0)
        {
            return;
        }
        FVector local_46 = FVector(MovementInfo.GetVelocity());
        FVector local_40_2 = (local_46 + ((FVector(0.0, 0.0, -980.0) * GravityFallingMovement.GetGravityScale()) * local_6));
        FVector local_28_2 = ((FVector(MovementInfo.GetVelocity()) + local_40_2) * local_6);
        local_16.SetDeltaMovement((local_28_2 * 0.5));
        return;
    }
    UFUNCTION()
    void Job_TickMovementByBBVar(const FECSEntity &inout Entity, const FC_MovementByBVar &inout MovementByBVar, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        int local_40 = 0;
        if (!(MovementByBVar.GetBBOwner().IsValid()))
        {
            return;
        }
        FVector local_20 = (MovementByBVar.GetBBOwner().GetBB_Vector(MovementByBVar.GetPositionBBVar()) - Transform.GetPosition());
        FRotator local_32 = MovementByBVar.GetBBOwner().GetBB_Rotator(MovementByBVar.GetRotationBBVar());
        if (local_20.IsZero() && (local_32 == Transform.GetRotation().Rotator()))
        {
            return;
        }
        local_40.SetDeltaMovement(local_20);
        if (!((local_32 == Transform.GetRotation().Rotator())))
        {
            local_40.SetNextRotation(FQuat4f(local_32.Quaternion()));
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateMovementVelocity(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo) const
    {
        Get local_4;
        const FC_DeltaMovement& local_6 = local_4.opCall();
        if (local_6)
        {
            float local_16 = (FFPTime(MovementInfo.GetMoveTime()) - MovementInfo.GetLastMoveTime()).ToSeconds();
            if (local_16 > 0.0)
            {
                MovementInfo.SetVelocity((local_6.GetDeltaMovement() / local_16));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateThrowPredictMovementVelocity(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_ThrowPredictPathKey &inout ThrowPredictPathKey) const
    {
        bool local_4;
        if ((int(ThrowPredictPathKey.GetKeyInfo().GetTargetType())) != 1)
        {
            local_4 = false;
        }
        else
        {
            Has local_8;
            local_4 = local_8.opCall();
        }
        if (local_4)
        {
            return;
        }
        Get local_14;
        const FC_DeltaMovement& local_16 = local_14.opCall();
        if (local_16)
        {
            float local_24 = (FFPTime(MovementInfo.GetMoveTime()) - MovementInfo.GetLastMoveTime()).ToSeconds();
            if (local_24 > (0.0))
            {
                MovementInfo.SetVelocity((local_16.GetDeltaMovement() / local_24));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_InitRotationByTime(const FECSEntity &inout Entity, const FC_RotationByTime &inout RotationByTime, const FCS_FixedTime &inout FixedTime) const
    {
        int local_12 = 0;
        float32 local_21;
        if (RotationByTime.StartTime >= 0.0f && (RotationByTime.EndTime > RotationByTime.StartTime || (RotationByTime.EndTime < 0.0f)))
        {
            local_12.SetRotationBeginTime((FFPTime(FixedTime.Time) + FFPTime(RotationByTime.StartTime)));
            if (RotationByTime.EndTime > 0.0f)
            {
                local_21 = RotationByTime.EndTime - RotationByTime.StartTime;
            }
            else
            {
                local_21 = -1.0f;
            }
            local_12.SetRotationTotalTime(FFPTime(local_21));
        }
        return;
    }
    UFUNCTION()
    void Job_TickRotationByTime(const FECSEntity &inout Entity, FC_RotationRuntimeInfo &inout RuntimeInfo, const FC_Transform &inout Transform, const FC_RotationByTime &inout RotationByTime, const FCS_FixedTime &inout FixedTime) const
    {
        int local_26 = 0;
        FFPTime local_6 = (FFPTime(FixedTime.LastTime) - RuntimeInfo.GetRotationBeginTime());
        FFPTime local_2 = (FFPTime(FixedTime.Time) - RuntimeInfo.GetRotationBeginTime());
        if (local_2.opCmp(0.0) > 0)
        {
            FFPTime local_14 = FFPTime(RuntimeInfo.GetRotationTotalTime());
            if (local_6.opCmp(0.0) < 0)
            {
                local_6 = 0;
            }
            if (local_14.opCmp(0.0) > 0 && (local_2.opCmp(local_14) > 0))
            {
                if (local_6.opCmp(local_14) >= 0)
                {
                    return;
                }
                local_2 = local_14;
            }
            float32 local_18 = RotationByTime.GetAngularVelocity(float32(local_6.ToSeconds()));
            float32 local_17 = RotationByTime.GetAngularVelocity(float32(local_2.ToSeconds()));
            if (local_26 && local_26.GetHasNextRotation())
            {
                float32 local_19 = FMath::DegreesToRadians((local_18 + local_17)) * 0.5f;
                RuntimeInfo.SetDeltaRotation(FQuat4f(local_26.GetNextRotation().RotateVector(RotationByTime.RotationAxis), local_19 * float32(((local_2 - local_6).ToSeconds()))));
            }
            else
            {
                FVector3f local_29 = FQuat4f(Transform.GetRotation()).RotateVector(RotationByTime.RotationAxis);
                float32 local_33 = FMath::DegreesToRadians((local_18 + local_17)) * 0.5f;
                float32 local_19_2 = float32(((local_2 - local_6).ToSeconds()));
                RuntimeInfo.SetDeltaRotation(FQuat4f(local_29, local_33 * local_19_2));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TickRotationWithDecreaseAngleVelocity(const FECSEntity &inout Entity, FC_RotationRuntimeInfo &inout RuntimeInfo, FC_RotationWithDecreaseAngleVelocity &inout RotationWithDecreaseAngleVelocity, const FCS_FixedTime &inout FixedTime) const
    {
        Remove local_16;
        if (!(RotationWithDecreaseAngleVelocity.GetbEnable()))
        {
            return;
        }
        if (RotationWithDecreaseAngleVelocity.GetAngleVelocity() > 0.0f)
        {
            RotationWithDecreaseAngleVelocity.SetAngleVelocity(RotationWithDecreaseAngleVelocity.GetAngleVelocity() - (RotationWithDecreaseAngleVelocity.GetDecreaseAngleVelocityRate() * float32(FixedTime.DeltaTime.ToSeconds())));
            if (RotationWithDecreaseAngleVelocity.GetAngleVelocity() > 0.0f)
            {
                RuntimeInfo.SetDeltaRotation(FQuat4f(RotationWithDecreaseAngleVelocity.GetRotationAxis(), FMath::DegreesToRadians(RotationWithDecreaseAngleVelocity.GetAngleVelocity() * float32(FixedTime.DeltaTime.ToSeconds()))));
            }
            else
            {
                local_16.opCall();
            }
            return;
        }
        local_16.opCall();
        return;
    }
    UFUNCTION()
    void Job_TickDeltaRotation(const FECSEntity &inout Entity, FC_RotationRuntimeInfo &inout RuntimeInfo, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        int local_16 = 0;
        FFPTime local_2 = FFPTime(RuntimeInfo.GetRotationTotalTime());
        if ((local_2.opCmp(0.0) < 0 || ((((FFPTime(FixedTime.Time) - RuntimeInfo.GetRotationBeginTime())).opCmp(RuntimeInfo.GetRotationTotalTime()) < 0))))
        {
            if (!(RuntimeInfo.GetDeltaRotation().IsIdentity(1e-8f)))
            {
                if (local_16.GetHasNextRotation())
                {
                    FQuat4f local_24 = (FQuat4f(RuntimeInfo.GetDeltaRotation()) * local_16.GetNextRotation());
                    local_16.SetNextRotation(local_24);
                }
                else
                {
                    local_16.SetNextRotation((FQuat4f(RuntimeInfo.GetDeltaRotation()) * FQuat4f(Transform.GetRotation())));
                }
            }
            return;
        }
        Remove local_32;
        local_32.opCall();
        return;
    }
    UFUNCTION()
    void Job_TickGroundMovement(const FECSEntity &inout Entity, FC_LifeTime &inout LifeTime, const FC_GroundMovementConfig &inout Config, const FC_MovementInfo &inout MovementInfo, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        ::FMovementUtils::TickGroundMovement(Entity, LifeTime, Config.Data, MovementInfo, Transform, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_TickGroundMovementOverride(const FECSEntity &inout Entity, FC_LifeTime &inout LifeTime, const FC_GroundMovementOverride &inout Config, const FC_MovementInfo &inout MovementInfo, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        ::FMovementUtils::TickGroundMovement(Entity, LifeTime, Config.GetData(), MovementInfo, Transform, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_TickAddtionalMovement(const FECSEntity &inout Entity, FC_MovementInfo &inout MovementInfo, const FC_AdditionalMovementConfig &inout Config, const FC_Transform &inout Transform) const
    {
        int local_16 = 0;
        if (Config.Data.IsEmpty())
        {
            return;
        }
        float local_6 = MovementInfo.GetMoveTime().ToSeconds();
        float local_4 = MovementInfo.GetLastMoveTime().ToSeconds();
        float local_8 = local_6 - local_4;
        if (local_8 <= 0.0)
        {
            return;
        }
        FVector local_22(FVector::ZeroVector);
        FVector local_28(FVector::ZeroVector);
        for (auto& local_42 : Config.Data)
        {
            FVector local_48;
            float local_10 = local_6 * local_42.CurveKeyScale;
            float local_50 = local_4 * local_42.CurveKeyScale;
            if (int(local_42.AdditionalMode) == 0)
            {
                local_48 = (local_42.Curve.GetValue(float32(local_10)) - local_42.Curve.GetValue(float32(local_50)));
            }
            else
            {
                if (int(local_42.AdditionalMode) == 1)
                {
                    local_48 = FMath::Lerp(local_42.Curve.GetValue(float32(local_50)), local_42.Curve.GetValue(float32(local_10)), 0.5);
                }
            }
            local_48 *= local_42.CurveValueScale;
            if (int(local_42.RotationMode) == 0)
            {
                if (local_16.GetHasNextRotation())
                {
                    local_48 = FQuat(local_16.GetNextRotation()).RotateVector(local_48);
                }
                else
                {
                    local_48 = Transform.GetRotation().RotateVector(local_48);
                }
            }
            else
            {
                if (int(local_42.RotationMode) == 1)
                {
                    bool local_1 = local_16.GetDeltaMovement().IsZero();
                    if (local_1)
                    {
                        local_48 = Transform.GetRotation().RotateVector(local_48);
                    }
                    else
                    {
                        local_48 = FQuat(local_16.GetDeltaMovement().ToOrientationQuat()).RotateVector(local_48);
                    }
                }
            }
            if (int(local_42.AdditionalMode) == 1)
            {
                FVector local_70 = (local_48 * local_8);
                local_28 += local_70;
                continue;
            }
            local_22 += local_48;
        }
        FVector local_64 = (MovementInfo.GetVelocity() + local_28);
        MovementInfo.SetVelocity(local_64);
        local_16.SetDeltaMovement((FVector(MovementInfo.GetVelocity()) * local_8));
        local_16.SetDeltaMovement((local_16.GetDeltaMovement() + local_22));
        if (Config.bRotateToMoveDir)
        {
            FRotator local_108 = local_16.GetDeltaMovement().ToOrientationRotator();
            if (local_16.GetHasNextRotation())
            {
                local_108.Roll = local_16.GetNextRotation().Rotator().Roll;
            }
            else
            {
                local_108.Roll = Transform.GetRotation().Rotator().Roll;
            }
            local_16.SetNextRotation(FQuat4f(local_108.Quaternion()));
        }
        return;
    }
    UFUNCTION()
    void Job_TickReletiveMovementEnableByTime(const FECSEntity &inout Entity, const FC_MovementInfo &inout MovementInfo, const FC_RelativeMovementEnableByTime &inout RelativeMovementEnableByTime) const
    {
        Has local_26;
        int local_34 = 0;
        int local_40 = 0;
        bool local_1 = false;
        for (auto& local_16 : RelativeMovementEnableByTime.GetTimeEnablePairs())
        {
            if (MovementInfo.GetMoveTime().opCmp(local_16.GetTime()) >= 0)
            {
                local_1 = local_16.GetbEnable();
                continue;
            }
            break;
        }
        if (local_1 && !(local_26.opCall()))
        {
            local_40.SetReletiveParentEntity(RelativeMovementEnableByTime.GetReletiveParentEntity());
            local_40.SetbMoveFollowParentRotation(RelativeMovementEnableByTime.GetbMoveFollowParentRotation());
            local_40.SetbDirectionFollowParentRotation(RelativeMovementEnableByTime.GetbDirectionFollowParentRotation());
            local_40.SetLastParentPos(local_34.GetPosition());
            local_40.SetLastParentRot(local_34.GetRotation());
            return;
        }
        bool local_2 = !(local_1);
        if (!(local_2))
        {
            local_2 = false;
        }
        else
        {
            local_2 = local_26.opCall();
        }
        if (local_2)
        {
            Remove local_44;
            local_44.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_TickReletiveMovement(const FECSEntity &inout Entity, FC_RelativeMovement &inout RelativeMovement, const FC_Transform &inout Transform) const
    {
        ModifyOrAdd local_78;
        if (RelativeMovement.GetReletiveParentEntity().IsValid())
        {
            Get local_6;
            const FC_Transform& local_8 = local_6.opCall();
            if (local_8)
            {
                FVector local_26 = (FVector(local_8.GetPosition()) - RelativeMovement.GetLastParentPos());
                if (RelativeMovement.GetbMoveFollowParentRotation() || RelativeMovement.GetbDirectionFollowParentRotation())
                {
                    FVector local_20 = (FVector(Transform.GetPosition()) - RelativeMovement.GetLastParentPos());
                    FQuat local_68 = (FQuat(local_8.GetRotation()) * RelativeMovement.GetLastParentRot().Inverse());
                    if (RelativeMovement.GetbMoveFollowParentRotation())
                    {
                        FVector local_34 = (local_68.RotateVector(local_20) - local_20);
                        local_26 += local_34;
                    }
                    if (RelativeMovement.GetbDirectionFollowParentRotation())
                    {
                        FQuat local_44 = (local_68 * Transform.GetRotation());
                        local_78.opCall().SetNextRotation(FQuat4f(local_44));
                    }
                }
                if (!(local_26.IsZero()))
                {
                    local_78.opCall().SetDeltaMovement(local_26);
                }
                RelativeMovement.SetLastParentPos(local_8.GetPosition());
                RelativeMovement.SetLastParentRot(local_8.GetRotation());
            }
        }
        return;
    }
    UFUNCTION()
    void Job_EntityHitColliderWithoutRealColliderBeforeTickESM(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_EntityHitCollider &inout EntityHitCollider, const FCS_FixedTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_EntityHitColliderWithRealColliderBeforeTickESM(const FECSEntity &inout Entity, const FC_Collision &inout Collision, const FC_Transform &inout Transform, FC_EntityHitCollider &inout EntityHitCollider, const FCS_FixedTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Run_Job_InitMovementInfo_DefaultReg() const
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
                this.Job_InitMovementInfo(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_MovementInfo> local_56;
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
            this.Job_InitMovementInfo(local_188, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_MovementInfo>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitMovementInfo_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_188 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_InitMovementInfo(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_MovementInfo> local_56;
                local_56.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_94).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_94.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_InitMovementInfo(local_188, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_MovementInfo>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateMovementInfoTime_DefaultReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_178 = 0;
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
                this.Job_UpdateMovementInfoTime(local_40, local_42, local_6);
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
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_40 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateMovementInfoTime(local_178, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateMovementInfoTime_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_UpdateMovementInfoTime(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        Exclude(local_88).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_40 = local_140.Proceed();
            ++local_106;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateMovementInfoTime(local_178, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitLinearMovement() const
    {
        int local_36 = 0;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_56;
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
                this.Job_InitLinearMovement(local_36, local_42, local_48);
                local_56.opCall(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
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
        Include local_114;
        local_114.opCall();
        Exclude(local_94).opCall();
        Exclude(local_94).opCall();
        Exclude(local_94).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_94.Iterator();
        for (; local_162.CanProceed;)
        {
            const FECSEntity& local_198 = local_162.Proceed();
            ++local_128;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_198.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_198);
            this.Job_InitLinearMovement(local_36, local_42, local_48);
            local_56.opCall(local_36);
        }
        local_2.UpdateCachedEntityCount(local_128);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateLinearMovement_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_UpdateLinearMovement(local_38, local_40, local_46, local_52);
                local_60.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_98.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_LinearMovementConfig> local_56 = FECSEntity::Get<FC_LinearMovementConfig>(local_38);
            this.Job_UpdateLinearMovement(local_200, local_40, local_46, local_52);
            local_60.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateLinearMovement_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_UpdateLinearMovement(local_38, local_40, local_46, local_52);
                local_60.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_98.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_LinearMovementConfig> local_56 = FECSEntity::Get<FC_LinearMovementConfig>(local_38);
            this.Job_UpdateLinearMovement(local_200, local_40, local_46, local_52);
            local_60.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateLinearMovementOverride_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_196 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_UpdateLinearMovementOverride(local_38, local_40, local_46, local_52);
                local_60.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_124 = 0;
        FECSRuntimeViewIterator local_158 = local_98.Iterator();
        for (; local_158.CanProceed;)
        {
            local_38 = local_158.Proceed();
            ++local_124;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_LinearMovementOverride> local_56 = FECSEntity::Get<FC_LinearMovementOverride>(local_38);
            this.Job_UpdateLinearMovementOverride(local_196, local_40, local_46, local_52);
            local_60.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_124);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateLinearMovementOverride_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_196 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_UpdateLinearMovementOverride(local_38, local_40, local_46, local_52);
                local_60.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_124 = 0;
        FECSRuntimeViewIterator local_158 = local_98.Iterator();
        for (; local_158.CanProceed;)
        {
            local_38 = local_158.Proceed();
            ++local_124;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_LinearMovementOverride> local_56 = FECSEntity::Get<FC_LinearMovementOverride>(local_38);
            this.Job_UpdateLinearMovementOverride(local_196, local_40, local_46, local_52);
            local_60.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_124);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitSimpleProjectileMove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSimpleProjectileMovementConfigOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitSimpleProjectileMove(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorSimpleProjectileMovementConfigOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_InitSimpleProjectileMove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitSimpleProjectileMoveLate() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSimpleProjectileMovementConfigOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitSimpleProjectileMoveLate(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorSimpleProjectileMovementConfigOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_InitSimpleProjectileMoveLate(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitSimpleProjectileMovementOverride() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSimpleProjectileMovementOverrideOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitSimpleProjectileMovementOverride(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorSimpleProjectileMovementOverrideOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_InitSimpleProjectileMovementOverride(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitThrowMovement() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorThrowMovementConfigOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitThrowMovement(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorThrowMovementConfigOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_InitThrowMovement(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitThrowMovementOverride() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorThrowMovementOverrideOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitThrowMovementOverride(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorThrowMovementOverrideOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_InitThrowMovementOverride(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitAutoCalcProjectileMovement() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_194 = 0;
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
                this.Job_InitAutoCalcProjectileMovement(local_36, local_38, local_44, local_50);
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
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_96.Iterator();
        for (; local_156.CanProceed;)
        {
            local_36 = local_156.Proceed();
            ++local_122;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitAutoCalcProjectileMovement(local_194, local_38, local_44, local_50);
            local_58.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_122);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickSimpleProjectileMovement_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickSimpleProjectileMovement(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_98.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickSimpleProjectileMovement(local_200, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickSimpleProjectileMovement_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickSimpleProjectileMovement(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_98.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickSimpleProjectileMovement(local_200, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickSimpleProjectileMovementOverride_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_196 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickSimpleProjectileMovementOverride(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_124 = 0;
        FECSRuntimeViewIterator local_158 = local_98.Iterator();
        for (; local_158.CanProceed;)
        {
            local_38 = local_158.Proceed();
            ++local_124;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickSimpleProjectileMovementOverride(local_196, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_124);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickSimpleProjectileMovementOverride_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_196 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickSimpleProjectileMovementOverride(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_124 = 0;
        FECSRuntimeViewIterator local_158 = local_98.Iterator();
        for (; local_158.CanProceed;)
        {
            local_38 = local_158.Proceed();
            ++local_124;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickSimpleProjectileMovementOverride(local_196, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_124);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickThrowMovement_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickThrowMovement(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_98.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickThrowMovement(local_200, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickThrowMovement_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickThrowMovement(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_98.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickThrowMovement(local_200, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickThrowMovementOverride_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_196 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickThrowMovementOverride(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_124 = 0;
        FECSRuntimeViewIterator local_158 = local_98.Iterator();
        for (; local_158.CanProceed;)
        {
            local_38 = local_158.Proceed();
            ++local_124;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickThrowMovementOverride(local_196, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_124);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickThrowMovementOverride_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_196 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickThrowMovementOverride(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_124 = 0;
        FECSRuntimeViewIterator local_158 = local_98.Iterator();
        for (; local_158.CanProceed;)
        {
            local_38 = local_158.Proceed();
            ++local_124;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickThrowMovementOverride(local_196, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_124);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCurveMovement_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickCurveMovement(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_98.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickCurveMovement(local_200, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCurveMovement_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickCurveMovement(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_98.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickCurveMovement(local_200, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCurveMovementOverride_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        MarkModifiedIfDirty local_64;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickCurveMovementOverride(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
                local_64.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_102 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Exclude(local_102).opCall();
        Exclude(local_102).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_102.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickCurveMovementOverride(local_200, local_40, local_46, local_52);
            local_60.opCall(local_40);
            local_64.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCurveMovementOverride_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        MarkModifiedIfDirty local_64;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickCurveMovementOverride(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
                local_64.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_102 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Exclude(local_102).opCall();
        Exclude(local_102).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_102.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickCurveMovementOverride(local_200, local_40, local_46, local_52);
            local_60.opCall(local_40);
            local_64.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCurveRotation_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickCurveRotation(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_98.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickCurveRotation(local_200, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCurveRotation_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickCurveRotation(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_98.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickCurveRotation(local_200, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCurveRotationOverride_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        MarkModifiedIfDirty local_64;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickCurveRotationOverride(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
                local_64.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_102 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Exclude(local_102).opCall();
        Exclude(local_102).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_102.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickCurveRotationOverride(local_200, local_40, local_46, local_52);
            local_60.opCall(local_40);
            local_64.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCurveRotationOverride_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        MarkModifiedIfDirty local_64;
        int local_200 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickCurveRotationOverride(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
                local_64.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_102 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Exclude(local_102).opCall();
        Exclude(local_102).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_102.Iterator();
        for (; local_162.CanProceed;)
        {
            local_38 = local_162.Proceed();
            ++local_128;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickCurveRotationOverride(local_200, local_40, local_46, local_52);
            local_60.opCall(local_40);
            local_64.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_128);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickTrackMovement_DefaultReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        MarkModifiedIfDirty local_72;
        int local_216 = 0;
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
                this.Job_TickTrackMovement(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
                local_72.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_110 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Exclude(local_110).opCall();
        Exclude(local_110).opCall();
        Exclude(local_110).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_144 = 0;
        FECSRuntimeViewIterator local_178 = local_110.Iterator();
        for (; local_178.CanProceed;)
        {
            local_40 = local_178.Proceed();
            ++local_144;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickTrackMovement(local_216, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
            local_72.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_144);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickTrackMovement_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        MarkModifiedIfDirty local_72;
        int local_216 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_TickTrackMovement(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
                local_72.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_110 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Exclude(local_110).opCall();
        Exclude(local_110).opCall();
        Exclude(local_110).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_144 = 0;
        FECSRuntimeViewIterator local_178 = local_110.Iterator();
        for (; local_178.CanProceed;)
        {
            local_40 = local_178.Proceed();
            ++local_144;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickTrackMovement(local_216, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
            local_72.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_144);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickTrackMovementOverride_DefaultReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        MarkModifiedIfDirty local_72;
        int local_212 = 0;
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
                this.Job_TickTrackMovementOverride(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
                local_72.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_110 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Exclude(local_110).opCall();
        Exclude(local_110).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_140 = 0;
        FECSRuntimeViewIterator local_174 = local_110.Iterator();
        for (; local_174.CanProceed;)
        {
            local_40 = local_174.Proceed();
            ++local_140;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickTrackMovementOverride(local_212, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
            local_72.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_140);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickTrackMovementOverride_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        MarkModifiedIfDirty local_72;
        int local_212 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_TickTrackMovementOverride(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
                local_72.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_110 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Exclude(local_110).opCall();
        Exclude(local_110).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_140 = 0;
        FECSRuntimeViewIterator local_174 = local_110.Iterator();
        for (; local_174.CanProceed;)
        {
            local_40 = local_174.Proceed();
            ++local_140;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickTrackMovementOverride(local_212, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
            local_72.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_140);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickOrbitMovement_DefaultReg() const
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
                this.Job_TickOrbitMovement(local_40, local_42, local_48, local_54, local_6);
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
            this.Job_TickOrbitMovement(local_202, local_42, local_48, local_54, local_6);
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
    UFUNCTION()
    void Run_Job_TickOrbitMovement_LocalReg() const
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
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_TickOrbitMovement(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_42);
                local_66.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_104 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
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
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_130 = 0;
        FECSRuntimeViewIterator local_164 = local_104.Iterator();
        for (; local_164.CanProceed;)
        {
            local_40 = local_164.Proceed();
            ++local_130;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickOrbitMovement(local_202, local_42, local_48, local_54, local_6);
            local_62.opCall(local_42);
            local_66.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_130);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickFixedDurationMovement_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        int local_58 = 0;
        MarkModifiedIfDirty local_66;
        int local_210 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickFixedDurationMovement(local_38, local_40, local_46, local_52, local_58);
                local_66.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
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
        Include local_124;
        local_124.opCall();
        Exclude(local_104).opCall();
        Exclude(local_104).opCall();
        Exclude(local_104).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_138 = 0;
        FECSRuntimeViewIterator local_172 = local_104.Iterator();
        for (; local_172.CanProceed;)
        {
            local_38 = local_172.Proceed();
            ++local_138;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_FixedDurationMovementRuntime> local_56 = FECSEntity::Get<FC_FixedDurationMovementRuntime>(local_38);
            this.Job_TickFixedDurationMovement(local_210, local_40, local_46, local_52, local_58);
            local_66.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_138);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickFixedDurationMovement_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        int local_58 = 0;
        MarkModifiedIfDirty local_66;
        int local_210 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickFixedDurationMovement(local_38, local_40, local_46, local_52, local_58);
                local_66.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_104 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Include local_124;
        local_124.opCall();
        Exclude(local_104).opCall();
        Exclude(local_104).opCall();
        Exclude(local_104).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_138 = 0;
        FECSRuntimeViewIterator local_172 = local_104.Iterator();
        for (; local_172.CanProceed;)
        {
            local_38 = local_172.Proceed();
            ++local_138;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_FixedDurationMovementRuntime> local_56 = FECSEntity::Get<FC_FixedDurationMovementRuntime>(local_38);
            this.Job_TickFixedDurationMovement(local_210, local_40, local_46, local_52, local_58);
            local_66.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_138);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickFixedDurationMovementOverride_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        int local_58 = 0;
        MarkModifiedIfDirty local_66;
        int local_206 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickFixedDurationMovementOverride(local_38, local_40, local_46, local_52, local_58);
                local_66.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
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
        Include local_124;
        local_124.opCall();
        Exclude(local_104).opCall();
        Exclude(local_104).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_134 = 0;
        FECSRuntimeViewIterator local_168 = local_104.Iterator();
        for (; local_168.CanProceed;)
        {
            local_38 = local_168.Proceed();
            ++local_134;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_FixedDurationMovementRuntime> local_56 = FECSEntity::Get<FC_FixedDurationMovementRuntime>(local_38);
            this.Job_TickFixedDurationMovementOverride(local_206, local_40, local_46, local_52, local_58);
            local_66.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_134);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickFixedDurationMovementOverride_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        int local_58 = 0;
        MarkModifiedIfDirty local_66;
        int local_206 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickFixedDurationMovementOverride(local_38, local_40, local_46, local_52, local_58);
                local_66.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_104 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Include local_124;
        local_124.opCall();
        Exclude(local_104).opCall();
        Exclude(local_104).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_134 = 0;
        FECSRuntimeViewIterator local_168 = local_104.Iterator();
        for (; local_168.CanProceed;)
        {
            local_38 = local_168.Proceed();
            ++local_134;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_FixedDurationMovementRuntime> local_56 = FECSEntity::Get<FC_FixedDurationMovementRuntime>(local_38);
            this.Job_TickFixedDurationMovementOverride(local_206, local_40, local_46, local_52, local_58);
            local_66.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_134);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickGravityFallingMovement_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_186 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickGravityFallingMovement(local_38, local_40, local_46);
                local_54.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
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
        Exclude(local_92).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_92.Iterator();
        for (; local_148.CanProceed;)
        {
            local_38 = local_148.Proceed();
            ++local_114;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_TickGravityFallingMovement(local_186, local_40, local_46);
            local_54.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickGravityFallingMovement_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_186 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickGravityFallingMovement(local_38, local_40, local_46);
                local_54.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        Exclude(local_92).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_92.Iterator();
        for (; local_148.CanProceed;)
        {
            local_38 = local_148.Proceed();
            ++local_114;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_TickGravityFallingMovement(local_186, local_40, local_46);
            local_54.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickMovementByBBVar_DefaultReg() const
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
                this.Job_TickMovementByBBVar(local_40, local_42, local_48, local_6);
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
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_90.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickMovementByBBVar(local_184, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickMovementByBBVar_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_TickMovementByBBVar(local_40, local_42, local_48, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        Exclude(local_90).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_90.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickMovementByBBVar(local_184, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateMovementVelocity_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_176 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_UpdateMovementVelocity(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        Exclude(local_86).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_86.Iterator();
        for (; local_138.CanProceed;)
        {
            local_38 = local_138.Proceed();
            ++local_104;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateMovementVelocity(local_176, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateMovementVelocity_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_176 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_UpdateMovementVelocity(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_86.Iterator();
        for (; local_138.CanProceed;)
        {
            local_38 = local_138.Proceed();
            ++local_104;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateMovementVelocity(local_176, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateThrowPredictMovementVelocity_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_182 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_UpdateThrowPredictMovementVelocity(local_38, local_40, local_46);
                local_54.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        local_100.opCall();
        Exclude(local_92).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_92.Iterator();
        for (; local_144.CanProceed;)
        {
            local_38 = local_144.Proceed();
            ++local_110;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateThrowPredictMovementVelocity(local_182, local_40, local_46);
            local_54.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateThrowPredictMovementVelocity_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_182 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_UpdateThrowPredictMovementVelocity(local_38, local_40, local_46);
                local_54.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        local_100.opCall();
        Exclude(local_92).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_92.Iterator();
        for (; local_144.CanProceed;)
        {
            local_38 = local_144.Proceed();
            ++local_110;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateThrowPredictMovementVelocity(local_182, local_40, local_46);
            local_54.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitRotationByTime_DefaultReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
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
                this.Job_InitRotationByTime(local_40, local_42, local_6);
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
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_InitRotationByTime(local_174, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitRotationByTime_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_InitRotationByTime(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_84).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_InitRotationByTime(local_174, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickRotationByTime_DefaultReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_198 = 0;
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
                this.Job_TickRotationByTime(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_100.Iterator();
        for (; local_160.CanProceed;)
        {
            local_40 = local_160.Proceed();
            ++local_126;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickRotationByTime(local_198, local_42, local_48, local_54, local_6);
            local_62.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_126);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickRotationByTime_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_198 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_TickRotationByTime(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        Exclude(local_100).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_100.Iterator();
        for (; local_160.CanProceed;)
        {
            local_40 = local_160.Proceed();
            ++local_126;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickRotationByTime(local_198, local_42, local_48, local_54, local_6);
            local_62.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_126);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickRotationWithDecreaseAngleVelocity_DefaultReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_60;
        int local_192 = 0;
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
                this.Job_TickRotationWithDecreaseAngleVelocity(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_RotationRuntimeInfo> local_56;
                local_56.opCall(local_42);
                local_60.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_120 = 0;
        FECSRuntimeViewIterator local_154 = local_98.Iterator();
        for (; local_154.CanProceed;)
        {
            local_40 = local_154.Proceed();
            ++local_120;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickRotationWithDecreaseAngleVelocity(local_192, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_RotationRuntimeInfo>(local_40).opCall(local_42);
            local_60.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_120);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickRotationWithDecreaseAngleVelocity_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_60;
        int local_192 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_TickRotationWithDecreaseAngleVelocity(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_RotationRuntimeInfo> local_56;
                local_56.opCall(local_42);
                local_60.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_120 = 0;
        FECSRuntimeViewIterator local_154 = local_98.Iterator();
        for (; local_154.CanProceed;)
        {
            local_40 = local_154.Proceed();
            ++local_120;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickRotationWithDecreaseAngleVelocity(local_192, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_RotationRuntimeInfo>(local_40).opCall(local_42);
            local_60.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_120);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickDeltaRotation_DefaultReg() const
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
                this.Job_TickDeltaRotation(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_RotationRuntimeInfo> local_56;
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
        Exclude(local_94).opCall();
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
            this.Job_TickDeltaRotation(local_188, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_RotationRuntimeInfo>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickDeltaRotation_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_188 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_TickDeltaRotation(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_RotationRuntimeInfo> local_56;
                local_56.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_94).opCall();
        Exclude(local_94).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_94.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickDeltaRotation(local_188, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_RotationRuntimeInfo>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickGroundMovement_DefaultReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_212 = 0;
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
                this.Job_TickGroundMovement(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
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
        Include local_126;
        local_126.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_140 = 0;
        FECSRuntimeViewIterator local_174 = local_106.Iterator();
        for (; local_174.CanProceed;)
        {
            local_40 = local_174.Proceed();
            ++local_140;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickGroundMovement(local_212, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_140);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickGroundMovement_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_212 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_TickGroundMovement(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_140 = 0;
        FECSRuntimeViewIterator local_174 = local_106.Iterator();
        for (; local_174.CanProceed;)
        {
            local_40 = local_174.Proceed();
            ++local_140;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickGroundMovement(local_212, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_140);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickGroundMovementOverride_DefaultReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_208 = 0;
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
                this.Job_TickGroundMovementOverride(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
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
        Include local_126;
        local_126.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_136 = 0;
        FECSRuntimeViewIterator local_170 = local_106.Iterator();
        for (; local_170.CanProceed;)
        {
            local_40 = local_170.Proceed();
            ++local_136;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickGroundMovementOverride(local_208, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_136);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickGroundMovementOverride_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_208 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_TickGroundMovementOverride(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_136 = 0;
        FECSRuntimeViewIterator local_170 = local_106.Iterator();
        for (; local_170.CanProceed;)
        {
            local_40 = local_170.Proceed();
            ++local_136;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickGroundMovementOverride(local_208, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_136);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickAddtionalMovement_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_196 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickAddtionalMovement(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_124 = 0;
        FECSRuntimeViewIterator local_158 = local_98.Iterator();
        for (; local_158.CanProceed;)
        {
            local_38 = local_158.Proceed();
            ++local_124;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickAddtionalMovement(local_196, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_124);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickAddtionalMovement_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_196 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickAddtionalMovement(local_38, local_40, local_46, local_52);
                local_60.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_124 = 0;
        FECSRuntimeViewIterator local_158 = local_98.Iterator();
        for (; local_158.CanProceed;)
        {
            local_38 = local_158.Proceed();
            ++local_124;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            FECSEntity::Get<FC_Transform> local_56 = FECSEntity::Get<FC_Transform>(local_38);
            this.Job_TickAddtionalMovement(local_196, local_40, local_46, local_52);
            local_60.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_124);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickReletiveMovementEnableByTime_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickReletiveMovementEnableByTime(local_38, local_40, local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_88).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_38 = local_140.Proceed();
            ++local_106;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_TickReletiveMovementEnableByTime(local_178, local_40, local_46);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickReletiveMovementEnableByTime_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickReletiveMovementEnableByTime(local_38, local_40, local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_88).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_38 = local_140.Proceed();
            ++local_106;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_TickReletiveMovementEnableByTime(local_178, local_40, local_46);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickReletiveMovement_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_182 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickReletiveMovement(local_38, local_40, local_46);
                local_54.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
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
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_92.Iterator();
        for (; local_144.CanProceed;)
        {
            local_38 = local_144.Proceed();
            ++local_110;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_TickReletiveMovement(local_182, local_40, local_46);
            local_54.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickReletiveMovement_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_182 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_TickReletiveMovement(local_38, local_40, local_46);
                local_54.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_92.Iterator();
        for (; local_144.CanProceed;)
        {
            local_38 = local_144.Proceed();
            ++local_110;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_TickReletiveMovement(local_182, local_40, local_46);
            local_54.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_EntityHitColliderWithoutRealColliderBeforeTickESM() const
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
                this.Job_EntityHitColliderWithoutRealColliderBeforeTickESM(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_EntityHitCollider> local_56;
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
            this.Job_EntityHitColliderWithoutRealColliderBeforeTickESM(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_EntityHitCollider>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_EntityHitColliderWithRealColliderBeforeTickESM() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_190 = 0;
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
                this.Job_EntityHitColliderWithRealColliderBeforeTickESM(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_118 = 0;
        FECSRuntimeViewIterator local_152 = local_100.Iterator();
        for (; local_152.CanProceed;)
        {
            local_40 = local_152.Proceed();
            ++local_118;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_EntityHitColliderWithRealColliderBeforeTickESM(local_190, local_42, local_48, local_54, local_6);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_118);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

