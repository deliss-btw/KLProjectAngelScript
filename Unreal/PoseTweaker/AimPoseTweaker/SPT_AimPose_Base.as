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
        FAnimAimPoseConfig local_20;
        TDataObjectPtr<FAnimAimPoseConfig> local_44;
        local_44 = this.AimPoseConfig.GetConfigPtr();
        if (!((local_44 == nullptr)))
        {
        }
        else
        {
            return;
        }
        this.InitializeFromConfig(local_20, !(this.bConfigInitialized));
        this.ApplyOutputOverrides(this.AimPoseInput);
        if (FMath::IsNearlyZero(this.AimPoseInput.GetWeight(), 1e-8f))
        {
            return;
        }
        float32 local_72 = this.CurrentDeltaSeconds;
        for (auto local_86 : this.Compensators)
        {
            local_86.Snapshot();
        }
        TArray<FAimPoseSegmentContext> local_90;
        local_90.SetNum(this.Segments.Num());
        int local_92 = 0;
        for (; local_92 < this.Segments.Num(); )
        {
            FAnimSnapshot local_112;
            if (this.AnimResolved && !(this.AnimResolved.SnapshotMap.IsEmpty()))
            {
                if (!(this.AnimResolved.SnapshotMap.Find(this.Segments[local_92].ChannelKey, local_112)))
                {
                    return;
                }
            }
            else
            {
                if (this.LookResolved)
                {
                    local_112 = this.LookResolved.Snapshot;
                }
            }
            FAimPoseSegmentContext local_148 = this.FindParentContext(local_92, local_90);
            this.Segments[local_92].SolveTarget(uint8(local_112.GetAnimSnapshotTypeMask()), local_112.GetPosition(), local_112.GetRotator(), local_72, local_148);
            local_90[local_92] = local_148;
            ++local_92;
        }
        FAimPoseCompensatorExecContext local_152;
        local_152.DeltaTime = local_72;
        for (auto local_86 : this.Compensators)
        {
            local_86.Execute(local_152);
        }
        return;
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
                for (; local_17 < Config.Segments.Num(); ++local_17)
                {
                    if ((FName(Config.Segments[local_17].SegmentName) == local_16.ProcessorName))
                    {
                        local_16.InitFromConfig(Config.Segments[local_17], false);
                        break;
                    }
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
        for (; local_2 < Config.Segments.Num(); )
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
        this.Compensators.Empty(0);
        int local_2 = 0;
        for (; local_2 < Config.Compensators.Num(); )
        {
            const FAimPoseCompensatorConfig& local_6 = Config.Compensators[local_2];
            UAimPoseCompensator local_12 = ::AimPoseCompensatorFactory::Create(local_6.Method);
            local_12.SetIdentity(local_6.Name, int(local_6.Order));
            local_12.InitFromConfig(local_6, true);
            this.Compensators.Add(local_12);
            ++local_2;
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
            for (; local_18 < Config.Compensators.Num(); ++local_18)
            {
                if ((FName(Config.Compensators[local_18].Name) == local_16.ProcessorName))
                {
                    local_16.InitFromConfig(Config.Compensators[local_18], ResetAttr);
                    local_17 = true;
                    break;
                }
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

