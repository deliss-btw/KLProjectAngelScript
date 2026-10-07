

class USPT_AimPose_Base : USkeletalPoseTweaker
{
    UPROPERTY()
    FC_AnimAimPoseOutput AimPoseInput;
    UPROPERTY()
    FC_AnimResolved AnimResolved;
    UPROPERTY()
    FC_LookResolved LookResolved;
    UPROPERTY()
    FC_AimPoseConfig AimPoseConfig;
    TArray<UAimPoseSegmentSolver> Segments;
    TArray<UAimPoseCompensator> Compensators;
    bool bConfigInitialized = false;
    bool bBoneRefsInitialized = false;


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void InitializeFromConfig(const FAnimAimPoseConfig &inout Config, const bool ResetAttr)
    {
        if (ResetAttr)
        {
            this.BuildSegmentsFromConfig(Config);
            this.BuildCompensatorsFromConfig(Config);
            this.SortByOrder(this.Segments);
            this.SortByOrder(this.Compensators);
            this.ValidateNames();
            this.bConfigInitialized = true;
            this.bBoneRefsInitialized = false;
        }
        else
        {
            for (auto local_16 : this.Segments)
            {
                int local_17 = 0;
                while (local_17 < 0)
                {
                    if ((FName(Config.Segments[local_17].SegmentName) == local_16.ProcessorName))
                    {
                        local_16.InitFromConfig(Config.Segments[local_17], false);
                        break;
                    }
                    ++local_17;
                }
            }
            this.ApplyCompensatorConfig(Config, false);
        }
        if (!(this.bBoneRefsInitialized))
        {
            for (auto local_16 : this.Segments)
            {
                local_16.InitializeBoneRefs(this);
            }
            for (auto local_36 : this.Compensators)
            {
                local_36.InitializeBoneRefs(this);
            }
            this.bBoneRefsInitialized = true;
        }
        return;
    }
    void BuildSegmentsFromConfig(const FAnimAimPoseConfig &inout Config)
    {
        this.Segments.Empty(0);
        int local_2 = 0;
        while (local_2 < 0)
        {
            const FAimPoseSegmentConfig& local_6 = Config.Segments[local_2];
            UAimPoseSegmentSolver local_12 = ::AimPoseSolverFactory::Create(local_6.SolverMode);
            if (local_6.BoneChains.Num() > 0)
            {
                local_12.Setup(local_6.SegmentName, local_6.BoneChains, int(local_6.SolveOrder));
            }
            else
            {
                local_12.Setup(local_6.SegmentName, local_6.BoneChainNames, int(local_6.SolveOrder));
            }
            local_12.ParentSegmentName = local_6.ParentSegmentName;
            local_12.InitFromConfig(local_6, true);
            this.Segments.Add(local_12);
            ++local_2;
        }
        return;
    }
    void BuildCompensatorsFromConfig(const FAnimAimPoseConfig &inout Config)
    {
        int local_3 = 0;
        this.Compensators.Empty(0);
        int local_2 = 0;
        while (local_2 < local_3)
        {
            const FAimPoseCompensatorConfig& local_6 = Config.Compensators[local_2];
            UAimPoseCompensator local_12 = ::AimPoseCompensatorFactory::Create(local_6.Method);
            local_12.SetIdentity(local_6.Name, int(local_6.Order));
            local_12.InitFromConfig(local_6, true);
            this.Compensators.Add(local_12);
            ++local_2;
            local_3 = Config.Compensators.Num();
        }
        return;
    }
    void ApplyCompensatorConfig(const FAnimAimPoseConfig &inout Config, const bool ResetAttr)
    {
        UAimPoseCompensator local_16;
        bool local_17;
        auto local_6 = this.Compensators.Iterator();
        for (; local_6.CanProceed;)
        {
            local_16 = local_6.Proceed();
            local_17 = false;
            int local_18 = 0;
            while (local_18 < 0)
            {
                if ((FName(Config.Compensators[local_18].Name) == local_16.ProcessorName))
                {
                    local_16.InitFromConfig(Config.Compensators[local_18], ResetAttr);
                    local_17 = true;
                    break;
                }
                ++local_18;
            }
            if (!(local_17))
            {
                local_16.bEnabled = false;
            }
        }
        return;
    }
    void SortByOrder(TArray<UAimPoseSegmentSolver> &inout Arr)
    {
        int local_1 = 0;
        for (; local_1 < Arr.Num(); ++local_1)
        {
            int local_6 = local_1 + 1;
            for (; local_6 < Arr.Num(); ++local_6)
            {
                if (Arr[local_6].Order < Arr[local_1].Order)
                {
                    Arr.Swap(local_1, local_6);
                }
            }
        }
        return;
    }
    void SortByOrder(TArray<UAimPoseCompensator> &inout Arr)
    {
        int local_1 = 0;
        for (; local_1 < Arr.Num(); ++local_1)
        {
            int local_6 = local_1 + 1;
            for (; local_6 < Arr.Num(); ++local_6)
            {
                if (Arr[local_6].Order < Arr[local_1].Order)
                {
                    Arr.Swap(local_1, local_6);
                }
            }
        }
        return;
    }
    void ValidateNames()
    {
        return;
    }
    void ApplyOutputOverrides(const FC_AnimAimPoseOutput &inout Output)
    {
        for (auto local_16 : this.Segments)
        {
            local_16.ResetToConfigDefaults();
        }
        for (auto& local_30 : Output.GetSegmentOverrides())
        {
            for (auto local_16 : this.Segments)
            {
                if ((local_16.ProcessorName == local_30.GetSegmentName()))
                {
                    local_16.ApplyOverride(local_30);
                    break;
                }
            }
        }
        for (auto local_48 : this.Compensators)
        {
            local_48.ResetToConfigDefaults();
        }
        for (auto& local_62 : Output.GetCompensatorOverrides())
        {
            for (auto local_48 : this.Compensators)
            {
                if ((local_48.ProcessorName == local_62.GetName()))
                {
                    local_48.ApplyOverride(local_62);
                    break;
                }
            }
        }
        return;
    }
    FAimPoseSegmentContext FindParentContext(const int SegIndex, const TArray<FAimPoseSegmentContext> &inout CtxOutputs) const
    {
        FAimPoseSegmentContext local_16;
        FName local_18 = this.Segments[SegIndex].ParentSegmentName;
        if (local_18.IsNone())
        {
            return local_16;
        }
        int local_20 = 0;
        for (; local_20 < SegIndex; ++local_20)
        {
            if ((FName(this.Segments[local_20].ProcessorName) == local_18))
            {
                local_16 = CtxOutputs[local_20];
                break;
            }
        }
        return local_16;
    }
}

