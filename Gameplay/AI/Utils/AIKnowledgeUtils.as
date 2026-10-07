
enum ETargetUnavailableReason
{
    Available,
    Dead,
    Destroyed,
    OccupiedFull,
    InteractionBlocked,
    Collected,
    EntityInactive,
}

namespace FAIKnowledgeUtils
{
    const FName VISUALLOG_PERCEPTION = n"AIKnowledgePerception";
    const float32 TICK_COMBAT_TARGET_INTERVAL = 0.2f;
    const float32 COMBAT_IGNORE_RANGE_MIN_TIME = 10f;
    const float32 TICK_ENGAGING_GROUP_UNION_INTERVAL = 2f;
    const float VALID_HOSTILITY_ENTITY_DISTANCE = 10000;

UFUNCTION()
void UpdateAIKnowledgeByDamage(const FECSEntity &inout Sender, const FECSEntity &inout Receiver)
{
    int local_12 = 0;
    if (!(FAIKnowledgeUtils::CanEntityBeTarget(FAIKnowledgeUtils::FindRootAvatarEntity(Sender))))
    {
        return;
    }
    if (!(local_12))
    {
        return;
    }
    if (FAIKnowledgeUtils::CanMuteCombat(Receiver))
    {
        return;
    }
    FTargetEntity local_14 = Sender;
    bool local_15 = false;
    Modify local_20;
    FC_AITargetingV2& local_22 = local_20.opCall();
    if (local_22)
    {
        local_15 = !(local_22.TargetsHostilityMap.Contains(local_14));
    }
    if (local_15)
    {
        FC_AINeedUpdateAIKnowledgeTag local_28;
        Assign local_26;
        local_26.opCall(local_28);
        FC_AINeedUpdateAITargetingTag local_34;
        Assign local_32;
        local_32.opCall(local_34);
    }
    return;
}
UFUNCTION()
FECSEntity FindRootAvatarEntity(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_Owner& local_6 = local_4.opCall();
    if (local_6)
    {
        if ((!((local_6.GetOwnerEntity() == ENTITY_NULL))))
        {
            return FAIKnowledgeUtils::FindRootAvatarEntity(local_6.GetOwnerEntity());
        }
    }
    return FAITargetingUtils::TryGetValidAvatarTarget(Entity);
}
UFUNCTION()
bool IsEntityTargetable(const FECSEntity &inout Entity)
{
    UCombatGlobalSettings local_4 = UCombatGlobalSettings::Get();
    if (local_4 != nullptr)
    {
        if (Entity.MatchAnyGameplayTags(local_4.UnTargetableTags))
        {
            return false;
        }
    }
    if (FAIKnowledgeUtils::IsMuteBeAITarget(Entity))
    {
        return false;
    }
    Has local_10;
    return local_10.opCall();
}
UFUNCTION()
bool IsTargetValid(const FECSEntity &inout Entity)
{
    bool local_1;
    if (!(Entity.IsActive()))
    {
        return false;
    }
    Has local_6;
    if (local_6.opCall())
    {
        local_1 = true;
    }
    else
    {
        Has local_10;
        local_1 = local_10.opCall();
    }
    if (local_1)
    {
        return false;
    }
    return true;
}
UFUNCTION()
bool CanEntityHasHostility(const FECSEntity &inout Entity)
{
    Has local_6;
    return Entity.IsValid() && !(local_6.opCall()) && FAIKnowledgeUtils::CanEntityBeCombatTarget(Entity);
}
UFUNCTION()
bool CanEntityBeTarget(const FECSEntity &inout Entity)
{
    return FAIKnowledgeUtils::IsEntityTargetable(Entity) && FAIKnowledgeUtils::IsTargetValid(Entity);
}
UFUNCTION()
bool CanEntityBeCombatTarget(const FECSEntity &inout Entity)
{
    if (!(FAIKnowledgeUtils::CanEntityBeTarget(Entity)))
    {
        return false;
    }
    return true;
}
UFUNCTION()
void VisualLog(const FECSEntity &inout Entity, const FString &inout Content, const FName &inout LogCategory = n"AIKnowledgePerception")
{
    return;
}
void EnterCombat(const FECSEntity &inout Entity)
{
    FC_AIKnowledge local_6;
    if (!(local_6))
    {
        return;
    }
    if (int(local_6.AICombatState) == 2)
    {
        return;
    }
    local_6.AICombatState = EAICombatState(2);
    Has local_16;
    bool local_7 = local_16.opCall();
    FAIKnowledgeUtils::VisualLog(Entity, FString().Append("AIKnowledgeLog: ").Append(Entity.GetEntityName()).Append(" Set AIKnowledge.AICombatState To Combat"), n"AIKnowledgePerception");
    if (!(local_7))
    {
        FNameHandle_EntityBBVarBool local_32;
        FC_AICombatTag local_28;
        Assign local_26;
        local_26.opCall(local_28);
        local_32;
        Entity.SetBB_Bool(local_32, n"bIsInCombat");
    }
    SendEvent local_36;
    local_36.opCall(FFPTime(-1));
    return;
}
void QuitCombat(const FECSEntity &inout Entity)
{
    FC_AIKnowledge local_2;
    if (!(local_2))
    {
        return;
    }
    if (int(local_2.AICombatState) == 0)
    {
        return;
    }
    local_2.AICombatState = EAICombatState(0);
    Has local_16;
    bool local_7 = local_16.opCall();
    if (!(local_7))
    {
        FNameHandle_EntityBBVarBool local_24;
        bool local_11;
        Remove local_20;
        local_20.opCall();
        local_11 = false;
        local_24;
        Entity.SetBB_Bool(local_24, n"bIsInCombat");
    }
    SendEvent local_28;
    local_28.opCall(FFPTime(-1));
    Modify local_34;
    FC_AITargetingV2& local_36 = local_34.opCall();
    if (local_36)
    {
        local_36.EntityAlertnessMap.Reset();
        local_36.AlertBroadcastSources.Empty(0);
    }
    return;
}
void AddMuteCombat(const FECSEntity &inout Entity, const FName &inout MuteSource, const bool bForceImmediate = false)
{
    bool local_1;
    if (!(!(bForceImmediate)))
    {
        local_1 = false;
    }
    else
    {
        Has local_6;
        local_1 = local_6.opCall();
    }
    local_1 = local_1 && FAIKnowledgeUtils::HasRunningBehaviorTree(Entity);
    if (local_1)
    {
        FC_AIMuteCombatPendingTag local_14;
        Assign local_12;
        local_12.opCall(local_14);
        XLog(ELog(14), FString().Append(Entity.GetEntityName()).Append(" MuteCombat deferred - BT running, source: ").Append(MuteSource));
    }
    ModifyOrAdd local_26;
    local_26.opCall().MuteSource.Add(MuteSource);
    XLog(ELog(14), FString().Append(Entity.GetEntityName()).Append(" Add Mute Combat Source: ").Append(MuteSource));
    return;
}
void RemoveMuteCombat(const FECSEntity &inout Entity, const FName &inout MuteSource)
{
    Modify local_4;
    FC_AIMuteCombat& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.MuteSource.Contains(MuteSource))
        {
        }
        if (local_6.MuteSource.IsEmpty())
        {
            Has local_12;
            bool local_7 = local_12.opCall();
            Remove local_16;
            local_16.opCall();
            Remove local_20;
            if (local_20.opCall())
            {
                FC_AINeedUpdateAITargetingTag local_26;
                Assign local_24;
                local_24.opCall(local_26);
            }
        }
        XLog(ELog(14), FString().Append(Entity.GetEntityName()).Append(" Remove Mute Combat Source: ").Append(MuteSource));
    }
    return;
}
bool CanMuteCombat(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_AIMuteCombat& local_6 = local_4.opCall();
    if (local_6)
    {
        return (local_6.MuteSource.Num() > 0);
    }
    return false;
}
bool HasRunningBehaviorTree(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_ControlledByAI& local_6 = local_4.opCall();
    if (local_6)
    {
        if (FECSEntity(local_6.GetControllerEntity()).IsValid())
        {
            Get local_16;
            const FC_BehaviorTree& local_18 = local_16.opCall();
            if (local_18)
            {
                return local_18.GetbShouldRun() && !(local_18.GetbDisableByDeath());
            }
        }
    }
    return false;
}
void AddMuteBeAITarget(const FECSEntity &inout Entity, const FName &inout MuteSource)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    ModifyOrAdd local_6;
    local_6.opCall().MuteSource.Add(MuteSource);
    XLog(ELog(14), FString().Append(Entity.GetEntityName()).Append(" Add MuteBeAITarget Source: ").Append(MuteSource));
    return;
}
void RemoveMuteBeAITarget(const FECSEntity &inout Entity, const FName &inout MuteSource)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_AIMuteBeAITarget& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.MuteSource.Contains(MuteSource))
        {
        }
        if (local_8.MuteSource.IsEmpty())
        {
            Remove local_12;
            local_12.opCall();
        }
        XLog(ELog(14), FString().Append(Entity.GetEntityName()).Append(" Remove MuteBeAITarget Source: ").Append(MuteSource));
    }
    return;
}
bool IsMuteBeAITarget(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return false;
    }
    Get local_6;
    const FC_AIMuteBeAITarget& local_8 = local_6.opCall();
    if (local_8)
    {
        return (local_8.MuteSource.Num() > 0);
    }
    return false;
}
bool CheckTargetValidForCombat(const FECSEntity &inout Entity, const FECSEntity &inout TargetEntity)
{
    if ((TargetEntity == Entity))
    {
        return false;
    }
    if (!(FAIKnowledgeUtils::IsEntityTargetable(TargetEntity)))
    {
        return false;
    }
    if (!(FASCommonUtils::IsTargetEntityEnemy(Entity, TargetEntity)) && !(FASCommonUtils::IsTargetEntityNetural(Entity, TargetEntity)))
    {
        return false;
    }
    return true;
}
bool CheckTargetInSightCone(const FVector &inout SelfPosition, const FQuat &inout SelfRotation, const FVector &inout TargetPosition, const FSightPerceptionConfig &inout SightConfig)
{
    FQuat local_28 = (TargetPosition - SelfPosition).VectorPlaneProject(FVector::UpVector).ToOrientationQuat();
    float local_32 = SelfPosition.Distance(TargetPosition);
    float32 local_33 = float32(local_32);
    float32 local_29 = float32(FMath::RadiansToDegrees(SelfRotation.AngularDistance(local_28)));
    for (auto& local_52 : SightConfig.SightPerceptionViewList)
    {
        if ((local_33 < local_52.SightPerceptionDistance && (local_29 < local_52.SightPerceptionAngleOffset)))
        {
            return true;
        }
    }
    return false;
}
void BroadcastAlertTargetV2(const FECSEntity &inout SelfEntity, const FECSEntity &inout TargetableEntity, FC_AITargetingV2 &inout AITargetingV2)
{
    if ((SelfEntity == TargetableEntity))
    {
        return;
    }
    if (FAIKnowledgeUtils::CanMuteCombat(SelfEntity))
    {
        return;
    }
    if (!(FAIKnowledgeUtils::CanEntityBeCombatTarget(TargetableEntity)))
    {
        return;
    }
    FTargetEntity local_3 = TargetableEntity;
    AITargetingV2.EntityAlertnessMap.FindOrAdd(local_3).AlertnessValue = AITargetingV2.AlertnessMax;
    return;
}
bool IsEntityInCombat(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_ControlledByPlayer& local_6 = local_4.opCall();
    if (local_6)
    {
        Has local_20;
        if (FECSEntity(local_6.GetPlayerEntity()).IsValid())
        {
            return local_20.opCall();
        }
    }
    Has local_24;
    bool local_7 = local_24.opCall();
    if (local_7)
    {
        Has local_20;
        return local_20.opCall();
    }
    FNameHandle_EntityBBVar local_30;
    local_30;
    if (Entity.HasEntityBB(local_30))
    {
        FNameHandle_EntityBBVarBool local_34;
        local_34;
        return Entity.GetBB_Bool(local_34);
    }
    return false;
}
bool IsEntityInCombatWithDelay(const FECSEntity &inout Entity)
{
    Has local_20;
    Get local_4;
    const FC_ControlledByPlayer& local_6 = local_4.opCall();
    if (local_6)
    {
        if (FECSEntity(local_6.GetPlayerEntity()).IsValid())
        {
            return local_20.opCall();
        }
    }
    return local_20.opCall();
}
void OverrideSightConfig(const FECSEntity &inout Entity, const FName &inout OverrideSightConfigKey)
{
    int local_6 = 0;
    bool local_59 = false;
    if (!(local_6))
    {
        return;
    }
    bool local_7 = (FAIPerceptionUtils::GetPerceptionConfig(Entity) == nullptr) || (0 == 0);
    if (local_7)
    {
        local_7 = true;
    }
    else
    {
        local_59 = !local_59;
        local_7 = local_59;
    }
    if (local_7)
    {
        XError(ELog(14), FString().Append("AIKnowledgeLog: ").Append(Entity.GetEntityName()).Append(" Does Not Exist SightConfigKey:").Append(OverrideSightConfigKey.ToString()).Append(" When Try To Override In ESM"));
        return;
    }
    local_6.CurrentOverrideSightConfigKey = OverrideSightConfigKey;
    return;
}
void ClearOverrideSightConfig(const FECSEntity &inout Entity)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return;
    }
    local_6.CurrentOverrideSightConfigKey = NAME_None;
    return;
}
void OverrideAlertConfig(const FECSEntity &inout Entity, const FName &inout OverrideAlertConfigKey)
{
    int local_6 = 0;
    bool local_59 = false;
    if (!(local_6))
    {
        return;
    }
    bool local_7 = (FAIPerceptionUtils::GetPerceptionConfig(Entity) == nullptr) || (0 == 0);
    if (local_7)
    {
        local_7 = true;
    }
    else
    {
        local_59 = !local_59;
        local_7 = local_59;
    }
    if (local_7)
    {
        XError(ELog(14), FString().Append("AIKnowledgeLog: ").Append(Entity.GetEntityName()).Append(" Does Not Exist AlertConfigKey:").Append(OverrideAlertConfigKey.ToString()).Append(" When Try To Override In ESM"));
        return;
    }
    local_6.CurrentOverrideAlertConfigKey = OverrideAlertConfigKey;
    return;
}
void ClearOverrideAlertConfig(const FECSEntity &inout Entity)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return;
    }
    local_6.CurrentOverrideAlertConfigKey = NAME_None;
    return;
}
void SetScriptControlState(const FECSEntity &inout Entity, const bool bNeedControlledByLevel)
{
    Modify local_4;
    FC_AIKnowledge& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.bNeedControlledByLevel = bNeedControlledByLevel;
    }
    return;
}
void SyncCombatAndKnowledgeInfoToSwitchedPlayer(const FECSEntity &inout PrevEntity, const FECSEntity &inout NextEntity)
{
    if (FAIKnowledgeUtils::IsEntityInCombat(PrevEntity))
    {
        FAIKnowledgeUtils::EnterCombat(NextEntity);
    }
    else
    {
        FAIKnowledgeUtils::QuitCombat(NextEntity);
    }
    FC_AINeedUpdateAIKnowledgeTag local_8;
    Assign local_6;
    local_6.opCall(local_8);
    FC_AINeedUpdateAITargetingTag local_14;
    Assign local_12;
    local_12.opCall(local_14);
    return;
}
bool ShouldKeepIndependentCombatGroup(const FECSEntity &inout Entity)
{
    return Entity.MatchAnyGameplayTags(UCombatGlobalSettings::Get().IndependentCombatGroupTags);
}
UBlackboardComponent GetAIBlackboardComponent(const FECSEntity &inout Entity)
{
    UBlackboardComponent local_4;
    int local_10 = 0;
    int local_16 = 0;
    AECSAIProxy local_22;
    int local_36 = 0;
    if (!(Entity.IsValid()))
    {
        return nullptr;
    }
    if (!(local_10))
    {
        return nullptr;
    }
    if (local_16 && local_16.TreeOwnerActor.IsValid())
    {
        if (local_22 != nullptr && ((local_22.BlackBoardComponent != nullptr)))
        {
            return local_22.BlackBoardComponent;
        }
    }
    FECSEntity local_26 = FECSEntity(local_10.GetControllerEntity());
    if (local_36 && local_36.GetBlackboardComponent().IsValid())
    {
        TWeakObjectPtr<UBlackboardComponent> local_38 = local_36.GetBlackboardComponent();
        return local_4;
    }
    return local_4;
}
void InitCombatKnowledge(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Get local_6;
    const FC_GameAttribute& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.HasAttribute(Attribute::HPMax) && local_8.HasAttribute(Attribute::HP))
        {
            float32 local_13 = local_8.GetAttributeValue(Attribute::HPMax, ECS::GetContextTime());
            float32 local_10 = local_8.GetAttributeValue(Attribute::HP, ECS::GetContextTime());
            if (local_13 > 0.0f)
            {
                float32 local_14 = local_10 / local_13;
                FAIKnowledgeUtils::SetAIBlackboardValueFloat(Entity, n"SelfHPRatio", local_14);
            }
        }
        if (local_8.HasAttribute(Attribute::PostureMax) && local_8.HasAttribute(Attribute::Posture))
        {
            float32 local_14_2 = local_8.GetAttributeValue(Attribute::PostureMax, ECS::GetContextTime());
            float32 local_13_2 = local_8.GetAttributeValue(Attribute::Posture, ECS::GetContextTime());
            if (local_14_2 > 0.0f)
            {
                FAIKnowledgeUtils::SetAIBlackboardValueFloat(Entity, n"SelfPostureRatio", 1.0f - (local_13_2 / local_14_2));
            }
        }
    }
    return;
}
void UpdateCombatKnowledgeInternal(const FECSEntity &inout Entity, const FECSEntity &inout TargetEntity)
{
    int local_16 = 0;
    float local_82;
    if (!(Entity.IsValid()) || !(TargetEntity.IsValid()))
    {
        return;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    UBlackboardComponent local_20 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (!(local_16) || !((local_20 != nullptr)))
    {
        return;
    }
    float32 local_22 = FAIPerceptionUtils::GetMeleeRange(Entity);
    if (TargetEntity.IsActive())
    {
        Get local_14;
        float32 local_21 = FASCommonUtils::CalculateEntityDistance2D(Entity, TargetEntity, true);
        local_20.SetValueAsFloat(n"TargetDistanceXY", local_21);
        local_20.SetValueAsFloat(n"TargetDistanceXYIgnoreCollision", FASCommonUtils::CalculateEntityDistance2D(Entity, TargetEntity, false));
        local_20.SetValueAsFloat(n"TargetDistanceZ", FASCommonUtils::CalculateEntityDistanceZ(Entity, TargetEntity, true, true));
        float local_62 = FMath::RadiansToDegrees(local_16.GetRotation().AngularDistance((FVector(local_14.opCall().GetPosition()) - local_16.GetPosition()).VectorPlaneProject(FVector::UpVector).ToOrientationQuat()));
        local_20.SetValueAsFloat(n"TargetDirectionAngleXY", float32(local_62));
        FVector local_68(local_16.GetRotation().GetForwardVector());
        if ((local_68.CrossProduct((FVector(local_14.opCall().GetPosition()) - local_16.GetPosition()).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector))).Z < 0.0)
        {
            local_82 = -local_62;
        }
        else
        {
            local_82 = local_62;
        }
        local_20.SetValueAsFloat(n"TargetDirectionAngleXYSigned", float32(local_82));
        FVector local_88(local_14.opCall().GetRotation().GetForwardVector());
        FVector local_80 = (FVector(local_16.GetPosition()) - local_14.opCall().GetPosition());
        local_80.Z = 0.0;
        local_80.Normalize(9.99999993922529e-9);
        float local_60 = FMath::RadiansToDegrees(FMath::Acos(local_88.DotProduct(local_80)));
        float32 local_96 = FMath::Abs(float32(local_60));
        local_20.SetValueAsFloat(n"TargetFaceToSelfAngleXY", local_96);
        if (local_96 <= 90.0f)
        {
            local_20.SetValueAsBool(n"TargetIsFaceSelf", true);
        }
        else
        {
            local_20.SetValueAsBool(n"TargetIsFaceSelf", false);
        }
        if (local_21 < local_22)
        {
            local_82 = local_20.GetValueAsFloat(n"TargetTimeInMeleeRange") + 0.ToSeconds();
            local_20.SetValueAsFloat(n"TargetTimeInMeleeRange", float32(local_82));
        }
        else
        {
            local_20.SetValueAsFloat(n"TargetTimeInMeleeRange", 0.0f);
        }
        if (TargetEntity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_Attack) && (local_21 < 800.0f))
        {
            local_20.SetValueAsBool(n"TargetInAttack", true);
            return;
        }
        local_20.SetValueAsBool(n"TargetInAttack", false);
    }
    return;
}
void UpdateCombatKnowledgeAboutTargetV2(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    UBlackboardComponent local_6 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if ((!((local_6 != nullptr))))
    {
        return;
    }
    FECSEntity local_14 = FECSEntity(Entity.GetWorld(), local_6.GetValueAsEntityId(n"TargetEntityID"));
    FAIKnowledgeUtils::UpdateCombatKnowledgeInternal(Entity, local_14);
    return;
}
void UpdateCombatKnowledgeAboutTarget(const FECSEntity &inout Entity, const FECSEntity &inout TargetEntity)
{
    if (!(Entity.IsValid()) || !(TargetEntity.IsValid()))
    {
        return;
    }
    UBlackboardComponent local_6 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (!((local_6 != nullptr)))
    {
        return;
    }
    local_6.SetValueAsEntityId(n"TargetEntityID", TargetEntity.GetId());
    if (TargetEntity.IsActive())
    {
        FAIKnowledgeUtils::UpdateCombatKnowledgeInternal(Entity, TargetEntity);
        return;
    }
    local_6.SetValueAsEntityId(n"TargetEntityID", ENTITY_ID_NULL);
    return;
}
bool GetAIBlackboardValueBool(const FECSEntity &inout Entity, const FName &inout KeyName)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        return local_4.GetValueAsBool(KeyName);
    }
    return false;
}
void SetAIBlackboardValueBool(const FECSEntity &inout Entity, const FName &inout KeyName, const bool Value)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        local_4.SetValueAsBool(KeyName, Value);
    }
    return;
}
int GetAIBlackboardValueInt(const FECSEntity &inout Entity, const FName &inout KeyName)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        return local_4.GetValueAsInt(KeyName);
    }
    return 0;
}
void SetAIBlackboardValueInt(const FECSEntity &inout Entity, const FName &inout KeyName, const int Value)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        local_4.SetValueAsInt(KeyName, Value);
    }
    return;
}
float32 GetAIBlackboardValueFloat(const FECSEntity &inout Entity, const FName &inout KeyName)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        return local_4.GetValueAsFloat(KeyName);
    }
    return 0.0f;
}
void SetAIBlackboardValueFloat(const FECSEntity &inout Entity, const FName &inout KeyName, const float32 Value)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        local_4.SetValueAsFloat(KeyName, Value);
    }
    return;
}
FECSEntityId GetAIBlackboardValueEntityId(const FECSEntity &inout Entity, const FName &inout KeyName)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        return local_4.GetValueAsEntityId(KeyName);
    }
    return ENTITY_ID_NULL;
}
void SetAIBlackboardValueEntityId(const FECSEntity &inout Entity, const FName &inout KeyName, const FECSEntityId &inout Value)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        local_4.SetValueAsEntityId(KeyName, Value);
    }
    return;
}
FVector GetAIBlackboardValueVector(const FECSEntity &inout Entity, const FName &inout KeyName)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        return local_4.GetValueAsVector(KeyName);
    }
    return FVector::ZeroVector;
}
void SetAIBlackboardValueVector(const FECSEntity &inout Entity, const FName &inout KeyName, const FVector &inout Value)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        local_4.SetValueAsVector(KeyName, Value);
    }
    return;
}
FName GetAIBlackboardValueName(const FECSEntity &inout Entity, const FName &inout KeyName)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        return local_4.GetValueAsName(KeyName);
    }
    return NAME_None;
}
void SetAIBlackboardValueName(const FECSEntity &inout Entity, const FName &inout KeyName, const FName &inout Value)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        local_4.SetValueAsName(KeyName, Value);
    }
    return;
}
FString GetAIBlackboardValueString(const FECSEntity &inout Entity, const FName &inout KeyName)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        return local_4.GetValueAsString(KeyName);
    }
    return "";
}
void SetAIBlackboardValueString(const FECSEntity &inout Entity, const FName &inout KeyName, const FString &inout Value)
{
    UBlackboardComponent local_4 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
    if (local_4 != nullptr)
    {
        local_4.SetValueAsString(KeyName, Value);
    }
    return;
}
UFUNCTION()
ETargetUnavailableReason CheckTargetAvailability(const FECSEntity &inout TargetEntity)
{
    if (!(TargetEntity.IsActive()))
    {
        return ETargetUnavailableReason(6);
    }
    Has local_6;
    bool local_1 = local_6.opCall();
    if (local_1)
    {
        local_1 = true;
    }
    else
    {
        Has local_10;
        local_1 = local_10.opCall();
    }
    if (local_1)
    {
        return ETargetUnavailableReason(1);
    }
    Has local_16;
    bool local_1_2 = local_16.opCall();
    if (local_1_2)
    {
        return ETargetUnavailableReason(2);
    }
    Get local_20;
    const FC_BlockInteractionRuntime& local_22 = local_20.opCall();
    if (local_22)
    {
        if (local_22.GetbBlocked())
        {
            return ETargetUnavailableReason(4);
        }
    }
    if (FAIKnowledgeUtils::IsInteractionFullyOccupied(TargetEntity))
    {
        return ETargetUnavailableReason(3);
    }
    return ETargetUnavailableReason(0);
}
UFUNCTION()
bool IsTargetAvailable(const FECSEntity &inout TargetEntity)
{
    return (int(FAIKnowledgeUtils::CheckTargetAvailability(TargetEntity)) == 0);
}
bool IsInteractionFullyOccupied(const FECSEntity &inout TargetEntity)
{
    int local_6 = 0;
    int local_14 = 0;
    int local_22 = 0;
    if (!(local_6))
    {
        return false;
    }
    if (!(local_14))
    {
        return false;
    }
    int local_15 = 0;
    for (; local_15 < local_6.InteractionPoints.Num(); ++local_15)
    {
        const FInteractionPoint& local_20 = local_6.InteractionPoints[local_15];
        if (!(local_20.PointType.IsValid()))
        {
            continue;
        }
        TDataObjectPtr<FInteractionPointTypeConfig> local_46 = TDataObjectPtr<FInteractionPointTypeConfig>(local_20.PointType);
        int local_47 = 0;
        while (local_47 < 0)
        {
            TSubclassOf<UInteractionBehaviorBase> local_50 = TSubclassOf<UInteractionBehaviorBase>(local_22.Behaviors[local_47]);
            if ((local_50 == nullptr))
            {
            }
            else
            {
                UInteractionBehaviorBase local_54 = local_50.GetDefaultObject();
                if (local_54 == nullptr)
                {
                }
                else
                {
                    if (int(local_54.MaxInteractSourceCount) <= 0)
                    {
                        return false;
                    }
                    if (FInteractUtils::CheckWithinInteractSourceMaxNumber(TargetEntity, local_54, local_15, local_47))
                    {
                        return false;
                    }
                }
            }
            ++local_47;
        }
    }
    return true;
}
}
