
namespace FVM_MissionSpotInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnGotoMissionButtonClicked = FEUIModelCallbackSignature();

}
struct FVM_MissionSpotInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TEUIModelRef<FVM_MissionDetailInfo> m_MissionInfo;
    UPROPERTY()
    TDataObjectPtr<FMissionConfig> m_MissionConfig;
    UPROPERTY()
    TEUIModelRef<FMS_WorldMapSpotView> m_WorldMapSpotView;

    FVM_MissionSpotInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MissionSpotInfo' by default constructor.");
        return;
    }
    FVM_MissionSpotInfo(const FVM_MissionSpotInfo &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_MissionInfo = Other.m_MissionInfo;
        this.m_MissionConfig = Other.m_MissionConfig;
        this.m_WorldMapSpotView = Other.m_WorldMapSpotView;
        return;
    }
    FVM_MissionSpotInfo(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_MissionSpotInfo& opAssign(const FVM_MissionSpotInfo &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_MissionInfo = Other.m_MissionInfo;
        this.m_MissionConfig = Other.m_MissionConfig;
        return Other.m_WorldMapSpotView;
    }
    void PostConstruct()
    {
        this.SetWorldMapSpotView(TEUIModelRef<FMS_WorldMapSpotView>(::FMS_WorldMapSpotView::Get(this.GetManager())));
        FMissionPresentationData local_112 = ::GetMissionData(this.GetSpot().opArrow(), FSpotViewAdapter(this.GetWorldMapSpotView().opArrow().GetCurrentSpotView()));
        if (local_112.MissionConfig)
        {
            this.SetMissionConfig(local_112.MissionConfig);
            this.SetMissionInfo(TEUIModelRef<FVM_MissionDetailInfo>(::FVM_MissionDetailInfo::Create(this.GetContext().Manager)));
            this.GetMissionInfo().opArrow().AssignMissionConfig(local_112.MissionConfig, FText());
            this.GetMissionInfo().opArrow().SetMissionIcon(local_112.GuideIcon);
        }
        return;
    }
    void OnGotoMissionButtonClicked()
    {
        FVM_MissionMainPanel& local_2 = ::FVM_MissionMainPanel::Create(this.GetContext().Manager);
        local_2.SetDefaultSelectMission(this.GetMissionConfig());
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_MissionPanel, FEUIModelRef(local_2));
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
    TEUIModelRef<FVM_MissionDetailInfo> GetMissionInfo() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MissionInfo;
    }
    void SetMissionInfo(const TEUIModelRef<FVM_MissionDetailInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_MissionDetailInfo> local_2;
        local_2 = this.m_MissionInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MissionInfo = __Value;
        return;
    }
    const TDataObjectPtr<FMissionConfig> GetMissionConfig() const property
    {
        const TDataObjectPtr<FMissionConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FMissionConfig> GetModify_MissionConfig() property
    {
        TDataObjectPtr<FMissionConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetMissionConfig(const TDataObjectPtr<FMissionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MissionConfig = __Value;
        return;
    }
    TEUIModelRef<FMS_WorldMapSpotView> GetWorldMapSpotView() const property
    {
        this.TrackPropertyRead(3);
        return this.m_WorldMapSpotView;
    }
    void SetWorldMapSpotView(const TEUIModelRef<FMS_WorldMapSpotView> &inout __Value) property
    {
        TEUIModelRef<FMS_WorldMapSpotView> local_2;
        local_2 = this.m_WorldMapSpotView;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_WorldMapSpotView = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MissionSpotInfo
{
    UPROPERTY()
    TEUIModelRef<FVM_MissionSpotInfo> Self;

    __GeneratedProperties_FVM_MissionSpotInfo()
    {
        return;
    }
}

namespace FVM_MissionSpotInfo
{
FVM_MissionSpotInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_MissionSpotInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_MissionSpotInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_MissionSpotInfo __r;
    TEUIModelRef<FVM_MissionSpotInfo> local_6 = TEUIModelRef<FVM_MissionSpotInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MissionSpotInfo::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MissionInfo";
    local_14.TypeName = "TEUIModelRef<FVM_MissionDetailInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MissionSpotInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MissionSpotInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MissionSpotInfo;
}
TEUIModelRef<FVM_MissionDetailInfo> __UIGetter_MissionInfo(const FVM_MissionSpotInfo &inout Model)
{
    return Model.GetMissionInfo();
}
TEUIModelRef<FVM_MissionSpotInfo> __UIGetter_Self(const FVM_MissionSpotInfo &inout Model)
{
    return TEUIModelRef<FVM_MissionSpotInfo>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_MissionInfo()
{
    return 1;
}
int __IndexOf_MissionConfig()
{
    return 2;
}
int __IndexOf_WorldMapSpotView()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_MissionSpotInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
