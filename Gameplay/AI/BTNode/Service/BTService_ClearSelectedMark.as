

class UBTService_ClearSelectedMark : UBTService_ECSScriptBase
{
    default SetNodeName("жё…з©єе·ІйЂ‰з›®ж ‡ж ‡и®°");

    UBTService_ClearSelectedMark()
    {
        return;
    }
    UFUNCTION()
    void OnBecomeRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        Modify local_4;
        FC_AITargetingV2& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SelectedMarks.Empty(0);
        }
        return;
    }
}

