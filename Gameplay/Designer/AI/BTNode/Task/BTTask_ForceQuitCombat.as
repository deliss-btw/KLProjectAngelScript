

class UBTTask_ForceQuitCombat : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityToQuit = FAISmart_EntityId(FAIBlackboardNativeKey::SelfEntity, EAISmartValue(0));
    UPROPERTY()
    bool bClearSelfTargeting = true;
    UPROPERTY()
    bool bSucceedIfAlreadyIdle = true;
    UPROPERTY()
    bool bWriteHomeLocation = true;
    UPROPERTY()
    bool bFallbackToSelfLocation = true;
    UPROPERTY()
    bool bRequireGroundedHomeLocation = true;
    UPROPERTY()
    FVector HomeLocationProjectionExtent = FVector(100.0, 100.0, 1000.0);
    UPROPERTY()
    bool bUseRawCandidateIfProjectionFailed = true;

    default SetNodeName("Force Quit Combat");


    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FC_AIKnowledge local_20;
        FECSEntity local_12 = FECSEntity(this.EntityToQuit.GetValue(Context.opImplConv()));
        if (!(local_12.IsValid()))
        {
            return EBTNodeResult(1);
        }
        if (!(local_20))
        {
            return EBTNodeResult(1);
        }
        Has local_28;
        if (((int(local_20.AICombatState) == 0) && !(local_28.opCall()) && !(this.bSucceedIfAlreadyIdle)))
        {
            return EBTNodeResult(1);
        }
        this.WriteHomeLocationForQuitCombat(local_12);
        if (this.bClearSelfTargeting)
        {
            ::FAITargetingUtils::ClearSelfTargeting(local_12);
        }
        ::FAIKnowledgeUtils::QuitCombat(local_12);
        FC_AINeedUpdateAIKnowledgeTag local_36;
        Assign local_34;
        local_34.opCall(local_36);
        FC_AINeedUpdateAITargetingTag local_42;
        Assign local_40;
        local_40.opCall(local_42);
        return EBTNodeResult(0);
    }
    bool TryProjectHomeLocationToGround(const FECSEntity &inout TargetEntity, const FVector &inout CandidateLocation, FVector &inout OutGroundedLocation) const
    {
        if (!(this.bRequireGroundedHomeLocation))
        {
            OutGroundedLocation = CandidateLocation;
            return true;
        }
        if (FAIPathFollowUtils::IsPointOnNavigation(TargetEntity, CandidateLocation, this.HomeLocationProjectionExtent))
        {
            OutGroundedLocation = FAIPathFollowUtils::ProjectPointToNavigation(TargetEntity, CandidateLocation, this.HomeLocationProjectionExtent);
            return true;
        }
        if (this.bUseRawCandidateIfProjectionFailed)
        {
            OutGroundedLocation = CandidateLocation;
            return true;
        }
        return false;
    }
    bool WriteHomeLocationForQuitCombat(const FECSEntity &inout TargetEntity) const
    {
        int local_34 = 0;
        if (!(this.bWriteHomeLocation) || !(TargetEntity.IsValid()))
        {
            return false;
        }
        FVector local_8(FVector::ZeroVector);
        FECSEntity local_12;
        FECSEntity local_20 = ::FEcologySceneInfoUtils::FindCreatureTargetCombatRegion(TargetEntity);
        bool local_1 = ::FAIQuitCombatUtils::GetHomeLocation(TargetEntity, local_20, local_8, local_12);
        FVector local_28(FVector::ZeroVector);
        if (local_1)
        {
            local_1 = this.TryProjectHomeLocationToGround(TargetEntity, local_8, local_28);
        }
        if (!(local_1) && this.bFallbackToSelfLocation)
        {
            if (local_34)
            {
                local_1 = this.TryProjectHomeLocationToGround(TargetEntity, local_34.GetPosition(), local_28);
                if (local_1)
                {
                    local_12 = FECSEntity();
                }
            }
        }
        if (!(local_1))
        {
            return false;
        }
        FC_AIQuitCombatInfo local_40;
        local_40.HomeLocation = local_28;
        local_40.HomeResource = local_12;
        local_40.TargetCombatArea = local_20;
        local_40.bHasHomeLocation = true;
        ::FAIKnowledgeUtils::SetAIBlackboardValueVector(TargetEntity, n"HomeLocation", local_28);
        FECSEntityId local_43;
        if (local_12.IsValid())
        {
            local_43 = local_12.GetId();
        }
        else
        {
            local_43 = ENTITY_ID_NULL;
        }
        ::FAIKnowledgeUtils::SetAIBlackboardValueEntityId(TargetEntity, n"HomeResource", local_43);
        return true;
    }
}

