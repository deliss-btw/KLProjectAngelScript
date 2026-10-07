

struct FESMCharacterCurveMovementInstanceData
{
    UPROPERTY()
    FVector DeltaMovement;

    FESMCharacterCurveMovementInstanceData()
    {
        return;
    }
}

class UESMAction_CharacterCurveMovementAction : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    ECharacterDirectionType DirectionType = ECharacterDirectionType(0);
    UPROPERTY()
    FRuntimeFloatCurve ForwardCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    FESMBBVar_Float ForwardDistScale = 1.0f;
    UPROPERTY()
    FNameHandle_EntityBBVarVector WorldSpaceLocation;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity CustomEntity;
    UPROPERTY()
    bool bApplyRightOffset = false;
    UPROPERTY()
    FRuntimeFloatCurve RightOffsetCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    bool bCopyForwardDistToRightOffsetDist = false;
    UPROPERTY()
    FESMBBVar_Float RightOffsetDistScale = 0.0f;
    UPROPERTY()
    FVector2D ForwardBlendInOut = FVector2D(0.1, 0.0);


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMCharacterCurveMovementInstanceData);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.bExclusive = true;
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (int(this.DirectionType) == 4)
        {
            FNameHandle_EntityBBVarVector local_24;
            const FECSEntity& local_6 = Context.GetEntity();
            FESMCharacterCurveMovementInstanceData& local_8 = this.ModifyInstanceData(Context);
            Has local_12;
            if (local_12.opCall() == false)
            {
                return;
            }
            local_24;
            local_8.DeltaMovement = (Context.GetEntity().GetBB_Vector(local_24) - 0.GetPosition());
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_14 = 0;
        float32 local_35 = 0.0f;
        float32 local_36 = 0.0f;
        int local_58 = 0;
        float32 local_89 = 0.0f;
        float32 local_90;
        float32 local_109;
        float32 local_110;
        float32 local_120;
        if (FFPTime(Time.ActionDuration).opCmp(0.0) <= 0)
        {
            return;
        }
        const FECSEntity& local_8 = Context.GetEntity();
        FVector local_20 = local_14.GetPosDelta();
        FVector local_26(FVector::ZeroVector);
        FVector local_32(FVector::ZeroVector);
        if (int(this.DirectionType) != 4)
        {
            FQuat local_44;
            if (int(this.DirectionType) == 8)
            {
                if (Context.GetEntity().GetBB_Entity(this.CustomEntity).IsValid())
                {
                    local_44 = (FVector(local_58.GetPosition()) - 0.GetPosition()).Rotation().Quaternion();
                }
            }
            else
            {
                local_44 = ::FCharacterDirectionUtils::GetTargetRotationQuat(Context.GetEntity(), this.DirectionType, false);
            }
            local_26 = (local_44.GetForwardVector() * local_36);
            if (this.bApplyRightOffset)
            {
                local_90 = this.bCopyForwardDistToRightOffsetDist ? local_36 : local_35;
                local_32 = (local_44.GetRightVector() * local_90);
            }
        }
        else
        {
            if (int(this.DirectionType) == 4)
            {
                Has local_94;
                if (!(local_94.opCall()) == !(false))
                {
                    return;
                }
                if (this.bApplyRightOffset)
                {
                    FVector local_108 = (local_26 == FVector::ZeroVector) ? local_58.GetRotation().GetRightVector() : local_26.Rotation().Quaternion().GetRightVector();
                    if (this.bCopyForwardDistToRightOffsetDist)
                    {
                        local_109 = float32(local_26.Size());
                    }
                    else
                    {
                        local_109 = local_89;
                    }
                    local_32 = (local_108 * local_109);
                }
            }
        }
        local_89 = float32((FFPTime(Time.ActionLastTime) / Time.ActionDuration));
        local_36 = float32((FFPTime(Time.ActionTime) / Time.ActionDuration));
        local_109 = this.ForwardCurve.GetFloatValue(local_89, 0.0f);
        local_35 = this.ForwardCurve.GetFloatValue(local_36, 0.0f) - local_109;
        float local_4_4 = local_35;
        FVector local_102 = (local_26 * local_4_4);
        local_20 += local_102;
        local_14.SetHorizontalWeight(1.0f);
        if (this.bApplyRightOffset)
        {
            float32 local_111 = this.ForwardCurve.GetFloatValue(local_89, 0.0f);
            local_4_4 = (this.ForwardCurve.GetFloatValue(local_36, 0.0f) - local_111);
            FVector local_66 = (local_32 * local_4_4);
            local_20 += local_66;
        }
        local_4_4 = 0.0;
        local_20.Z = 0.0;
        local_14.SetPosDelta(local_20);
        local_109 = float32(this.ForwardBlendInOut.X);
        float32 local_111_2 = float32(this.ForwardBlendInOut.Y);
        float32 local_112 = FMathUtils::InverseLerpPreferTo(Time.ActionTime, FFPTime(0), FFPTime(local_109));
        local_35 = FMathUtils::InverseLerpPreferTo(Time.ActionTime, Time.ActionDuration, (FFPTime(Time.ActionDuration) - FFPTime(local_111_2)));
        local_90 = local_112 * local_35;
        float32 local_115 = local_112 * local_35;
        if (local_90 > 0.0f)
        {
            local_120 = local_109 / local_90;
        }
        else
        {
            local_120 = 0.0f;
        }
        if (local_115 > 0.0f)
        {
            local_110 = local_109 / local_115;
        }
        else
        {
            local_110 = 0.0f;
        }
        local_14.SetHorizontalWeight(MathUtils::FMoveTowardsByDuration(local_14.GetHorizontalWeight(), local_90, float32(Time.ActionDeltaTime.ToSeconds()), local_120));
        local_14.SetYawWeight(MathUtils::FMoveTowardsByDuration(local_14.GetYawWeight(), local_115, float32(Time.ActionDeltaTime.ToSeconds()), local_110));
        return;
    }
    FESMCharacterCurveMovementInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterCurveMovementInstanceData __r;
        return __r;
    }
    FESMCharacterCurveMovementInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterCurveMovementInstanceData __r;
        return __r;
    }
}

