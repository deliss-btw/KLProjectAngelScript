
const FConsoleVariable CVar_AITargetting_DebugAttackTarget = FConsoleVariable();

namespace FAITargetingUtils
{
TDataObjectPtr<FAITargetingConfig> GetTargetingConfig(const FECSEntity &inout Entity)
{
    if (!((FASCommonUtils::GetCombatUnitBaseConfig(Entity) == nullptr)) && !((GetTargetingConfig() == nullptr)))
    {
        return GetTargetingConfig();
    }
    return (TDataObjectPtr<FAITargetingConfig>(nullptr));
}
void InitAITargetingV2(const FECSEntity &inout Entity, const TDataObjectPtr<FAITargetingConfig> &inout FallbackConfig)
{
    int local_8 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    TDataObjectPtr<FAITargetingConfig> local_56 = FAITargetingUtils::GetTargetingConfig(Entity);
    if ((local_56 == nullptr))
    {
        local_56 = FallbackConfig;
    }
    if ((local_56 == nullptr))
    {
        return;
    }
    TDataObjectPtr<FAITargetingQueryConfig> local_80 = GetDefaultTargetingQueryConfig();
    if ((local_80 == nullptr))
    {
        return;
    }
    TArray<FAISmartEntityValue> local_108;
    FAISmartEntityValue local_114;
    local_114.SetTargetId(FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0)));
    local_114.SetValue(ENTITY_ID_NULL);
    local_108.Add(local_114);
    FAITargetingUtils::PushQueryInstance(Entity, EAITargetingQuerySourceType(0), local_80, local_108, FAITargetingQueryResult(), NAME_None, 0);
    return;
}
FAITargetingQueryResult Query(const FECSEntity &inout Entity, const TDataObjectPtr<FAITargetingQueryConfig> &inout TargetingQueryConfig, const FAISmartValueContext &inout Context)
{
    FAITargetingQueryResult local_4;
    int local_12 = 0;
    if (!(Entity.IsValid()))
    {
        return local_4;
    }
    if ((TargetingQueryConfig == nullptr))
    {
        return local_4;
    }
    if (!(local_12))
    {
        return local_4;
    }
    TArray<FECSEntity> local_16;
    for (auto& local_34 : local_12.AllTargets)
    {
        FECSEntity local_42 = local_34.GetEntity();
        if (local_42.IsValid() && FAIKnowledgeUtils::IsEntityTargetable(local_42))
        {
            local_16.Add(local_42);
        }
    }
    return TargetingQueryConfig.opArrow().Query(Entity, local_16, Context);
}
TArray<FAISmartEntityValue> BuildQueryOutputs(const FECSEntity &inout Entity, const TDataObjectPtr<FAITargetingQueryConfig> &inout QueryConfig, const TArray<FAISmart_EntityId> &inout TargetIDs, const FAISmartValueContext &inout Context, FAITargetingQueryResult &inout OutQueryResult)
{
    TArray<FAISmartEntityValue> local_4;
    OutQueryResult = FAITargetingUtils::Query(Entity, QueryConfig, Context);
    int local_10 = TargetIDs.Num();
    int local_11 = 0;
    for (; local_11 < local_10; )
    {
        FAISmartEntityValue local_18;
        local_18.SetTargetId(TargetIDs[local_11]);
        FECSEntityId local_22;
        if (local_11 < OutQueryResult.GetEntries().Num() && OutQueryResult.GetEntries()[local_11].GetEntity().IsValid())
        {
            local_22 = OutQueryResult.GetEntries()[local_11].GetEntity().GetId();
        }
        else
        {
            local_22 = ENTITY_ID_NULL;
        }
        local_18.SetValue(local_22);
        local_4.Add(local_18);
        ++local_11;
    }
    return local_4;
}
void SetSmartEntityIdValueForEntity(const FECSEntity &inout Entity, const FAISmart_EntityId &inout Target, const FECSEntityId &inout Value)
{
    int local_34 = 0;
    if (!(Entity.IsValid()) || Target.GetKey().IsNone())
    {
        return;
    }
    int local_4 = Target.GetCategory();
    if (local_4 == 0)
    {
        UBlackboardComponent local_10 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
        if (local_10 != nullptr)
        {
            local_10.SetValueAsEntityId(Target.GetKey(), Value);
        }
    }
    else
    {
        if (local_4 == 2)
        {
            FECSEntity local_16 = FECSEntity(Entity.GetWorld(), Value);
            FNameHandle_EntityBBVarEntity local_20;
            local_20;
        }
        else
        {
            if (local_4 == 3)
            {
                Modify local_24;
                FC_EcologyKnowledge& local_26 = local_24.opCall();
                if (local_26)
                {
                    local_26.SetEntityId(FEcologyKnowledgeKey(Target.GetKey()), Value);
                }
            }
        }
    }
    if (local_34)
    {
        bool local_38;
        FName local_36 = Target.GetKey();
        int local_3 = Target.GetCategory();
        local_38 = false;
        int local_39 = 0;
        for (; local_39 < local_34.QueryOutputRecords.Num(); ++local_39)
        {
            FAISmartEntityIdRecord& local_42 = local_34.QueryOutputRecords[local_39];
            if ((FName(local_42.Target.GetKey()) == local_36) && (local_42.Target.GetCategory() == local_3))
            {
                if (!((local_42.Value == Value)))
                {
                    local_42.Value = Value;
                    local_42.UpdateTime = ECS::GetContextTime();
                }
                local_38 = true;
                break;
            }
        }
        if (!(local_38))
        {
            FAISmartEntityIdRecord local_56;
            local_56.Target = Target;
            local_56.Value = Value;
            local_56.UpdateTime = ECS::GetContextTime();
            local_34.QueryOutputRecords.Add(local_56);
        }
    }
    return;
}
FECSEntityId GetSmartEntityIdValueForEntity(const FECSEntity &inout Entity, const FAISmart_EntityId &inout Target)
{
    if (!(Entity.IsValid()) || Target.GetKey().IsNone())
    {
        return ENTITY_ID_NULL;
    }
    int local_4 = Target.GetCategory();
    if (local_4 == 0)
    {
        UBlackboardComponent local_10 = FAIKnowledgeUtils::GetAIBlackboardComponent(Entity);
        if (local_10 != nullptr)
        {
            return local_10.GetValueAsEntityId(Target.GetKey());
        }
    }
    else
    {
        if (local_4 == 2)
        {
            FNameHandle_EntityBBVarEntity local_16;
            local_16;
            Entity.GetBB_Entity(local_16).GetId();
            return FECSEntityId();
        }
        if (local_4 == 3)
        {
            Get local_24;
            const FC_EcologyKnowledge& local_26 = local_24.opCall();
            if (local_26)
            {
                return local_26.GetEntityId(FEcologyKnowledgeKey(Target.GetKey()));
            }
        }
    }
    return ENTITY_ID_NULL;
}
bool AreTargetSetsEqual(const TSet<FTargetEntity> &inout A, const TSet<FTargetEntity> &inout B)
{
    if (A.Num() != B.Num())
    {
        return false;
    }
    for (auto& local_22 : A)
    {
        if (!(B.Contains(local_22)))
        {
            return false;
        }
    }
    return true;
}
void ClearSelectedMarksIfNeed(const FECSEntity &inout Entity, const FAISmartValueContext &inout Context)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_AITargetingV2& local_8 = local_6.opCall();
    if (local_8)
    {
        bool local_21;
        if (local_8.QueryInstanceStack.IsEmpty())
        {
            if (!(local_8.SelectedMarks.IsEmpty()))
            {
                local_8.SelectedMarks.Empty(0);
            }
            return;
        }
        FAITargetingQueryResult local_20 = FAITargetingUtils::Query(Entity, local_8.QueryInstanceStack.Last(0).QueryConfig, Context);
        if (local_20.GetEntries().IsEmpty())
        {
            if (!(local_8.SelectedMarks.IsEmpty()))
            {
                local_8.SelectedMarks.Empty(0);
            }
            return;
        }
        local_21 = true;
        for (auto& local_36 : local_20.GetEntries())
        {
            if (local_36.GetEntity().IsValid() && !(local_8.SelectedMarks.Contains(local_36.GetEntity().GetId())))
            {
                local_21 = false;
                break;
            }
        }
        if (local_21)
        {
            local_8.SelectedMarks.Empty(0);
        }
    }
    return;
}
void UpdateSelectedMarks(const FECSEntity &inout Entity)
{
    int local_24 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_AITargetingV2& local_8 = local_6.opCall();
    FECSEntityId local_23;
    if (local_8)
    {
        for (auto& local_22 : local_8.CurrentQueryOutput)
        {
            local_22;
            if ((!((local_23 == ENTITY_ID_NULL))))
            {
                local_8.SelectedMarks.Add(local_24);
            }
        }
    }
    return;
}
void SyncCurrentQueryOutput(const FECSEntity &inout Entity, FC_AITargetingV2 &inout AITargetingV2)
{
    AITargetingV2.CurrentQueryOutput.Empty(0);
    if (AITargetingV2.QueryInstanceStack.IsEmpty())
    {
        return;
    }
    FAITargetingQueryInstance& local_4 = AITargetingV2.QueryInstanceStack.Last(0);
    for (auto& local_18 : local_4.TargetIDs)
    {
        FAISmartEntityValue local_24;
        local_24.SetTargetId(local_18);
        local_24.SetValue(FAITargetingUtils::GetSmartEntityIdValueForEntity(Entity, local_18));
        AITargetingV2.CurrentQueryOutput.Add(local_24);
    }
    return;
}
int64 AllocateQueryHandle(const FECSEntity &inout Entity)
{
    FC_AITargetingV2 local_6;
    if (!(local_6))
    {
        return 0;
    }
    local_6.NextQueryHandle += 1;
    return local_6.NextQueryHandle;
}
int64 PushQueryInstance(const FECSEntity &inout Entity, const EAITargetingQuerySourceType EntryType, const TDataObjectPtr<FAITargetingQueryConfig> &inout QueryConfig, const TArray<FAISmartEntityValue> &inout QueryOutputs, const FAITargetingQueryResult &inout QueryResult, const FName &inout SourceName = NAME_None, const int64 PreAssignedHandle = 0)
{
    FC_AITargetingV2 local_6;
    if (!(local_6))
    {
        return 0;
    }
    FAITargetingQueryInstance local_44;
    local_44.EntryType = EntryType;
    local_44.QueryConfig = QueryConfig;
    for (auto& local_82 : QueryOutputs)
    {
        local_44.TargetIDs.Add(local_82.GetTargetId());
    }
    if (PreAssignedHandle != 0)
    {
        local_44.Handle = PreAssignedHandle;
    }
    else
    {
        local_6.NextQueryHandle += 1;
        local_44.Handle = local_6.NextQueryHandle;
    }
    local_44.SourceName = SourceName;
    local_6.QueryInstanceStack.Add(local_44);
    for (auto& local_82 : QueryOutputs)
    {
        FAITargetingUtils::SetSmartEntityIdValueForEntity(Entity, local_82.GetTargetId());
    }
    FAITargetingUtils::ApplySelectedResult(Entity, local_6, QueryResult);
    FAITargetingUtils::SyncCurrentQueryOutput(Entity, local_6);
    return local_44.Handle;
}
void PopQueryInstanceByHandle(const FECSEntity &inout Entity, const int64 Handle)
{
    int local_10 = 0;
    bool local_43;
    if (Handle == 0)
    {
        return;
    }
    if (!(local_10) || local_10.QueryInstanceStack.IsEmpty())
    {
        return;
    }
    int local_12 = -1;
    int local_16 = local_10.QueryInstanceStack.Num() - 1;
    for (; local_16 >= 0; --local_16)
    {
        if (local_10.QueryInstanceStack[local_16].Handle == Handle)
        {
            local_12 = local_16;
            break;
        }
    }
    if (local_12 < 0)
    {
        XWarning(ELog(14), FString().Append("PopQueryInstanceByHandle: Handle ").Append(Handle).Append(" not found in stack of ").Append(Entity.GetEntityName()));
        return;
    }
    TArray<FAISmart_EntityId> local_28 = local_10.QueryInstanceStack[local_12].TargetIDs;
    local_10.QueryInstanceStack.RemoveAt(local_12);
    if (!(local_10.QueryInstanceStack.IsEmpty()))
    {
        for (auto& local_42 : local_28)
        {
            local_43 = false;
            int local_13 = local_10.QueryInstanceStack.Num() - 1;
            for (; local_13 >= 0; --local_13)
            {
                if (local_10.QueryInstanceStack[local_13].TargetIDs.Contains(local_42))
                {
                    local_43 = true;
                    break;
                }
            }
            if (!(local_43))
            {
                FAITargetingUtils::SetSmartEntityIdValueForEntity(Entity, local_42, ENTITY_ID_NULL);
            }
        }
        FAITargetingUtils::ApplyTopQuery(Entity, local_10);
    }
    else
    {
        for (auto& local_42 : local_28)
        {
            FAITargetingUtils::SetSmartEntityIdValueForEntity(Entity, local_42, ENTITY_ID_NULL);
        }
        FAITargetingUtils::ApplySelectedResult(Entity, local_10, FAITargetingQueryResult());
        FAITargetingUtils::SyncCurrentQueryOutput(Entity, local_10);
    }
    return;
}
void PopQueryInstanceBySourceName(const FECSEntity &inout Entity, const FName &inout SourceName)
{
    int local_8 = 0;
    if (SourceName.IsNone())
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    int64 local_10 = 0;
    int local_16 = local_8.QueryInstanceStack.Num() - 1;
    for (; local_16 >= 0; --local_16)
    {
        const FAITargetingQueryInstance& local_18 = local_8.QueryInstanceStack[local_16];
        if ((int(local_18.EntryType) == 3 && (local_18.SourceName == SourceName)))
        {
            local_10 = local_18.Handle;
            break;
        }
    }
    if (local_10 == 0)
    {
        XWarning(ELog(14), FString().Append("PopQueryInstanceBySourceName: External SourceName '").Append(SourceName.ToString()).Append("' not found in stack of ").Append(Entity.GetEntityName()));
        return;
    }
    FAITargetingUtils::PopQueryInstanceByHandle(Entity, local_10);
    return;
}
void ApplyTopQuery(const FECSEntity &inout Entity, FC_AITargetingV2 &inout AITargetingV2)
{
    if (AITargetingV2.QueryInstanceStack.IsEmpty())
    {
        return;
    }
    FAITargetingQueryInstance& local_4 = AITargetingV2.QueryInstanceStack.Last(0);
    TDataObjectPtr<FAITargetingQueryConfig> local_28;
    local_28 = local_4.QueryConfig;
    if ((local_28 == nullptr))
    {
        FAITargetingUtils::ApplySelectedResult(Entity, AITargetingV2, FAITargetingQueryResult());
        FAITargetingUtils::SyncCurrentQueryOutput(Entity, AITargetingV2);
        return;
    }
    FAITargetingQueryConfig::CreateBehaviorTreeContextForEntity(Entity);
    FAITargetingQueryResult local_92;
    TArray<FAISmartEntityValue> local_102 = FAITargetingUtils::BuildQueryOutputs(Entity, local_4.QueryConfig, local_4.TargetIDs, FAISmartValueContext(), local_92);
    for (auto& local_116 : local_102)
    {
        FAITargetingUtils::SetSmartEntityIdValueForEntity(Entity, local_116.GetTargetId());
    }
    FAITargetingUtils::ApplySelectedResult(Entity, AITargetingV2, local_92);
    FAITargetingUtils::SyncCurrentQueryOutput(Entity, AITargetingV2);
    return;
}
FECSEntity GetCurrentAttackTarget(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_AITargetingV2& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.CurrentQueryOutput.IsEmpty())
        {
            return FECSEntity();
        }
        FECSWorldPtr local_16 = Entity.GetWorld();
        return FECSEntity();
    }
    return FECSEntity();
}
bool HasValidTarget(const FECSEntity &inout Entity)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return false;
    }
    if (local_6.CurrentQueryOutput.Num() <= 0)
    {
        return false;
    }
    bool local_10 = false;
    FECSEntityId local_25;
    for (auto& local_24 : local_6.CurrentQueryOutput)
    {
        local_24;
        if (!((local_25 == ENTITY_ID_NULL)))
        {
            local_10 = true;
            break;
        }
    }
    return local_10;
}
bool CheckTags(const FECSEntity &inout Entity, const FGameplayTagContainer &inout IncludeGameplayTags, const FGameplayTagContainer &inout ExcludeGameplayTags)
{
    Get local_6;
    bool local_1 = true;
    if (!(ExcludeGameplayTags.IsEmpty()) && ExcludeGameplayTags.HasAny(local_6.opCall().GetTagContainer()))
    {
        local_1 = false;
    }
    if (!(IncludeGameplayTags.IsEmpty()) && !(IncludeGameplayTags.HasAny(local_6.opCall().GetTagContainer())))
    {
        local_1 = false;
    }
    return local_1;
}
FECSEntity TryGetValidAvatarTarget(const FECSEntity &inout Entity)
{
    FECSEntity local_8 = FASCommonUtils::GetRiderEntity(FASCommonUtils::GetControlledPawnEntity(Entity));
    return local_8;
}
FECSEntity GetPlayerController(const FECSEntity &inout Entity)
{
    FECSEntity local_4;
    Get local_8;
    const FC_ControlledByPlayer& local_10 = local_8.opCall();
    if (local_10)
    {
        local_4 = FECSEntity(local_10.GetPlayerEntity());
    }
    else
    {
        local_4 = Entity;
    }
    return local_4;
}
void AddExternalTarget(const FECSEntity &inout Entity, const FTargetEntity &inout TargetEntity, const FName &inout SourceName, const EAIExternalTargetPriority Priority)
{
    int local_8 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    for (auto& local_22 : local_8.ExternalTargets)
    {
        if (((local_22.Target == TargetEntity) && (local_22.SourceName == SourceName)))
        {
            local_22.Priority = Priority;
            return;
        }
    }
    FAIExternalTargetInfo local_34;
    local_34.Priority = Priority;
    local_34.Target = TargetEntity;
    local_34.SourceName = SourceName;
    local_8.ExternalTargets.Add(local_34);
    return;
}
void RemoveExternalTarget(const FECSEntity &inout Entity, const FName &inout SourceName)
{
    int local_8 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    int local_12 = local_8.ExternalTargets.Num() - 1;
    for (; local_12 >= 0; --local_12)
    {
        if ((FName(local_8.ExternalTargets[local_12].SourceName) == SourceName))
        {
            local_8.ExternalTargets.RemoveAt(local_12);
        }
    }
    return;
}
void SendAITargetChangedEventV2(const FECSEntity &inout Entity, const FTargetEntity &inout OldTarget, const FTargetEntity &inout NewTarget, const FAISmart_EntityId &inout TargetId)
{
    int local_12 = 0;
    if ((!((OldTarget == NewTarget))))
    {
        FFPTime local_8 = FFPTime(-1);
        local_12.OldTarget = OldTarget;
        local_12.NewTarget = NewTarget;
        local_12.TargetId = TargetId;
    }
    return;
}
void ApplySelectedResult(const FECSEntity &inout Entity, FC_AITargetingV2 &inout AITargetingV2, const FAITargetingQueryResult &inout NewResult)
{
    TSet<FTargetEntity> local_20;
    int local_96 = 0;
    for (auto& local_36 : AITargetingV2.CurrentTopQueryResult.GetEntries())
    {
        local_20.Add(FTargetEntity(local_36.GetEntity()));
    }
    TSet<FTargetEntity> local_58;
    for (auto& local_36 : NewResult.GetEntries())
    {
        if (local_36.GetEntity().IsValid())
        {
            local_58.Add(FTargetEntity(local_36.GetEntity()));
        }
    }
    TArray<FTargetEntity> local_62;
    for (auto& local_80 : local_58)
    {
        if (!(local_20.Contains(local_80)))
        {
            local_62.Add(local_80);
        }
    }
    TArray<FTargetEntity> local_86;
    for (auto& local_80 : local_20)
    {
        if (!(local_58.Contains(local_80)))
        {
            local_86.Add(local_80);
        }
    }
    if (!(local_62.IsEmpty()) || !(local_86.IsEmpty()))
    {
        FFPTime local_94 = FFPTime(-1);
        local_96.AddedTargets = local_62;
        local_96.RemovedTargets = local_86;
    }
    AITargetingV2.CurrentTopQueryResult = NewResult;
    return;
}
void SendAIAttackTargetChangedEvent(const FECSEntity &inout Entity, const FTargetEntity &inout OldAttackTarget, const FTargetEntity &inout NewAttackTarget)
{
    int local_12 = 0;
    if ((!((OldAttackTarget == NewAttackTarget))))
    {
        FFPTime local_8 = FFPTime(-1);
        local_12.OldAttackTarget = OldAttackTarget;
        local_12.NewAttackTarget = NewAttackTarget;
    }
    return;
}
void UpdateCombatStateV2(const FECSEntity &inout Entity, const bool bInNeedCombat)
{
    FC_CombatState local_20;
    bool local_1 = bInNeedCombat;
    Has local_6;
    bool local_7 = local_6.opCall();
    if (FAIKnowledgeUtils::CanMuteCombat(Entity) && !(local_7))
    {
        local_1 = false;
    }
    Has local_14;
    bool local_9 = local_1 && !(local_14.opCall());
    if (local_9)
    {
        if (!(FAIPlayerDistLODUtils::CanEntityCombat(Entity)))
        {
            local_1 = false;
        }
    }
    if (!(local_20))
    {
        local_9 = false;
    }
    else
    {
        local_9 = local_20.bInCombat;
    }
    local_9 = local_9 && !(local_1);
    if (local_9)
    {
        FCombatStateUtils::ExitCombat(Entity, ECombatSessionEndReason(1));
    }
    else
    {
        if (local_1)
        {
            FCombatStateUtils::EnterCombat(Entity);
        }
    }
    Has local_26;
    bool local_8 = local_26.opCall();
    if ((local_8 && !(local_1) && !(local_7)))
    {
        FAIKnowledgeUtils::QuitCombat(Entity);
        FAIKnowledgeUtils::VisualLog(Entity, FString().Append("AIKnowledgeLog: ").Append(Entity.GetEntityName()).Append(" QuitCombat"), n"AIKnowledgePerception");
        return;
    }
    bool local_9_2 = !(local_8);
    if ((local_9_2 && local_1))
    {
        FAIKnowledgeUtils::EnterCombat(Entity);
        FAIKnowledgeUtils::VisualLog(Entity, FString().Append("AIKnowledgeLog: ").Append(Entity.GetEntityName()).Append(" EnterCombat"), n"AIKnowledgePerception");
    }
    return;
}
void AddHostility(const FECSEntity &inout Entity, const FTargetEntity &inout TargetEntity, const float32 HostilityDamage)
{
    FFPTime local_4 = ECS::GetContextTime();
    Modify local_8;
    FC_AITargetingV2& local_10 = local_8.opCall();
    if (local_10)
    {
        local_10.TargetsHostilityMap.FindOrAdd(TargetEntity).Records.Add(FHostilityDamageRecord(HostilityDamage, local_4));
    }
    return;
}
void AddHostilityByDamage(const FECSEntity &inout Entity, const FTargetEntity &inout TargetEntity, const float32 Damage, const float32 HostilityIncrementMultiplier, const float32 HostilityAccumulationTime)
{
    FAITargetingUtils::AddHostility(Entity, TargetEntity, Damage * HostilityIncrementMultiplier);
    FAITargetingUtils::UpdateHostility(Entity, HostilityAccumulationTime);
    return;
}
void UpdateHostility(const FECSEntity &inout Entity, const float32 HostilityAccumulationTime)
{
    float32 local_65 = 0.0f;
    FFPTime local_4 = ECS::GetContextTime();
    FFPTime local_2 = FFPTime(HostilityAccumulationTime);
    FFPTime local_10 = (local_4 - local_2);
    Modify local_14;
    FC_AITargetingV2& local_16 = local_14.opCall();
    if (local_16)
    {
        float32 local_66;
        float32 local_18 = 0.0f;
        TMap<FTargetEntity, float32> local_40;
        for (auto& local_58 : local_16.TargetsHostilityMap)
        {
            float32 local_60 = local_40.FindOrAdd(local_58.GetKey(), 0.0f);
            int local_64 = 0 - 1;
            for (; local_64 >= 0; --local_64)
            {
                if (local_2.opCmp(local_10) < 0)
                {
                    continue;
                }
                local_60 = (local_60 + local_65);
                local_18 = local_18 + local_65;
            }
        }
        local_66 = 0.0f;
        for (auto& local_58_2 : local_16.TargetsHostilityMap)
        {
            local_66 = local_40[local_58_2.GetKey()];
            if (local_66 > 0.0f)
            {
                local_65 = local_66 / local_18;
            }
            else
            {
                local_65 = 0.0f;
            }
        }
    }
    return;
}
void UpdateNonPlayerAITargetV2(const FECSEntity &inout Entity, FC_AITargetingV2 &inout AITargeting)
{
    if (DelayTask::IsValidHandle(AITargeting.UpdateTargetingTaskHandle))
    {
        DelayTask::CancelTask(AITargeting.UpdateTargetingTaskHandle);
        AITargeting.UpdateTargetingTaskHandle = FDelayTaskConst::EmptyDelayTaskHandle;
    }
    FAITargetingUtils::ApplyTopQuery(Entity, AITargeting);
    FAITargetingUtils::UpdateCombatStateV2(Entity, FAITargetingUtils::HasValidTarget(Entity));
    return;
}
void SetTargetingMaster(const FECSEntity &inout Slave, const FECSEntity &inout Master)
{
    if (!(Slave.IsValid()) || !(Master.IsValid()))
    {
        return;
    }
    if ((Slave == Master))
    {
        return;
    }
    Get local_6;
    const FC_AITargetingSync& local_8 = local_6.opCall();
    if (local_8)
    {
        if ((local_8.MasterEntity == Slave))
        {
            return;
        }
    }
    local_8.MasterEntity = Master;
    return;
}
void ClearTargetingMaster(const FECSEntity &inout Slave)
{
    if (!(Slave.IsValid()))
    {
        return;
    }
    Remove local_6;
    local_6.opCall();
    return;
}
void SyncTargetingFromMaster(const FECSEntity &inout Slave, FC_AITargetingV2 &inout SlaveTargeting, const FECSEntity &inout Master)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return;
    }
    if (!(SlaveTargeting.QueryInstanceStack.IsEmpty()))
    {
        FECSEntityId local_8 = FECSEntityId(ENTITY_ID_NULL);
        if (!(local_6.CurrentQueryOutput.IsEmpty()))
        {
        }
        FAITargetingQueryInstance& local_12 = SlaveTargeting.QueryInstanceStack.Last(0);
        for (auto& local_26 : local_12.TargetIDs)
        {
            FECSEntityId local_27 = local_8;
            for (auto& local_42 : local_6.CurrentQueryOutput)
            {
                if ((FName(local_42.GetTargetId().GetKey()) == local_26.GetKey()) && (local_42.GetTargetId().GetCategory() == local_26.GetCategory()))
                {
                    break;
                }
            }
            FAITargetingUtils::SetSmartEntityIdValueForEntity(Slave, local_26, local_27);
        }
        FAITargetingUtils::ApplySelectedResult(Slave, SlaveTargeting, local_6.CurrentTopQueryResult);
        FAITargetingUtils::SyncCurrentQueryOutput(Slave, SlaveTargeting);
    }
    else
    {
        XWarning(ELog(14), FString().Append("SyncTargetingFromMaster: ").Append(Slave.GetEntityName()).Append(" empty QueryInstanceStack, only combat-state synced"));
    }
    FAITargetingUtils::UpdateCombatStateV2(Slave, FAITargetingUtils::HasValidTarget(Master));
    return;
}
void ClearSelfTargeting(const FECSEntity &inout Entity)
{
    bool local_1;
    if (!(Entity.IsValid()))
    {
        local_1 = true;
    }
    else
    {
        Has local_6;
        local_1 = local_6.opCall();
    }
    if (local_1)
    {
        return;
    }
    Modify local_12;
    FC_AITargetingV2& local_14 = local_12.opCall();
    FECSEntityId local_29;
    if (local_14)
    {
        for (auto& local_28 : local_14.CurrentQueryOutput)
        {
            if (!((local_29 == ENTITY_ID_NULL)))
            {
                FECSWorldPtr local_34 = Entity.GetWorld();
                FTargetEntity local_40 = FTargetEntity(FECSEntity());
                FAITargetingUtils::SetSmartEntityIdValueForEntity(Entity, local_28.GetTargetId(), ENTITY_ID_NULL);
                FAITargetingUtils::SendAITargetChangedEventV2(Entity, local_40, FTargetEntity(), local_28.GetTargetId());
            }
        }
        local_14.EntityAlertnessMap.Empty(0);
        local_14.TargetsHostilityMap.Empty(0);
        local_14.ExternalTargets.Empty(0);
        local_14.AllTargets.Empty(0);
        local_14.CurrentQueryOutput.Empty(0);
        FAITargetingUtils::ApplySelectedResult(Entity, local_14, FAITargetingQueryResult());
    }
    FLockTargetUtils::ClearLockTarget(Entity);
    return;
}
void ClearOthersRelatedTargeting(const FECSEntity &inout Entity)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
FECSEntity GetSwitchTargetForMultiPlayer(const FECSEntity &inout Entity, const float32 TargetDistance = 2000.0, const float32 MaxSearchDistance = 10000.0)
{
    Get local_4;
    int local_6 = 0;
    const FC_Transform& local_58;
    if (!(local_6))
    {
        return ENTITY_NULL;
    }
    FTargetEntity local_16 = FTargetEntity(FAITargetingUtils::GetCurrentAttackTarget(Entity));
    TArray<FTargetEntity> local_20;
    Get local_24;
    const FC_AITargetingV2& local_26 = local_24.opCall();
    Has local_52;
    if (local_26)
    {
        for (auto local_44 : local_26.AllTargets)
        {
            FECSEntity local_14 = local_44.GetEntity();
            if ((local_44 == local_16))
            {
                continue;
            }
            if (!(FAIKnowledgeUtils::CanEntityBeTarget(local_14)))
            {
                continue;
            }
            if (!(local_52.opCall()))
            {
                continue;
            }
            Has local_56;
            bool local_7 = local_56.opCall();
            if (local_7)
            {
                continue;
            }
            local_58 = local_4.opCall();
            if (local_58)
            {
                if (local_6.GetPosition().DistXY(local_58.GetPosition()) > MaxSearchDistance)
                {
                    continue;
                }
                local_20.Add(local_44);
            }
        }
    }
    if (local_20.IsEmpty())
    {
        return local_16.GetEntity();
    }
    FECSEntity local_14_2 = FECSEntity(ENTITY_NULL);
    float32 local_64 = 3.4028235e38f;
    for (auto local_44 : local_20)
    {
        FECSEntity local_82 = FECSEntity(local_44.GetEntity());
        local_58 = local_4.opCall();
        if (local_58)
        {
            float32 local_85 = FMath::Abs(float32(local_6.GetPosition().DistXY(local_58.GetPosition())) - TargetDistance);
            if (local_85 < local_64)
            {
                local_64 = local_85;
                local_14_2 = local_82;
            }
        }
    }
    return local_14_2;
}
int GetPlayerTargetCount(const FECSEntity &inout Entity)
{
    int local_1 = 0;
    Get local_6;
    const FC_AITargetingV2& local_8 = local_6.opCall();
    Has local_40;
    if (local_8)
    {
        for (auto& local_28 : local_8.AllTargets)
        {
            FECSEntity local_36 = local_28.GetEntity();
            if (!(local_36.IsValid()))
            {
                continue;
            }
            if (!(local_40.opCall()))
            {
                continue;
            }
            if (!(FAIKnowledgeUtils::CanEntityBeTarget(local_36)))
            {
                continue;
            }
            Has local_44;
            bool local_9 = local_44.opCall();
            if (local_9)
            {
                continue;
            }
            ++local_1;
        }
        return local_1;
    }
    return local_1;
}
TSet<FECSEntity> GetCombatGroupMembers(const FECSEntity &inout Entity)
{
    TSet<FECSEntity> local_20;
    int local_28 = 0;
    if (!(Entity.IsValid()))
    {
        return local_20;
    }
    local_20.Add(Entity);
    if (!(local_28))
    {
        return local_20;
    }
    if (!(FECSEntity(local_28.GroupId).IsValid()))
    {
        return local_20;
    }
    Get local_40;
    const FC_CombatGroup& local_42 = local_40.opCall();
    if (local_42)
    {
        local_20.Append(local_42.Members);
    }
    return local_20;
}
TSet<FTargetEntity> GetEntityCombatTargets(const FECSEntity &inout Entity)
{
    TSet<FTargetEntity> local_20;
    if (!(Entity.IsValid()))
    {
        return local_20;
    }
    Has local_26;
    bool local_21 = local_26.opCall();
    if (local_21)
    {
        Get local_30;
        const FC_PlayerBeTargeted& local_32 = local_30.opCall();
        if (local_32)
        {
            local_20.Append(local_32.CombatTargets);
        }
    }
    else
    {
        Get local_36;
        const FC_AITargetingV2& local_38 = local_36.opCall();
        if (local_38)
        {
            for (auto& local_52 : local_38.CurrentTopQueryResult.GetEntries())
            {
                if (local_52.GetEntity().IsValid())
                {
                    local_20.Add(FTargetEntity(local_52.GetEntity()));
                }
            }
        }
    }
    return local_20;
}
bool TryAddToAllTarget(FC_AITargetingV2 &inout AITargetingV2, const FECSEntity &inout TargetEntity)
{
    if (!(FAIKnowledgeUtils::IsTargetValid(TargetEntity)))
    {
        return false;
    }
    AITargetingV2.AllTargets.Add(FTargetEntity(TargetEntity));
    return true;
}
void ClearTarget(FC_AITargetingV2 &inout AITargetingV2, const FECSEntity &inout TargetEntity)
{
    FTargetEntity local_2 = FTargetEntity(TargetEntity);
    return;
}
}
