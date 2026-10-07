

class UBTService_TimeAccumulation : UBTService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TimeToAccumulate;
    UPROPERTY()
    bool ClearTimeOnEnter;
    UPROPERTY()
    bool bAccumulateOnlyWhenCombatWithPlayer = false;

    default SetNodeName("зґЇз§Їж—¶й—ґ");


    UFUNCTION()
    void OnSearchStart_Implementation(const FAIBehaviorTreeSearchContext &inout SearchContext) const
    {
        if (this.ClearTimeOnEnter)
        {
            UBlackboardComponent local_4 = SearchContext.GetOwnerComponent().GetBlackboardComponent();
            local_4.SetValueAsFloat(this.TimeToAccumulate.SelectedKeyName, 0.0f);
        }
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        Has local_34;
        if (this.bAccumulateOnlyWhenCombatWithPlayer)
        {
            bool local_2;
            local_2 = false;
            Get local_6;
            const FC_AITargetingV2& local_8 = local_6.opCall();
            if (local_8)
            {
                for (auto& local_26 : local_8.AllTargets)
                {
                    FECSEntity local_30 = local_26.GetEntity();
                    if (local_34.opCall())
                    {
                        local_2 = true;
                        break;
                    }
                }
            }
            if (!(local_2))
            {
                return;
            }
        }
        UBlackboardComponent local_36 = Context.GetOwnerComponent().GetBlackboardComponent();
        local_36.SetValueAsFloat(this.TimeToAccumulate.SelectedKeyName, local_36.GetValueAsFloat(this.TimeToAccumulate.SelectedKeyName) + DeltaSeconds);
        return;
    }
}

