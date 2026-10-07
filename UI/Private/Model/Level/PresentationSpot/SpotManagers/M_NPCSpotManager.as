
namespace FMS_NPCSpotManager
{
    const int ModelId = 0;

}
struct FMS_NPCSpotManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<TDataObjectPtr<FNPCPresentationConfig>, TEUIModelRef<FM_Spot>> m_NPCMapSpots;
    UPROPERTY()
    TSet<TDataObjectPtr<FNPCPresentationConfig>> m_NPCsUsingEntitySpot;
    UPROPERTY()
    TMap<TEUIModelRef<FM_Spot>, TDataObjectPtr<FNPCPresentationConfig>> m_EntitySpotToConfig;
    UPROPERTY()
    TMap<TDataObjectPtr<FNPCPresentationConfig>, TDataObjectPtr<FNPCMainConfig>> m_PresentationToMainConfig;

    FMS_NPCSpotManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_NPCSpotManager(const FMS_NPCSpotManager &inout Other)
    {
        this.m_NPCMapSpots = Other.m_NPCMapSpots;
        this.m_NPCsUsingEntitySpot = Other.m_NPCsUsingEntitySpot;
        this.m_EntitySpotToConfig = Other.m_EntitySpotToConfig;
        this.m_PresentationToMainConfig = Other.m_PresentationToMainConfig;
        return;
    }
    FMS_NPCSpotManager& opAssign(const FMS_NPCSpotManager &inout Other)
    {
        this.m_NPCMapSpots = Other.m_NPCMapSpots;
        this.m_NPCsUsingEntitySpot = Other.m_NPCsUsingEntitySpot;
        this.m_EntitySpotToConfig = Other.m_EntitySpotToConfig;
        return Other.m_PresentationToMainConfig;
    }
    void PostConstruct()
    {
        this.InitMapRegistrySpots();
        this.SyncExistingLiveEntitySpots();
        return;
    }
    void OnEntitySpotRegistered(const FMsg_EntitySpotRegistered &inout Message)
    {
        this.HandleEntitySpotAdded(Message.Spot);
        return;
    }
    void OnEntitySpotUnregistered(const FMsg_EntitySpotUnregistered &inout Message)
    {
        this.HandleEntitySpotRemoved(Message.Spot);
        return;
    }
    void InvalidateEntityCache()
    {
        TArray<TDataObjectPtr<FNPCPresentationConfig>> local_4;
        for (auto local_24 : this.GetNPCsUsingEntitySpot())
        {
            local_4.Add(local_24);
        }
        for (auto local_24 : local_4)
        {
            TDataObjectPtr<FNPCMainConfig> local_62;
            if (!(this.GetPresentationToMainConfig().Find(local_24, local_62)))
            {
                continue;
            }
            TDataObjectPtr<FMapConfig> local_110;
            if (local_62.opArrow().GetWorldMapRegion())
            {
                local_110 = local_62.opArrow().GetWorldMapRegion().opArrow().GetMapConfig();
            }
            else
            {
                local_110 = TDataObjectPtr<FMapConfig>();
            }
            if (!(local_110))
            {
                continue;
            }
            FM_SpotRegistry& local_186 = ::PresentationSpotUtils::GetMapRegistry(this.GetManager(), local_110);
            TEUIModelRef<FM_Spot> local_188;
            if (this.GetNPCMapSpots().Find(local_24, local_188) && local_186.HasSpot(local_188))
            {
                local_186.RemoveSpot(local_188);
            }
            this.GetModify_NPCMapSpots()[local_24] = this.CreatePlaceholderInMapRegistry(local_62, local_186);
        }
        this.GetModify_NPCsUsingEntitySpot().Empty(0);
        this.GetModify_EntitySpotToConfig().Empty(0);
        this.SyncExistingLiveEntitySpots();
        return;
    }
    void SyncExistingLiveEntitySpots()
    {
        for (auto& local_22 : ::FMS_SpotByEntityId::Get(this.GetManager()).GetLiveEntitySpots())
        {
            this.HandleEntitySpotAdded(local_22);
        }
        return;
    }
    void InitMapRegistrySpots()
    {
        TDataObjectIterator<FNPCMainConfig> local_16;
        for (; local_16; )
        {
            const FNPCMainConfig& local_20 = local_16.GetData();
            if (!(local_20.bShowInWorldMap))
            {
            }
            else
            {
                TDataObjectPtr<FNPCPresentationConfig> local_44 = local_20.GetPresentationConfig();
                if (!(local_44))
                {
                }
                else
                {
                    if (this.GetNPCMapSpots().Contains(local_44))
                    {
                        XError(ELog(16), FString().Append("FMS_NPCSpotManager: Duplicate FNPCPresentationConfig for world map NPC. Multiple FNPCMainConfig with bShowInWorldMap share the same PresentationConfig."));
                    }
                    else
                    {
                        TDataObjectPtr<FMapConfig> local_122;
                        if (local_20.GetWorldMapRegion())
                        {
                            local_122 = local_20.GetWorldMapRegion().opArrow().GetMapConfig();
                        }
                        else
                        {
                            local_122 = TDataObjectPtr<FMapConfig>();
                        }
                        if (!(local_122))
                        {
                        }
                        else
                        {
                            this.GetModify_PresentationToMainConfig().Add(local_44, TDataObjectPtr<FNPCMainConfig>());
                            FM_SpotRegistry& local_222 = ::PresentationSpotUtils::GetMapRegistry(this.GetManager(), local_122);
                            this.GetModify_NPCMapSpots().Add(local_44, this.CreatePlaceholderInMapRegistry(TDataObjectPtr<FNPCMainConfig>(), local_222));
                        }
                    }
                }
            }
            local_16.Next();
        }
        return;
    }
    TEUIModelRef<FM_Spot> CreatePlaceholderInMapRegistry(const TDataObjectPtr<FNPCMainConfig> &inout MainConfig, FM_SpotRegistry &inout MapRegistry)
    {
        TEUIModelRef<FM_Spot> local_2 = TEUIModelRef<FM_Spot>(MapRegistry.CreateSpot());
        local_2.opArrow().GetModify_Transform().SetPosition2D(FVector2D(MainConfig.opArrow().WorldMapFixedPosition.X, MainConfig.opArrow().WorldMapFixedPosition.Y));
        CastTo local_16;
        ::SetPresentationConfig(local_2.opArrow(), local_16.opCall(), TEUIModelRef<FM_SpotRegistry>(MapRegistry));
        return local_2;
    }
    void HandleEntitySpotAdded(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        TDataObjectPtr<FNPCPresentationConfig> local_24 = this.GetPresentationConfigFromSpot(Spot);
        if (!(local_24))
        {
            return;
        }
        if (!(this.GetNPCMapSpots().Contains(local_24)))
        {
            return;
        }
        if (this.GetNPCsUsingEntitySpot().Contains(local_24))
        {
            return;
        }
        TDataObjectPtr<FNPCMainConfig> local_74;
        if (!(this.GetPresentationToMainConfig().Find(local_24, local_74)))
        {
            return;
        }
        TDataObjectPtr<FMapConfig> local_122;
        if (local_74.opArrow().GetWorldMapRegion())
        {
            local_122 = local_74.opArrow().GetWorldMapRegion().opArrow().GetMapConfig();
        }
        else
        {
            local_122 = TDataObjectPtr<FMapConfig>();
        }
        if (!(local_122))
        {
            return;
        }
        FM_SpotRegistry& local_198 = ::PresentationSpotUtils::GetMapRegistry(this.GetManager(), local_122);
        TEUIModelRef<FM_Spot> local_200 = TEUIModelRef<FM_Spot>(this.GetNPCMapSpots()[local_24]);
        local_198.RemoveSpot(local_200);
        local_198.AddSpot(Spot);
        this.SetupSpotConfigs(Spot, local_74, TEUIModelRef<FM_SpotRegistry>(local_198));
        this.GetModify_NPCMapSpots()[local_24] = Spot;
        this.GetModify_NPCsUsingEntitySpot().Add(local_24);
        this.GetModify_EntitySpotToConfig().Add(Spot, local_24);
        return;
    }
    void HandleEntitySpotRemoved(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        TDataObjectPtr<FNPCPresentationConfig> local_24;
        if (!(this.GetEntitySpotToConfig().Find(Spot, local_24)))
        {
            return;
        }
        if (!(this.GetNPCsUsingEntitySpot().Contains(local_24)))
        {
            return;
        }
        TDataObjectPtr<FNPCMainConfig> local_50;
        if (!(this.GetPresentationToMainConfig().Find(local_24, local_50)))
        {
            return;
        }
        TDataObjectPtr<FMapConfig> local_98;
        if (local_50.opArrow().GetWorldMapRegion())
        {
            local_98 = local_50.opArrow().GetWorldMapRegion().opArrow().GetMapConfig();
        }
        else
        {
            local_98 = TDataObjectPtr<FMapConfig>();
        }
        if (!(local_98))
        {
            return;
        }
        FM_SpotRegistry& local_174 = ::PresentationSpotUtils::GetMapRegistry(this.GetManager(), local_98);
        if (local_174.HasSpot(Spot))
        {
            local_174.RemoveSpot(Spot);
        }
        this.GetModify_NPCMapSpots()[local_24] = this.CreatePlaceholderInMapRegistry(local_50, local_174);
        return;
    }
    TDataObjectPtr<FNPCPresentationConfig> GetPresentationConfigFromSpot(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        FSpotViewAdapter local_8;
        if (::GetPresentationConfig(Spot.opArrow(), local_8))
        {
            CastTo local_62;
            return local_62.opCall();
        }
        return TDataObjectPtr<FNPCPresentationConfig>();
    }
    void SetupSpotConfigs(const TEUIModelRef<FM_Spot> &inout Spot, const TDataObjectPtr<FNPCMainConfig> &inout MainConfig, const TEUIModelRef<FM_SpotRegistry> &inout Registry)
    {
        CastTo local_4;
        ::SetPresentationConfig(Spot.opArrow(), local_4.opCall(), Registry);
        return;
    }
    const TMap<TDataObjectPtr<FNPCPresentationConfig>, TEUIModelRef<FM_Spot>> GetNPCMapSpots() const property
    {
        const TMap<TDataObjectPtr<FNPCPresentationConfig>, TEUIModelRef<FM_Spot>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<TDataObjectPtr<FNPCPresentationConfig>, TEUIModelRef<FM_Spot>> GetModify_NPCMapSpots() property
    {
        TMap<TDataObjectPtr<FNPCPresentationConfig>, TEUIModelRef<FM_Spot>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetNPCMapSpots(const TMap<TDataObjectPtr<FNPCPresentationConfig>, TEUIModelRef<FM_Spot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_NPCMapSpots = __Value;
        return;
    }
    const TSet<TDataObjectPtr<FNPCPresentationConfig>> GetNPCsUsingEntitySpot() const property
    {
        const TSet<TDataObjectPtr<FNPCPresentationConfig>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TSet<TDataObjectPtr<FNPCPresentationConfig>> GetModify_NPCsUsingEntitySpot() property
    {
        TSet<TDataObjectPtr<FNPCPresentationConfig>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetNPCsUsingEntitySpot(const TSet<TDataObjectPtr<FNPCPresentationConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_NPCsUsingEntitySpot = __Value;
        return;
    }
    const TMap<TEUIModelRef<FM_Spot>, TDataObjectPtr<FNPCPresentationConfig>> GetEntitySpotToConfig() const property
    {
        const TMap<TEUIModelRef<FM_Spot>, TDataObjectPtr<FNPCPresentationConfig>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TMap<TEUIModelRef<FM_Spot>, TDataObjectPtr<FNPCPresentationConfig>> GetModify_EntitySpotToConfig() property
    {
        TMap<TEUIModelRef<FM_Spot>, TDataObjectPtr<FNPCPresentationConfig>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetEntitySpotToConfig(const TMap<TEUIModelRef<FM_Spot>, TDataObjectPtr<FNPCPresentationConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_EntitySpotToConfig = __Value;
        return;
    }
    const TMap<TDataObjectPtr<FNPCPresentationConfig>, TDataObjectPtr<FNPCMainConfig>> GetPresentationToMainConfig() const property
    {
        const TMap<TDataObjectPtr<FNPCPresentationConfig>, TDataObjectPtr<FNPCMainConfig>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<TDataObjectPtr<FNPCPresentationConfig>, TDataObjectPtr<FNPCMainConfig>> GetModify_PresentationToMainConfig() property
    {
        TMap<TDataObjectPtr<FNPCPresentationConfig>, TDataObjectPtr<FNPCMainConfig>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPresentationToMainConfig(const TMap<TDataObjectPtr<FNPCPresentationConfig>, TDataObjectPtr<FNPCMainConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PresentationToMainConfig = __Value;
        return;
    }
}

namespace FMS_NPCSpotManager
{
FMS_NPCSpotManager& Get(const UObject ContextObject)
{
    return FMS_NPCSpotManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_NPCSpotManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_NPCSpotManager __r;
    TEUIModelRef<FMS_NPCSpotManager> local_6 = TEUIModelRef<FMS_NPCSpotManager>(EUIInternal::MakeModelWithManager(Manager, FMS_NPCSpotManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnEntitySpotRegistered";
    local_14.MessageTypeName = "Msg_EntitySpotRegistered";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnEntitySpotUnregistered";
    local_14.MessageTypeName = "Msg_EntitySpotUnregistered";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_NPCSpotManager;
}
void __OnEntitySpotRegistered(FMS_NPCSpotManager &inout Model, const FMsg_EntitySpotRegistered &inout Message)
{
    Model.OnEntitySpotRegistered(Message);
    return;
}
void __OnEntitySpotUnregistered(FMS_NPCSpotManager &inout Model, const FMsg_EntitySpotUnregistered &inout Message)
{
    Model.OnEntitySpotUnregistered(Message);
    return;
}
int __IndexOf_NPCMapSpots()
{
    return 0;
}
int __IndexOf_NPCsUsingEntitySpot()
{
    return 1;
}
int __IndexOf_EntitySpotToConfig()
{
    return 2;
}
int __IndexOf_PresentationToMainConfig()
{
    return 3;
}
}
