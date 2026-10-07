
namespace FEcologyUtils
{
void AssignScriptGlobalContext()
{
    int local_166 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    FECSWorldPtr local_2_3 = ECS::GetECSWorld();
    FCS_EcologyScriptGlobalContext local_160;
    local_160.EcologyGlobalRandom = local_166.CreateGenerator(0, FFPTime(0), 0);
    local_160.EcologyGlobalRandomSeed = int(local_160.EcologyGlobalRandom.CurrentSeed);
    return;
}
FCS_EcologyConfigContext ModifyConfigContext(const FECSWorldPtr &inout WorldPtr = ECS::ECSWorld)
{
    FCS_EcologyConfigContext __r;
    return __r;
}
FCS_EcologyScriptGlobalContext ModifyGlobalContext(const FECSWorldPtr &inout WorldPtr = ECS::ECSWorld)
{
    FCS_EcologyScriptGlobalContext __r;
    return __r;
}
FCS_EcologyDataCacheContext ModifyDataCacheContext(const FECSWorldPtr &inout WorldPtr = ECS::ECSWorld)
{
    FCS_EcologyDataCacheContext __r;
    return __r;
}
const FCS_EcologyConfigContext GetConfigContext(const FECSWorldPtr &inout WorldPtr = ECS::ECSWorld)
{
    const FCS_EcologyConfigContext __r;
    return __r;
}
const FCS_EcologyScriptGlobalContext GetGlobalContext(const FECSWorldPtr &inout WorldPtr = ECS::ECSWorld)
{
    const FCS_EcologyScriptGlobalContext __r;
    return __r;
}
const FCS_EcologyDataCacheContext GetDataCacheContext(const FECSWorldPtr &inout WorldPtr = ECS::ECSWorld)
{
    const FCS_EcologyDataCacheContext __r;
    return __r;
}
FECSEntity GetFlockEntity(const FECSEntity &inout CreatureEntity)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return FECSEntity();
    }
    return FECSEntity(CreatureEntity.GetWorld(), local_6.FlockProxyEntity);
}
FECSEntity GetFlockSpawnerConfigEntity(const FECSEntity &inout FlockEntity)
{
    Get local_4;
    const FC_EcologyFlockComponent& local_6 = local_4.opCall();
    if (local_6)
    {
        if (FECSEntity(local_6.SpawnerDataRef.SpawnerEntity))
        {
            Get local_20;
            const FC_EcologyConfigReference& local_22 = local_20.opCall();
            if (local_22)
            {
                return FECSEntity(FlockEntity.GetWorld(), local_22.ConfigRef);
            }
        }
    }
    return FECSEntity();
}
TSet<FDataObjectPtr> FindAllCareResourceType(const TDataObjectPtr<FEcologyCreatureDefinitionRow> &inout Creature)
{
    int local_1 = true;
    FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"FindAllCareResourceType"), false);
    TSet<FDataObjectPtr> local_26;
    TDataObjectIterator<FEcologyActivityDefinitionRow> local_42;
    for (; local_42; )
    {
        TDataObjectPtr<FEcologyCreatureDefinitionRow> local_66;
        local_66 = local_42.GetData().GetCreature();
        FDataObjectPtr local_114 = Creature.opImplConv();
        if ((local_66 == local_114))
        {
            local_114;
            local_26.Add(local_114);
        }
        local_42.Next();
    }
    return local_26;
}
TArray<TObjectPtr<UEcologyBehaviorDefine>> FindAllBehaviorByResource(const TDataObjectPtr<FEcologyCreatureDefinitionRow> &inout Creature, const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout Resource)
{
    bool local_2 = true;
    int local_1 = local_2;
    FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"FindAllBehaviorByResource"), false);
    TArray<TObjectPtr<UEcologyBehaviorDefine>> local_10;
    TDataObjectIterator<FEcologyActivityDefinitionRow> local_26;
    for (; local_26; )
    {
        TDataObjectPtr<FEcologyCreatureDefinitionRow> local_50;
        local_50 = local_26.GetData().GetCreature();
        bool local_2_2 = (local_50 == Creature.opImplConv());
        if (!(local_2_2))
        {
            local_2_2 = false;
        }
        else
        {
            TDataObjectPtr<FEcologyResourceDefinitionRow> local_122;
            local_122 = local_26.GetData().GetResource();
            local_2_2 = (local_122 == Resource.opImplConv());
        }
        if (local_2_2)
        {
            local_10.Add(local_26.GetData().BehaviorDefine);
        }
        local_26.Next();
    }
    return local_10;
}
TArray<TObjectPtr<UEcologyBehaviorDefine>> FindAllBehaviorByResourceOverSlot(const TDataObjectPtr<FEcologyCreatureDefinitionRow> &inout Creature, const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout Resource)
{
    bool local_99;
    bool local_101;
    int local_1 = true;
    FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"FindAllBehaviorByResourceOverSlot"), false);
    TArray<TObjectPtr<UEcologyBehaviorDefine>> local_10;
    TDataObjectIterator<FEcologyActivityDefinitionRow> local_26;
    for (; local_26; )
    {
        TDataObjectPtr<FEcologyCreatureDefinitionRow> local_50;
        local_50 = local_26.GetData().GetCreature();
        if (!((local_50 == Creature.opImplConv())))
        {
            local_99 = false;
        }
        else
        {
            bool local_100 = !(true);
            if (!(local_26.GetData().bCanUseWithoutSlot) == local_100)
            {
                local_101 = true;
            }
            else
            {
                local_100 = !(local_26.GetData().bIsDefaultBehavior);
                local_100 = (local_100 == !(true));
                local_101 = local_100;
            }
            local_99 = local_101;
        }
        if (local_99)
        {
            local_10.Add(local_26.GetData().BehaviorDefine);
        }
        local_26.Next();
    }
    return local_10;
}
TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> FindAllActivityByResource(const TDataObjectPtr<FEcologyCreatureDefinitionRow> &inout Creature, const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout Resource, const bool bIncludeOverSlot, const bool bIncludeUseSlot)
{
    bool local_2 = true;
    int local_1 = local_2;
    FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"FindAllBehaviorByResource"), false);
    TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> local_10;
    TDataObjectIterator<FEcologyActivityDefinitionRow> local_26;
    for (; local_26; )
    {
        const FEcologyActivityDefinitionRow& local_28 = local_26.GetData();
        TDataObjectPtr<FEcologyCreatureDefinitionRow> local_52;
        local_52 = local_28.GetCreature();
        if (!((local_52 == Creature.opImplConv())))
        {
        }
        else
        {
            if (!(FEcologyBehaviorUtils::IsActivityUseableForResource(local_28, Resource)))
            {
            }
            else
            {
                bool local_2_2 = FEcologyBehaviorUtils::IsActivityEnableOverSlot(local_28);
                if ((!(bIncludeOverSlot) && local_2_2))
                {
                }
                else
                {
                    if ((!(bIncludeUseSlot) && !(local_2_2)))
                    {
                    }
                    else
                    {
                        local_10.Add(TDataObjectPtr<FEcologyActivityDefinitionRow>());
                    }
                }
            }
        }
        local_26.Next();
    }
    return local_10;
}
TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> FindAllActivityCanOverResource(const TDataObjectPtr<FEcologyCreatureDefinitionRow> &inout Creature)
{
    bool local_2 = true;
    int local_1 = local_2;
    FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"FindAllBehaviorByResource"), false);
    TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> local_10;
    TDataObjectIterator<FEcologyActivityDefinitionRow> local_26;
    for (; local_26; )
    {
        const FEcologyActivityDefinitionRow& local_28 = local_26.GetData();
        TDataObjectPtr<FEcologyCreatureDefinitionRow> local_52;
        local_52 = local_28.GetCreature();
        if (!((local_52 == Creature.opImplConv())))
        {
        }
        else
        {
            bool local_2_2 = FEcologyBehaviorUtils::IsActivityEnableOverSlot(local_28);
            if (!(local_2_2))
            {
            }
            else
            {
                local_10.Add(TDataObjectPtr<FEcologyActivityDefinitionRow>());
            }
        }
        local_26.Next();
    }
    return local_10;
}
void TryUpdateOverResourceActivityArray(const FECSEntity &inout Entity, const bool bForceUpdate = false)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_CreatureEcologyState& local_8 = local_6.opCall();
    if (local_8)
    {
        FCreatureActivityData local_10 = local_8.ActivityData;
        if ((local_10.bHasInitOverResourceActivityArray && !(bForceUpdate)))
        {
            return;
        }
        if (!(local_8.Creature))
        {
            return;
        }
        local_10.OverResourceActivityArray = FEcologyUtils::FindAllActivityCanOverResource(local_8.Creature);
        local_10.bHasInitOverResourceActivityArray = true;
    }
    return;
}
void TeleportEcologyCreatureToTransform(const FECSEntity &inout Entity, const FVector &inout TargetLocation, const FRotator &inout TargetRotation, const bool KeepESM = false)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<FECSEntity> SearchPlayerByRadiusAndHalfHeight(const FECSEntity &inout CenterEntity, const float32 Radius, const float32 HalfHeight)
{
    Get local_10;
    TArray<FECSEntity> local_4;
    int local_148 = 0;
    if (!(CenterEntity.IsValid()))
    {
        return local_4;
    }
    if (!(local_10.opCall()))
    {
        return local_4;
    }
    FECSRuntimeQuery local_52 = FECSRuntimeQueryHelper::RuntimeQueryInCylinder(CenterEntity, local_10.opCall().GetPosition(), Radius, HalfHeight, true, EECSQueryRegsitryType(3), false);
    Include local_96;
    local_96.opCall();
    FECSRuntimeQueryIterator local_118 = local_52.Iterator();
    for (; local_118.CanProceed;)
    {
        local_118.Proceed();
        local_4.AddUnique(local_148.GetPlayerEntity());
    }
    return local_4;
}
bool CheckCurrentActivityValid(const FECSEntity &inout Entity, const FECSEntity &inout Resource, const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout CurrentActivity)
{
    Get local_4;
    const FC_Transform& local_6 = local_4.opCall();
    if (local_6)
    {
        return FEcologyConditionUtils::CheckCreatureCanDoActivity(Entity, CurrentActivity, FEcologyConditionWorldContext(local_6.GetPosition(), ECS::GetECSWorld(), FEcologyUtils::GetGlobalContext(ECS::GetECSWorld())));
    }
    return false;
}
bool CheckNeedChangeToSpecialFeatureActivity(const FECSEntity &inout Entity, const FECSEntity &inout Resource, const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout CurrentActivity)
{
    int local_16 = 0;
    TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> local_20;
    int local_26 = 0;
    TArray<FEcologyResourceSlotData> local_106;
    int local_1 = true;
    FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"CheckNeedChangeToSpecialFeatureActivity"), false);
    Has local_10;
    if (!(local_10.opCall()))
    {
        return false;
    }
    if (!(HasEcologyGameplayTag(Resource, FEcologyGameplayTagDefine::Ecology_ResourceHasHighPrioritySlot)))
    {
        return false;
    }
    if (!(local_16))
    {
        return false;
    }
    if (!((local_16.ActivityData.PreferActivityList.Num() > 0)))
    {
        return false;
    }
    if (!(local_26))
    {
        return false;
    }
    FEcologyConditionWorldContext local_56 = FEcologyConditionWorldContext(local_26.GetPosition(), ECS::GetECSWorld(), FEcologyUtils::GetGlobalContext(ECS::GetECSWorld()));
    bool local_61 = false;
    for (auto& local_76 : local_20)
    {
        if ((CurrentActivity == local_76.opImplConv()))
        {
            return false;
        }
        if (FEcologyConditionUtils::CheckCreatureCanDoActivity(Entity, local_76, local_56))
        {
            local_61 = true;
            break;
        }
    }
    if (local_61)
    {
        for (auto& local_76 : local_20)
        {
            for (auto& local_120 : local_106)
            {
                if (local_120.ActivityGameplayTag.MatchesTag(unresolved.GameplayTagForResourceSlot))
                {
                    return true;
                }
            }
        }
    }
    return false;
}
}
