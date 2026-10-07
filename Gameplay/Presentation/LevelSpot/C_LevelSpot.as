
enum ELevelSpotDataSource
{
    GameplayTag,
    Guide,
    Mission,
    Mark,
    EntityConfigOverride,
    EntityConfig,
    CreatureMeta,
    PositionSpot,
}

enum EPresentationRuleType
{
    PresentationConfig,
    Minimap,
    Indicator,
    NavigationBar,
    HeadsUpDisplay,
    MAX,
}

namespace FLevelSpotId
{
    const FLevelSpotId Invalid = FLevelSpotId();
}
namespace FLevelSpotViewers
{
    const FLevelSpotViewers AllViewers = FLevelSpotViewers();
    const FLevelSpotViewers NoViewer = FLevelSpotViewers();
}
namespace FLevelSpotData
{
    const FLevelSpotData Empty = FLevelSpotData();
}
namespace __INTENRAL_FC_LevelSpot_NS
{
    const TECSComponentDerivedPtr<FC_LevelSpot> DerivedPtr = TECSComponentDerivedPtr<FC_LevelSpot>();
    const FC_LevelSpot DefaultValue = FC_LevelSpot();
}
namespace __INTENRAL_FC_LevelSpotHistory_NS
{
    const TECSComponentDerivedPtr<FC_LevelSpotHistory> DerivedPtr = TECSComponentDerivedPtr<FC_LevelSpotHistory>();
    const FC_LevelSpotHistory DefaultValue = FC_LevelSpotHistory();
}
namespace __INTENRAL_FCS_PositionLevelSpotManager_NS
{
    const TECSComponentDerivedPtr<FCS_PositionLevelSpotManager> DerivedPtr = TECSComponentDerivedPtr<FCS_PositionLevelSpotManager>();
    const FCS_PositionLevelSpotManager DefaultValue = FCS_PositionLevelSpotManager();
}
namespace __INTENRAL_FCS_LevelSpotIdGenerator_NS
{
    const TECSComponentDerivedPtr<FCS_LevelSpotIdGenerator> DerivedPtr = TECSComponentDerivedPtr<FCS_LevelSpotIdGenerator>();
    const FCS_LevelSpotIdGenerator DefaultValue = FCS_LevelSpotIdGenerator();
}
namespace __INTENRAL_FC_LevelSpotSyncToViewerDeferTag_NS
{
    const TECSComponentDerivedPtr<FC_LevelSpotSyncToViewerDeferTag> DerivedPtr = TECSComponentDerivedPtr<FC_LevelSpotSyncToViewerDeferTag>();
    const FC_LevelSpotSyncToViewerDeferTag DefaultValue = FC_LevelSpotSyncToViewerDeferTag();
}
namespace __INTENRAL_FC_LevelSpotPlayerViewer_NS
{
    const TECSComponentDerivedPtr<FC_LevelSpotPlayerViewer> DerivedPtr = TECSComponentDerivedPtr<FC_LevelSpotPlayerViewer>();
    const FC_LevelSpotPlayerViewer DefaultValue = FC_LevelSpotPlayerViewer();
}
namespace __INTENRAL_FC_LevelSpotTeamViewer_NS
{
    const TECSComponentDerivedPtr<FC_LevelSpotTeamViewer> DerivedPtr = TECSComponentDerivedPtr<FC_LevelSpotTeamViewer>();
    const FC_LevelSpotTeamViewer DefaultValue = FC_LevelSpotTeamViewer();
}
namespace __INTENRAL_FCS_LevelSpotViewerSummary_NS
{
    const TECSComponentDerivedPtr<FCS_LevelSpotViewerSummary> DerivedPtr = TECSComponentDerivedPtr<FCS_LevelSpotViewerSummary>();
    const FCS_LevelSpotViewerSummary DefaultValue = FCS_LevelSpotViewerSummary();
}
namespace __INTENRAL_FC_LevelSpotConfigPendingInitTag_NS
{
    const TECSComponentDerivedPtr<FC_LevelSpotConfigPendingInitTag> DerivedPtr = TECSComponentDerivedPtr<FC_LevelSpotConfigPendingInitTag>();
    const FC_LevelSpotConfigPendingInitTag DefaultValue = FC_LevelSpotConfigPendingInitTag();
}
namespace __INTENRAL_FC_LevelSpotMonitorCreatureMetaChangedDeferTag_NS
{
    const TECSComponentDerivedPtr<FC_LevelSpotMonitorCreatureMetaChangedDeferTag> DerivedPtr = TECSComponentDerivedPtr<FC_LevelSpotMonitorCreatureMetaChangedDeferTag>();
    const FC_LevelSpotMonitorCreatureMetaChangedDeferTag DefaultValue = FC_LevelSpotMonitorCreatureMetaChangedDeferTag();
}
namespace __INTENRAL_FC_LevelSpotMonitorGameplayTagInitTag_NS
{
    const TECSComponentDerivedPtr<FC_LevelSpotMonitorGameplayTagInitTag> DerivedPtr = TECSComponentDerivedPtr<FC_LevelSpotMonitorGameplayTagInitTag>();
    const FC_LevelSpotMonitorGameplayTagInitTag DefaultValue = FC_LevelSpotMonitorGameplayTagInitTag();
}
namespace __INTENRAL_FC_LevelSpotConfig_NS
{
    const TECSComponentDerivedPtr<FC_LevelSpotConfig> DerivedPtr = TECSComponentDerivedPtr<FC_LevelSpotConfig>();
    const FC_LevelSpotConfig DefaultValue = FC_LevelSpotConfig();
}
namespace __INTENRAL_FCE_NotifyNewLevelSpotEntity_NS
{
    const TECSEventDerivedPtr<FCE_NotifyNewLevelSpotEntity> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyNewLevelSpotEntity>();

}
struct FLevelSpotId
{
    UPROPERTY()
    uint m_SpotId;
    UPROPERTY()
    FECSEntityId m_EntityId;

    FLevelSpotId()
    {
        this.m_SpotId = 0;
        this.SetSpotId(0);
        this.SetEntityId(ENTITY_ID_NULL);
        return;
    }
    FLevelSpotId(const uint InSpotId)
    {
        this.m_SpotId = 0;
        this.SetSpotId(InSpotId);
        this.SetEntityId(ENTITY_ID_NULL);
        return;
    }
    FLevelSpotId(const FECSEntityId &inout InEntityId)
    {
        this.m_SpotId = 0;
        this.SetSpotId(InEntityId.GetIdValue());
        this.SetEntityId(InEntityId);
        return;
    }
    bool opEquals(const FLevelSpotId &inout Other) const
    {
        return this.GetSpotId() == Other.GetSpotId() && (FECSEntityId(this.GetEntityId()) == Other.GetEntityId());
    }
    void opPostInc()
    {
        this.SetSpotId((this.GetSpotId() + 1));
        if ((!((this.GetSpotId() > 0))))
        {
            this.SetSpotId(1);
        }
        return;
    }
    uint Hash() const
    {
        return (HashCombineFast(this.GetSpotId(), this.GetEntityId().GetIdValue()));
    }
    FString ToString() const
    {
        if ((!((FECSEntityId(this.GetEntityId()) == ENTITY_ID_NULL))))
        {
            if (this.GetSpotId() > 0)
            {
                int local_4 = this.GetSpotId();
                return FString().Append(FECSEntity(this.GetEntityId()).ToString()).Append("-").Append(local_4);
            }
            return FString().Append(FECSEntity(this.GetEntityId()).ToString());
        }
        return FString().Append(this.GetSpotId());
    }
    uint GetIdValue() const property
    {
        return this.GetSpotId();
    }
    uint GetSpotId() const property
    {
        return this.m_SpotId;
    }
    void SetSpotId(const uint __Value) property
    {
        this.m_SpotId = __Value;
        return;
    }
    FECSEntityId GetEntityId() const property
    {
        FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetEntityId() property
    {
        FECSEntityId __r;
        return __r;
    }
    void SetEntityId(const FECSEntityId &inout __Value) property
    {
        this.m_EntityId = __Value;
        return;
    }
}

struct FLevelSpotViewers
{
    UPROPERTY()
    TSet<FECSEntity> m_NagativeViewers;
    UPROPERTY()
    bool m_bDefaultVisible;

    FLevelSpotViewers(const bool bGloballyVisible)
    {
        this.SetbDefaultVisible(bGloballyVisible);
        return;
    }
    FLevelSpotViewers(const FECSEntity &inout InViewer)
    {
        this.SetbDefaultVisible(false);
        this.GetNagativeViewers().Add(InViewer);
        return;
    }
    FLevelSpotViewers(const TArray<FECSEntity> &inout InViewers)
    {
        this.SetbDefaultVisible(false);
        this.GetNagativeViewers().Append(InViewers);
        return;
    }
    bool IsEmpty() const
    {
        return !(this.GetbDefaultVisible()) && this.GetNagativeViewers().IsEmpty();
    }
    bool IsAll() const
    {
        return this.GetbDefaultVisible() && this.GetNagativeViewers().IsEmpty();
    }
    bool HasViewer(const FECSEntity &inout Viewer) const
    {
        bool local_2 = (!(this.GetbDefaultVisible()) != !(this.GetNagativeViewers().Contains(Viewer)));
        return local_2;
    }
    void SetGloballyVisible()
    {
        this.SetbDefaultVisible(true);
        this.GetNagativeViewers().Empty(0);
        return;
    }
    void SetViewers(const TArray<FECSEntity> &inout Viewers)
    {
        this.SetbDefaultVisible(false);
        this.GetNagativeViewers().Empty(0);
        this.GetNagativeViewers().Append(Viewers);
        return;
    }
    void AddViewer(const FECSEntity &inout Viewer)
    {
        if (this.GetbDefaultVisible())
        {
            return;
        }
        this.GetNagativeViewers().Add(Viewer);
        return;
    }
    void AppendViewers(const FLevelSpotViewers &inout Other)
    {
        if (this.GetbDefaultVisible())
        {
            if (Other.GetbDefaultVisible())
            {
                this.SetNagativeViewers(this.GetNagativeViewers().Intersect(Other.GetNagativeViewers()));
            }
            else
            {
                this.SetNagativeViewers(this.GetNagativeViewers().Difference(Other.GetNagativeViewers()));
            }
            return;
        }
        if (Other.GetbDefaultVisible())
        {
            this.SetbDefaultVisible(true);
            this.SetNagativeViewers(Other.GetNagativeViewers().Difference(this.GetNagativeViewers()));
            return;
        }
        this.SetNagativeViewers(this.GetNagativeViewers().Union(Other.GetNagativeViewers()));
        return;
    }
    void RemoveViewer(const FECSEntity &inout Viewer)
    {
        if (this.GetbDefaultVisible())
        {
            this.GetNagativeViewers().Add(Viewer);
            return;
        }
        return;
    }
    bool TryGetFiniteViewers(TArray<FECSEntity> &inout OutViewers) const
    {
        if (this.GetbDefaultVisible())
        {
            return false;
        }
        for (auto& local_20 : this.GetNagativeViewers())
        {
            OutViewers.Add(local_20);
        }
        return true;
    }
    bool TryGetFiniteViewers(TSet<FECSEntity> &inout OutViewers) const
    {
        if (this.GetbDefaultVisible())
        {
            return false;
        }
        OutViewers = this.GetNagativeViewers();
        return true;
    }
    bool opEquals(const FLevelSpotViewers &inout Other) const
    {
        return (!(this.GetbDefaultVisible()) == !(Other.GetbDefaultVisible()) && this.GetNagativeViewers().OrderIndependentCompareEqual(Other.GetNagativeViewers()));
    }
    const TSet<FECSEntity> GetNagativeViewers() const property
    {
        const TSet<FECSEntity> __r;
        return __r;
    }
    TSet<FECSEntity> GetNagativeViewers() property
    {
        TSet<FECSEntity> __r;
        return __r;
    }
    void SetNagativeViewers(const TSet<FECSEntity> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    bool GetbDefaultVisible() const property
    {
        return this.m_bDefaultVisible;
    }
    void SetbDefaultVisible(const bool __Value) property
    {
        this.m_bDefaultVisible = __Value;
        return;
    }
}

struct FLevelSpotData
{
    UPROPERTY()
    TInlineArray<FDataObjectPtr, auto> m_PresentationRuleConfigs;
    UPROPERTY()
    FBitSet32 m_PresentationRuleConfigFlags;

    FLevelSpotData()
    {
        this.GetPresentationRuleConfigs().SetNum(5);
        return;
    }
    FLevelSpotData(const TDataObjectPtr<FPresentationConfig> &inout InPresentationConfig)
    {
        this.GetPresentationRuleConfigs().SetNum(5);
        this.SetConfigInternal(0, InPresentationConfig.opImplConv());
        return;
    }
    FLevelSpotData(const TDataObjectPtr<FPresentationRuleConfig> &inout InPresentationRuleConfig)
    {
        this.GetPresentationRuleConfigs().SetNum(5);
        this.SetPresentationRuleConfig(InPresentationRuleConfig);
        return;
    }
    FLevelSpotData(const TDataObjectPtr<FPresentationConfig> &inout InPresentationConfig, const TDataObjectPtr<FPresentationRuleConfig> &inout InPresentationRuleConfig)
    {
        this.GetPresentationRuleConfigs().SetNum(5);
        this.SetConfigInternal(0, InPresentationConfig.opImplConv());
        this.SetPresentationRuleConfig(InPresentationRuleConfig);
        return;
    }
    bool IsEmpty() const
    {
        return this.GetPresentationRuleConfigFlags().IsEmpty();
    }
    bool IsFull() const
    {
        return (this.GetPresentationRuleConfigFlags().NumOfSetBits() == 5);
    }
    bool HasAnyVisibleElement() const
    {
        if (this.IsEmpty())
        {
            return false;
        }
        int local_2 = 0;
        for (; local_2 < 5; ++local_2)
        {
            if (!(!(this.GetPresentationRuleConfigFlags().GetBit(local_2))) && this.GetPresentationRuleConfigs()[local_2])
            {
                return true;
            }
        }
        return false;
    }
    bool opConv() const
    {
        return !(this.IsEmpty());
    }
    void AppendLowerPriorityData(const FLevelSpotData &inout Other)
    {
        int local_1 = 0;
        for (; local_1 < 5; ++local_1)
        {
            if (Other.GetPresentationRuleConfigFlags().GetBit(local_1) && !(this.GetPresentationRuleConfigFlags().GetBit(local_1)))
            {
                this.SetConfigInternal(local_1, Other.GetPresentationRuleConfigs()[local_1]);
            }
        }
        return;
    }
    void SetConfigInternal(const int Index, const FDataObjectPtr &inout Config)
    {
        this.GetPresentationRuleConfigs()[Index] = Config;
        this.GetPresentationRuleConfigFlags().SetBit(Index, true);
        return;
    }
    void ClearConfigInternal(const int Index)
    {
        this.GetPresentationRuleConfigs()[Index] = FDataObjectPtr();
        this.GetPresentationRuleConfigFlags().SetBit(Index, false);
        return;
    }
    TDataObjectPtr<FPresentationConfig> GetPresentationConfig() const property
    {
        if (this.GetPresentationRuleConfigFlags().GetBit(0))
        {
            return TDataObjectPtr<FPresentationConfig>(this.GetPresentationRuleConfigs()[0]);
        }
        return TDataObjectPtr<FPresentationConfig>(nullptr);
    }
    void SetPresentationConfig(const TDataObjectPtr<FPresentationConfig> &inout InConfig) property
    {
        this.SetConfigInternal(0, InConfig.opImplConv());
        return;
    }
    void RemovePresentationConfig()
    {
        this.ClearConfigInternal(0);
        return;
    }
    TDataObjectPtr<FMinimapIconConfig> GetMinimapIconDisplaySettings() const property
    {
        if (this.GetPresentationRuleConfigFlags().GetBit(1))
        {
            return TDataObjectPtr<FMinimapIconConfig>(this.GetPresentationRuleConfigs()[1]);
        }
        return TDataObjectPtr<FMinimapIconConfig>(nullptr);
    }
    void SetMinimapIconDisplaySettings(const TDataObjectPtr<FMinimapIconConfig> &inout InDisplaySettings) property
    {
        this.SetConfigInternal(1, InDisplaySettings.opImplConv());
        return;
    }
    void RemoveMinimapIconDisplaySettings()
    {
        this.ClearConfigInternal(1);
        return;
    }
    TDataObjectPtr<FIndicatorConfig> GetIndicatorConfig() const property
    {
        if (this.GetPresentationRuleConfigFlags().GetBit(2))
        {
            return TDataObjectPtr<FIndicatorConfig>(this.GetPresentationRuleConfigs()[2]);
        }
        return TDataObjectPtr<FIndicatorConfig>(nullptr);
    }
    void SetIndicatorConfig(const TDataObjectPtr<FIndicatorConfig> &inout InConfig) property
    {
        this.SetConfigInternal(2, InConfig.opImplConv());
        return;
    }
    void RemoveIndicatorConfig()
    {
        this.ClearConfigInternal(2);
        return;
    }
    TDataObjectPtr<FNavigationBarIconConfig> GetNavigationBarIconConfig() const property
    {
        if (this.GetPresentationRuleConfigFlags().GetBit(3))
        {
            return TDataObjectPtr<FNavigationBarIconConfig>(this.GetPresentationRuleConfigs()[3]);
        }
        return TDataObjectPtr<FNavigationBarIconConfig>(nullptr);
    }
    void SetNavigationBarIconConfig(const TDataObjectPtr<FNavigationBarIconConfig> &inout InConfig) property
    {
        this.SetConfigInternal(3, InConfig.opImplConv());
        return;
    }
    void RemoveNavigationBarIconConfig()
    {
        this.ClearConfigInternal(3);
        return;
    }
    TDataObjectPtr<FHeadsUpDisplayConfig> GetHeadsUpDisplayConfig() const property
    {
        if (this.GetPresentationRuleConfigFlags().GetBit(4))
        {
            return TDataObjectPtr<FHeadsUpDisplayConfig>(this.GetPresentationRuleConfigs()[4]);
        }
        return TDataObjectPtr<FHeadsUpDisplayConfig>(nullptr);
    }
    void SetHeadsUpDisplayConfig(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout InConfig) property
    {
        this.SetConfigInternal(4, InConfig.opImplConv());
        return;
    }
    void RemoveHeadsUpDisplayConfig()
    {
        this.ClearConfigInternal(4);
        return;
    }
    void SetPresentationRuleConfig(const TDataObjectPtr<FPresentationRuleConfig> &inout InPresentationRuleConfig)
    {
        FDataObjectPtr local_26;
        if (InPresentationRuleConfig)
        {
            if (InPresentationRuleConfig.opArrow().bShowMinimapIcon)
            {
                local_26;
                this.SetConfigInternal(1, local_26);
            }
            else
            {
                this.ClearConfigInternal(1);
            }
            if (InPresentationRuleConfig.opArrow().bShowIndicator)
            {
                local_26;
                this.SetConfigInternal(2, local_26);
            }
            else
            {
                this.ClearConfigInternal(2);
            }
            if (InPresentationRuleConfig.opArrow().bShowNavigationBarIcon)
            {
                local_26;
                this.SetConfigInternal(3, local_26);
            }
            else
            {
                this.ClearConfigInternal(3);
            }
            if (InPresentationRuleConfig.opArrow().bShowHeadsUpDisplay)
            {
                local_26;
                this.SetConfigInternal(4, local_26);
            }
            else
            {
                this.ClearConfigInternal(4);
            }
            return;
        }
        this.RemovePresentationRuleConfig();
        return;
    }
    void RemovePresentationRuleConfig()
    {
        this.ClearConfigInternal(1);
        this.ClearConfigInternal(2);
        this.ClearConfigInternal(3);
        this.ClearConfigInternal(4);
        return;
    }
    const TInlineArray<FDataObjectPtr, auto> GetPresentationRuleConfigs() const property
    {
        const TInlineArray<FDataObjectPtr, auto> __r;
        return __r;
    }
    TInlineArray<FDataObjectPtr, auto> GetPresentationRuleConfigs() property
    {
        TInlineArray<FDataObjectPtr, auto> __r;
        return __r;
    }
    void SetPresentationRuleConfigs(const TInlineArray<FDataObjectPtr, auto> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const FBitSet32 GetPresentationRuleConfigFlags() const property
    {
        const FBitSet32 __r;
        return __r;
    }
    FBitSet32 GetPresentationRuleConfigFlags() property
    {
        FBitSet32 __r;
        return __r;
    }
    void SetPresentationRuleConfigFlags(const FBitSet32 &inout __Value) property
    {
        this.m_PresentationRuleConfigFlags = __Value;
        return;
    }
}

struct FLevelSpotOverrideInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    ELevelSpotDataSource m_SourcePrivate;
    UPROPERTY()
    FLevelSpotData m_Data;
    UPROPERTY()
    FLevelSpotViewers m_Viewers;

    FLevelSpotOverrideInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLevelSpotOverrideInfo(const FLevelSpotOverrideInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLevelSpotOverrideInfo(const ELevelSpotDataSource InSource)
    {
        this.m_SourcePrivate = ELevelSpotDataSource(0);
        this.SetSourcePrivate(ELevelSpotDataSource(InSource));
        return;
    }
    FLevelSpotOverrideInfo opAssign(const FLevelSpotOverrideInfo &inout Other)
    {
        FLevelSpotOverrideInfo __r;
        this.SetSourcePrivate(Other.GetSourcePrivate());
        this.SetData(Other.GetData());
        this.SetViewers(Other.GetViewers());
        return __r;
    }
    int opCmp(const FLevelSpotOverrideInfo &inout Other) const
    {
        int local_2 = int(this.GetSource());
        int local_3 = int(Other.GetSource());
        local_2 = local_2 - local_3;
        return local_2;
    }
    ELevelSpotDataSource GetSource() const property
    {
        return this.GetSourcePrivate();
    }
    ELevelSpotDataSource GetSourcePrivate() const property
    {
        return this.m_SourcePrivate;
    }
    void SetSourcePrivate(const ELevelSpotDataSource __Value) property
    {
        if (int(this.m_SourcePrivate) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SourcePrivate = __Value;
        return;
    }
    const FLevelSpotData GetData() const property
    {
        const FLevelSpotData __r;
        return __r;
    }
    FLevelSpotData GetModify_Data() property
    {
        FLevelSpotData __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetData(const FLevelSpotData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        return;
    }
    const FLevelSpotViewers GetViewers() const property
    {
        const FLevelSpotViewers __r;
        return __r;
    }
    FLevelSpotViewers GetModify_Viewers() property
    {
        FLevelSpotViewers __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetViewers(const FLevelSpotViewers &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        return;
    }
}

struct FLevelSpotInfo
{
    UPROPERTY()
    TArray<FLevelSpotOverrideInfo> m_OverrideInfos;

    FLevelSpotInfo()
    {
        return;
    }
    bool IsEmpty() const
    {
        return this.GetOverrideInfos().IsEmpty();
    }
    FLevelSpotOverrideInfo ModifyOrAddOverride(const ELevelSpotDataSource Source)
    {
        FLevelSpotOverrideInfo __r;
        for (auto& local_16 : this.GetOverrideInfos())
        {
            if (int(local_16.GetSource()) == int(Source))
            {
                return __r;
            }
        }
        this.GetOverrideInfos().Add(FLevelSpotOverrideInfo(ELevelSpotDataSource(Source)));
        for (auto& local_16 : this.GetOverrideInfos())
        {
            if (int(local_16.GetSource()) == int(Source))
            {
                return __r;
            }
        }
        return this.GetOverrideInfos()[0];
    }
    bool HasOverride(const ELevelSpotDataSource Source) const
    {
        for (auto& local_16 : this.GetOverrideInfos())
        {
            if ((int(local_16.GetSource())) == (int(Source)))
            {
                return true;
            }
        }
        return false;
    }
    const FLevelSpotData& GetOverrideData(const ELevelSpotDataSource Source) const
    {
        bool local_13 = false;
        for (auto& local_16 : this.GetOverrideInfos())
        {
            if ((int(local_16.GetSource())) == (int(Source)))
            {
                return local_16.GetData();
            }
        }
        return local_13;
    }
    bool RemoveOverride(const ELevelSpotDataSource Source)
    {
        int local_1 = 0;
        for (; local_1 < this.GetOverrideInfos().Num(); ++local_1)
        {
            if ((int(this.GetOverrideInfos()[local_1].GetSource())) == (int(Source)))
            {
                this.GetOverrideInfos().RemoveAt(local_1);
                return true;
            }
        }
        return false;
    }
    FLevelSpotData GetDataForViewer(const FECSEntity &inout Viewer) const
    {
        FLevelSpotData local_126;
        FLevelSpotData __r;
        for (auto& local_142 : this.GetOverrideInfos())
        {
            if (local_142.GetViewers().HasViewer(Viewer))
            {
                if (this.StackUpData(local_126, local_142.GetData()))
                {
                    return __r;
                }
            }
        }
        if (local_126.HasAnyVisibleElement())
        {
        }
        else
        {
        }
        return __r;
    }
    FLevelSpotData GetDataForAnyViewers(const TArray<FECSEntity> &inout Viewers) const
    {
        FLevelSpotData local_126;
        FLevelSpotData __r;
        for (auto& local_142 : this.GetOverrideInfos())
        {
            for (auto& local_156 : Viewers)
            {
                if (local_142.GetViewers().HasViewer(local_156))
                {
                    if (this.StackUpData(local_126, local_142.GetData()))
                    {
                        return __r;
                    }
                }
            }
        }
        if (local_126.HasAnyVisibleElement())
        {
        }
        else
        {
        }
        return __r;
    }
    FLevelSpotViewers GetAllViewers() const
    {
        FLevelSpotViewers local_22;
        FLevelSpotViewers __r;
        for (auto& local_38 : this.GetOverrideInfos())
        {
            if (local_38.GetViewers().IsAll())
            {
                return __r;
            }
            local_22.AppendViewers(local_38.GetViewers());
        }
        return __r;
    }
    bool StackUpData(FLevelSpotData &inout Data, const FLevelSpotData &inout Other) const
    {
        Data.AppendLowerPriorityData(Other);
        return Data.IsFull();
    }
    const TArray<FLevelSpotOverrideInfo> GetOverrideInfos() const property
    {
        const TArray<FLevelSpotOverrideInfo> __r;
        return __r;
    }
    TArray<FLevelSpotOverrideInfo> GetOverrideInfos() property
    {
        TArray<FLevelSpotOverrideInfo> __r;
        return __r;
    }
    void SetOverrideInfos(const TArray<FLevelSpotOverrideInfo> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FC_LevelSpot : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FLevelSpotInfo m_LevelSpotInfo;

    FC_LevelSpot()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_LevelSpot(const FC_LevelSpot &inout Other)
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_LevelSpot opAssign(const FC_LevelSpot &inout Other)
    {
        FC_LevelSpot __r;
        this.SetLevelSpotInfo(Other.GetLevelSpotInfo());
        return __r;
    }
    const FLevelSpotInfo GetLevelSpotInfo() const property
    {
        const FLevelSpotInfo __r;
        return __r;
    }
    FLevelSpotInfo GetModify_LevelSpotInfo() property
    {
        FLevelSpotInfo __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLevelSpotInfo(const FLevelSpotInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        return;
    }
}

struct FC_LevelSpotHistory : FECSComponent
{
    UPROPERTY()
    FLevelSpotViewers HistoryViewers;
    UPROPERTY()
    TSet<FECSEntity> HistoryZSamplers;

    FC_LevelSpotHistory()
    {
        return;
    }
}

struct FCS_PositionLevelSpotManager : FECSSingleton
{
    UPROPERTY()
    TMap<FLevelSpotId, FLevelSpotInfo> LevelSpots;

    FCS_PositionLevelSpotManager()
    {
        return;
    }
}

struct FCS_LevelSpotIdGenerator : FECSSingleton
{
    UPROPERTY()
    FLevelSpotId NextSpotId;

    FCS_LevelSpotIdGenerator()
    {
        return;
    }
}

struct FEntityLevelSpotViewData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FLevelSpotData m_Data;
    UPROPERTY()
    FECSEntityId m_OwnerEntityId;
    UPROPERTY()
    uint m_DataVersion;

    FEntityLevelSpotViewData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FEntityLevelSpotViewData(const FEntityLevelSpotViewData &inout Other)
    {
        this.m_DataVersion = 0;
        this.m_OwnerEntityId = Other.m_OwnerEntityId;
        this.m_DataVersion = int(Other.m_DataVersion);
        return;
    }
    FEntityLevelSpotViewData(const FLevelSpotData &inout InData, const FECSEntityId &inout InOwnerEntityId, const uint InDataVersion)
    {
        this.m_DataVersion = 0;
        this.SetData(InData);
        this.SetOwnerEntityId(InOwnerEntityId);
        this.SetDataVersion(InDataVersion);
        return;
    }
    FEntityLevelSpotViewData opAssign(const FEntityLevelSpotViewData &inout Other)
    {
        FEntityLevelSpotViewData __r;
        this.SetData(Other.GetData());
        this.SetOwnerEntityId(Other.GetOwnerEntityId());
        this.SetDataVersion(Other.GetDataVersion());
        return __r;
    }
    const FLevelSpotData GetData() const property
    {
        const FLevelSpotData __r;
        return __r;
    }
    FLevelSpotData GetModify_Data() property
    {
        FLevelSpotData __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetData(const FLevelSpotData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        return;
    }
    FECSEntityId GetOwnerEntityId() const property
    {
        FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_OwnerEntityId() property
    {
        FECSEntityId __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetOwnerEntityId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_OwnerEntityId = __Value;
        return;
    }
    uint GetDataVersion() const property
    {
        return this.m_DataVersion;
    }
    void SetDataVersion(const uint __Value) property
    {
        if (this.m_DataVersion == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_DataVersion = __Value;
        return;
    }
}

struct FPositionLevelSpotViewData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FLevelSpotData m_Data;
    UPROPERTY()
    FVector m_Position;
    UPROPERTY()
    uint m_DataVersion;

    FPositionLevelSpotViewData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPositionLevelSpotViewData(const FPositionLevelSpotViewData &inout Other)
    {
        this.m_DataVersion = 0;
        this.m_Position = Other.m_Position;
        this.m_DataVersion = int(Other.m_DataVersion);
        return;
    }
    FPositionLevelSpotViewData(const FLevelSpotData &inout InData, const FVector &inout InPosition, const uint InDataVersion)
    {
        this.m_DataVersion = 0;
        this.SetData(InData);
        this.SetPosition(InPosition);
        this.SetDataVersion(InDataVersion);
        return;
    }
    FPositionLevelSpotViewData opAssign(const FPositionLevelSpotViewData &inout Other)
    {
        FPositionLevelSpotViewData __r;
        this.SetData(Other.GetData());
        this.SetPosition(Other.GetPosition());
        this.SetDataVersion(Other.GetDataVersion());
        return __r;
    }
    const FLevelSpotData GetData() const property
    {
        const FLevelSpotData __r;
        return __r;
    }
    FLevelSpotData GetModify_Data() property
    {
        FLevelSpotData __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetData(const FLevelSpotData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        return;
    }
    FVector GetPosition() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_Position() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Position = __Value;
        return;
    }
    uint GetDataVersion() const property
    {
        return this.m_DataVersion;
    }
    void SetDataVersion(const uint __Value) property
    {
        if (this.m_DataVersion == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_DataVersion = __Value;
        return;
    }
}

struct FLevelSpotViewerData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_StructureVersion;
    UPROPERTY()
    TMap<FLevelSpotId, FEntityLevelSpotViewData> m_EntitySpots;
    UPROPERTY()
    TMap<FLevelSpotId, FPositionLevelSpotViewData> m_PositionSpots;

    FLevelSpotViewerData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLevelSpotViewerData(const FLevelSpotViewerData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLevelSpotViewerData opAssign(const FLevelSpotViewerData &inout Other)
    {
        FLevelSpotViewerData __r;
        this.SetStructureVersion(Other.GetStructureVersion());
        this.SetEntitySpots(Other.GetEntitySpots());
        this.SetPositionSpots(Other.GetPositionSpots());
        return __r;
    }
    void AddEntitySpot(const FLevelSpotId &inout SpotId, const FLevelSpotData &inout Data, const FECSEntityId &inout OwnerEntityId)
    {
        this.GetModify_EntitySpots().Add(SpotId, FEntityLevelSpotViewData(Data, OwnerEntityId, this.BumpStructureVersion()));
        return;
    }
    void AddPositionSpot(const FLevelSpotId &inout SpotId, const FLevelSpotData &inout Data, const FVector &inout Position)
    {
        this.GetModify_PositionSpots().Add(SpotId, FPositionLevelSpotViewData(Data, Position, this.BumpStructureVersion()));
        return;
    }
    void RemoveSpot(const FLevelSpotId &inout SpotId)
    {
        bool local_1 = !(false);
        if (local_1)
        {
            local_1 = !local_1;
            if (local_1)
            {
                return;
            }
        }
        this.BumpStructureVersion();
        return;
    }
    bool HasSpot(const FLevelSpotId &inout SpotId) const
    {
        return this.GetEntitySpots().Contains(SpotId) || this.GetPositionSpots().Contains(SpotId);
    }
    uint BumpStructureVersion()
    {
        int local_2 = this.GetStructureVersion() + 1;
        this.SetStructureVersion(local_2);
        return local_2;
    }
    uint GetStructureVersion() const property
    {
        return this.m_StructureVersion;
    }
    void SetStructureVersion(const uint __Value) property
    {
        if (this.m_StructureVersion == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StructureVersion = __Value;
        return;
    }
    const TMap<FLevelSpotId, FEntityLevelSpotViewData> GetEntitySpots() const property
    {
        const TMap<FLevelSpotId, FEntityLevelSpotViewData> __r;
        return __r;
    }
    TMap<FLevelSpotId, FEntityLevelSpotViewData> GetModify_EntitySpots() property
    {
        TMap<FLevelSpotId, FEntityLevelSpotViewData> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetEntitySpots(const TMap<FLevelSpotId, FEntityLevelSpotViewData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_EntitySpots = __Value;
        return;
    }
    const TMap<FLevelSpotId, FPositionLevelSpotViewData> GetPositionSpots() const property
    {
        const TMap<FLevelSpotId, FPositionLevelSpotViewData> __r;
        return __r;
    }
    TMap<FLevelSpotId, FPositionLevelSpotViewData> GetModify_PositionSpots() property
    {
        TMap<FLevelSpotId, FPositionLevelSpotViewData> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetPositionSpots(const TMap<FLevelSpotId, FPositionLevelSpotViewData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_PositionSpots = __Value;
        return;
    }
}

struct FC_LevelSpotSyncToViewerDeferTag : FECSComponent
{
    FC_LevelSpotSyncToViewerDeferTag()
    {
        return;
    }
}

struct FC_LevelSpotPlayerViewer : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FLevelSpotViewerData m_ViewerData;

    FC_LevelSpotPlayerViewer()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_LevelSpotPlayerViewer(const FC_LevelSpotPlayerViewer &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ViewerData = Other.m_ViewerData;
        return;
    }
    FC_LevelSpotPlayerViewer opAssign(const FC_LevelSpotPlayerViewer &inout Other)
    {
        FC_LevelSpotPlayerViewer __r;
        this.SetViewerData(Other.GetViewerData());
        return __r;
    }
    const FLevelSpotViewerData GetViewerData() const property
    {
        const FLevelSpotViewerData __r;
        return __r;
    }
    FLevelSpotViewerData GetViewerData() property
    {
        FLevelSpotViewerData __r;
        return __r;
    }
    void SetViewerData(const FLevelSpotViewerData &inout __Value) property
    {
        this.m_ViewerData = __Value;
        return;
    }
}

struct FC_LevelSpotTeamViewer : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FLevelSpotViewerData m_ViewerData;

    FC_LevelSpotTeamViewer()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_LevelSpotTeamViewer(const FC_LevelSpotTeamViewer &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ViewerData = Other.m_ViewerData;
        return;
    }
    FC_LevelSpotTeamViewer opAssign(const FC_LevelSpotTeamViewer &inout Other)
    {
        FC_LevelSpotTeamViewer __r;
        this.SetViewerData(Other.GetViewerData());
        return __r;
    }
    const FLevelSpotViewerData GetViewerData() const property
    {
        const FLevelSpotViewerData __r;
        return __r;
    }
    FLevelSpotViewerData GetViewerData() property
    {
        FLevelSpotViewerData __r;
        return __r;
    }
    void SetViewerData(const FLevelSpotViewerData &inout __Value) property
    {
        this.m_ViewerData = __Value;
        return;
    }
}

struct FCS_LevelSpotViewerSummary : FECSSingleton
{
    UPROPERTY()
    TSet<FECSEntity> AllViewers;

    FCS_LevelSpotViewerSummary()
    {
        return;
    }
}

struct FC_LevelSpotConfigPendingInitTag : FECSComponent
{
    FC_LevelSpotConfigPendingInitTag()
    {
        return;
    }
}

struct FC_LevelSpotMonitorCreatureMetaChangedDeferTag : FECSComponent
{
    FC_LevelSpotMonitorCreatureMetaChangedDeferTag()
    {
        return;
    }
}

struct FC_LevelSpotMonitorGameplayTagInitTag : FECSComponent
{
    FC_LevelSpotMonitorGameplayTagInitTag()
    {
        return;
    }
}

struct FC_LevelSpotConfig : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FPresentationConfig> PresentationConfig;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> PresentationRuleConfig;
    UPROPERTY()
    bool bSyncViewersToEntityNetRelevance = false;


    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        FC_LevelSpotConfigPendingInitTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
}

struct FCE_NotifyNewLevelSpotEntity : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Entity;

    FCE_NotifyNewLevelSpotEntity()
    {
        return;
    }
}

namespace FLevelSpotId
{
FLevelSpotId GenerateId()
{
    int local_8 = 0;
    FLevelSpotId __r;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    local_8.NextSpotId.opPostInc();
    return __r;
}
}
namespace FLevelSpotData
{
FLevelSpotData CreateMinimapIcon(const TDataObjectPtr<FPresentationConfig> &inout InPresentationConfig, const TDataObjectPtr<FMinimapIconConfig> &inout InMinimapIconConfig)
{
    FLevelSpotData local_126;
    FLevelSpotData __r;
    local_126.SetPresentationConfig(InPresentationConfig);
    local_126.SetMinimapIconDisplaySettings(InMinimapIconConfig);
    return __r;
}
FLevelSpotData CreateMinimapIconOverride(const TDataObjectPtr<FMinimapIconConfig> &inout InDisplaySettings)
{
    FLevelSpotData local_126;
    FLevelSpotData __r;
    local_126.SetMinimapIconDisplaySettings(InDisplaySettings);
    return __r;
}
FLevelSpotData CreateIndicatorOverride(const TDataObjectPtr<FIndicatorConfig> &inout InConfig)
{
    FLevelSpotData local_126;
    FLevelSpotData __r;
    local_126.SetIndicatorConfig(InConfig);
    return __r;
}
FLevelSpotData CreateNavigationBarIconOverride(const TDataObjectPtr<FNavigationBarIconConfig> &inout InConfig)
{
    FLevelSpotData local_126;
    FLevelSpotData __r;
    local_126.SetNavigationBarIconConfig(InConfig);
    return __r;
}
}
namespace ECSFunc_FC_LevelSpot
{
UFUNCTION()
bool HasLevelSpot(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelSpot);
}
FC_LevelSpot& AssignLevelSpot(const FECSEntity &inout Entity, const FC_LevelSpot &inout DefaultValue = FC_LevelSpot())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelSpot, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelSpot_BP(const FECSEntity &inout Entity, const FC_LevelSpot &inout DefaultValue = FC_LevelSpot())
{
    ECSFunc_FC_LevelSpot::AssignLevelSpot(Entity, DefaultValue);
    return;
}
FC_LevelSpot& ModifyLevelSpot(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelSpot));
    return local_12.GetComp();
}
FC_LevelSpot& ModifyOrAddLevelSpot(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelSpot));
    return local_12.GetComp();
}
const FC_LevelSpot& GetLevelSpot(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelSpot));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelSpot GetLevelSpot_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelSpot& local_4 = ECSFunc_FC_LevelSpot::GetLevelSpot(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelSpot();
}
const FC_LevelSpot GetDefaultedLevelSpot(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelSpot __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelSpot);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LevelSpot GetDefaultedLevelSpot_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelSpot::GetDefaultedLevelSpot(Entity);
}
UFUNCTION()
bool RemoveLevelSpot(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelSpot);
}
}
FECSMonitorRuntimeView __GetMonitorLevelSpotOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelSpot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelSpot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelSpot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelSpot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelSpot, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelSpotLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelSpot, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelSpot, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelSpot, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelSpotHistory
{
UFUNCTION()
bool HasLevelSpotHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotHistory);
}
FC_LevelSpotHistory& AssignLevelSpotHistory(const FECSEntity &inout Entity, const FC_LevelSpotHistory &inout DefaultValue = FC_LevelSpotHistory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotHistory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelSpotHistory_BP(const FECSEntity &inout Entity, const FC_LevelSpotHistory &inout DefaultValue = FC_LevelSpotHistory())
{
    ECSFunc_FC_LevelSpotHistory::AssignLevelSpotHistory(Entity, DefaultValue);
    return;
}
FC_LevelSpotHistory& ModifyLevelSpotHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotHistory));
    return local_12.GetComp();
}
FC_LevelSpotHistory& ModifyOrAddLevelSpotHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotHistory));
    return local_12.GetComp();
}
const FC_LevelSpotHistory& GetLevelSpotHistory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotHistory));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelSpotHistory GetLevelSpotHistory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LevelSpotHistory __r;
    bValid = false;
    bValid = ECSFunc_FC_LevelSpotHistory::GetLevelSpotHistory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LevelSpotHistory GetDefaultedLevelSpotHistory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelSpotHistory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotHistory);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LevelSpotHistory GetDefaultedLevelSpotHistory_BP(const FECSEntity &inout Entity)
{
    FC_LevelSpotHistory __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelSpotHistory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotHistory);
}
}
FECSMonitorRuntimeView __GetMonitorLevelSpotHistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelSpotHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotHistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelSpotHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotHistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelSpotHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotHistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelSpotHistory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotHistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelSpotHistory, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelSpotHistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelSpotHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotHistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelSpotHistory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotHistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelSpotHistory, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PositionLevelSpotManager
{
UFUNCTION()
bool HasPositionLevelSpotManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PositionLevelSpotManager);
}
FCS_PositionLevelSpotManager& AssignPositionLevelSpotManager(const FECSWorldPtr &inout World, const FCS_PositionLevelSpotManager &inout DefaultValue = FCS_PositionLevelSpotManager())
{
    UScriptStruct local_6 = FCS_PositionLevelSpotManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPositionLevelSpotManager_BP(const FECSWorldPtr &inout World, const FCS_PositionLevelSpotManager &inout DefaultValue = FCS_PositionLevelSpotManager())
{
    ECSFunc_FCS_PositionLevelSpotManager::AssignPositionLevelSpotManager(World, DefaultValue);
    return;
}
FCS_PositionLevelSpotManager& ModifyPositionLevelSpotManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PositionLevelSpotManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PositionLevelSpotManager& ModifyOrAddPositionLevelSpotManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PositionLevelSpotManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PositionLevelSpotManager& GetPositionLevelSpotManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PositionLevelSpotManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PositionLevelSpotManager GetPositionLevelSpotManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_PositionLevelSpotManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_PositionLevelSpotManager::GetPositionLevelSpotManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_PositionLevelSpotManager GetDefaultedPositionLevelSpotManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PositionLevelSpotManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PositionLevelSpotManager);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_PositionLevelSpotManager GetDefaultedPositionLevelSpotManager_BP(const FECSWorldPtr &inout World)
{
    FCS_PositionLevelSpotManager __r;
    return __r;
}
UFUNCTION()
bool RemovePositionLevelSpotManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PositionLevelSpotManager);
}
}
void __MonitorPositionLevelSpotManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PositionLevelSpotManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPositionLevelSpotManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PositionLevelSpotManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPositionLevelSpotManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PositionLevelSpotManager, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_LevelSpotIdGenerator
{
UFUNCTION()
bool HasLevelSpotIdGenerator(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LevelSpotIdGenerator);
}
FCS_LevelSpotIdGenerator& AssignLevelSpotIdGenerator(const FECSWorldPtr &inout World, const FCS_LevelSpotIdGenerator &inout DefaultValue = FCS_LevelSpotIdGenerator())
{
    UScriptStruct local_6 = FCS_LevelSpotIdGenerator;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLevelSpotIdGenerator_BP(const FECSWorldPtr &inout World, const FCS_LevelSpotIdGenerator &inout DefaultValue = FCS_LevelSpotIdGenerator())
{
    ECSFunc_FCS_LevelSpotIdGenerator::AssignLevelSpotIdGenerator(World, DefaultValue);
    return;
}
FCS_LevelSpotIdGenerator& ModifyLevelSpotIdGenerator(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelSpotIdGenerator;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LevelSpotIdGenerator& ModifyOrAddLevelSpotIdGenerator(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelSpotIdGenerator;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LevelSpotIdGenerator& GetLevelSpotIdGenerator(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelSpotIdGenerator;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LevelSpotIdGenerator GetLevelSpotIdGenerator_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LevelSpotIdGenerator __r;
    bValid = false;
    bValid = ECSFunc_FCS_LevelSpotIdGenerator::GetLevelSpotIdGenerator(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LevelSpotIdGenerator GetDefaultedLevelSpotIdGenerator(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LevelSpotIdGenerator __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LevelSpotIdGenerator);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_LevelSpotIdGenerator GetDefaultedLevelSpotIdGenerator_BP(const FECSWorldPtr &inout World)
{
    FCS_LevelSpotIdGenerator __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelSpotIdGenerator(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LevelSpotIdGenerator);
}
}
void __MonitorLevelSpotIdGeneratorLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LevelSpotIdGenerator, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotIdGeneratorActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LevelSpotIdGenerator, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotIdGeneratorModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LevelSpotIdGenerator, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelSpotSyncToViewerDeferTag
{
UFUNCTION()
bool HasLevelSpotSyncToViewerDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotSyncToViewerDeferTag);
}
FC_LevelSpotSyncToViewerDeferTag& AssignLevelSpotSyncToViewerDeferTag(const FECSEntity &inout Entity, const FC_LevelSpotSyncToViewerDeferTag &inout DefaultValue = FC_LevelSpotSyncToViewerDeferTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotSyncToViewerDeferTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelSpotSyncToViewerDeferTag_BP(const FECSEntity &inout Entity, const FC_LevelSpotSyncToViewerDeferTag &inout DefaultValue = FC_LevelSpotSyncToViewerDeferTag())
{
    ECSFunc_FC_LevelSpotSyncToViewerDeferTag::AssignLevelSpotSyncToViewerDeferTag(Entity, DefaultValue);
    return;
}
FC_LevelSpotSyncToViewerDeferTag& ModifyLevelSpotSyncToViewerDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotSyncToViewerDeferTag));
    return local_12.GetComp();
}
FC_LevelSpotSyncToViewerDeferTag& ModifyOrAddLevelSpotSyncToViewerDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotSyncToViewerDeferTag));
    return local_12.GetComp();
}
const FC_LevelSpotSyncToViewerDeferTag& GetLevelSpotSyncToViewerDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotSyncToViewerDeferTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelSpotSyncToViewerDeferTag GetLevelSpotSyncToViewerDeferTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelSpotSyncToViewerDeferTag& local_4 = ECSFunc_FC_LevelSpotSyncToViewerDeferTag::GetLevelSpotSyncToViewerDeferTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelSpotSyncToViewerDeferTag();
}
const FC_LevelSpotSyncToViewerDeferTag GetDefaultedLevelSpotSyncToViewerDeferTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelSpotSyncToViewerDeferTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotSyncToViewerDeferTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LevelSpotSyncToViewerDeferTag GetDefaultedLevelSpotSyncToViewerDeferTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelSpotSyncToViewerDeferTag::GetDefaultedLevelSpotSyncToViewerDeferTag(Entity);
}
UFUNCTION()
bool RemoveLevelSpotSyncToViewerDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotSyncToViewerDeferTag);
}
}
FECSMonitorRuntimeView __GetMonitorLevelSpotSyncToViewerDeferTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelSpotSyncToViewerDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotSyncToViewerDeferTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelSpotSyncToViewerDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotSyncToViewerDeferTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelSpotSyncToViewerDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotSyncToViewerDeferTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelSpotSyncToViewerDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotSyncToViewerDeferTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelSpotSyncToViewerDeferTag, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelSpotSyncToViewerDeferTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelSpotSyncToViewerDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotSyncToViewerDeferTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelSpotSyncToViewerDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotSyncToViewerDeferTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelSpotSyncToViewerDeferTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelSpotPlayerViewer
{
UFUNCTION()
bool HasLevelSpotPlayerViewer(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotPlayerViewer);
}
FC_LevelSpotPlayerViewer& AssignLevelSpotPlayerViewer(const FECSEntity &inout Entity, const FC_LevelSpotPlayerViewer &inout DefaultValue = FC_LevelSpotPlayerViewer())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotPlayerViewer, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelSpotPlayerViewer_BP(const FECSEntity &inout Entity, const FC_LevelSpotPlayerViewer &inout DefaultValue = FC_LevelSpotPlayerViewer())
{
    ECSFunc_FC_LevelSpotPlayerViewer::AssignLevelSpotPlayerViewer(Entity, DefaultValue);
    return;
}
FC_LevelSpotPlayerViewer& ModifyLevelSpotPlayerViewer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotPlayerViewer));
    return local_12.GetComp();
}
FC_LevelSpotPlayerViewer& ModifyOrAddLevelSpotPlayerViewer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotPlayerViewer));
    return local_12.GetComp();
}
const FC_LevelSpotPlayerViewer& GetLevelSpotPlayerViewer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotPlayerViewer));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelSpotPlayerViewer GetLevelSpotPlayerViewer_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelSpotPlayerViewer& local_4 = ECSFunc_FC_LevelSpotPlayerViewer::GetLevelSpotPlayerViewer(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelSpotPlayerViewer();
}
const FC_LevelSpotPlayerViewer GetDefaultedLevelSpotPlayerViewer(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelSpotPlayerViewer __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotPlayerViewer);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LevelSpotPlayerViewer GetDefaultedLevelSpotPlayerViewer_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelSpotPlayerViewer::GetDefaultedLevelSpotPlayerViewer(Entity);
}
UFUNCTION()
bool RemoveLevelSpotPlayerViewer(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotPlayerViewer);
}
}
FECSMonitorRuntimeView __GetMonitorLevelSpotPlayerViewerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelSpotPlayerViewer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotPlayerViewerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelSpotPlayerViewer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotPlayerViewerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelSpotPlayerViewer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotPlayerViewerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelSpotPlayerViewer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotPlayerViewerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelSpotPlayerViewer, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelSpotPlayerViewerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelSpotPlayerViewer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotPlayerViewerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelSpotPlayerViewer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotPlayerViewerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelSpotPlayerViewer, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelSpotTeamViewer
{
UFUNCTION()
bool HasLevelSpotTeamViewer(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotTeamViewer);
}
FC_LevelSpotTeamViewer& AssignLevelSpotTeamViewer(const FECSEntity &inout Entity, const FC_LevelSpotTeamViewer &inout DefaultValue = FC_LevelSpotTeamViewer())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotTeamViewer, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelSpotTeamViewer_BP(const FECSEntity &inout Entity, const FC_LevelSpotTeamViewer &inout DefaultValue = FC_LevelSpotTeamViewer())
{
    ECSFunc_FC_LevelSpotTeamViewer::AssignLevelSpotTeamViewer(Entity, DefaultValue);
    return;
}
FC_LevelSpotTeamViewer& ModifyLevelSpotTeamViewer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotTeamViewer));
    return local_12.GetComp();
}
FC_LevelSpotTeamViewer& ModifyOrAddLevelSpotTeamViewer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotTeamViewer));
    return local_12.GetComp();
}
const FC_LevelSpotTeamViewer& GetLevelSpotTeamViewer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotTeamViewer));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelSpotTeamViewer GetLevelSpotTeamViewer_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelSpotTeamViewer& local_4 = ECSFunc_FC_LevelSpotTeamViewer::GetLevelSpotTeamViewer(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelSpotTeamViewer();
}
const FC_LevelSpotTeamViewer GetDefaultedLevelSpotTeamViewer(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelSpotTeamViewer __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotTeamViewer);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LevelSpotTeamViewer GetDefaultedLevelSpotTeamViewer_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelSpotTeamViewer::GetDefaultedLevelSpotTeamViewer(Entity);
}
UFUNCTION()
bool RemoveLevelSpotTeamViewer(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotTeamViewer);
}
}
FECSMonitorRuntimeView __GetMonitorLevelSpotTeamViewerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelSpotTeamViewer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotTeamViewerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelSpotTeamViewer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotTeamViewerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelSpotTeamViewer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotTeamViewerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelSpotTeamViewer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotTeamViewerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelSpotTeamViewer, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelSpotTeamViewerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelSpotTeamViewer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotTeamViewerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelSpotTeamViewer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotTeamViewerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelSpotTeamViewer, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_LevelSpotViewerSummary
{
UFUNCTION()
bool HasLevelSpotViewerSummary(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LevelSpotViewerSummary);
}
FCS_LevelSpotViewerSummary& AssignLevelSpotViewerSummary(const FECSWorldPtr &inout World, const FCS_LevelSpotViewerSummary &inout DefaultValue = FCS_LevelSpotViewerSummary())
{
    UScriptStruct local_6 = FCS_LevelSpotViewerSummary;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLevelSpotViewerSummary_BP(const FECSWorldPtr &inout World, const FCS_LevelSpotViewerSummary &inout DefaultValue = FCS_LevelSpotViewerSummary())
{
    ECSFunc_FCS_LevelSpotViewerSummary::AssignLevelSpotViewerSummary(World, DefaultValue);
    return;
}
FCS_LevelSpotViewerSummary& ModifyLevelSpotViewerSummary(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelSpotViewerSummary;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LevelSpotViewerSummary& ModifyOrAddLevelSpotViewerSummary(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelSpotViewerSummary;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LevelSpotViewerSummary& GetLevelSpotViewerSummary(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelSpotViewerSummary;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LevelSpotViewerSummary GetLevelSpotViewerSummary_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LevelSpotViewerSummary __r;
    bValid = false;
    bValid = ECSFunc_FCS_LevelSpotViewerSummary::GetLevelSpotViewerSummary(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LevelSpotViewerSummary GetDefaultedLevelSpotViewerSummary(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LevelSpotViewerSummary __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LevelSpotViewerSummary);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_LevelSpotViewerSummary GetDefaultedLevelSpotViewerSummary_BP(const FECSWorldPtr &inout World)
{
    FCS_LevelSpotViewerSummary __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelSpotViewerSummary(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LevelSpotViewerSummary);
}
}
void __MonitorLevelSpotViewerSummaryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LevelSpotViewerSummary, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotViewerSummaryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LevelSpotViewerSummary, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotViewerSummaryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LevelSpotViewerSummary, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelSpotConfigPendingInitTag
{
UFUNCTION()
bool HasLevelSpotConfigPendingInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfigPendingInitTag);
}
FC_LevelSpotConfigPendingInitTag& AssignLevelSpotConfigPendingInitTag(const FECSEntity &inout Entity, const FC_LevelSpotConfigPendingInitTag &inout DefaultValue = FC_LevelSpotConfigPendingInitTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfigPendingInitTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelSpotConfigPendingInitTag_BP(const FECSEntity &inout Entity, const FC_LevelSpotConfigPendingInitTag &inout DefaultValue = FC_LevelSpotConfigPendingInitTag())
{
    ECSFunc_FC_LevelSpotConfigPendingInitTag::AssignLevelSpotConfigPendingInitTag(Entity, DefaultValue);
    return;
}
FC_LevelSpotConfigPendingInitTag& ModifyLevelSpotConfigPendingInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfigPendingInitTag));
    return local_12.GetComp();
}
FC_LevelSpotConfigPendingInitTag& ModifyOrAddLevelSpotConfigPendingInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfigPendingInitTag));
    return local_12.GetComp();
}
const FC_LevelSpotConfigPendingInitTag& GetLevelSpotConfigPendingInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfigPendingInitTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelSpotConfigPendingInitTag GetLevelSpotConfigPendingInitTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelSpotConfigPendingInitTag& local_4 = ECSFunc_FC_LevelSpotConfigPendingInitTag::GetLevelSpotConfigPendingInitTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelSpotConfigPendingInitTag();
}
const FC_LevelSpotConfigPendingInitTag GetDefaultedLevelSpotConfigPendingInitTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelSpotConfigPendingInitTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfigPendingInitTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LevelSpotConfigPendingInitTag GetDefaultedLevelSpotConfigPendingInitTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelSpotConfigPendingInitTag::GetDefaultedLevelSpotConfigPendingInitTag(Entity);
}
UFUNCTION()
bool RemoveLevelSpotConfigPendingInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfigPendingInitTag);
}
}
FECSMonitorRuntimeView __GetMonitorLevelSpotConfigPendingInitTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelSpotConfigPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotConfigPendingInitTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelSpotConfigPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotConfigPendingInitTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelSpotConfigPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotConfigPendingInitTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelSpotConfigPendingInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotConfigPendingInitTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelSpotConfigPendingInitTag, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelSpotConfigPendingInitTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelSpotConfigPendingInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotConfigPendingInitTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelSpotConfigPendingInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotConfigPendingInitTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelSpotConfigPendingInitTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelSpotMonitorCreatureMetaChangedDeferTag
{
UFUNCTION()
bool HasLevelSpotMonitorCreatureMetaChangedDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorCreatureMetaChangedDeferTag);
}
FC_LevelSpotMonitorCreatureMetaChangedDeferTag& AssignLevelSpotMonitorCreatureMetaChangedDeferTag(const FECSEntity &inout Entity, const FC_LevelSpotMonitorCreatureMetaChangedDeferTag &inout DefaultValue = FC_LevelSpotMonitorCreatureMetaChangedDeferTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorCreatureMetaChangedDeferTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelSpotMonitorCreatureMetaChangedDeferTag_BP(const FECSEntity &inout Entity, const FC_LevelSpotMonitorCreatureMetaChangedDeferTag &inout DefaultValue = FC_LevelSpotMonitorCreatureMetaChangedDeferTag())
{
    ECSFunc_FC_LevelSpotMonitorCreatureMetaChangedDeferTag::AssignLevelSpotMonitorCreatureMetaChangedDeferTag(Entity, DefaultValue);
    return;
}
FC_LevelSpotMonitorCreatureMetaChangedDeferTag& ModifyLevelSpotMonitorCreatureMetaChangedDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorCreatureMetaChangedDeferTag));
    return local_12.GetComp();
}
FC_LevelSpotMonitorCreatureMetaChangedDeferTag& ModifyOrAddLevelSpotMonitorCreatureMetaChangedDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorCreatureMetaChangedDeferTag));
    return local_12.GetComp();
}
const FC_LevelSpotMonitorCreatureMetaChangedDeferTag& GetLevelSpotMonitorCreatureMetaChangedDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorCreatureMetaChangedDeferTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelSpotMonitorCreatureMetaChangedDeferTag GetLevelSpotMonitorCreatureMetaChangedDeferTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelSpotMonitorCreatureMetaChangedDeferTag& local_4 = ECSFunc_FC_LevelSpotMonitorCreatureMetaChangedDeferTag::GetLevelSpotMonitorCreatureMetaChangedDeferTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelSpotMonitorCreatureMetaChangedDeferTag();
}
const FC_LevelSpotMonitorCreatureMetaChangedDeferTag GetDefaultedLevelSpotMonitorCreatureMetaChangedDeferTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelSpotMonitorCreatureMetaChangedDeferTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorCreatureMetaChangedDeferTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LevelSpotMonitorCreatureMetaChangedDeferTag GetDefaultedLevelSpotMonitorCreatureMetaChangedDeferTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelSpotMonitorCreatureMetaChangedDeferTag::GetDefaultedLevelSpotMonitorCreatureMetaChangedDeferTag(Entity);
}
UFUNCTION()
bool RemoveLevelSpotMonitorCreatureMetaChangedDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorCreatureMetaChangedDeferTag);
}
}
FECSMonitorRuntimeView __GetMonitorLevelSpotMonitorCreatureMetaChangedDeferTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelSpotMonitorCreatureMetaChangedDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotMonitorCreatureMetaChangedDeferTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelSpotMonitorCreatureMetaChangedDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotMonitorCreatureMetaChangedDeferTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelSpotMonitorCreatureMetaChangedDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotMonitorCreatureMetaChangedDeferTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelSpotMonitorCreatureMetaChangedDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotMonitorCreatureMetaChangedDeferTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelSpotMonitorCreatureMetaChangedDeferTag, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelSpotMonitorCreatureMetaChangedDeferTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelSpotMonitorCreatureMetaChangedDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotMonitorCreatureMetaChangedDeferTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelSpotMonitorCreatureMetaChangedDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotMonitorCreatureMetaChangedDeferTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelSpotMonitorCreatureMetaChangedDeferTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelSpotMonitorGameplayTagInitTag
{
UFUNCTION()
bool HasLevelSpotMonitorGameplayTagInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorGameplayTagInitTag);
}
FC_LevelSpotMonitorGameplayTagInitTag& AssignLevelSpotMonitorGameplayTagInitTag(const FECSEntity &inout Entity, const FC_LevelSpotMonitorGameplayTagInitTag &inout DefaultValue = FC_LevelSpotMonitorGameplayTagInitTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorGameplayTagInitTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelSpotMonitorGameplayTagInitTag_BP(const FECSEntity &inout Entity, const FC_LevelSpotMonitorGameplayTagInitTag &inout DefaultValue = FC_LevelSpotMonitorGameplayTagInitTag())
{
    ECSFunc_FC_LevelSpotMonitorGameplayTagInitTag::AssignLevelSpotMonitorGameplayTagInitTag(Entity, DefaultValue);
    return;
}
FC_LevelSpotMonitorGameplayTagInitTag& ModifyLevelSpotMonitorGameplayTagInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorGameplayTagInitTag));
    return local_12.GetComp();
}
FC_LevelSpotMonitorGameplayTagInitTag& ModifyOrAddLevelSpotMonitorGameplayTagInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorGameplayTagInitTag));
    return local_12.GetComp();
}
const FC_LevelSpotMonitorGameplayTagInitTag& GetLevelSpotMonitorGameplayTagInitTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorGameplayTagInitTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelSpotMonitorGameplayTagInitTag GetLevelSpotMonitorGameplayTagInitTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelSpotMonitorGameplayTagInitTag& local_4 = ECSFunc_FC_LevelSpotMonitorGameplayTagInitTag::GetLevelSpotMonitorGameplayTagInitTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelSpotMonitorGameplayTagInitTag();
}
const FC_LevelSpotMonitorGameplayTagInitTag GetDefaultedLevelSpotMonitorGameplayTagInitTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelSpotMonitorGameplayTagInitTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorGameplayTagInitTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LevelSpotMonitorGameplayTagInitTag GetDefaultedLevelSpotMonitorGameplayTagInitTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelSpotMonitorGameplayTagInitTag::GetDefaultedLevelSpotMonitorGameplayTagInitTag(Entity);
}
UFUNCTION()
bool RemoveLevelSpotMonitorGameplayTagInitTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotMonitorGameplayTagInitTag);
}
}
FECSMonitorRuntimeView __GetMonitorLevelSpotMonitorGameplayTagInitTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelSpotMonitorGameplayTagInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotMonitorGameplayTagInitTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelSpotMonitorGameplayTagInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotMonitorGameplayTagInitTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelSpotMonitorGameplayTagInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotMonitorGameplayTagInitTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelSpotMonitorGameplayTagInitTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotMonitorGameplayTagInitTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelSpotMonitorGameplayTagInitTag, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelSpotMonitorGameplayTagInitTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelSpotMonitorGameplayTagInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotMonitorGameplayTagInitTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelSpotMonitorGameplayTagInitTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotMonitorGameplayTagInitTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelSpotMonitorGameplayTagInitTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelSpotConfig
{
UFUNCTION()
bool HasLevelSpotConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfig);
}
FC_LevelSpotConfig& AssignLevelSpotConfig(const FECSEntity &inout Entity, const FC_LevelSpotConfig &inout DefaultValue = FC_LevelSpotConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelSpotConfig_BP(const FECSEntity &inout Entity, const FC_LevelSpotConfig &inout DefaultValue = FC_LevelSpotConfig())
{
    ECSFunc_FC_LevelSpotConfig::AssignLevelSpotConfig(Entity, DefaultValue);
    return;
}
FC_LevelSpotConfig& ModifyLevelSpotConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfig));
    return local_12.GetComp();
}
FC_LevelSpotConfig& ModifyOrAddLevelSpotConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfig));
    return local_12.GetComp();
}
const FC_LevelSpotConfig& GetLevelSpotConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelSpotConfig GetLevelSpotConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LevelSpotConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_LevelSpotConfig::GetLevelSpotConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LevelSpotConfig GetDefaultedLevelSpotConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelSpotConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfig);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_LevelSpotConfig GetDefaultedLevelSpotConfig_BP(const FECSEntity &inout Entity)
{
    FC_LevelSpotConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelSpotConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelSpotConfig);
}
}
FECSMonitorRuntimeView __GetMonitorLevelSpotConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelSpotConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelSpotConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelSpotConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelSpotConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelSpotConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelSpotConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelSpotConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelSpotConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelSpotConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelSpotConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelSpotConfig, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FLevelSpotOverrideInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FLevelSpotOverrideInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FLevelSpotOverrideInfo
{
int __IndexOf_SourcePrivate()
{
    return 0;
}
int __IndexOf_Data()
{
    return 1;
}
int __IndexOf_Viewers()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LevelSpot &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LevelSpot &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LevelSpot &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LevelSpot
{
int __IndexOf_LevelSpotInfo()
{
    return 0;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FEntityLevelSpotViewData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FEntityLevelSpotViewData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FEntityLevelSpotViewData
{
int __IndexOf_Data()
{
    return 0;
}
int __IndexOf_OwnerEntityId()
{
    return 1;
}
int __IndexOf_DataVersion()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FPositionLevelSpotViewData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FPositionLevelSpotViewData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPositionLevelSpotViewData
{
int __IndexOf_Data()
{
    return 0;
}
int __IndexOf_Position()
{
    return 1;
}
int __IndexOf_DataVersion()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FLevelSpotViewerData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FLevelSpotViewerData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FLevelSpotViewerData
{
int __IndexOf_StructureVersion()
{
    return 0;
}
int __IndexOf_EntitySpots()
{
    return 1;
}
int __IndexOf_PositionSpots()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LevelSpotPlayerViewer &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LevelSpotPlayerViewer &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LevelSpotPlayerViewer &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LevelSpotPlayerViewer
{
int __IndexOf_ViewerData()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LevelSpotTeamViewer &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LevelSpotTeamViewer &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LevelSpotTeamViewer &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LevelSpotTeamViewer
{
int __IndexOf_ViewerData()
{
    return 0;
}
}
