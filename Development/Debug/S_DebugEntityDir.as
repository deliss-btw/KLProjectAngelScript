
const FConsoleVariable CVar_DebugEntityDir = FConsoleVariable();

class US_DebugEntityDir : UECSScriptSystem
{
    US_DebugEntityDir()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return (CVar_DebugEntityDir.GetInt() == 0);
    }
    UFUNCTION()
    void DebugEntityDir(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_TransformHistory &inout TransformHistory, const FC_Input &inout Input, const FCS_FixedTime &inout Time) const
    {
        if (Time.bClientSingularTick == false)
        {
            return;
        }
        UECSDebugDrawSubsystem local_6 = UECSDebugDrawSubsystem::Get();
        if (local_6 == nullptr)
        {
            return;
        }
        float local_8 = Time.DeltaTime.ToSeconds();
        FVector local_16 = Transform.GetPosition();
        local_6.DrawDirectionalArrow(FTransform(Transform.GetRotation().Rotator(), local_16, FVector::OneVector), 100.0f, 5.0f, FLinearColor::Red, 0.0f, ESceneDepthPriorityGroup(1), 0.0f);
        FFPTime local_56 = FFPTime(Time.Time);
        Input.State.EnableDisableWarning(true);
        FTransform local_48 = FTransform(FCharacterInputUtils::GetViewInputDir(Entity, local_56).Quaternion(), FCharacterInputUtils::GetViewPosition(Entity, TransformHistory, local_56), FVector::OneVector);
        local_6.DrawDirectionalArrow(local_48, 100.0f, 5.0f, FLinearColor::Blue, 0.0f, ESceneDepthPriorityGroup(1), 0.0f);
        FVector local_62 = FCharacterInputUtils::GetWorldMoveInput(Entity, local_56, FFPTime(local_8), false);
        FVector local_108 = (local_16 + FVector(0.0, 0.0, 10.0));
        float local_10 = local_62.Size();
        if (!(local_62.IsNearlyZero(9.999999747378752e-5)))
        {
        }
        else
        {
        }
        FQuat local_84 = local_62.ToOrientationQuat();
        local_6.DrawDirectionalArrow(local_48, (float32(((90.0 * local_10) + 10.0))), 5.0f);
        Input.State.EnableDisableWarning(false);
        return;
    }
    UFUNCTION()
    void Run_DebugEntityDir() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_190 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.DebugEntityDir(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_118 = 0;
        FECSRuntimeViewIterator local_152 = local_100.Iterator();
        for (; local_152.CanProceed;)
        {
            local_40 = local_152.Proceed();
            ++local_118;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.DebugEntityDir(local_190, local_42, local_48, local_54, local_6);
            local_62.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_118);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

