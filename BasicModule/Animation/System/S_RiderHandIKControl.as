

class US_RiderHandIKControl : UECSScriptSystem
{
    float32 WeightLerpSpeed = 0.15f;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_UpdateRiderHandIKWeight(const FECSEntity &inout Entity, FC_RiderHandIKControl &inout HandIKControl) const
    {
        if (HandIKControl.GetWeight() != HandIKControl.GetTargetWeight())
        {
            HandIKControl.SetWeight(FMath::Lerp(HandIKControl.GetWeight(), HandIKControl.GetTargetWeight(), this.WeightLerpSpeed));
            if (FMath::Abs((HandIKControl.GetWeight() - HandIKControl.GetTargetWeight())) < 0.01f)
            {
                HandIKControl.SetWeight(HandIKControl.GetTargetWeight());
            }
        }
        if (HandIKControl.GetLeftHandWeight() != HandIKControl.GetTargetLeftHandWeight())
        {
            HandIKControl.SetLeftHandWeight(FMath::Lerp(HandIKControl.GetLeftHandWeight(), HandIKControl.GetTargetLeftHandWeight(), this.WeightLerpSpeed));
        }
        if (HandIKControl.GetRightHandWeight() != HandIKControl.GetTargetRightHandWeight())
        {
            HandIKControl.SetRightHandWeight(FMath::Lerp(HandIKControl.GetRightHandWeight(), HandIKControl.GetTargetRightHandWeight(), this.WeightLerpSpeed));
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateRiderHandIKWeight() const
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
                this.Job_UpdateRiderHandIKWeight(local_36, local_38);
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
            this.Job_UpdateRiderHandIKWeight(local_170, local_38);
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

