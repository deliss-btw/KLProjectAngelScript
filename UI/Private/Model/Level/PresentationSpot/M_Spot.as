
enum EPresentationDataType
{
    Config_Presentation,
    Config_Minimap,
    Config_Indicator,
    Config_NavigationBar,
    Config_HeadsUpDisplay,
    Override,
    Mark,
    Player,
    Decoractor,
    Mission,
    Teleporter,
    TreasureBox,
    MAX,
}

enum EPresentationSpotDisplayScope
{
    InGame,
    WorldMap,
    MAX,
}

enum EPresentationSpotDisplayScopeSource
{
    MissionData,
    Teleporter,
    MAX,
}

namespace FM_Spot
{
    const int ModelId = 0;

}
struct FM_Spot : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    FVector m_CachedComputedLocation;
    UPROPERTY()
    bool m_bComputedLocationDirty;
    UPROPERTY()
    FVector m_CachedDistancePlayerPosition;
    UPROPERTY()
    FVector m_CachedDistanceSpotLocation;
    UPROPERTY()
    float m_CachedDistanceToPlayerSq;
    UPROPERTY()
    float m_CachedDistanceToPlayer2D;
    UPROPERTY()
    bool m_bDistanceToPlayerDirty;
    UPROPERTY()
    bool m_bEntitySpotLiveAnnouncedPrivate;
    UPROPERTY()
    TArray<TEUIModelWeakRef<FM_SpotRegistry>> m_BelongingRegistries;
    UPROPERTY()
    TMap<EPresentationSpotDisplayScope, FBitSet32> m_DisplayScopeSources;
    UPROPERTY()
    bool m_bDisableRegistryDerivedInGameDisplayScope;
    UPROPERTY()
    FPresentationSpotTransform m_Private_Transform;

    FM_Spot()
    {
        this.m_CachedDistanceToPlayerSq = 0.0;
        this.m_CachedDistanceToPlayer2D = 0.0;
        this.m_bComputedLocationDirty = true;
        this.m_bDistanceToPlayerDirty = true;
        this.m_bEntitySpotLiveAnnouncedPrivate = false;
        this.m_bDisableRegistryDerivedInGameDisplayScope = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_Spot(const FM_Spot &inout Other)
    {
        this.m_CachedDistanceToPlayerSq = 0.0;
        this.m_CachedDistanceToPlayer2D = 0.0;
        this.m_bComputedLocationDirty = true;
        this.m_bDistanceToPlayerDirty = true;
        this.m_bEntitySpotLiveAnnouncedPrivate = false;
        this.m_bDisableRegistryDerivedInGameDisplayScope = false;
        this.m_CachedComputedLocation = Other.m_CachedComputedLocation;
        this.m_bComputedLocationDirty = Other.m_bComputedLocationDirty;
        this.m_CachedDistancePlayerPosition = Other.m_CachedDistancePlayerPosition;
        this.m_CachedDistanceSpotLocation = Other.m_CachedDistanceSpotLocation;
        this.m_CachedDistanceToPlayerSq = Other.m_CachedDistanceToPlayerSq;
        this.m_CachedDistanceToPlayer2D = Other.m_CachedDistanceToPlayer2D;
        this.m_bDistanceToPlayerDirty = Other.m_bDistanceToPlayerDirty;
        this.m_bEntitySpotLiveAnnouncedPrivate = Other.m_bEntitySpotLiveAnnouncedPrivate;
        this.m_BelongingRegistries = Other.m_BelongingRegistries;
        this.m_DisplayScopeSources = Other.m_DisplayScopeSources;
        this.m_bDisableRegistryDerivedInGameDisplayScope = Other.m_bDisableRegistryDerivedInGameDisplayScope;
        this.m_Private_Transform = Other.m_Private_Transform;
        return;
    }
    FM_Spot& opAssign(const FM_Spot &inout Other)
    {
        this.m_CachedComputedLocation = Other.m_CachedComputedLocation;
        this.m_bComputedLocationDirty = Other.m_bComputedLocationDirty;
        this.m_CachedDistancePlayerPosition = Other.m_CachedDistancePlayerPosition;
        this.m_CachedDistanceSpotLocation = Other.m_CachedDistanceSpotLocation;
        this.m_CachedDistanceToPlayerSq = Other.m_CachedDistanceToPlayerSq;
        this.m_CachedDistanceToPlayer2D = Other.m_CachedDistanceToPlayer2D;
        this.m_bDistanceToPlayerDirty = Other.m_bDistanceToPlayerDirty;
        this.m_bEntitySpotLiveAnnouncedPrivate = Other.m_bEntitySpotLiveAnnouncedPrivate;
        this.m_BelongingRegistries = Other.m_BelongingRegistries;
        this.m_DisplayScopeSources = Other.m_DisplayScopeSources;
        this.m_bDisableRegistryDerivedInGameDisplayScope = Other.m_bDisableRegistryDerivedInGameDisplayScope;
        return Other.m_Private_Transform;
    }
    const FPresentationSpotTransform& GetTransform() const property
    {
        return this.GetPrivate_Transform();
    }
    void SetTransform(const FPresentationSpotTransform &inout InTransform) property
    {
        this.GetModify_Transform() = InTransform;
        return;
    }
    FPresentationSpotTransform& GetModify_Transform() property
    {
        this.InvalidateCachedLocation();
        return this.GetModify_Private_Transform();
    }
    void OnTransformModified()
    {
        int local_8 = 0;
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus);
        local_8.Spot = TEUIModelRef<FM_Spot>(this);
        return;
    }
    FVector GetCachedLocation()
    {
        if (!(this.GetbComputedLocationDirty()))
        {
            return this.GetCachedComputedLocation();
        }
        this.SetCachedComputedLocation(::PresentationSpotUtils_Internal::ComputeSpotLocation(TEUIModelRef<FM_Spot>(this)));
        this.SetbComputedLocationDirty(false);
        return this.GetCachedComputedLocation();
    }
    float GetCachedDistanceToPlayerSq(const FVector &inout PlayerPosition)
    {
        this.EnsureDistanceToPlayerCached(PlayerPosition);
        return this.GetCachedDistanceToPlayerSq();
    }
    float GetCachedDistanceToPlayer2D(const FVector &inout PlayerPosition)
    {
        this.EnsureDistanceToPlayerCached(PlayerPosition);
        return this.GetCachedDistanceToPlayer2D();
    }
    void InvalidateCachedLocation()
    {
        this.SetbComputedLocationDirty(true);
        this.InvalidateCachedDistance();
        return;
    }
    void InvalidateCachedDistance()
    {
        this.SetbDistanceToPlayerDirty(true);
        return;
    }
    void EnsureDistanceToPlayerCached(const FVector &inout PlayerPosition)
    {
        FVector local_6 = this.GetCachedLocation();
        if (!(this.GetbDistanceToPlayerDirty()) && this.GetCachedDistancePlayerPosition().Equals(PlayerPosition, 1.0) && this.GetCachedDistanceSpotLocation().Equals(local_6, 0.1))
        {
            return;
        }
        this.SetCachedDistancePlayerPosition(PlayerPosition);
        this.SetCachedDistanceSpotLocation(local_6);
        this.SetCachedDistanceToPlayerSq(local_6.DistSquared(PlayerPosition));
        float local_16 = local_6.X - PlayerPosition.X;
        float local_20 = local_6.Y - PlayerPosition.Y;
        this.SetCachedDistanceToPlayer2D(FMath::Sqrt(((local_16 * local_16) + (local_20 * local_20))));
        this.SetbDistanceToPlayerDirty(false);
        return;
    }
    bool VisibleInRegistry(const TEUIModelRef<FM_SpotRegistry> &inout Registry) const
    {
        TEUIModelWeakRef<FM_SpotRegistry> local_2;
        return Registry && this.GetBelongingRegistries().Contains(local_2);
    }
    bool VisibleInAnyRegistry(const TSet<TEUIModelRef<FM_SpotRegistry>> &inout Registries) const
    {
        for (auto& local_16 : this.GetBelongingRegistries())
        {
            if (local_16.IsValid() && Registries.Contains(local_16.AsRef()))
            {
                return true;
            }
        }
        return false;
    }
    FECSEntityId GetEntityId() const property
    {
        return ::FMS_SpotByEntityId::Get(this.GetContext().Manager).GetSpotOwnerEntityId((TEUIModelWeakRef<FM_Spot>(this)));
    }
    TArray<TEUIModelRef<FM_SpotRegistry>> GetMembershipRegistries() const
    {
        TArray<TEUIModelRef<FM_SpotRegistry>> local_4;
        for (auto& local_20 : this.GetBelongingRegistries())
        {
            if (local_20.IsValid())
            {
                local_4.Add(local_20.AsRef());
            }
        }
        return local_4;
    }
    void OnAddedToRegistryInternal(const FM_SpotRegistry &inout Registry)
    {
        this.GetModify_BelongingRegistries().AddUnique(TEUIModelWeakRef<FM_SpotRegistry>(Registry));
        this.ReevaluateEntitySpotLivenessInternal();
        return;
    }
    void OnRemovedFromRegistryInternal(const FM_SpotRegistry &inout Registry)
    {
        this.GetModify_BelongingRegistries().RemoveSingleSwap(TEUIModelWeakRef<FM_SpotRegistry>(Registry));
        this.ReevaluateEntitySpotLivenessInternal();
        return;
    }
    bool HasDisplayScope(const EPresentationSpotDisplayScope Scope) const
    {
        bool local_4 = (int(Scope) == 0) && this.GetbDisableRegistryDerivedInGameDisplayScope();
        if (!(local_4))
        {
            for (auto& local_20 : this.GetBelongingRegistries())
            {
                if (!(local_20.IsValid()))
                {
                    continue;
                }
                TEUIModelRef<FM_SpotRegistry> local_22 = local_20.AsRef();
                if (local_22 && (int(local_22.opArrow().GetDefaultDisplayScope()) == int(Scope)))
                {
                    return true;
                }
            }
        }
        FBitSet32 local_26;
        if (this.GetDisplayScopeSources().Find(Scope, local_26))
        {
            return !(local_26.IsEmpty());
        }
        return false;
    }
    void SetRegistryDerivedInGameDisplayScopeDisabled(const bool bDisabled)
    {
        bool local_2 = !(bDisabled);
        if (!(this.GetbDisableRegistryDerivedInGameDisplayScope()) == local_2)
        {
            return;
        }
        bool local_2_2 = this.HasDisplayScope(EPresentationSpotDisplayScope(0));
        this.SetbDisableRegistryDerivedInGameDisplayScope(bDisabled);
        if (!(local_2_2) != !(this.HasDisplayScope(EPresentationSpotDisplayScope(0))))
        {
            this.NotifyDisplayScopeChangedInternal();
        }
        return;
    }
    void AddDisplayScope(const EPresentationSpotDisplayScope Scope, const EPresentationSpotDisplayScopeSource Source)
    {
        bool local_2 = this.HasDisplayScope(EPresentationSpotDisplayScope(Scope));
        FBitSet32 local_3;
        this.GetDisplayScopeSources().Find(Scope, local_3);
        local_3.SetBit(int(Source), true);
        this.GetModify_DisplayScopeSources().Add(Scope, local_3);
        if (!(local_2) && this.HasDisplayScope(EPresentationSpotDisplayScope(Scope)))
        {
            this.NotifyDisplayScopeChangedInternal();
        }
        return;
    }
    void RemoveDisplayScope(const EPresentationSpotDisplayScope Scope, const EPresentationSpotDisplayScopeSource Source)
    {
        FBitSet32 local_1;
        if (!(this.GetDisplayScopeSources().Find(Scope, local_1)) || !(local_1.GetBit(int(Source))))
        {
            return;
        }
        bool local_4 = this.HasDisplayScope(EPresentationSpotDisplayScope(Scope));
        local_1.SetBit(int(Source), false);
        if (local_1.IsEmpty())
        {
        }
        else
        {
            this.GetModify_DisplayScopeSources().Add(Scope, local_1);
        }
        if (local_4 && !(this.HasDisplayScope(EPresentationSpotDisplayScope(Scope))))
        {
            this.NotifyDisplayScopeChangedInternal();
        }
        return;
    }
    void NotifyDisplayScopeChangedInternal()
    {
        for (auto& local_16 : this.GetBelongingRegistries())
        {
            if (local_16.IsValid())
            {
                local_16.AsRef().opArrow().NotifySpotScopeChangedInternal(TEUIModelRef<FM_Spot>(this));
            }
        }
        return;
    }
    void OnPresentationDataModifiedInternal(const FM_SpotRegistry &inout Registry, const EPresentationDataType DataType)
    {
        if (int(DataType) == 0)
        {
            this.InvalidateCachedLocation();
        }
        FEUIModelRef local_10 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_SpotPresentationDataModified local_12;
        local_12.Spot = TEUIModelRef<FM_Spot>(this);
        local_12.Registry = TEUIModelRef<FM_SpotRegistry>(Registry);
        local_12.DataType = DataType;
        return;
    }
    void SetEntityIdInternal(const FECSEntityId &inout InEntityId)
    {
        ::FMS_SpotByEntityId::Get(this.GetContext().Manager).SetSpotOwnerEntityId(this, InEntityId);
        this.ReevaluateEntitySpotLivenessInternal();
        return;
    }
    bool IsEntitySpotLive() const
    {
        return this.GetbEntitySpotLiveAnnouncedPrivate();
    }
    void ReevaluateEntitySpotLivenessInternal()
    {
        int local_14 = 0;
        int local_22 = 0;
        FECSEntityId local_2 = this.GetEntityId();
        bool local_4 = !((local_2 == ENTITY_ID_NULL)) && this.IsInAuthoritativeLiveRegistryInternal();
        if (!(local_4) == !(this.GetbEntitySpotLiveAnnouncedPrivate()))
        {
            return;
        }
        this.SetbEntitySpotLiveAnnouncedPrivate(local_4);
        if (local_4)
        {
            FEUIModelRef local_12 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_14.EntityId = local_2;
            local_14.Spot = TEUIModelRef<FM_Spot>(this);
        }
        else
        {
            FEUIModelRef local_12_2 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_22.EntityId = local_2;
            local_22.Spot = TEUIModelRef<FM_Spot>(this);
        }
        return;
    }
    bool IsInAuthoritativeLiveRegistryInternal() const
    {
        FEUIModelRef local_24;
        FMS_SpotRegistries& local_2 = ::FMS_SpotRegistries::Get(this.GetContext().Manager);
        for (auto& local_18 : this.GetBelongingRegistries())
        {
            if (!(local_18.IsValid()))
            {
                continue;
            }
            TEUIModelRef<FM_SpotRegistry> local_20 = local_18.AsRef();
            bool local_27 = local_2.GetDefaultRegistry();
            if (!(local_27))
            {
                local_27 = false;
            }
            else
            {
                TEUIModelRef<FM_SpotRegistry> local_26 = local_2.GetDefaultRegistry();
                local_27 = (local_20 == local_24);
            }
            if (local_27)
            {
                return true;
            }
            bool local_15 = local_2.GetLevelSpotRegistry();
            if (!(local_15))
            {
                local_15 = false;
            }
            else
            {
                TEUIModelRef<FM_SpotRegistry> local_22 = local_2.GetLevelSpotRegistry();
                local_15 = (local_20 == local_24);
            }
            if (local_15)
            {
                return true;
            }
        }
        return false;
    }
    const FVector GetCachedComputedLocation() const property
    {
        const FVector __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FVector GetModify_CachedComputedLocation() property
    {
        FVector __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCachedComputedLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CachedComputedLocation = __Value;
        return;
    }
    bool GetbComputedLocationDirty() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bComputedLocationDirty;
    }
    void SetbComputedLocationDirty(const bool __Value) property
    {
        if (!(this.m_bComputedLocationDirty) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bComputedLocationDirty = __Value;
        return;
    }
    const FVector GetCachedDistancePlayerPosition() const property
    {
        const FVector __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FVector GetModify_CachedDistancePlayerPosition() property
    {
        FVector __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCachedDistancePlayerPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CachedDistancePlayerPosition = __Value;
        return;
    }
    const FVector GetCachedDistanceSpotLocation() const property
    {
        const FVector __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FVector GetModify_CachedDistanceSpotLocation() property
    {
        FVector __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCachedDistanceSpotLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CachedDistanceSpotLocation = __Value;
        return;
    }
    float GetCachedDistanceToPlayerSq() const property
    {
        this.TrackPropertyRead(4);
        return this.m_CachedDistanceToPlayerSq;
    }
    void SetCachedDistanceToPlayerSq(const float __Value) property
    {
        if (this.m_CachedDistanceToPlayerSq == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CachedDistanceToPlayerSq = __Value;
        return;
    }
    float GetCachedDistanceToPlayer2D() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CachedDistanceToPlayer2D;
    }
    void SetCachedDistanceToPlayer2D(const float __Value) property
    {
        if (this.m_CachedDistanceToPlayer2D == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CachedDistanceToPlayer2D = __Value;
        return;
    }
    bool GetbDistanceToPlayerDirty() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bDistanceToPlayerDirty;
    }
    void SetbDistanceToPlayerDirty(const bool __Value) property
    {
        if (!(this.m_bDistanceToPlayerDirty) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bDistanceToPlayerDirty = __Value;
        return;
    }
    bool GetbEntitySpotLiveAnnouncedPrivate() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bEntitySpotLiveAnnouncedPrivate;
    }
    void SetbEntitySpotLiveAnnouncedPrivate(const bool __Value) property
    {
        if (!(this.m_bEntitySpotLiveAnnouncedPrivate) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bEntitySpotLiveAnnouncedPrivate = __Value;
        return;
    }
    const TArray<TEUIModelWeakRef<FM_SpotRegistry>> GetBelongingRegistries() const property
    {
        const TArray<TEUIModelWeakRef<FM_SpotRegistry>> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<TEUIModelWeakRef<FM_SpotRegistry>> GetModify_BelongingRegistries() property
    {
        TArray<TEUIModelWeakRef<FM_SpotRegistry>> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetBelongingRegistries(const TArray<TEUIModelWeakRef<FM_SpotRegistry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_BelongingRegistries = __Value;
        return;
    }
    const TMap<EPresentationSpotDisplayScope, FBitSet32> GetDisplayScopeSources() const property
    {
        const TMap<EPresentationSpotDisplayScope, FBitSet32> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TMap<EPresentationSpotDisplayScope, FBitSet32> GetModify_DisplayScopeSources() property
    {
        TMap<EPresentationSpotDisplayScope, FBitSet32> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetDisplayScopeSources(const TMap<EPresentationSpotDisplayScope, FBitSet32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_DisplayScopeSources = __Value;
        return;
    }
    bool GetbDisableRegistryDerivedInGameDisplayScope() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bDisableRegistryDerivedInGameDisplayScope;
    }
    void SetbDisableRegistryDerivedInGameDisplayScope(const bool __Value) property
    {
        if (!(this.m_bDisableRegistryDerivedInGameDisplayScope) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bDisableRegistryDerivedInGameDisplayScope = __Value;
        return;
    }
    const FPresentationSpotTransform GetPrivate_Transform() const property
    {
        const FPresentationSpotTransform __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FPresentationSpotTransform GetModify_Private_Transform() property
    {
        FPresentationSpotTransform __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetPrivate_Transform(const FPresentationSpotTransform &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_Private_Transform = __Value;
        return;
    }
}

struct FMsg_SpotTransformModified : FEUIMessage
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;

    FMsg_SpotTransformModified()
    {
        return;
    }
}

struct FMsg_SpotPresentationDataModified : FEUIMessage
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;
    UPROPERTY()
    TEUIModelRef<FM_SpotRegistry> Registry;
    UPROPERTY()
    EPresentationDataType DataType;


}

struct FSpotModelRefArray
{
    UPROPERTY()
    TArray<TEUIModelRef<FM_Spot>> Spots;

    FSpotModelRefArray()
    {
        return;
    }
}

struct FSpotModelWeakRefArray
{
    UPROPERTY()
    TArray<TEUIModelWeakRef<FM_Spot>> Spots;

    FSpotModelWeakRefArray()
    {
        return;
    }
}

namespace FM_Spot
{
FM_Spot& Create(const UObject ContextObject)
{
    return FM_Spot::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_Spot CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_Spot __r;
    TEUIModelRef<FM_Spot> local_6 = TEUIModelRef<FM_Spot>(EUIInternal::MakeModelWithManager(Manager, FM_Spot::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelDirtyDefine local_12;
    local_12.FunctionName = "__OnTransformModified";
    local_12.DirtyFlags.Set(FM_Spot::__IndexOf_Private_Transform());
    Result.DirtyFunctions.Add(local_12);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_Spot;
}
void __OnTransformModified(FM_Spot &inout Model)
{
    Model.OnTransformModified();
    return;
}
int __IndexOf_CachedComputedLocation()
{
    return 0;
}
int __IndexOf_bComputedLocationDirty()
{
    return 1;
}
int __IndexOf_CachedDistancePlayerPosition()
{
    return 2;
}
int __IndexOf_CachedDistanceSpotLocation()
{
    return 3;
}
int __IndexOf_CachedDistanceToPlayerSq()
{
    return 4;
}
int __IndexOf_CachedDistanceToPlayer2D()
{
    return 5;
}
int __IndexOf_bDistanceToPlayerDirty()
{
    return 6;
}
int __IndexOf_bEntitySpotLiveAnnouncedPrivate()
{
    return 7;
}
int __IndexOf_BelongingRegistries()
{
    return 8;
}
int __IndexOf_DisplayScopeSources()
{
    return 9;
}
int __IndexOf_bDisableRegistryDerivedInGameDisplayScope()
{
    return 10;
}
int __IndexOf_Private_Transform()
{
    return 11;
}
}
