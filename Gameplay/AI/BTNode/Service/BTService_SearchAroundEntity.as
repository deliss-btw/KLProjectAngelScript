

class UBTService_SearchAroundEntity : UBTService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector ForceTargetEntity;
    UPROPERTY()
    FBlackboardKeySelector FindTarget;
    UPROPERTY()
    float32 SearchDistance;
    UPROPERTY()
    FGameplayTagContainer IncludeGameplayTags;
    UPROPERTY()
    FGameplayTagContainer ExcludeGameplayTags;

    default SetNodeName("жђњеЇ»е‘Ёе›ґзљ„з›®ж ‡");

    UBTService_SearchAroundEntity()
    {
        this.SearchDistance = 5000.0f;
        this.ForceTargetEntity.SelectedKeyName = n"TargetEntityID";
        this.ForceTargetEntity.AddEntityIdFilter(this, n"TargetEntityID");
        this.FindTarget.SelectedKeyName = n"FindTarget";
        this.FindTarget.AddBoolFilter(this, n"FindTarget");
        return;
    }
    UFUNCTION()
    void OnBecomeRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        local_2.SetValueAsBool(this.FindTarget.SelectedKeyName, false);
        return;
    }
    UFUNCTION()
    void OnCeaseRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        local_2.SetValueAsBool(this.FindTarget.SelectedKeyName, false);
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        int local_12 = 0;
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        FECSRuntimeQuery local_56 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(Context.PawnEntity, local_12.GetPosition(), this.SearchDistance, EECSQueryRegsitryType(3), false);
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        local_56.FilterByGameplayTags(this.IncludeGameplayTags, this.ExcludeGameplayTags);
        local_56.SortByDistance(local_12.GetPosition(), 1);
        bool local_106 = false;
        FECSRuntimeQueryIterator local_128 = local_56.Iterator();
        for (; local_128.CanProceed;)
        {
            const FECSEntity& local_152 = local_128.Proceed();
            local_106 = true;
            local_2.SetValueAsBool(this.FindTarget.SelectedKeyName, true);
            local_2.SetValueAsEntityId(this.ForceTargetEntity.SelectedKeyName, local_152.GetId());
        }
        if (!(local_106))
        {
            local_2.SetValueAsBool(this.FindTarget.SelectedKeyName, false);
        }
        return;
    }
}

