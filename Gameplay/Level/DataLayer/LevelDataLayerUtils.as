
const FConsoleVariable CVar_Level_UseTagQueryDataLayerInit = FConsoleVariable();

namespace FLevelDataLayerUtils
{
bool BuildMapUrlFromLevelKey(const int LevelKey, FString &inout OutUrl)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
bool TSetIntersect(const TSet<EKLDataLayerFilterTags> &inout Set1, const TSet<EKLDataLayerFilterTags> &inout Set2)
{
    for (auto local_18 : Set1)
    {
        if (Set2.Contains(local_18))
        {
            return true;
        }
    }
    return false;
}
FString GetDebugTagString(const TSet<EKLDataLayerFilterTags> &inout Tags)
{
    FString local_4;
    for (auto local_22 : Tags)
    {
        local_4 += FString().Append(" ").Append(local_22);
    }
    return local_4;
}
void OverrideInitialDataLayers(const UWorld InWorld, const TArray<UKLDataLayerInstance> &inout DataLayerInstances)
{
    int local_2 = 0;
    int local_1 = CVar_Level_UseTagQueryDataLayerInit.GetInt();
    if (local_1 > 0)
    {
        FLevelDataLayerUtils::OverrideInitialDataLayersByTagQuery(InWorld, DataLayerInstances);
        return;
    }
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    AAS_ECSWorldSettings local_14 = (Cast<AAS_ECSWorldSettings>(InWorld.GetWorldSettings()));
    UDataLayerManager local_22 = InWorld.GetDataLayerManager();
    if ((!((local_22 != nullptr))))
    {
        return;
    }
    TSet<EKLDataLayerFilterTags> local_42;
    TSet<TSoftClassPtr<AKLLevelScriptActor>> local_62;
    if (local_14.LevelInfoConfig)
    {
        XLog(ELog(22), FString().Append("[").Append(int(InWorld.GetNetMode())).Append("] Init DataLayer LevelInfoConfig Tags: ").Append(FLevelDataLayerUtils::GetDebugTagString(local_42)));
    }
    ECS::GetECSWorldOfObject(InWorld).IsValid();
    Get local_78;
    const FCS_CommissionDSGlobalInfo& local_80 = local_78.opCall();
    if (local_80)
    {
        if (local_80.IntrusionPolicyConfig.IsSet())
        {
            XLog(ELog(22), FString().Append("[").Append(int(InWorld.GetNetMode())).Append("] Init DataLayer Add IntrusionPolicy Extra LoadDatalayerClasses: ").Append(local_1));
        }
        if (local_80.SpawnAreaConfig.IsSet())
        {
            XLog(ELog(22), FString().Append("[").Append(int(InWorld.GetNetMode())).Append("] Init DataLayer Add SpawnArea Extra LoadDatalayerClasses: ").Append(local_1));
            XLog(ELog(22), FString().Append("[").Append(int(InWorld.GetNetMode())).Append("] Init DataLayer Add SpawnArea Extra LoadDatalayerTags: ").Append(local_2));
        }
        if (local_80.EntryRuleConfig.IsSet())
        {
            XLog(ELog(22), FString().Append("[").Append(int(InWorld.GetNetMode())).Append("] Init DataLayer Add EntryRule Extra LoadDatalayerClasses: ").Append(local_2));
        }
    }
    for (auto local_94 : DataLayerInstances)
    {
        if (!(local_94.IsSubDataLayer()) && FLevelDataLayerUtils::TSetIntersect(local_42, local_94.LoadFilterTags))
        {
            FLevelDataLayerUtils::SetDataLayerState(local_22, local_94, EDataLayerRuntimeState(2), false);
            XLog(ELog(22), FString().Append("[").Append(int(InWorld.GetNetMode())).Append("] Init DataLayer Activated Tagged Level:  ").Append(local_94.GetDataLayerShortName()));
        }
        else
        {
            if (!(local_94.IsSubDataLayer()) && local_62.Contains(TSoftClassPtr<AKLLevelScriptActor>(local_94.KLLevelClass)))
            {
                FLevelDataLayerUtils::SetDataLayerState(local_22, local_94, EDataLayerRuntimeState(2), false);
                XLog(ELog(22), FString().Append("[").Append(int(InWorld.GetNetMode())).Append("] Init DataLayer Activated LevelClass: ").Append(local_94.GetDataLayerShortName()));
            }
            else
            {
                FLevelDataLayerUtils::SetDataLayerState(local_22, local_94, EDataLayerRuntimeState(0), false);
                XLog(ELog(22), FString().Append("[").Append(int(InWorld.GetNetMode())).Append("] Init DataLayer Unload Level: ").Append(local_94.GetDataLayerShortName()));
            }
        }
    }
    return;
}
void OverrideInitialDataLayersByTagQuery(const UWorld InWorld, const TArray<UKLDataLayerInstance> &inout DataLayerInstances)
{
    AAS_ECSWorldSettings local_2 = (Cast<AAS_ECSWorldSettings>(InWorld.GetWorldSettings()));
    UDataLayerManager local_10 = InWorld.GetDataLayerManager();
    if ((!((local_10 != nullptr))))
    {
        return;
    }
    FKLGameplayTagQuery local_30;
    if (local_2.LevelInfoConfig)
    {
        XLog(ELog(22), FString().Append("[").Append(int(InWorld.GetNetMode())).Append("] Init DataLayer by TagQuery, IsEmpty: ").Append(local_30.IsEmpty()).Append(", Desc: ").Append(local_30.GetDescription()));
    }
    for (auto local_50 : DataLayerInstances)
    {
        if (local_50.IsSubDataLayer())
        {
            FLevelDataLayerUtils::SetDataLayerState(local_10, local_50, EDataLayerRuntimeState(0), false);
            XLog(ELog(22), FString().Append("[").Append(int(InWorld.GetNetMode())).Append("] Init DataLayer (TagQuery) Unload SubDataLayer: ").Append(local_50.GetDataLayerShortName()));
            continue;
        }
        if (!(local_30.IsEmpty()) && (local_50.GroupTags.Num() > 0) && local_30.Matches(local_50.GroupTags))
        {
            FLevelDataLayerUtils::SetDataLayerState(local_10, local_50, EDataLayerRuntimeState(2), false);
            XLog(ELog(22), FString().Append("[").Append(int(InWorld.GetNetMode())).Append("] Init DataLayer (TagQuery) Activated by GroupTags: ").Append(local_50.GetDataLayerShortName()));
        }
        else
        {
            FLevelDataLayerUtils::SetDataLayerState(local_10, local_50, EDataLayerRuntimeState(0), false);
            XLog(ELog(22), FString().Append("[").Append(int(InWorld.GetNetMode())).Append("] Init DataLayer (TagQuery) Unload Level: ").Append(local_50.GetDataLayerShortName()));
        }
    }
    return;
}
UFUNCTION()
bool IsWaitingForStreaming(const UWorld InWorld, const bool bChckAllStreaming = false)
{
    UWorldPartitionSubsystem local_2 = UWorldPartitionSubsystem::Get();
    if ((!((local_2 != nullptr))))
    {
        return false;
    }
    return !((local_2.IsAllDataLayerStreamingCompleted() && (!(bChckAllStreaming) || local_2.IsAllStreamingCompleted())));
}
void SetDatalayerRuntimeStateByName(const UWorld InWorld, const FName &inout DatalayerName, const EDataLayerRuntimeState State)
{
    UDataLayerManager local_4 = InWorld.GetDataLayerManager();
    if ((!((local_4 != nullptr))))
    {
        return;
    }
    const UDataLayerInstance local_10 = local_4.GetDataLayerInstanceFromName(DatalayerName);
    if ((!((local_10 != nullptr))))
    {
        return;
    }
    FLevelDataLayerUtils::SetDataLayerState(local_4, local_10, EDataLayerRuntimeState(State), false);
    return;
}
void SetDataLayerState(const UDataLayerManager DataLayerManager, const UDataLayerInstance InDataLayerInstance, const EDataLayerRuntimeState InState, const bool bInIsRecursive = false)
{
    UKLDataLayerInstance local_4 = (Cast<UKLDataLayerInstance>(InDataLayerInstance));
    if (local_4 != nullptr)
    {
        KLDataLayer::SetDataLayerRuntimeStateByLBPClass(__GetWorldContext(), local_4.KLLevelClass);
    }
    else
    {
        DataLayerManager.SetDataLayerInstanceRuntimeState(InDataLayerInstance, EDataLayerRuntimeState(InState), false);
    }
    return;
}
EDataLayerRuntimeState GetDatalayerRuntimeStateByName(const UWorld InWorld, const FName &inout DatalayerName)
{
    UDataLayerManager local_4 = InWorld.GetDataLayerManager();
    if ((!((local_4 != nullptr))))
    {
        return EDataLayerRuntimeState(0);
    }
    const UDataLayerInstance local_10 = local_4.GetDataLayerInstanceFromName(DatalayerName);
    if ((!((local_10 != nullptr))))
    {
        return EDataLayerRuntimeState(0);
    }
    return local_4.GetDataLayerInstanceEffectiveRuntimeState(local_10);
}
bool IsActorInActivatedDataLayer(const AActor Actor)
{
    FName local_5 = FKLLevelUtils::GetActorKLDataLayerName(Actor, false);
    if ((local_5 == NAME_None))
    {
        return true;
    }
    return (int((FLevelDataLayerUtils::GetDatalayerRuntimeStateByName(Actor.GetWorld(), local_5))) == 2);
}
}
