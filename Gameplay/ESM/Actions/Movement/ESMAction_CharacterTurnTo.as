
enum ECharacterTurnUpdateDirectionMode
{
    Free,
    LeftOnly,
    RightOnly,
    ByInit,
}

enum ECharacterTurnUpdateDirectionLimitedAction
{
    Lock,
    Mute,
    Exit,
}


struct FESMCharacterTurnToActionInstanceData
{
    UPROPERTY()
    FQuat InitRotation;
    UPROPERTY()
    FQuat TargetRotation = FQuat::Identity;
    UPROPERTY()
    FRotator InitDeltaRotator = FRotator::ZeroRotator;
    UPROPERTY()
    bool bDefaultTurnSilenced = false;
    UPROPERTY()
    bool bValid = true;


}

class UESMAction_CharacterTurnTo : UESMBPBaseSpanTickAction
{
    FVector2f DefaultAngleClampRange = FVector2f(-180.0f, 180.0f);
    UPROPERTY()
    ECharacterDirectionType TargetDirection = ECharacterDirectionType(6);
    UPROPERTY()
    FNameHandle_EntityBBVarVector WorldSpaceLocation;
    UPROPERTY()
    FNameHandle_EntityBBVarRotator WorldSpaceRotation;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity CustomEntity;
    UPROPERTY()
    FRotator RotationOffset;
    UPROPERTY()
    bool bUpdateTarget = false;
    UPROPERTY()
    float32 UpdateInterval = 0.0f;
    UPROPERTY()
    float32 FinishUpdateNormalizedTime = 1.0f;
    UPROPERTY()
    bool bDisableAdjustAngleWhenClose = false;
    UPROPERTY()
    bool bDisableLockTargetDirFallback = false;
    UPROPERTY()
    bool bDifferentMaxAngleForLeftAndRight = false;
    UPROPERTY()
    float32 MaxDeltaAngle = -1.0f;
    UPROPERTY()
    float32 MaxLeftAngle = 0.0f;
    UPROPERTY()
    float32 MaxRightAngle = 0.0f;
    UPROPERTY()
    bool bAllowPitch = false;
    UPROPERTY()
    FVector2f AngleClampRange = this.DefaultAngleClampRange;
    UPROPERTY()
    ECharacterTurnUpdateDirectionMode UpdateDirectionMode = ECharacterTurnUpdateDirectionMode(0);
    UPROPERTY()
    ECharacterTurnUpdateDirectionLimitedAction UpdateDirectionLimitedAction = ECharacterTurnUpdateDirectionLimitedAction(0);
    UPROPERTY()
    float32 TargetDirectionYawCalibration = 0.0f;
    UPROPERTY()
    float32 MaxAngularSpeed = -1.0f;
    UPROPERTY()
    bool bApplyCurve = false;
    UPROPERTY()
    bool bIgnoreSpan = false;
    UPROPERTY()
    FRuntimeFloatCurve Curve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMCharacterTurnToActionInstanceData);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void GetExtraTimeStamp_Implementation(TArray<FESMExtraTimeStamp> &inout OutTimeStamps) const
    {
        if ((this.bUpdateTarget && (int(this.NotifyType) == 1)))
        {
            FESMExtraTimeStamp local_10;
            if (this.FinishUpdateNormalizedTime < 1.0f)
            {
                local_10.ActionTime = FFPTime((this.GetDuration() * this.FinishUpdateNormalizedTime));
            }
            else
            {
                local_10.ActionTime = FFPTime(this.GetDuration());
                local_10.ActionTime.SetTicks((local_10.ActionTime.GetTicks() - 1));
            }
            OutTimeStamps.Add(local_10);
        }
        return;
    }
    UFUNCTION()
    void OnExtraTimeStampChanged_Implementation(const int Index, const FESMExtraTimeStamp &inout ChangedExtraTimeStamp)
    {
        if (Index == 0 && (int(this.NotifyType) == 1) && (this.GetDuration() > 0.0f))
        {
            this.FinishUpdateNormalizedTime = FMath::Clamp((ChangedExtraTimeStamp.ActionTime / this.GetDuration()), 0.0f, 1.0f);
        }
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_18 = 0;
        int local_66 = 0;
        Has local_4;
        Has local_10;
        if (!(local_4.opCall()) || !(local_10.opCall()))
        {
            return;
        }
        FESMCharacterTurnToActionInstanceData& local_20 = this.ModifyInstanceData(Context);
        local_20.InitRotation = local_18.GetRotation();
        bool local_21 = local_20.bValid;
        local_20.TargetRotation = this.GetTargetRotation(Context, local_18, local_20.InitRotation, Time.WorldTime, local_21);
        local_20.bValid = local_21;
        FECSDebugDraw::DrawDebugSphere(n"TurnTo", local_18.GetPosition(), 20.0f, 20, FColor::Red, FColor::Red, 5.0f, uint8(0), 2.0f);
        FECSDebugDraw::DrawDebugLine(n"TurnTo", local_18.GetPosition(), (FVector(local_18.GetPosition()) + (local_20.TargetRotation.GetForwardVector() * 100.0)), FColor::Red, FColor::Red, 5.0f, uint8(0), 2.0f);
        float32 local_59 = this.MaxDeltaAngle;
        if (this.bDifferentMaxAngleForLeftAndRight)
        {
            if (float32(local_20.InitRotation.GetRightVector().DotProduct(local_20.TargetRotation.GetForwardVector())) >= 0.0f)
            {
                local_59 = this.MaxRightAngle;
            }
            else
            {
                local_59 = this.MaxLeftAngle;
            }
        }
        if (local_59 == 0.0f)
        {
            local_20.TargetRotation = local_20.InitRotation;
        }
        else
        {
            if (local_59 > 0.0f)
            {
                local_20.TargetRotation = FMathUtils::MoveTowards(local_20.InitRotation, local_20.TargetRotation, 1.0f, local_59);
            }
        }
        local_66.SetSilenceDefaultTurnCounter((local_66.GetSilenceDefaultTurnCounter() + 1));
        local_20.bDefaultTurnSilenced = true;
        local_66.SetDesiredRotation(local_20.TargetRotation.Rotator());
        local_20.InitDeltaRotator = (FRotator(local_66.GetDesiredRotation()) - local_20.InitRotation.Rotator()).GetNormalized();
        if (!(this.bAllowPitch))
        {
            local_66.SetDesiredRotation(FRotator(0.0, local_66.GetDesiredRotation().Yaw, 0.0));
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        float32 local_55;
        int local_112 = 0;
        FESMCharacterTurnToActionInstanceData& local_2 = this.ModifyInstanceData(Context);
        bool local_3 = !(local_2.bValid);
        if (local_3 == !(false))
        {
            return;
        }
        FECSEntity::Get<FC_Transform> local_8 = FECSEntity::Get<FC_Transform>(Context.GetEntity());
        bool local_11 = this.bUpdateTarget;
        if (local_11 && (this.UpdateInterval > 0.0f))
        {
            if (int((Time.ActionLastTime.ToSeconds() / this.UpdateInterval)) == int((Time.ActionTime.ToSeconds() / this.UpdateInterval)))
            {
                local_11 = false;
            }
        }
        if (local_11 && (FFPTime(Time.ActionDuration).opCmp(0.0) > 0) && (this.FinishUpdateNormalizedTime < 1.0f))
        {
            if ((FFPTime(Time.ActionTime) / Time.ActionDuration) > this.FinishUpdateNormalizedTime)
            {
                local_11 = false;
            }
        }
        if (local_11)
        {
            bool local_23;
            local_23 = local_2.bValid;
            this.ModifyInstanceData(Context).TargetRotation = this.GetTargetRotation(Context, local_10, local_2.InitRotation, Time.WorldTime, local_23);
            local_2.bValid = local_23;
        }
        if (int(this.UpdateDirectionMode) == 2)
        {
            bool local_23;
            local_23 = true;
        }
        else
        {
            bool local_23;
            local_23 = int(this.UpdateDirectionMode) != 1 && (local_2.InitDeltaRotator.Yaw > 0.0);
        }
        FRotator local_46 = local_10.GetRotation().Rotator();
        FRotator local_52;
        if (FFPTime(Time.ActionDuration).opCmp(0.0) > 0 && !(this.bIgnoreSpan))
        {
            bool local_23;
            float32 local_13 = float32((FFPTime(Time.ActionTime) / Time.ActionDuration));
            if (this.bApplyCurve)
            {
                local_55 = this.Curve.GetFloatValue(local_13, 0.0f);
            }
            else
            {
                local_55 = local_13;
            }
            local_55 = FMath::Clamp(local_55, 0.0f, 1.0f);
            FRotator local_40 = local_2.TargetRotation.Rotator();
            FRotator local_62 = local_2.InitRotation.Rotator();
            FRotator local_80 = (local_40 - local_62).GetNormalized();
            if (((local_23 && (local_80.Yaw < 0.0)) && ((local_80.Yaw + 360.0) < 270.0)))
            {
                local_80.Yaw = (local_80.Yaw + 360.0);
            }
            else
            {
                if (!(local_23) && (local_80.Yaw > 0.0) && (((local_80.Yaw - 360.0) > -270.0)))
                {
                    local_80.Yaw = (local_80.Yaw - 360.0);
                }
            }
            local_52 = (local_62 + (local_80 * local_55));
        }
        else
        {
            local_52 = local_2.TargetRotation.Rotator();
        }
        bool local_85 = false;
        bool local_86 = false;
        if (int(this.UpdateDirectionMode) != 0)
        {
            bool local_23;
            bool local_3_3 = !((((local_52.Quaternion() * local_10.GetRotation().Inverse()).Rotator()).Yaw > 0.0));
            bool local_87 = !(local_23);
            if (local_3_3 != local_87)
            {
                local_85 = true;
                local_52 = local_46;
                switch (int(this.UpdateDirectionLimitedAction))
                {
                case 0:
                {
                    break;
                }
                case 1:
                {
                    local_86 = true;
                    break;
                }
                case 2:
                {
                    local_86 = true;
                    local_87 = false;
                    local_2.bValid = local_87;
                    break;
                }
                }
            }
        }
        if (!(this.bAllowPitch))
        {
            float local_18_3 = local_52.Yaw;
            local_52 = FRotator(0.0, local_18_3, 0.0);
        }
        if (!(local_85) && (this.MaxAngularSpeed > 0.0f))
        {
            local_52 = FMath::RInterpConstantShortestPathTo(local_46, local_52, float32(Time.ActionDeltaTime.ToSeconds()), this.MaxAngularSpeed);
        }
        if (!(local_86))
        {
            local_112.SetDesiredRotation(local_52);
            Context.GetEntity().MoveRotation(local_52.Quaternion(), FFPTime(-1));
        }
        bool local_3_4 = !(local_2.bDefaultTurnSilenced);
        if (local_3_4 == !(local_86))
        {
            local_112.SetSilenceDefaultTurnCounter(local_112.GetSilenceDefaultTurnCounter() - local_86 ? 1 : -1);
            bool local_3_5 = !(local_86);
            local_2.bDefaultTurnSilenced = local_3_5;
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FESMCharacterTurnToActionInstanceData& local_2;
        int local_10 = 0;
        if (local_2.bDefaultTurnSilenced)
        {
            local_10.SetSilenceDefaultTurnCounter((local_10.GetSilenceDefaultTurnCounter() - 1));
        }
        return;
    }
    FESMCharacterTurnToActionInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterTurnToActionInstanceData __r;
        return __r;
    }
    FESMCharacterTurnToActionInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterTurnToActionInstanceData __r;
        return __r;
    }
    FQuat GetTargetRotation(const FESMContext &inout Context, const FC_Transform &inout EntityTransform, const FQuat &inout InitRotation, const FFPTime &inout Time, bool &inout bUpdate) const
    {
        const FC_Transform& local_38;
        bool local_51;
        bool local_52;
        FRotator local_6;
        int local_54 = 0;
        switch (int(this.TargetDirection))
        {
        case 0:
        {
            local_6 = EntityTransform.GetRotation().Rotator();
            break;
        }
        case 4:
        {
                FNameHandle_EntityBBVarVector local_26;
            local_26;
            local_6 = (Context.GetEntity().GetBB_Vector(local_26) - local_38.GetPosition()).Rotation();
            break;
        }
        case 5:
        {
                FNameHandle_EntityBBVarRotator local_42;
            local_42;
            local_6 = Context.GetEntity().GetBB_Rotator(local_42);
            break;
        }
        case 8:
        {
            FECSEntity local_46 = Context.GetEntity().GetBB_Entity(this.CustomEntity);
            local_52 = false;
            local_51 = local_52;
            if (local_46.IsValid())
            {
                if (!(local_38))
                {
                    local_52 = false;
                }
                else
                {
                    local_52 = local_54;
                }
                if (local_52)
                {
                    local_6 = (FVector(local_38.GetPosition()) - local_54.GetPosition()).Rotation();
                    local_51 = true;
                }
            }
            if (!(local_51))
            {
                local_6 = EntityTransform.GetRotation().Rotator();
            }
            break;
        }
        case 9:
        {
            FECSEntity local_50 = Context.GetEntity().GetBB_Entity(this.CustomEntity);
            local_51 = false;
            if (local_50.IsValid())
            {
                Get local_36;
                local_38 = local_36.opCall();
                if (local_38)
                {
                    local_6 = (FQuat(local_38.GetRotation()) * this.RotationOffset.Quaternion()).Rotator();
                    local_51 = true;
                }
            }
            if (!(local_51))
            {
                local_6 = EntityTransform.GetRotation().Rotator();
            }
            break;
        }
        case 6:
        {
            Get local_94;
            const FC_FanShapeSoftLockRangeSearch& local_96 = local_94.opCall();
            if (local_96)
            {
                FVector local_32(FVector::ZeroVector);
                ::FLockTargetUtils::OnDisposeFanShapeSoftLockRangeSearch(Context.GetEntity(), local_96.GetFanShapeSoftLockRangeSearchAngle(), local_96.GetFindPointSmallestAngleRange(), Time, local_32);
                if (!((local_32 == FVector::ZeroVector)))
                {
                    FVector local_22_2 = (local_32 - local_54.GetPosition());
                    local_6 = local_22_2.Rotation();
                    break;
                }
                else
                {
                    if (local_96.GetbInFanShapeSoftLockRangeSearch())
                    {
                        if (local_96.GetbUseTransformForward())
                        {
                            this.TargetDirection = ECharacterDirectionType(0);
                        }
                        else
                        {
                            ECharacterDirectionType local_7 = ECharacterDirectionType(1);
                        }
                    }
                }
            }
            local_51 = false;
            local_6 = ::FCharacterDirectionUtils::GetTargetRotation(Context.GetEntity(), this.bAllowPitch, Time, local_51);
            if (this.bDisableLockTargetDirFallback && local_51)
            {
                local_6 = EntityTransform.GetRotation().Rotator();
                bUpdate = false;
            }
            if (this.bDisableAdjustAngleWhenClose && bUpdate)
            {
                GetDefaulted local_102;
                const FC_LockTarget& local_104 = local_102.opCall();
                if (local_104)
                {
                    if (local_104.GetbCachedValidLockTargetPosition())
                    {
                        bUpdate = local_104.IsEnableLockAdjust(Context.GetEntity());
                    }
                }
            }
            break;
        }
        case 1:
        case 2:
        case 3:
        case 7:
        default:
        {
            local_6 = ::FCharacterDirectionUtils::GetTargetRotation(Context.GetEntity(), ECharacterDirectionType(this.TargetDirection), this.bAllowPitch, Time);
            break;
        }
        }
        local_6.Roll = 0.0;
        if (!((this.AngleClampRange == this.DefaultAngleClampRange)))
        {
            float32 local_98 = float32(InitRotation.Rotator().Yaw);
            float32 local_109 = local_98 + this.AngleClampRange.Y;
            local_6.Yaw = FMath::ClampAngle(local_6.Yaw, (local_98 + this.AngleClampRange.X), local_109);
        }
        local_6.Yaw = (local_6.Yaw - this.TargetDirectionYawCalibration);
        return local_6.Quaternion();
    }
}

