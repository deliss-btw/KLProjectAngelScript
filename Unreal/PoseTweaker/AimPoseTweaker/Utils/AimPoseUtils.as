

struct FAimPoseVectorSpring
{
    UPROPERTY()
    FPT_FloatSpring X;
    UPROPERTY()
    FPT_FloatSpring Y;
    UPROPERTY()
    FPT_FloatSpring Z;

    FAimPoseVectorSpring()
    {
        return;
    }
    void SetParams(const float32 Stiffness, const float32 Damping)
    {
        this.Stiffness = Stiffness;
        this.Y.Stiffness = Stiffness;
        this.Z.Stiffness = Stiffness;
        this.Damping = Damping;
        this.Y.Damping = Damping;
        this.Z.Damping = Damping;
        return;
    }
    void Init(const FVector &inout Position, const FVector &inout Velocity = FVector::ZeroVector)
    {
        this.Init(int(Position.X), Velocity.X);
        this.Y.Init(int(Position.Y), Velocity.Y);
        this.Z.Init(int(Position.Z), Velocity.Z);
        return;
    }
    void Update(const float32 DeltaTime, const FVector &inout Target)
    {
        this.Update(DeltaTime, Target.X);
        this.Y.Update(DeltaTime, Target.Y);
        this.Z.Update(DeltaTime, Target.Z);
        return;
    }
    FVector GetPosition() const
    {
        return FVector(this.GetPosition(), this.Y.GetPosition(), this.Z.GetPosition());
    }
    FVector GetVelocity() const
    {
        return FVector(this.GetVelocity(), this.Y.GetVelocity(), this.Z.GetVelocity());
    }
}

namespace AimPoseUtils
{
FString Join(const TSet<FString> &inout Strings, const FString &inout Separator = ", ")
{
    FString local_4 = "";
    for (auto& local_24 : Strings)
    {
        FString local_28 = (local_24 + Separator);
        local_4 += local_28;
    }
    return local_4;
}
float32 NormalizeAngle(const float32 InAngle)
{
    float32 local_1 = InAngle;
    while (local_1 > 180.0f)
    {
        local_1 = local_1 - 360.0f;
    }
    while (local_1 < -180.0f)
    {
        local_1 = local_1 + 360.0f;
    }
    return local_1;
}
float32 AngleDelta(const float32 From, const float32 To)
{
    return AimPoseUtils::NormalizeAngle(To - From);
}
float32 ProcessHysteresisClampStateless(const float32 RawYaw, const float32 YawMin, const float32 YawMax, const float32 HysteresisThreshold, int &inout InOutHysteresisSign)
{
    bool local_3 = (HysteresisThreshold < 180.0f) && (FMath::Abs(RawYaw) > HysteresisThreshold);
    if ((!(local_3) || (InOutHysteresisSign == 0)))
    {
        InOutHysteresisSign = RawYaw >= 0.0f ? 1 : -1;
    }
    float32 local_7 = RawYaw;
    if (local_3)
    {
        bool local_1 = !((RawYaw >= 0.0f));
        bool local_4_2 = !((InOutHysteresisSign > 0));
        local_1 = (local_1 == local_4_2);
        if (!(local_1))
        {
            local_7 = InOutHysteresisSign * 180.0f;
        }
    }
    return FMath::Clamp(local_7, YawMin, YawMax);
}
float32 ProcessReturnToNeutralStateless(const float32 RawYaw, const float32 YawMin, const float32 YawMax, const float32 NeutralYaw, const float32 ReturnThreshold, const float32 RecoverThreshold, bool &inout InOutIsOutOfRange)
{
    float32 local_1 = 0.0f;
    if (RawYaw > YawMax)
    {
        local_1 = RawYaw - YawMax;
    }
    else
    {
        if (RawYaw < YawMin)
        {
            local_1 = YawMin - RawYaw;
        }
    }
    if (!(InOutIsOutOfRange) && (local_1 > ReturnThreshold))
    {
        InOutIsOutOfRange = true;
    }
    if (InOutIsOutOfRange && (local_1 < RecoverThreshold))
    {
        InOutIsOutOfRange = false;
    }
    if (InOutIsOutOfRange)
    {
        return NeutralYaw;
    }
    return FMath::Clamp(RawYaw, YawMin, YawMax);
}
float32 ProcessYawUnwrapStateless(const float32 RawYaw, float32 &inout InOutPrevWrappedYaw, float32 &inout InOutAccumYaw, bool &inout InOutInitialized)
{
    if (!(InOutInitialized))
    {
        InOutPrevWrappedYaw = RawYaw;
        InOutAccumYaw = RawYaw;
        InOutInitialized = true;
        return InOutAccumYaw;
    }
    float32 local_4 = AimPoseUtils::NormalizeAngle((RawYaw - InOutPrevWrappedYaw));
    InOutAccumYaw = (InOutAccumYaw + local_4);
    InOutPrevWrappedYaw = RawYaw;
    return InOutAccumYaw;
}
}
