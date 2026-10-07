

class UESMAnimInstance_MonsterQuadruped : UESMAnimInstance_MonsterBase
{
    UPROPERTY()
    bool Phase3WingStill = false;


    void UpdataCharacterEntityBBData(const FFPTime &inout LocalTime)
    {
        Super::UpdataCharacterEntityBBData(LocalTime);
        FNameHandle_EntityBBVar local_6;
        local_6;
        if (this.Entity.HasEntityBB(local_6))
        {
            FNameHandle_EntityBBVarBool local_12;
            local_12;
            this.Phase3WingStill = this.Entity.GetBB_Bool(local_12);
        }
        return;
    }
    UFUNCTION()
    float32 GetTrajectoryCurvature()
    {
        return ((this.SampleTrajectory.GetData().GetNormalizedRearCurvature() + this.SampleTrajectory.GetData().GetNormalizedFrontCurvature()) / 2.0f);
    }
}

