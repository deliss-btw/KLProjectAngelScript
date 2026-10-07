
enum ETailKawaiiTreat
{
    BeforeObstacleAvoid,
    AfterObstacleAvoid,
    Disable,
}


UCLASS(Abstract)
class USPT_TailDynamics_Base : USkeletalPoseTweaker
{
    UPROPERTY()
    FPT_KawaiiChain TailChain;
    UPROPERTY()
    FKLKawaiiPhysicsSettings TailPhysicsSettings;
    UPROPERTY()
    float32 BackPullRatio = 0.7f;
    UPROPERTY()
    float32 UpDragRation = 1.5f;
    UPROPERTY()
    FVector UpVector = FVector(0.0, 0.0, 1.0);
    UPROPERTY()
    ETailKawaiiTreat TailKawaiiTreat = ETailKawaiiTreat(2);


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        int local_62;
        if (!(this.TailChain.IsValid()))
        {
            return;
        }
        if (int(this.TailKawaiiTreat) == 0)
        {
            this.TailChain.Update(this.CurrentDeltaSeconds, this.TailPhysicsSettings, FKLBodyBonePose());
        }
        local_62 = this.TailChain.GetBoneNum();
        FTransform local_116 = this.TailChain.GetTransform(local_62 >> 1);
        FVector local_122(this.TailChain.GetTailTM().GetLocation());
        FVector local_128 = FVector(0.0, 0.0, 1.0);
        FVector local_146 = local_122;
        bool local_1 = this.LineTraceScene(this.TailChain.GetRootTM().GetLocation(), this.TailChain.GetTailTM().GetLocation(), local_122, local_128, false);
        if (local_1)
        {
            FVector local_178 = (this.TailChain.GetTailTM().GetLocation() - local_122);
            FVector local_196 = (this.TailChain.GetRootTM().GetLocation() + ((local_122 - this.TailChain.GetRootTM().GetLocation()) * this.BackPullRatio));
            FVector local_190_2 = (this.UpVector * local_178.Size());
            FVector local_184_2 = (local_190_2 * this.UpDragRation);
            this.TailChain.FABRIK_Solve((local_196 + local_184_2));
        }
        if (int(this.TailKawaiiTreat) == 1)
        {
            this.TailChain.Update(this.CurrentDeltaSeconds, this.TailPhysicsSettings, FKLBodyBonePose());
        }
        return;
    }
}

