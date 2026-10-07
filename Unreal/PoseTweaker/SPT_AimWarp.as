

class USPT_AimWarp_Base : USkeletalPoseTweaker
{
    UPROPERTY()
    FPT_BoneRef NeckBone;
    UPROPERTY()
    FPT_BoneRef SpineBone;
    UPROPERTY()
    float32 MaxYawDegree = 60.0f;
    float32 MaxYawRadian;
    UPROPERTY()
    float32 MaxPitchDegree = 30.0f;
    float32 MaxPitchRadian;
    UPROPERTY()
    FVector RuntimeTargetCS;
    UPROPERTY()
    FVector AnimTargetCS;
    UPROPERTY()
    bool bWantDebug = false;


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        this.MaxYawRadian = FMath::DegreesToRadians(this.MaxYawDegree);
        this.MaxPitchRadian = FMath::DegreesToRadians(this.MaxPitchDegree);
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        if (this.bWantDebug)
        {
            this.DrawAnimDebugSphere(this.RuntimeTargetCS, 5.0f, 12, FColor::Yellow, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(1));
        }
        FVector local_12(this.NeckBone.GetLocation());
        FVector local_30 = (this.AnimTargetCS - local_12);
        FVector local_24 = (this.RuntimeTargetCS - local_12);
        FQuat local_44;
        FQuat local_52;
        this.DecomposeAlignRotation(local_30, local_24, local_44, local_52);
        this.ApplyAngleLimit(local_44, this.MaxYawRadian);
        this.ApplyAngleLimit(local_52, this.MaxPitchRadian);
        FTransform local_76 = FTransform(this.SpineBone.GetTransform());
        FQuat local_108 = (local_52 * local_44);
        local_76.SetRotation((local_108 * local_76.GetRotation()));
        this.SpineBone.SetTransform(local_76);
        return;
    }
    void ApplyAngleLimit(FQuat &inout Quat, const float32 AngleLimitRadian)
    {
        if (Quat.GetAngle() > AngleLimitRadian)
        {
            Quat = FQuat(Quat.GetRotationAxis(), AngleLimitRadian);
        }
        return;
    }
    void DecomposeAlignRotation(const FVector &inout FromAxis, const FVector &inout ToAxis, FQuat &inout YawOnly, FQuat &inout PitchOnly)
    {
        YawOnly = FQuat::Identity;
        PitchOnly = FQuat::Identity;
        if (FromAxis.IsNearlyZero(9.999999747378752e-5) || ToAxis.IsNearlyZero(9.999999747378752e-5) || FromAxis.CrossProduct(ToAxis).IsNearlyZero(9.999999747378752e-5))
        {
            return;
        }
        FVector local_10 = FVector(FromAxis.X, FromAxis.Y, 0.0);
        FVector local_16 = FVector(ToAxis.X, ToAxis.Y, 0.0);
        if (local_10.IsNearlyZero(9.999999747378752e-5) || local_16.IsNearlyZero(9.999999747378752e-5))
        {
            PitchOnly = FQuat::FindBetween(FromAxis, ToAxis);
            return;
        }
        YawOnly = FQuat::FindBetween(local_10, local_16);
        PitchOnly = FQuat::FindBetween(local_16, ToAxis);
        return;
    }
}

class USPT_AimWarp_AvatarDefault : USPT_AimWarp_Base
{
    USPT_AimWarp_AvatarDefault()
    {
        super();
        this.NeckBone.SetBoneName(n"neck_01");
        this.SpineBone.SetBoneName(n"spine_03");
        return;
    }
}

class USPT_AimWarp_Shuijing : USPT_AimWarp_Base
{
    USPT_AimWarp_Shuijing()
    {
        super();
        this.NeckBone.SetBoneName(n"neck_01");
        this.SpineBone.SetBoneName(n"spine_03");
        return;
    }
}

