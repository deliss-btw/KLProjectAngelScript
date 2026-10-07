

class USPT_TrajectoryBlend_Mount_Quad001 : USPT_TrajectoryBlend_Template
{
    USPT_TrajectoryBlend_Mount_Quad001()
    {
        super();
        this.PelvisBone.SetBoneName(n"pelvis");
        this.HeadBone.SetBoneName(n"Head");
        this.LeanStrength = 0.2f;
        this.MaxLeanAngle = 20.0f;
        FTrajectoryFootIKLeg local_132;
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("lowerarm_l|hand_l|fingerbase_l");
        local_132.IKSolver.EffectorBoneName = n"finger_01_l";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("lowerarm_r|hand_r|fingerbase_r");
        local_132.IKSolver.EffectorBoneName = n"finger_01_r";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|lowcalf_l");
        local_132.IKSolver.EffectorBoneName = n"foot_l";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|lowcalf_r");
        local_132.IKSolver.EffectorBoneName = n"foot_r";
        this.LegIKs.Add(local_132);
        this.MinFutureTrajectoryRadius = 100.0f;
        this.HistoryTrajectorySmoothIteration = 0;
        return;
    }
}

