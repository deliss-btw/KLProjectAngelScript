
namespace FLevelUtils
{
UFUNCTION()
void AddExtraDropItemToEntity(FECSEntity &inout Entity, const UDataTable &inout DropItemTable, const FName &inout DropItemKey, const EDropTriggerType TriggerType = EDropTriggerType::Death)
{
    UDataTable local_20;
    FDropItemConfigBase local_16;
    if (Entity.IsValid() && (local_20 != nullptr) && !(DropItemKey.IsNone()) && DropItemTable.FindRow(DropItemKey, local_16))
    {
        Modify local_26;
        FC_DropItemSource& local_28 = local_26.opCall();
        if (local_28)
        {
            FDropItem local_54;
            TDataObjectPtr<FDropItemConfigBase> local_78;
            local_54.Item = local_78;
            local_54.TriggerType = TriggerType;
            local_28.DropItems.Add(local_54);
        }
    }
    return;
}
UFUNCTION()
void AddExtraDropItemToPrefab(AECSPrefab &inout Prefab, const UDataTable &inout DropItemTable, const FName &inout DropItemKey)
{
    UDataTable local_4;
    if (local_4 != nullptr && !(DropItemKey.IsNone()))
    {
        FECSEntity local_10 = ECS::GetPrefabEntity(Prefab);
        if (local_10)
        {
            FLevelUtils::AddExtraDropItemToEntity(local_10, DropItemTable, DropItemKey, EDropTriggerType(0));
        }
    }
    return;
}
UFUNCTION()
void RegisterEntityAttributeChanged(const FECSEntity &inout SpecificEntity, const ELevelListeningAttributeType AttributeType, const FEntityAttributeChangedDelegate &inout Callback)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
UFUNCTION()
void UnRegisterEntityAttributeChanged(const FECSEntity &inout SpecificEntity, const ELevelListeningAttributeType AttributeType, const FEntityAttributeChangedDelegate &inout Callback)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
UFUNCTION()
void SendCustomLevelEvent(const FECSEntity &inout Entity, const FName &inout CustomName)
{
    FFPTime local_8 = FFPTime(-1);
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    0.CustomName = CustomName;
    return;
}
void SendCustomLevelValueEvent(const FName &inout CustomName, const int Count)
{
    FFPTime local_8 = FFPTime(-1);
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FCE_CustomLevelValueEvent local_12;
    local_12.CustomName = CustomName;
    local_12.Count = Count;
    return;
}
UFUNCTION()
void SendCustomTutorialLevelEvent(const FECSEntity &inout Entity, const FName &inout CustomName)
{
    FCE_CustomLevelEvent local_12;
    FFPTime local_8 = FFPTime(-1);
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (local_12)
    {
        local_12.CustomName = CustomName;
        local_12.bIsTutorialEvent = true;
    }
    return;
}
UFUNCTION()
FECSEntity CreateEntityByPrefabDeferred(const TSubclassOf<AECSPrefab> &inout Prefab, const FVector &inout Position, const FRotator &inout Rotation, const FEntityCreateFinishDelegate &inout OnCreateFinish, const EPrefabCollisionAlignment PrefabCollisionAlignment = EPrefabCollisionAlignment::Middle, const EECSRegType Reg = EECSRegType::ERT_Default)
{
    FECSEntity local_10 = ECS::RequestEntityByPrefabDeferred(Prefab, Position, Rotation, EPrefabCollisionAlignment(PrefabCollisionAlignment), EECSRegType(Reg), false);
    if (OnCreateFinish.IsBound())
    {
        ULevelEventManager::Get().RegisterEntityEntityCreateFinishCallback(local_10, OnCreateFinish);
    }
    return local_10;
}
UFUNCTION()
FECSEntity CreateLevelOwnedEntityByPrefabDeferred(const AKLLevelScriptActor LevelScriptActor, const TSubclassOf<AECSPrefab> &inout Prefab, const FVector &inout Position, const FRotator &inout Rotation, const bool bKeepAlive = false, const FEntityCreateFinishDelegate &inout OnCreateFinish = FEntityCreateFinishDelegate())
{
    FECSEntity local_8 = LevelScriptActor.RequestLevelOwnedEntityDeferred(Prefab, Position, Rotation, bKeepAlive);
    if (OnCreateFinish.IsBound())
    {
        ULevelEventManager::Get().RegisterEntityEntityCreateFinishCallback(local_8, OnCreateFinish);
    }
    return local_8;
}
UFUNCTION()
void SetEntityActiveByGroup(const AEntityGroupPrefab GroupPrefab, const bool bActive)
{
    bool local_1;
    if (GroupPrefab != nullptr)
    {
        if (!(ECS::GetPrefabEntity(GroupPrefab).IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Has local_14;
            local_1 = local_14.opCall();
        }
        if (local_1)
        {
            int local_22;
            for (auto& local_36 : local_22.EntityInfoList)
            {
                if (local_36.Entity.IsValid())
                {
                    local_36.Entity.SetActive(bActive, FFPTime(-1));
                }
            }
        }
    }
    return;
}
UFUNCTION()
int GetEntityRemainCountByGroup(const AEntityGroupPrefab GroupPrefab)
{
    bool local_1;
    if (GroupPrefab != nullptr)
    {
        if (!(ECS::GetPrefabEntity(GroupPrefab).IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Has local_14;
            local_1 = local_14.opCall();
        }
        if (local_1)
        {
            FC_EntityGroup local_22;
            return int(local_22.AliveCount);
        }
    }
    return 0;
}
UFUNCTION()
bool IsEntityInVolume(const UEntityOverlappingInterface Volume, const FECSEntity &inout Entity, const bool bIgnoreMount = false)
{
    bool local_17;
    FECSEntity local_4 = Entity;
    Get local_8;
    const FC_PlayerController& local_10 = local_8.opCall();
    if (local_10)
    {
        local_4 = local_10.GetPlayerPawnEntity();
    }
    if (!(bIgnoreMount))
    {
        local_17 = false;
    }
    else
    {
        Has local_16;
        local_17 = local_16.opCall();
    }
    if (local_17)
    {
        Get local_22;
        local_4 = local_22.opCall().GetDriverEntity();
    }
    AActor local_24 = (Cast<AActor>(Volume));
    if (local_24 == nullptr)
    {
        return false;
    }
    if (local_4.IsValid())
    {
        Get local_30;
        const FC_Overlapping& local_32 = local_30.opCall();
        if (local_32)
        {
            for (auto& local_46 : local_32.OverlappingEntities)
            {
                local_46;
                Get local_50;
                const FC_InLevelTriggerPath& local_52 = local_50.opCall();
                if (local_52)
                {
                    AActor local_54 = local_52.TryGetActor();
                    if (local_54 != nullptr)
                    {
                        if (local_54 == local_24)
                        {
                            return true;
                        }
                    }
                }
            }
        }
    }
    return false;
}
AECSRegionVolume TryGetRegionVolumeActor(const FECSEntity &inout Entity)
{
    AECSRegionVolume local_2;
    if (Entity.IsValid())
    {
        Get local_8;
        if (local_8.opCall())
        {
            AActor local_12;
            local_2 = (Cast<AECSRegionVolume>(local_12));
        }
        else
        {
            Get local_18;
            const FC_InLevelTriggerPath& local_20 = local_18.opCall();
            if (local_20)
            {
                local_2 = (Cast<AECSRegionVolume>(local_20.TryGetActor()));
            }
        }
        if (local_2 != nullptr)
        {
            return local_2;
        }
    }
    return nullptr;
}
AECSRegionVolume TryGetWeatherRegionVolumeActor(const FECSEntity &inout Entity)
{
    AECSRegionVolume local_2 = FLevelUtils::TryGetRegionVolumeActor(Entity);
    if ((local_2 != nullptr && local_2.bAffectWeather))
    {
        return local_2;
    }
    return nullptr;
}
UFUNCTION()
TDataObjectPtr<FLevelInfoConfig> GetCurrentLevelInfoConfig(const UWorld InWorld = nullptr)
{
    UWorld local_2;
    AAS_ECSWorldSettings local_12;
    if (InWorld == nullptr)
    {
        local_2 = ECS::GetUEWorld();
    }
    if (local_2 != nullptr)
    {
        local_12 = (Cast<AAS_ECSWorldSettings>(local_2.GetWorldSettings()));
        if (local_12 != nullptr)
        {
            return local_12.LevelInfoConfig;
        }
    }
    return TDataObjectPtr<FLevelInfoConfig>(nullptr);
}
UFUNCTION()
ELevelType GetCurrentLevelType()
{
    int local_50 = 0;
    if (FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
    {
        return ELevelType(local_50);
    }
    return ELevelType(0);
}
UFUNCTION()
void FinishCurrentCommission(const bool bSuccess = true)
{
    int local_63 = 0;
    int local_76 = 0;
    FString local_12 = FString().Append("Level call FinishCurrentCommission");
    FString local_8;
    if (bSuccess)
    {
        local_8 = "Success";
    }
    else
    {
        local_8 = "Failed";
    }
    XLog(ELog(22), (local_12 + local_8));
    if (FLevelUtils::GetCurrentLevelInfoConfig(nullptr) && (local_63 == 3 || (local_63 == 5)))
    {
        FECSWorldPtr local_70 = ECS::GetECSWorld();
        CommissionUtils::FinishCommission(local_76.CommissionConfig, bSuccess, ECommissionFailReason(4));
    }
    return;
}
TDataObjectPtr<FMonsterMainConfig> TryGetMonsterConfigFromObjective(const TDataObjectPtr<FObjectiveSingleConfig> &inout SingleObjective)
{
    bool local_111 = false;
    TDataObjectPtr<FMonsterMainConfig> __return;
    if (!(SingleObjective))
    {
        return TDataObjectPtr<FMonsterMainConfig>();
    }
    CastTo local_54;
    if (!(local_54.opCall()))
    {
        return TDataObjectPtr<FMonsterMainConfig>();
    }
    FInstancedStruct::GetPtr local_106;
    if (local_106.opCall() && local_111)
    {
    }
    else
    {
        __return = TDataObjectPtr<FMonsterMainConfig>();
    }
    return __return;
}
TDataObjectPtr<FWeatherConfig> GetCurrentCommissionWeatherConfig()
{
    if (!(ECS::GetECSWorld().IsValid()))
    {
        return TDataObjectPtr<FWeatherConfig>();
    }
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_56;
    const FCS_CommissionDSGlobalInfo& local_58 = local_56.opCall();
    if (local_58)
    {
        return local_58.StartWeatherConfig;
    }
    return local_28;
}
TDataObjectPtr<FCommissionTimeConfig> GetCurrentCommissionTimeConfig()
{
    if (!(ECS::GetECSWorld().IsValid()))
    {
        return TDataObjectPtr<FCommissionTimeConfig>();
    }
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_56;
    const FCS_CommissionDSGlobalInfo& local_58 = local_56.opCall();
    if (local_58)
    {
        return local_58.SelectedCommissionTimeConfig;
    }
    return local_28;
}
TArray<TDataObjectPtr<FMonsterMainConfig>> GetTargetMonsterConfigsFromObjective(const TDataObjectPtr<FObjectiveConfig> &inout TargetObjective)
{
    TArray<TDataObjectPtr<FMonsterMainConfig>> local_4;
    if (!(TargetObjective.IsSet()))
    {
        return local_4;
    }
    CastTo local_10;
    TDataObjectPtr<FObjectiveSingleConfig> local_34 = local_10.opCall();
    if (local_34)
    {
        TDataObjectPtr<FMonsterMainConfig> local_82 = FLevelUtils::TryGetMonsterConfigFromObjective(local_34);
        if (local_82)
        {
            local_4.Add(local_82);
        }
    }
    else
    {
        CastTo local_112;
        if (local_112.opCall())
        {
            for (auto& local_174 : GetChildObjectives())
            {
                TDataObjectPtr<FMonsterMainConfig> local_106 = FLevelUtils::TryGetMonsterConfigFromObjective(local_174);
                if (local_106)
                {
                    local_4.Add(local_106);
                }
            }
        }
    }
    return local_4;
}
TArray<TDataObjectPtr<FMonsterMainConfig>> GetTargetMonsterConfigsFromCommission(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    TArrayConstIterator<FCommissionMonsterDisplayInfo> local_24;
    TArray<TDataObjectPtr<FMonsterMainConfig>> local_4;
    if (!(CommissionConfig))
    {
        return local_4;
    }
    local_4 = FLevelUtils::GetTargetMonsterConfigsFromObjective(GetCommissionTargetObjective());
    if (local_4.Num() > 0)
    {
        XLog(ELog(22), FString().Append("GetTargetMonsterConfigs: Found ").Append(local_4.Num()).Append(" MonsterConfig(s) from CommissionTargetObjective"));
        return local_4;
    }
    for (; local_24.CanProceed;)
    {
        const FCommissionMonsterDisplayInfo& local_32 = local_24.Proceed();
        if (local_32.MonsterConfig)
        {
            local_4.Add(local_32.MonsterConfig);
        }
    }
    if (local_4.Num() > 0)
    {
        XLog(ELog(22), FString().Append("GetTargetMonsterConfigs: Fallback to ").Append(local_4.Num()).Append(" DisplayMonsters MonsterConfig(s)"));
    }
    return local_4;
}
UFUNCTION()
uint GetPlayerAreaID(const FECSEntity &inout PlayerEntity)
{
    int local_2 = 0;
    int local_12 = 0;
    if (!(PlayerEntity.IsValid()))
    {
        return 0;
    }
    Has local_6;
    bool local_1 = local_6.opCall();
    if (local_1)
    {
        if (FECSEntity(local_12.GetRegionEntity()).IsValid())
        {
            Get local_20;
            const FC_RegionWorldAreaConfig& local_22 = local_20.opCall();
            if (local_22)
            {
                if (local_22.GetWorldAreaConfig().IsSet())
                {
                    return local_2;
                }
            }
        }
    }
    return 0;
}
}
