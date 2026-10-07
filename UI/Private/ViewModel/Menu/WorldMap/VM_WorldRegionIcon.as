
namespace FVM_WorldRegionIcon
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature GotoRegionMap = FEUIModelCallbackSignature();

}
struct FVM_WorldRegionIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> m_LevelInfoConfig;
    UPROPERTY()
    bool m_bIsModeEntrance;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;
    UPROPERTY()
    TArray<TEUIModelRef<FM_Spot>> m_MissionSpots;
    UPROPERTY()
    TEUIModelRef<FM_SpotView> m_MissionSpotView;

    FVM_WorldRegionIcon()
    {
        this.m_bIsModeEntrance = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_WorldRegionIcon(const FVM_WorldRegionIcon &inout Other)
    {
        this.m_bIsModeEntrance = false;
        this.m_LevelInfoConfig = Other.m_LevelInfoConfig;
        this.m_bIsModeEntrance = Other.m_bIsModeEntrance;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_MissionSpots = Other.m_MissionSpots;
        this.m_MissionSpotView = Other.m_MissionSpotView;
        return;
    }
    FVM_WorldRegionIcon& opAssign(const FVM_WorldRegionIcon &inout Other)
    {
        this.m_LevelInfoConfig = Other.m_LevelInfoConfig;
        this.m_bIsModeEntrance = Other.m_bIsModeEntrance;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_MissionSpots = Other.m_MissionSpots;
        return Other.m_MissionSpotView;
    }
    void LoadConfig(const FConfigVM_WorldRegionIcon &inout InConfig)
    {
        this.SetbIsModeEntrance(InConfig.bIsModeEntrance);
        this.SetLevelInfoConfig(InConfig.LevelInfoConfig);
        return;
    }
    void PostLoad()
    {
        if (this.GetbIsModeEntrance())
        {
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_ModeEntrance_Entrance, 0))));
        }
        this.InitMissionSpots();
        return;
    }
    void GotoRegionMap()
    {
        if (this.IsLocked())
        {
            FCommonTipsParam local_10;
            ::CommonPopup::WeakTips(NSLOCTEXT("WorldMap", "RegionMapLocked", "иЇҐеЊєеџџжљ‚жњЄејЂж”ѕ"), local_10);
            return;
        }
        if (this.GetbIsModeEntrance())
        {
            FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Mode_Main);
            return;
        }
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_RegionMap, FEUIModelRef(::FVM_RegionMap::Create(this.GetContext().Manager, this.GetLevelInfoConfig())));
        return;
    }
    ESlateVisibility GetIconVisibility() const
    {
        int local_2;
        if (this.IsLocked())
        {
            local_2 = 4;
        }
        else
        {
            local_2 = 0;
        }
        return ESlateVisibility(local_2);
    }
    bool IsLocked() const
    {
        if (this.GetbIsModeEntrance())
        {
            return !(::FMS_SystemControl::Get(this.GetManager()).IsSystemUnlock(ESystemModule(5), false));
        }
        return !(this.GetLevelInfoConfig());
    }
    ESlateVisibility GetSelfVisisbility() const
    {
        int local_7;
        if (this.GetbIsModeEntrance())
        {
            if (::FMS_SystemControl::Get(this.GetManager()).IsSystemUnlock(ESystemModule(5), false))
            {
                local_7 = 4;
            }
            else
            {
                local_7 = 1;
            }
            return ESlateVisibility(local_7);
        }
        return ESlateVisibility(4);
    }
    bool HasMainMission() const
    {
        return this.HasMissionOfType(EMissionType(0));
    }
    bool HasSideMission() const
    {
        return this.HasMissionOfType(EMissionType(1));
    }
    bool HasMissionOfType(const EMissionType MissionType) const
    {
        for (auto& local_16 : this.GetMissionSpots())
        {
            FMissionPresentationData local_124 = ::GetMissionData(local_16.opArrow(), FSpotViewAdapter(this.GetMissionSpotView()));
            if (local_124.MissionConfig && (int(local_124.MissionConfig.opArrow().MissionType) == int(MissionType)))
            {
                return true;
            }
        }
        return false;
    }
    void InitMissionSpots()
    {
        if (!(this.GetLevelInfoConfig()))
        {
            return;
        }
        TDataObjectPtr<FMapConfig> local_26 = this.GetLevelInfoConfig().opArrow().GetMapConfig();
        if (!(local_26))
        {
            return;
        }
        TEUIModelRef<FM_SpotView> local_56 = TEUIModelRef<FM_SpotView>(::FM_SpotView::CreateFromRegistry(this.GetContext().Manager, TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetMapRegistry(this.GetContext().Manager, local_26)), EPresentationDataType(9)));
        this.SetMissionSpotView(local_56);
        TEUIModelRef<FM_SpotView> local_56_2 = this.GetMissionSpotView();
        for (auto& local_74 : local_56_2.opArrow().GetAllInterestedSpots())
        {
            this.TryAddMissionSpot(local_74);
        }
        return;
    }
    void OnMissionSpotAdded(const FMsg_InterestedSpotAdded &inout Message)
    {
        this.TryAddMissionSpot(Message.Spot);
        return;
    }
    void OnMissionSpotRemoved(const FMsg_InterestedSpotRemoved &inout Message)
    {
        this.RemoveMissionSpot(Message.Spot);
        return;
    }
    void TryAddMissionSpot(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (!(Spot) || this.GetMissionSpots().Contains(Spot))
        {
            return;
        }
        FMissionPresentationData local_108 = ::GetMissionData(Spot.opArrow(), FSpotViewAdapter(this.GetMissionSpotView()));
        FDataObjectPtr local_276;
        local_276;
        if (!((local_108.LevelInfo == local_276)))
        {
            return;
        }
        this.GetModify_MissionSpots().Add(Spot);
        return;
    }
    void RemoveMissionSpot(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        return;
    }
    const TDataObjectPtr<FLevelInfoConfig> GetLevelInfoConfig() const property
    {
        const TDataObjectPtr<FLevelInfoConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FLevelInfoConfig> GetModify_LevelInfoConfig() property
    {
        TDataObjectPtr<FLevelInfoConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLevelInfoConfig(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LevelInfoConfig = __Value;
        return;
    }
    bool GetbIsModeEntrance() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsModeEntrance;
    }
    void SetbIsModeEntrance(const bool __Value) property
    {
        if (!(this.m_bIsModeEntrance) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsModeEntrance = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(2);
        return this.m_RedDotVM;
    }
    void SetRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RedDotVM = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_Spot>> GetMissionSpots() const property
    {
        const TArray<TEUIModelRef<FM_Spot>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FM_Spot>> GetModify_MissionSpots() property
    {
        TArray<TEUIModelRef<FM_Spot>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetMissionSpots(const TArray<TEUIModelRef<FM_Spot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MissionSpots = __Value;
        return;
    }
    TEUIModelRef<FM_SpotView> GetMissionSpotView() const property
    {
        this.TrackPropertyRead(4);
        return this.m_MissionSpotView;
    }
    void SetMissionSpotView(const TEUIModelRef<FM_SpotView> &inout __Value) property
    {
        TEUIModelRef<FM_SpotView> local_2;
        local_2 = this.m_MissionSpotView;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_MissionSpotView = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_WorldRegionIcon
{
    UPROPERTY()
    ESlateVisibility IconVisibility;
    UPROPERTY()
    bool IsLocked;
    UPROPERTY()
    ESlateVisibility SelfVisisbility;
    UPROPERTY()
    bool HasMainMission;
    UPROPERTY()
    bool HasSideMission;
    UPROPERTY()
    TEUIModelRef<FVM_WorldRegionIcon> Self;


}

namespace FVM_WorldRegionIcon
{
FVM_WorldRegionIcon& Create(const UObject ContextObject)
{
    return FVM_WorldRegionIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_WorldRegionIcon CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_WorldRegionIcon __r;
    TEUIModelRef<FVM_WorldRegionIcon> local_6 = TEUIModelRef<FVM_WorldRegionIcon>(EUIInternal::MakeModelWithManager(Manager, FVM_WorldRegionIcon::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_WorldRegionIcon;
}
void __OnMissionSpotAdded(FVM_WorldRegionIcon &inout Model, const FMsg_InterestedSpotAdded &inout Message)
{
    Model.OnMissionSpotAdded(Message);
    return;
}
void __OnMissionSpotRemoved(FVM_WorldRegionIcon &inout Model, const FMsg_InterestedSpotRemoved &inout Message)
{
    Model.OnMissionSpotRemoved(Message);
    return;
}
TDataObjectPtr<FLevelInfoConfig> __UIGetter_LevelInfoConfig(const FVM_WorldRegionIcon &inout Model)
{
    return Model.GetLevelInfoConfig();
}
bool __UIGetter_bIsModeEntrance(const FVM_WorldRegionIcon &inout Model)
{
    return Model.GetbIsModeEntrance();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_WorldRegionIcon &inout Model)
{
    return Model.GetRedDotVM();
}
ESlateVisibility __UIGetter_IconVisibility(const FVM_WorldRegionIcon &inout Model)
{
    return Model.GetIconVisibility();
}
bool __UIGetter_IsLocked(const FVM_WorldRegionIcon &inout Model)
{
    return Model.IsLocked();
}
ESlateVisibility __UIGetter_SelfVisisbility(const FVM_WorldRegionIcon &inout Model)
{
    return Model.GetSelfVisisbility();
}
bool __UIGetter_HasMainMission(const FVM_WorldRegionIcon &inout Model)
{
    return Model.HasMainMission();
}
bool __UIGetter_HasSideMission(const FVM_WorldRegionIcon &inout Model)
{
    return Model.HasSideMission();
}
TEUIModelRef<FVM_WorldRegionIcon> __UIGetter_Self(const FVM_WorldRegionIcon &inout Model)
{
    return TEUIModelRef<FVM_WorldRegionIcon>(Model);
}
int __IndexOf_LevelInfoConfig()
{
    return 0;
}
int __IndexOf_bIsModeEntrance()
{
    return 1;
}
int __IndexOf_RedDotVM()
{
    return 2;
}
int __IndexOf_MissionSpots()
{
    return 3;
}
int __IndexOf_MissionSpotView()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_WorldRegionIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
