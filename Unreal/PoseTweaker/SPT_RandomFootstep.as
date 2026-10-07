
enum EFootPosition
{
    Front,
    Back,
}


struct FRandomFootstepBoneSetting
{
    UPROPERTY()
    FPT_BoneRef BoneRef;
    UPROPERTY()
    EFootPosition FootPosition = EFootPosition(0);
    UPROPERTY()
    float32 AngleScale = 15.0f;
    UPROPERTY()
    FVector AxisRatio = FVector(1.0, 0.5, 0.0);
    UPROPERTY()
    float32 SpringDamping = 0.1f;
    UPROPERTY()
    float32 SpringStiffness = 100.0f;
    UPROPERTY()
    float32 InwardRatio = 1.0f;
    UPROPERTY()
    float32 OutwardRatio = 0.3f;
    UPROPERTY()
    FPT_FloatSpring Spring;


}

class USPT_RandomFootstep : USkeletalPoseTweaker
{
    UPROPERTY()
    float32 FrontFootValue;
    UPROPERTY()
    float32 BackFootValue;
    UPROPERTY()
    TArray<FRandomFootstepBoneSetting> Bones;
    bool bInitialized = false;


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        int local_1 = 0;
        for (; local_1 < this.Bones.Num(); )
        {
            this.Bones[local_1].Spring.Damping = this.Bones[local_1].SpringDamping;
            this.Bones[local_1].Spring.Stiffness = this.Bones[local_1].SpringStiffness;
            this.Bones[local_1].Spring.Init(0.0, 0.0);
            ++local_1;
        }
        this.bInitialized = false;
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        float32 local_5;
        float32 local_8 = 0.0f;
        float32 local_25;
        FVector local_34;
        int local_1 = 0;
        for (; local_1 < this.Bones.Num(); ++local_1)
        {
            if (!(this.Bones[local_1].BoneRef.HasValidSetup()))
            {
                continue;
            }
            if (int(this.Bones[local_1].FootPosition) == 0)
            {
            }
            else
            {
            }
            local_5 = local_8;
            local_8 = local_5 + 1.0f;
            local_8 = local_8 * 0.5f;
            FName local_14 = this.Bones[local_1].BoneRef.GetBoneName();
            if (local_14.ToString().EndsWith("_r", ESearchCase(1)) || local_14.ToString().Contains("_r_", ESearchCase(1), ESearchDir(0)))
            {
                local_25 = FMath::Lerp(this.Bones[local_1].InwardRatio, this.Bones[local_1].OutwardRatio, local_8);
            }
            else
            {
                local_25 = FMath::Lerp(this.Bones[local_1].OutwardRatio, this.Bones[local_1].InwardRatio, local_8);
            }
            float32 local_10 = local_5 * local_25;
            float32 local_9 = local_10 * this.Bones[local_1].AngleScale;
            if (!(this.bInitialized))
            {
                this.Bones[local_1].Spring.Init(local_9, 0.0);
            }
            else
            {
                this.Bones[local_1].Spring.Update(this.CurrentDeltaSeconds, local_9);
            }
            float32 local_26_2 = float32(this.Bones[local_1].Spring.GetPosition());
            float32 local_24 = -local_26_2;
            local_24 = local_26_2;
            local_24 = -local_24;
            FTransform local_68 = FTransform(this.Bones[local_1].BoneRef.GetTransform());
            local_68.SetRotation((FRotator((local_24 * local_34.Y), (local_26_2 * local_34.Z), (local_24 * local_34.X)).Quaternion() * local_68.GetRotation()));
            this.Bones[local_1].BoneRef.SetTransform(local_68);
        }
        this.bInitialized = true;
        return;
    }
}

class USPT_RandomFootstep_MountQuad001 : USPT_RandomFootstep
{
    USPT_RandomFootstep_MountQuad001()
    {
        super();
        FRandomFootstepBoneSetting local_28;
        local_28.BoneRef.SetBoneName(n"clavicle_r");
        local_28.FootPosition = EFootPosition(0);
        local_28.AngleScale = 5.0f;
        local_28.AxisRatio = FVector(1.0, 0.5, 0.0);
        local_28.SpringStiffness = 50.0f;
        local_28.SpringDamping = 0.06f;
        local_28.OutwardRatio = 1.0f;
        local_28.InwardRatio = 0.25f;
        FRandomFootstepBoneSetting local_72;
        local_72.BoneRef.SetBoneName(n"clavicle_l");
        local_72.FootPosition = EFootPosition(0);
        local_72.AngleScale = 5.0f;
        local_72.AxisRatio = FVector(1.0, 0.5, 0.0);
        local_72.SpringStiffness = 50.0f;
        local_72.SpringDamping = 0.06f;
        local_72.OutwardRatio = 1.0f;
        local_72.InwardRatio = 0.25f;
        FRandomFootstepBoneSetting local_100;
        local_100.BoneRef.SetBoneName(n"thigh_r");
        local_100.FootPosition = EFootPosition(1);
        local_100.AngleScale = 6.0f;
        local_100.AxisRatio = FVector(1.0, 0.5, 0.0);
        local_100.SpringStiffness = 50.0f;
        local_100.SpringDamping = 0.06f;
        local_100.OutwardRatio = 1.0f;
        local_100.InwardRatio = 0.3f;
        FRandomFootstepBoneSetting local_128;
        local_128.BoneRef.SetBoneName(n"thigh_l");
        local_128.FootPosition = EFootPosition(1);
        local_128.AngleScale = 6.0f;
        local_128.AxisRatio = FVector(1.0, 0.5, 0.0);
        local_128.SpringStiffness = 50.0f;
        local_128.SpringDamping = 0.06f;
        local_128.OutwardRatio = 1.0f;
        local_128.InwardRatio = 0.3f;
        this.Bones.Add(local_28);
        this.Bones.Add(local_72);
        this.Bones.Add(local_100);
        this.Bones.Add(local_128);
        return;
    }
}

