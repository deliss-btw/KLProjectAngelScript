
namespace FVM_RegionMap
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnItemSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnMinimapSelectionChanged = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnLevelSelected = FEUIModelCallbackSignature();

}
struct FRegionMapSpotDisplayPrioritySorter
{
    UPROPERTY()
    FSpotView SpotView;

    FRegionMapSpotDisplayPrioritySorter()
    {
        return;
    }
    FRegionMapSpotDisplayPrioritySorter(const FSpotView &inout InSpotView)
    {
        return;
    }
    bool SortTeleporter(const TEUIModelRef<FM_PresentationData_Teleporter> &inout A, const TEUIModelRef<FM_PresentationData_Teleporter> &inout B)
    {
        bool local_1;
        bool local_2;
        if (!(A))
        {
            local_1 = false;
        }
        else
        {
            local_1 = B;
        }
        if (!(local_1))
        {
            local_2 = false;
        }
        else
        {
            local_2 = A.opArrow().GetTeleporterConfig();
        }
        if (!(local_2))
        {
            local_1 = false;
        }
        else
        {
            local_1 = B.opArrow().GetTeleporterConfig();
        }
        if (local_1)
        {
            if (A.opArrow().GetTeleporterConfig().opArrow().DisplayPriority != B.opArrow().GetTeleporterConfig().opArrow().DisplayPriority)
            {
                return (A.opArrow().GetTeleporterConfig().opArrow().DisplayPriority < B.opArrow().GetTeleporterConfig().opArrow().DisplayPriority);
            }
            return (A.opArrow().GetTeleporterConfig().opArrow().DataId < B.opArrow().GetTeleporterConfig().opArrow().DataId);
        }
        return false;
    }
    bool opCall(const TEUIModelRef<FM_Spot> &inout A, const TEUIModelRef<FM_Spot> &inout B)
    {
        bool local_1;
        if (!(A))
        {
            local_1 = false;
        }
        else
        {
            bool local_2;
            local_2 = B;
            local_1 = local_2;
        }
        if (local_1)
        {
            bool local_2;
            TEUIModelRef<FM_PresentationData_Teleporter> local_12 = ::GetTeleporterData(A.opArrow(), FSpotViewAdapter(this));
            TEUIModelRef<FM_PresentationData_Teleporter> local_14 = ::GetTeleporterData(B.opArrow(), FSpotViewAdapter(this));
            if (!(local_12))
            {
                local_2 = false;
            }
            else
            {
                local_2 = local_14;
            }
            if (local_2)
            {
                return this.SortTeleporter(local_12, local_14);
            }
        }
        return false;
    }
}

struct FWorldMapTeleporterIconData
{
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> TeleporterConfig;

    FWorldMapTeleporterIconData()
    {
        return;
    }
    FWorldMapTeleporterIconData(const TDataObjectPtr<FTeleporterConfig> &inout InTeleporterConfig)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FVM_RegionMap : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_Text>> m_LevelNameList;
    UPROPERTY()
    TArray<TDataObjectPtr<FLevelInfoConfig>> m_AllLevelsInMap;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> m_SelectedLevelInfo;
    UPROPERTY()
    TDataObjectPtr<FMinimapDisplayConfig> m_MinimapDisplayConfig;
    UPROPERTY()
    TDataObjectPtr<FMapConfig> m_MapConfig;
    UPROPERTY()
    TArray<FEUIDynamicWidgetData> m_SpotList;
    UPROPERTY()
    FEUIModelContainer m_SelectedSpot;
    UPROPERTY()
    UMinimapIconRegistry m_Registry;
    UPROPERTY()
    TMap<TEUIModelRef<FM_Spot>, FMinimapIconHandle> m_SpotIconHandles;
    UPROPERTY()
    TMap<FMinimapIconHandle, FEUIModelContainer> m_SpotIconHandlesToSpot;
    UPROPERTY()
    TEUIModelRef<FM_SpotView> m_SpotView;
    UPROPERTY()
    FEUIModelContainerPool m_SpotModelPool;

    FVM_RegionMap()
    {
        this.m_Registry = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_RegionMap' by default constructor.");
        return;
    }
    FVM_RegionMap(const FVM_RegionMap &inout Other)
    {
        this.m_Registry = nullptr;
        this.m_LevelNameList = Other.m_LevelNameList;
        this.m_AllLevelsInMap = Other.m_AllLevelsInMap;
        this.m_SelectedLevelInfo = Other.m_SelectedLevelInfo;
        this.m_MinimapDisplayConfig = Other.m_MinimapDisplayConfig;
        this.m_MapConfig = Other.m_MapConfig;
        this.m_SpotList = Other.m_SpotList;
        this.m_SelectedSpot = Other.m_SelectedSpot;
        this.m_Registry = Other.m_Registry;
        this.m_SpotIconHandles = Other.m_SpotIconHandles;
        this.m_SpotIconHandlesToSpot = Other.m_SpotIconHandlesToSpot;
        this.m_SpotView = Other.m_SpotView;
        this.m_SpotModelPool = Other.m_SpotModelPool;
        return;
    }
    FVM_RegionMap(const TDataObjectPtr<FLevelInfoConfig> &inout InLevelInfoConfig)
    {
        this.m_Registry = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSelectedLevelInfo(InLevelInfoConfig);
        this.Initialize(TEUIModelRef<FM_Spot>());
        return;
    }
    FVM_RegionMap(const TEUIModelRef<FM_Spot> &inout Spot, const TDataObjectPtr<FLevelInfoConfig> &inout SpotLevel)
    {
        this.m_Registry = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        if (SpotLevel)
        {
            this.SetSelectedLevelInfo(SpotLevel);
        }
        else
        {
            FSpotViewAdapter local_20;
            XError(ELog(16), FString().Append("FVM_RegionMap: ").Append(Spot.opArrow().GetUniqueNameString()).Append(" (").Append(::GetSpotName(Spot.opArrow(), local_20)).Append(") has no level info"));
            this.SetSelectedLevelInfo(::FLevelUtils::GetCurrentLevelInfoConfig(this.GetManager().GetWorld()));
        }
        this.Initialize(Spot);
        return;
    }
    FVM_RegionMap& opAssign(const FVM_RegionMap &inout Other)
    {
        this.m_LevelNameList = Other.m_LevelNameList;
        this.m_AllLevelsInMap = Other.m_AllLevelsInMap;
        this.m_SelectedLevelInfo = Other.m_SelectedLevelInfo;
        this.m_MinimapDisplayConfig = Other.m_MinimapDisplayConfig;
        this.m_MapConfig = Other.m_MapConfig;
        this.m_SpotList = Other.m_SpotList;
        this.m_SelectedSpot = Other.m_SelectedSpot;
        this.m_Registry = Other.m_Registry;
        this.m_SpotIconHandles = Other.m_SpotIconHandles;
        this.m_SpotIconHandlesToSpot = Other.m_SpotIconHandlesToSpot;
        this.m_SpotView = Other.m_SpotView;
        return Other.m_SpotModelPool;
    }
    void Initialize(const TEUIModelRef<FM_Spot> &inout DefaultSelectedSpot = TEUIModelRef<FM_Spot>())
    {
        this.GetModify_SpotModelPool().Initialize(this.GetManager());
        this.SetMapConfig(this.GetSelectedLevelInfo().opArrow().GetMapConfig());
        TEUIModelRef<FM_SpotView> local_6 = TEUIModelRef<FM_SpotView>(::FM_SpotView::CreateFromRegistry(this.GetManager(), TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetMapRegistry(this.GetManager(), this.GetMapConfig()))));
        this.SetSpotView(local_6);
        TEUIModelRef<FM_SpotView> local_6_2 = this.GetSpotView();
        ::FMS_WorldMapSpotView::Get(this.GetManager()).SetCurrentSpotView(local_6_2.opArrow().AsSpotViewStruct());
        this.SetAllLevelsInMap(this.FindAllLevelsInCurrentMap());
        for (auto& local_26 : this.GetAllLevelsInMap())
        {
            this.GetModify_LevelNameList().Add(TEUIModelRef<FVM_Text>(::FVM_Text::Create(this.GetContext().Manager, local_26.opArrow().LevelDisplayName)));
        }
        this.UpdateMinimapDisplayConfig();
        this.BuildSpotList(this.MakeSpotModelContainer(DefaultSelectedSpot));
        return;
    }
    void BeginDestroy()
    {
        this.GetRegistry().ClearAllIcons();
        return;
    }
    void OnItemSelected(const FEUIDynamicWidgetData &inout Item)
    {
        const UWorldMapSettings local_4;
        if (!(Item.IsEmpty()))
        {
            GetGameplaySettings<UWorldMapSettings> local_6;
            local_4 = local_6;
            TSoftClassPtr<UEUIUserWidget> local_18;
            TEUIModelRef<FM_Spot> local_20 = this.GetSpotFromModelContainer(Item.ModelContainer);
            local_4.SpotDetailWidgets.Find(this.GetSpotCategory(local_20), local_18);
            this.SetSelectedSpot(Item.ModelContainer);
        }
        return;
    }
    void OnMinimapSelectionChanged(const FMinimapIconHandle &inout IconHandle)
    {
        if (!(::MinimapUtils::IsValidHandle(IconHandle)))
        {
            this.SetSelectedSpot(FEUIModelContainer());
            return;
        }
        this.SetSelectedSpot(this.GetSpotIconHandlesToSpot()[IconHandle]);
        return;
    }
    void OnLevelSelected(const int Index)
    {
        if (this.GetAllLevelsInMap().IsValidIndex(Index))
        {
            this.SetSelectedLevelInfo(this.GetAllLevelsInMap()[Index]);
            this.UpdateMinimapDisplayConfig();
            this.BuildSpotList(FEUIModelContainer());
        }
        return;
    }
    TEUIModelRef<FVM_Text> GetSelectedLevelName() const
    {
        if (this.GetSelectedLevelInfo())
        {
            int local_2 = this.GetAllLevelsInMap().IndexOfByKey(this.GetSelectedLevelInfo());
            if (this.GetLevelNameList().IsValidIndex(local_2))
            {
                return this.GetLevelNameList()[local_2];
            }
        }
        return TEUIModelRef<FVM_Text>();
    }
    UMinimapConfig GetMinimapConfig() const
    {
        if (this.GetMinimapDisplayConfig())
        {
            return Cast<UMinimapConfig>(System::LoadAsset_Blocking(this.GetMinimapDisplayConfig().opArrow().MinimapConfig));
        }
        return nullptr;
    }
    FMinimapIconHandle GetSelectedSpotIconHandle() const
    {
        if (!(this.GetSelectedSpot().IsEmpty()))
        {
            return this.GetSpotIconHandles()[this.GetSpotFromModelContainer(this.GetSelectedSpot())];
        }
        return FMinimapIconHandle();
    }
    FEUIDynamicWidgetData GetSelectedSpotDetail() const
    {
        const UWorldMapSettings local_2;
        GetGameplaySettings<UWorldMapSettings> local_4;
        local_2 = local_4;
        FEUIDynamicWidgetData local_30;
        TSoftClassPtr<UEUIUserWidget> local_40;
        local_2.SpotDetailWidgets.Find(this.GetSpotCategory(this.GetSpotFromModelContainer(this.GetSelectedSpot())), local_40);
        local_30.WidgetClass = local_40;
        local_30.ModelContainer = this.GetSelectedSpot();
        return local_30;
    }
    FEUIDynamicWidgetData GetSelectedSpotListItem() const
    {
        const UWorldMapSettings local_2;
        GetGameplaySettings<UWorldMapSettings> local_4;
        local_2 = local_4;
        FEUIDynamicWidgetData local_30;
        local_30.WidgetClass = local_2.RegionMapTeleporterWidget;
        local_30.ModelContainer = this.GetSelectedSpot();
        return local_30;
    }
    bool HasSelectedSpot() const
    {
        return !(this.GetSelectedSpot().IsEmpty());
    }
    void UpdateMinimapDisplayConfig()
    {
        if (this.GetSelectedLevelInfo().opArrow().GetMinimapDisplayConfigOverride())
        {
            this.SetMinimapDisplayConfig(this.GetSelectedLevelInfo().opArrow().GetMinimapDisplayConfigOverride());
            return;
        }
        this.SetMinimapDisplayConfig(this.GetMapConfig().opArrow().GetMinimapDisplayConfig());
        return;
    }
    void BuildSpotList(const FEUIModelContainer &inout DefaultSelectedSpot = FEUIModelContainer())
    {
        const UWorldMapSettings local_2;
        GetGameplaySettings<UWorldMapSettings> local_4;
        local_2 = local_4;
        this.SetRegistry(::MinimapUtils::GetIconRegistry(local_2.RegionMapIconRegistry));
        this.GetRegistry().ClearAllIcons();
        this.GetModify_SpotIconHandles().Empty(0);
        this.GetModify_SpotIconHandlesToSpot().Empty(0);
        this.GetModify_SpotList().Empty(0);
        this.SetSelectedSpot(DefaultSelectedSpot);
        TMap<EWorldMapSpotCategory, FSpotModelRefArray> local_30;
        for (auto local_52 : this.GetSpotView().opArrow().GetAllInterestedSpots())
        {
            if (!(this.ShouldShowSpot(local_52)))
            {
                continue;
            }
            local_30.FindOrAdd(this.GetSpotCategory(local_52)).Spots.Add(local_52);
        }
        int local_54 = 0;
        for (; local_54 <= 3; ++local_54)
        {
            int local_53_2 = local_54;
            if (!(local_30.Contains(EWorldMapSpotCategory(local_53_2))))
            {
                continue;
            }
            TEUIModelRef<FM_SpotView> local_32 = this.GetSpotView();
            FText local_66;
            if (local_2.SpotCategoryNames.Find(EWorldMapSpotCategory(local_53_2), local_66))
            {
                FEUIDynamicWidgetData local_90;
                local_90.WidgetClass = local_2.RegionMapTextTitleWidget;
                FEUIModelContainer local_104;
                local_90.ModelContainer = local_104;
                this.GetModify_SpotList().Add(local_90);
            }
            FEUIModelContainer local_118;
            for (auto local_52 : local_30[EWorldMapSpotCategory(local_53_2)].Spots)
            {
                FEUIDynamicWidgetData local_90;
                local_90.WidgetClass = local_2.RegionMapTeleporterWidget;
                local_90.ModelContainer = this.MakeSpotModelContainer(local_52);
                this.GetModify_SpotList().Add(local_90);
                FMinimapIconInfo local_172;
                local_172.IconWidget = local_2.RegionMapTeleporterMapIcon;
                local_172.DisplaySettings = local_2.RegionMapTeleporterIconDisplaySettings;
                local_172.WorldPosition = local_52.opArrow().GetTransform().GetPosition2D();
                local_172.IconSize = this.GetSpotIconSize(local_52);
                local_172.UserData = FInstancedStruct::Make(local_90.ModelContainer);
                int local_55 = this.GetSpotIconZOrder(local_52);
                FMinimapIconHandle local_183 = this.GetRegistry().AddIcon(local_172);
                this.GetModify_SpotIconHandles().Add(local_52, local_183);
                this.GetModify_SpotIconHandlesToSpot().Add(local_183, local_90.ModelContainer);
                if (local_118.IsEmpty())
                {
                    local_118 = local_90.ModelContainer;
                }
            }
            if (this.GetSelectedSpot().IsEmpty() && !(local_118.IsEmpty()))
            {
                this.SetSelectedSpot(local_118);
            }
        }
        return;
    }
    TArray<TDataObjectPtr<FLevelInfoConfig>> FindAllLevelsInCurrentMap() const
    {
        FDataObjectPtr local_96;
        TArray<TDataObjectPtr<FLevelInfoConfig>> local_4;
        TDataObjectIterator<FLevelInfoConfig> local_20;
        for (; local_20; )
        {
            const FLevelInfoConfig& local_24 = local_20.GetData();
            TDataObjectPtr<FMapConfig> local_48;
            local_48 = local_24.GetMapConfig();
            local_96;
            if (((local_48 == local_96) && (int(local_24.LevelType) == 1 || (int(local_24.LevelType) == 2))) && !(local_24.bIsDevLevel))
            {
                local_4.Add(TDataObjectPtr<FLevelInfoConfig>());
            }
            local_20.Next();
        }
        return local_4;
    }
    EWorldMapSpotCategory GetSpotCategory(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (!(Spot))
        {
            return EWorldMapSpotCategory(3);
        }
        if (::GetTeleporterData(Spot.opArrow(), FSpotViewAdapter(this.GetSpotView())))
        {
            return EWorldMapSpotCategory(0);
        }
        if (::HasMissionData(Spot.opArrow(), FSpotViewAdapter(this.GetSpotView())))
        {
            return EWorldMapSpotCategory(1);
        }
        TDataObjectPtr<FPresentationConfig> local_38 = ::GetPresentationConfig(Spot.opArrow(), FSpotViewAdapter(this.GetSpotView()));
        CastTo local_42;
        if (local_42.opCall())
        {
            return EWorldMapSpotCategory(2);
        }
        return EWorldMapSpotCategory(3);
    }
    FVector2D GetSpotIconSize(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        return FVector2D(48.0, 48.0);
    }
    TEUIModelRef<FM_Spot> GetSpotFromModelContainer(const FEUIModelContainer &inout ModelContainer) const
    {
        TConstRawPtr<FPresentationSpotDisplayModelData> local_6 = FInstancedStruct::GetPtr(ModelContainer.GetFactoryStruct()).opCall();
        if (local_6)
        {
            return local_6.opArrow().Spot;
        }
        return TEUIModelRef<FM_Spot>(nullptr);
    }
    FEUIModelContainer MakeSpotModelContainer(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (!(Spot))
        {
            return FEUIModelContainer();
        }
        FPresentationSpotDisplayModelData local_20;
        local_20.Spot = Spot;
        local_20.SpotUsage = EPresentationSpotUsage(5);
        return this.GetSpotModelPool().RequireContainer(FInstancedStruct::Make(local_20));
    }
    bool ShouldShowSpot(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (!(Spot))
        {
            return false;
        }
        TEUIModelRef<FM_SpotView> local_12 = this.GetSpotView();
        TEUIModelRef<FM_PresentationData_Teleporter> local_14 = ::GetTeleporterData(Spot.opArrow(), FSpotViewAdapter(local_12));
        if (local_14)
        {
            FDataObjectPtr local_136;
            TDataObjectPtr<FTeleporterConfig> local_40 = local_14.opArrow().GetTeleporterConfig();
            bool local_1 = !(local_40.opArrow().bShowOnWorldMap);
            if (local_1)
            {
                local_1 = true;
            }
            else
            {
                TDataObjectPtr<FLevelInfoConfig> local_88;
                local_88 = local_40.opArrow().GetLevelInfoConfig();
                local_136;
                local_1 = !((local_88 == local_136));
            }
            if (local_1)
            {
                return false;
            }
        }
        TEUIModelRef<FM_SpotView> local_12_2 = this.GetSpotView();
        TDataObjectPtr<FPresentationConfig> local_162 = ::GetPresentationConfig(Spot.opArrow(), FSpotViewAdapter(local_12_2));
        CastTo local_166;
        TDataObjectPtr<FNPCPresentationConfig> local_190 = local_166.opCall();
        if (local_190)
        {
            FDataObjectPtr local_136;
            TDataObjectPtr<FNPCMainConfig> local_238;
            if (!(::FMS_NPCSpotManager::Get(Spot.opArrow().GetManager()).GetPresentationToMainConfig().Find(local_190, local_238)))
            {
                return false;
            }
            TDataObjectPtr<FLevelInfoConfig> local_112;
            local_112 = local_238.opArrow().GetWorldMapRegion();
            local_136;
            if ((!((local_112 == local_136))))
            {
                return false;
            }
        }
        TEUIModelRef<FM_SpotView> local_12_3 = this.GetSpotView();
        if (::HasMissionData(Spot.opArrow(), FSpotViewAdapter(local_12_3)))
        {
            FDataObjectPtr local_136;
            TEUIModelRef<FM_SpotView> local_12_4 = this.GetSpotView();
            FMissionPresentationData local_336 = ::GetMissionData(Spot.opArrow(), FSpotViewAdapter(local_12_4));
            TDataObjectPtr<FLevelInfoConfig> local_88;
            local_136;
            if ((!((local_336.LevelInfo == local_136))))
            {
                return false;
            }
        }
        return true;
    }
    int GetSpotIconZOrder(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (::HasMissionData(Spot.opArrow(), FSpotViewAdapter(this.GetSpotView())))
        {
            return 100;
        }
        return 0;
    }
    const TArray<TEUIModelRef<FVM_Text>> GetLevelNameList() const property
    {
        const TArray<TEUIModelRef<FVM_Text>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_Text>> GetModify_LevelNameList() property
    {
        TArray<TEUIModelRef<FVM_Text>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLevelNameList(const TArray<TEUIModelRef<FVM_Text>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LevelNameList = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FLevelInfoConfig>> GetAllLevelsInMap() const property
    {
        const TArray<TDataObjectPtr<FLevelInfoConfig>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TDataObjectPtr<FLevelInfoConfig>> GetModify_AllLevelsInMap() property
    {
        TArray<TDataObjectPtr<FLevelInfoConfig>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAllLevelsInMap(const TArray<TDataObjectPtr<FLevelInfoConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AllLevelsInMap = __Value;
        return;
    }
    const TDataObjectPtr<FLevelInfoConfig> GetSelectedLevelInfo() const property
    {
        const TDataObjectPtr<FLevelInfoConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FLevelInfoConfig> GetModify_SelectedLevelInfo() property
    {
        TDataObjectPtr<FLevelInfoConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetSelectedLevelInfo(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SelectedLevelInfo = __Value;
        return;
    }
    const TDataObjectPtr<FMinimapDisplayConfig> GetMinimapDisplayConfig() const property
    {
        const TDataObjectPtr<FMinimapDisplayConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FMinimapDisplayConfig> GetModify_MinimapDisplayConfig() property
    {
        TDataObjectPtr<FMinimapDisplayConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetMinimapDisplayConfig(const TDataObjectPtr<FMinimapDisplayConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MinimapDisplayConfig = __Value;
        return;
    }
    const TDataObjectPtr<FMapConfig> GetMapConfig() const property
    {
        const TDataObjectPtr<FMapConfig> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TDataObjectPtr<FMapConfig> GetModify_MapConfig() property
    {
        TDataObjectPtr<FMapConfig> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetMapConfig(const TDataObjectPtr<FMapConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_MapConfig = __Value;
        return;
    }
    const TArray<FEUIDynamicWidgetData> GetSpotList() const property
    {
        const TArray<FEUIDynamicWidgetData> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<FEUIDynamicWidgetData> GetModify_SpotList() property
    {
        TArray<FEUIDynamicWidgetData> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetSpotList(const TArray<FEUIDynamicWidgetData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SpotList = __Value;
        return;
    }
    const FEUIModelContainer GetSelectedSpot() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedSpot() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetSelectedSpot(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SelectedSpot = __Value;
        return;
    }
    UMinimapIconRegistry GetRegistry() const property
    {
        this.TrackPropertyRead(7);
        return this.m_Registry;
    }
    void SetRegistry(const UMinimapIconRegistry __Value) property
    {
        if (this.m_Registry == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        return;
    }
    const TMap<TEUIModelRef<FM_Spot>, FMinimapIconHandle> GetSpotIconHandles() const property
    {
        const TMap<TEUIModelRef<FM_Spot>, FMinimapIconHandle> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TMap<TEUIModelRef<FM_Spot>, FMinimapIconHandle> GetModify_SpotIconHandles() property
    {
        TMap<TEUIModelRef<FM_Spot>, FMinimapIconHandle> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetSpotIconHandles(const TMap<TEUIModelRef<FM_Spot>, FMinimapIconHandle> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_SpotIconHandles = __Value;
        return;
    }
    const TMap<FMinimapIconHandle, FEUIModelContainer> GetSpotIconHandlesToSpot() const property
    {
        const TMap<FMinimapIconHandle, FEUIModelContainer> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TMap<FMinimapIconHandle, FEUIModelContainer> GetModify_SpotIconHandlesToSpot() property
    {
        TMap<FMinimapIconHandle, FEUIModelContainer> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetSpotIconHandlesToSpot(const TMap<FMinimapIconHandle, FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_SpotIconHandlesToSpot = __Value;
        return;
    }
    TEUIModelRef<FM_SpotView> GetSpotView() const property
    {
        this.TrackPropertyRead(10);
        return this.m_SpotView;
    }
    void SetSpotView(const TEUIModelRef<FM_SpotView> &inout __Value) property
    {
        TEUIModelRef<FM_SpotView> local_2;
        local_2 = this.m_SpotView;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_SpotView = __Value;
        return;
    }
    const FEUIModelContainerPool GetSpotModelPool() const property
    {
        const FEUIModelContainerPool __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FEUIModelContainerPool GetModify_SpotModelPool() property
    {
        FEUIModelContainerPool __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetSpotModelPool(const FEUIModelContainerPool &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SpotModelPool = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_RegionMap
{
    UPROPERTY()
    TEUIModelRef<FVM_Text> SelectedLevelName;
    UPROPERTY()
    UMinimapConfig MinimapConfig = nullptr;
    UPROPERTY()
    FMinimapIconHandle SelectedSpotIconHandle;
    UPROPERTY()
    FEUIDynamicWidgetData SelectedSpotDetail;
    UPROPERTY()
    FEUIDynamicWidgetData SelectedSpotListItem;
    UPROPERTY()
    bool HasSelectedSpot;
    UPROPERTY()
    TEUIModelRef<FVM_RegionMap> Self;


}

namespace FVM_RegionMap
{
FVM_RegionMap& Create(const UObject ContextObject, const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfoConfig)
{
    return FVM_RegionMap::CreateByManager(EUIInternal::GetContextManager(ContextObject), LevelInfoConfig);
}
FVM_RegionMap CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfoConfig)
{
    FVM_RegionMap __r;
    TEUIModelRef<FVM_RegionMap> local_6 = TEUIModelRef<FVM_RegionMap>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_RegionMap::ModelId, 0, LevelInfoConfig));
    return __r;
}
FVM_RegionMap& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot, const TDataObjectPtr<FLevelInfoConfig> &inout SpotLevel)
{
    return FVM_RegionMap::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot, SpotLevel);
}
FVM_RegionMap CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot, const TDataObjectPtr<FLevelInfoConfig> &inout SpotLevel)
{
    FVM_RegionMap __r;
    TEUIModelRef<FVM_RegionMap> local_6 = TEUIModelRef<FVM_RegionMap>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_RegionMap::ModelId, 1, Spot, SpotLevel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "LevelNameList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_Text>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MinimapDisplayConfig";
    local_14.TypeName = "TDataObjectPtr<FMinimapDisplayConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SpotList";
    local_14.TypeName = "TArray<FEUIDynamicWidgetData>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedLevelName";
    local_14.TypeName = "TEUIModelRef<FVM_Text>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MinimapConfig";
    local_14.TypeName = "UMinimapConfig";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedSpotIconHandle";
    local_14.TypeName = "FMinimapIconHandle";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedSpotDetail";
    local_14.TypeName = "FEUIDynamicWidgetData";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedSpotListItem";
    local_14.TypeName = "FEUIDynamicWidgetData";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasSelectedSpot";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_RegionMap>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_RegionMap;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_RegionMap;
}
TArray<TEUIModelRef<FVM_Text>> __UIGetter_LevelNameList(const FVM_RegionMap &inout Model)
{
    return Model.GetLevelNameList();
}
TDataObjectPtr<FMinimapDisplayConfig> __UIGetter_MinimapDisplayConfig(const FVM_RegionMap &inout Model)
{
    return Model.GetMinimapDisplayConfig();
}
TArray<FEUIDynamicWidgetData> __UIGetter_SpotList(const FVM_RegionMap &inout Model)
{
    return Model.GetSpotList();
}
TEUIModelRef<FVM_Text> __UIGetter_SelectedLevelName(const FVM_RegionMap &inout Model)
{
    return Model.GetSelectedLevelName();
}
UMinimapConfig __UIGetter_MinimapConfig(const FVM_RegionMap &inout Model)
{
    return Model.GetMinimapConfig();
}
FMinimapIconHandle __UIGetter_SelectedSpotIconHandle(const FVM_RegionMap &inout Model)
{
    return Model.GetSelectedSpotIconHandle();
}
FEUIDynamicWidgetData __UIGetter_SelectedSpotDetail(const FVM_RegionMap &inout Model)
{
    return Model.GetSelectedSpotDetail();
}
FEUIDynamicWidgetData __UIGetter_SelectedSpotListItem(const FVM_RegionMap &inout Model)
{
    return Model.GetSelectedSpotListItem();
}
bool __UIGetter_HasSelectedSpot(const FVM_RegionMap &inout Model)
{
    return Model.HasSelectedSpot();
}
TEUIModelRef<FVM_RegionMap> __UIGetter_Self(const FVM_RegionMap &inout Model)
{
    return TEUIModelRef<FVM_RegionMap>(Model);
}
int __IndexOf_LevelNameList()
{
    return 0;
}
int __IndexOf_AllLevelsInMap()
{
    return 1;
}
int __IndexOf_SelectedLevelInfo()
{
    return 2;
}
int __IndexOf_MinimapDisplayConfig()
{
    return 3;
}
int __IndexOf_MapConfig()
{
    return 4;
}
int __IndexOf_SpotList()
{
    return 5;
}
int __IndexOf_SelectedSpot()
{
    return 6;
}
int __IndexOf_Registry()
{
    return 7;
}
int __IndexOf_SpotIconHandles()
{
    return 8;
}
int __IndexOf_SpotIconHandlesToSpot()
{
    return 9;
}
int __IndexOf_SpotView()
{
    return 10;
}
int __IndexOf_SpotModelPool()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_RegionMap
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
