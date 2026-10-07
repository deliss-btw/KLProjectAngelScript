
enum ELevelSpotViewerSource
{
    None,
    Player,
    Team,
}

namespace FM_ActiveEntityLevelSpotUpdater
{
    const int ModelId = 0;
}
namespace FM_LevelSpotClientCache
{
    const int ModelId = 0;
}
namespace FMS_LevelSpotManager
{
    const int ModelId = 0;

}
struct FM_ActiveEntityLevelSpotUpdater : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    FECSEntity m_Entity;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;

    FM_ActiveEntityLevelSpotUpdater()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_ActiveEntityLevelSpotUpdater' by default constructor.");
        return;
    }
    FM_ActiveEntityLevelSpotUpdater(const FM_ActiveEntityLevelSpotUpdater &inout Other)
    {
        this.m_Entity = Other.m_Entity;
        this.m_Spot = Other.m_Spot;
        return;
    }
    FM_ActiveEntityLevelSpotUpdater(const FECSEntity &inout InEntity, const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEntity(InEntity);
        this.SetSpot(InSpot);
        return;
    }
    FM_ActiveEntityLevelSpotUpdater& opAssign(const FM_ActiveEntityLevelSpotUpdater &inout Other)
    {
        this.m_Entity = Other.m_Entity;
        return Other.m_Spot;
    }
    void PostConstruct()
    {
        Get local_4;
        this.SyncDataFromLevelSpotComponent(local_4.opCall());
        return;
    }
    void ManualAsyncTick()
    {
        const AActor local_10;
        int local_38 = 0;
        if (!(this.GetEntity().IsValid()) || !(this.GetEntity().IsActive()))
        {
            ::FMS_LevelSpotManager::Get(this.GetContext().Manager).OnUpdaterRemove(TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>(this));
            return;
        }
        if (!(this.GetSpot()))
        {
            ::FMS_LevelSpotManager::Get(this.GetContext().Manager).OnUpdaterRemove(TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>(this));
            return;
        }
        local_10 = this.GetEntity().GetActor();
        if (local_10 != nullptr)
        {
            bool local_35;
            FVector local_16(local_10.GetActorLocation());
            FVector3f local_31 = FVector3f(local_10.GetActorRotation().Euler());
            bool local_1 = !(this.GetSpot().opArrow().GetTransform().Has3DPosition()) || !((this.GetSpot().opArrow().GetTransform().GetPosition() == local_16));
            local_35 = !(this.GetSpot().opArrow().GetTransform().Has3DRotation()) || !((this.GetSpot().opArrow().GetTransform().GetEulerRotation() == local_31));
            if (!(local_1) && !(local_35))
            {
                return;
            }
            TEUIModelRef<FM_Spot> local_6 = this.GetSpot();
            if (local_1)
            {
                local_38.SetPosition(local_16);
            }
            if (local_35)
            {
                local_38.SetEulerRotation(local_31);
            }
        }
        else
        {
            bool local_35;
            FTransform local_64 = FTransformUtils::GetTransform(this.GetEntity(), this.GetContext().Time);
            FVector local_22 = local_64.GetLocation();
            FVector3f local_34 = FVector3f(local_64.GetRotation().Euler());
            bool local_2 = !(this.GetSpot().opArrow().GetTransform().Has3DPosition()) || !((this.GetSpot().opArrow().GetTransform().GetPosition() == local_22));
            local_35 = !(this.GetSpot().opArrow().GetTransform().Has3DRotation()) || !((this.GetSpot().opArrow().GetTransform().GetEulerRotation() == local_34));
            if (!(local_2) && !(local_35))
            {
                return;
            }
            TEUIModelRef<FM_Spot> local_6_2 = this.GetSpot();
            if (local_2)
            {
                local_38.SetPosition(local_22);
            }
            if (local_35)
            {
                local_38.SetEulerRotation(local_34);
            }
        }
        return;
    }
    void DS_OnEntityLevelSpotChanged(const FC_LevelSpot &inout C_LevelSpot)
    {
        this.SyncDataFromLevelSpotComponent(C_LevelSpot);
        return;
    }
    FLevelSpotId GetMainSpotId() const
    {
        FLevelSpotId __r;
        FLevelSpotId local_2 = ::EntityLevelSpotUtils::GetMainSpotId(this.GetEntity());
        return __r;
    }
    void SyncDataFromLevelSpotComponent(const FC_LevelSpot &inout C_LevelSpot)
    {
        if (!(this.IsValid()))
        {
            return;
        }
        FMS_LevelSpotManager& local_4 = ::FMS_LevelSpotManager::Get(this.GetContext().Manager);
        if (!(C_LevelSpot))
        {
            local_4.OnUpdaterRemove(TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>(this));
            return;
        }
        if (!(::LevelSpotViewerUtils::GetLevelSpotDataFromSpotInfo(this.GetContext().GetLocalPlayer(), C_LevelSpot.GetLevelSpotInfo())))
        {
            local_4.OnUpdaterRemove(TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>(this));
            return;
        }
        TEUIModelRef<FM_SpotRegistry> local_264 = ::FMS_LevelSpotManager::Get(this.GetContext().Manager).GetManagedSpotRegistry();
        TEUIModelRef<FM_Spot> local_266 = this.GetSpot();
        return;
    }
    bool IsValid() const
    {
        return this.GetEntity().IsValid() && this.GetEntity().IsActive();
    }
    FECSEntity GetEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_Entity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Entity = __Value;
        return;
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(1);
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
        this.MarkPropertyDirty(1);
        this.m_Spot = __Value;
        return;
    }
}

struct FM_LevelSpotClientCache : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_PresentationSpot;
    UPROPERTY()
    TEUIModelRef<FM_ActiveEntityLevelSpotUpdater> m_Updater;
    UPROPERTY()
    FLevelSpotId m_SpotId;
    UPROPERTY()
    FPresentationSpotTransform m_TransformFromViewer;
    UPROPERTY()
    FLevelSpotData m_LevelSpotDataFromViewer;
    UPROPERTY()
    ELevelSpotViewerSource m_LastViewerSource;
    UPROPERTY()
    uint m_LastViewerDataVersion;

    FM_LevelSpotClientCache()
    {
        this.m_LastViewerDataVersion = 0;
        this.m_LastViewerSource = ELevelSpotViewerSource(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_LevelSpotClientCache' by default constructor.");
        return;
    }
    FM_LevelSpotClientCache(const FM_LevelSpotClientCache &inout Other)
    {
        this.m_LastViewerDataVersion = 0;
        this.m_LastViewerSource = ELevelSpotViewerSource(0);
        this.m_PresentationSpot = Other.m_PresentationSpot;
        this.m_Updater = Other.m_Updater;
        this.m_TransformFromViewer = Other.m_TransformFromViewer;
        this.m_LastViewerSource = Other.m_LastViewerSource;
        this.m_LastViewerDataVersion = int(Other.m_LastViewerDataVersion);
        return;
    }
    FM_LevelSpotClientCache(const TEUIModelRef<FM_Spot> &inout InPresentationSpot)
    {
        this.m_LastViewerDataVersion = 0;
        this.m_LastViewerSource = ELevelSpotViewerSource(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPresentationSpot(InPresentationSpot);
        return;
    }
    FM_LevelSpotClientCache opAssign(const FM_LevelSpotClientCache &inout Other)
    {
        FM_LevelSpotClientCache __r;
        this.m_PresentationSpot = Other.m_PresentationSpot;
        this.m_Updater = Other.m_Updater;
        this.m_TransformFromViewer = Other.m_TransformFromViewer;
        this.m_LastViewerSource = Other.m_LastViewerSource;
        this.m_LastViewerDataVersion = int(Other.m_LastViewerDataVersion);
        return __r;
    }
    bool IsSameViewerEntryVersion(const ELevelSpotViewerSource Source, const uint DataVersion) const
    {
        return (int(this.GetLastViewerSource())) == (int(Source)) && (this.GetLastViewerDataVersion() == DataVersion);
    }
    bool TrySyncFromViewerData(const FECSEntity &inout ViewerPlayer, const FLevelSpotViewerData &inout ViewerData, const ELevelSpotViewerSource Source)
    {
        if (!((int(Source) != 0)))
        {
            return false;
        }
        TConstRawPtr<FEntityLevelSpotViewData> local_6 = ViewerData.GetEntitySpots().Find(this.GetSpotId());
        if (local_6)
        {
            int local_9;
            local_9 = local_6.opArrow().GetDataVersion();
            if (!(!(this.IsSameViewerEntryVersion(ELevelSpotViewerSource(Source), local_9))))
            {
                this.EnsureUpdaterDeferredIfNeeded();
                if (this.GetUpdater())
                {
                    return true;
                }
                FPresentationSpotTransform local_22;
                this.ResolveEntityTransform(ViewerPlayer, local_6.opArrow().GetOwnerEntityId(), this.GetSpotId(), local_22);
                this.UpdateTransformFromViewer(local_22);
                return true;
            }
            FPresentationSpotTransform local_22;
            this.ResolveEntityTransform(ViewerPlayer, local_6.opArrow().GetOwnerEntityId(), this.GetSpotId(), local_22);
            this.UpdateFromViewer(local_22, local_6.opArrow().GetData(), ELevelSpotViewerSource(local_9));
            return true;
        }
        TConstRawPtr<FPositionLevelSpotViewData> local_24 = ViewerData.GetPositionSpots().Find(this.GetSpotId());
        if (local_24)
        {
            int local_9;
            local_9 = local_24.opArrow().GetDataVersion();
            if (this.IsSameViewerEntryVersion(ELevelSpotViewerSource(Source), local_9))
            {
                this.EnsureUpdaterDeferredIfNeeded();
                return true;
            }
            FPresentationSpotTransform local_22;
            local_22.SetPosition(local_24.opArrow().GetPosition());
            this.UpdateFromViewer(local_22, local_24.opArrow().GetData(), ELevelSpotViewerSource(local_9));
            return true;
        }
        return false;
    }
    void UpdateTransformFromViewer(const FPresentationSpotTransform &inout Transform)
    {
        if ((FPresentationSpotTransform(this.GetTransformFromViewer()) == Transform))
        {
            this.EnsureUpdaterDeferredIfNeeded();
            return;
        }
        this.SetTransformFromViewer(Transform);
        if (!(this.GetUpdater()))
        {
            this.EnsureUpdaterDeferredIfNeeded();
            this.SyncViewerTransformToSpot();
        }
        return;
    }
    void UpdateFromViewer(const FPresentationSpotTransform &inout Transform, const FLevelSpotData &inout LevelSpotData, const ELevelSpotViewerSource Source, const uint DataVersion)
    {
        if (!((int(Source) != 0)))
        {
            return;
        }
        bool local_3 = !(this.IsSameViewerEntryVersion(ELevelSpotViewerSource(Source), DataVersion));
        bool local_4 = !((FPresentationSpotTransform(this.GetTransformFromViewer()) == Transform));
        this.SetLastViewerSource(ELevelSpotViewerSource(Source));
        this.SetLastViewerDataVersion(DataVersion);
        if ((!(local_3) && !(local_4)))
        {
            this.EnsureUpdaterDeferredIfNeeded();
            return;
        }
        if (local_4)
        {
            this.SetTransformFromViewer(Transform);
        }
        if (local_3)
        {
            this.SetLevelSpotDataFromViewer(LevelSpotData);
        }
        if (!(this.GetUpdater()))
        {
            this.EnsureUpdaterDeferredIfNeeded();
            if (local_4)
            {
                this.SyncViewerTransformToSpot();
            }
            if (local_3)
            {
                this.SyncViewerConfigToSpot();
            }
        }
        return;
    }
    void ResolveEntityTransform(const FECSEntity &inout ViewerPlayer, const FECSEntityId &inout OwnerEntityId, const FLevelSpotId &inout SourceSpotId, FPresentationSpotTransform &inout OutTransform)
    {
        float32 local_20;
        OutTransform = FPresentationSpotTransform();
        FVector local_14;
        FVector2D local_18;
        if (::AttributeSampleUtils::SamplePosition(ViewerPlayer, OwnerEntityId, local_14))
        {
            OutTransform.SetPosition(local_14);
        }
        else
        {
            if (::AttributeSampleUtils::SamplePosition2D(ViewerPlayer, OwnerEntityId, local_18))
            {
                OutTransform.SetPosition2D(local_18);
            }
            else
            {
            }
        }
        FVector3f local_23;
        if (::AttributeSampleUtils::SampleRotationAngle(ViewerPlayer, OwnerEntityId, local_20))
        {
            OutTransform.SetAngle(local_20);
            return;
        }
        if (::AttributeSampleUtils::SampleRotation(ViewerPlayer, OwnerEntityId, local_23))
        {
            OutTransform.SetEulerRotation(local_23);
        }
        return;
    }
    void RemoveUpdater()
    {
        FEUIModelRef local_2;
        this.SetUpdater(TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>(local_2));
        if ((int(this.GetLastViewerSource())) != 0)
        {
            this.SyncViewerDataToSpot();
        }
        return;
    }
    void SetOwnerEntityId(const FECSEntityId &inout OwnerEntityId)
    {
        ::SetOwnerEntityId(this.GetPresentationSpot().opArrow(), OwnerEntityId);
        return;
    }
    void SyncViewerDataToSpot()
    {
        this.SyncViewerTransformToSpot();
        this.SyncViewerConfigToSpot();
        return;
    }
    void SyncViewerTransformToSpot()
    {
        this.GetPresentationSpot().opArrow().SetTransform(this.GetTransformFromViewer());
        return;
    }
    void SyncViewerConfigToSpot()
    {
        TEUIModelRef<FM_SpotRegistry> local_4 = ::FMS_LevelSpotManager::Get(this.GetManager()).GetManagedSpotRegistry();
        TEUIModelRef<FM_Spot> local_8 = this.GetPresentationSpot();
        return;
    }
    void EnsureUpdaterDeferredIfNeeded()
    {
        if (this.GetUpdater())
        {
            return;
        }
        FECSEntity local_8 = FECSEntity(::GetOwnerEntityId(this.GetPresentationSpot().opArrow()));
        if (local_8)
        {
            if (local_8.IsActive())
            {
                ::FMS_LevelSpotManager::Get(this.GetManager()).SetEntityNeedUpdaterDeferred(local_8);
            }
        }
        return;
    }
    TEUIModelRef<FM_Spot> GetPresentationSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PresentationSpot;
    }
    void SetPresentationSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_PresentationSpot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PresentationSpot = __Value;
        return;
    }
    TEUIModelRef<FM_ActiveEntityLevelSpotUpdater> GetUpdater() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Updater;
    }
    void SetUpdater(const TEUIModelRef<FM_ActiveEntityLevelSpotUpdater> &inout __Value) property
    {
        TEUIModelRef<FM_ActiveEntityLevelSpotUpdater> local_2;
        local_2 = this.m_Updater;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Updater = __Value;
        return;
    }
    FLevelSpotId GetSpotId() const property
    {
        FLevelSpotId __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FLevelSpotId GetModify_SpotId() property
    {
        FLevelSpotId __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetSpotId(const FLevelSpotId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    const FPresentationSpotTransform GetTransformFromViewer() const property
    {
        const FPresentationSpotTransform __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FPresentationSpotTransform GetModify_TransformFromViewer() property
    {
        FPresentationSpotTransform __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTransformFromViewer(const FPresentationSpotTransform &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TransformFromViewer = __Value;
        return;
    }
    const FLevelSpotData GetLevelSpotDataFromViewer() const property
    {
        const FLevelSpotData __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FLevelSpotData GetModify_LevelSpotDataFromViewer() property
    {
        FLevelSpotData __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetLevelSpotDataFromViewer(const FLevelSpotData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        return;
    }
    ELevelSpotViewerSource GetLastViewerSource() const property
    {
        this.TrackPropertyRead(5);
        return this.m_LastViewerSource;
    }
    void SetLastViewerSource(const ELevelSpotViewerSource __Value) property
    {
        if (int(this.m_LastViewerSource) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_LastViewerSource = __Value;
        return;
    }
    uint GetLastViewerDataVersion() const property
    {
        this.TrackPropertyRead(6);
        return this.m_LastViewerDataVersion;
    }
    void SetLastViewerDataVersion(const uint __Value) property
    {
        if (this.m_LastViewerDataVersion == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_LastViewerDataVersion = __Value;
        return;
    }
}

struct FMS_LevelSpotManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_SpotRegistry> m_SpotRegistry;
    UPROPERTY()
    TArray<TEUIModelRef<FM_LevelSpotClientCache>> m_AllLevelSpots;
    UPROPERTY()
    TMap<FLevelSpotId, int> m_AllLevelSpotsIndex;
    UPROPERTY()
    TSet<FLevelSpotId> m_PlayerSpots;
    UPROPERTY()
    TSet<FLevelSpotId> m_TeamSpots;
    UPROPERTY()
    TSet<FLevelSpotId> m_EntitySpots;
    UPROPERTY()
    TMap<FECSEntityId, TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>> m_EntityUpdaters;
    UPROPERTY()
    TSet<FLevelSpotId> m_NoSourceSpots;
    UPROPERTY()
    TArray<FLevelSpotId> m_PendingInitialSync;
    UPROPERTY()
    int m_PartialUpdateIndex;
    UPROPERTY()
    FECSEntity m_TeamEntity;
    UPROPERTY()
    bool m_bNeedFullUpdate;
    UPROPERTY()
    TArray<FECSEntity> m_EntitiesNeedUpdater;

    FMS_LevelSpotManager()
    {
        this.m_PartialUpdateIndex = 0;
        this.m_bNeedFullUpdate = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_LevelSpotManager(const FMS_LevelSpotManager &inout Other)
    {
        this.m_PartialUpdateIndex = 0;
        this.m_bNeedFullUpdate = false;
        this.m_SpotRegistry = Other.m_SpotRegistry;
        this.m_AllLevelSpots = Other.m_AllLevelSpots;
        this.m_AllLevelSpotsIndex = Other.m_AllLevelSpotsIndex;
        this.m_PlayerSpots = Other.m_PlayerSpots;
        this.m_TeamSpots = Other.m_TeamSpots;
        this.m_EntitySpots = Other.m_EntitySpots;
        this.m_EntityUpdaters = Other.m_EntityUpdaters;
        this.m_NoSourceSpots = Other.m_NoSourceSpots;
        this.m_PendingInitialSync = Other.m_PendingInitialSync;
        this.m_PartialUpdateIndex = int(Other.m_PartialUpdateIndex);
        this.m_TeamEntity = Other.m_TeamEntity;
        this.m_bNeedFullUpdate = Other.m_bNeedFullUpdate;
        this.m_EntitiesNeedUpdater = Other.m_EntitiesNeedUpdater;
        return;
    }
    FMS_LevelSpotManager& opAssign(const FMS_LevelSpotManager &inout Other)
    {
        this.m_SpotRegistry = Other.m_SpotRegistry;
        this.m_AllLevelSpots = Other.m_AllLevelSpots;
        this.m_AllLevelSpotsIndex = Other.m_AllLevelSpotsIndex;
        this.m_PlayerSpots = Other.m_PlayerSpots;
        this.m_TeamSpots = Other.m_TeamSpots;
        this.m_EntitySpots = Other.m_EntitySpots;
        this.m_EntityUpdaters = Other.m_EntityUpdaters;
        this.m_NoSourceSpots = Other.m_NoSourceSpots;
        this.m_PendingInitialSync = Other.m_PendingInitialSync;
        this.m_PartialUpdateIndex = int(Other.m_PartialUpdateIndex);
        this.m_TeamEntity = Other.m_TeamEntity;
        this.m_bNeedFullUpdate = Other.m_bNeedFullUpdate;
        return Other.m_EntitiesNeedUpdater;
    }
    void PostConstruct()
    {
        this.SetSpotRegistry(TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetLevelSpotRegistry(this.GetManager())));
        return;
    }
    TEUIModelRef<FM_SpotRegistry> GetManagedSpotRegistry() const
    {
        return this.GetSpotRegistry();
    }
    void SetEntityNeedUpdaterDeferred(const FECSEntity &inout Entity)
    {
        this.GetModify_EntitiesNeedUpdater().Add(Entity);
        return;
    }
    void DS_OnPlayerTeamChanged(const FC_PlayerInTeam &inout C_PlayerInTeam)
    {
        FECSEntity local_6;
        if (C_PlayerInTeam)
        {
            local_6 = C_PlayerInTeam.GetTeamEntity();
        }
        else
        {
            local_6 = ENTITY_NULL;
        }
        this.SetTeamEntity(local_6);
        return;
    }
    void DS_OnTeamLevelSpotsModified(const FC_LevelSpotTeamViewer &inout C_TeamViewer)
    {
        if (C_TeamViewer)
        {
            this.UpdateSpotCache(C_TeamViewer.GetViewerData(), this.GetModify_TeamSpots());
        }
        else
        {
            this.ClearSpotCache(this.GetModify_TeamSpots());
        }
        this.SetbNeedFullUpdate(true);
        return;
    }
    void DS_OnPlayerLevelSpotsModified(const FC_LevelSpotPlayerViewer &inout C_PlayerViewer)
    {
        if (C_PlayerViewer)
        {
            this.UpdateSpotCache(C_PlayerViewer.GetViewerData(), this.GetModify_PlayerSpots());
        }
        else
        {
            this.ClearSpotCache(this.GetModify_PlayerSpots());
        }
        this.SetbNeedFullUpdate(true);
        return;
    }
    void DS_OnNotifyNewLevelSpotEntity(const FCE_NotifyNewLevelSpotEntity &inout C_NotifyNewLevelSpotEntity)
    {
        C_NotifyNewLevelSpotEntity.Entity.GetId();
        FLevelSpotId local_2 = ::EntityLevelSpotUtils::GetMainSpotId(C_NotifyNewLevelSpotEntity.Entity);
        return;
    }
    void ManualAsyncTick()
    {
        int local_21 = 0;
        int local_32 = 0;
        int local_46 = 0;
        for (auto& local_20 : this.GetNoSourceSpots())
        {
            this.RemoveLevelSpotCache(local_20);
        }
        this.GetModify_NoSourceSpots().Empty(0);
        FECSEntity local_26 = this.GetContext().GetLocalPlayer();
        ::FTeamUtils::GetTeamEntityForController(this.GetContext().GetLocalPlayer());
        for (auto& local_20 : this.GetPendingInitialSync())
        {
            if (this.GetAllLevelSpotsIndex().Find(local_20))
            {
                this.SyncCacheAtIndex(local_21, local_32, local_46);
            }
        }
        this.GetModify_PendingInitialSync().Empty(0);
        this.PartialUpdateStep(5);
        for (auto& local_76 : this.GetEntitiesNeedUpdater())
        {
            this.RequireCacheForEntity(::EntityLevelSpotUtils::GetMainSpotId(local_76), local_76.GetId());
        }
        this.GetModify_EntitiesNeedUpdater().Empty(0);
        return;
    }
    void InvalidateEntityCache()
    {
        for (auto& local_16 : this.GetAllLevelSpots())
        {
            this.GetModify_NoSourceSpots().Add(local_16.opArrow().GetSpotId());
        }
        this.GetModify_PlayerSpots().Empty(0);
        this.GetModify_TeamSpots().Empty(0);
        this.GetModify_EntitySpots().Empty(0);
        this.GetModify_EntityUpdaters().Empty(0);
        this.FullUpdate();
        return;
    }
    void OnUpdaterRemove(const TEUIModelRef<FM_ActiveEntityLevelSpotUpdater> &inout Updater)
    {
        int local_11 = 0;
        FECSEntityId local_1 = Updater.opArrow().GetEntity().GetId();
        if (false)
        {
            FLevelSpotId local_4 = Updater.opArrow().GetMainSpotId();
            if (this.GetAllLevelSpotsIndex().Find(local_4))
            {
                this.GetAllLevelSpots()[local_11].opArrow().RemoveUpdater();
            }
            this.UnregisterSpotSource(local_4, this.GetModify_EntitySpots());
        }
        return;
    }
    void UpdateSpotCache(const FLevelSpotViewerData &inout ViewerData, TSet<FLevelSpotId> &inout CacheSpotSet)
    {
        for (auto& local_20 : ViewerData.GetEntitySpots())
        {
            if (this.RegisterSpotSource(local_20.GetKey(), CacheSpotSet))
            {
                this.RequireCacheForEntity(local_20.GetKey(), GetOwnerEntityId());
            }
        }
        for (auto& local_38 : ViewerData.GetPositionSpots())
        {
            if (this.RegisterSpotSource(local_38.GetKey(), CacheSpotSet))
            {
                this.RequireCache(local_38.GetKey());
            }
        }
        TArray<FLevelSpotId> local_42;
        for (auto local_60 : CacheSpotSet)
        {
            if (!(ViewerData.HasSpot(local_60)))
            {
                local_42.Add(local_60);
            }
        }
        for (auto local_60 : local_42)
        {
            this.UnregisterSpotSource(local_60, CacheSpotSet);
        }
        return;
    }
    void ClearSpotCache(TSet<FLevelSpotId> &inout CacheSpotSet)
    {
        TSet<FLevelSpotId> local_20 = CacheSpotSet;
        CacheSpotSet.Empty(0);
        for (auto& local_42 : local_20)
        {
            if (!(this.SpotHasAnyCacheSource(local_42)))
            {
                this.GetModify_NoSourceSpots().Add(local_42);
            }
        }
        return;
    }
    bool SpotHasAnyCacheSource(const FLevelSpotId &inout SpotId)
    {
        return this.GetPlayerSpots().Contains(SpotId) || this.GetTeamSpots().Contains(SpotId) || this.GetEntitySpots().Contains(SpotId);
    }
    void FullUpdate()
    {
        int local_32 = 0;
        int local_46 = 0;
        for (auto& local_20 : this.GetNoSourceSpots())
        {
            this.RemoveLevelSpotCache(local_20);
        }
        this.GetModify_NoSourceSpots().Empty(0);
        this.GetModify_PendingInitialSync().Empty(0);
        FECSEntity local_26 = this.GetContext().GetLocalPlayer();
        ::FTeamUtils::GetTeamEntityForController(this.GetContext().GetLocalPlayer());
        int local_47 = 0;
        for (; local_47 < this.GetAllLevelSpots().Num(); )
        {
            this.SyncCacheAtIndex(local_47, local_32, local_46);
            ++local_47;
        }
        this.SetPartialUpdateIndex(0);
        return;
    }
    void PartialUpdateStep(const int MaxCount)
    {
        int local_16 = 0;
        int local_30 = 0;
        int local_2 = this.GetAllLevelSpots().Num();
        if (local_2 == 0)
        {
            return;
        }
        int local_1 = FMath::Min(MaxCount, local_2);
        int local_5 = this.GetPartialUpdateIndex();
        FECSEntity local_10 = this.GetContext().GetLocalPlayer();
        ::FTeamUtils::GetTeamEntityForController(this.GetContext().GetLocalPlayer());
        int local_31 = 0;
        for (; local_31 < local_1; )
        {
            if (local_5 >= local_2)
            {
                local_5 = 0;
            }
            this.SyncCacheAtIndex(local_5, local_16, local_30);
            ++local_5;
            ++local_31;
        }
        this.SetPartialUpdateIndex(local_5);
        return;
    }
    void SyncCacheAtIndex(const int Index, const FC_LevelSpotPlayerViewer &inout PlayerViewer, const FC_LevelSpotTeamViewer &inout TeamViewer)
    {
        const TEUIModelRef<FM_LevelSpotClientCache>& local_2 = this.GetAllLevelSpots()[Index];
        if (PlayerViewer && local_2.opArrow().TrySyncFromViewerData(this.GetContext().GetLocalPlayer(), PlayerViewer.GetViewerData(), ELevelSpotViewerSource(1)))
        {
            return;
        }
        else
        {
            if (TeamViewer && local_2.opArrow().TrySyncFromViewerData(this.GetContext().GetLocalPlayer(), TeamViewer.GetViewerData(), ELevelSpotViewerSource(2)))
            {
                return;
            }
        }
    }
    FM_LevelSpotClientCache RequireCache(const FLevelSpotId &inout SpotId)
    {
        int local_10 = 0;
        int local_14 = 0;
        FM_LevelSpotClientCache __r;
        if (this.GetAllLevelSpotsIndex().Find(SpotId))
        {
        }
        else
        {
            TEUIModelRef<FM_SpotRegistry> local_8 = this.GetSpotRegistry();
            TEUIModelRef<FM_Spot> local_12 = TEUIModelRef<FM_Spot>(local_10);
            local_14.SetSpotId(SpotId);
            this.GetModify_AllLevelSpotsIndex().Add(SpotId, this.GetAllLevelSpots().Num());
            this.GetModify_AllLevelSpots().Add(TEUIModelRef<FM_LevelSpotClientCache>(local_14));
            this.GetModify_PendingInitialSync().Add(SpotId);
        }
        return __r;
    }
    FM_LevelSpotClientCache& RequireCacheForEntity(const FLevelSpotId &inout SpotId, const FECSEntityId &inout EntityId)
    {
        bool local_5 = false;
        int local_6 = 0;
        int local_22 = 0;
        int local_26 = 0;
        if (this.GetAllLevelSpotsIndex().Find(SpotId))
        {
            const TEUIModelRef<FM_LevelSpotClientCache>& local_8 = this.GetAllLevelSpots()[local_6];
            local_5 = !(local_8.opArrow().GetUpdater());
            if (local_5)
            {
                FECSEntity local_14 = FECSEntity(EntityId);
                if (local_14)
                {
                    local_8.opArrow().SetUpdater(TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>(this.RequireUpdaterForEntity(local_14)));
                    this.RegisterSpotSource(SpotId, this.GetModify_EntitySpots());
                }
            }
        }
        else
        {
            TEUIModelRef<FM_SpotRegistry> local_20 = this.GetSpotRegistry();
            TEUIModelRef<FM_Spot> local_24 = TEUIModelRef<FM_Spot>(local_22);
            local_26.SetSpotId(SpotId);
            FECSEntity local_14_2 = FECSEntity(EntityId);
            if (local_14_2)
            {
                local_26.SetUpdater(TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>(this.RequireUpdaterForEntity(local_14_2)));
                this.RegisterSpotSource(SpotId, this.GetModify_EntitySpots());
            }
            this.GetModify_AllLevelSpotsIndex().Add(SpotId, this.GetAllLevelSpots().Num());
            this.GetModify_AllLevelSpots().Add(TEUIModelRef<FM_LevelSpotClientCache>(local_26));
            this.GetModify_PendingInitialSync().Add(SpotId);
        }
        return local_5;
    }
    FM_ActiveEntityLevelSpotUpdater RequireUpdaterForEntity(const FECSEntity &inout Entity)
    {
        int local_14 = 0;
        FM_ActiveEntityLevelSpotUpdater __r;
        if (this.GetEntityUpdaters().Find(Entity.GetId()))
        {
        }
        else
        {
            TEUIModelRef<FM_Spot> local_12 = TEUIModelRef<FM_Spot>(::PresentationSpotUtils::RequireEntitySpot(this.GetContext().Manager, Entity.GetId(), this.GetSpotRegistry()));
            this.GetModify_EntityUpdaters().Add(Entity.GetId(), TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>(local_14));
        }
        return __r;
    }
    void RemoveLevelSpotCache(const FLevelSpotId &inout SpotId)
    {
        int local_7 = 0;
        if (!(this.GetAllLevelSpotsIndex().Find(SpotId)))
        {
            return;
        }
        int local_6 = local_7;
        const TEUIModelRef<FM_LevelSpotClientCache>& local_10 = this.GetAllLevelSpots()[local_6];
        this.GetSpotRegistry().opArrow().RemoveSpot(local_10.opArrow().GetPresentationSpot());
        local_7 = this.GetAllLevelSpots().Num();
        local_7 = local_7 - 1;
        if (local_6 != local_7)
        {
            FLevelSpotId local_18;
            this.GetModify_AllLevelSpots()[local_6] = this.GetAllLevelSpots()[local_7];
            this.GetModify_AllLevelSpotsIndex()[local_18] = local_6;
        }
        this.GetModify_AllLevelSpots().RemoveAt(local_7);
        if (this.GetPartialUpdateIndex() >= this.GetAllLevelSpots().Num())
        {
            this.SetPartialUpdateIndex(0);
        }
        return;
    }
    bool RegisterSpotSource(const FLevelSpotId &inout SpotId, TSet<FLevelSpotId> &inout SourceSet)
    {
        if (SourceSet.Contains(SpotId))
        {
            return false;
        }
        SourceSet.Add(SpotId);
        return true;
    }
    void UnregisterSpotSource(const FLevelSpotId &inout SpotId, TSet<FLevelSpotId> &inout SourceSet)
    {
        if (!(false))
        {
            return;
        }
        if (!(this.SpotHasAnyCacheSource(SpotId)))
        {
            this.GetModify_NoSourceSpots().Add(SpotId);
            this.SetbNeedFullUpdate(true);
        }
        return;
    }
    TEUIModelRef<FM_SpotRegistry> GetSpotRegistry() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SpotRegistry;
    }
    void SetSpotRegistry(const TEUIModelRef<FM_SpotRegistry> &inout __Value) property
    {
        TEUIModelRef<FM_SpotRegistry> local_2;
        local_2 = this.m_SpotRegistry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SpotRegistry = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_LevelSpotClientCache>> GetAllLevelSpots() const property
    {
        const TArray<TEUIModelRef<FM_LevelSpotClientCache>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FM_LevelSpotClientCache>> GetModify_AllLevelSpots() property
    {
        TArray<TEUIModelRef<FM_LevelSpotClientCache>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAllLevelSpots(const TArray<TEUIModelRef<FM_LevelSpotClientCache>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AllLevelSpots = __Value;
        return;
    }
    const TMap<FLevelSpotId, int> GetAllLevelSpotsIndex() const property
    {
        const TMap<FLevelSpotId, int> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TMap<FLevelSpotId, int> GetModify_AllLevelSpotsIndex() property
    {
        TMap<FLevelSpotId, int> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAllLevelSpotsIndex(const TMap<FLevelSpotId, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AllLevelSpotsIndex = __Value;
        return;
    }
    const TSet<FLevelSpotId> GetPlayerSpots() const property
    {
        const TSet<FLevelSpotId> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TSet<FLevelSpotId> GetModify_PlayerSpots() property
    {
        TSet<FLevelSpotId> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPlayerSpots(const TSet<FLevelSpotId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PlayerSpots = __Value;
        return;
    }
    const TSet<FLevelSpotId> GetTeamSpots() const property
    {
        const TSet<FLevelSpotId> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TSet<FLevelSpotId> GetModify_TeamSpots() property
    {
        TSet<FLevelSpotId> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetTeamSpots(const TSet<FLevelSpotId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TeamSpots = __Value;
        return;
    }
    const TSet<FLevelSpotId> GetEntitySpots() const property
    {
        const TSet<FLevelSpotId> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TSet<FLevelSpotId> GetModify_EntitySpots() property
    {
        TSet<FLevelSpotId> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetEntitySpots(const TSet<FLevelSpotId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_EntitySpots = __Value;
        return;
    }
    const TMap<FECSEntityId, TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>> GetEntityUpdaters() const property
    {
        const TMap<FECSEntityId, TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TMap<FECSEntityId, TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>> GetModify_EntityUpdaters() property
    {
        TMap<FECSEntityId, TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetEntityUpdaters(const TMap<FECSEntityId, TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_EntityUpdaters = __Value;
        return;
    }
    const TSet<FLevelSpotId> GetNoSourceSpots() const property
    {
        const TSet<FLevelSpotId> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TSet<FLevelSpotId> GetModify_NoSourceSpots() property
    {
        TSet<FLevelSpotId> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetNoSourceSpots(const TSet<FLevelSpotId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_NoSourceSpots = __Value;
        return;
    }
    const TArray<FLevelSpotId> GetPendingInitialSync() const property
    {
        const TArray<FLevelSpotId> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<FLevelSpotId> GetModify_PendingInitialSync() property
    {
        TArray<FLevelSpotId> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetPendingInitialSync(const TArray<FLevelSpotId> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_PendingInitialSync = __Value;
        return;
    }
    int GetPartialUpdateIndex() const property
    {
        this.TrackPropertyRead(9);
        return this.m_PartialUpdateIndex;
    }
    void SetPartialUpdateIndex(const int __Value) property
    {
        if (this.m_PartialUpdateIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_PartialUpdateIndex = __Value;
        return;
    }
    const FECSEntity GetTeamEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FECSEntity GetModify_TeamEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetTeamEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_TeamEntity = __Value;
        return;
    }
    bool GetbNeedFullUpdate() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bNeedFullUpdate;
    }
    void SetbNeedFullUpdate(const bool __Value) property
    {
        if (!(this.m_bNeedFullUpdate) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bNeedFullUpdate = __Value;
        return;
    }
    const TArray<FECSEntity> GetEntitiesNeedUpdater() const property
    {
        const TArray<FECSEntity> __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    TArray<FECSEntity> GetModify_EntitiesNeedUpdater() property
    {
        TArray<FECSEntity> __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetEntitiesNeedUpdater(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_EntitiesNeedUpdater = __Value;
        return;
    }
}

namespace LevelSpotMarkUtils
{
bool TryGetPositionMarkWorldPos(const FECSEntity &inout Entity, FVector &inout OutMarkPosition)
{
    Has local_4;
    int local_12 = 0;
    if (!(local_4.opCall()))
    {
        return false;
    }
    if (!(local_12.GetCreaterPlayer()))
    {
        return false;
    }
    Get local_16;
    const FC_PlayerMarks& local_18 = local_16.opCall();
    if (local_18)
    {
        FMarkInfo local_54;
        if (local_18.GetAllMarks().Find(Entity.GetId(), local_54))
        {
            if ((FECSEntityId(local_54.GetMarkedEntityID()) == ENTITY_ID_NULL))
            {
                OutMarkPosition = local_54.GetMarkPosition();
                return true;
            }
        }
    }
    return false;
}
}
namespace FM_ActiveEntityLevelSpotUpdater
{
FM_ActiveEntityLevelSpotUpdater& Create(const UObject ContextObject, const FECSEntity &inout Entity, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FM_ActiveEntityLevelSpotUpdater::CreateByManager(EUIInternal::GetContextManager(ContextObject), Entity, Spot);
}
FM_ActiveEntityLevelSpotUpdater CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout Entity, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FM_ActiveEntityLevelSpotUpdater __r;
    TEUIModelRef<FM_ActiveEntityLevelSpotUpdater> local_6 = TEUIModelRef<FM_ActiveEntityLevelSpotUpdater>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_ActiveEntityLevelSpotUpdater::ModelId, 0, Entity, Spot));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__DS_OnEntityLevelSpotChanged";
    local_14.ComponentType = FC_LevelSpot;
    local_14.MonitorPropertyName = FName("Entity");
    int local_2_2 = FM_ActiveEntityLevelSpotUpdater::__IndexOf_Entity();
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_ActiveEntityLevelSpotUpdater;
}
void __DS_OnEntityLevelSpotChanged(FM_ActiveEntityLevelSpotUpdater &inout Model, const FECSEntity &inout Entity, const FC_LevelSpot &inout Component)
{
    Model.DS_OnEntityLevelSpotChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_Entity()
{
    return 0;
}
int __IndexOf_Spot()
{
    return 1;
}
}
namespace FM_LevelSpotClientCache
{
FM_LevelSpotClientCache& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout PresentationSpot)
{
    return FM_LevelSpotClientCache::CreateByManager(EUIInternal::GetContextManager(ContextObject), PresentationSpot);
}
FM_LevelSpotClientCache CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout PresentationSpot)
{
    FM_LevelSpotClientCache __r;
    TEUIModelRef<FM_LevelSpotClientCache> local_6 = TEUIModelRef<FM_LevelSpotClientCache>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_LevelSpotClientCache::ModelId, 0, PresentationSpot));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_LevelSpotClientCache;
}
int __IndexOf_PresentationSpot()
{
    return 0;
}
int __IndexOf_Updater()
{
    return 1;
}
int __IndexOf_SpotId()
{
    return 2;
}
int __IndexOf_TransformFromViewer()
{
    return 3;
}
int __IndexOf_LevelSpotDataFromViewer()
{
    return 4;
}
int __IndexOf_LastViewerSource()
{
    return 5;
}
int __IndexOf_LastViewerDataVersion()
{
    return 6;
}
}
namespace FMS_LevelSpotManager
{
FMS_LevelSpotManager& Get(const UObject ContextObject)
{
    return FMS_LevelSpotManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_LevelSpotManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_LevelSpotManager __r;
    TEUIModelRef<FMS_LevelSpotManager> local_6 = TEUIModelRef<FMS_LevelSpotManager>(EUIInternal::MakeModelWithManager(Manager, FMS_LevelSpotManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__DS_OnPlayerTeamChanged";
    local_14.ComponentType = FC_PlayerInTeam;
    Result.MonitorFunctions.Add(local_14);
    local_14.FunctionName = "__DS_OnTeamLevelSpotsModified";
    local_14.ComponentType = FC_LevelSpotTeamViewer;
    local_14.MonitorPropertyName = FName("TeamEntity");
    int local_2_2 = FMS_LevelSpotManager::__IndexOf_TeamEntity();
    Result.MonitorFunctions.Add(local_14);
    local_14.FunctionName = "__DS_OnPlayerLevelSpotsModified";
    local_14.ComponentType = FC_LevelSpotPlayerViewer;
    Result.MonitorFunctions.Add(local_14);
    FEUIModelEventDefine local_28;
    local_28.FunctionName = "__DS_OnNotifyNewLevelSpotEntity";
    local_28.EventType = FCE_NotifyNewLevelSpotEntity;
    Result.EventFunctions.Add(local_28);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_LevelSpotManager;
}
void __DS_OnPlayerTeamChanged(FMS_LevelSpotManager &inout Model, const FECSEntity &inout Entity, const FC_PlayerInTeam &inout Component)
{
    Model.DS_OnPlayerTeamChanged(Component);
    return;
}
void __DS_OnTeamLevelSpotsModified(FMS_LevelSpotManager &inout Model, const FECSEntity &inout Entity, const FC_LevelSpotTeamViewer &inout Component)
{
    Model.DS_OnTeamLevelSpotsModified(Component);
    return;
}
void __DS_OnPlayerLevelSpotsModified(FMS_LevelSpotManager &inout Model, const FECSEntity &inout Entity, const FC_LevelSpotPlayerViewer &inout Component)
{
    Model.DS_OnPlayerLevelSpotsModified(Component);
    return;
}
void __DS_OnNotifyNewLevelSpotEntity(FMS_LevelSpotManager &inout Model, const FCE_NotifyNewLevelSpotEntity &inout Event)
{
    Model.DS_OnNotifyNewLevelSpotEntity(Event);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_SpotRegistry()
{
    return 0;
}
int __IndexOf_AllLevelSpots()
{
    return 1;
}
int __IndexOf_AllLevelSpotsIndex()
{
    return 2;
}
int __IndexOf_PlayerSpots()
{
    return 3;
}
int __IndexOf_TeamSpots()
{
    return 4;
}
int __IndexOf_EntitySpots()
{
    return 5;
}
int __IndexOf_EntityUpdaters()
{
    return 6;
}
int __IndexOf_NoSourceSpots()
{
    return 7;
}
int __IndexOf_PendingInitialSync()
{
    return 8;
}
int __IndexOf_PartialUpdateIndex()
{
    return 9;
}
int __IndexOf_TeamEntity()
{
    return 10;
}
int __IndexOf_bNeedFullUpdate()
{
    return 11;
}
int __IndexOf_EntitiesNeedUpdater()
{
    return 12;
}
}
