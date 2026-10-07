

class UBTService_UpdateEcologyChangeAreaData : UBTService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector ForceUpdateTargetResource;

    default SetNodeName("ж›ґж–°ForceResetBehaviorж•°жЌ®е€°й»‘жќїеЂјпјЊз”ЁдєЋж‰“ж–­еЅ“е‰ЌиЎЊдёє");

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

