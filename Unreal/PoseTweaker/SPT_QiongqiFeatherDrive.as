

struct FFeatherDriveConfig
{
    UPROPERTY()
    FName DriverBone;
    UPROPERTY()
    FName FollowerBone;
    UPROPERTY()
    float Scale;

    FFeatherDriveConfig(const FName &inout Driver, const FName &inout Follower, const float InScale)
    {
        this.FollowerBone = Follower;
        this.Scale = InScale;
        return;
    }
}

struct FActiveFeatherPair
{
    UPROPERTY()
    FPT_BoneRef Driver;
    UPROPERTY()
    FPT_BoneRef Follower;
    UPROPERTY()
    float Scale;


}

class USPT_QiongqiFeatherDrive : USkeletalPoseTweaker
{
    UPROPERTY()
    TArray<FFeatherDriveConfig> DriveConfigs;
    TArray<FActiveFeatherPair> ActiveFeatherPairs;

    USPT_QiongqiFeatherDrive()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        this.ActiveFeatherPairs.Reset(this.ActiveFeatherPairs.Num());
        for (auto& local_18 : this.DriveConfigs)
        {
            FPT_BoneRef local_23;
            FPT_BoneRef local_28;
            local_23.SetBoneName(local_18.DriverBone);
            local_28.SetBoneName(local_18.FollowerBone);
            if (this.InitializeBoneRef(local_23) && this.InitializeBoneRef(local_28))
            {
                FActiveFeatherPair local_42;
                local_42.Driver = local_23;
                local_42.Follower = local_28;
                local_42.Scale = local_18.Scale;
                this.ActiveFeatherPairs.Add(local_42);
            }
        }
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        for (auto& local_16 : this.ActiveFeatherPairs)
        {
            FTransform local_40 = this.GetBoneTransformLocal(local_16.Follower.GetBoneIndex());
            local_40.SetRotation(this.ScaleAndClamp(this.GetBoneTransformLocal(local_16.Driver.GetBoneIndex()).GetRotation(), local_16.Scale));
            this.SetBoneTransformLocal(local_16.Follower.GetBoneIndex(), local_40);
        }
        return;
    }
    FQuat ScaleAndClamp(const FQuat &inout InQuat, const float Scale)
    {
        FRotator local_12 = InQuat.Rotator();
        float local_22 = FMath::Clamp((local_12.Pitch * Scale), -60.0, 0.0);
        return FRotator(local_22, local_12.Yaw, 0.0).Quaternion();
    }
}

