
namespace BlueprintFunctions_Develop
{
UFUNCTION()
void RecoverBodyPart(const FECSEntityAdapter &inout Entity, const FName &inout BodyPartKey, const float32 RecoverHPRatio = 1.0f)
{
    if (!(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    FFPTime local_12 = FFPTime(-1);
    FCE_BodyPartRecoverEvent local_16;
    local_16.BodyPartKey = BodyPartKey;
    local_16.RecoverHPRatio = RecoverHPRatio;
    return;
}
FFPTime GetWorldTime(const FECSEntity &inout ContextEntity)
{
    if (UEASAbility::GetContextAbility() != nullptr)
    {
        return UEASAbility::GetContextAbility().GetWorldTime();
    }
    else
    {
        FECSWorldPtr local_10 = ContextEntity.GetWorld();
        Get local_14;
        return local_14.opCall().Time;
    }
}
UFUNCTION()
bool RemoveAbnormalState(const FECSEntityAdapter &inout Entity, const EAbnormalState AbnormalState)
{
    int local_14 = 0;
    FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv());
    local_14.GetModify_ToBeRemovedAbnormalStates().Add(AbnormalState);
    return true;
}
UFUNCTION()
void ClearEntityAbnormalBuff(const FECSEntityAdapter &inout Entity, const UAbnormalDataAsset AbnormalDataAsset)
{
    FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv());
    FC_AbnormalClearTag local_18;
    Assign local_16;
    local_16.opCall(local_18);
    return;
}
void RecoverConsumableAttribute(const FECSEntityAdapter &inout Entity, const FGameAttributeRef &inout TargetAttribute, const FGameAttributeRef &inout TargetAttributeMax)
{
    FFPTime local_8 = BlueprintFunctions_Develop::GetWorldTime(Entity.opImplConv());
    Get local_14;
    float32 local_15 = local_14.opCall().GetAttributeValue(TargetAttributeMax, local_8);
    float32 local_29 = FGameAttributeUtils::GetAttributeValue(Entity.opImplConv(), TargetAttribute, local_8, false, 0.0f, false, FGameAttributeModificationValue());
    FGameAttributeRef local_44 = TargetAttribute;
    if (local_15 > local_29)
    {
        FGameAttributeUtils::Recover(Entity.opImplConv(), local_44, local_8, local_15 - local_29, -1.0f);
    }
    else
    {
        if (local_15 < local_29)
        {
            FGameAttributeUtils::Consume(Entity.opImplConv(), local_44, local_8, local_29 - local_15);
        }
    }
    return;
}
UFUNCTION()
bool IsEditor()
{
    return false;
}
UFUNCTION()
bool IsShippingOrTest()
{
    return true;
}
UFUNCTION()
FECSEntity GetEntityFromTargetEntity(const FTargetEntity &inout TargetEntity)
{
    return TargetEntity.GetEntity();
}
UFUNCTION()
void SucceedProgressOperation(const FECSEntityAdapter &inout Entity)
{
    int local_16 = 0;
    Get local_4;
    const FC_ProgressOperationMember& local_6 = local_4.opCall();
    if (local_6)
    {
        FProgressOperationUtils::ProgressOperationSucceed(local_6.GetOperationEntity());
    }
    Get local_12;
    const FC_ProgressOperationRuntime& local_14 = local_12.opCall();
    if (local_14)
    {
        FProgressOperationUtils::ProgressOperationSucceed(local_14.GetOperationEntity());
    }
    local_16.SetbHide((int(ECS::GetRuntimeInfo().IsClient) != 0));
    return;
}
UFUNCTION()
int GetPlayerNumInTeam(const FECSEntity &inout Entity)
{
    int local_22 = 0;
    FASCommonUtils::GetUniquePlayerEntity(Entity);
    Get local_12;
    const FC_PlayerInTeam& local_14 = local_12.opCall();
    if (local_14)
    {
        if (local_14.GetTeamEntity().IsValid())
        {
            return local_22.GetMembers().Num();
        }
    }
    return 1;
}
UFUNCTION()
void SendWrestleResultEvent(const FECSEntity &inout Entity, const int ResultIndex)
{
    if (!(Entity))
    {
        return;
    }
    FFPTime local_12 = FFPTime(-1);
    FASCommonUtils::GetUniquePlayerEntity(Entity);
    FCE_ShowWrestleResultEvent local_16;
    local_16.ResultIndex = ResultIndex;
    return;
}
UFUNCTION()
void SendWrestleBeginEvent(const FECSEntity &inout Entity)
{
    if (!(Entity))
    {
        return;
    }
    FFPTime local_12 = FFPTime(-1);
    FASCommonUtils::GetUniquePlayerEntity(Entity);
    return;
}
UFUNCTION()
void GetExecutingMembers(const FECSEntity &inout Entity, TArray<FECSEntity> &out ExecutingMembers)
{
    TArray<FECSEntity> local_4;
    ExecutingMembers = local_4;
    Get local_8;
    const FC_ExecutedInfo& local_10 = local_8.opCall();
    if (local_10)
    {
        ExecutingMembers = local_10.GetExecuteEntityArray();
    }
    return;
}
UFUNCTION()
void AddSkillUsage(const FECSEntityAdapter &inout Entity, const int SkillIndex)
{
    ModifyOrAdd local_4;
    FC_DebugSkillUsage& local_6 = local_4.opCall();
    if (local_6)
    {
        int local_8 = 0;
        if (local_6.GetSkillUsageMap().Find(SkillIndex, local_8))
        {
            local_6.GetModify_SkillUsageMap().Add(SkillIndex, local_8 + 1);
            return;
        }
        int local_9 = 1;
        local_6.GetModify_SkillUsageMap().Add(SkillIndex, local_9);
    }
    return;
}
UFUNCTION()
void SimpleMoveEntityPingPong(const FECSEntityAdapter &inout Entity, const FVector &inout FromLocation, const FVector &inout ToLocation, const bool bCurrentDir, bool &out bResultDir, const float32 Speed, const float32 DeltaTime)
{
    bResultDir = false;
    Modify local_6;
    FC_Transform& local_8 = local_6.opCall();
    if (local_8)
    {
        FVector local_22;
        if (bCurrentDir)
        {
            local_22 = ToLocation;
        }
        else
        {
            local_22 = FromLocation;
        }
        FVector local_16 = FMath::VInterpConstantTo(local_8.GetPosition(), local_22, DeltaTime, Speed);
        Entity.GetEntity().TeleportTo(local_16, local_8.GetRotation(), FFPTime(-1));
        bResultDir = bCurrentDir;
        if (local_16.Equals(local_22, 9.999999747378752e-5))
        {
            bResultDir = !(bCurrentDir);
        }
    }
    return;
}
UFUNCTION()
void GetInteractSourceEntitiesByBehavior(const FECSEntityAdapter &inout InteractTargetEntity, const TSubclassOf<UInteractionBehaviorBase> &inout InBehaviorClass, TArray<FECSEntity> &out InteractSourceEntities)
{
    UInteractionBehaviorBase local_34;
    TArray<FECSEntity> local_4;
    InteractSourceEntities = local_4;
    Get local_8;
    const FC_RuntimeInteractTargetStatus& local_10 = local_8.opCall();
    if (local_10)
    {
        for (auto& local_26 : local_10.GetInteractionPointStatus())
        {
            local_34 = FInteractUtils::GetInteractionBehaviorFromEntity(InteractTargetEntity.opImplConv(), local_26.GetPointAndBehaviorIndex());
            if ((InBehaviorClass == local_34.GetClass()))
            {
                InteractSourceEntities.Append(local_26.GetInteractingSourceEntities());
            }
        }
    }
    return;
}
UFUNCTION()
FECSEntity GetCurrentInteractTargetEntity(const FECSEntityAdapter &inout Entity)
{
    FASCommonUtils::GetRiderEntity(Entity.GetEntity());
    Get local_16;
    const FC_InteractionInfoForESM& local_18 = local_16.opCall();
    if (local_18)
    {
        if (local_18.GetTargetEntity().IsValid())
        {
            return local_18.GetTargetEntity();
        }
    }
    return ENTITY_NULL;
}
UFUNCTION()
void SetEntityStrafeEnabled(const FECSEntityAdapter &inout Entity, const bool bEnableStrafe)
{
    int local_20 = 0;
    if (!(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    FECSEntity local_4 = Entity.GetEntity();
    Has local_14;
    if (!(local_14.opCall()))
    {
        return;
    }
    FFPTime local_24 = BlueprintFunctions_Develop::GetWorldTime(Entity.opImplConv());
    if (bEnableStrafe)
    {
        local_20.SetKeepStrafeCounter((local_20.GetKeepStrafeCounter() + 1));
    }
    else
    {
        local_20.SetKeepStrafeCounter((local_20.GetKeepStrafeCounter() - 1));
    }
    FESMTriggerUtils::ActivateESMTrigger(local_4, n"KeepStrafeCounterTrigger", local_24, FFPTime(0.1), 0);
    return;
}
}
