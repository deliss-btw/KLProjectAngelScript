

class USPT_TrajectoryBlend_Monster_Quad003 : USPT_TrajectoryBlend_Template
{
    USPT_TrajectoryBlend_Monster_Quad003()
    {
        super();
        this.PelvisBone.SetBoneName(n"pelvis");
        this.HeadBone.SetBoneName(n"Head");
        this.LeanStrength = 0.2f;
        this.MaxLeanAngle = 5.0f;
        FTrajectoryFootIKLeg local_132;
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l");
        local_132.IKSolver.EffectorBoneName = n"middle_01_l";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r");
        local_132.IKSolver.EffectorBoneName = n"middle_01_r";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|lowcalf_l");
        local_132.IKSolver.EffectorBoneName = n"foot_l";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|lowcalf_r");
        local_132.IKSolver.EffectorBoneName = n"foot_r";
        this.LegIKs.Add(local_132);
        this.MinFutureTrajectoryRadius = 100.0f;
        this.HistoryTrajectorySmoothIteration = 0;
        this.bEnableDebugDraw = false;
        return;
    }
}

