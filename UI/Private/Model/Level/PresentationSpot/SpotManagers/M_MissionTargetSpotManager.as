
namespace FMS_MissionTargetSpotManager
{
    const int ModelId = 0;

}
struct FGuideMinimapIconUserData
{
    UPROPERTY()
    TDataObjectPtr<FGuidePresentationConfig> GuidePresentationConfig;

    FGuideMinimapIconUserData()
    {
        return;
    }
    FGuideMinimapIconUserData(const TDataObjectPtr<FGuidePresentationConfig> &inout InGuidePresentationConfig)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FGuideMinimapIconHandleList
{
    UPROPERTY()
    TArray<FMinimapIconHandle> IconHandles;

    FGuideMinimapIconHandleList()
    {
        return;
    }
}

struct FMissionTargetSpotInfo
{
    UPROPERTY()
    TDataObjectPtr<FMapConfig> MapConfig;
    UPROPERTY()
    TArray<TEUIModelRef<FM_Spot>> MiniMapSpots;
    UPROPERTY()
    TEUIModelRef<FM_Spot> RegionMapSpot;

    FMissionTargetSpotInfo()
    {
        return;
    }
}

struct FMS_MissionTargetSpotManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<uint, FMissionTargetSpotInfo> m_MissionTargetSpots;
    UPROPERTY()
    TMap<TEUIModelRef<FM_Spot>, FGuideMinimapIconHandleList> m_GuideMinimapIconHandleLists;
    UPROPERTY()
    TMap<TEUIModelRef<FM_Spot>, float32> m_GuideFXSpawnTimes;
    UPROPERTY()
    TMap<FECSEntityId, uint> m_EntityIdToGuideIdMap;
    UPROPERTY()
    TMap<FECSEntityId, TEUIModelRef<FM_Spot>> m_CommissionTargetSpots;

    FMS_MissionTargetSpotManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_MissionTargetSpotManager(const FMS_MissionTargetSpotManager &inout Other)
    {
        this.m_MissionTargetSpots = Other.m_MissionTargetSpots;
        this.m_GuideMinimapIconHandleLists = Other.m_GuideMinimapIconHandleLists;
        this.m_GuideFXSpawnTimes = Other.m_GuideFXSpawnTimes;
        this.m_EntityIdToGuideIdMap = Other.m_EntityIdToGuideIdMap;
        this.m_CommissionTargetSpots = Other.m_CommissionTargetSpots;
        return;
    }
    FMS_MissionTargetSpotManager& opAssign(const FMS_MissionTargetSpotManager &inout Other)
    {
        this.m_MissionTargetSpots = Other.m_MissionTargetSpots;
        this.m_GuideMinimapIconHandleLists = Other.m_GuideMinimapIconHandleLists;
        this.m_GuideFXSpawnTimes = Other.m_GuideFXSpawnTimes;
        this.m_EntityIdToGuideIdMap = Other.m_EntityIdToGuideIdMap;
        return Other.m_CommissionTargetSpots;
    }
    void OnGuidingInfoListModify(const FC_GuidingInfoList &inout C_GuidingInfoList)
    {
        FMissionTargetSpotInfo local_70;
        const FGuideContext& local_138;
        TArray<uint> local_4;
        for (auto& local_24 : this.GetMissionTargetSpots())
        {
            if (!(C_GuidingInfoList) || !(C_GuidingInfoList.GetGuideInfoMap().Contains(local_24.GetKey())))
            {
                local_4.Add(local_24.GetKey());
            }
        }
        for (auto local_40 : local_4)
        {
            if (this.GetModify_MissionTargetSpots().RemoveAndCopyValue(local_40, local_70))
            {
                this.RemvoeSpotsInSpotInfo(local_70);
            }
        }
        if (C_GuidingInfoList)
        {
            TDataObjectPtr<FLevelInfoConfig> local_94 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
            for (auto& local_136 : C_GuidingInfoList.GetGuideInfoMap())
            {
                bool local_21 = this.GetMissionTargetSpots().Find(local_136.GetKey(), local_70);
                if (!(local_21))
                {
                    this.CreateMissionTargetSpot(local_136.GetKey(), local_138, local_94);
                    this.GetModify_MissionTargetSpots().Add(local_136.GetKey(), local_70);
                    if (local_138.GetbClientAutoSelectIcon() && (local_70.MiniMapSpots.Num() > 0))
                    {
                        if (::GuideUtils::ShouldShowGuideOnTargetLevelMinimap(local_138, local_94))
                        {
                            ::GuideUtils::OpenMinimap(local_138.GetPrimaryTargetPosition());
                        }
                        else
                        {
                            if (local_70.RegionMapSpot.IsValid())
                            {
                                ::GuideUtilsPrivate::OpenRegionMap(local_70.RegionMapSpot, local_138.GetLevelInfo());
                            }
                            else
                            {
                                ::GuideUtils::OpenRegionMap(local_138.GetLevelInfo());
                            }
                        }
                    }
                }
                else
                {
                    this.DiffMiniMapSpots(local_136.GetKey(), local_70, local_138, local_94);
                }
                if (local_70.RegionMapSpot.IsValid())
                {
                    this.UpdateRegionMapSpot(local_70.RegionMapSpot, local_138);
                }
            }
        }
        return;
    }
    void OnCommissionInfoModify(const FCS_CommissionInfo &inout C_CommissionInfo)
    {
        TSet<FECSEntityId> local_20;
        int local_84 = 0;
        if (C_CommissionInfo)
        {
            for (auto& local_36 : C_CommissionInfo.CommissionTargetEntityInfos)
            {
                local_20.Add(local_36.GetEntity().GetId());
            }
        }
        TArray<FECSEntityId> local_42;
        for (auto& local_60 : this.GetCommissionTargetSpots())
        {
            if (!(local_20.Contains(local_60.GetKey())))
            {
                local_42.Add(local_60.GetKey());
            }
        }
        for (auto& local_76 : local_42)
        {
            TEUIModelRef<FM_Spot> local_78;
            if (this.GetModify_CommissionTargetSpots().RemoveAndCopyValue(local_76, local_78))
            {
                if (!(this.GetEntityIdToGuideIdMap().Contains(local_76)))
                {
                    this.RemoveMissionTargetSpot(local_78);
                }
            }
        }
        if (C_CommissionInfo)
        {
            for (auto& local_36 : C_CommissionInfo.CommissionTargetEntityInfos)
            {
                if (!(this.GetCommissionTargetSpots().Contains(local_36.GetEntity().GetId())))
                {
                    FECSEntityId local_37 = local_36.GetEntity().GetId();
                    local_84.GetModify_Transform().SetPosition(local_36.GetPosition());
                    ::AddDecoractor(local_84, EPresentationSpotDecoractor(2), TEUIModelRef<FM_SpotRegistry>());
                    TDataObjectPtr<FGuidePresentationConfig> local_112 = ::GuideUtils::GetGuidePresentationConfig(::CommissionUtils::GetCommissionGuideStyleType());
                    if (local_112.IsSet())
                    {
                        FMissionPresentationData local_232;
                        local_232.GuideIcon = local_112.opArrow().GetGuideIcon();
                        ::AddMissionData(local_84, local_232, TEUIModelRef<FM_SpotRegistry>());
                    }
                    this.GetModify_CommissionTargetSpots().Add(local_36.GetEntity().GetId(), TEUIModelRef<FM_Spot>(local_84));
                }
            }
        }
        return;
    }
    void InvalidateEntityCache()
    {
        for (auto& local_20 : this.GetMissionTargetSpots())
        {
            local_20;
            this.RemvoeSpotsInSpotInfo();
        }
        this.GetModify_MissionTargetSpots().Empty(0);
        for (auto& local_40 : this.GetCommissionTargetSpots())
        {
            local_40;
            this.RemoveMissionTargetSpot();
        }
        this.GetModify_CommissionTargetSpots().Empty(0);
        this.GetModify_EntityIdToGuideIdMap().Empty(0);
        this.GetModify_GuideMinimapIconHandleLists().Empty(0);
        return;
    }
    TEUIModelRef<FM_Spot> CreateRegionMapSpot(const FGuideContext &inout GuideInfo)
    {
        if (!(GuideInfo.GetLevelInfo()) || !(GetMapConfig()))
        {
            return TEUIModelRef<FM_Spot>();
        }
        FM_SpotRegistry& local_8 = ::PresentationSpotUtils::GetMapRegistry(this.GetManager(), GetMapConfig());
        TEUIModelRef<FM_Spot> local_10 = TEUIModelRef<FM_Spot>(local_8.CreateSpot());
        local_10.opArrow().GetModify_Transform().SetPosition(GuideInfo.GetPrimaryTargetPosition());
        FMissionPresentationData local_112;
        TDataObjectPtr<FGuidePresentationConfig> local_136 = GuideInfo.GetGuidePresentationConfig();
        if (local_136)
        {
            local_112.GuideIcon = local_136.opArrow().GetGuideIcon();
            local_112.MissionConfig = GuideInfo.GetDataSourceConfig().GetFromMission();
            local_112.LevelInfo = GuideInfo.GetLevelInfo();
            ::SetPresentationConfig(local_10.opArrow(), local_136.opArrow().GetPresentationConfig(), TEUIModelRef<FM_SpotRegistry>(local_8));
            if (GuideInfo.GetDataSourceConfig().GetFromMission())
            {
                TEUIModelRef<FM_SpotRegistry> local_254 = TEUIModelRef<FM_SpotRegistry>(local_8);
                TEUIModelRef<FM_SpotRegistry> local_254_2 = TEUIModelRef<FM_SpotRegistry>(local_8);
            }
        }
        ::AddMissionData(local_10.opArrow(), local_112, TEUIModelRef<FM_SpotRegistry>(local_8));
        return local_10;
    }
    FMissionTargetSpotInfo CreateMissionTargetSpot(const uint GuideId, const FGuideContext &inout GuideInfo, const TDataObjectPtr<FLevelInfoConfig> &inout CurrentLevelInfo)
    {
        FMissionTargetSpotInfo local_30;
        FMissionTargetSpotInfo __r;
        TDataObjectPtr<FMapConfig> local_80;
        if (GuideInfo.GetLevelInfo())
        {
            local_80 = GetMapConfig();
        }
        else
        {
            local_80 = TDataObjectPtr<FMapConfig>();
        }
        local_30.MapConfig = local_80;
        local_30.RegionMapSpot = this.CreateRegionMapSpot(GuideInfo);
        if (::GuideUtils::ShouldShowGuideOnTargetLevelMinimap(GuideInfo, CurrentLevelInfo))
        {
            if (GuideInfo.GetGuideTargets().IsEmpty())
            {
            }
            else
            {
                for (auto& local_144 : GuideInfo.GetGuideTargets())
                {
                    TEUIModelRef<FM_Spot> local_146;
                    if ((FECSEntity(local_144.GetEntity()) == ENTITY_NULL))
                    {
                        local_146 = this.CreatePositionSpot(GuideInfo, local_144.GetServerPosition());
                    }
                    else
                    {
                        local_146 = this.CreateEntitySpot(GuideInfo, local_144);
                        this.GetModify_EntityIdToGuideIdMap().Add(local_144.GetEntity().GetId(), GuideId);
                    }
                    if (local_146.IsValid())
                    {
                        local_30.MiniMapSpots.Add(local_146);
                    }
                }
            }
        }
        return __r;
    }
    TEUIModelRef<FM_Spot> CreatePositionSpot(const FGuideContext &inout GuideInfo, const FVector &inout Position)
    {
        const UGuideSettings local_2;
        bool local_71;
        AActor local_382;
        GetGameplaySettings<UGuideSettings> local_4;
        local_2 = local_4;
        TEUIModelRef<FM_SpotRegistry> local_12 = TEUIModelRef<FM_SpotRegistry>(FEUIModelRef());
        TEUIModelRef<FM_Spot> local_8 = TEUIModelRef<FM_Spot>(::PresentationSpotUtils::CreateSpot(this.GetManager(), local_12));
        local_8.opArrow().GetModify_Transform().SetPosition((Position + local_2.LocationIconOffset));
        TDataObjectPtr<FGuidePresentationConfig> local_46 = GuideInfo.GetGuidePresentationConfig();
        if (!(local_46))
        {
            local_71 = false;
        }
        else
        {
            local_71 = local_46.opArrow().GetPresentationConfig();
        }
        local_71 = local_71 && (int(local_46.opArrow().RegionStyleType) == 0);
        if (local_71)
        {
            ::SetPresentationConfig(local_8.opArrow(), local_46.opArrow().GetPresentationConfig(), local_12);
        }
        if (GuideInfo.GetRegionRadius() > local_2.MinRegionRadius)
        {
            UMinimapIconRegistry local_82 = ::MinimapUtils::GetIconRegistry(local_2.GuideIconRegistry);
            if (local_82 != nullptr)
            {
                FMinimapIconInfo local_146;
                local_146.IconWidget = local_2.MiniMapRegionIconWidget;
                local_146.DisplaySettings = FMinimapIconDisplaySettings();
                local_146.WorldPosition = FVector2D(Position.X, Position.Y);
                float local_80 = GuideInfo.GetRegionRadius() * 2.0;
                local_146.IconSize = FVector2D(local_80, local_80);
                FGuideMinimapIconUserData local_176;
                local_146.UserData = FInstancedStruct::Make(local_176);
                this.GetModify_GuideMinimapIconHandleLists().FindOrAdd(local_8).IconHandles.Add(local_82.AddIcon(local_146));
            }
        }
        FMissionPresentationData local_284;
        local_284.MissionConfig = GuideInfo.GetDataSourceConfig().GetFromMission();
        local_284.LevelInfo = GuideInfo.GetLevelInfo();
        if (GuideInfo.GetGuidePresentationConfig())
        {
            local_284.GuideIcon = GuideInfo.GetGuidePresentationConfig().opArrow().GetGuideIcon();
        }
        if (GuideInfo.GetbShowGuideFX() && !(local_2.GuideFXActorClass.IsNull()) && local_2.GuideFXActorClass.IsValid())
        {
            local_284.GuideFXActor = SpawnActor(local_2.GuideFXActorClass.Get(), Position, FRotator::ZeroRotator, NAME_None, false, nullptr, nullptr);
            if (local_382 != nullptr)
            {
                UWorld local_386 = local_382.GetWorld();
                if (local_386 != nullptr)
                {
                    this.GetModify_GuideFXSpawnTimes().Add(local_8, float32(local_386.GetTimeSeconds()));
                }
            }
        }
        if (GuideInfo.GetDataSourceConfig().GetFromMission())
        {
        }
        ::AddMissionData(local_8.opArrow(), local_284, local_12);
        return local_8;
    }
    TEUIModelRef<FM_Spot> CreateEntitySpot(const FGuideContext &inout GuideInfo, const FGuideTargetInfo &inout Target)
    {
        TEUIModelRef<FM_SpotRegistry> local_6 = TEUIModelRef<FM_SpotRegistry>(FEUIModelRef());
        TEUIModelRef<FM_Spot> local_2 = TEUIModelRef<FM_Spot>(::PresentationSpotUtils::RequireEntitySpot(this.GetContext().Manager, Target.GetEntity().GetId(), local_6));
        local_2.opArrow().GetModify_Transform().SetPosition(Target.GetServerPosition());
        ::AddDecoractor(local_2.opArrow(), EPresentationSpotDecoractor(2), local_6);
        FMissionPresentationData local_108;
        local_108.MissionConfig = GuideInfo.GetDataSourceConfig().GetFromMission();
        local_108.LevelInfo = GuideInfo.GetLevelInfo();
        if (GuideInfo.GetGuidePresentationConfig())
        {
            local_108.GuideIcon = GuideInfo.GetGuidePresentationConfig().opArrow().GetGuideIcon();
        }
        ::AddMissionData(local_2.opArrow(), local_108, local_6);
        return local_2;
    }
    void DiffMiniMapSpots(const uint GuideId, FMissionTargetSpotInfo &inout SpotInfo, const FGuideContext &inout GuideCtx, const TDataObjectPtr<FLevelInfoConfig> &inout CurrentLevelInfo)
    {
        TSet<FECSEntityId> local_20;
        for (auto& local_36 : GuideCtx.GetGuideTargets())
        {
            if ((!((FECSEntity(local_36.GetEntity()) == ENTITY_NULL))))
            {
                local_20.Add(local_36.GetEntity().GetId());
            }
        }
        TArray<int> local_46;
        int local_47 = 0;
        while (local_47 < 0)
        {
            if (!(SpotInfo.MiniMapSpots[local_47].IsValid()))
            {
                local_46.Add(local_47);
            }
            else
            {
                FECSEntityId local_41 = ::GetOwnerEntityId(SpotInfo.MiniMapSpots[local_47].opArrow());
                if (!((local_41 == ENTITY_ID_NULL)) && !(local_20.Contains(local_41)))
                {
                    local_46.Add(local_47);
                }
            }
            ++local_47;
        }
        int local_52 = local_46.Num() - 1;
        for (; local_52 >= 0; )
        {
            TEUIModelRef<FM_Spot> local_54 = SpotInfo.MiniMapSpots[local_46[local_52]];
            if (local_54.IsValid())
            {
                if ((!((::GetOwnerEntityId(local_54.opArrow()) == ENTITY_ID_NULL))))
                {
                }
                this.RemoveMissionTargetSpot(local_54);
            }
            SpotInfo.MiniMapSpots.RemoveAt(local_46[local_52]);
            --local_52;
        }
        TSet<FECSEntityId> local_74;
        for (auto& local_88 : SpotInfo.MiniMapSpots)
        {
            if (local_88.IsValid())
            {
                FECSEntityId local_41_2 = ::GetOwnerEntityId(local_88.opArrow());
                if (!((local_41_2 == ENTITY_ID_NULL)))
                {
                    local_74.Add(local_41_2);
                }
            }
        }
        if (::GuideUtils::ShouldShowGuideOnTargetLevelMinimap(GuideCtx, CurrentLevelInfo))
        {
            for (auto& local_36 : GuideCtx.GetGuideTargets())
            {
                if (!((FECSEntity(local_36.GetEntity()) == ENTITY_NULL)) && !(local_74.Contains(local_36.GetEntity().GetId())))
                {
                    TEUIModelRef<FM_Spot> local_90 = this.CreateEntitySpot(GuideCtx, local_36);
                    if (local_90.IsValid())
                    {
                        SpotInfo.MiniMapSpots.Add(local_90);
                        this.GetModify_EntityIdToGuideIdMap().Add(local_36.GetEntity().GetId(), GuideId);
                    }
                }
            }
        }
        return;
    }
    void UpdateRegionMapSpot(const TEUIModelRef<FM_Spot> &inout RegionMapSpot, const FGuideContext &inout GuideInfo) const
    {
        if (RegionMapSpot.IsValid())
        {
            RegionMapSpot.opArrow().GetModify_Transform().SetPosition(GuideInfo.GetPrimaryTargetPosition());
        }
        return;
    }
    void RemoveMissionTargetSpot(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        AActor local_230;
        if (this.GetGuideMinimapIconHandleLists().Contains(Spot))
        {
            const FGuideMinimapIconHandleList& local_4 = this.GetGuideMinimapIconHandleLists()[Spot];
            for (auto& local_18 : local_4.IconHandles)
            {
                if (::MinimapUtils::IsValidHandle(local_18))
                {
                    ::MinimapUtils::UnregisterIcon(local_18);
                }
            }
        }
        if (::PresentationSpotUtils::IsEntitySpot(Spot))
        {
            ::RemoveMissionData(Spot.opArrow(), TEUIModelRef<FM_SpotRegistry>());
            ::RemoveDecoractor(Spot.opArrow(), EPresentationSpotDecoractor(2), TEUIModelRef<FM_SpotRegistry>());
            return;
        }
        int local_24 = 1065353216;
        FSpotViewAdapter local_132;
        ::GetMissionData(Spot.opArrow(), local_132);
        if (local_230 != nullptr)
        {
            float32 local_233 = 0.0f;
            UWorld local_238 = local_230.GetWorld();
            if ((this.GetGuideFXSpawnTimes().Find(Spot, local_233) && (local_238 != nullptr)))
            {
                float32 local_25 = (float32(local_238.GetTimeSeconds()) - local_233);
                TArray<UNiagaraComponent> local_250 = local_230.GetComponentsByClass(UNiagaraComponent);
                for (auto local_264 : local_250)
                {
                    if (local_264 != nullptr)
                    {
                        local_264.SetVariableFloat(n"User.StartTime", local_25);
                    }
                }
                FTimerDynamicDelegate local_269;
                local_269.BindUFunction(local_230, n"K2_DestroyActor");
                System::SetTimerDelegate(local_269, 1.0f, false, false, 0.0f, 0.0f);
            }
            else
            {
                local_230.DestroyActor();
            }
        }
        ::PresentationSpotUtils::RemoveSpot(Spot, TEUIModelRef<FM_SpotRegistry>());
        return;
    }
    void RemvoeSpotsInSpotInfo(const FMissionTargetSpotInfo &inout SpotInfo)
    {
        if (SpotInfo.RegionMapSpot.IsValid())
        {
            ::PresentationSpotUtils::RemoveSpot(SpotInfo.RegionMapSpot, TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetMapRegistry(this.GetManager(), SpotInfo.MapConfig)));
        }
        for (auto& local_22 : SpotInfo.MiniMapSpots)
        {
            if (!(local_22.IsValid()))
            {
                continue;
            }
            FECSEntityId local_23 = ::GetOwnerEntityId(local_22.opArrow());
            if ((!((local_23 == ENTITY_ID_NULL))))
            {
            }
            if ((local_23 == ENTITY_ID_NULL) || !(this.GetCommissionTargetSpots().Contains(local_23)))
            {
                this.RemoveMissionTargetSpot(local_22);
            }
        }
        return;
    }
    const TMap<uint, FMissionTargetSpotInfo> GetMissionTargetSpots() const property
    {
        const TMap<uint, FMissionTargetSpotInfo> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<uint, FMissionTargetSpotInfo> GetModify_MissionTargetSpots() property
    {
        TMap<uint, FMissionTargetSpotInfo> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMissionTargetSpots(const TMap<uint, FMissionTargetSpotInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MissionTargetSpots = __Value;
        return;
    }
    const TMap<TEUIModelRef<FM_Spot>, FGuideMinimapIconHandleList> GetGuideMinimapIconHandleLists() const property
    {
        const TMap<TEUIModelRef<FM_Spot>, FGuideMinimapIconHandleList> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<TEUIModelRef<FM_Spot>, FGuideMinimapIconHandleList> GetModify_GuideMinimapIconHandleLists() property
    {
        TMap<TEUIModelRef<FM_Spot>, FGuideMinimapIconHandleList> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetGuideMinimapIconHandleLists(const TMap<TEUIModelRef<FM_Spot>, FGuideMinimapIconHandleList> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_GuideMinimapIconHandleLists = __Value;
        return;
    }
    const TMap<TEUIModelRef<FM_Spot>, float32> GetGuideFXSpawnTimes() const property
    {
        const TMap<TEUIModelRef<FM_Spot>, float32> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TMap<TEUIModelRef<FM_Spot>, float32> GetModify_GuideFXSpawnTimes() property
    {
        TMap<TEUIModelRef<FM_Spot>, float32> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetGuideFXSpawnTimes(const TMap<TEUIModelRef<FM_Spot>, float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_GuideFXSpawnTimes = __Value;
        return;
    }
    const TMap<FECSEntityId, uint> GetEntityIdToGuideIdMap() const property
    {
        const TMap<FECSEntityId, uint> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<FECSEntityId, uint> GetModify_EntityIdToGuideIdMap() property
    {
        TMap<FECSEntityId, uint> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEntityIdToGuideIdMap(const TMap<FECSEntityId, uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EntityIdToGuideIdMap = __Value;
        return;
    }
    const TMap<FECSEntityId, TEUIModelRef<FM_Spot>> GetCommissionTargetSpots() const property
    {
        const TMap<FECSEntityId, TEUIModelRef<FM_Spot>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TMap<FECSEntityId, TEUIModelRef<FM_Spot>> GetModify_CommissionTargetSpots() property
    {
        TMap<FECSEntityId, TEUIModelRef<FM_Spot>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCommissionTargetSpots(const TMap<FECSEntityId, TEUIModelRef<FM_Spot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CommissionTargetSpots = __Value;
        return;
    }
}

namespace FMS_MissionTargetSpotManager
{
FMS_MissionTargetSpotManager& Get(const UObject ContextObject)
{
    return FMS_MissionTargetSpotManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_MissionTargetSpotManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_MissionTargetSpotManager __r;
    TEUIModelRef<FMS_MissionTargetSpotManager> local_6 = TEUIModelRef<FMS_MissionTargetSpotManager>(EUIInternal::MakeModelWithManager(Manager, FMS_MissionTargetSpotManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnGuidingInfoListModify";
    local_14.ComponentType = FC_GuidingInfoList;
    Result.MonitorFunctions.Add(local_14);
    local_14.FunctionName = "__OnCommissionInfoModify";
    local_14.ComponentType = FCS_CommissionInfo;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_MissionTargetSpotManager;
}
void __OnGuidingInfoListModify(FMS_MissionTargetSpotManager &inout Model, const FECSEntity &inout Entity, const FC_GuidingInfoList &inout Component)
{
    Model.OnGuidingInfoListModify(Component);
    return;
}
void __OnCommissionInfoModify(FMS_MissionTargetSpotManager &inout Model, const FECSEntity &inout Entity, const FCS_CommissionInfo &inout Component)
{
    Get local_4;
    Model.OnCommissionInfoModify(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_MissionTargetSpots()
{
    return 0;
}
int __IndexOf_GuideMinimapIconHandleLists()
{
    return 1;
}
int __IndexOf_GuideFXSpawnTimes()
{
    return 2;
}
int __IndexOf_EntityIdToGuideIdMap()
{
    return 3;
}
int __IndexOf_CommissionTargetSpots()
{
    return 4;
}
}
