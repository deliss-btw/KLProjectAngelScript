class UBTService_UpdateEcologyChangeAreaData : UBTService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector ForceUpdateTargetResource;

    default SetNodeName("更新ForceResetBehavior数据到黑板值，用于打断当前行为");

    UBTService_UpdateEcologyChangeAreaData()
    {
        this.ForceUpdateTargetResource.SelectedKeyName = n"FForceUpdateTargetResource";
        this.ForceUpdateTargetResource.AddBoolFilter(this, n"FForceUpdateTargetResource");
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_8 = Context.GetOwnerComponent().GetBlackboardComponent();
        this.UpdateKnowledge(local_8, local_4, DeltaSeconds);
        return;
    }
    void UpdateKnowledge(const UBlackboardComponent BlackBoard, const FECSEntity &inout CreatureEntity, const float32 DeltaSeconds) const
    {
        FC_CreatureEcologyState local_6;
        BlackBoard.SetValueAsBool(this.ForceUpdateTargetResource.SelectedKeyName, local_6.bForceUpdateTargetResource);
        if (local_6.bForceUpdateTargetResource == true)
        {
            ::FEcologyBehaviorUtils::ResetForceUpdateChangeAreaTargetResourceMark(CreatureEntity);
        }
        return;
    }
}

