

struct FBTTask_DebugGlimmeringWolfCombatFallbackMemory
{
    UPROPERTY()
    bool bIsTrackingNone = false;
    UPROPERTY()
    FFPTime NoneStartTime;
    UPROPERTY()
    FFPTime LastNoneTime;


}

class UBTTask_DebugGlimmeringWolfCombatFallback : UBTTask_ECSScriptBase
{
    UPROPERTY()
    float32 NoneDurationThresholdSeconds = 2.0f;
    UPROPERTY()
    float32 ContinuousNoneGapSeconds = 0.5f;

    default SetNodeName("[Faker] з‹ј Combat None е›ћйЂЂ");


    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FBTTask_DebugGlimmeringWolfCombatFallbackMemory;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FBTTask_DebugGlimmeringWolfCombatFallbackMemory local_16;
        if (!(FECSEntity(Context.PawnEntity).IsValid()) || (Context.GetOwnerComponent().GetBlackboardComponent() == nullptr))
        {
            return EBTNodeResult(1);
        }
        FFPTime local_24 = ECS::GetContextTime();
        float32 local_28 = FMath::Max(0.0f, this.ContinuousNoneGapSeconds);
        if (!(local_16.bIsTrackingNone) || ((local_24 - local_16.LastNoneTime).ToSeconds() > local_28))
        {
            local_16.bIsTrackingNone = true;
            local_16.NoneStartTime = local_24;
        }
        local_16.LastNoneTime = local_24;
        if (float32(((local_24 - local_16.NoneStartTime).ToSeconds())) < FMath::Max(0.0f, this.NoneDurationThresholdSeconds))
        {
            return EBTNodeResult(1);
        }
        local_16.bIsTrackingNone = false;
        return EBTNodeResult(1);
    }
    void LogCombatNoneDiagnostics(const FECSEntity &inout Entity, const UBlackboardComponent Blackboard, const float32 NoneElapsedSeconds) const
    {
        FECSEntityId local_3;
        Blackboard.GetValueAsEntityId(local_3);
        FECSEntityId local_5 = FECSEntityId(ENTITY_ID_NULL);
        int local_6 = 0;
        Get local_10;
        const FC_AITargetingV2& local_12 = local_10.opCall();
        if (local_12)
        {
            local_6 = local_12.CurrentQueryOutput.Num();
            if (local_6 > 0)
            {
            }
        }
        FNameHandle_EntityBBVarBool local_18;
        local_18;
        bool local_13 = Entity.GetBB_Bool(local_18);
        local_18;
        bool local_14 = Entity.GetBB_Bool(local_18);
        local_18;
        bool local_19 = Entity.GetBB_Bool(local_18);
        FNameHandle_EntityBBVarInt local_26;
        local_26;
        int local_2_2 = Entity.GetBB_Int(local_26);
        local_18;
        bool local_20 = Entity.GetBB_Bool(local_18);
        local_26;
        int local_21_2 = Entity.GetBB_Int(local_26);
        FNameHandle_EntityBBVarFloat local_34;
        local_34;
        float32 local_35 = Entity.GetBB_Float(local_34);
        local_34;
        float32 local_29 = Entity.GetBB_Float(local_34);
        float32 local_36 = Blackboard.GetValueAsFloat(n"TargetDistanceXY");
        float32 local_37 = Blackboard.GetValueAsFloat(n"TargetDistanceXYIgnoreCollision");
        float32 local_38 = Blackboard.GetValueAsFloat(n"TargetDistanceZ");
        float32 local_39 = Blackboard.GetValueAsFloat(n"TargetDirectionAngleXY");
        float32 local_40 = Blackboard.GetValueAsFloat(n"TargetDirectionAngleXYSigned");
        FString local_1;
        XWarning(ELog(14), FString().Append("[GlimmeringWolfCombatNone] Elapsed=").Append(NoneElapsedSeconds).Append(" Entity=").Append(Entity.GetEntityName()).Append(" TargetEntityID=").Append(local_3).Append(" CurrentQueryOutputCount=").Append(local_6).Append(" CurrentQueryOutput0=").Append(local_5).Append(" tFlashedEntity=").Append(local_1));
        XWarning(ELog(14), FString().Append("[GlimmeringWolfCombatNone] EBB bIsInCombat=").Append(local_13).Append(" bHasFlashTarget=").Append(local_14).Append(" bNeedSummon=").Append(local_19).Append(" iPhase=").Append(local_2_2).Append(" bIsOnTree=").Append(local_20).Append(" iSkillIndex=").Append(local_21_2).Append(" SelfCombatWithPlayerTime=").Append(local_35).Append(" SelfMeleeCombatTime=").Append(local_29));
        XWarning(ELog(14), FString().Append("[GlimmeringWolfCombatNone] BB TargetDistanceXY=").Append(local_36).Append(" TargetDistanceXYIgnoreCollision=").Append(local_37).Append(" TargetDistanceZ=").Append(local_38).Append(" TargetDirectionAngleXY=").Append(local_39).Append(" TargetDirectionAngleXYSigned=").Append(local_40));
        XWarning(ELog(14), FString().Append("[GlimmeringWolfCombatNone] Tags BanSkill=").Append(Entity.MatchGameplayTag(GameplayTags::ESM_Ban_Skill)).Append(" BanCancel=").Append(Entity.MatchGameplayTag(GameplayTags::ESM_Ban_Cancel)).Append(" BanMove=").Append(Entity.MatchGameplayTag(GameplayTags::ESM_Ban_Move)).Append(" Attack=").Append(Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_Attack)).Append(" Skill=").Append(Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_Skill)).Append(" Dodge=").Append(Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_Dodge)).Append(" Run=").Append(Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_Run)).Append(" AirState=").Append(Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_AirState)).Append(" ImmuneFlash=").Append(Entity.MatchGameplayTag(GameplayTags::CombatAI_ImmuneFlash)).Append(" PVXMode=").Append(Entity.MatchGameplayTag(GameplayTags::CombatAI_PVXMode)).Append(" BlockAllHitReaction=").Append(Entity.MatchGameplayTag(GameplayTags::CombatState_BlockAllHitReaction)).Append(" Endure=").Append(Entity.MatchGameplayTag(GameplayTags::CombatState_Endure)));
        return;
    }
}

