

class UBTTask_EcosimAICheckLocationUnderSky : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetLocation;

    default SetNodeName("EcosimAICheckLocationUnderSky");

    UBTTask_EcosimAICheckLocationUnderSky()
    {
        this.TargetLocation.SelectedKeyName = n"TargetLocation";
        this.TargetLocation.AddVectorFilter(this, n"TargetLocation");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_21;
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        bool local_20 = ::FASCommonUtils::IsLocationUnderSky(local_2.GetValueAsVector(this.TargetLocation.SelectedKeyName), Context.PawnEntity);
        if (local_20)
        {
            local_21 = 0;
        }
        else
        {
            local_21 = 1;
        }
        return EBTNodeResult(local_21);
    }
}

