
namespace FEcosimAIV2Utils
{
void UpdateEntityToTargetDamageRelation(const FECSEntity &inout Entity, const FECSEntity &inout TargetEntity)
{
    int local_48 = 0;
    Remove local_56;
    Get local_4;
    const FC_EcosimAIV2TargetRelation& local_6 = local_4.opCall();
    if (local_6)
    {
        FEcosimAIV2TargetRelationDetail local_12;
        if (local_6.TargetRelationMap.Find(FTargetEntity(TargetEntity), local_12))
        {
            Get local_18;
            const FC_EcosimAIV2Team& local_20 = local_18.opCall();
            if (local_20)
            {
                for (auto& local_34 : local_20.EntityMemberList)
                {
                    if (int(local_12.TargetRelation) == 2)
                    {
                        FECSEntity local_42 = local_34.GetEntity();
                        FEcosimAIV2DamageRelationOverrideData local_50;
                        local_50.SetDamageRelation(EFactionRelation(2));
                        local_48.GetModify_DamageRelationOverrideMap().Add(FTargetEntity(TargetEntity), local_50);
                        continue;
                    }
                    FECSEntity local_42_2 = local_34.GetEntity();
                    local_56.opCall();
                }
            }
            else
            {
                if (int(local_12.TargetRelation) == 2)
                {
                    FEcosimAIV2DamageRelationOverrideData local_50;
                    local_50.SetDamageRelation(EFactionRelation(2));
                    local_48.GetModify_DamageRelationOverrideMap().Add(FTargetEntity(TargetEntity), local_50);
                }
                else
                {
                    local_56.opCall();
                }
            }
        }
    }
    return;
}
void HandleEcosimAIV2TargetRelationByDamage(FC_EcosimAIV2TargetRelation &inout EcosimAIV2TargetRelation, const FECSEntity &inout SourceEntity, const FECSEntity &inout TriggerDamageEntity, const FCS_FixedTime &inout FixedTime)
{
    FTargetEntity local_2 = FTargetEntity(TriggerDamageEntity);
    FEcosimAIV2TargetRelationDetail local_4;
    if ((FFPTime(FixedTime.Time) - local_4.EnterTime).ToSeconds() > 2.0)
    {
        if (int(local_4.TargetRelation) == 0)
        {
            local_4.TargetRelation = EEcosimAIV2TargetRelation(1);
        }
        else
        {
            if (int(local_4.TargetRelation) == 1)
            {
                local_4.TargetRelation = EEcosimAIV2TargetRelation(2);
            }
            else
            {
                if (int(local_4.TargetRelation) == 3)
                {
                    local_4.TargetRelation = EEcosimAIV2TargetRelation(2);
                }
            }
        }
        FEcosimAIV2Utils::UpdateEntityToTargetDamageRelation(SourceEntity, TriggerDamageEntity);
    }
    return;
}
void HandleEcosimAIV2ActionExpression(const EEcosimAIV2ActionExpressionMeaning ActionExpressionMeaning, const FECSEntity &inout GetterEntity, const FECSEntity &inout SenderEntity)
{
    Modify local_4;
    if (local_4.opCall())
    {
        FEcosimAIV2TargetRelationDetail local_12;
        FTargetEntity local_9 = FTargetEntity(SenderEntity);
        if ((int(local_12.TargetRelation) == 2 && (int(ActionExpressionMeaning) == 1)))
        {
            local_12.TargetRelation = EEcosimAIV2TargetRelation(3);
            FEcosimAIV2Utils::UpdateEntityToTargetDamageRelation(GetterEntity, SenderEntity);
        }
    }
    return;
}
void SendRelationChangeEvent(const FECSEntity &inout Source, const FECSEntity &inout Target, const EEcosimAIV2EntityRelation Relation, const bool bIsAdd)
{
    FFPTime local_8 = FFPTime(-1);
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FCE_EcosimAIV2RelationFactChange local_12;
    local_12.RelationFactSource = Source;
    local_12.RelationFactTarget = Target;
    local_12.Relation = Relation;
    local_12.bIsAdd = bIsAdd;
    return;
}
void AddEntityRelation(const FECSEntity &inout Source, const FECSEntity &inout Target, const EEcosimAIV2EntityRelation Relation, const bool bIsPlan)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    local_6.opCall().AddRelation(Source, Target, bIsPlan);
    return;
}
void RemoveEntityRelation(const FECSEntity &inout Source, const FECSEntity &inout Target, const EEcosimAIV2EntityRelation Relation, const bool bIsPlan)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    local_6.opCall().RemoveRelation(Source, Target, bIsPlan);
    return;
}
void RemoveEntityRelationsBySource(const FECSEntity &inout Source, const EEcosimAIV2EntityRelation Relation, const bool bIsPlan)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    local_6.opCall().RemoveRelationsBySource(Source, bIsPlan);
    return;
}
void RemoveEntityRelationsByTarget(const FECSEntity &inout Target, const EEcosimAIV2EntityRelation Relation, const bool bIsPlan)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    local_6.opCall().RemoveRelationsByTarget(Target, bIsPlan);
    return;
}
void RemoveAllEntityRelationsInvolvingEntity(const FECSEntity &inout Entity)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    local_6.opCall().RemoveAllRelationsInvolvingEntity(Entity);
    return;
}
bool HasEntityRelation(const FECSEntity &inout Source, const FECSEntity &inout Target, const EEcosimAIV2EntityRelation Relation, const EEcosimAIV2RelationType QueryType)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_EcosimAIV2RelationDB& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.HasRelation(Source, Target, EEcosimAIV2EntityRelation(Relation), EEcosimAIV2RelationType(QueryType));
    }
    return false;
}
bool HasMatchingEntityRelation(const FECSEntity &inout Source, const bool bSourceIsVar, const FECSEntity &inout Target, const bool bTargetIsVar, const EEcosimAIV2EntityRelation Relation, const EEcosimAIV2RelationType QueryType, const FECSEntity &inout ExcludeSource)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_EcosimAIV2RelationDB& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.HasMatchingRelation(Source, bSourceIsVar, Target, bTargetIsVar, EEcosimAIV2EntityRelation(Relation), EEcosimAIV2RelationType(QueryType), ExcludeSource);
    }
    return false;
}
bool HasMatchingEntityRelationPath(const FECSEntity &inout Source, const bool bSourceIsVar, const FECSEntity &inout Target, const bool bTargetIsVar, const TArray<EEcosimAIV2EntityRelation> &inout RelationPath, const EEcosimAIV2RelationType QueryType, const FECSEntity &inout ExcludeSource)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_EcosimAIV2RelationDB& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.HasRelationPath(Source, bSourceIsVar, Target, bTargetIsVar, RelationPath, EEcosimAIV2RelationType(QueryType), ExcludeSource);
    }
    return false;
}
void QueryEntityRelations(const FECSEntity &inout Source, const bool bSourceIsVar, const FECSEntity &inout Target, const bool bTargetIsVar, const EEcosimAIV2EntityRelation Relation, const EEcosimAIV2RelationType QueryType, TArray<FEcosimAIV2RelationEntry> &out OutEntries)
{
    TArray<FEcosimAIV2RelationEntry> local_4;
    OutEntries = local_4;
    OutEntries.Empty(0);
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    Get local_12;
    const FCS_EcosimAIV2RelationDB& local_14 = local_12.opCall();
    if (local_14)
    {
        local_14.QueryRelations(Source, bSourceIsVar, Target, bTargetIsVar, EEcosimAIV2EntityRelation(Relation), EEcosimAIV2RelationType(QueryType), OutEntries);
    }
    return;
}
void GetEntityRelationTargets(const FECSEntity &inout Source, const EEcosimAIV2EntityRelation Relation, const EEcosimAIV2RelationType QueryType, TArray<FECSEntity> &out OutTargets)
{
    TArray<FECSEntity> local_4;
    OutTargets = local_4;
    OutTargets.Empty(0);
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    Get local_12;
    const FCS_EcosimAIV2RelationDB& local_14 = local_12.opCall();
    if (local_14)
    {
        local_14.GetTargets(Source, EEcosimAIV2EntityRelation(Relation), EEcosimAIV2RelationType(QueryType), OutTargets);
    }
    return;
}
void GetEntityRelationSources(const FECSEntity &inout Target, const EEcosimAIV2EntityRelation Relation, const EEcosimAIV2RelationType QueryType, TArray<FECSEntity> &out OutSources)
{
    TArray<FECSEntity> local_4;
    OutSources = local_4;
    OutSources.Empty(0);
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    Get local_12;
    const FCS_EcosimAIV2RelationDB& local_14 = local_12.opCall();
    if (local_14)
    {
        local_14.GetSources(Target, EEcosimAIV2EntityRelation(Relation), EEcosimAIV2RelationType(QueryType), OutSources);
    }
    return;
}
void GetControlledTargets(const FECSEntity &inout Source, const bool bIncludePlan, TArray<FECSEntity> &out OutTargets)
{
    TArray<FECSEntity> local_4;
    OutTargets = local_4;
    OutTargets.Empty(0);
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    Get local_12;
    const FCS_EcosimAIV2RelationDB& local_14 = local_12.opCall();
    if (local_14)
    {
        local_14.GetControlledTargets(Source, bIncludePlan, OutTargets);
    }
    return;
}
void AddInteractRelation(const FECSEntity &inout Source, const FECSEntity &inout Target, const int PointIndex, const int BehaviorIndex, const bool bIsPlan)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    local_6.opCall().AddInteractRelation(Source, Target, PointIndex, BehaviorIndex, bIsPlan);
    return;
}
void RemoveInteractRelation(const FECSEntity &inout Source, const FECSEntity &inout Target, const int PointIndex, const int BehaviorIndex, const bool bIsPlan)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    local_6.opCall().RemoveInteractRelation(Source, Target, PointIndex, BehaviorIndex, bIsPlan);
    return;
}
void RemoveInteractRelationsBySource(const FECSEntity &inout Source, const bool bIsPlan)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    local_6.opCall().RemoveInteractRelationsBySource(Source, bIsPlan);
    return;
}
void RemoveAllInteractRelationsInvolvingEntity(const FECSEntity &inout Entity)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    local_6.opCall().RemoveAllInteractRelationsInvolvingEntity(Entity);
    return;
}
int CountInteractSources(const FECSEntity &inout Target, const int PointIndex, const int BehaviorIndex, const EEcosimAIV2RelationType QueryType, const FECSEntity &inout ExcludeSource)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_EcosimAIV2RelationDB& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.CountInteractSources(Target, PointIndex, BehaviorIndex, EEcosimAIV2RelationType(QueryType), ExcludeSource);
    }
    return 0;
}
}
