

struct FDriverBone
{
    UPROPERTY()
    FPT_BoneRef Bone;
    UPROPERTY()
    EAxis ForwardAxis = EAxis(1);


    FVector GetForwardAxis() const
    {
        switch (int(this.ForwardAxis))
        {
        case 2:
        {
            return FVector(0.0, 1.0, 0.0);
        }
        case 3:
        {
            return FVector(0.0, 0.0, 1.0);
        }
        }
        return FVector(1.0, 0.0, 0.0);
    }
}

struct FFollowerBone
{
    UPROPERTY()
    FPT_BoneRef Bone;
    UPROPERTY()
    float32 DriverInfluence = 0.5f;
    UPROPERTY()
    float32 MaxLengthScale = 2.0f;


}

struct FLinearBoneCorrectionDebugSetting
{
    UPROPERTY()
    FPT_BoneRef DebugBone;
    UPROPERTY()
    EAxis RotationAxis = EAxis(3);
    UPROPERTY()
    float32 AngleDegree = 0.0f;


    FQuat GetRotation()
    {
        FVector local_12 = FVector(1.0, 0.0, 0.0);
        int local_20 = int(this.RotationAxis);
        if (local_20 <= 3)
        {
            if (local_20 != 2)
            {
                if (local_20 != 3)
                {
                }
            }
            else
            {
                local_12 = FVector(0.0, 1.0, 0.0);
                local_12 = FVector(0.0, 0.0, 1.0);
            }
        }
        float32 local_22 = FMath::DegreesToRadians(this.AngleDegree);
        return FQuat();
    }
}

struct FLinearBoneCorrectionBindPoseInfo
{
    UPROPERTY()
    FQuat DriverRotationInverse;
    UPROPERTY()
    TArray<float32> FollowerDistanceToDriverAxis;

    FLinearBoneCorrectionBindPoseInfo()
    {
        return;
    }
}

class USPT_LinearBoneCorrection : USkeletalPoseTweaker
{
    UPROPERTY()
    FDriverBone DriverBone;
    UPROPERTY()
    TArray<FFollowerBone> Followers;
    UPROPERTY()
    bool bWantDebug = false;
    UPROPERTY()
    FLinearBoneCorrectionDebugSetting DebugSetting;
    FLinearBoneCorrectionBindPoseInfo BindPoseInfo;


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        if (!(this.DriverBone.Bone.HasValidSetup()))
        {
            return;
        }
        for (auto& local_16 : this.Followers)
        {
            if (!(local_16.Bone.HasValidSetup()))
            {
                return;
            }
        }
        this.BindPoseInfo.DriverRotationInverse = this.GetBoneTransformLocal(this.DriverBone.Bone.GetBoneIndex()).GetRotation().Inverse();
        FVector local_72 = this.DriverBone.GetForwardAxis();
        for (auto& local_16 : this.Followers)
        {
            FVector local_78(this.GetBoneTransformLocal(local_16.Bone.GetBoneIndex()).GetLocation());
            this.BindPoseInfo.FollowerDistanceToDriverAxis.Add(float32(((local_78 - (local_72 * local_78.DotProduct(local_72))).Size())));
        }
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        this.DebugMove();
        int local_1 = 0;
        for (; local_1 < this.Followers.Num(); )
        {
            FFollowerBone local_12;
            this.EvaluateFollower(this.DriverBone, local_12, local_1);
            ++local_1;
        }
        return;
    }
    void EvaluateFollower(const FDriverBone &inout Driver, FFollowerBone &inout Follower, const int FollowerIndex)
    {
        if (!(Driver.Bone.HasValidSetup()) || !(Follower.Bone.HasValidSetup()))
        {
            return;
        }
        FPT_BoneRef local_7 = Driver.Bone;
        FPT_BoneRef local_12 = Follower.Bone;
        FQuat local_96 = (this.BindPoseInfo.DriverRotationInverse * this.GetBoneTransformLocal(local_7.GetBoneIndex()).GetRotation());
        float32 local_103 = float32((FMath::Clamp(Follower.DriverInfluence, 0.0, 1.0)));
        if (!(FMath::IsNearlyEqual(float(local_103), 1.0, 9.99999993922529e-9)))
        {
            FTransform local_36 = (this.GetBoneTransformLocal(local_12.GetBoneIndex()) * FTransform((FQuat::Slerp(FQuat::Identity, local_96, (local_103 - 1.0f)))));
            this.SetBoneTransformLocal(local_12.GetBoneIndex(), local_36);
        }
        if (this.bWantDebug)
        {
            this.DrawAnimDebugTransform(local_12.GetTransform(), 10.0f, true);
        }
        float32 local_97 = this.BindPoseInfo.FollowerDistanceToDriverAxis[FollowerIndex];
        FVector local_180 = this.DriverBone.GetForwardAxis();
        FTransform local_168 = this.GetBoneTransformLocal(local_12.GetBoneIndex());
        FVector local_186(local_168.GetLocation());
        float32 local_109 = float32(((local_186 - (local_180 * local_186.DotProduct(local_180))).Size()));
        local_168.SetLocation((local_186 * FMath::Clamp((local_97 / local_109), 1.0, Follower.MaxLengthScale)));
        this.SetBoneTransformLocal(local_12.GetBoneIndex(), local_168);
        return;
    }
    void DebugMove()
    {
        if (!(this.bWantDebug))
        {
            return;
        }
        if (!(this.DebugSetting.DebugBone.HasValidSetup()))
        {
            return;
        }
        FTransform local_28 = FTransform(this.DriverBone.Bone.GetTransform());
        local_28.SetRotation((local_28.GetRotation() * this.DebugSetting.GetRotation()));
        this.DriverBone.Bone.SetTransform(local_28);
        if (this.bWantDebug)
        {
            this.DrawAnimDebugTransform(local_28, 12.0f, true);
        }
        return;
    }
}

class USPT_LinearBoneCorrectionExample : USPT_LinearBoneCorrection
{
    USPT_LinearBoneCorrectionExample()
    {
        super();
        this.bWantDebug = true;
        this.DebugSetting.DebugBone.SetBoneName(n"joint2");
        this.DriverBone.Bone.SetBoneName(n"joint2");
        this.DriverBone.ForwardAxis = EAxis(1);
        this.Followers.Empty(0);
        FFollowerBone local_12;
        local_12.Bone.SetBoneName(n"joint4");
        local_12.DriverInfluence = 0.5f;
        this.Followers.Add(local_12);
        return;
    }
}

struct FLinearBoneCorrectionConfig
{
    UPROPERTY()
    FDriverBone DriverBone;
    UPROPERTY()
    TArray<FFollowerBone> Followers;
    UPROPERTY()
    bool bWantDebug = false;
    UPROPERTY()
    FLinearBoneCorrectionDebugSetting DebugSetting;
    UPROPERTY()
    FLinearBoneCorrectionBindPoseInfo BindPoseInfo;


    void OnInitialization(const USkeletalPoseTweaker PT)
    {
        if (!(this.Bone.HasValidSetup()))
        {
            return;
        }
        for (auto& local_16 : this.Followers)
        {
            if (!(local_16.Bone.HasValidSetup()))
            {
                return;
            }
        }
        this.BindPoseInfo.DriverRotationInverse = PT.GetBoneTransformLocal(this.Bone.GetBoneIndex()).GetRotation().Inverse();
        FVector local_72 = this.GetForwardAxis();
        for (auto& local_16 : this.Followers)
        {
            FVector local_78(PT.GetBoneTransformLocal(local_16.Bone.GetBoneIndex()).GetLocation());
            this.BindPoseInfo.FollowerDistanceToDriverAxis.Add(float32(((local_78 - (local_72 * local_78.DotProduct(local_72))).Size())));
        }
        return;
    }
    void EvaluateFollower(const USkeletalPoseTweaker PT, const FDriverBone &inout Driver, FFollowerBone &inout Follower, const int FollowerIndex)
    {
        if (!(Driver.Bone.HasValidSetup()) || !(Follower.Bone.HasValidSetup()))
        {
            return;
        }
        FPT_BoneRef local_7 = Driver.Bone;
        FPT_BoneRef local_12 = Follower.Bone;
        FQuat local_96 = (this.BindPoseInfo.DriverRotationInverse * PT.GetBoneTransformLocal(local_7.GetBoneIndex()).GetRotation());
        float32 local_103 = float32((FMath::Clamp(Follower.DriverInfluence, 0.0, 1.0)));
        if (!(FMath::IsNearlyEqual(float(local_103), 1.0, 9.99999993922529e-9)))
        {
            FTransform local_36 = (PT.GetBoneTransformLocal(local_12.GetBoneIndex()) * FTransform((FQuat::Slerp(FQuat::Identity, local_96, (local_103 - 1.0f)))));
            PT.SetBoneTransformLocal(local_12.GetBoneIndex(), local_36);
        }
        if (this.bWantDebug)
        {
            PT.DrawAnimDebugTransform(local_12.GetTransform(), 10.0f, true);
        }
        float32 local_97 = this.BindPoseInfo.FollowerDistanceToDriverAxis[FollowerIndex];
        FVector local_180 = this.GetForwardAxis();
        FTransform local_168 = PT.GetBoneTransformLocal(local_12.GetBoneIndex());
        FVector local_186(local_168.GetLocation());
        float32 local_109 = float32(((local_186 - (local_180 * local_186.DotProduct(local_180))).Size()));
        local_168.SetLocation((local_186 * FMath::Clamp((local_97 / local_109), 1.0, Follower.MaxLengthScale)));
        PT.SetBoneTransformLocal(local_12.GetBoneIndex(), local_168);
        return;
    }
    void DebugMove(const USkeletalPoseTweaker PT)
    {
        if (!(this.bWantDebug))
        {
            return;
        }
        if (!(this.DebugSetting.DebugBone.HasValidSetup()))
        {
            return;
        }
        FTransform local_28 = FTransform(this.Bone.GetTransform());
        local_28.SetRotation((local_28.GetRotation() * this.DebugSetting.GetRotation()));
        this.Bone.SetTransform(local_28);
        if (this.bWantDebug)
        {
            PT.DrawAnimDebugTransform(local_28, 12.0f, true);
        }
        return;
    }
}

class USPT_MultipleLinearBoneCorrection : USkeletalPoseTweaker
{
    UPROPERTY()
    TArray<FLinearBoneCorrectionConfig> BoneConfigs;

    USPT_MultipleLinearBoneCorrection()
    {
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        for (auto& local_18 : this.BoneConfigs)
        {
            USkeletalPoseTweaker local_2;
            local_18.OnInitialization(local_2);
        }
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        USkeletalPoseTweaker local_2;
        for (auto& local_18 : this.BoneConfigs)
        {
            local_18.DebugMove(local_2);
            int local_19 = 0;
            for (; local_19 < local_18.Followers.Num(); )
            {
                FFollowerBone& local_24 = local_18.Followers[local_19];
                local_18.EvaluateFollower(local_2, local_18.DriverBone, local_24, local_19);
                ++local_19;
            }
        }
        return;
    }
}

