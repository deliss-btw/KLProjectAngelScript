
namespace FC_AnimSampleTrajectoryDeltaMoveRecorder
{
    const int InterpoHistoryLength = 30;
}
namespace __INTENRAL_FC_AnimSampleTrajectoryFromCurve_NS
{
    const TECSComponentDerivedPtr<FC_AnimSampleTrajectoryFromCurve> DerivedPtr = TECSComponentDerivedPtr<FC_AnimSampleTrajectoryFromCurve>();
    const FC_AnimSampleTrajectoryFromCurve DefaultValue = FC_AnimSampleTrajectoryFromCurve();
}
namespace __INTENRAL_FC_AniParamSampleTrajectory_NS
{
    const TECSComponentDerivedPtr<FC_AniParamSampleTrajectory> DerivedPtr = TECSComponentDerivedPtr<FC_AniParamSampleTrajectory>();
    const FC_AniParamSampleTrajectory DefaultValue = FC_AniParamSampleTrajectory();
}
namespace __INTENRAL_FC_AnimSampleTrajectoryDeltaMoveRecorder_NS
{
    const TECSComponentDerivedPtr<FC_AnimSampleTrajectoryDeltaMoveRecorder> DerivedPtr = TECSComponentDerivedPtr<FC_AnimSampleTrajectoryDeltaMoveRecorder>();
    const FC_AnimSampleTrajectoryDeltaMoveRecorder DefaultValue = FC_AnimSampleTrajectoryDeltaMoveRecorder();
}
namespace __INTENRAL_FC_AnimSampleTrajectoryBlendingOutTag_NS
{
    const TECSComponentDerivedPtr<FC_AnimSampleTrajectoryBlendingOutTag> DerivedPtr = TECSComponentDerivedPtr<FC_AnimSampleTrajectoryBlendingOutTag>();
    const FC_AnimSampleTrajectoryBlendingOutTag DefaultValue = FC_AnimSampleTrajectoryBlendingOutTag();
}
namespace __INTENRAL_FC_AnimSampleTrajectoryWeightBlending_NS
{
    const TECSComponentDerivedPtr<FC_AnimSampleTrajectoryWeightBlending> DerivedPtr = TECSComponentDerivedPtr<FC_AnimSampleTrajectoryWeightBlending>();
    const FC_AnimSampleTrajectoryWeightBlending DefaultValue = FC_AnimSampleTrajectoryWeightBlending();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_AniParamSampleTrajectoryRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FSampleTrajectoryData
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FVector m_AnimRootMotionDelta;
    UPROPERTY()
    float32 m_RearCurvature;
    UPROPERTY()
    float32 m_FrontCurvature;
    UPROPERTY()
    float32 m_MinRearTrajectoryRadius;
    UPROPERTY()
    float32 m_MinFrontTrajectoryRadius;
    UPROPERTY()
    float32 m_MoveDesiredYawWeight;
    UPROPERTY()
    FVector m_LookAtPoint;
    UPROPERTY()
    float32 m_MoveSpeed;
    UPROPERTY()
    float32 m_NormalizedRearCurvature;
    UPROPERTY()
    float32 m_NormalizedFrontCurvature;
    UPROPERTY()
    FVector2f m_HistoryCursor;

    FSampleTrajectoryData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSampleTrajectoryData(const FSampleTrajectoryData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSampleTrajectoryData opAssign(const FSampleTrajectoryData &inout Other)
    {
        FSampleTrajectoryData __r;
        this.SetAnimRootMotionDelta(Other.GetAnimRootMotionDelta());
        this.SetRearCurvature(Other.GetRearCurvature());
        this.SetFrontCurvature(Other.GetFrontCurvature());
        this.SetMinRearTrajectoryRadius(Other.GetMinRearTrajectoryRadius());
        this.SetMinFrontTrajectoryRadius(Other.GetMinFrontTrajectoryRadius());
        this.SetMoveDesiredYawWeight(Other.GetMoveDesiredYawWeight());
        this.SetLookAtPoint(Other.GetLookAtPoint());
        this.SetMoveSpeed(Other.GetMoveSpeed());
        this.SetNormalizedRearCurvature(Other.GetNormalizedRearCurvature());
        this.SetNormalizedFrontCurvature(Other.GetNormalizedFrontCurvature());
        this.SetHistoryCursor(Other.GetHistoryCursor());
        return __r;
    }
    void SampleTrajectory(const FECSEntity &inout Entity, const float32 TimeOffset)
    {
        int local_8 = 0;
        int local_14 = 0;
        float32 local_68;
        if (!((TimeOffset > 0.0f)))
        {
            return;
        }
        if (!(local_8))
        {
            return;
        }
        int local_15 = 1065353216;
        float32 local_16 = 0.0f;
        Get local_20;
        const FC_AIPredictedMovePath& local_22 = local_20.opCall();
        if (local_22)
        {
            FVector local_34 = local_22.NextDeltaTransform.GetLocation();
            FQuat local_52 = local_22.NextDeltaTransform.GetRotation();
            FVector local_28 = (local_34 - local_8.GetPosition());
            if (local_28.SizeSquared() >= 1.0)
            {
                local_16 = FMathUtils::EvalCurvature(local_28, this.GetRotation2D(local_52), true);
            }
        }
        else
        {
            FVector local_58 = FVector(local_14.GetLastMove(0));
            FVector local_28_2 = FVector(local_14.GetLastMove(1));
            if (local_58.SizeSquared() >= 1.0 && (local_28_2.SizeSquared() >= 1.0))
            {
                local_16 = FMathUtils::EvalMengerCurvature(local_28_2, local_58);
            }
        }
        this.SetFrontCurvature(FMath::Lerp(this.GetFrontCurvature(), local_16, 0.1f));
        if (local_16 != 0.0f && FECSDebugDraw::IsDebugKeyEnabled(n"SampleTrajectory"))
        {
            FColor local_89;
            Get local_76;
            float32 local_1 = 1.0f / local_16;
            local_68 = local_76.opCall().GetShape().GetHalfHeight();
            FVector local_88 = FVector(local_8.GetPosition());
            FVector local_34_2 = (local_88 + (this.GetRotation2D(local_8.GetRotation()).GetRightVector() * local_1));
            FVector local_82_2 = (FVector(FVector::UpVector) * local_68);
            FVector local_88_2 = (local_34_2 - local_82_2);
            if (ECS::GetRuntimeInfo().IsServer)
            {
            }
            else
            {
            }
            FECSDebugDraw::DrawDebugSphere(n"SampleTrajectory", local_88_2, local_1, 30, local_89, local_89, -1.0f, uint8(0), 0.0f);
        }
        local_68 = 0.0f;
        if (local_14.HasEnoughRecords())
        {
            FVector local_28_3 = FVector(local_14.GetLastMove(0));
            FVector local_58_2 = FVector(local_14.GetTotalMove());
            if (local_28_3.SizeSquared() >= 1.0 && (local_58_2.SizeSquared() >= 1.0))
            {
                local_68 = FMathUtils::EvalMengerCurvature(local_58_2, local_28_3);
            }
        }
        this.SetRearCurvature(FMath::Lerp(this.GetRearCurvature(), local_68, 0.1f));
        if (local_68 != 0.0f && FECSDebugDraw::IsDebugKeyEnabled(n"SampleTrajectory"))
        {
            FColor local_89;
            Get local_76;
            float32 local_71 = 1.0f / local_68;
            float32 local_70 = local_76.opCall().GetShape().GetHalfHeight();
            FVector local_34_3 = FVector(local_8.GetPosition());
            FVector local_82_3 = (this.GetRotation2D(local_8.GetRotation()).GetRightVector() * local_71);
            FVector local_88_3 = (local_34_3 + local_82_3);
            FVector local_82_4 = (FVector(FVector::UpVector) * local_70);
            FVector local_34_4 = (local_88_3 - local_82_4);
            if (ECS::GetRuntimeInfo().IsServer)
            {
            }
            else
            {
            }
            FECSDebugDraw::DrawDebugSphere(n"SampleTrajectory", local_34_4, local_71, 30, local_89, local_89, -1.0f, uint8(0), 0.0f);
        }
        this.UpdateMinTrajectoryRadius(Entity);
        this.UpdateLookAtPoint(Entity);
        this.UpdateMoveSpeed(Entity);
        this.UpdateNormalizedCurvature();
        this.SetHistoryCursor(FVector2f(local_14.GetFrontIndex(), local_14.GetBackIndex()));
        return;
    }
    FQuat GetRotation2D(const FQuat &inout Rotation) const
    {
        return Rotation.GetForwardVector().NewZ(0.0).ToOrientationQuat();
    }
    void SampleTrajectoryFromCurve(const FECSEntity &inout Entity, const FName &inout RearCurvatureCurve, const FName &inout FrontCurvatureCurve, const bool bSampleExitValue = false)
    {
        this.SetFrontCurvature(FAnimUtils::SampleAnimCurveManually(Entity, FrontCurvatureCurve, bSampleExitValue));
        this.SetRearCurvature(FAnimUtils::SampleAnimCurveManually(Entity, RearCurvatureCurve, bSampleExitValue));
        this.UpdateMinTrajectoryRadius(Entity);
        this.UpdateLookAtPoint(Entity);
        this.UpdateMoveSpeed(Entity);
        this.UpdateNormalizedCurvature();
        this.SetHistoryCursor(FVector2f::ZeroVector);
        return;
    }
    void UpdateMinTrajectoryRadius(const FECSEntity &inout Entity)
    {
        FC_SampleTrajectoryConfig local_6;
        this.SetMinRearTrajectoryRadius(local_6.MinRearTrajectoryRadius);
        this.SetMinFrontTrajectoryRadius(local_6.MinFrontTrajectoryRadius);
        return;
    }
    void UpdateLookAtPoint(const FECSEntity &inout Entity)
    {
        FC_SampleTrajectoryConfig local_6;
        float32 local_7 = local_6.BaseArcLengthForLookAt;
        float32 local_9 = local_6.ExtraInputLengthForLookAt;
        FTransform local_64 = FTransformUtils::GetTransform(Entity, FFPTime(-1));
        FVector local_76 = local_64.GetLocation();
        FQuat local_92 = local_64.GetRotation();
        FVector local_70 = local_92.GetForwardVector();
        FVector local_98 = local_92.GetRightVector();
        FVector local_104 = local_92.GetUpVector();
        GetDefaulted local_120;
        FVector local_128 = (local_76 - (local_104 * local_120.opCall().GetScaledHalfHeight()));
        FVector local_134 = local_70;
        Get local_138;
        const FC_CharacterMovementControl& local_140 = local_138.opCall();
        if (local_140)
        {
            if (!(local_140.GetMovementInput().IsNearlyZero(9.999999747378752e-5)))
            {
                local_134 = local_140.GetMovementInput().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                if (((!(FMath::IsNearlyZero(this.GetFrontCurvature(), 1e-8f))) && ((local_70.CrossProduct(local_134).Z * this.GetFrontCurvature()) > 0.0)))
                {
                    FQuat local_84 = FQuat::FindBetween(local_70, local_134);
                    FVector local_110_2 = (local_98 * (1.0f / this.GetFrontCurvature()));
                    FVector local_116 = (local_84.RotateVector(local_110_2.opNeg()) + local_110_2);
                    local_128 += local_116;
                }
            }
        }
        else
        {
            if (FMath::IsNearlyZero(this.GetFrontCurvature(), 1e-8f))
            {
                FVector local_116_2 = (local_70 * local_7);
                local_128 += local_116_2;
            }
            else
            {
                float32 local_8 = 1.0f / this.GetFrontCurvature();
                float32 local_142 = local_7 * this.GetFrontCurvature();
                float local_122_3 = (local_8 * FMath::Sin(local_142));
                FVector local_164 = (local_70 * local_122_3);
                local_128 += local_164;
                FVector local_116_3 = (local_98 * (local_8 * (1.0f - FMath::Cos(local_142))));
                local_128 += local_116_3;
            }
            local_134 = (local_128 - local_76).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        }
        FVector local_116_4 = (local_134 * local_9);
        FVector local_164_2 = (local_128 + local_116_4);
        FVector local_110_3 = (local_104 * local_6.HeightForLookAt);
        this.SetLookAtPoint((local_164_2 + local_110_3));
        if (FECSDebugDraw::IsDebugKeyEnabled(n"SampleTrajectory"))
        {
            FECSDebugDraw::DrawDebugSphere(n"SampleTrajectory", local_128, 10.0f, 30, FColor::Green, FColor::Green, -1.0f, uint8(0), 0.0f);
            FECSDebugDraw::DrawDebugDirectionalArrow(n"SampleTrajectory", local_128, local_164_2, 10.0f, FColor::Green, FColor::Green, -1.0f, uint8(0), 0.0f);
            FECSDebugDraw::DrawDebugDirectionalArrow(n"SampleTrajectory", local_164_2, this.GetLookAtPoint(), 10.0f, FColor::Red, FColor::Red, -1.0f, uint8(0), 0.0f);
        }
        return;
    }
    void UpdateMoveSpeed(const FECSEntity &inout Entity)
    {
        int local_6 = 0;
        float local_12;
        if (local_6)
        {
            local_12 = local_6.GetVelocity().Size();
        }
        else
        {
            local_12 = 0.0;
        }
        this.SetMoveSpeed(float32(local_12));
        return;
    }
    void UpdateNormalizedCurvature()
    {
        this.SetNormalizedRearCurvature(::FSampleTrajectoryData::GetNormalizedCurvature(this.GetRearCurvature(), this.GetMinRearTrajectoryRadius()));
        this.SetNormalizedFrontCurvature(::FSampleTrajectoryData::GetNormalizedCurvature(this.GetFrontCurvature(), this.GetMinFrontTrajectoryRadius()));
        return;
    }
    void RecordMoveInfo(const FECSEntity &inout Entity, const float32 TimeOffset)
    {
        this.SetAnimRootMotionDelta(FVector::ZeroVector);
        FVector3f local_3 = FVector3f(FVector3f::ZeroVector);
        Get local_8;
        const FC_RootMotion& local_10 = local_8.opCall();
        if (local_10)
        {
            this.SetAnimRootMotionDelta(local_10.PosDelta);
            GetDefaulted local_24;
            local_3 = FVector3f((FQuat(local_24.opCall().GetRotation()) * local_10.PosDelta));
        }
        Get local_38;
        const FC_CharacterMovementControl& local_40 = local_38.opCall();
        if (local_40)
        {
            local_3 = FVector3f((FVector(local_40.GetInternalVelocity()) * FECSWorld::FixedFrameInterval.ToSeconds()));
        }
        ModifyOrAdd local_52;
        FC_AnimSampleTrajectoryDeltaMoveRecorder& local_54 = local_52.opCall();
        if (local_54)
        {
            if (local_3.IsNearlyZero(0.0001f))
            {
                if (local_54.Num() > 0)
                {
                    local_54.EraseLastMove();
                }
                return;
            }
            local_54.Record(local_3, TimeOffset);
        }
        return;
    }
    bool EraseMoveInfo(const FECSEntity &inout Entity) const
    {
        Modify local_4;
        FC_AnimSampleTrajectoryDeltaMoveRecorder& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.Num() > 0)
            {
                local_6.EraseLastMove();
                return true;
            }
        }
        return false;
    }
    TArray<FVector> BuildHistoryMovesFromBuffer(const FC_AnimSampleTrajectoryDeltaMoveRecorder &inout Recorder) const
    {
        TArray<FVector> local_4;
        int local_6 = Recorder.GetHistoryMoveBuffer().Num();
        if (local_6 <= 0)
        {
            return local_4;
        }
        float32 local_8 = this.GetHistoryCursor().X;
        float32 local_10 = this.GetHistoryCursor().Y;
        float32 local_9 = local_10 - local_8;
        if (local_9 <= 1e-8f)
        {
            return local_4;
        }
        int local_5 = Recorder.GetMaxHistoryWindow();
        if ((local_5 > 0 && (((local_10 - local_8) > local_5))))
        {
            local_8 = local_10 - local_5;
        }
        int local_15 = FMath::FloorToInt(local_8);
        int local_17 = (FMath::CeilToInt(local_10) - 1);
        for (; local_17 >= local_15; --local_17)
        {
            float32 local_11_2 = FMath::Max(local_17, local_8);
            float32 local_18 = (local_17 + 1);
            local_18 = FMath::Min(local_18, local_10) - local_11_2;
            if (local_18 <= 1e-8f)
            {
                continue;
            }
            local_4.Add((FVector(Recorder.GetHistoryMoveBuffer()[(((local_17 % local_6) + local_6) % local_6)]) * local_18));
        }
        return local_4;
    }
    const FVector GetAnimRootMotionDelta() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_AnimRootMotionDelta() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAnimRootMotionDelta(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AnimRootMotionDelta = __Value;
        return;
    }
    float32 GetRearCurvature() const property
    {
        return this.m_RearCurvature;
    }
    void SetRearCurvature(const float32 __Value) property
    {
        if (this.m_RearCurvature == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RearCurvature = __Value;
        return;
    }
    float32 GetFrontCurvature() const property
    {
        return this.m_FrontCurvature;
    }
    void SetFrontCurvature(const float32 __Value) property
    {
        if (this.m_FrontCurvature == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_FrontCurvature = __Value;
        return;
    }
    float32 GetMinRearTrajectoryRadius() const property
    {
        return this.m_MinRearTrajectoryRadius;
    }
    void SetMinRearTrajectoryRadius(const float32 __Value) property
    {
        if (this.m_MinRearTrajectoryRadius == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_MinRearTrajectoryRadius = __Value;
        return;
    }
    float32 GetMinFrontTrajectoryRadius() const property
    {
        return this.m_MinFrontTrajectoryRadius;
    }
    void SetMinFrontTrajectoryRadius(const float32 __Value) property
    {
        if (this.m_MinFrontTrajectoryRadius == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_MinFrontTrajectoryRadius = __Value;
        return;
    }
    float32 GetMoveDesiredYawWeight() const property
    {
        return this.m_MoveDesiredYawWeight;
    }
    void SetMoveDesiredYawWeight(const float32 __Value) property
    {
        if (this.m_MoveDesiredYawWeight == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_MoveDesiredYawWeight = __Value;
        return;
    }
    const FVector GetLookAtPoint() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LookAtPoint() property
    {
        FVector __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetLookAtPoint(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_LookAtPoint = __Value;
        return;
    }
    float32 GetMoveSpeed() const property
    {
        return this.m_MoveSpeed;
    }
    void SetMoveSpeed(const float32 __Value) property
    {
        if (this.m_MoveSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_MoveSpeed = __Value;
        return;
    }
    float32 GetNormalizedRearCurvature() const property
    {
        return this.m_NormalizedRearCurvature;
    }
    void SetNormalizedRearCurvature(const float32 __Value) property
    {
        this.m_NormalizedRearCurvature = __Value;
        return;
    }
    float32 GetNormalizedFrontCurvature() const property
    {
        return this.m_NormalizedFrontCurvature;
    }
    void SetNormalizedFrontCurvature(const float32 __Value) property
    {
        this.m_NormalizedFrontCurvature = __Value;
        return;
    }
    const FVector2f GetHistoryCursor() const property
    {
        const FVector2f __r;
        return __r;
    }
    FVector2f GetModify_HistoryCursor() property
    {
        FVector2f __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetHistoryCursor(const FVector2f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_HistoryCursor = __Value;
        return;
    }
}

struct FC_AnimSampleTrajectoryFromCurve : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bDoSample;
    UPROPERTY()
    bool m_bExpired;
    UPROPERTY()
    FName m_RearCurvatureCurve;
    UPROPERTY()
    FName m_FrontCurvatureCurve;

    FC_AnimSampleTrajectoryFromCurve()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimSampleTrajectoryFromCurve(const FC_AnimSampleTrajectoryFromCurve &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimSampleTrajectoryFromCurve opAssign(const FC_AnimSampleTrajectoryFromCurve &inout Other)
    {
        FC_AnimSampleTrajectoryFromCurve __r;
        this.SetbDoSample(Other.GetbDoSample());
        this.SetbExpired(Other.GetbExpired());
        this.SetRearCurvatureCurve(Other.GetRearCurvatureCurve());
        this.SetFrontCurvatureCurve(Other.GetFrontCurvatureCurve());
        return __r;
    }
    bool GetbDoSample() const property
    {
        return this.m_bDoSample;
    }
    void SetbDoSample(const bool __Value) property
    {
        if (!(this.m_bDoSample) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bDoSample = __Value;
        return;
    }
    bool GetbExpired() const property
    {
        return this.m_bExpired;
    }
    void SetbExpired(const bool __Value) property
    {
        if (!(this.m_bExpired) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bExpired = __Value;
        return;
    }
    FName GetRearCurvatureCurve() const property
    {
        return this.m_RearCurvatureCurve;
    }
    void SetRearCurvatureCurve(const FName &inout __Value) property
    {
        if ((this.m_RearCurvatureCurve == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RearCurvatureCurve = __Value;
        return;
    }
    FName GetFrontCurvatureCurve() const property
    {
        return this.m_FrontCurvatureCurve;
    }
    void SetFrontCurvatureCurve(const FName &inout __Value) property
    {
        if ((this.m_FrontCurvatureCurve == __Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_FrontCurvatureCurve = __Value;
        return;
    }
}

struct FC_AniParamSampleTrajectory : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    float32 m_Weight;
    UPROPERTY()
    FSampleTrajectoryData m_Data;
    UPROPERTY()
    float32 m_TimeOffset;
    UPROPERTY()
    FAnimFloatStack m_TimeOffsetStack;

    FC_AniParamSampleTrajectory()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AniParamSampleTrajectory(const FC_AniParamSampleTrajectory &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AniParamSampleTrajectory opAssign(const FC_AniParamSampleTrajectory &inout Other)
    {
        FC_AniParamSampleTrajectory __r;
        this.SetWeight(Other.GetWeight());
        this.SetData(Other.GetData());
        this.SetTimeOffset(Other.GetTimeOffset());
        this.SetTimeOffsetStack(Other.GetTimeOffsetStack());
        return __r;
    }
    float32 GetWeight() const property
    {
        return this.m_Weight;
    }
    void SetWeight(const float32 __Value) property
    {
        if (this.m_Weight == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Weight = __Value;
        return;
    }
    const FSampleTrajectoryData GetData() const property
    {
        const FSampleTrajectoryData __r;
        return __r;
    }
    FSampleTrajectoryData GetData() property
    {
        FSampleTrajectoryData __r;
        return __r;
    }
    void SetData(const FSampleTrajectoryData &inout __Value) property
    {
        this.m_Data = __Value;
        return;
    }
    float32 GetTimeOffset() const property
    {
        return this.m_TimeOffset;
    }
    void SetTimeOffset(const float32 __Value) property
    {
        if (this.m_TimeOffset == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_TimeOffset = __Value;
        return;
    }
    const FAnimFloatStack GetTimeOffsetStack() const property
    {
        const FAnimFloatStack __r;
        return __r;
    }
    FAnimFloatStack GetTimeOffsetStack() property
    {
        FAnimFloatStack __r;
        return __r;
    }
    void SetTimeOffsetStack(const FAnimFloatStack &inout __Value) property
    {
        return;
    }
}

struct FC_AnimSampleTrajectoryDeltaMoveRecorder : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_FrontIndex;
    UPROPERTY()
    int m_BackIndex;
    UPROPERTY()
    TArray<FVector3f> m_HistoryMoveBuffer;

    FC_AnimSampleTrajectoryDeltaMoveRecorder()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimSampleTrajectoryDeltaMoveRecorder(const FC_AnimSampleTrajectoryDeltaMoveRecorder &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimSampleTrajectoryDeltaMoveRecorder opAssign(const FC_AnimSampleTrajectoryDeltaMoveRecorder &inout Other)
    {
        FC_AnimSampleTrajectoryDeltaMoveRecorder __r;
        this.SetFrontIndex(Other.GetFrontIndex());
        this.SetBackIndex(Other.GetBackIndex());
        this.SetHistoryMoveBuffer(Other.GetHistoryMoveBuffer());
        return __r;
    }
    int GetMaxHistoryWindow() const
    {
        return FMath::Max((this.GetHistoryMoveBuffer().Num() - 30), 0);
    }
    void Reset()
    {
        this.SetFrontIndex(0);
        this.SetBackIndex(0);
        this.GetModify_HistoryMoveBuffer().Reset(0);
        return;
    }
    int Num() const
    {
        return (this.GetBackIndex() - this.GetFrontIndex());
    }
    void Record(const FVector3f &inout DeltaMove, const float32 TimeOffset)
    {
        int local_7 = FMath::CeilToInt((TimeOffset / FECSWorld::FixedFrameInterval.ToSeconds()));
        if (local_7 <= 0)
        {
            this.Reset();
            return;
        }
        int local_1 = local_7 + 30;
        int local_9 = this.GetHistoryMoveBuffer().Num();
        if (local_9 < local_1)
        {
            this.ResizeBufferKeepValidRecords(local_1);
        }
        int local_9_2 = this.GetHistoryMoveBuffer().Num();
        if ((local_9_2 - this.Num()) <= 30)
        {
            this.EraseLastMove();
        }
        this.GetModify_HistoryMoveBuffer()[(this.GetBackIndex() % local_9_2)] = DeltaMove;
        this.SetBackIndex((this.GetBackIndex() + 1));
        return;
    }
    void ResizeBufferKeepValidRecords(const int FrameCount)
    {
        int local_4;
        int local_3 = FMath::Min(this.Num(), FrameCount);
        local_4 = this.GetFrontIndex();
        int local_1 = this.GetHistoryMoveBuffer().Num();
        TArray<FVector3f> local_10 = this.GetHistoryMoveBuffer();
        this.GetModify_HistoryMoveBuffer().SetNum(FrameCount);
        if ((local_3 > 0 && (local_1 > 0)))
        {
            int local_13 = 0;
            for (; local_13 < local_3; )
            {
                int local_5 = (local_4 + local_13) % local_1;
                int local_14 = (local_4 + local_13) % FrameCount;
                this.GetModify_HistoryMoveBuffer()[local_14] = local_10[local_5];
                ++local_13;
            }
        }
        return;
    }
    void EraseLastMove()
    {
        this.SetFrontIndex((this.GetFrontIndex() + 1));
        int local_2 = this.GetHistoryMoveBuffer().Num();
        if (this.GetFrontIndex() >= local_2)
        {
            this.SetFrontIndex(this.GetFrontIndex() - local_2);
            this.SetBackIndex(this.GetBackIndex() - local_2);
        }
        return;
    }
    bool HasEnoughRecords() const
    {
        int local_2 = this.GetMaxHistoryWindow();
        return local_2 > 0 && (this.Num() > (local_2 * 0.5f));
    }
    FVector3f GetTotalMove() const
    {
        FVector3f local_3 = FVector3f(FVector3f::ZeroVector);
        int local_5 = this.GetHistoryMoveBuffer().Num();
        int local_6 = 0;
        for (; local_6 < this.Num(); )
        {
            local_3 += this.GetHistoryMoveBuffer()[((this.GetFrontIndex() + local_6) % local_5)];
            ++local_6;
        }
        return local_3;
    }
    FVector3f GetLastMove(const int Last = 0) const
    {
        if (Last < 0 || ((Last >= this.Num())))
        {
            return FVector3f::ZeroVector;
        }
        int local_1 = this.GetHistoryMoveBuffer().Num();
        return this.GetHistoryMoveBuffer()[((((this.GetBackIndex() + local_1) - 1) - Last) % local_1)];
    }
    int GetFrontIndex() const property
    {
        return this.m_FrontIndex;
    }
    void SetFrontIndex(const int __Value) property
    {
        if (this.m_FrontIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FrontIndex = __Value;
        return;
    }
    int GetBackIndex() const property
    {
        return this.m_BackIndex;
    }
    void SetBackIndex(const int __Value) property
    {
        if (this.m_BackIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_BackIndex = __Value;
        return;
    }
    const TArray<FVector3f> GetHistoryMoveBuffer() const property
    {
        const TArray<FVector3f> __r;
        return __r;
    }
    TArray<FVector3f> GetModify_HistoryMoveBuffer() property
    {
        TArray<FVector3f> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetHistoryMoveBuffer(const TArray<FVector3f> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_HistoryMoveBuffer = __Value;
        return;
    }
}

struct FC_AnimSampleTrajectoryBlendingOutTag : FECSComponent
{
    FC_AnimSampleTrajectoryBlendingOutTag()
    {
        return;
    }
}

struct FC_AnimSampleTrajectoryWeightBlending : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_WeightBlendRate;

    FC_AnimSampleTrajectoryWeightBlending()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimSampleTrajectoryWeightBlending(const FC_AnimSampleTrajectoryWeightBlending &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_AnimSampleTrajectoryWeightBlending opAssign(const FC_AnimSampleTrajectoryWeightBlending &inout Other)
    {
        FC_AnimSampleTrajectoryWeightBlending __r;
        this.SetWeightBlendRate(Other.GetWeightBlendRate());
        return __r;
    }
    float32 GetWeightBlendRate() const property
    {
        return this.m_WeightBlendRate;
    }
    void SetWeightBlendRate(const float32 __Value) property
    {
        if (this.m_WeightBlendRate == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_WeightBlendRate = __Value;
        return;
    }
}

class UESMAction_GetSampleTrajectory : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 TimeOffset = 0.1667f;
    UPROPERTY()
    bool bClientOnly = true;
    UPROPERTY()
    float32 MoveDesiredYawWeight = 1.0f;
    UPROPERTY()
    bool bEnableWeightBlending = false;
    UPROPERTY()
    float32 WeightBlendInDuration = 0.2f;
    UPROPERTY()
    float32 WeightBlendOutDuration = 0.2f;


    UFUNCTION()
    int GetActionPriority_Implementation() const
    {
        return -1;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(6);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        float32 local_17;
        local_6.GetTimeOffsetStack().Push(this.TimeOffset);
        local_6.SetTimeOffset(local_6.GetTimeOffsetStack().Top(0.0f));
        local_6.GetData().SetMoveDesiredYawWeight(this.MoveDesiredYawWeight);
        if (this.bEnableWeightBlending)
        {
            ModifyOrAdd local_14;
            FC_AnimSampleTrajectoryWeightBlending& local_16 = local_14.opCall();
            if (local_16)
            {
                if (this.WeightBlendInDuration > 0.0001f)
                {
                    local_17 = 1.0f / this.WeightBlendInDuration;
                }
                else
                {
                    local_17 = 0.0f;
                }
                local_16.SetWeightBlendRate(local_17);
            }
        }
        else
        {
            local_6.SetWeight(1.0f);
            Remove local_22;
            local_22.opCall();
        }
        Remove local_26;
        local_26.opCall();
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_23;
        Modify local_4;
        FC_AniParamSampleTrajectory& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.GetTimeOffsetStack().Pop();
            if (local_6.GetTimeOffsetStack().IsEmpty())
            {
                FC_AnimSampleTrajectoryBlendingOutTag local_14;
                Assign local_12;
                local_12.opCall(local_14);
                if (this.bEnableWeightBlending)
                {
                    ModifyOrAdd local_18;
                    FC_AnimSampleTrajectoryWeightBlending& local_20 = local_18.opCall();
                    if (local_20)
                    {
                        if (this.WeightBlendOutDuration > 0.0001f)
                        {
                            local_23 = 1.0f / this.WeightBlendOutDuration;
                        }
                        else
                        {
                            local_23 = 0.0f;
                        }
                        local_20.SetWeightBlendRate(local_23);
                    }
                }
            }
            else
            {
                local_6.SetTimeOffset(local_6.GetTimeOffsetStack().Top(0.0f));
            }
            local_6.GetData().SetMoveDesiredYawWeight(1.0f);
        }
        return;
    }
}

class UESMAction_SampleTrajectoryFromCurve : UESMBPBaseSpanAction
{
    UPROPERTY()
    FName FrontCurvatureCurve = n"FrontCurvature";
    UPROPERTY()
    FName RearCurvatureCurve = n"RearCurvature";
    UPROPERTY()
    bool bSampleOnEnter = false;
    UPROPERTY()
    bool bSampleOnExit = true;


    UFUNCTION()
    int GetActionPriority_Implementation() const
    {
        return -1;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(6);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_AnimSampleTrajectoryFromCurve& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbDoSample(this.bSampleOnEnter);
            local_6.SetFrontCurvatureCurve(this.FrontCurvatureCurve);
            local_6.SetRearCurvatureCurve(this.RearCurvatureCurve);
            local_6.SetbExpired(false);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_AnimSampleTrajectoryFromCurve& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbDoSample(this.bSampleOnExit);
            local_6.SetRearCurvatureCurve(this.RearCurvatureCurve);
            local_6.SetFrontCurvatureCurve(this.FrontCurvatureCurve);
            local_6.SetbExpired(true);
        }
        return;
    }
}

class UESMAction_ClearSampleTrajectory : UESMBPBaseInstantAction
{
    UESMAction_ClearSampleTrajectory()
    {
        return;
    }
    UFUNCTION()
    int GetActionPriority_Implementation() const
    {
        return -1;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(6);
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        Remove local_10;
        local_10.opCall();
        Remove local_14;
        local_14.opCall();
        Remove local_18;
        local_18.opCall();
        Modify local_22;
        FC_AnimSampleTrajectoryDeltaMoveRecorder& local_24 = local_22.opCall();
        if (local_24)
        {
            local_24.Reset();
        }
        return;
    }
}

namespace FSampleTrajectoryData
{
FSampleTrajectoryData Interpolate(const FSampleTrajectoryData &inout A, const FSampleTrajectoryData &inout B, const float32 T, const float32 DeltaTime)
{
    FSampleTrajectoryData local_26;
    local_26.SetAnimRootMotionDelta(FMath::Lerp(A.GetAnimRootMotionDelta(), B.GetAnimRootMotionDelta(), T));
    float32 local_37 = FMath::Lerp(A.GetRearCurvature(), B.GetRearCurvature(), T);
    local_26.SetRearCurvature(local_37);
    float32 local_35 = B.GetFrontCurvature();
    float32 local_37_2 = A.GetFrontCurvature();
    local_26.SetFrontCurvature(FMath::Lerp(local_37_2, local_35, T));
    float32 local_37_3 = FMath::Lerp(A.GetMinRearTrajectoryRadius(), B.GetMinRearTrajectoryRadius(), T);
    local_26.SetMinRearTrajectoryRadius(local_37_3);
    float32 local_35_2 = B.GetMinFrontTrajectoryRadius();
    float32 local_37_4 = A.GetMinFrontTrajectoryRadius();
    local_26.SetMinFrontTrajectoryRadius(FMath::Lerp(local_37_4, local_35_2, T));
    float32 local_37_5 = FMath::Lerp(A.GetMoveDesiredYawWeight(), B.GetMoveDesiredYawWeight(), T);
    local_26.SetMoveDesiredYawWeight(local_37_5);
    local_26.SetLookAtPoint(FMath::Lerp(A.GetLookAtPoint(), B.GetLookAtPoint(), T));
    float32 local_37_6 = B.GetMoveSpeed();
    local_26.SetMoveSpeed(FMath::Lerp(A.GetMoveSpeed(), local_37_6, T));
    FVector2f local_39 = FVector2f(A.GetHistoryCursor());
    FVector2f local_41 = FVector2f(B.GetHistoryCursor());
    float32 local_37_7 = local_41.X;
    if (local_37_7 < local_39.X)
    {
        float32 local_37_8 = (local_39.X - local_41.X) + 1.0f;
        float32 local_43 = local_41.X + local_37_8;
        local_43 = local_41.Y + local_37_8;
    }
    local_26.SetHistoryCursor(FMath::Lerp(local_39, local_41, T));
    local_26.UpdateNormalizedCurvature();
    return local_26;
}
float32 GetNormalizedCurvature(const float32 Curvature, const float32 MinTrajectoryRadius)
{
    if (MinTrajectoryRadius > 1e-8f)
    {
        return FMath::Sign(Curvature) * FMathUtils::InverseLerp(FMath::Abs(Curvature), 0.0f, 1.0f / MinTrajectoryRadius);
    }
    return Curvature / (FMath::Abs(Curvature) + 1.0f);
}
}
namespace FC_AniParamSampleTrajectory
{
FC_AniParamSampleTrajectory Interpolate(const FC_AniParamSampleTrajectory &inout A, const FC_AniParamSampleTrajectory &inout B, const float32 T, const float32 DeltaTime)
{
    FC_AniParamSampleTrajectory local_36;
    local_36.SetWeight(B.GetWeight());
    local_36.SetTimeOffset(FMath::Lerp(A.GetTimeOffset(), B.GetTimeOffset(), T));
    local_36.SetData(FSampleTrajectoryData::Interpolate(A.GetData(), B.GetData(), T, DeltaTime));
    return local_36;
}
}
namespace ECSFunc_FC_AnimSampleTrajectoryFromCurve
{
UFUNCTION()
bool HasAnimSampleTrajectoryFromCurve(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryFromCurve);
}
FC_AnimSampleTrajectoryFromCurve& AssignAnimSampleTrajectoryFromCurve(const FECSEntity &inout Entity, const FC_AnimSampleTrajectoryFromCurve &inout DefaultValue = FC_AnimSampleTrajectoryFromCurve())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryFromCurve, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimSampleTrajectoryFromCurve_BP(const FECSEntity &inout Entity, const FC_AnimSampleTrajectoryFromCurve &inout DefaultValue = FC_AnimSampleTrajectoryFromCurve())
{
    ECSFunc_FC_AnimSampleTrajectoryFromCurve::AssignAnimSampleTrajectoryFromCurve(Entity, DefaultValue);
    return;
}
FC_AnimSampleTrajectoryFromCurve& ModifyAnimSampleTrajectoryFromCurve(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryFromCurve));
    return local_12.GetComp();
}
FC_AnimSampleTrajectoryFromCurve& ModifyOrAddAnimSampleTrajectoryFromCurve(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryFromCurve));
    return local_12.GetComp();
}
const FC_AnimSampleTrajectoryFromCurve& GetAnimSampleTrajectoryFromCurve(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryFromCurve));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimSampleTrajectoryFromCurve GetAnimSampleTrajectoryFromCurve_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimSampleTrajectoryFromCurve& local_4 = ECSFunc_FC_AnimSampleTrajectoryFromCurve::GetAnimSampleTrajectoryFromCurve(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimSampleTrajectoryFromCurve();
}
const FC_AnimSampleTrajectoryFromCurve GetDefaultedAnimSampleTrajectoryFromCurve(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimSampleTrajectoryFromCurve __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryFromCurve);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AnimSampleTrajectoryFromCurve GetDefaultedAnimSampleTrajectoryFromCurve_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimSampleTrajectoryFromCurve::GetDefaultedAnimSampleTrajectoryFromCurve(Entity);
}
UFUNCTION()
bool RemoveAnimSampleTrajectoryFromCurve(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryFromCurve);
}
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryFromCurveOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimSampleTrajectoryFromCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryFromCurveOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimSampleTrajectoryFromCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryFromCurveOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimSampleTrajectoryFromCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryFromCurveOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimSampleTrajectoryFromCurve, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryFromCurveOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimSampleTrajectoryFromCurve, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimSampleTrajectoryFromCurveLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimSampleTrajectoryFromCurve, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimSampleTrajectoryFromCurveActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimSampleTrajectoryFromCurve, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimSampleTrajectoryFromCurveModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimSampleTrajectoryFromCurve, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AniParamSampleTrajectory
{
UFUNCTION()
bool HasAniParamSampleTrajectory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectory);
}
FC_AniParamSampleTrajectory& AssignAniParamSampleTrajectory(const FECSEntity &inout Entity, const FC_AniParamSampleTrajectory &inout DefaultValue = FC_AniParamSampleTrajectory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAniParamSampleTrajectory_BP(const FECSEntity &inout Entity, const FC_AniParamSampleTrajectory &inout DefaultValue = FC_AniParamSampleTrajectory())
{
    ECSFunc_FC_AniParamSampleTrajectory::AssignAniParamSampleTrajectory(Entity, DefaultValue);
    return;
}
FC_AniParamSampleTrajectory& ModifyAniParamSampleTrajectory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectory));
    return local_12.GetComp();
}
FC_AniParamSampleTrajectory& ModifyOrAddAniParamSampleTrajectory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectory));
    return local_12.GetComp();
}
const FC_AniParamSampleTrajectory& GetAniParamSampleTrajectory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectory));
    return local_12.GetComp();
}
UFUNCTION()
FC_AniParamSampleTrajectory GetAniParamSampleTrajectory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AniParamSampleTrajectory& local_4 = ECSFunc_FC_AniParamSampleTrajectory::GetAniParamSampleTrajectory(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AniParamSampleTrajectory();
}
const FC_AniParamSampleTrajectory GetDefaultedAniParamSampleTrajectory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AniParamSampleTrajectory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectory);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AniParamSampleTrajectory GetDefaultedAniParamSampleTrajectory_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AniParamSampleTrajectory::GetDefaultedAniParamSampleTrajectory(Entity);
}
UFUNCTION()
bool RemoveAniParamSampleTrajectory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AniParamSampleTrajectory);
}
}
FECSMonitorRuntimeView __GetMonitorAniParamSampleTrajectoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AniParamSampleTrajectory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamSampleTrajectoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AniParamSampleTrajectory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamSampleTrajectoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AniParamSampleTrajectory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamSampleTrajectoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AniParamSampleTrajectory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAniParamSampleTrajectoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AniParamSampleTrajectory, bFixedFrame, bMustHandleAll);
}
void __MonitorAniParamSampleTrajectoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AniParamSampleTrajectory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAniParamSampleTrajectoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AniParamSampleTrajectory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAniParamSampleTrajectoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AniParamSampleTrajectory, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimSampleTrajectoryDeltaMoveRecorder
{
UFUNCTION()
bool HasAnimSampleTrajectoryDeltaMoveRecorder(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryDeltaMoveRecorder);
}
FC_AnimSampleTrajectoryDeltaMoveRecorder& AssignAnimSampleTrajectoryDeltaMoveRecorder(const FECSEntity &inout Entity, const FC_AnimSampleTrajectoryDeltaMoveRecorder &inout DefaultValue = FC_AnimSampleTrajectoryDeltaMoveRecorder())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryDeltaMoveRecorder, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimSampleTrajectoryDeltaMoveRecorder_BP(const FECSEntity &inout Entity, const FC_AnimSampleTrajectoryDeltaMoveRecorder &inout DefaultValue = FC_AnimSampleTrajectoryDeltaMoveRecorder())
{
    ECSFunc_FC_AnimSampleTrajectoryDeltaMoveRecorder::AssignAnimSampleTrajectoryDeltaMoveRecorder(Entity, DefaultValue);
    return;
}
FC_AnimSampleTrajectoryDeltaMoveRecorder& ModifyAnimSampleTrajectoryDeltaMoveRecorder(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryDeltaMoveRecorder));
    return local_12.GetComp();
}
FC_AnimSampleTrajectoryDeltaMoveRecorder& ModifyOrAddAnimSampleTrajectoryDeltaMoveRecorder(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryDeltaMoveRecorder));
    return local_12.GetComp();
}
const FC_AnimSampleTrajectoryDeltaMoveRecorder& GetAnimSampleTrajectoryDeltaMoveRecorder(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryDeltaMoveRecorder));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimSampleTrajectoryDeltaMoveRecorder GetAnimSampleTrajectoryDeltaMoveRecorder_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimSampleTrajectoryDeltaMoveRecorder& local_4 = ECSFunc_FC_AnimSampleTrajectoryDeltaMoveRecorder::GetAnimSampleTrajectoryDeltaMoveRecorder(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimSampleTrajectoryDeltaMoveRecorder();
}
const FC_AnimSampleTrajectoryDeltaMoveRecorder GetDefaultedAnimSampleTrajectoryDeltaMoveRecorder(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimSampleTrajectoryDeltaMoveRecorder __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryDeltaMoveRecorder);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AnimSampleTrajectoryDeltaMoveRecorder GetDefaultedAnimSampleTrajectoryDeltaMoveRecorder_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimSampleTrajectoryDeltaMoveRecorder::GetDefaultedAnimSampleTrajectoryDeltaMoveRecorder(Entity);
}
UFUNCTION()
bool RemoveAnimSampleTrajectoryDeltaMoveRecorder(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryDeltaMoveRecorder);
}
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryDeltaMoveRecorderOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimSampleTrajectoryDeltaMoveRecorder, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryDeltaMoveRecorderOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimSampleTrajectoryDeltaMoveRecorder, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryDeltaMoveRecorderOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimSampleTrajectoryDeltaMoveRecorder, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryDeltaMoveRecorderOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimSampleTrajectoryDeltaMoveRecorder, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryDeltaMoveRecorderOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimSampleTrajectoryDeltaMoveRecorder, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimSampleTrajectoryDeltaMoveRecorderLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimSampleTrajectoryDeltaMoveRecorder, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimSampleTrajectoryDeltaMoveRecorderActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimSampleTrajectoryDeltaMoveRecorder, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimSampleTrajectoryDeltaMoveRecorderModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimSampleTrajectoryDeltaMoveRecorder, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimSampleTrajectoryBlendingOutTag
{
UFUNCTION()
bool HasAnimSampleTrajectoryBlendingOutTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryBlendingOutTag);
}
FC_AnimSampleTrajectoryBlendingOutTag& AssignAnimSampleTrajectoryBlendingOutTag(const FECSEntity &inout Entity, const FC_AnimSampleTrajectoryBlendingOutTag &inout DefaultValue = FC_AnimSampleTrajectoryBlendingOutTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryBlendingOutTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimSampleTrajectoryBlendingOutTag_BP(const FECSEntity &inout Entity, const FC_AnimSampleTrajectoryBlendingOutTag &inout DefaultValue = FC_AnimSampleTrajectoryBlendingOutTag())
{
    ECSFunc_FC_AnimSampleTrajectoryBlendingOutTag::AssignAnimSampleTrajectoryBlendingOutTag(Entity, DefaultValue);
    return;
}
FC_AnimSampleTrajectoryBlendingOutTag& ModifyAnimSampleTrajectoryBlendingOutTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryBlendingOutTag));
    return local_12.GetComp();
}
FC_AnimSampleTrajectoryBlendingOutTag& ModifyOrAddAnimSampleTrajectoryBlendingOutTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryBlendingOutTag));
    return local_12.GetComp();
}
const FC_AnimSampleTrajectoryBlendingOutTag& GetAnimSampleTrajectoryBlendingOutTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryBlendingOutTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimSampleTrajectoryBlendingOutTag GetAnimSampleTrajectoryBlendingOutTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimSampleTrajectoryBlendingOutTag& local_4 = ECSFunc_FC_AnimSampleTrajectoryBlendingOutTag::GetAnimSampleTrajectoryBlendingOutTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimSampleTrajectoryBlendingOutTag();
}
const FC_AnimSampleTrajectoryBlendingOutTag GetDefaultedAnimSampleTrajectoryBlendingOutTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimSampleTrajectoryBlendingOutTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryBlendingOutTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AnimSampleTrajectoryBlendingOutTag GetDefaultedAnimSampleTrajectoryBlendingOutTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimSampleTrajectoryBlendingOutTag::GetDefaultedAnimSampleTrajectoryBlendingOutTag(Entity);
}
UFUNCTION()
bool RemoveAnimSampleTrajectoryBlendingOutTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryBlendingOutTag);
}
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryBlendingOutTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimSampleTrajectoryBlendingOutTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryBlendingOutTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimSampleTrajectoryBlendingOutTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryBlendingOutTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimSampleTrajectoryBlendingOutTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryBlendingOutTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimSampleTrajectoryBlendingOutTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryBlendingOutTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimSampleTrajectoryBlendingOutTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimSampleTrajectoryBlendingOutTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimSampleTrajectoryBlendingOutTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimSampleTrajectoryBlendingOutTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimSampleTrajectoryBlendingOutTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimSampleTrajectoryBlendingOutTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimSampleTrajectoryBlendingOutTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AnimSampleTrajectoryWeightBlending
{
UFUNCTION()
bool HasAnimSampleTrajectoryWeightBlending(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryWeightBlending);
}
FC_AnimSampleTrajectoryWeightBlending& AssignAnimSampleTrajectoryWeightBlending(const FECSEntity &inout Entity, const FC_AnimSampleTrajectoryWeightBlending &inout DefaultValue = FC_AnimSampleTrajectoryWeightBlending())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryWeightBlending, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAnimSampleTrajectoryWeightBlending_BP(const FECSEntity &inout Entity, const FC_AnimSampleTrajectoryWeightBlending &inout DefaultValue = FC_AnimSampleTrajectoryWeightBlending())
{
    ECSFunc_FC_AnimSampleTrajectoryWeightBlending::AssignAnimSampleTrajectoryWeightBlending(Entity, DefaultValue);
    return;
}
FC_AnimSampleTrajectoryWeightBlending& ModifyAnimSampleTrajectoryWeightBlending(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryWeightBlending));
    return local_12.GetComp();
}
FC_AnimSampleTrajectoryWeightBlending& ModifyOrAddAnimSampleTrajectoryWeightBlending(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryWeightBlending));
    return local_12.GetComp();
}
const FC_AnimSampleTrajectoryWeightBlending& GetAnimSampleTrajectoryWeightBlending(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryWeightBlending));
    return local_12.GetComp();
}
UFUNCTION()
FC_AnimSampleTrajectoryWeightBlending GetAnimSampleTrajectoryWeightBlending_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AnimSampleTrajectoryWeightBlending& local_4 = ECSFunc_FC_AnimSampleTrajectoryWeightBlending::GetAnimSampleTrajectoryWeightBlending(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AnimSampleTrajectoryWeightBlending();
}
const FC_AnimSampleTrajectoryWeightBlending GetDefaultedAnimSampleTrajectoryWeightBlending(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AnimSampleTrajectoryWeightBlending __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryWeightBlending);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AnimSampleTrajectoryWeightBlending GetDefaultedAnimSampleTrajectoryWeightBlending_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AnimSampleTrajectoryWeightBlending::GetDefaultedAnimSampleTrajectoryWeightBlending(Entity);
}
UFUNCTION()
bool RemoveAnimSampleTrajectoryWeightBlending(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AnimSampleTrajectoryWeightBlending);
}
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryWeightBlendingOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AnimSampleTrajectoryWeightBlending, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryWeightBlendingOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AnimSampleTrajectoryWeightBlending, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryWeightBlendingOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AnimSampleTrajectoryWeightBlending, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryWeightBlendingOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AnimSampleTrajectoryWeightBlending, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAnimSampleTrajectoryWeightBlendingOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AnimSampleTrajectoryWeightBlending, bFixedFrame, bMustHandleAll);
}
void __MonitorAnimSampleTrajectoryWeightBlendingLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AnimSampleTrajectoryWeightBlending, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimSampleTrajectoryWeightBlendingActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AnimSampleTrajectoryWeightBlending, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAnimSampleTrajectoryWeightBlendingModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AnimSampleTrajectoryWeightBlending, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FSampleTrajectoryData &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FSampleTrajectoryData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FSampleTrajectoryData
{
int __IndexOf_AnimRootMotionDelta()
{
    return 0;
}
int __IndexOf_RearCurvature()
{
    return 1;
}
int __IndexOf_FrontCurvature()
{
    return 2;
}
int __IndexOf_MinRearTrajectoryRadius()
{
    return 3;
}
int __IndexOf_MinFrontTrajectoryRadius()
{
    return 4;
}
int __IndexOf_MoveDesiredYawWeight()
{
    return 5;
}
int __IndexOf_LookAtPoint()
{
    return 6;
}
int __IndexOf_MoveSpeed()
{
    return 7;
}
int __IndexOf_HistoryCursor()
{
    return 8;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimSampleTrajectoryFromCurve &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimSampleTrajectoryFromCurve &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimSampleTrajectoryFromCurve &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimSampleTrajectoryFromCurve
{
int __IndexOf_bDoSample()
{
    return 0;
}
int __IndexOf_bExpired()
{
    return 1;
}
int __IndexOf_RearCurvatureCurve()
{
    return 2;
}
int __IndexOf_FrontCurvatureCurve()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_AniParamSampleTrajectory &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_AniParamSampleTrajectory &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AniParamSampleTrajectory &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AniParamSampleTrajectory
{
int __IndexOf_Weight()
{
    return 0;
}
int __IndexOf_Data()
{
    return 1;
}
int __IndexOf_TimeOffset()
{
    return 10;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimSampleTrajectoryDeltaMoveRecorder &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimSampleTrajectoryDeltaMoveRecorder &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimSampleTrajectoryDeltaMoveRecorder &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimSampleTrajectoryDeltaMoveRecorder
{
int __IndexOf_FrontIndex()
{
    return 0;
}
int __IndexOf_BackIndex()
{
    return 1;
}
int __IndexOf_HistoryMoveBuffer()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AnimSampleTrajectoryWeightBlending &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AnimSampleTrajectoryWeightBlending &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AnimSampleTrajectoryWeightBlending &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AnimSampleTrajectoryWeightBlending
{
int __IndexOf_WeightBlendRate()
{
    return 0;
}
}
