

class US_FootIKControlAS : UECSScriptSystem
{
    float32 BodyPivotControlLerpSpeed = 0.2f;
    float32 LegFollowBodyRotationWeightLerpSpeed = 0.2f;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_FootIKControl(const FECSEntity &inout Entity, FC_FootIKControl &inout FootIKControl) const
    {
        if (FootIKControl.GetWeight() == 0.0f)
        {
            return;
        }
        if (FootIKControl.GetBodyPivotControl() != FootIKControl.GetTargetBodyPivotControl())
        {
            FootIKControl.SetBodyPivotControl(FMath::Lerp(FootIKControl.GetBodyPivotControl(), FootIKControl.GetTargetBodyPivotControl(), this.BodyPivotControlLerpSpeed));
        }
        if (FootIKControl.GetLegFollowBodyRotationWeight() != FootIKControl.GetTargetLegFollowBodyRotationWeight())
        {
            FootIKControl.SetLegFollowBodyRotationWeight(FMath::Lerp(FootIKControl.GetLegFollowBodyRotationWeight(), FootIKControl.GetTargetLegFollowBodyRotationWeight(), this.LegFollowBodyRotationWeightLerpSpeed));
        }
        return;
    }
    UFUNCTION()
    void Run_Job_FootIKControl() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_FootIKControl(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_FootIKControl(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

