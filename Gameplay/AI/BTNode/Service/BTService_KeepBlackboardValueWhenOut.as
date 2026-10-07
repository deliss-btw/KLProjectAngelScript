

struct FKeepBlackboardVectorValueWhenOutBTServiceInstanceData
{
    UPROPERTY()
    FVector VectorValue;

    FKeepBlackboardVectorValueWhenOutBTServiceInstanceData()
    {
        return;
    }
}

class UBTService_KeepBlackboardVectorValueWhenOut : UBTService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector VectorBlackboard;

    default SetNodeName("KeepBlackboardVectorValueWhenOut");

    UBTService_KeepBlackboardVectorValueWhenOut()
    {
        this.VectorBlackboard.AddVectorFilter(this, n"VectorBlackboard");
        return;
    }
    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FKeepBlackboardVectorValueWhenOutBTServiceInstanceData;
    }
    UFUNCTION()
    void OnBecomeRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_4 = Context.GetOwnerComponent().GetBlackboardComponent();
        FKeepBlackboardVectorValueWhenOutBTServiceInstanceData local_2;
        local_2.VectorValue = local_4.GetValueAsVector(this.VectorBlackboard.SelectedKeyName);
        return;
    }
    UFUNCTION()
    void OnCeaseRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_4 = Context.GetOwnerComponent().GetBlackboardComponent();
        FKeepBlackboardVectorValueWhenOutBTServiceInstanceData local_2;
        local_4.SetValueAsVector(this.VectorBlackboard.SelectedKeyName, local_2.VectorValue);
        return;
    }
    FKeepBlackboardVectorValueWhenOutBTServiceInstanceData GetInstanceData(const FBTNodeMemory &inout NodeMemory) const
    {
        FKeepBlackboardVectorValueWhenOutBTServiceInstanceData __r;
        return __r;
    }
}

