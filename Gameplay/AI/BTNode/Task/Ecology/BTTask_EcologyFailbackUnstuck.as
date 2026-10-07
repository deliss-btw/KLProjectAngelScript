

class UBTTask_EcologyDemoRequestDither : UBTTask_ECSScriptBase
{
    UPROPERTY()
    bool IsDitherIn = false;
    UPROPERTY()
    float32 duration = 1.0f;

    default SetNodeName("Ecology Demo Request Dither");


    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        FECSEntity local_8 = FECSEntity(Context.PawnEntity);
        if (!(this.IsDitherIn))
        {
            ::FDitherEffectUtils::RequestDitherEffect(local_8, n"EcologyUnstuckDisappear", this.duration, true);
        }
        else
        {
            ::FDitherEffectUtils::RemoveDitherEffect(local_8, n"EcologyUnstuckDisappear", this.duration);
        }
        return EBTNodeResult(0);
    }
}

class UBTTask_EcologyDemoRequesTeleport : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetLocationKey;

    default SetNodeName("Ecology Demo Request Teleport");

    UBTTask_EcologyDemoRequesTeleport()
    {
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        FECSEntity local_8 = FECSEntity(Context.PawnEntity);
        FVector local_20 = local_2.GetValueAsVector(this.TargetLocationKey.SelectedKeyName);
        FRotator local_26 = FRotator(FRotator::ZeroRotator);
        ::FEcologyUtils::TeleportEcologyCreatureToTransform(local_8, local_20, local_26, true);
        return EBTNodeResult(0);
    }
}

