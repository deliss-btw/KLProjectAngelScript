
namespace FM_TeleporterSpotUpdater
{
    const int ModelId = 0;
}
namespace FMS_TeleporterSpotManager
{
    const int ModelId = 0;

}
struct FM_TeleporterSpotUpdater : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    FECSEntity m_Entity;
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> m_TeleporterConfig;

    FM_TeleporterSpotUpdater()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_TeleporterSpotUpdater' by default constructor.");
        return;
    }
    FM_TeleporterSpotUpdater(const FM_TeleporterSpotUpdater &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_Entity = Other.m_Entity;
        this.m_TeleporterConfig = Other.m_TeleporterConfig;
        return;
    }
    FM_TeleporterSpotUpdater(const TEUIModelRef<FM_Spot> &inout InSpot, const FECSEntity &inout InEntity, const TDataObjectPtr<FTeleporterConfig> &inout InTeleporterConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        this.SetEntity(InEntity);
        this.SetTeleporterConfig(InTeleporterConfig);
        return;
    }
    FM_TeleporterSpotUpdater& opAssign(const FM_TeleporterSpotUpdater &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_Entity = Other.m_Entity;
        return Other.m_TeleporterConfig;
    }
    void PostConstruct()
    {
        this.UpdateSpotTransformFromEntity();
        return;
    }
    void OnEntityLoadOrUnloadOnClient(const FC_Transform &inout C_Transform)
    {
        this.UpdateSpotTransformFromEntity();
        return;
    }
    void UpdateSpotTransformFromEntity()
    {
        int local_12 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            this.GetSpot().opArrow().GetModify_Transform().SetPosition(local_12.GetPosition());
            FRotator local_20 = local_12.GetRotation().Rotator();
            this.GetSpot().opArrow().GetModify_Transform().SetEulerRotation(FVector3f(FVector(local_20.Pitch, local_20.Yaw, local_20.Roll)));
            return;
        }
        this.GetSpot().opArrow().GetModify_Transform().SetPosition2D(this.GetTeleporterConfig().opArrow().WorldLocation);
        return;
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Spot = __Value;
        return;
    }
    FECSEntity GetEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FECSEntity GetModify_Entity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Entity = __Value;
        return;
    }
    const TDataObjectPtr<FTeleporterConfig> GetTeleporterConfig() const property
    {
        const TDataObjectPtr<FTeleporterConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FTeleporterConfig> GetModify_TeleporterConfig() property
    {
        TDataObjectPtr<FTeleporterConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTeleporterConfig(const TDataObjectPtr<FTeleporterConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TeleporterConfig = __Value;
        return;
    }
}

struct FMS_TeleporterSpotManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<TDataObjectPtr<FTeleporterConfig>, TEUIModelRef<FM_Spot>> m_TeleporterSpots;
    UPROPERTY()
    TMap<FECSEntity, TEUIModelRef<FM_TeleporterSpotUpdater>> m_EntityUpdaters;
    UPROPERTY()
    bool m_bShowAllTeleporters;

    FMS_TeleporterSpotManager()
    {
        this.m_bShowAllTeleporters = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_TeleporterSpotManager(const FMS_TeleporterSpotManager &inout Other)
    {
        this.m_bShowAllTeleporters = false;
        this.m_TeleporterSpots = Other.m_TeleporterSpots;
        this.m_EntityUpdaters = Other.m_EntityUpdaters;
        this.m_bShowAllTeleporters = Other.m_bShowAllTeleporters;
        return;
    }
    FMS_TeleporterSpotManager opAssign(const FMS_TeleporterSpotManager &inout Other)
    {
        FMS_TeleporterSpotManager __r;
        this.m_TeleporterSpots = Other.m_TeleporterSpots;
        this.m_EntityUpdaters = Other.m_EntityUpdaters;
        this.m_bShowAllTeleporters = Other.m_bShowAllTeleporters;
        return __r;
    }
    void PostConstruct()
    {
        this.InitMapRegistrySpots();
        this.SyncTeleporterSpots();
        return;
    }
    void OnECSWorldBegin(const FMsg_ECSWorldBegin &inout Msg)
    {
        this.SyncTeleporterSpots();
        return;
    }
    void DS_OnTeleportersModified(const FCS_Teleporters &inout CS_Teleporters)
    {
        this.SyncTeleporterSpots();
        return;
    }
    void OnTeleporterStateChanged(const FMsg_TeleporterStateChanged &inout Msg)
    {
        TDataObjectPtr<FTeleporterConfig> local_24 = Msg.TeleporterConfig;
        TEUIModelRef<FM_Spot> local_50;
        if (this.GetTeleporterSpots().Find(local_24, local_50))
        {
            TDataObjectPtr<FMapConfig> local_100;
            if (local_24.opArrow().GetLevelInfoConfig())
            {
                local_100 = local_24.opArrow().GetLevelInfoConfig().opArrow().GetMapConfig();
            }
            else
            {
                local_100 = TDataObjectPtr<FMapConfig>();
            }
            if (local_100)
            {
                ::SetPresentationConfig(local_50.opArrow(), this.ResolvePresentationConfig(local_24, ::FMS_TeleporterData::Get(this.GetManager())), TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetMapRegistry(this.GetManager(), local_100)));
            }
        }
        return;
    }
    void InvalidateEntityCache()
    {
        this.GetModify_EntityUpdaters().Empty(0);
        for (auto& local_22 : this.GetTeleporterSpots())
        {
            local_22;
            opArrow().RemoveDisplayScope(EPresentationSpotDisplayScope(0), EPresentationSpotDisplayScopeSource(1));
        }
        return;
    }
    void InitMapRegistrySpots()
    {
        TDataObjectIterator<FTeleporterConfig> local_16;
        for (; local_16; )
        {
            const FTeleporterConfig& local_20 = local_16.GetData();
            TDataObjectPtr<FMapConfig> local_68;
            if (local_20.GetLevelInfoConfig())
            {
                local_68 = local_20.GetLevelInfoConfig().opArrow().GetMapConfig();
            }
            else
            {
                local_68 = TDataObjectPtr<FMapConfig>();
            }
            if (!(local_68))
            {
            }
            else
            {
                FM_SpotRegistry& local_144 = ::PresentationSpotUtils::GetMapRegistry(this.GetManager(), local_68);
                TEUIModelRef<FM_Spot> local_146 = TEUIModelRef<FM_Spot>(local_144.CreateSpot());
                local_146.opArrow().SetRegistryDerivedInGameDisplayScopeDisabled(true);
                local_146.opArrow().GetModify_Transform().SetPosition2D(FVector2D(local_20.WorldLocation.X, local_20.WorldLocation.Y));
                ::AddTeleporterData(local_146.opArrow(), TDataObjectPtr<FTeleporterConfig>(local_20), TEUIModelRef<FM_SpotRegistry>(local_144));
                this.SetupSpotConfigs(local_146, TDataObjectPtr<FTeleporterConfig>(local_20), TEUIModelRef<FM_SpotRegistry>(local_144));
                this.GetModify_TeleporterSpots().Add(TDataObjectPtr<FTeleporterConfig>(local_20), local_146);
            }
            local_16.Next();
        }
        return;
    }
    void SyncTeleporterSpots()
    {
        TDataObjectPtr<FLevelInfoConfig> local_26 = ::FLevelUtils::GetCurrentLevelInfoConfig(this.GetContext().Manager.GetWorld());
        if (local_26)
        {
            this.SetbShowAllTeleporters(local_26.opArrow().bShowAllTeleporters);
        }
        else
        {
            this.SetbShowAllTeleporters(false);
        }
        if (!(ECS::GetECSWorld().IsValid()))
        {
            return;
        }
        this.SyncInGameVisibility(local_26);
        this.SyncEntityUpdaters();
        return;
    }
    void SyncInGameVisibility(const TDataObjectPtr<FLevelInfoConfig> &inout CurrentLevelInfoConfig)
    {
        int local_8;
        const TEUIModelRef<FM_Spot>& local_72;
        bool local_73;
        bool local_74;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        TMap<TDataObjectPtr<FTeleporterConfig>, FECSEntityId> local_28;
        for (auto& local_48 : local_8.GetTeleporters())
        {
            FECSEntityId local_49 = local_48.GetKey().GetId();
        }
        for (auto& local_68 : this.GetTeleporterSpots())
        {
            const TDataObjectPtr<FTeleporterConfig>& local_70 = local_68.GetKey();
            local_73 = false;
            if (local_70.opArrow().bShowOnRegionMap)
            {
                local_73 = local_28.Contains(local_70);
                if (!(!(local_73) && this.GetbShowAllTeleporters() && !(local_70.opArrow().bDynamicTeleporter)))
                {
                    local_74 = false;
                }
                else
                {
                    local_74 = CurrentLevelInfoConfig;
                }
                if (local_74)
                {
                    TDataObjectPtr<FLevelInfoConfig> local_100 = local_70.opArrow().GetLevelInfoConfig();
                    if (!(local_100))
                    {
                        local_74 = false;
                    }
                    else
                    {
                        FDataObjectPtr local_196;
                        TDataObjectPtr<FMapConfig> local_148;
                        local_148 = local_100.opArrow().GetMapConfig();
                        local_196;
                        local_74 = (local_148 == local_196);
                    }
                    local_73 = local_74;
                }
            }
            if (local_73)
            {
                local_72.opArrow().AddDisplayScope(EPresentationSpotDisplayScope(0), EPresentationSpotDisplayScopeSource(1));
                FECSEntityId local_199;
                if (local_28.Find(local_70, local_199))
                {
                    ::PresentationSpotUtils::BindEntitySpot(local_72, local_199);
                }
                continue;
            }
            local_72.opArrow().RemoveDisplayScope(EPresentationSpotDisplayScope(0), EPresentationSpotDisplayScopeSource(1));
        }
        return;
    }
    void SyncEntityUpdaters()
    {
        int local_8;
        const TDataObjectPtr<FTeleporterConfig>& local_52;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        TSet<FECSEntity> local_28;
        for (auto& local_48 : local_8.GetTeleporters())
        {
            FECSEntity local_50 = local_48.GetKey();
            local_28.Add(local_50);
            if (!(this.GetEntityUpdaters().Contains(local_50)))
            {
                TEUIModelRef<FM_Spot> local_54;
                if (this.GetTeleporterSpots().Find(local_52, local_54))
                {
                    this.GetModify_EntityUpdaters().Add(local_50, TEUIModelRef<FM_TeleporterSpotUpdater>(::FM_TeleporterSpotUpdater::Create(this.GetManager(), local_54, local_50, local_52)));
                }
            }
        }
        TArray<FECSEntity> local_62;
        for (auto& local_80 : this.GetEntityUpdaters())
        {
            if (!(local_28.Contains(local_80.GetKey())))
            {
                local_62.Add(local_80.GetKey());
            }
        }
        auto local_88 = local_62.Iterator();
        for (; local_88.CanProceed;)
        {
            FECSEntity local_50_2 = local_88.Proceed();
        }
        return;
    }
    void SetupSpotConfigs(const TEUIModelRef<FM_Spot> &inout Spot, const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig, const TEUIModelRef<FM_SpotRegistry> &inout Registry)
    {
        const UTeleporterSettings local_2;
        bool local_84;
        GetGameplaySettings<UTeleporterSettings> local_4;
        local_2 = local_4;
        FMS_TeleporterData& local_10 = ::FMS_TeleporterData::Get(this.GetManager());
        ::SetPresentationConfig(Spot.opArrow(), this.ResolvePresentationConfig(TeleporterConfig, local_10), Registry);
        TDataObjectPtr<FPresentationRuleConfig> local_58 = local_2.TeleporterDefaultPresentationRule;
        TDataObjectPtr<FMinimapIconConfig> local_132;
        if (!(local_58))
        {
            local_84 = false;
        }
        else
        {
            local_84 = local_58.opArrow().bShowMinimapIcon;
        }
        if (local_84)
        {
            local_132 = local_58.opArrow().GetMinimapIconSettings();
        }
        else
        {
            local_132 = TDataObjectPtr<FMinimapIconConfig>();
        }
        ::SetMinimapIconConfig(Spot.opArrow(), local_132);
        TDataObjectPtr<FIndicatorConfig> local_228;
        if (!(local_58))
        {
            local_84 = false;
        }
        else
        {
            local_84 = local_58.opArrow().bShowIndicator;
        }
        if (local_84)
        {
            local_228 = local_58.opArrow().GetIndicatorConfig();
        }
        else
        {
            local_228 = TDataObjectPtr<FIndicatorConfig>();
        }
        ::SetIndicatorConfig(Spot.opArrow(), local_228);
        TDataObjectPtr<FNavigationBarIconConfig> local_324;
        if (!(local_58))
        {
            local_84 = false;
        }
        else
        {
            local_84 = local_58.opArrow().bShowNavigationBarIcon;
        }
        if (local_84)
        {
            local_324 = local_58.opArrow().GetNavigationBarIconConfig();
        }
        else
        {
            local_324 = TDataObjectPtr<FNavigationBarIconConfig>();
        }
        ::SetNavigationBarIconConfig(Spot.opArrow(), local_324);
        TDataObjectPtr<FHeadsUpDisplayConfig> local_420;
        if (!(local_58))
        {
            local_84 = false;
        }
        else
        {
            local_84 = local_58.opArrow().bShowHeadsUpDisplay;
        }
        if (local_84)
        {
            local_420 = local_58.opArrow().GetHeadsUpDisplayConfig();
        }
        else
        {
            local_420 = TDataObjectPtr<FHeadsUpDisplayConfig>();
        }
        ::SetHeadsUpDisplayConfig(Spot.opArrow(), local_420);
        ::SetSpotName(Spot.opArrow(), TeleporterConfig.opArrow().DisplayName, Registry);
        ::SetSpotDescription(Spot.opArrow(), TeleporterConfig.opArrow().Description, Registry);
        return;
    }
    TDataObjectPtr<FPresentationConfig> ResolvePresentationConfig(const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig, const FMS_TeleporterData &inout TeleporterData) const
    {
        if (!((int(TeleporterData.GetTeleporterState(TeleporterConfig))) == 2) && TeleporterConfig.opArrow().GetInactivePresentationConfig())
        {
            return TeleporterConfig.opArrow().GetInactivePresentationConfig();
        }
        return TeleporterConfig.opArrow().GetPresentationConfig();
    }
    const TMap<TDataObjectPtr<FTeleporterConfig>, TEUIModelRef<FM_Spot>> GetTeleporterSpots() const property
    {
        const TMap<TDataObjectPtr<FTeleporterConfig>, TEUIModelRef<FM_Spot>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<TDataObjectPtr<FTeleporterConfig>, TEUIModelRef<FM_Spot>> GetModify_TeleporterSpots() property
    {
        TMap<TDataObjectPtr<FTeleporterConfig>, TEUIModelRef<FM_Spot>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTeleporterSpots(const TMap<TDataObjectPtr<FTeleporterConfig>, TEUIModelRef<FM_Spot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeleporterSpots = __Value;
        return;
    }
    const TMap<FECSEntity, TEUIModelRef<FM_TeleporterSpotUpdater>> GetEntityUpdaters() const property
    {
        const TMap<FECSEntity, TEUIModelRef<FM_TeleporterSpotUpdater>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<FECSEntity, TEUIModelRef<FM_TeleporterSpotUpdater>> GetModify_EntityUpdaters() property
    {
        TMap<FECSEntity, TEUIModelRef<FM_TeleporterSpotUpdater>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEntityUpdaters(const TMap<FECSEntity, TEUIModelRef<FM_TeleporterSpotUpdater>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EntityUpdaters = __Value;
        return;
    }
    bool GetbShowAllTeleporters() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bShowAllTeleporters;
    }
    void SetbShowAllTeleporters(const bool __Value) property
    {
        if (!(this.m_bShowAllTeleporters) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bShowAllTeleporters = __Value;
        return;
    }
}

namespace FM_TeleporterSpotUpdater
{
FM_TeleporterSpotUpdater& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot, const FECSEntity &inout Entity, const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig)
{
    return FM_TeleporterSpotUpdater::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot, Entity, TeleporterConfig);
}
FM_TeleporterSpotUpdater CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot, const FECSEntity &inout Entity, const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig)
{
    FM_TeleporterSpotUpdater __r;
    TEUIModelRef<FM_TeleporterSpotUpdater> local_6 = TEUIModelRef<FM_TeleporterSpotUpdater>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_TeleporterSpotUpdater::ModelId, 0, Spot, Entity, TeleporterConfig));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnEntityLoadOrUnloadOnClient";
    local_14.ComponentType = FC_Transform;
    local_14.MonitorPropertyName = FName("Entity");
    int local_2_2 = FM_TeleporterSpotUpdater::__IndexOf_Entity();
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_TeleporterSpotUpdater;
}
void __OnEntityLoadOrUnloadOnClient(FM_TeleporterSpotUpdater &inout Model, const FECSEntity &inout Entity, const FC_Transform &inout Component)
{
    Model.OnEntityLoadOrUnloadOnClient(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_Entity()
{
    return 1;
}
int __IndexOf_TeleporterConfig()
{
    return 2;
}
}
namespace FMS_TeleporterSpotManager
{
FMS_TeleporterSpotManager& Get(const UObject ContextObject)
{
    return FMS_TeleporterSpotManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_TeleporterSpotManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_TeleporterSpotManager __r;
    TEUIModelRef<FMS_TeleporterSpotManager> local_6 = TEUIModelRef<FMS_TeleporterSpotManager>(EUIInternal::MakeModelWithManager(Manager, FMS_TeleporterSpotManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnECSWorldBegin";
    local_14.MessageTypeName = "Msg_ECSWorldBegin";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    FEUIModelMonitorDefine local_28;
    local_28.FunctionName = "__DS_OnTeleportersModified";
    local_28.ComponentType = FCS_Teleporters;
    Result.MonitorFunctions.Add(local_28);
    local_14.FunctionName = "__OnTeleporterStateChanged";
    local_14.MessageTypeName = "Msg_TeleporterStateChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_TeleporterSpotManager;
}
void __OnECSWorldBegin(FMS_TeleporterSpotManager &inout Model, const FMsg_ECSWorldBegin &inout Message)
{
    Model.OnECSWorldBegin(Message);
    return;
}
void __DS_OnTeleportersModified(FMS_TeleporterSpotManager &inout Model, const FECSEntity &inout Entity, const FCS_Teleporters &inout Component)
{
    Get local_4;
    Model.DS_OnTeleportersModified(local_4.opCall());
    return;
}
void __OnTeleporterStateChanged(FMS_TeleporterSpotManager &inout Model, const FMsg_TeleporterStateChanged &inout Message)
{
    Model.OnTeleporterStateChanged(Message);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_TeleporterSpots()
{
    return 0;
}
int __IndexOf_EntityUpdaters()
{
    return 1;
}
int __IndexOf_bShowAllTeleporters()
{
    return 2;
}
}
