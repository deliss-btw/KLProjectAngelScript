
enum EActivityInvalidReason
{
    Valid,
    Unknow,
    ActivityDefNotPass,
    ResourceNotPass,
    CreatureNotPass,
    SlotNotPass,
    ActivityConditionNotPass,
}

namespace FEcologyBehaviorUtils
{
bool IsActivityEnableOverSlot(const FEcologyActivityDefinitionRow &inout ActivityDefinition)
{
    bool local_3;
    bool local_2 = !(true);
    if (!(ActivityDefinition.bCanUseWithoutSlot) == local_2)
    {
        local_3 = true;
    }
    else
    {
        local_3 = (!(ActivityDefinition.bIsDefaultBehavior) == !(true));
    }
    return local_3;
}
bool IsActivityUseableForCreature(const FEcologyActivityDefinitionRow &inout ActivityDefinition, const TDataObjectPtr<FEcologyCreatureDefinitionRow> &inout Creature)
{
    bool local_1 = !(ActivityDefinition.GetCreature());
    if (local_1)
    {
        local_1 = true;
    }
    else
    {
        TDataObjectPtr<FEcologyCreatureDefinitionRow> local_26;
        local_26 = ActivityDefinition.GetCreature();
        local_1 = (local_26 == Creature.opImplConv());
    }
    if (local_1)
    {
        return true;
    }
    return false;
}
bool IsActivityUseableForResource(const FEcologyActivityDefinitionRow &inout ActivityDefinition, const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout Resource)
{
    if (ActivityDefinition.bIsDefaultBehavior)
    {
        return true;
    }
    bool local_1 = !(ActivityDefinition.GetResource());
    if (local_1)
    {
        local_1 = true;
    }
    else
    {
        TDataObjectPtr<FEcologyResourceDefinitionRow> local_26;
        local_26 = ActivityDefinition.GetResource();
        local_1 = (local_26 == Resource.opImplConv());
    }
    if (local_1)
    {
        return true;
    }
    return false;
}
bool IsActivitySuitableForSlot(const FEcologyActivityDefinitionRow &inout ActivityData, const TConstRawPtr<FEcologyResourceSlotData> &inout SlotData, const bool bEnableDefault = false)
{
    if (!(SlotData))
    {
        return (ActivityData.bCanUseWithoutSlot || ActivityData.bIsDefaultBehavior);
    }
    return FEcologyBehaviorUtils::IsActivitySuitableForSlot(ActivityData, bEnableDefault);
}
bool IsActivitySuitableForSlot(const FEcologyActivityDefinitionRow &inout ActivityData, const FEcologyResourceSlotData &inout SlotData, const bool bEnableDefault = false)
{
    return (!(SlotData.ActivityGameplayTag.IsValid()) || ActivityData.GameplayTagForResourceSlot.MatchesTag(SlotData.ActivityGameplayTag) || (bEnableDefault && ActivityData.bIsDefaultBehavior));
}
EActivityInvalidReason IsActivityIsSuitForCurrentState(const FECSEntity &inout CreatureEntity, const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout ActivityDef)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    EActivityInvalidReason __r; return __r;
}
bool NormalizeCreatureActivityData(const FECSEntity &inout CreatureEntity)
{
    FC_CreatureEcologyState local_6;
    if (!(local_6))
    {
        return false;
    }
    FCreatureActivityData local_10 = local_6.ActivityData;
    if (local_10.ActivityRowData.IsSet())
    {
    }
    else
    {
    }
    TDataObjectPtr<FEcologyActivityDefinitionRow> local_88;
    TDataObjectPtr<FEcologyActivityDefinitionRow> local_64 = local_88;
    if ((local_64 && (int(FEcologyBehaviorUtils::IsActivityIsSuitForCurrentState(CreatureEntity, local_64)) == 0)))
    {
        local_10.SetActivity(local_64);
        return true;
    }
    return FEcologyBehaviorUtils::ReSetActivity(CreatureEntity, local_6);
}
bool ReSetActivity(const FECSEntity &inout CreatureEntity, FC_CreatureEcologyState &inout StateComp)
{
    int local_16 = 0;
    int local_30 = 0;
    int local_38 = 0;
    int local_62 = 0;
    const FEcologyActivityDefinitionRow& local_126;
    if (!(StateComp))
    {
        XError(ELog(30), FString().Append("ReSetActivityBehvaior: StateComp is invalid. CreatureId: ").Append(CreatureEntity.GetIdValue()));
        return false;
    }
    FCreatureActivityData local_10 = StateComp.ActivityData;
    if (!(local_16))
    {
        XError(ELog(30), FString().Append("ReSetActivityBehvaior: CreatureMeta is invalid. CreatureId: ").Append(CreatureEntity.GetIdValue()));
        return false;
    }
    if (!(FECSEntity(local_10.RuntimeSlotData.TargetResourceId)))
    {
        XError(ELog(30), FString().Append("ReSetActivityBehvaior: TargetResource is invalid. CreatureId: ").Append(CreatureEntity.GetIdValue()).Append(", TargetResourceId: ").Append(local_10.RuntimeSlotData.TargetResourceId.GetIdValue()));
        return false;
    }
    if ((!(local_30) || !(local_30.ResourceType)))
    {
        XError(ELog(30), FString().Append("ReSetActivityBehvaior: ResourceMeta is invalid or ResourceType is null. CreatureId: ").Append(CreatureEntity.GetIdValue()).Append(", TargetResourceId: ").Append(local_10.RuntimeSlotData.TargetResourceId));
        return false;
    }
    if (local_10.RuntimeSlotData.HasSlotConfig() && !(local_38))
    {
        XError(ELog(30), FString().Append("ReSetActivityBehvaior: SlotData is invalid but HasSlotConfig is true. CreatureId: ").Append(CreatureEntity.GetIdValue()).Append(", TargetResourceId: ").Append(local_10.RuntimeSlotData.TargetResourceId).Append(", SlotIndex: ").Append(local_10.RuntimeSlotData.SlotIndex));
        return false;
    }
    TConstRawPtr<FEcologyResourceSlotData> local_40;
    bool local_1 = local_10.RuntimeSlotData.HasSlotConfig() && (local_38.SlotData.Num() <= local_10.RuntimeSlotData.SlotIndex);
    if (local_1)
    {
        return false;
    }
    local_40 = local_38.GetSlotData(local_10.RuntimeSlotData.SlotIndex);
    ++local_10.GenBehaviorCount;
    TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> local_50 = FEcologyUtils::FindAllActivityByResource(local_16.CreatureType, local_30.ResourceType, true, local_10.RuntimeSlotData.HasSlotConfig());
    int local_7 = CreatureEntity.GetIdValue();
    int local_42_2 = FMath::Abs((local_7 + int(local_10.GenBehaviorCount))) % 1000;
    FEcologyConditionWorldContext local_92 = FEcologyConditionWorldContext(local_62.GetPosition(), ECS::GetECSWorld(), FEcologyUtils::GetGlobalContext(ECS::GetECSWorld()));
    TDataObjectPtr<FEcologyActivityDefinitionRow> local_120;
    int local_121 = 0;
    for (; local_121 < local_50.Num(); ++local_121)
    {
        int local_55 = (local_42_2 + local_121) % local_50.Num();
        TDataObjectPtr<FEcologyActivityDefinitionRow>& local_124 = local_50[local_55];
        if (!(local_120.IsSet()))
        {
            local_1 = false;
        }
        else
        {
            local_1 = local_126.bIsDefaultBehavior;
        }
        if (local_1)
        {
            continue;
        }
        if (!(FEcologyBehaviorUtils::IsActivitySuitableForSlot(local_126, local_40, false)))
        {
            continue;
        }
        if (!(FEcologyConditionUtils::CheckCreatureCanDoActivity(CreatureEntity, TDataObjectPtr<FEcologyActivityDefinitionRow>(), local_92)))
        {
            continue;
        }
        local_120 = TDataObjectPtr<FEcologyActivityDefinitionRow>();
        if (!(local_126.bIsDefaultBehavior))
        {
            break;
        }
    }
    local_10.SetActivity(local_120);
    return local_120.IsSet();
}
void NotifyActivityInfoChanged(const FECSEntity &inout CreatureEntity)
{
    int local_6 = 0;
    int local_22 = 0;
    FRuntimeSlotData local_26;
    bool local_30;
    FECSEntity::ModifyOrAdd<FC_CreatureEcologyState> local_4 = FECSEntity::ModifyOrAdd<FC_CreatureEcologyState>(CreatureEntity);
    if (!(FEcologyUtils::GetFlockEntity(CreatureEntity).IsValid()))
    {
        return;
    }
    if (!(local_22))
    {
        return;
    }
    FECSEntityId local_23 = CreatureEntity.GetId();
    if (local_26.WaitReallocated())
    {
        local_6.ActivityData.bForceResetBehavior = true;
    }
    else
    {
        if ((!((local_26.TargetResourceId == local_6.ActivityData.RuntimeSlotData.TargetResourceId))))
        {
            local_6.ActivityData.bForceResetBehavior = true;
        }
        else
        {
            bool local_15 = !(local_26.bHasSlotConfig);
            bool local_27 = !(true);
            local_15 = local_15 == local_27 && (int(local_26.SlotIndex) != local_6.ActivityData.RuntimeSlotData.SlotIndex);
            if (local_15)
            {
                local_27 = true;
                local_6.ActivityData.bForceResetBehavior = local_27;
            }
            else
            {
                local_27 = !(false);
                if (!(local_26.bHasSlotConfig) != local_27)
                {
                    local_30 = false;
                }
                else
                {
                    local_27 = !(local_6.ActivityData.RuntimeSlotData.bHasSlotConfig);
                    local_27 = (local_27 == !(true));
                    local_30 = local_27;
                }
                if (local_30)
                {
                    local_6.ActivityData.bForceResetBehavior = true;
                }
            }
        }
    }
    local_6.ActivityData.StartTime = ECS::GetContextTime();
    local_6.ActivityData.GenBehaviorCount = 0;
    local_6.ActivityData.bNeedDoDefaultBehavior = false;
    local_6.ActivityData.ActivityRowData = TDataObjectPtr<FEcologyActivityDefinitionRow>();
    FEcologyBehaviorUtils::ModifyCreatureNeedDoDefaultBehavior(CreatureEntity, false);
    FEcologyBehaviorUtils::ModifyCreatureNeedReAllocateState(CreatureEntity, false);
    return;
}
bool ResourcePathConnectedCheck(const FECSEntity &inout MainEntity, const FECSEntityId &inout CurResourceId, const FECSEntityId &inout TargetResourceId)
{
    Get local_30;
    FECSEntity local_8 = FECSEntity(CurResourceId);
    FECSEntity local_4 = FECSEntity(TargetResourceId);
    if (!(MainEntity.IsValid()))
    {
        return false;
    }
    FVector local_20;
    FVector local_26;
    if (!(local_30.opCall()))
    {
        return false;
    }
    local_26 = local_30.opCall().GetPosition();
    if (!(local_30.opCall()))
    {
        if (local_30.opCall())
        {
            local_20 = local_30.opCall().GetPosition();
        }
        else
        {
            return false;
        }
    }
    else
    {
        local_20 = local_30.opCall().GetPosition();
    }
    bool local_13 = FAIPathSessionUtils::IsPathConnectedForEntity(MainEntity, local_20, local_26);
    if (!(local_13))
    {
        XLog(ELog(30), FString().Append("[PathConnectedCheck] Failed, MainEntity: ").Append(MainEntity).Append(", From:").Append(local_20).Append(", To:").Append(local_26));
    }
    return local_13;
}
void SyncFlockBehaviorState(const FECSEntity &inout CreatureEntity)
{
    FC_EcologyFlockBehaviorComponent local_22;
    if (!(FEcologyUtils::GetFlockEntity(CreatureEntity).IsValid()))
    {
        return;
    }
    if (!(local_22))
    {
        return;
    }
    if (int(local_22.MainState) == 1)
    {
        FEcologyBehaviorUtils::NotifyActivityInfoChanged(CreatureEntity);
    }
    return;
}
void UpdateCreatureMoveStanceByBehavior(const FECSEntity &inout CreatureEntity)
{
    bool local_1 = false;
    if (local_1)
    {
    }
    ECS::GetContextTime();
    return;
}
void NotifyAllChildActivityInfoChanged(const FECSEntity &inout FlockEntity)
{
    int local_6;
    for (auto& local_22 : local_6.CreatureEntities)
    {
        FEcologyBehaviorUtils::NotifyActivityInfoChanged(FECSEntity(local_22));
    }
    return;
}
void NotifyAllSyncFlockState(const FECSEntity &inout FlockEntity)
{
    int local_6;
    for (auto& local_22 : local_6.CreatureEntities)
    {
        FEcologyBehaviorUtils::SyncFlockBehaviorState(FECSEntity(local_22));
    }
    return;
}
UEcologyBehaviorDefine GetCreatureCurrentBehaviorDefine(const FECSEntity &inout CreatureEntity)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return nullptr;
    }
    return local_6.ActivityData.BehaviorDefine;
}
void AllocateChildSlotData(const FECSEntity &inout FlockEntity, const bool bNeedResetOffset = false, const float32 ModCountRatio = 1.0f)
{
    int local_8 = 0;
    int local_14 = 0;
    if (!(FlockEntity))
    {
        return;
    }
    if (int(local_14.SlotAllocator.AllocatorType) == 0)
    {
        FEcologyBehaviorUtils::AllocateChildSlotData_SimpleFlock(FlockEntity, local_8, local_14, bNeedResetOffset, ModCountRatio);
        return;
    }
    FEcologyBehaviorUtils::AllocateChildSlotData_PerCreature(FlockEntity, local_8, local_14, bNeedResetOffset, ModCountRatio);
    return;
}
void AllocateChildSlotData_SimpleFlock(const FECSEntity &inout FlockEntity, const FC_EcologyFlockComponent &inout FlockComponent, FC_EcologyFlockBehaviorComponent &inout BehaviorComponent, const bool bNeedResetOffset = false, const float32 ModCountRatio = 1.0f)
{
    int local_18 = 0;
    int local_24 = 0;
    int local_30 = 0;
    int local_84 = 0;
    const FEcologyActivityDefinitionRow& local_128;
    FECSEntityId local_1 = FlockComponent.ActivityTarget.MainTargetResource;
    FECSEntity local_6 = FECSEntity(local_1);
    if (!(local_6))
    {
        return;
    }
    FEcologyConditionWorldContext local_60 = FEcologyConditionWorldContext(local_30.GetPosition(), ECS::GetECSWorld(), FEcologyUtils::GetGlobalContext(ECS::GetECSWorld()));
    FEcologyBehaviorUtils::ClearBehaviorAllocatorData(FlockEntity, BehaviorComponent, local_6);
    bool local_11 = !((BehaviorComponent.SlotAllocator.TargetResource == local_1));
    BehaviorComponent.SlotAllocator.LastAllocateTime = ECS::GetECSWorld().GetFixedTime().Time;
    if (local_11)
    {
        BehaviorComponent.SlotAllocator.TargetResource = local_1;
    }
    if (bNeedResetOffset || local_11)
    {
        BehaviorComponent.SlotAllocator.BaseSlotOffset = FASCommonUtils::CreateRandomGenerator(FlockEntity, 0).NextRangeInt(0, 1000);
    }
    int local_73 = BehaviorComponent.SlotAllocator.BaseSlotOffset;
    int local_74 = 0;
    if (local_24)
    {
        local_74 = local_24.SlotData.Num();
    }
    bool local_75 = false;
    float32 local_76 = 1.0f;
    if (local_84)
    {
        local_75 = local_75 || local_84.Match(FEcologyGameplayTagDefine::Ecology_ResourceHasHighPrioritySlot);
    }
    if (!(local_75))
    {
        local_76 = ModCountRatio;
    }
    int local_71 = FlockComponent.CreatureEntities.Num();
    int local_72_2 = FMath::Max(local_71, uint((local_74 * local_76)));
    TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> local_92 = FEcologyUtils::FindAllActivityByResource(FlockComponent.FlockMainCreature, local_18.ResourceType, true, true);
    if (local_92.Num() <= 0)
    {
        XError(ELog(30), "Without Useable Any Behavior");
        return;
    }
    TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> local_96 = FEcologyUtils::FindAllActivityByResource(FlockComponent.FlockMainCreature, local_18.ResourceType, true, false);
    if (local_96.Num() <= 0)
    {
        XError(ELog(30), "Without Useable Default Behavior");
        return;
    }
    FRandomGenerator local_69 = FASCommonUtils::CreateRandomGenerator(FECSEntity(FlockEntity), 0);
    int local_103 = 0;
    for (; local_103 < local_71; ++local_103)
    {
        int local_86 = local_73 + local_103;
        int local_70 = local_86 % local_72_2;
        FRuntimeSlotData& local_106 = BehaviorComponent.SlotAllocator.SlotAllocMap.FindOrAdd(FlockComponent.CreatureEntities[local_103]);
        FECSEntity local_10 = FECSEntity(FlockComponent.CreatureEntities[local_103]);
        local_106.SlotIndex = local_70;
        local_106.TargetResourceId = local_1;
        if (local_70 < local_74)
        {
            FEcologyResourceSlotData& local_112 = local_24.SlotData[local_70];
            if (GameplayTag::IsGameplayTagValid(local_112.ActivityGameplayTag))
            {
                auto local_118 = local_92.Iterator();
                for (; local_118.CanProceed;)
                {
                    TDataObjectPtr<FEcologyActivityDefinitionRow>& local_126 = local_118.Proceed();
                    if (FEcologyBehaviorUtils::IsActivitySuitableForSlot(local_128, local_112, false) && FEcologyConditionUtils::CheckCreatureCanDoActivity(local_10, TDataObjectPtr<FEcologyActivityDefinitionRow>(local_128), local_60))
                    {
                        local_106.BehaviorRef = TDataObjectPtr<FEcologyActivityDefinitionRow>();
                    }
                }
            }
            if (local_106.BehaviorRef)
            {
                local_106.bRandomPosition = false;
                local_106.bHasSlotConfig = true;
                local_106.TargetPosition = (FVector(local_30.GetPosition()) + local_112.Position);
                local_106.TargetLookAt = (FVector(local_30.GetPosition()) + local_112.LookAt);
                local_24.SetClaimEntity(local_70, local_10.GetId());
            }
        }
        if (!(local_106.BehaviorRef))
        {
            local_106.bRandomPosition = true;
            local_106.bHasSlotConfig = false;
            local_106.TargetPosition = local_30.GetPosition();
        }
        if (!(local_106.BehaviorRef.IsSet()) && (local_96.Num() > 0))
        {
            local_86 = local_96.Num();
            int local_191 = local_69.NextRangeInt(0, (local_96.Num() - 1));
            int local_192 = 0;
            for (; local_192 < local_96.Num(); ++local_192)
            {
                TDataObjectPtr<FEcologyActivityDefinitionRow>& local_126_2 = local_96[(local_191 + local_192) % local_86];
                if (FEcologyConditionUtils::CheckCreatureCanDoActivity(local_10, local_126_2, local_60))
                {
                    local_106.BehaviorRef = local_126_2;
                    break;
                }
            }
        }
    }
    FEcologyBehaviorUtils::NotifyAllChildActivityInfoChanged(FlockEntity);
    return;
}
void AllocateChildSlotData_PerCreature(const FECSEntity &inout FlockEntity, const FC_EcologyFlockComponent &inout FlockComponent, FC_EcologyFlockBehaviorComponent &inout BehaviorComponent, const bool bNeedResetOffset = false, const float32 ModCountRatio = 1.0f)
{
    int local_24 = 0;
    int local_30 = 0;
    int local_82 = 0;
    FECSEntityId local_1 = FlockComponent.ActivityTarget.MainTargetResource;
    FECSEntity local_6 = FECSEntity(local_1);
    if (!(local_6))
    {
        return;
    }
    FEcologyConditionWorldContext local_60 = FEcologyConditionWorldContext(local_30.GetPosition(), ECS::GetECSWorld(), FEcologyUtils::GetGlobalContext(ECS::GetECSWorld()));
    FEcologyBehaviorUtils::ClearBehaviorAllocatorData(FlockEntity, BehaviorComponent, local_6);
    bool local_11 = !((BehaviorComponent.SlotAllocator.TargetResource == local_1));
    FResourceSlotAllocator local_66;
    local_66.LastAllocateTime = ECS::GetECSWorld().GetFixedTime().Time;
    if (local_11)
    {
        local_66.TargetResource = local_1;
    }
    if (bNeedResetOffset || local_11)
    {
        local_66.BaseSlotOffset = FASCommonUtils::CreateRandomGenerator(FlockEntity, 0).NextRangeInt(0, 100);
    }
    bool local_75 = false;
    if (local_82)
    {
        local_75 = local_75 || local_82.Match(FEcologyGameplayTagDefine::Ecology_ResourceHasHighPrioritySlot);
    }
    if (local_66.bLazyAllocate)
    {
        for (auto& local_98 : FlockComponent.CreatureEntities)
        {
            FRuntimeSlotData& local_100 = local_66.SlotAllocMap.FindOrAdd(local_98);
            local_100.TargetResourceId = local_1;
            local_100.TargetPosition = local_30.GetPosition();
            local_100.bWaitDelayReallocated = true;
        }
        FEcologyBehaviorUtils::NotifyAllChildActivityInfoChanged(FlockEntity);
        return;
    }
    for (auto& local_98 : FlockComponent.CreatureEntities)
    {
        FECSEntity local_10 = FECSEntity(local_98);
        FRuntimeSlotData local_144;
        if (FEcologyBehaviorUtils::TryAllocateChildSlotDataForCreature(FlockEntity, local_10, TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>>(), local_144, true, false, 0.8f, false, true))
        {
            FRuntimeSlotData& local_100_2 = local_66.SlotAllocMap.FindOrAdd(local_98);
            if (local_100_2.HasSlotConfig())
            {
                local_24.SetClaimEntity(int(local_144.SlotIndex), local_98);
            }
        }
    }
    return;
}
bool ReAllocateSingleCreatureRequestByBTree(const FECSEntity &inout FlockEntity, const FECSEntity &inout CreatureEntity)
{
    int local_8 = 0;
    int local_14 = 0;
    int local_32 = 0;
    if (!(FlockEntity.IsValid()) || !(CreatureEntity.IsValid()))
    {
        return false;
    }
    if (!(local_8))
    {
        return false;
    }
    if (!(local_14))
    {
        return false;
    }
    bool local_17 = false;
    if (!(FECSEntity(FECSEntityId(local_14.ActivityTarget.MainTargetResource))))
    {
        return false;
    }
    if (local_32)
    {
        local_17 = local_17 || local_32.Match(FEcologyGameplayTagDefine::Ecology_ResourceHasHighPrioritySlot);
    }
    TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> local_16;
    return FEcologyBehaviorUtils::ReAllocateChildSlotDataForCreature(FlockEntity, CreatureEntity, local_16, local_17, false, 1.0f, false, true);
}
bool ReAllocateChildSlotDataForCreature(const FECSEntity &inout FlockEntity, const FECSEntity &inout Creature, const TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> &inout PreferActivityList, const bool bPreferUseSlot = false, const bool bOnlyPreferActivity = false, const float32 SlotPercent = 0.8f, const bool bIgnoreClaim = false, const bool bAllocateDefaultActivity = true)
{
    FC_EcologyFlockBehaviorComponent local_6;
    int local_30 = 0;
    if (!(FECSEntity(0.GetMainTargetResource())) || !(local_6))
    {
        return false;
    }
    FECSEntityId local_39 = FECSEntityId(Creature.GetId());
    FRuntimeSlotData local_80;
    bool local_23 = FEcologyBehaviorUtils::TryAllocateChildSlotDataForCreature(FlockEntity, Creature, PreferActivityList, local_80, bPreferUseSlot, bOnlyPreferActivity, SlotPercent, bIgnoreClaim, bAllocateDefaultActivity);
    if (local_23)
    {
        FEcologyBehaviorUtils::SetCreatureSlotData(Creature, local_6.SlotAllocator, local_30, local_80);
    }
    return local_23;
}
void SetCreatureSlotData(const FECSEntity &inout Creature, FResourceSlotAllocator &inout SlotAllocator, FC_EcologyResourceSlot &inout TargetResourceSlotData, FRuntimeSlotData &inout NewRuntimSlotData)
{
    FECSEntityId local_1 = FECSEntityId(Creature.GetId());
    FRuntimeSlotData& local_4 = SlotAllocator.SlotAllocMap.FindOrAdd(local_1);
    if (local_4.HasSlotConfig())
    {
        TargetResourceSlotData.RemoveClaim(int(local_4.SlotIndex), local_1, false);
    }
    if (local_4.HasSlotConfig())
    {
        TargetResourceSlotData.SetClaimEntity(int(local_4.SlotIndex), local_1);
    }
    FEcologyBehaviorUtils::NotifyActivityInfoChanged(Creature);
    return;
}
TDataObjectPtr<FEcologyActivityDefinitionRow> FindFirstUseableActivityForSlot(const FECSEntity &inout Creature, const FEcologyResourceSlotData &inout SlotData, const TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> &inout ActivityList, const FEcologyConditionWorldContext &inout WorldContext, const int OffsetIndex = 0, const bool bCheckActivityCondition = true)
{
    const FEcologyActivityDefinitionRow& local_82;
    if (ActivityList.Num() <= 0)
    {
        return TDataObjectPtr<FEcologyActivityDefinitionRow>();
    }
    int local_53 = 0;
    for (; local_53 < ActivityList.Num(); ++local_53)
    {
        int local_2 = (local_53 + OffsetIndex) % ActivityList.Num();
        TDataObjectPtr<FEcologyActivityDefinitionRow> local_80 = ActivityList[local_2];
        if (!(local_80))
        {
            continue;
        }
        if (!(FEcologyBehaviorUtils::IsActivitySuitableForSlot(local_82, SlotData, false)))
        {
            continue;
        }
        if (bCheckActivityCondition && !(FEcologyConditionUtils::CheckCreatureCanDoActivity(Creature, local_80, WorldContext)))
        {
            continue;
        }
        return local_80;
    }
    return TDataObjectPtr<FEcologyActivityDefinitionRow>();
}
bool TryAllocateChildSlotDataForCreature(const FECSEntity &inout FlockEntity, const FECSEntity &inout Creature, const TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> &inout PreferActivityList, FRuntimeSlotData &inout OutResult, const bool bPreferUseSlot = false, const bool bOnlyPreferActivity = false, const float32 SlotPercent = 0.8f, const bool bIgnoreClaim = false, const bool bAllocateDefaultActivity = true)
{
    int local_12 = 0;
    int local_42 = 0;
    int local_54 = 0;
    int local_62 = 0;
    int local_68 = 0;
    const FEcologyActivityDefinitionRow& local_118;
    bool local_2 = true;
    int local_1 = local_2;
    FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"TryAllocateChildSlotDataForCreature"), false);
    FC_EcologyFlockBehaviorComponent local_18;
    FResourceSlotAllocator local_20 = local_18.SlotAllocator;
    FECSEntityId local_21 = FECSEntityId(local_12.ActivityTarget.MainTargetResource);
    FECSEntity local_26 = FECSEntity(local_21);
    int local_4 = int(local_20.BaseSlotOffset);
    int local_32 = Creature.GetIdValue();
    local_4 = local_4 + local_32;
    local_4 = local_4 + int(ECS::GetECSWorld().GetFixedTime().Frame);
    local_4 = FMath::Abs(local_4) % 1000;
    if (!(local_26))
    {
        return false;
    }
    if (!(local_42))
    {
        XError(ELog(30), FString().Append("TryAllocateChildSlotDataForCreature: CreatureMeta is invalid. CreatureId: ").Append(Creature.GetIdValue()));
        return false;
    }
    if (!(local_54))
    {
        XLog(ELog(30), FString().Append("TryAllocateChildSlotDataForCreature: TargetResourceMeta is invalid. FlockEntityId: ").Append(FlockEntity.GetIdValue()).Append(" CreatureId: ").Append(Creature.GetIdValue()).Append(" TargetResourceId: ").Append(local_21));
        return false;
    }
    FEcologyConditionWorldContext local_98 = FEcologyConditionWorldContext(local_68.GetPosition(), ECS::GetECSWorld(), FEcologyUtils::GetGlobalContext(ECS::GetECSWorld()));
    int local_36 = local_62 ? local_62.SlotData.Num() : 0;
    OutResult.TargetResourceId = local_21;
    OutResult.TargetPosition = local_68.GetPosition();
    if (PreferActivityList.Num() > 0)
    {
        auto local_108 = PreferActivityList.Iterator();
        for (; local_108.CanProceed;)
        {
            TDataObjectPtr<FEcologyActivityDefinitionRow> local_116 = local_108.Proceed();
            if (!(local_116))
            {
                continue;
            }
            if (!(FEcologyBehaviorUtils::IsActivityUseableForResource(local_118, local_54.ResourceType)))
            {
                continue;
            }
            if (!(FEcologyBehaviorUtils::IsActivityUseableForCreature(local_118, local_42.CreatureType)))
            {
                continue;
            }
            if (!(FEcologyConditionUtils::CheckCreatureCanDoActivity(Creature, local_116, local_98)))
            {
                continue;
            }
            int local_119 = 0;
            for (; local_119 < local_36; ++local_119)
            {
                int local_31 = local_4 + local_119;
                int local_101 = local_31 % local_36;
                if (!(bIgnoreClaim) && !(local_62.IsUseableFor(local_101, Creature.GetId())))
                {
                    continue;
                }
                FEcologyResourceSlotData& local_124 = local_62.SlotData[local_101];
                if (FEcologyBehaviorUtils::IsActivitySuitableForSlot(local_118, local_124, false))
                {
                    OutResult.SlotIndex = local_101;
                    OutResult.bRandomPosition = false;
                    OutResult.bHasSlotConfig = true;
                    OutResult.TargetPosition = (FVector(local_68.GetPosition()) + local_124.Position);
                    OutResult.TargetLookAt = (FVector(local_68.GetPosition()) + local_124.LookAt);
                    OutResult.BehaviorRef = local_116;
                    return true;
                }
            }
            if (FEcologyBehaviorUtils::IsActivityEnableOverSlot(local_118))
            {
                OutResult.SlotIndex = -1;
                OutResult.bRandomPosition = true;
                OutResult.bHasSlotConfig = false;
                OutResult.BehaviorRef = local_116;
                return true;
            }
        }
    }
    if (bOnlyPreferActivity)
    {
        return false;
    }
    TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> local_164 = FEcologyUtils::FindAllActivityByResource(local_42.CreatureType, local_54.ResourceType, false, true);
    TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> local_168 = FEcologyUtils::FindAllActivityByResource(local_42.CreatureType, local_54.ResourceType, true, false);
    bool local_122 = !(bPreferUseSlot) && (local_4 > (SlotPercent * 1000.0f));
    OutResult.SlotIndex = -1;
    OutResult.bRandomPosition = true;
    OutResult.bHasSlotConfig = false;
    if (!(local_122))
    {
        int local_101_2 = 0;
        for (; local_101_2 < local_36; ++local_101_2)
        {
            int local_31_2 = (local_4 + local_101_2) % local_36;
            FEcologyResourceSlotData& local_124_2 = local_62.SlotData[local_31_2];
            if (!(bIgnoreClaim) && !(local_62.IsUseableFor(local_31_2, Creature.GetId())))
            {
                continue;
            }
            TDataObjectPtr<FEcologyActivityDefinitionRow> local_160 = FEcologyBehaviorUtils::FindFirstUseableActivityForSlot(Creature, local_124_2, local_164, local_98, int(local_20.BaseSlotOffset), true);
            if (!(local_160))
            {
                continue;
            }
            OutResult.SlotIndex = local_31_2;
            OutResult.bRandomPosition = false;
            OutResult.bHasSlotConfig = true;
            OutResult.TargetPosition = (FVector(local_68.GetPosition()) + local_124_2.Position);
            OutResult.TargetLookAt = (FVector(local_68.GetPosition()) + local_124_2.LookAt);
            OutResult.BehaviorRef = local_160;
        }
    }
    if (!(bAllocateDefaultActivity))
    {
        return true;
    }
    if (!(OutResult.BehaviorRef))
    {
        int local_31_3 = local_4;
        int local_101_3 = 0;
        for (; local_101_3 < local_168.Num(); ++local_101_3)
        {
            TDataObjectPtr<FEcologyActivityDefinitionRow> local_116_2 = local_168[((local_31_3 + local_101_3) % local_168.Num())];
            if (FEcologyConditionUtils::CheckCreatureCanDoActivity(Creature, local_116_2, local_98))
            {
                OutResult.BehaviorRef = local_116_2;
                return true;
            }
        }
    }
    return OutResult.BehaviorRef.IsSet();
}
void ResetForceResetBehaviorMark(const FECSEntityId &inout CreatureEntityId)
{
    int local_16 = 0;
    if (!(FECSEntity(CreatureEntityId).IsValid()))
    {
        return;
    }
    if (!(local_16))
    {
        return;
    }
    local_16.ActivityData.bForceResetBehavior = false;
    return;
}
void ResetForceUpdateChangeAreaTargetResourceMark(const FECSEntity &inout CreatureEntity)
{
    if (!(CreatureEntity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_CreatureEcologyState& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.bForceUpdateTargetResource = false;
    }
    return;
}
void UpdateFlockPosition(const FECSEntity &inout FlockEntity)
{
    Get local_4;
    const FC_Transform& local_6 = local_4.opCall();
    if (local_6)
    {
        FVector local_14 = FEcologyBehaviorUtils::CalFlockPosition(FlockEntity);
        if ((!((FVector(local_6.GetPosition()) == local_14))))
        {
            FlockEntity.MoveTo(local_14, FFPTime(-1));
            FC_WaitingUpdateToVoxelSceneTag local_30;
            Assign local_28;
            local_28.opCall(local_30);
        }
    }
    return;
}
FVector CalFlockPosition(const FECSEntity &inout FlockEntity)
{
    FC_EcologyFlockBehaviorComponent local_6;
    Get local_30;
    const FC_Transform& local_32;
    int local_34 = 0;
    if (local_6)
    {
        if ((int(local_6.MainState) == 0 || (int(local_6.MainState) == 1)))
        {
            FEcologyFlockActivityTarget local_18;
            FECSEntity::Get<FC_EcologyFlockComponent> local_16 = FECSEntity::Get<FC_EcologyFlockComponent>(FlockEntity);
            if (FECSEntity(local_18.MainTargetResource))
            {
                local_32 = local_30.opCall();
                if (local_32)
                {
                    return local_32.GetPosition();
                }
            }
        }
    }
    FECSEntity::Get<FC_EcologyFlockComponent> local_16_2 = FECSEntity::Get<FC_EcologyFlockComponent>(FlockEntity);
    if (FECSEntity(local_34.LeaderEntity))
    {
        return local_32.GetPosition();
    }
    local_32 = local_30.opCall();
    if (local_32)
    {
        return local_32.GetPosition();
    }
    return FVector::ZeroVector;
}
void ClearBehaviorAllocatorData(const FECSEntity &inout FlockEntity, FC_EcologyFlockBehaviorComponent &inout BehaviorComponent, FECSEntity &inout TargetResource)
{
    int local_29 = 0;
    FResourceSlotAllocator local_2 = BehaviorComponent.SlotAllocator;
    Modify local_6;
    FC_EcologyResourceSlot& local_8 = local_6.opCall();
    if (local_8)
    {
        for (auto& local_28 : BehaviorComponent.SlotAllocator.SlotAllocMap)
        {
            if (!(HasSlotConfig()))
            {
                continue;
            }
            local_8.RemoveClaim(local_29, local_28.GetKey(), false);
        }
    }
    local_2.SlotAllocMap.Reset();
    local_2.LastAllocateTime = 0;
    return;
}
void FlockClaimNewResource(const FECSEntity &inout FlockEntity, const FECSEntity &inout NewResource, const bool bSendEvent = false)
{
    int local_6 = 0;
    int local_12 = 0;
    int local_42 = 0;
    FECSEntity local_18 = FECSEntity(FECSEntityId(local_6.ActivityTarget.MainTargetResource));
    if (local_18)
    {
        Modify local_28;
        FC_EcologyResourceProviderSummary& local_30 = local_28.opCall();
        if (local_30)
        {
            FEcologyBehaviorUtils::ClearBehaviorAllocatorData(FlockEntity, local_12, local_18);
            FEcologyResourceUtils::PinedResource(FlockEntity, local_6, local_30, false);
        }
    }
    if (NewResource)
    {
        Modify local_28;
        local_6.LastActivityTarget.MainTargetResource = local_6.ActivityTarget.MainTargetResource;
        local_6.ActivityTarget.MainTargetResource = NewResource.GetId();
        FC_EcologyResourceProviderSummary& local_30_2 = local_28.opCall();
        if (local_30_2)
        {
            FEcologyResourceUtils::PinedResource(FlockEntity, local_6, local_30_2, true);
        }
    }
    else
    {
        local_6.ActivityTarget.MainTargetResource = ENTITY_ID_NULL;
    }
    if (bSendEvent)
    {
        FFPTime local_38 = FFPTime(-1);
        local_42.FlockEntity = FlockEntity;
        local_42.TargetResource = NewResource;
    }
    FEcologyBehaviorUtils::UpdateFlockPosition(FlockEntity);
    return;
}
bool PrepareChangeAreaData(const FECSEntity &inout FlockEntity, const FECSEntityId &inout TargetResourceId, const float32 ArrivalDistance = 100.0f)
{
    int local_16 = 0;
    int local_40 = 0;
    int local_48 = 0;
    int local_54 = 0;
    if (!(FECSEntity(TargetResourceId)))
    {
        return false;
    }
    FC_EcologyFlockBehaviorComponent local_28;
    FFlockChangeAreaData local_30 = local_28.ChangeAreaData;
    local_30.TargetPosition = FVector(local_16.GetPosition());
    local_30.ArrivalDistance = ArrivalDistance;
    if (int(local_28.MainState) == 2)
    {
        if (local_30.bForceUpdateTargetResource)
        {
            if (local_40)
            {
                FFPTime local_46 = FFPTime(-1);
                local_48.FlockEntity = FlockEntity;
                local_48.ChildEntityList = local_40.CreatureEntities;
            }
            local_30.bForceUpdateTargetResource = false;
        }
    }
    FFPTime local_46_2 = FFPTime(-1);
    local_54.FlockEntity = FlockEntity;
    local_54.TargetResourceId = TargetResourceId;
    return true;
}
void OnFlockStateChanged(const FECSEntity &inout FlockEntity, const EFlockBehaviorState OldState, const EFlockBehaviorState NewState)
{
    0.BehaviorSubTask.RemoveAllSubTaskInstances();
    if (FEcologyBehaviorUtils::CheckFlockEnableEvent(FlockEntity, FEcologyGameplayTagDefine::Ecology_EnableFlockStateChangeEvent))
    {
        FCE_OnFlockStateChangeLevelEvent local_18;
        FFPTime local_14 = FFPTime(-1);
        local_18.FlockEntity = FlockEntity;
        local_18.OldState = OldState;
        local_18.NewState = NewState;
        Get local_22;
        const FC_EcologyFlockComponent& local_24 = local_22.opCall();
        if (local_24)
        {
            FECSEntity local_32 = FECSEntity(local_24.LeaderEntity);
            if (local_32.IsValid())
            {
                local_18.LeaderEntity = local_32;
                Get local_36;
                const FC_CreatureMeta& local_38 = local_36.opCall();
                if (local_38)
                {
                    local_18.LeaderCreatureRowData = local_38.CreatureType;
                }
            }
        }
    }
    return;
}
void ModifyFlockState(const FECSEntity &inout FlockEntity, const EFlockBehaviorState NewState)
{
    FC_EcologyFlockBehaviorComponent local_6;
    if ((int(local_6.MainState)) == (int(NewState)))
    {
        return;
    }
    EFlockBehaviorState local_7_2 = local_6.MainState;
    local_6.MainState = NewState;
    FECSWorldPtr local_14 = ECS::GetECSWorld();
    Get local_18;
    local_6.EnterMainStateTime = local_18.opCall().Time;
    FEcologyBehaviorUtils::UpdateFlockPosition(FlockEntity);
    FEcologyBehaviorUtils::OnFlockStateChanged(FlockEntity, EFlockBehaviorState(local_7_2), EFlockBehaviorState(NewState));
    return;
}
void AddFlockChangeAreaRequest(const FECSEntity &inout FlockEntity, const FResourceRequestFilterConfig &inout SearchRequest, const FGameplayTag &inout ReasonTag, const FGameplayTag &inout SourceTag, const bool bUseNearestCombatRegionPolicy, const FChangeAreaMessageInfo &inout MessageInfo, const float32 CombatRegionPolicyRadiusLayer1 = 25000.f, const float32 CombatRegionPolicyRadiusLayer2 = 50000.f, const int Priority = 0, const bool bNeedChangeAreaMessage = false, const bool bForceUpdateTargetResource = false)
{
    FEcologyBehaviorUtils::InternalAddFlockChangeAreaRequest(FlockEntity, ReasonTag, SourceTag, bUseNearestCombatRegionPolicy, MessageInfo, CombatRegionPolicyRadiusLayer1, CombatRegionPolicyRadiusLayer2, Priority, bNeedChangeAreaMessage, bForceUpdateTargetResource, SearchRequest, ENTITY_ID_NULL);
    return;
}
void AddFlockChangeAreaRequestSpecified(const FECSEntity &inout FlockEntity, const FECSEntityId &inout ResourceID, const FGameplayTag &inout ReasonTag, const FGameplayTag &inout SourceTag, const bool bUseNearestCombatRegionPolicy, const FChangeAreaMessageInfo &inout MessageInfo, const float32 CombatRegionPolicyRadiusLayer1 = 25000.f, const float32 CombatRegionPolicyRadiusLayer2 = 50000.f, const int Priority = 0, const bool bNeedChangeAreaMessage = false, const bool bForceUpdateTargetResource = false)
{
    FEcologyBehaviorUtils::InternalAddFlockChangeAreaRequest(FlockEntity, ReasonTag, SourceTag, bUseNearestCombatRegionPolicy, MessageInfo, CombatRegionPolicyRadiusLayer1, CombatRegionPolicyRadiusLayer2, Priority, bNeedChangeAreaMessage, bForceUpdateTargetResource, FEcologyConst::EmptyRequest, ResourceID);
    return;
}
void InternalAddFlockChangeAreaRequest(const FECSEntity &inout FlockEntity, const FGameplayTag &inout ReasonTag, const FGameplayTag &inout SourceTag, const bool bUseNearestCombatRegionPolicy, const FChangeAreaMessageInfo &inout MessageInfo = FEcologyConst::EmptyChangeAreaMessageInfo, const float32 CombatRegionPolicyRadiusLayer1 = 25000.f, const float32 CombatRegionPolicyRadiusLayer2 = 50000.f, const int Priority = 0, const bool bNeedChangeAreaMessage = false, const bool bForceUpdateTargetResource = false, const FResourceRequestFilterConfig &inout SearchRequest = FEcologyConst::EmptyRequest, const FECSEntityId &inout ResourceID = ENTITY_ID_NULL)
{
    int local_2 = 1;
    int local_1 = local_2;
    FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"InternalAddFlockChangeAreaRequest"), false);
    Modify local_10;
    FC_EcologyFlockBehaviorComponent& local_12 = local_10.opCall();
    if (local_12)
    {
        FFlockChangeAreaRequest local_140;
        int local_141 = 0;
        int local_4 = local_12.ChangeAreaRequest.Num();
        for (; local_4 > 0; --local_4)
        {
            if (Priority >= (int(local_12.ChangeAreaRequest[(local_4 - 1)]._base_FFlockBehaviorRequest)))
            {
                local_141 = local_4;
                break;
            }
        }
        local_12.ChangeAreaRequest.Insert(local_140, local_141);
        FFlockChangeAreaRequest& local_144 = local_12.ChangeAreaRequest[local_141];
        local_144.SpecifiedResourceId = ResourceID;
        local_144._base_FFlockBehaviorRequest = Priority;
        local_144.ReasonTag = ReasonTag;
        local_144.SourceTag = SourceTag;
        local_144.bNeedChangeAreaMessage = bNeedChangeAreaMessage;
        local_144.bForceUpdateTargetResource = bForceUpdateTargetResource;
        local_144.bUseNearestCombatRegionPolicy = bUseNearestCombatRegionPolicy;
        local_144.CombatRegionPolicyRadiusLayer1 = CombatRegionPolicyRadiusLayer1;
        local_144.CombatRegionPolicyRadiusLayer2 = CombatRegionPolicyRadiusLayer2;
        if ((ResourceID == ENTITY_ID_NULL))
        {
            SearchRequest.MakeRequest(FlockEntity, local_144.SearchRequest);
        }
        else
        {
            local_144.bUseNearestCombatRegionPolicy = false;
        }
    }
    return;
}
void AddDefaultChangeAreaRequest(const FECSEntity &inout FlockEntity, const int SearchRadius, const FGameplayTag &inout ReasonTag, const FGameplayTag &inout SourceTag, const bool bUseNearestCombatRegionPolicy, const FChangeAreaMessageInfo &inout MessageInfo = FEcologyConst::EmptyChangeAreaMessageInfo, const float32 CombatRegionPolicyRadiusLayer1 = 25000.f, const float32 CombatRegionPolicyRadiusLayer2 = 50000.f, const int Priority = 0, const bool bNeedChangeAreaMessage = false, const bool bForceUpdateTargetResource = false)
{
    FEcologyBehaviorUtils::InternalAddFlockChangeAreaRequest(FlockEntity, ReasonTag, SourceTag, bUseNearestCombatRegionPolicy, MessageInfo, CombatRegionPolicyRadiusLayer1, CombatRegionPolicyRadiusLayer2, Priority, bNeedChangeAreaMessage, bForceUpdateTargetResource, FEcologyBehaviorUtils::MakeDefaultSearchResourceConfig(SearchRadius), ENTITY_ID_NULL);
    return;
}
FResourceRequestFilterConfig MakeDefaultSearchResourceConfig(const int SearchRadius)
{
    FResourceRequestFilterConfig local_76;
    FResourceRequestFilterConfig __r;
    local_76.SearchRadius = SearchRadius;
    local_76.bUseEntitySpawnerVolume = true;
    local_76.bUseRequesterPosition = true;
    local_76.bUseRequesterEcologyInfo = true;
    return __r;
}
void FindCombatRegionByRadiusAndAppendByLayer(FC_EcologyFlockBehaviorComponent &inout FlockBehaviorComp, const FVector &inout Center, const float32 RadiusQuery, const float32 RadiusLayer1, const float32 RadiusLayer2, TArray<AECSRegionVolume> &inout OutRegions)
{
    int local_8 = 0;
    const FEcologyVoxelSceneRegion& local_114;
    const FRegionVolumeSummary& local_134;
    AECSRegionVolume local_138;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8))
    {
        return;
    }
    float32 local_11 = RadiusQuery * RadiusQuery;
    float32 local_10 = RadiusLayer1 * RadiusLayer1;
    float32 local_12 = RadiusLayer2 * RadiusLayer2;
    FVoxelRegionScope local_54 = FVoxelRegionScope(FBox::BuildAABB(Center, FVector(RadiusQuery)));
    TSet<FECSEntityId> local_78;
    TArray<AECSRegionVolume> local_82;
    TArray<AECSRegionVolume> local_86;
    FVoxelRegionIterator local_96 = local_54.Iterator();
    for (; local_96.CanProceed;)
    {
        if (!(local_8.VoxelScene.Find(local_96.Proceed().Current)))
        {
            continue;
        }
        for (auto& local_132 : local_114.VolumeData)
        {
            local_132;
            if (!(local_134.bIsCombatRegion))
            {
                continue;
            }
            FECSEntityId local_135 = local_134.RegionEntityId;
            if ((local_135 == ENTITY_ID_NULL))
            {
                continue;
            }
            if (local_78.Contains(local_135))
            {
                continue;
            }
            local_78.Add(local_135);
            if (FEcologyBehaviorUtils::IsVisitedCombatRegion(FlockBehaviorComp, local_135))
            {
                continue;
            }
            if (!(local_134.Volume.IsValid()))
            {
                continue;
            }
            AECSVolumeBase local_140;
            local_138 = Cast<AECSRegionVolume>(local_140);
            if (!((local_138 != nullptr)) || !(local_138.bAffectCombat))
            {
                continue;
            }
            float32 local_13 = float32(Center.DistSquared(local_134.Bounds.GetBox().GetCenter()));
            if (local_13 > local_11)
            {
                continue;
            }
            if (local_13 < local_10)
            {
                local_82.Add(local_138);
                continue;
            }
            if (local_10 <= local_13 && (local_13 < local_12))
            {
                local_86.Add(local_138);
            }
            else
            {
                continue;
            }
        }
    }
    local_82.Shuffle();
    local_86.Shuffle();
    OutRegions.Append(local_82);
    OutRegions.Append(local_86);
    return;
}
bool IsVisitedCombatRegion(FC_EcologyFlockBehaviorComponent &inout FlockBehaviorComp, const FECSEntityId &inout RegionEntityId)
{
    if (!(FECSEntity(RegionEntityId).IsValid()) || (RegionEntityId == ENTITY_ID_NULL))
    {
        return false;
    }
    int local_7 = 0;
    for (; local_7 < FlockBehaviorComp.VisitedCombatRegion.Num(); ++local_7)
    {
        FECSEntityId& local_12 = FlockBehaviorComp.VisitedCombatRegion[local_7];
        if ((local_12 == RegionEntityId))
        {
            return true;
        }
    }
    return false;
}
bool CheckFlockLeaderHasChangeAreaTriggers(const FECSEntity &inout Flock)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return false;
    }
    return (local_6.ChangeAreaTriggers.Num() > 0);
}
void ClearAllFlockChangeAreaRequest(const FECSEntity &inout FlockEntity)
{
    0.ChangeAreaRequest.Empty(0);
    return;
}
void OnEmergencyStateChange(const FECSEntity &inout FlockEntity, const bool OldEmergencyState, const bool NewEmergencyState)
{
    int local_6 = 0;
    if (NewEmergencyState)
    {
        local_6.BehaviorSubTask.ResetEmergency();
    }
    return;
}
void ModifyFlockEmergencyState(const FECSEntity &inout FlockEntity, const bool IsEmergency)
{
    FC_EcologyFlockBehaviorComponent local_6;
    if (!(local_6))
    {
        return;
    }
    local_6.bIsInEmergency = IsEmergency;
    bool local_7 = !(IsEmergency);
    FEcologyBehaviorUtils::OnEmergencyStateChange(FlockEntity, local_7, IsEmergency);
    return;
}
bool CheckFlockIsEmergencyState(const FECSEntity &inout FlockEntity)
{
    FC_EcologyFlockBehaviorComponent local_6;
    if (!(local_6))
    {
        return false;
    }
    return local_6.bIsInEmergency;
}
bool CheckFlockCombatState(const FECSEntity &inout FlockEntity)
{
    FECSEntity local_14 = FECSEntity(0.LeaderEntity);
    Has local_18;
    if (local_18.opCall())
    {
        return true;
    }
    return false;
}
void GetFlockMainState(const FECSEntity &inout FlockEntity, bool &inout bIsValid, EFlockBehaviorState &inout MainState)
{
    FC_EcologyFlockBehaviorComponent local_8;
    bIsValid = false;
    MainState = EFlockBehaviorState(0);
    if (!(FlockEntity.IsValid()))
    {
        bIsValid = false;
        return;
    }
    if (local_8)
    {
        bIsValid = true;
        MainState = local_8.MainState;
    }
    return;
}
FECSEntity FindFlockEntity(const FECSEntity &inout Entity)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        return Entity;
    }
    FECSEntity local_10;
    Get local_14;
    const FC_FlockMember& local_16 = local_14.opCall();
    if (local_16)
    {
        local_10 = FECSEntity(local_16.FlockProxyEntity);
        bool local_5_2 = local_4.opCall();
        if (local_5_2)
        {
            return local_10;
        }
    }
    return ENTITY_NULL;
}
FECSEntityId FindMainTargetResource(const FECSEntity &inout Entity)
{
    FECSEntity local_4 = Entity;
    Get local_8;
    const FC_FlockMember& local_10 = local_8.opCall();
    if (local_10)
    {
        local_4 = FECSEntity(local_10.FlockProxyEntity);
    }
    Get local_20;
    const FC_EcologyFlockComponent& local_22 = local_20.opCall();
    if (local_22)
    {
        return local_22.ActivityTarget.MainTargetResource;
    }
    return ENTITY_ID_NULL;
}
void AddChangeAreaTrigger(const FECSEntity &inout Entity, FC_EcologyFlockBehaviorComponent &inout Component, const UCommonChangeAreaTriggerDefinitionAsset Asset)
{
    FFlockChangeAreaTaskInstance local_6;
    local_6.Definition = Asset;
    if (local_6.IsValid())
    {
        Component.ChangeAreaTriggers.Add(local_6);
    }
    return;
}
void AddChangeAreaTirggers(const FECSEntity &inout FlockEntity, const TArray<TObjectPtr<UCommonChangeAreaTriggerDefinitionAsset>> &inout Collection)
{
    if (Collection.Num() <= 0)
    {
        XLog(ELog(30), FString().Append("[ChangeArea]: AddChangeAreaTirggers --> Flock: ").Append(FlockEntity).Append(", Collection.Num <= 0"));
        return;
    }
    Modify local_14;
    FC_EcologyFlockBehaviorComponent& local_16 = local_14.opCall();
    if (local_16)
    {
        for (auto& local_30 : Collection)
        {
            local_30;
            UCommonChangeAreaTriggerDefinitionAsset local_32;
            FEcologyBehaviorUtils::AddChangeAreaTrigger(FlockEntity, local_16, local_32);
        }
        if (local_16.ChangeAreaTriggers.Num() > 0)
        {
            FC_HasChangeAreaTriggerTag local_38;
            Assign local_36;
            local_36.opCall(local_38);
            return;
        }
        XLog(ELog(30), FString().Append("[ChangeArea]: AddChangeAreaTirggers --> Flock: ").Append(FlockEntity).Append(", ChangeAreaTriggers.Num ").Append(local_16.ChangeAreaTriggers.Num()));
        Remove local_42;
        local_42.opCall();
    }
    return;
}
bool CheckFlockEnableEvent(const FECSEntity &inout FlockEntity, const FGameplayTag &inout GameplayTag)
{
    Get local_4;
    const FC_EcologyGameplayTags& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.Match(GameplayTag);
    }
    return false;
}
void InterruptFlockHTNByTag(const FECSEntityId &inout TargetId, const FGameplayTag &inout Tag)
{
    if (!(FECSEntity(TargetId).IsValid()))
    {
        return;
    }
    Get local_14;
    const FC_HTNInstance& local_16 = local_14.opCall();
    if (local_16)
    {
        if (local_16.HTNComponent.IsValid())
        {
            UECSHTNComponent local_18;
            local_18.NotifyInterrupt(Tag);
        }
    }
    return;
}
void ModifyCreatureNeedReAllocateState(const FECSEntity &inout Entity, const bool NeedReAllocate)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_CreatureEcologyState& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.ActivityData.bNeedReAllocate = NeedReAllocate;
    }
    return;
}
bool GetCreatureNeedReAllocateState(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return false;
    }
    Get local_6;
    const FC_CreatureEcologyState& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.ActivityData.bNeedReAllocate;
    }
    return false;
}
void ModifyCreatureNeedDoDefaultBehavior(const FECSEntity &inout Entity, const bool bNeedDoDefaultBehavior)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Modify local_6;
    FC_CreatureEcologyState& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.ActivityData.bNeedDoDefaultBehavior = bNeedDoDefaultBehavior;
    }
    return;
}
bool GetCreatureNeedDoDefaultBehavior(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return false;
    }
    Get local_6;
    const FC_CreatureEcologyState& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.ActivityData.bNeedDoDefaultBehavior;
    }
    return false;
}
void ChangeAreaStartServerTrackHandler(const FECSEntity &inout Flock)
{
    int local_8 = 0;
    if (!(Flock.IsValid()))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    FECSEntity local_16 = FECSEntity(local_8.LeaderEntity);
    if (!(local_16.IsValid()))
    {
        return;
    }
    if ((int(FASCommonUtils::GetMonsterRank(local_16))) != 2)
    {
        return;
    }
    FName local_23(NAME_None);
    if ((local_8.LastActivityTarget.MainTargetResource == ENTITY_ID_NULL))
    {
        return;
    }
    FName local_21;
    FEcologyBehaviorUtils::ChangeAreaStartServerTrackMessage(local_21, FEcologyBehaviorUtils::GetCombatRegionActorNameByResourceHelper(FECSEntity(local_8.LastActivityTarget.MainTargetResource)));
    return;
}
void ChangeAreaOverServerTrackHandler(const FECSEntity &inout Flock)
{
    int local_8 = 0;
    if (!(Flock.IsValid()))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    FECSEntity local_16 = FECSEntity(local_8.LeaderEntity);
    if (!(local_16.IsValid()))
    {
        return;
    }
    if ((int(FASCommonUtils::GetMonsterRank(local_16))) != 2)
    {
        return;
    }
    FName local_21;
    FName local_23;
    if ((local_8.ActivityTarget.MainTargetResource == ENTITY_ID_NULL))
    {
        return;
    }
    local_23 = FEcologyBehaviorUtils::GetCombatRegionActorNameByResourceHelper(FECSEntity(local_8.ActivityTarget.MainTargetResource));
    FEcologyBehaviorUtils::ChangeAreaOverServerTrackMessage(local_21, local_23);
    return;
}
FName GetCombatRegionActorNameByResourceHelper(const FECSEntity &inout TrackResource)
{
    AActor local_22;
    FName __return;
    FName local_2(NAME_None);
    FEcologySceneInfoUtils::FindCombatRegionByEntity(TrackResource);
    Get local_14;
    if (local_14.opCall())
    {
        if (local_22 != nullptr)
        {
            AActor local_24;
            local_2 = local_24.GetFName();
        }
    }
    else
    {
        __return = local_2;
    }
    return local_2;
}
void ChangeAreaOverServerTrackMessage(const FName &inout BossName, const FName &inout RegionName)
{
    XLog(ELog(30), FString().Append("ChangeAreaOverServerTrackMessage, Boss: ").Append(BossName).Append(" To ").Append(RegionName));
    return;
}
void ChangeAreaStartServerTrackMessage(const FName &inout BossName, const FName &inout RegionName)
{
    XLog(ELog(30), FString().Append("ChangeAreaStartServerTrackMessage, Boss: ").Append(BossName).Append(" From ").Append(RegionName));
    return;
}
FVector GetNoResourcePivotLocation(const FECSEntity &inout Entity, const FECSEntity &inout Flock, const ENoResourcePivotLocationPolicy PivotPolicy)
{
    bool local_1 = false;
    bool local_3 = false;
    FVector local_10(FVector::ZeroVector);
    FVector local_16(FVector::ZeroVector);
    if (Entity.IsValid())
    {
        Get local_20;
        const FC_CreatureEcologyState& local_22 = local_20.opCall();
        if (local_22)
        {
            local_1 = true;
            local_10 = local_22.ActivityData.BornLocation;
            local_16 = local_22.ActivityData.LastActivityPivot;
            local_3 = local_22.ActivityData.bHasLastActivityPivot;
        }
    }
    switch (int(PivotPolicy))
    {
    case 0:
    {
        if (local_1)
        {
            if (local_3)
            {
                return local_16;
            }
            return local_10;
        }
        break;
    }
    case 1:
    {
        if (local_1)
        {
            return local_10;
        }
        break;
    }
    case 2:
    {
        if (Flock.IsValid())
        {
            return FEcologyBehaviorUtils::CalFlockPosition(Flock);
        }
        break;
    }
    }
    if (Flock.IsValid())
    {
        return FEcologyBehaviorUtils::CalFlockPosition(Flock);
    }
    if (local_1)
    {
        return local_16;
    }
    if (Entity.IsValid())
    {
        Get local_34;
        const FC_Transform& local_36 = local_34.opCall();
        if (local_36)
        {
            return local_36.GetPosition();
        }
    }
    return FVector::ZeroVector;
}
void UpdateLastActivityPivotLocationByMainTargetResource(const FECSEntity &inout Entity, const FECSEntity &inout Flock)
{
    int local_8 = 0;
    int local_24 = 0;
    int local_30 = 0;
    if (!(Entity.IsValid()) || !(Flock.IsValid()))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    if ((local_8.ActivityTarget.MainTargetResource == ENTITY_ID_NULL))
    {
        return;
    }
    if (!(FECSEntity(local_8.ActivityTarget.MainTargetResource).IsValid()))
    {
        return;
    }
    if (!(local_24))
    {
        return;
    }
    if (!(local_30))
    {
        return;
    }
    local_30.ActivityData.LastActivityPivot = local_24.GetPosition();
    local_30.ActivityData.bHasLastActivityPivot = true;
    return;
}
}
