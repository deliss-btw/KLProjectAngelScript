

class USPT_AimPose_Character_StdF : USPT_AimPose_Base
{
    USPT_AimPose_Character_StdF()
    {
        super();
        USolver_LookAtWeightCurve local_4 = USolver_LookAtWeightCurve();
        local_4.Setup(n"Spine", "spine_01|spine_02|spine_03", 0);
        local_4.SetRootBone(n"Root");
        this.Segments.Add(local_4);
        USolver_LookAtWeightCurve local_8 = USolver_LookAtWeightCurve();
        local_8.Setup(n"Left_Arm", "clavicle_l|upperarm_l", 10);
        local_8.ParentSegmentName = n"Spine";
        local_8.SetRootBone(n"Root");
        this.Segments.Add(local_8);
        USolver_LookAtWeightCurve local_10 = USolver_LookAtWeightCurve();
        local_10.Setup(n"Right_Arm", "clavicle_r|upperarm_r", 10);
        local_10.ParentSegmentName = n"Spine";
        local_10.SetRootBone(n"Root");
        this.Segments.Add(local_10);
        USolver_LookAtWeightCurve local_12 = USolver_LookAtWeightCurve();
        local_12.Setup(n"NeckHead", "neck_01|head", 10);
        local_12.ParentSegmentName = n"Spine";
        local_12.SetRootBone(n"Root");
        this.Segments.Add(local_12);
        UCompensator_TwoBoneIK local_16 = UCompensator_TwoBoneIK();
        local_16.Setup(n"LegIK_L", n"foot_l", "thigh_l|calf_l|foot_l", n"foot_l", 0);
        this.Compensators.Add(local_16);
        UCompensator_TwoBoneIK local_20 = UCompensator_TwoBoneIK();
        local_20.Setup(n"LegIK_R", n"foot_r", "thigh_r|calf_r|foot_r", n"foot_r", 0);
        this.Compensators.Add(local_20);
        return;
    }
}

class USPT_AimPose_Character_BanditSui : USPT_AimPose_Base
{
    USPT_AimPose_Character_BanditSui()
    {
        super();
        USolver_LookAtWeightCurve local_4 = USolver_LookAtWeightCurve();
        local_4.Setup(n"Spine", "pelvis|spine_01|spine_02|spine_03", 0);
        this.Segments.Add(local_4);
        USolver_LookAtWeightCurve local_8 = USolver_LookAtWeightCurve();
        local_8.Setup(n"NeckHead", "neck_01|neck_02|head", 10);
        local_8.ParentSegmentName = n"Spine";
        this.Segments.Add(local_8);
        UCompensator_TwoBoneIK local_12 = UCompensator_TwoBoneIK();
        local_12.Setup(n"LegIK_L", n"foot_l", "thigh_l|calf_l|foot_l", n"foot_l", 0);
        this.Compensators.Add(local_12);
        UCompensator_TwoBoneIK local_16 = UCompensator_TwoBoneIK();
        local_16.Setup(n"LegIK_R", n"foot_r", "thigh_r|calf_r|foot_r", n"foot_r", 0);
        this.Compensators.Add(local_16);
        return;
    }
}

class USPT_AimPose_Character_TheLostBeast : USPT_AimPose_Base
{
    USPT_AimPose_Character_TheLostBeast()
    {
        super();
        USolver_LookAtWeightCurve local_4 = USolver_LookAtWeightCurve();
        local_4.Setup(n"Spine", "spine_02|spine_03", 0);
        this.Segments.Add(local_4);
        USolver_LookAtWeightCurve local_8 = USolver_LookAtWeightCurve();
        local_8.Setup(n"NeckHead", "neck_01|neck_02|head", 10);
        local_8.ParentSegmentName = n"Spine";
        this.Segments.Add(local_8);
        UCompensator_RollFromAngularVelocity local_12 = UCompensator_RollFromAngularVelocity();
        local_12.Setup(n"NeckRoll", "neck_01|neck_02|head", 0);
        this.Compensators.Add(local_12);
        return;
    }
}

class USPT_AimPose_Wyvern : USPT_AimPose_Base
{
    USPT_AimPose_Wyvern()
    {
        super();
        USolver_LookAtWeightCurve local_4 = USolver_LookAtWeightCurve();
        local_4.Setup(n"Neck", "neck_01|neck_02|neck_03|neck_04|neck_05|neck_06|head", 0);
        local_4.SetFollowBone(n"Head");
        this.Segments.Add(local_4);
        UCompensator_RollFromAngularVelocity local_10 = UCompensator_RollFromAngularVelocity();
        local_10.Setup(n"NeckRoll", "neck_06|head", 0);
        this.Compensators.Add(local_10);
        return;
    }
}

