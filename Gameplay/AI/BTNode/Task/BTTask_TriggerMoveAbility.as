
enum EAITurnDirectionSpace
{
    World,
    Local,
}


struct FTriggerMoveAbilityTaskInstanceData
{
    UPROPERTY()
    float32 TimeCount;
    UPROPERTY()
    EFollowSplineState FollowState = EFollowSplineState(0);
    UPROPERTY()
    FGameplayTag InAbilityTag;
    UPROPERTY()
    bool bHasTrigger = false;
    UPROPERTY()
    bool bHasTriggerFinish = false;


}

class UBTTask_TriggerMoveAbility : UBTTask_ECSScriptBase
{
    UPROPERTY()
    EAIMoveAbilityType MoveAbilityType;
    UPROPERTY()
    FVector TargetLocation;
    UPROPERTY()
    FAISmart_Vector TargetLocationSmart = FAISmart_Vector(n"TargetLocationSmart", EAISmartValue(0));
    UPROPERTY()
    FAISmart_EntityId TargetEntityID = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
    UPROPERTY()
    float32 FailureTime = 10.0f;

    default SetNodeName("Trigger Move Ability");


    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FTriggerMoveAbilityTaskInstanceData;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FTriggerMoveAbilityTaskInstanceData local_2;
        local_2.TimeCount = 0.0f;
        local_2.bHasTrigger = false;
        local_2.bHasTriggerFinish = false;
        if (local_2.TimeCount >= this.FailureTime)
        {
            return EBTNodeResult(1);
        }
        local_2.InAbilityTag = this.GetAbilityActiveTag();
        return EBTNodeResult(3);
    }
    UFUNCTION()
    void TickTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        Has local_18;
        bool local_50 = false;
        FNameHandle_EntityBBVar local_114;
        FNameHandle_EntityBBVarFloat local_118;
        FNameHandle_EntityBBVarEnum local_136;
        FTriggerMoveAbilityTaskInstanceData local_2;
        local_2.TimeCount += DeltaSeconds;
        float32 local_7_2 = local_2.TimeCount;
        float32 local_8 = this.FailureTime;
        if (local_7_2 >= local_8)
        {
            this.FinishLatentTask(Context, EBTNodeResult(1));
        }
        FECSEntity local_14 = FECSEntity(Context.PawnEntity);
        if (!(local_18.opCall()))
        {
            this.FinishLatentTask(Context, EBTNodeResult(1));
        }
        Get local_28;
        FVector local_24 = local_28.opCall().GetPosition();
        if (!(local_2.bHasTrigger))
        {
            Get local_46;
            FVector local_34;
            local_34 = this.TargetLocationSmart.GetValue(Context.opImplConv());
            if (local_34.IsZero())
            {
                local_34 = this.TargetLocation;
            }
            if (local_46.opCall().GetMoveAbilityConfig())
            {
                bool local_9;
                local_9 = int(this.MoveAbilityType) == 1 || (int(this.MoveAbilityType) == 2) || (int(this.MoveAbilityType) == 3);
                if (local_9)
                {
                    TDataObjectPtr<FAIMoveConfig> local_74 = local_46.opCall().GetMoveAbilityConfig();
                    FVector local_42 = (local_34 - local_24);
                    if (int(this.MoveAbilityType) == 2)
                    {
                        if (local_50)
                        {
                            if (local_7_2 != 0.0f)
                            {
                                local_114;
                                if (local_14.HasEntityBB(local_114))
                                {
                                    float32 local_7_3 = float32((local_42.Z / local_8));
                                    local_118;
                                    local_14.SetBB_Float(local_118, n"MoveAbilityVaulting.fNormalizedMantleHeight");
                                }
                            }
                        }
                    }
                    if (int(this.MoveAbilityType) == 1)
                    {
                        if (local_8 != 0.0f)
                        {
                            local_114;
                            if (local_14.HasEntityBB(local_114))
                            {
                                float32 local_7_4 = float32((local_42.Z / local_8));
                                local_118;
                                local_14.SetBB_Float(local_118, n"MoveAbilityVaulting.fNormalizedUpstairsHeight");
                            }
                        }
                    }
                    ECS::GetContextDeltaTime();
                    ECS::GetContextTime();
                    ::FAINavigationUtils::GetAIMoveAbilityTrigger();
                    local_114;
                    if (local_14.HasEntityBB(local_114))
                    {
                        int local_48 = int(this.MoveAbilityType);
                        local_136;
                        local_14.SetBB_Enum(local_136, n"MoveAbilityVaulting.eMoveAbilityType");
                    }
                    local_114;
                    if (local_14.HasEntityBB(local_114))
                    {
                        FNameHandle_EntityBBVarVector local_140;
                        local_140;
                    }
                }
                if (int(this.MoveAbilityType) == 4 || (int(this.MoveAbilityType) == 5) || (int(this.MoveAbilityType) == 6) || (int(this.MoveAbilityType) == 7))
                {
                    FECSEntityId local_141 = this.TargetEntityID.GetValue(Context.opImplConv());
                    if (!((local_141 == ENTITY_ID_NULL)))
                    {
                        if (!(FECSEntity(local_141).IsActive()))
                        {
                            local_9 = false;
                        }
                        else
                        {
                            local_9 = local_18.opCall();
                        }
                        if (local_9)
                        {
                            GetDefaulted local_154;
                            FAIInputUtils::SimulateViewInput(local_14, (FVector(local_154.opCall().GetPosition()) - local_24).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).Rotation());
                            ECS::GetContextDeltaTime();
                            ECS::GetContextTime();
                            ::FAINavigationUtils::GetAIMoveAbilityTrigger();
                            local_114;
                            if (local_14.HasEntityBB(local_114))
                            {
                                int local_48_2 = int(this.MoveAbilityType);
                                local_136;
                                local_14.SetBB_Enum(local_136, n"MoveAbility.eMoveAbilityType");
                            }
                        }
                        else
                        {
                            this.FinishLatentTask(Context, EBTNodeResult(1));
                        }
                    }
                    else
                    {
                        this.FinishLatentTask(Context, EBTNodeResult(1));
                    }
                }
            }
            else
            {
                this.FinishLatentTask(Context, EBTNodeResult(1));
            }
            if (local_14.MatchGameplayTag(local_2.InAbilityTag))
            {
                bool local_9;
                local_9 = true;
                local_2.bHasTrigger = local_9;
            }
        }
        else
        {
            bool local_9;
            if (!(local_14.MatchGameplayTag(local_2.InAbilityTag)))
            {
                local_2.bHasTriggerFinish = true;
            }
        }
        local_50 = local_2.bHasTrigger;
        if (!(local_50))
        {
            local_50 = false;
        }
        else
        {
            local_50 = local_2.bHasTriggerFinish;
        }
        if (local_50)
        {
            this.FinishLatentTask(Context, EBTNodeResult(0));
        }
        return;
    }
    FTriggerMoveAbilityTaskInstanceData GetInstanceData(const FBTNodeMemory &inout NodeMemory) const
    {
        FTriggerMoveAbilityTaskInstanceData __r;
        return __r;
    }
    FGameplayTag GetAbilityActiveTag() const
    {
        switch (int(this.MoveAbilityType))
        {
        case 1:
        {
            return FGameplayTag::RequestGameplayTag(n"ESM.MotionFlag.Upstairs", true);
        }
        case 2:
        {
            return FGameplayTag::RequestGameplayTag(n"ESM.MotionFlag.Mantle", true);
        }
        case 3:
        {
            return FGameplayTag::RequestGameplayTag(n"ESM.MotionFlag.LeapOff", true);
        }
        case 4:
        {
            return FGameplayTag::RequestGameplayTag(n"ESM.MotionFlag.GroundTurnInplace", true);
        }
        case 5:
        {
            return FGameplayTag::RequestGameplayTag(n"ESM.MotionFlag.GroundTurnAside", true);
        }
        case 6:
        {
            return FGameplayTag::RequestGameplayTag(n"ESM.MotionFlag.AirTurnInplace", true);
        }
        case 7:
        {
            return FGameplayTag::RequestGameplayTag(n"ESM.MotionFlag.AirTurnToAside", true);
        }
        }
        return FGameplayTag();
    }
}

