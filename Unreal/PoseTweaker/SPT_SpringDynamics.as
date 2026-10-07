

class USPT_SpringDynamics : USkeletalPoseTweaker
{
    UPROPERTY()
    TArray<FSpringDynamicsBoneState> ModifyBoneStates;
    FPT_SpringSimulator SpringSimulator;

    USPT_SpringDynamics()
    {
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        this.SpringSimulator.Reset(this.ModifyBoneStates);
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        TArray<FSpringDynamicsSimResults> local_8 = this.SpringSimulator.SimulateStep();
        for (auto& local_24 : local_8)
        {
            for (auto& local_38 : this.ModifyBoneStates)
            {
                bool local_42 = local_38.ModifyBone.GetBoneName().IsEqual(local_24.BoneName, true, true);
                if (local_42)
                {
                    FTransform local_68 = FTransform(local_38.ModifyBone.GetTransform());
                    local_68.SetLocation(local_24.Location);
                    local_38.ModifyBone.SetTransform(local_68);
                    break;
                }
            }
        }
        return;
    }
}

