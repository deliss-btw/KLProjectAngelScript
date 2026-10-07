

class UBTService_UpdateEcosimAIKnowledge : UBTService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetEcosimPointEntityID;
    UPROPERTY()
    FBlackboardKeySelector TargetActivityName;
    UPROPERTY()
    FBlackboardKeySelector CanNaviWalk;
    UPROPERTY()
    FBlackboardKeySelector SelfEntityCanFly;
    UPROPERTY()
    FBlackboardKeySelector TargetEcosimPointEntityLocation;
    UPROPERTY()
    FBlackboardKeySelector EngagingBehaviorName;
    UPROPERTY()
    FBlackboardKeySelector EngagingBehaviorTargetEntityID;
    UPROPERTY()
    FBlackboardKeySelector EcosimAILevelTargetAirLocation;
    UPROPERTY()
    FBlackboardKeySelector NeedAirMoveToLevelTargetAirLocation;
    UPROPERTY()
    FBlackboardKeySelector DialogueWithTargetEntity;
    UPROPERTY()
    FBlackboardKeySelector RunMoveStanceByTargetDistance;
    UPROPERTY()
    FBlackboardKeySelector FollowTargetEntity;
    UPROPERTY()
    FBlackboardKeySelector EcosimAIQuestBehavior;
    UPROPERTY()
    FBlackboardKeySelector EcosimAITargetQuestVolumeName;

    default SetNodeName("ж›ґж–°з”џжЂЃж•°жЌ®е€°й»‘жќїеЂј");

    UBTService_UpdateEcosimAIKnowledge()
    {
        this.TargetEcosimPointEntityID.SelectedKeyName = n"TargetEcosimPointEntityID";
        this.TargetEcosimPointEntityID.AddEntityIdFilter(this, n"TargetEcosimPointEntityID");
        this.TargetActivityName.SelectedKeyName = n"TargetActivityName";
        this.TargetActivityName.AddNameFilter(this, n"TargetActivityName");
        this.CanNaviWalk.SelectedKeyName = n"CanNaviWalk";
        this.CanNaviWalk.AddBoolFilter(this, n"CanNaviWalk");
        this.SelfEntityCanFly.SelectedKeyName = n"SelfEntityCanFly";
        this.SelfEntityCanFly.AddBoolFilter(this, n"SelfEntityCanFly");
        this.TargetEcosimPointEntityLocation.SelectedKeyName = n"TargetEcosimPointEntityLocation";
        this.TargetEcosimPointEntityLocation.AddVectorFilter(this, n"TargetEcosimPointEntityLocation");
        this.EngagingBehaviorName.SelectedKeyName = n"EngagingBehaviorName";
        this.EngagingBehaviorName.AddNameFilter(this, n"EngagingBehaviorName");
        this.EngagingBehaviorTargetEntityID.SelectedKeyName = n"EngagingBehaviorTargetEntityID";
        this.EngagingBehaviorTargetEntityID.AddEntityIdFilter(this, n"EngagingBehaviorTargetEntityID");
        this.EcosimAILevelTargetAirLocation.SelectedKeyName = n"EcosimAILevelTargetAirLocation";
        this.EcosimAILevelTargetAirLocation.AddVectorFilter(this, n"EcosimAILevelTargetAirLocation");
        this.NeedAirMoveToLevelTargetAirLocation.SelectedKeyName = n"NeedAirMoveToLevelTargetAirLocation";
        this.NeedAirMoveToLevelTargetAirLocation.AddBoolFilter(this, n"NeedAirMoveToLevelTargetAirLocation");
        this.DialogueWithTargetEntity.SelectedKeyName = n"DialogueWithTargetEntity";
        this.DialogueWithTargetEntity.AddEntityIdFilter(this, n"DialogueWithTargetEntity");
        this.RunMoveStanceByTargetDistance.SelectedKeyName = n"RunMoveStanceByTargetDistance";
        this.RunMoveStanceByTargetDistance.AddFloatFilter(this, n"RunMoveStanceByTargetDistance");
        this.FollowTargetEntity.SelectedKeyName = n"FollowTargetEntity";
        this.FollowTargetEntity.AddEntityIdFilter(this, n"FollowTargetEntity");
        this.EcosimAIQuestBehavior.SelectedKeyName = n"EcosimAIQuestBehavior";
        this.EcosimAIQuestBehavior.AddStringFilter(this, n"EcosimAIQuestBehavior");
        this.EcosimAITargetQuestVolumeName.SelectedKeyName = n"EcosimAITargetQuestVolumeName";
        this.EcosimAITargetQuestVolumeName.AddStringFilter(this, n"EcosimAITargetQuestVolumeName");
        this.SetbCallTickOnSearchStart(true);
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        this.UpdateKnowledge(local_2, Context.PawnEntity, DeltaSeconds);
        return;
    }
    void UpdateKnowledge(const UBlackboardComponent BlackBoard, const FECSEntity &inout Entity, const float32 DeltaSeconds) const
    {
        int local_18 = 0;
        Get local_4;
        const FC_CreatureEcologyState& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntity::Get<FC_EcologyFlockComponent> local_16 = FECSEntity::Get<FC_EcologyFlockComponent>(FECSEntity(local_6.FlockProxyEntity));
            if (!(local_18))
            {
                return;
            }
            FECSEntity local_12 = FECSEntity(local_18.ActivityTarget.MainTargetResource);
            BlackBoard.SetValueAsEntityId(this.TargetEcosimPointEntityID.SelectedKeyName, local_18.ActivityTarget.MainTargetResource);
            BlackBoard.SetValueAsName(this.TargetActivityName.SelectedKeyName, FName(this.GetActivityName(local_6)));
            BlackBoard.SetValueAsBool(this.CanNaviWalk.SelectedKeyName, local_6.bCanNaviWalk);
            BlackBoard.SetValueAsBool(this.SelfEntityCanFly.SelectedKeyName, local_6.bCanFly);
            if (local_12.IsValid())
            {
                Has local_34;
                XErrorIf(!(local_34.opCall()), ELog(30), FString().Append("[UpdateEcosimAIKnowledge]TargetPointEntity FC_Transform Invalid"));
                GetDefaulted local_40;
                BlackBoard.SetValueAsVector(this.TargetEcosimPointEntityLocation.SelectedKeyName, FVector(local_40.opCall().GetPosition()));
            }
            BlackBoard.SetValueAsVector(this.EcosimAILevelTargetAirLocation.SelectedKeyName, local_6.LevelTargetAirLocation);
            BlackBoard.SetValueAsBool(this.NeedAirMoveToLevelTargetAirLocation.SelectedKeyName, local_6.bNeedAirMoveToLevelTargetAirLocation);
            BlackBoard.SetValueAsFloat(this.RunMoveStanceByTargetDistance.SelectedKeyName, local_6.RunMoveStanceByTargetDistance);
            BlackBoard.SetValueAsEntityId(this.FollowTargetEntity.SelectedKeyName, ENTITY_ID_NULL);
        }
        return;
    }
    FName GetActivityName(const FC_CreatureEcologyState &inout State) const
    {
        UEcologyBehaviorDefine local_6;
        FCreatureActivityData local_2 = State.ActivityData;
        if (local_6 != nullptr)
        {
            UEcologyBehaviorDefine local_10;
            return local_10.LegacyBehaviorName;
        }
        return NAME_None;
    }
}

