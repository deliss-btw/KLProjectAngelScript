
namespace FMS_HeadsUpDisplay3DManager
{
    const int ModelId = 0;

}
struct FMS_HeadsUpDisplay3DManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_SpotFilter> m_SpotFilter;
    UPROPERTY()
    TMap<TEUIModelRef<FM_Spot>, AHeadsUpDisplay3DActor> m_SpotActors;
    UPROPERTY()
    TArray<AHeadsUpDisplay3DActor> m_ActorPool;
    UPROPERTY()
    TSubclassOf<AHeadsUpDisplay3DActor> m_CachedActorClass;
    UPROPERTY()
    TSet<TEUIModelRef<FM_Spot>> m_CachedWorldSpaceSpots;
    UPROPERTY()
    uint m_CachedDisplayingSpotsVersion;
    UPROPERTY()
    bool m_bWorldSpaceSpotCacheInitialized;
    UPROPERTY()
    TArray<TEUIModelRef<FM_Spot>> m_SpotsToRelease;

    FMS_HeadsUpDisplay3DManager()
    {
        this.m_CachedDisplayingSpotsVersion = 0;
        this.m_bWorldSpaceSpotCacheInitialized = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_HeadsUpDisplay3DManager(const FMS_HeadsUpDisplay3DManager &inout Other)
    {
        this.m_CachedDisplayingSpotsVersion = 0;
        this.m_bWorldSpaceSpotCacheInitialized = false;
        this.m_SpotFilter = Other.m_SpotFilter;
        this.m_SpotActors = Other.m_SpotActors;
        this.m_ActorPool = Other.m_ActorPool;
        this.m_CachedActorClass = Other.m_CachedActorClass;
        this.m_CachedWorldSpaceSpots = Other.m_CachedWorldSpaceSpots;
        this.m_CachedDisplayingSpotsVersion = int(Other.m_CachedDisplayingSpotsVersion);
        this.m_bWorldSpaceSpotCacheInitialized = Other.m_bWorldSpaceSpotCacheInitialized;
        this.m_SpotsToRelease = Other.m_SpotsToRelease;
        return;
    }
    FMS_HeadsUpDisplay3DManager& opAssign(const FMS_HeadsUpDisplay3DManager &inout Other)
    {
        this.m_SpotFilter = Other.m_SpotFilter;
        this.m_SpotActors = Other.m_SpotActors;
        this.m_ActorPool = Other.m_ActorPool;
        this.m_CachedActorClass = Other.m_CachedActorClass;
        this.m_CachedWorldSpaceSpots = Other.m_CachedWorldSpaceSpots;
        this.m_CachedDisplayingSpotsVersion = int(Other.m_CachedDisplayingSpotsVersion);
        this.m_bWorldSpaceSpotCacheInitialized = Other.m_bWorldSpaceSpotCacheInitialized;
        return Other.m_SpotsToRelease;
    }
    void PostConstruct()
    {
        if (!(HeadsUpDisplay_Dev::CVar_EnableHeadsUpDisplay.GetBool()))
        {
            return;
        }
        this.SetSpotFilter(::FMS_CommonSpotFilters::Get(this.GetManager()).GetOrCreateFilter(Cast<UObject>(this.GetManager()), EPresentationSpotUsage(3)));
        this.EnsureActorClassLoaded();
        if (this.GetSpotFilter())
        {
            this.RebuildWorldSpaceSpotCache();
            for (auto& local_28 : this.GetCachedWorldSpaceSpots())
            {
                this.AcquireActorForSpot(local_28);
            }
        }
        return;
    }
    void ManualAsyncTick()
    {
        if (!(HeadsUpDisplay_Dev::CVar_EnableHeadsUpDisplay.GetBool()) || !(this.GetSpotFilter()))
        {
            return;
        }
        TArray<TEUIModelRef<FM_Spot>>& local_8 = this.GetModify_SpotsToRelease();
        local_8.Reset(0);
        this.RefreshWorldSpaceSpotCacheIfNeeded();
        for (auto& local_28 : this.GetSpotActors())
        {
            if (!(this.GetCachedWorldSpaceSpots().Contains(local_28.GetKey())))
            {
                local_8.Add(local_28.GetKey());
            }
        }
        return;
    }
    void Tick()
    {
        AHeadsUpDisplay3DActor local_30;
        if (!(HeadsUpDisplay_Dev::CVar_EnableHeadsUpDisplay.GetBool()) || !(this.GetSpotFilter()))
        {
            return;
        }
        TArray<TEUIModelRef<FM_Spot>>& local_8 = this.GetModify_SpotsToRelease();
        for (auto& local_26 : this.GetCachedWorldSpaceSpots())
        {
            if (!(local_26))
            {
                continue;
            }
            bool local_5 = this.GetSpotActors().Contains(local_26);
            if (local_5)
            {
                if (local_30 != nullptr)
                {
                    local_30.SetActorLocation(::PresentationSpotUtils::GetSpotLocation(local_26));
                }
                else
                {
                    local_8.Add(local_26);
                }
                continue;
            }
            this.AcquireActorForSpot(local_26);
        }
        for (auto& local_26 : this.GetSpotsToRelease())
        {
            this.ReleaseActorForSpot(local_26);
        }
        return;
    }
    void RefreshWorldSpaceSpotCacheIfNeeded()
    {
        if (!(this.GetSpotFilter()))
        {
            return;
        }
        if (this.GetbWorldSpaceSpotCacheInitialized() && (this.GetCachedDisplayingSpotsVersion() == this.GetSpotFilter().opArrow().GetDisplayingSpotsVersion()))
        {
            return;
        }
        this.RebuildWorldSpaceSpotCache();
        return;
    }
    void RebuildWorldSpaceSpotCache()
    {
        TSet<TEUIModelRef<FM_Spot>> local_20;
        if (this.GetSpotFilter())
        {
            for (auto& local_38 : this.GetSpotFilter().opArrow().GetDisplayingSpots())
            {
                if (this.IsWorldSpaceSpot(local_38))
                {
                    local_20.Add(local_38);
                }
            }
            this.SetCachedDisplayingSpotsVersion(this.GetSpotFilter().opArrow().GetDisplayingSpotsVersion());
        }
        else
        {
            this.SetCachedDisplayingSpotsVersion(0);
        }
        this.SetCachedWorldSpaceSpots(local_20);
        this.SetbWorldSpaceSpotCacheInitialized(true);
        return;
    }
    void EnsureActorClassLoaded()
    {
        const UHeadsUpDisplaySettings local_6;
        if (!(this.GetCachedActorClass().IsValid()))
        {
            GetGameplaySettings<UHeadsUpDisplaySettings> local_8;
            local_6 = local_8;
            if (!(local_6.ActorClass.IsNull()))
            {
                this.SetCachedActorClass(TSubclassOf<AHeadsUpDisplay3DActor>(System::LoadClassAsset_Blocking(local_6.ActorClass)));
            }
        }
        return;
    }
    void AcquireActorForSpot(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (this.GetSpotActors().Contains(Spot))
        {
            return;
        }
        this.EnsureActorClassLoaded();
        if (!(this.GetCachedActorClass().IsValid()))
        {
            return;
        }
        AHeadsUpDisplay3DActor local_6 = this.AcquireActorFromPool();
        if ((!((local_6 != nullptr))))
        {
            return;
        }
        local_6.SetActorLocation(::PresentationSpotUtils::GetSpotLocation(Spot));
        FVM_HeadsUpDisplay& local_24 = ::FVM_HeadsUpDisplay::Create(this.GetManager(), Spot);
        FEUIModelContainer local_38;
        local_38.AddModel(FEUIModelRef(local_24), false);
        local_6.SetupDisplay(local_38);
        local_6.SetActorHiddenInGame(false);
        local_6.SetActorTickEnabled(true);
        this.GetModify_SpotActors().Add(Spot, local_6);
        return;
    }
    AHeadsUpDisplay3DActor AcquireActorFromPool()
    {
        AHeadsUpDisplay3DActor local_6;
        while (this.GetActorPool().Num() > 0)
        {
            this.GetModify_ActorPool().RemoveAt((this.GetActorPool().Num() - 1));
            if (local_6 != nullptr)
            {
                return local_6;
            }
        }
        return Cast<AHeadsUpDisplay3DActor>(SpawnActor(this.GetCachedActorClass(), FVector::ZeroVector, FRotator::ZeroRotator, NAME_None, false, nullptr, nullptr));
    }
    bool IsWorldSpaceSpot(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (!(Spot))
        {
            return false;
        }
        FSpotViewAdapter local_10;
        TDataObjectPtr<FHeadsUpDisplayConfig> local_34 = ::GetHeadsUpDisplayConfig(Spot.opArrow(), local_10);
        return local_34 && (int(local_34.opArrow().DisplayType) == 0);
    }
    void ReleaseActorForSpot(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        AHeadsUpDisplay3DActor local_2;
        if (this.GetSpotActors().Find(Spot, local_2))
        {
            if (local_2 != nullptr)
            {
                local_2.SetActorHiddenInGame(true);
                local_2.SetActorTickEnabled(false);
                local_2.ClearDisplay();
                this.GetModify_ActorPool().Add(local_2);
            }
        }
        return;
    }
    TEUIModelRef<FM_SpotFilter> GetSpotFilter() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SpotFilter;
    }
    void SetSpotFilter(const TEUIModelRef<FM_SpotFilter> &inout __Value) property
    {
        TEUIModelRef<FM_SpotFilter> local_2;
        local_2 = this.m_SpotFilter;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SpotFilter = __Value;
        return;
    }
    const TMap<TEUIModelRef<FM_Spot>, AHeadsUpDisplay3DActor> GetSpotActors() const property
    {
        const TMap<TEUIModelRef<FM_Spot>, AHeadsUpDisplay3DActor> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<TEUIModelRef<FM_Spot>, AHeadsUpDisplay3DActor> GetModify_SpotActors() property
    {
        TMap<TEUIModelRef<FM_Spot>, AHeadsUpDisplay3DActor> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSpotActors(const TMap<TEUIModelRef<FM_Spot>, AHeadsUpDisplay3DActor> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpotActors = __Value;
        return;
    }
    const TArray<AHeadsUpDisplay3DActor> GetActorPool() const property
    {
        const TArray<AHeadsUpDisplay3DActor> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<AHeadsUpDisplay3DActor> GetModify_ActorPool() property
    {
        TArray<AHeadsUpDisplay3DActor> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetActorPool(const TArray<AHeadsUpDisplay3DActor> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ActorPool = __Value;
        return;
    }
    TSubclassOf<AHeadsUpDisplay3DActor> GetCachedActorClass() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CachedActorClass;
    }
    void SetCachedActorClass(const TSubclassOf<AHeadsUpDisplay3DActor> &inout __Value) property
    {
        if ((this.m_CachedActorClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CachedActorClass = __Value;
        return;
    }
    const TSet<TEUIModelRef<FM_Spot>> GetCachedWorldSpaceSpots() const property
    {
        const TSet<TEUIModelRef<FM_Spot>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TSet<TEUIModelRef<FM_Spot>> GetModify_CachedWorldSpaceSpots() property
    {
        TSet<TEUIModelRef<FM_Spot>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCachedWorldSpaceSpots(const TSet<TEUIModelRef<FM_Spot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CachedWorldSpaceSpots = __Value;
        return;
    }
    uint GetCachedDisplayingSpotsVersion() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CachedDisplayingSpotsVersion;
    }
    void SetCachedDisplayingSpotsVersion(const uint __Value) property
    {
        if (this.m_CachedDisplayingSpotsVersion == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CachedDisplayingSpotsVersion = __Value;
        return;
    }
    bool GetbWorldSpaceSpotCacheInitialized() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bWorldSpaceSpotCacheInitialized;
    }
    void SetbWorldSpaceSpotCacheInitialized(const bool __Value) property
    {
        if (!(this.m_bWorldSpaceSpotCacheInitialized) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bWorldSpaceSpotCacheInitialized = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_Spot>> GetSpotsToRelease() const property
    {
        const TArray<TEUIModelRef<FM_Spot>> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<TEUIModelRef<FM_Spot>> GetModify_SpotsToRelease() property
    {
        TArray<TEUIModelRef<FM_Spot>> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetSpotsToRelease(const TArray<TEUIModelRef<FM_Spot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_SpotsToRelease = __Value;
        return;
    }
}

namespace FMS_HeadsUpDisplay3DManager
{
FMS_HeadsUpDisplay3DManager& Get(const UObject ContextObject)
{
    return FMS_HeadsUpDisplay3DManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_HeadsUpDisplay3DManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_HeadsUpDisplay3DManager __r;
    TEUIModelRef<FMS_HeadsUpDisplay3DManager> local_6 = TEUIModelRef<FMS_HeadsUpDisplay3DManager>(EUIInternal::MakeModelWithManager(Manager, FMS_HeadsUpDisplay3DManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_HeadsUpDisplay3DManager;
}
void __Tick(FMS_HeadsUpDisplay3DManager &inout Model)
{
    Model.Tick();
    return;
}
int __IndexOf_SpotFilter()
{
    return 0;
}
int __IndexOf_SpotActors()
{
    return 1;
}
int __IndexOf_ActorPool()
{
    return 2;
}
int __IndexOf_CachedActorClass()
{
    return 3;
}
int __IndexOf_CachedWorldSpaceSpots()
{
    return 4;
}
int __IndexOf_CachedDisplayingSpotsVersion()
{
    return 5;
}
int __IndexOf_bWorldSpaceSpotCacheInitialized()
{
    return 6;
}
int __IndexOf_SpotsToRelease()
{
    return 7;
}
}
