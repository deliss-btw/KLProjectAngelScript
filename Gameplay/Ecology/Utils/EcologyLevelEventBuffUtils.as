
namespace FEcologyLevelEventBuffUtils
{
AKLLevelScriptAreaEventBase GetLevelEventActorFromLevelUnitGroup(const FECSEntity &inout Entity)
{
    int local_10 = 0;
    if (!(Entity.IsValid()))
    {
        return nullptr;
    }
    if (!(local_10))
    {
        return nullptr;
    }
    const FLevelUnitConfig& local_12 = local_10.GetLevelUnitConfig();
    if (!(local_12.OwnerGroupRef.IsValid()))
    {
        return nullptr;
    }
    const FLevelGroupConfig& local_14 = LevelConfig::FindLevelGroupConfig(local_12.OwnerGroupRef);
    if (!(local_14.IsValid()))
    {
        return nullptr;
    }
    ULevelActorManager local_18 = ULevelActorManager::Get();
    if (local_18 == nullptr)
    {
        return nullptr;
    }
    AKLLevelScriptActor local_20 = local_18.GetLBPByName(local_14.GroupName);
    if (local_20 == nullptr)
    {
        return nullptr;
    }
    return Cast<AKLLevelScriptAreaEventBase>(local_20);
}
AKLLevelScriptAreaEventBase GetContainingActiveLevelEventActor(const FECSEntity &inout CreatureEntity)
{
    int local_6 = 0;
    AKLLevelScriptAreaEventBase local_10;
    AKLLevelScriptAreaEventBase local_12;
    AKLLevelScriptAreaEventBase local_40;
    AECSRegionVolume local_46;
    if (!(local_6))
    {
        return nullptr;
    }
    int local_13 = 0;
    TArray<AActor> local_20 = FKLLevelUtils::GetAllLevelScriptActors(ECS::GetUEWorld());
    for (auto local_38 : local_20)
    {
        local_40 = Cast<AKLLevelScriptAreaEventBase>(local_38);
        if (local_40 == nullptr || !(local_40.IsEventActive()))
        {
            continue;
        }
        if (local_46 == nullptr || !(local_46.QuickEncompassesPoint(local_6.GetPosition())))
        {
            continue;
        }
        local_12 = local_40;
        ++local_13;
    }
    if (local_13 == 1)
    {
        local_10 = local_12;
    }
    else
    {
    }
    return local_10;
}
AKLLevelScriptAreaEventBase GetOwningLevelEventActor(const FECSEntity &inout CreatureEntity, const FC_CreatureMeta &inout CreatureMeta)
{
    AKLLevelScriptAreaEventBase local_4 = FEcologyLevelEventBuffUtils::GetLevelEventActorFromLevelUnitGroup(CreatureEntity);
    if (local_4 != nullptr)
    {
        return local_4;
    }
    AKLLevelScriptAreaEventBase local_4_2 = (Cast<AKLLevelScriptAreaEventBase>(FKLLevelUtils::GetLevelScriptActorOfEntity(ECS::GetUEWorld(), CreatureEntity, false)));
    if (local_4_2 != nullptr)
    {
        return local_4_2;
    }
    if ((!((CreatureMeta.RuntimeSpawnerEntity == ENTITY_ID_NULL))))
    {
        FECSEntity local_20 = FECSEntity(CreatureMeta.RuntimeSpawnerEntity);
        if (local_20.IsValid())
        {
            AKLLevelScriptAreaEventBase local_4_3 = FEcologyLevelEventBuffUtils::GetLevelEventActorFromLevelUnitGroup(local_20);
            if (local_4_3 != nullptr)
            {
                return local_4_3;
            }
            AKLLevelScriptAreaEventBase local_4_4 = (Cast<AKLLevelScriptAreaEventBase>(FKLLevelUtils::GetLevelScriptActorOfEntity(ECS::GetUEWorld(), local_20, false)));
            if (local_4_4 != nullptr)
            {
                return local_4_4;
            }
        }
    }
    if ((!((CreatureMeta.SpawnerConfigRef == ENTITY_ID_NULL))))
    {
        FECSEntity local_16 = FECSEntity(CreatureMeta.SpawnerConfigRef);
        if (local_16.IsValid())
        {
            AKLLevelScriptAreaEventBase local_4_5 = FEcologyLevelEventBuffUtils::GetLevelEventActorFromLevelUnitGroup(local_16);
            if (local_4_5 != nullptr)
            {
                return local_4_5;
            }
            AKLLevelScriptAreaEventBase local_4_6 = (Cast<AKLLevelScriptAreaEventBase>(FKLLevelUtils::GetLevelScriptActorOfEntity(ECS::GetUEWorld(), local_16, false)));
            if (local_4_6 != nullptr)
            {
                return local_4_6;
            }
        }
    }
    Get local_24;
    const FC_MonsterSpawnedBySpawner& local_26 = local_24.opCall();
    if (local_26)
    {
        if (local_26.SpawnerEntity.IsValid())
        {
            AKLLevelScriptAreaEventBase local_4_7 = FEcologyLevelEventBuffUtils::GetLevelEventActorFromLevelUnitGroup(local_26.SpawnerEntity);
            if (local_4_7 != nullptr)
            {
                return local_4_7;
            }
            AKLLevelScriptAreaEventBase local_4_8 = (Cast<AKLLevelScriptAreaEventBase>(FKLLevelUtils::GetLevelScriptActorOfEntity(ECS::GetUEWorld(), local_26.SpawnerEntity, false)));
            if (local_4_8 != nullptr)
            {
                return local_4_8;
            }
        }
    }
    return FEcologyLevelEventBuffUtils::GetContainingActiveLevelEventActor(CreatureEntity);
}
TDataObjectPtr<FLevelEventInfoConfigBase> GetLevelEventInfo(const AKLLevelScriptAreaEventBase EventActor)
{
    if ((EventActor == nullptr || !(EventActor.EventInfo)))
    {
        return TDataObjectPtr<FLevelEventInfoConfigBase>();
    }
    return EventActor.EventInfo;
}
TDataObjectPtr<FLevelEventInfoConfigBase> GetSelectedRuntimeRandomEventInfo(const FECSEntity &inout CreatureEntity)
{
    int local_6 = 0;
    int local_64 = 0;
    if (!(local_6))
    {
        return TDataObjectPtr<FLevelEventInfoConfigBase>();
    }
    FECSWorldPtr local_58 = ECS::GetECSWorld();
    if (!(local_64))
    {
        return TDataObjectPtr<FLevelEventInfoConfigBase>();
    }
    TDataObjectPtr<FLevelEventInfoConfigBase> local_88;
    float local_90 = 3.4028234663852886e38;
    for (auto local_105 : local_64.SelectedEventPointIndexes)
    {
        if (!(local_64.RandomLevelEventPointData.IsValidIndex(local_105)))
        {
            continue;
        }
        const FRuntimeEventPointData& local_108 = local_64.RandomLevelEventPointData[local_105];
        if (int(local_108.SelectedLBPIndex) < 0 || !(local_108.EventInfoConfigs.IsValidIndex(int(local_108.SelectedLBPIndex))))
        {
            continue;
        }
        int local_106 = int(local_108.SelectedLBPIndex);
        TDataObjectPtr<FLevelEventInfoConfigBase> local_134 = local_108.EventInfoConfigs[local_106];
        if (!(local_134))
        {
            continue;
        }
        float local_92 = local_6.GetPosition().DistSquared2D(local_108.Location);
        if (local_92 < local_90)
        {
            local_90 = local_92;
            local_88 = local_134;
        }
    }
    return local_88;
}
TDataObjectPtr<FLevelEventInfoConfigBase> GetSelectedRuntimePublicEventInfo(const FECSEntity &inout CreatureEntity)
{
    int local_6 = 0;
    int local_64 = 0;
    if (!(local_6))
    {
        return TDataObjectPtr<FLevelEventInfoConfigBase>();
    }
    FECSWorldPtr local_58 = ECS::GetECSWorld();
    if (!(local_64))
    {
        return TDataObjectPtr<FLevelEventInfoConfigBase>();
    }
    TDataObjectPtr<FLevelEventInfoConfigBase> local_88;
    float local_90 = 3.4028234663852886e38;
    for (auto local_105 : local_64.SelectedEventPointIndexes)
    {
        if (!(local_64.RandomPublicEventPointData.IsValidIndex(local_105)))
        {
            continue;
        }
        const FRuntimePublicEventPointData& local_108 = local_64.RandomPublicEventPointData[local_105];
        if (int(local_108.SelectedLBPIndex) < 0 || !(local_108.LBPs.IsValidIndex(int(local_108.SelectedLBPIndex))))
        {
            continue;
        }
        TConstRawPtr<FRuntimePublicEventLBPData> local_122 = local_64.RuntimePublicEventLBPDatas.Find(TSoftClassPtr<AKLLevelScriptPublicEvent>(local_108.LBPs[int(local_108.SelectedLBPIndex)]));
        if ((local_122 == nullptr) || !(local_122.opArrow().EventInfoConfig) || ((local_108.PublicEventPoint == nullptr)))
        {
            continue;
        }
        float local_92 = local_6.GetPosition().DistSquared2D(local_108.PublicEventPoint.GetActorLocation());
        if (local_92 < local_90)
        {
            local_90 = local_92;
            local_88 = local_122.opArrow().EventInfoConfig;
        }
    }
    return local_88;
}
TDataObjectPtr<FLevelEventInfoConfigBase> GetLevelEventInfoForCreature(const FECSEntity &inout CreatureEntity, const FC_CreatureMeta &inout CreatureMeta)
{
    TDataObjectPtr<FLevelEventInfoConfigBase> local_26 = FEcologyLevelEventBuffUtils::GetLevelEventInfo(FEcologyLevelEventBuffUtils::GetOwningLevelEventActor(CreatureEntity, CreatureMeta));
    if (local_26)
    {
        return local_26;
    }
    local_26 = FEcologyLevelEventBuffUtils::GetSelectedRuntimeRandomEventInfo(CreatureEntity);
    if (local_26)
    {
        return local_26;
    }
    return FEcologyLevelEventBuffUtils::GetSelectedRuntimePublicEventInfo(CreatureEntity);
}
bool TryGetAttachConditionType(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout EventInfo, EBuffAttachConditionType &inout OutConditionType)
{
    int local_58;
    if (!(EventInfo))
    {
        return false;
    }
    CastTo local_6;
    if (local_6.opCall())
    {
        if (0 == 1)
        {
            local_58 = 1;
        }
        else
        {
            local_58 = 0;
        }
        OutConditionType = EBuffAttachConditionType(local_58);
        return true;
    }
    CastTo local_64;
    if (local_64.opCall())
    {
        OutConditionType = EBuffAttachConditionType(2);
        return true;
    }
    return false;
}
bool IsMappingUsableForCondition(const FBuffAttachLevelEventMapping &inout Mapping, const EBuffAttachConditionType ConditionType)
{
    bool local_4;
    if (int(Mapping.ConditionType) != int(ConditionType))
    {
        local_4 = false;
    }
    else
    {
        local_4 = Mapping.BuffList;
    }
    return local_4;
}
bool DoesMappingMatchLevelEvent(const FBuffAttachLevelEventMapping &inout Mapping, const TDataObjectPtr<FLevelEventInfoConfigBase> &inout EventInfo, const EBuffAttachConditionType ConditionType)
{
    int local_5 = 0;
    if (!(FEcologyLevelEventBuffUtils::IsMappingUsableForCondition(Mapping, EBuffAttachConditionType(ConditionType))) || !(EventInfo))
    {
        return false;
    }
    bool local_1 = !(Mapping.bUseSpecificEvent);
    if (local_1)
    {
        return true;
    }
    if (int(ConditionType) == 0)
    {
        if (!(Mapping.NormalRandomEventInfo))
        {
            local_1 = false;
        }
        else
        {
            int local_4 = local_5;
            local_1 = (local_4 == 0);
        }
        local_1 = local_1 && (Mapping.NormalRandomEventInfo.GetDataName() == EventInfo.GetDataName());
        return local_1;
    }
    if (int(ConditionType) == 1)
    {
        return Mapping.HardRandomEventInfo && (local_5 == 1) && (Mapping.HardRandomEventInfo.GetDataName() == EventInfo.GetDataName());
    }
    if (int(ConditionType) == 2)
    {
        return Mapping.PublicEventInfo && (Mapping.PublicEventInfo.GetDataName() == EventInfo.GetDataName());
    }
    return false;
}
void AppendConfiguredRules(const TArray<TDataObjectPtr<FBuffAttachRuleConfig>> &inout InRules, TArray<TDataObjectPtr<FBuffAttachRuleConfig>> &inout OutRules)
{
    for (auto& local_16 : InRules)
    {
        if (local_16 && !(OutRules.Contains(local_16)))
        {
            OutRules.Add(local_16);
        }
    }
    return;
}
void AppendGlobalBuffAttachRules(TArray<TDataObjectPtr<FBuffAttachRuleConfig>> &inout OutRules)
{
    const UBuffAttachSettings local_2;
    GetGameplaySettings<UBuffAttachSettings> local_4;
    local_2 = local_4;
    if (local_2 != nullptr)
    {
        FEcologyLevelEventBuffUtils::AppendConfiguredRules(local_2.GlobalBuffAttachRules, OutRules);
    }
    return;
}
TConstRawPtr<FVirtualConfigData> ReadSpawnerConfigData(const FECSEntity &inout SpawnerEntity)
{
    if (!(SpawnerEntity.IsValid()))
    {
        return TConstRawPtr<FVirtualConfigData>();
    }
    Get local_10;
    const FC_EcologyConfigReference& local_12 = local_10.opCall();
    if (local_12)
    {
        TConstRawPtr<FVirtualConfigData> local_4;
        local_4 = local_12.ReadSpawnerConfig();
        if (local_4)
        {
            return local_4;
        }
    }
    Get local_18;
    const FC_EcologySpawnerConfig& local_20 = local_18.opCall();
    if (local_20)
    {
        return TConstRawPtr<FVirtualConfigData>(local_20.SpawnerConfig);
    }
    Get local_24;
    const FC_LevelUnitComponent& local_26 = local_24.opCall();
    if (local_26)
    {
        const FLevelConfigInstance& local_28 = local_26.GetLevelUnitConfigInstance();
        if (FInstancedStruct::GetPtr(local_28.GetConfigData()).opCall())
        {
            return TConstRawPtr<FVirtualConfigData>();
        }
    }
    Get local_40;
    const FC_ConstMonsterSpawnerConfig& local_42 = local_40.opCall();
    if (local_42)
    {
        return TConstRawPtr<FVirtualConfigData>(local_42.Config);
    }
    return TConstRawPtr<FVirtualConfigData>();
}
void AppendRulesFromSpawnerConfig(const TConstRawPtr<FVirtualConfigData> &inout ConfigDataPtr, TArray<TDataObjectPtr<FBuffAttachRuleConfig>> &inout OutRules)
{
    if (!(ConfigDataPtr))
    {
        return;
    }
    const FInstancedStruct& local_4 = GetConfigData();
    if (FInstancedStruct::GetPtr<FClassicSpawnerConfig>(local_4).opCall())
    {
        return;
    }
    if (FInstancedStruct::GetPtr(local_4).opCall())
    {
        return;
    }
    if (FInstancedStruct::GetPtr(local_4).opCall())
    {
        return;
    }
    if (FInstancedStruct::GetPtr(local_4).opCall())
    {
        return;
    }
    if (FInstancedStruct::GetPtr(local_4).opCall())
    {
    }
    return;
}
void GetSpawnerBuffAttachRules(const FECSEntity &inout CreatureEntity, const FC_CreatureMeta &inout CreatureMeta, TArray<TDataObjectPtr<FBuffAttachRuleConfig>> &inout OutRules)
{
    FEcologyLevelEventBuffUtils::AppendGlobalBuffAttachRules(OutRules);
    TArray<TDataObjectPtr<FBuffAttachRuleConfig>> local_4;
    if ((!((CreatureMeta.RuntimeSpawnerEntity == ENTITY_ID_NULL))))
    {
        FEcologyLevelEventBuffUtils::AppendRulesFromSpawnerConfig(FEcologyLevelEventBuffUtils::ReadSpawnerConfigData(FECSEntity(CreatureMeta.RuntimeSpawnerEntity)), local_4);
    }
    if (local_4.Num() <= 0 && !((CreatureMeta.SpawnerConfigRef == ENTITY_ID_NULL)))
    {
        FEcologyLevelEventBuffUtils::AppendRulesFromSpawnerConfig(FEcologyLevelEventBuffUtils::ReadSpawnerConfigData(FECSEntity(CreatureMeta.SpawnerConfigRef)), local_4);
    }
    if (local_4.Num() <= 0)
    {
        Get local_20;
        const FC_MonsterSpawnedBySpawner& local_22 = local_20.opCall();
        if (local_22)
        {
            FEcologyLevelEventBuffUtils::AppendRulesFromSpawnerConfig(FEcologyLevelEventBuffUtils::ReadSpawnerConfigData(local_22.SpawnerEntity), local_4);
        }
    }
    FEcologyLevelEventBuffUtils::AppendConfiguredRules(local_4, OutRules);
    return;
}
void AppendLevelEventInitBuffs(const FECSEntity &inout CreatureEntity, const FC_CreatureMeta &inout CreatureMeta)
{
    TArrayConstIterator<FBuffAttachLevelEventMapping> local_78;
    const FBuffAttachListConfig& local_88;
    int local_94 = 0;
    TDataObjectPtr<FLevelEventInfoConfigBase> local_24 = FEcologyLevelEventBuffUtils::GetLevelEventInfoForCreature(CreatureEntity, CreatureMeta);
    if (!(local_24))
    {
        return;
    }
    EBuffAttachConditionType local_50 = EBuffAttachConditionType(0);
    if (!(FEcologyLevelEventBuffUtils::TryGetAttachConditionType(local_24, local_50)))
    {
        return;
    }
    TArray<TDataObjectPtr<FBuffAttachRuleConfig>> local_56;
    FEcologyLevelEventBuffUtils::GetSpawnerBuffAttachRules(CreatureEntity, CreatureMeta, local_56);
    if (local_56.Num() <= 0)
    {
        return;
    }
    for (auto& local_72 : local_56)
    {
        if (!(local_72))
        {
            continue;
        }
        for (; local_78.CanProceed;)
        {
            const FBuffAttachLevelEventMapping& local_86 = local_78.Proceed();
            if (!(FEcologyLevelEventBuffUtils::DoesMappingMatchLevelEvent(local_86, local_24, EBuffAttachConditionType(local_50))))
            {
                continue;
            }
            if (local_88.Buffs.Num() <= 0)
            {
                continue;
            }
            for (auto& local_108 : local_88.Buffs)
            {
                local_94.GetModify_InitBuffs().Add(local_108);
            }
        }
    }
    return;
}
}
