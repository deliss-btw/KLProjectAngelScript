

struct FCharacter_AO_DebugDrawSetting
{
    UPROPERTY()
    bool bDrawAnimTarget = false;
    UPROPERTY()
    bool bDrawCurrentTarget = false;


}

class USPT_Character_AO_Template : USkeletalPoseTweaker
{
    UPROPERTY()
    FVector InputAnimTarget;
    UPROPERTY()
    float32 InputPitch = 0.0f;
    UPROPERTY()
    float32 MinPitch = -30.0f;
    UPROPERTY()
    float32 MaxPitch = 30.0f;
    UPROPERTY()
    float32 InputYaw = 0.0f;
    UPROPERTY()
    float32 MinYaw = -30.0f;
    UPROPERTY()
    float32 MaxYaw = 30.0f;
    UPROPERTY()
    bool bEnableAdjustPelvis = true;
    UPROPERTY()
    bool bEnableAdjustSpine = true;
    UPROPERTY()
    bool bEnableAdjustHead = true;
    UPROPERTY()
    bool bEnableAdjustLeftArm = true;
    UPROPERTY()
    bool bEnableAdjustRightArm = true;
    UPROPERTY()
    FPT_BoneRef Spine01;
    UPROPERTY()
    FPT_BoneRef Spine02;
    UPROPERTY()
    FPT_BoneRef Spine03;
    UPROPERTY()
    FPT_BoneRef Neck;
    UPROPERTY()
    FPT_BoneRef Head;
    UPROPERTY()
    FPT_BoneRef Shoulder_L;
    UPROPERTY()
    FPT_BoneRef UpArm_L;
    UPROPERTY()
    FPT_BoneRef Shoulder_R;
    UPROPERTY()
    FPT_BoneRef UpArm_R;
    UPROPERTY()
    FPT_BoneRef Foot_L;
    UPROPERTY()
    FPT_BoneRef Foot_R;
    UPROPERTY()
    FPT_BoneRef Pelvis;
    UPROPERTY()
    FPT_TwoBoneIK LeftLegIK;
    UPROPERTY()
    FPT_TwoBoneIK RightLegIK;
    UPROPERTY()
    FCharacter_AO_DebugDrawSetting DebugDrawSetting;
    FTransform SpineOffset;
    FTransform LeftShoulderOffset;
    FTransform RightShoulderOffset;
    FRotator AimRotationOffset;
    FVector CurrentTargetLocation;


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        this.SpineOffset = FTransform::Identity;
        this.LeftShoulderOffset = FTransform::Identity;
        this.RightShoulderOffset = FTransform::Identity;
        this.AimRotationOffset = FRotator::ZeroRotator;
        this.CurrentTargetLocation = FVector::ZeroVector;
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        this.Init_EachFrame();
        if (this.bEnableAdjustPelvis)
        {
            this.AdjustPelvis();
        }
        if (this.bEnableAdjustSpine)
        {
            this.AdjustSpine();
        }
        if (this.bEnableAdjustHead)
        {
            this.AdjustHead();
        }
        this.AdjustArm();
        return;
    }
    void Init_EachFrame()
    {
        float local_16 = FMath::Clamp(this.InputYaw, this.MinYaw, this.MaxYaw);
        this.AimRotationOffset = FRotator(FMath::Clamp(this.InputPitch, this.MinPitch, this.MaxPitch), local_16, 0.0);
        this.CurrentTargetLocation = this.AimRotationOffset.Quaternion().RotateVector(FVector(this.InputAnimTarget.X, this.InputAnimTarget.Y, 0.0));
        this.CurrentTargetLocation.Z = (this.CurrentTargetLocation.Z + this.InputAnimTarget.Z);
        if (this.DebugDrawSetting.bDrawAnimTarget)
        {
            this.DrawAnimDebugSphere(this.InputAnimTarget, 3.0f, 8, FColor::Green, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(0));
        }
        if (this.DebugDrawSetting.bDrawCurrentTarget)
        {
            this.DrawAnimDebugSphere(this.CurrentTargetLocation, 4.0f, 8, FColor::Red, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(0));
        }
        FTransform local_68 = FTransform(this.InputAnimTarget);
        this.SpineOffset = (local_68 * this.Spine03.GetTransform().Inverse());
        this.LeftShoulderOffset = (local_68 * this.Shoulder_L.GetTransform().Inverse());
        this.RightShoulderOffset = (local_68 * this.Shoulder_R.GetTransform().Inverse());
        return;
    }
    void AdjustPelvis()
    {
        FTransform local_24 = FTransform(this.Foot_L.GetTransform());
        FTransform local_72 = FTransform(this.Foot_R.GetTransform());
        this.RotateBoneWithOffsetQuat(this.Pelvis, this.AimRotationOffset, this.MinPitch, this.MaxPitch, -5.0f, 5.0f, this.MinYaw, this.MaxYaw, -5.0f, 5.0f);
        this.LeftLegIK.Solve(local_24);
        this.RightLegIK.Solve(local_72);
        return;
    }
    void AdjustSpine()
    {
        this.RotateBoneWithOffsetQuat(this.Spine01, this.AimRotationOffset, this.MinPitch, this.MaxPitch, -5.0f, 5.0f, this.MinYaw, this.MaxYaw, -5.0f, 5.0f);
        this.RotateBoneWithOffsetQuat(this.Spine02, this.AimRotationOffset, this.MinPitch, this.MaxPitch, -5.0f, 5.0f, this.MinYaw, this.MaxYaw, -5.0f, 5.0f);
        this.RotateBoneWithOffsetQuat(this.Spine03, this.AimRotationOffset, this.MinPitch, this.MaxPitch, -5.0f, 5.0f, this.MinYaw, this.MaxYaw, -5.0f, 5.0f);
        return;
    }
    void AdjustHead()
    {
        FTransform local_56 = this.RotateBoneWithOffsetQuat(this.Neck, this.AimRotationOffset, this.MinPitch, this.MaxPitch, -10.0f, 10.0f, this.MinYaw, this.MaxYaw, -5.0f, 5.0f);
        FTransform local_104 = (this.SpineOffset * local_56);
        FVector local_110(this.Head.GetTransform().GetLocation());
        FQuat::FindBetween((local_104.GetLocation() - local_110), (this.CurrentTargetLocation - local_110));
        this.RotateBoneWithOffsetQuat(this.Head, this.AimRotationOffset, this.MinPitch, this.MaxPitch, -15.0f, 15.0f, this.MinYaw, this.MaxYaw, -0.0f, 0.0f);
        return;
    }
    void AdjustArm()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    FTransform RotateBoneWithOffsetQuat(FPT_BoneRef &inout Bone, const FRotator &inout OffsetRotation, const float32 _MinPitch, const float32 _MaxPitch, const float32 _LimitMinPitch, const float32 _LimitMaxPitch, const float32 _MinYaw, const float32 _MaxYaw, const float32 _LimitMinYaw, const float32 _LimitMaxYaw)
    {
        FTransform local_44 = FTransform(Bone.GetTransform());
        local_44.SetRotation((FRotator((this.MapAngle(float32(OffsetRotation.Pitch), _MinPitch, _MaxPitch, _LimitMinPitch, _LimitMaxPitch)), (this.MapAngle(float32(OffsetRotation.Yaw), _MinYaw, _MaxYaw, _LimitMinYaw, _LimitMaxYaw)), OffsetRotation.Roll).Quaternion() * local_44.GetRotation()));
        Bone.SetTransform(local_44);
        return local_44;
    }
    float32 MapAngle(const float32 InputAngle, const float32 MinAngle, const float32 MaxAngle, const float32 LimitMinAngle, const float32 LimitMaxAngle)
    {
        float32 local_3;
        if (FMath::IsNearlyZero(InputAngle, 1e-8f))
        {
            return 0.0f;
        }
        else
        {
            if (InputAngle < 0.0f)
            {
                if (FMath::IsNearlyZero(MinAngle, 1e-8f))
                {
                    local_3 = 0.0f;
                }
                else
                {
                    local_3 = (InputAngle / MinAngle) * LimitMinAngle;
                }
                return local_3;
            }
            else
            {
                if (FMath::IsNearlyZero(MaxAngle, 1e-8f))
                {
                    local_3 = 0.0f;
                }
                else
                {
                    local_3 = (InputAngle / MaxAngle) * LimitMaxAngle;
                }
                return local_3;
            }
        }
    }
}

class USPT_Character_AO_StdF_Base : USPT_Character_AO_Template
{
    USPT_Character_AO_StdF_Base()
    {
        super();
        this.Spine01.SetBoneName(n"spine_01");
        this.Spine02.SetBoneName(n"spine_02");
        this.Spine03.SetBoneName(n"spine_03");
        this.Neck.SetBoneName(n"neck_01");
        this.Head.SetBoneName(n"Head");
        this.Shoulder_L.SetBoneName(n"clavicle_l");
        this.UpArm_L.SetBoneName(n"upperarm_l");
        this.Foot_L.SetBoneName(n"foot_l");
        this.Shoulder_R.SetBoneName(n"clavicle_r");
        this.UpArm_R.SetBoneName(n"upperarm_r");
        this.Foot_R.SetBoneName(n"foot_r");
        this.Pelvis.SetBoneName(n"pelvis");
        this.LeftLegIK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|foot_l");
        this.LeftLegIK.EffectorBoneName = n"foot_l";
        this.RightLegIK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|foot_r");
        this.RightLegIK.EffectorBoneName = n"foot_r";
        return;
    }
}

class USPT_Character_AO_Biped_Base : USPT_Character_AO_Template
{
    USPT_Character_AO_Biped_Base()
    {
        super();
        this.Spine01.SetBoneName(n"spine_01");
        this.Spine02.SetBoneName(n"spine_02");
        this.Spine03.SetBoneName(n"spine_03");
        this.Neck.SetBoneName(n"neck_01");
        this.Head.SetBoneName(n"Head");
        this.Shoulder_L.SetBoneName(n"clavicle_l");
        this.UpArm_L.SetBoneName(n"upperarm_l");
        this.Foot_L.SetBoneName(n"foot_l");
        this.Shoulder_R.SetBoneName(n"clavicle_r");
        this.UpArm_R.SetBoneName(n"upperarm_r");
        this.Foot_R.SetBoneName(n"foot_r");
        this.Pelvis.SetBoneName(n"pelvis");
        this.LeftLegIK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|foot_l");
        this.LeftLegIK.EffectorBoneName = n"foot_l";
        this.RightLegIK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|foot_r");
        this.RightLegIK.EffectorBoneName = n"foot_r";
        return;
    }
}

