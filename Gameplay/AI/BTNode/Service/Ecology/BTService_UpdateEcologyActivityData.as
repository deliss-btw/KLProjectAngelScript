

class UBTService_UpdateEcologyActivityData : UBTService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector ForceResetBehaviorKey;

    default SetNodeName("ж›ґж–°ForceResetBehaviorж•°жЌ®е€°й»‘жќїеЂјпјЊз”ЁдєЋж‰“ж–­еЅ“е‰ЌиЎЊдёє");

    UBTService_UpdateEcologyActivityData()
    {
        this.ForceResetBehaviorKey.SelectedKeyName = n"FForceResetBehavior";
        this.ForceResetBehaviorKey.AddBoolFilter(this, n"FForceResetBehavior");
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        FC_FlockMember local_16;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_8 = Context.GetOwnerComponent().GetBlackboardComponent();
        if (!(local_16))
        {
            return;
        }
        this.UpdateKnowledge(local_8, local_4, local_16.FlockProxyEntity, DeltaSeconds);
        return;
    }
    void UpdateKnowledge(const UBlackboardComponent BlackBoard, const FECSEntity &inout Entity, const FECSEntityId &inout FlockEntityId, const float32 DeltaSeconds) const
    {
        FC_CreatureEcologyState local_6;
        if (!(local_6))
        {
            return;
        }
        FCreatureActivityData local_10 = local_6.ActivityData;
        TObjectPtr<UEcologyBehaviorDefine> local_12 = local_10.BehaviorDefine;
        BlackBoard.SetValueAsBool(this.ForceResetBehaviorKey.SelectedKeyName, local_10.bForceResetBehavior);
        return;
    }
}

