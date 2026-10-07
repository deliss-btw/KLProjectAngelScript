
namespace FEcologySceneInfoUtils
{
    const float32 MinMoveDistance = 25f;
    const float32 SqrMinMoveDistance = 625f;

int64 CombineVoxelCoordToIndex(const int X, const int Y, const int Z)
{
    int64 local_2 = X;
    int64 local_4 = X << 48;
    int64 local_8 = Y << 32;
    local_4 = local_4 + local_8;
    int64 local_8_2 = Z << 16;
    return local_4 + local_8_2;
}
void SplitVoxelCoordIndex(const int64 Key, int &inout OutX, int &inout OutY, int &inout OuuZ)
{
    int local_4 = (Key >> 48) & 65535;
    OutX = local_4;
    int local_4_2 = (Key >> 32) & 65535;
    OutY = local_4_2;
    int local_4_3 = (Key >> 16) & 65535;
    OuuZ = local_4_3;
    return;
}
void RemoveFormVoxelScene(const FECSEntity &inout Entity, FC_EcologyVoxelUnit &inout VoxelSceneInfo)
{
    int local_2 = 0;
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (!(local_2))
    {
        return;
    }
    FVoxelScope local_30 = FVoxelScope(VoxelSceneInfo.LastScope);
    FVoxelIterator local_72 = local_30.Iterator();
    for (; local_72.CanProceed;)
    {
        local_2.VoxelScene.RemoveEntity(local_72.Proceed().Current, Entity.GetId(), VoxelSceneInfo.Slot);
    }
    return;
}
void UpdateEntityToVoxelScene(const FECSEntity &inout Entity, const FVector &inout TargetPosition, FC_EcologyVoxelUnit &inout VoxelSceneInfo, const bool bForceUpdate = false)
{
    int local_44 = 0;
    if (!(bForceUpdate) && (TargetPosition.DistSquared2D(VoxelSceneInfo.LastScope.GetCenter()) < 625.0))
    {
        return;
    }
    FBox local_42 = FBox::BuildAABB(TargetPosition, VoxelSceneInfo.AABBExtent);
    FECSWorldPtr local_46 = ECS::GetECSWorld();
    if (!(local_44))
    {
        return;
    }
    FVoxelScope local_70 = FVoxelScope(VoxelSceneInfo.LastScope);
    FVoxelIterator local_112 = local_70.Iterator();
    for (; local_112.CanProceed;)
    {
        local_44.VoxelScene.RemoveEntity(local_112.Proceed().Current, Entity.GetId(), VoxelSceneInfo.Slot);
    }
    FEcologyVoxelSceneUnitSummary local_176;
    local_176.UnitEntity = Entity.GetId();
    local_176.Box = local_42;
    local_176.SceneSpaceCost = int(VoxelSceneInfo.SceneSpaceCost);
    FVoxelIterator local_154 = FVoxelScope(local_42).Iterator();
    for (; local_154.CanProceed;)
    {
        local_44.VoxelScene.AddEntity(local_154.Proceed().Current, local_176, VoxelSceneInfo.Slot);
    }
    VoxelSceneInfo.LastScope = local_42;
    return;
}
int GetUnitCountInCell(FCS_EcologyScriptGlobalContext &inout Context, const FVoxelPosition &inout Position, const EEcologyVoxelUnitSlot Slot)
{
    if (!(Context))
    {
        return 0;
    }
    return Context.VoxelScene.GetUnitCountInCell(Position, EEcologyVoxelUnitSlot(Slot));
}
TRawPtr<FGameplayTagBitContainer> FindDOTTagBitContainer(FCS_EcologyDataCacheContext &inout Context, const FName &inout WeatherName, const int DaySegment)
{
    FName local_4 = FName(WeatherName, DaySegment);
    if (Context.DataCache.DOTTagConatinerCache.Contains(local_4))
    {
        return TRawPtr<FGameplayTagBitContainer>(Context.DataCache.DOTTagConatinerCache[local_4]);
    }
    FGameplayTagBitContainer& local_12 = Context.DataCache.DOTTagConatinerCache.FindOrAdd(local_4);
    if (FWeatherUtils::GetWeatherConfig(WeatherName))
    {
    }
    local_12.Append(Context.DataCache.TimeGameplayTags[DaySegment]);
    return TRawPtr<FGameplayTagBitContainer>(local_12);
}
FName GetWeatherByVolume(const TSoftObjectPtr<AECSRegionVolume> &inout WeatherSource)
{
    FECSEntity local_8 = FWeatherUtils::GetWeatherRegionEntityBySoftPtr(WeatherSource);
    if (local_8.IsValid())
    {
        return FWeatherUtils::GetWeatherNameFromRegionEntity(local_8);
    }
    return FEcologySceneInfoUtils::GetGlobalWeather();
}
FName GetWeatherByPosition(const FCS_EcologyScriptGlobalContext &inout Context, const FVector &inout Position)
{
    int local_22 = 0;
    bool local_43 = false;
    AECSVolumeBase local_46;
    FVoxelPosition local_10 = FVoxelPosition(Position);
    if (Context)
    {
        int local_21;
        const FEcologyVoxelSceneRegion& local_20;
        bool local_11 = !(Context.VoxelScene.Find(local_10));
        if (local_11)
        {
            return FEcologySceneInfoUtils::GetGlobalWeather();
        }
        local_21 = -1;
        FName local_24(NAME_None);
        for (auto& local_42 : local_20.VolumeData)
        {
            local_42;
            local_43 = local_43 && local_11;
            if (local_43)
            {
                if (local_22 > local_21 && local_46.EncompassesPoint(Position, 0.0f))
                {
                    local_21 = local_22;
                    FECSEntity local_52;
                    local_24 = FWeatherUtils::GetWeatherNameFromRegionEntity(local_52);
                }
            }
        }
        if ((!((local_24 == NAME_None))))
        {
            return local_24;
        }
    }
    return FEcologySceneInfoUtils::GetGlobalWeather();
}
FName GetGlobalWeather()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    const FECSEntity& local_10 = 0.GetRegionEntity();
    if (!(local_10.IsValid()))
    {
        return NAME_None;
    }
    return FWeatherUtils::GetWeatherNameFromRegionEntity(local_10);
}
int GetCurrentTimeSegments(const FCS_EcologyScriptGlobalContext &inout Context)
{
    return Context.WorldState.TimeSegments;
}
int CombineDayTime(const int Hours, const int Minutes)
{
    int local_2 = Hours * 4;
    return (local_2 + FMath::IntegerDivisionTrunc(Minutes, 15));
}
bool CheckTimeSegmentsHasElementsChange(const int LeftTimeSegments, const int RightTimeSegments)
{
    int local_2 = 0;
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    FECSWorldPtr local_4_2 = ECS::GetECSWorld();
    FGameplayTagContainer local_18 = FGameplayTagContainer(FEcologySceneInfoUtils::GetTimeSegmentsGameplayTagContaiers(local_2, LeftTimeSegments));
    FGameplayTagContainer local_30 = FGameplayTagContainer(FEcologySceneInfoUtils::GetTimeSegmentsGameplayTagContaiers(local_2, RightTimeSegments));
    if (local_18.Num() == local_30.Num() && local_18.HasAll(local_30))
    {
        return false;
    }
    return true;
}
TDataObjectPtr<FSpawnerCountRatioDefinitionRow> FindSpawnRatioDataByFlock(FCS_EcologyScriptGlobalContext &inout Context, const FECSEntity &inout Entity, const FC_EcologyFlockComponent &inout FlockComponent)
{
    if (!(FECSEntity(FlockComponent.ActivityTarget.MainTargetResource)))
    {
        return TDataObjectPtr<FSpawnerCountRatioDefinitionRow>();
    }
    Get local_62;
    FVector local_68 = local_62.opCall().GetPosition();
    int local_73 = FEcologySceneInfoUtils::GetCurrentTimeSegments(Context);
    Get local_78;
    TDataObjectPtr<FEcologyResourceDefinitionRow> local_102 = local_78.opCall().ResourceType;
    FDataObjectPtr local_174;
    local_174;
    return TDataObjectPtr<FSpawnerCountRatioDefinitionRow>();
}
TDataObjectPtr<FSpawnerCountRatioDefinitionRow> FindSpawnRatioData(const TDataObjectPtr<FCreatureDefinitionRow> &inout Creature, const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout Resource, const FName &inout WeatherName, const int TimeSegments)
{
    int local_10 = 0;
    int local_2 = 1;
    int local_1 = local_2;
    FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"FindSpawnRatioData"), false);
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    TDataObjectPtr<FEcologyResourceDefinitionRow> local_34 = TDataObjectPtr<FEcologyResourceDefinitionRow>(nullptr);
    FEcologySpawnerRatioCacheKey local_134 = FEcologySpawnerRatioCacheKey(Creature, local_34, WeatherName, TimeSegments);
    if (local_10.DataCache.EcologySpawnerRatioCache.Contains(local_134))
    {
        if (FDataObjectPtr(local_10.DataCache.EcologySpawnerRatioCache[local_134]))
        {
            return TDataObjectPtr<FSpawnerCountRatioDefinitionRow>();
        }
    }
    TDataObjectPtr<FSpawnerCountRatioDefinitionRow> local_206 = FEcologySceneInfoUtils::FindSpawnRatioDataWithoutCache(Creature, local_34, WeatherName, TimeSegments);
    local_10.DataCache.EcologySpawnerRatioCache.Add(local_134, local_206.opImplConv());
    return local_206;
}
void FindActivityResourceType(const TDataObjectPtr<FEcologyCreatureDefinitionRow> &inout Creature, const FName &inout WeatherName, const int TimeSegments, TSet<TDataObjectPtr<FEcologyResourceDefinitionRow>> &inout OutResourceTypes)
{
    float32 local_182 = 0.0f;
    TSet<FDataObjectPtr> local_20 = FEcologyUtils::FindAllCareResourceType(Creature);
    for (auto& local_60 : local_20)
    {
        TDataObjectPtr<FEcologyResourceDefinitionRow> local_84 = TDataObjectPtr<FEcologyResourceDefinitionRow>(local_60);
        TDataObjectPtr<FCreatureDefinitionRow> local_108 = TDataObjectPtr<FCreatureDefinitionRow>(Creature.opImplConv());
        if (!(!((FEcologySceneInfoUtils::FindSpawnRatioData(local_108, local_84, WeatherName, TimeSegments) == nullptr))) || (local_182 > 0.0f && (local_182 > 0.0f)))
        {
            OutResourceTypes.Add(TDataObjectPtr<FEcologyResourceDefinitionRow>(local_60));
        }
    }
    return;
}
const FGameplayTagContainer& GetTimeSegmentsGameplayTagContaiers(const FCS_EcologyDataCacheContext &inout Context, const int TimeSegments)
{
    const FGameplayTagContainer& local_2 = Context.TimeGameplayTags[TimeSegments];
    return local_2;
}
TDataObjectPtr<FSpawnerCountRatioDefinitionRow> FindSpawnRatioDataWithoutCache(const TDataObjectPtr<FCreatureDefinitionRow> &inout Creature, const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout Resource, const FName &inout WeatherName, const int TimeSegments)
{
    int local_78 = 0;
    TDataObjectPtr<FSpawnerCountRatioDefinitionRow> local_48 = TDataObjectPtr<FSpawnerCountRatioDefinitionRow>(nullptr);
    TDataObjectPtr<FSpawnerCountRatioDefinitionRow> local_24 = local_48;
    int local_73 = -1;
    FECSWorldPtr local_76 = ECS::GetECSWorld();
    TDataObjectIterator<FSpawnerCountRatioDefinitionRow> local_94;
    for (; local_94; )
    {
        const FSpawnerCountRatioDefinitionRow& local_98 = local_94.GetData();
        if (int(local_98.Priority) <= local_73)
        {
        }
        else
        {
            bool local_273;
            bool local_223;
            TDataObjectPtr<FCreatureDefinitionRow> local_124;
            local_124 = local_98.GetCreature();
            bool local_95 = (local_124 == Creature.opImplConv());
            bool local_99 = !(Resource) || !(local_98.GetResource());
            if (local_99)
            {
                local_99 = true;
            }
            else
            {
                TDataObjectPtr<FEcologyResourceDefinitionRow> local_198;
                local_198 = local_98.GetResource();
                local_99 = (local_198 == Resource.opImplConv());
            }
            local_223 = true;
            if (local_98.WeatherElementTag.Num() != 0)
            {
                TDataObjectPtr<FWeatherConfig> local_248 = FWeatherUtils::GetWeatherConfig(WeatherName);
                if (!(local_248.IsSet()) || !(local_248.opArrow().WeatherElements.HasAll(local_98.WeatherElementTag)))
                {
                    local_223 = false;
                }
            }
            local_273 = true;
            if (local_98.DaySegmentsTag.Num() != 0 && local_78.DataCache.TimeGameplayTags.Contains(TimeSegments))
            {
                if (!(local_78.DataCache.TimeGameplayTags[TimeSegments].HasAll(local_98.DaySegmentsTag)))
                {
                    local_273 = false;
                }
            }
            if (((local_95 && local_99) && local_223) && local_273)
            {
                local_73 = int(local_98.Priority);
                local_24 = local_48;
            }
        }
        local_94.Next();
    }
    return local_24;
}
void UpdateTimeToWorldState(FCS_EcologyScriptGlobalContext &inout Context)
{
    int local_1;
    int local_2;
    int local_3;
    int local_10 = 0;
    int local_5 = FTimeOfDayUtils::GetCurrentTimeOfDayInSeconds();
    FTimeOfDayUtils::GetTimeOfDayHourAndMinute(local_5, local_1, local_2, local_3);
    int local_4 = FEcologySceneInfoUtils::CombineDayTime(local_2, local_3);
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    if (local_4 != Context.WorldState.TimeSegments)
    {
        Context.WorldState.TimeSegments = local_4;
        const FGameplayTagContainer& local_14 = local_10.DataCache.TimeGameplayTags[local_4];
        if (local_14.Num() != Context.WorldState.TimeGameplayTags.Num() || !(Context.WorldState.TimeGameplayTags.HasAll(local_14)))
        {
            FCE_EcologyTimeSegmentsChangedEvent local_24;
            FFPTime local_22 = FFPTime(-1);
            FECSWorldPtr local_8_2 = ECS::GetECSWorld();
            local_24.PreviousTimeSegments = Context.WorldState.TimeSegments;
            local_24.NewTimeSegments = local_4;
            local_24.bTimeElementsChanged = true;
            Context.WorldState.TimeGameplayTags = local_14;
            FDebugEcologyRefreshUtils::ForceRefreshAllSpawner();
        }
    }
    return;
}
void InternalRequestResource(const FResourceSearchRequest &inout Request, const FBox &inout SearchBox, FCS_EcologyScriptGlobalContext &inout Context, TArray<FEntitySearchResult> &inout OutResult)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<FEntitySearchResult> RequestResource(const FResourceSearchRequest &inout Request)
{
    TArray<FEntitySearchResult> local_4;
    int local_6 = 0;
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    if (!(local_6))
    {
        return local_4;
    }
    FBox local_52 = FBox::BuildAABB(Request.Center, FVector(int(Request.SearchRadius)));
    if (Request.IncludeVolumes.Num() > 0)
    {
        FBox local_28 = FBox::BuildAABB(Request.Center, FVector(0.0));
        for (auto& local_82 : Request.IncludeVolumes)
        {
            local_28 += local_82.GetBounds();
        }
        FVector local_88(local_52.Min);
        local_88.X = FMath::Max(local_52.Min.X, local_28.Min.X);
        local_88.Y = FMath::Max(local_52.Min.Y, local_28.Min.Y);
        local_88.Z = FMath::Max(local_52.Min.Z, local_28.Min.Z);
        FVector local_98(local_52.Max);
        local_98.X = FMath::Min(local_52.Max.X, local_28.Max.X);
        local_98.Y = FMath::Min(local_52.Max.Y, local_28.Max.Y);
        local_98.Z = FMath::Min(local_52.Max.Z, local_28.Max.Z);
        local_52 = FBox(local_88, local_98);
    }
    FEcologySceneInfoUtils::InternalRequestResource(Request, local_52, local_6, local_4);
    return local_4;
}
int RequestCreature(const FECSEntity &inout Requester, const FCreatureSearchRequest &inout Request, TArray<FEntitySearchResult> &inout Result, const bool bOnlyFirst = false)
{
    FECSEntity local_4 = Requester;
    if (!(Requester.IsValid()))
    {
        local_4 = FECSEntity(ENTITY_ID_NULL);
    }
    FECSRuntimeQuery local_52 = FECSRuntimeQueryHelper::MakeRuntimeQuery(local_4, EECSQueryRegsitryType(3), false);
    Include local_96;
    local_96.opCall();
    Include local_100;
    local_100.opCall();
    if (int(Request.SpecialTagFilterType) == 1)
    {
        Include local_108;
        local_108.opCall();
    }
    FVector local_114(FVector::ZeroVector);
    Get local_118;
    const FC_Transform& local_120 = local_118.opCall();
    if (local_120)
    {
        local_114 = local_120.GetPosition();
    }
    float32 local_122 = Request.Radius * Request.Radius;
    int local_124 = 0;
    int local_102 = bOnlyFirst ? 1 : int(Request.MaxCount);
    FECSRuntimeQueryIterator local_148 = local_52.Iterator();
    for (; local_148.CanProceed;)
    {
        const FECSEntity& local_172 = local_148.Proceed();
        if (local_122 > 1.0f)
        {
            if (local_114.DistSquared(local_120.GetPosition()) > local_122)
            {
                continue;
            }
        }
        if (!(FEcologySceneInfoUtils::CheckCreatureByRequester(local_172, Request, local_114)))
        {
            continue;
        }
        ++local_124;
        Result.Add(FEntitySearchResult(local_172.GetId()));
        if ((local_102 > 0 && (local_124 >= local_102)))
        {
            break;
        }
    }
    return local_124;
}
bool CheckCreatureByRequester(const FECSEntity &inout TargetEntity, const FCreatureSearchRequest &inout Request, const FVector &inout RequesterPosition)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
AECSRegionVolume FindECSRegionVolumeByPosition(const FCS_EcologyScriptGlobalContext &inout Context, const FVector &inout Position)
{
    const FRegionVolumeSummary& local_38;
    AECSRegionVolume local_44;
    if (Context.VoxelScene.Find(FVoxelPosition(Position)))
    {
        const FEcologyVoxelSceneRegion& local_18;
        for (auto& local_36 : local_18.VolumeData)
        {
            local_36;
            if (local_38.Volume.IsValid())
            {
                AECSVolumeBase local_40;
                local_44 = Cast<AECSRegionVolume>(local_40);
                if (local_44 != nullptr && local_44.QuickEncompassesPoint(Position))
                {
                    return local_44;
                }
            }
        }
    }
    return nullptr;
}
TDataObjectPtr<FWorldAreaConfig> GetWorldAreaConfigByPosition(const FECSWorldPtr &inout World, const FVector &inout Position)
{
    TDataObjectPtr<FWorldAreaConfig> local_24;
    const FCS_EcologyScriptGlobalContext& local_26 = FEcologyUtils::GetGlobalContext(World);
    if (local_26)
    {
        AECSRegionVolume local_30 = FEcologySceneInfoUtils::FindECSRegionVolumeByPosition(local_26, Position);
        if (local_30 != nullptr)
        {
            local_24 = local_30.AreaConfig;
        }
    }
    return local_24;
}
FECSEntity FindCombatRegionByPosition(const FCS_EcologyScriptGlobalContext &inout Context, const FVector &inout Position)
{
    const FRegionVolumeSummary& local_38;
    AECSRegionVolume local_46;
    if (Context.VoxelScene.Find(FVoxelPosition(Position)))
    {
        const FEcologyVoxelSceneRegion& local_18;
        for (auto& local_36 : local_18.VolumeData)
        {
            local_36;
            if (local_38.bIsCombatRegion && local_38.Volume.IsValid())
            {
                AECSVolumeBase local_42;
                local_46 = Cast<AECSRegionVolume>(local_42);
                if (local_46 != nullptr && local_46.QuickEncompassesPoint(Position))
                {
                    return FECSEntity(local_38.RegionEntityId);
                }
            }
        }
    }
    return ENTITY_NULL;
}
FECSEntity FindCombatRegionByEntity(const FECSEntity &inout Target)
{
    int local_12 = 0;
    if (!(Target))
    {
        return ENTITY_NULL;
    }
    Get local_6;
    const FC_Transform& local_8 = local_6.opCall();
    if (local_8)
    {
        FECSWorldPtr local_10 = Target.GetWorld();
        return FEcologySceneInfoUtils::FindCombatRegionByPosition(local_12, local_8.GetPosition());
    }
    return ENTITY_NULL;
}
FECSEntity FindCreatureTargetCombatRegion(const FECSEntity &inout Entity)
{
    if (!(Entity))
    {
        return ENTITY_NULL;
    }
    Get local_6;
    const FC_FlockMember& local_8 = local_6.opCall();
    if (local_8)
    {
        FECSEntity local_14 = FECSEntity(Entity.GetWorld(), local_8.FlockProxyEntity);
        return FEcologySceneInfoUtils::FindFlockTargetCombatRegion(local_14);
    }
    FECSEntity local_14_2 = FEcologySceneInfoUtils::FindCombatRegionByEntity(Entity);
    return local_14_2;
}
FECSEntity FindFlockTargetCombatRegion(const FECSEntity &inout Entity)
{
    if (!(Entity))
    {
        return ENTITY_NULL;
    }
    Get local_6;
    const FC_EcologyFlockComponent& local_8 = local_6.opCall();
    if (local_8)
    {
        FECSEntity local_12 = FECSEntity(Entity.GetWorld(), local_8.ActivityTarget.MainTargetResource);
        if (local_12)
        {
            return FEcologySceneInfoUtils::FindCombatRegionByEntity(local_12);
        }
    }
    return FEcologySceneInfoUtils::FindCombatRegionByEntity(Entity);
}
bool IsAroundPlayer(const FVector &inout Position)
{
    return true;
}
}
