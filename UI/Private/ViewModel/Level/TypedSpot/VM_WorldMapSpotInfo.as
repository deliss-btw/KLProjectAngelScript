
namespace FMS_WorldMapSpotView
{
    const int ModelId = 0;
}
namespace FVM_WorldMapSpotInfo
{
    const int ModelId = 0;

}
struct FMS_WorldMapSpotView : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FSpotView m_CurrentSpotView;

    FMS_WorldMapSpotView()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_WorldMapSpotView(const FMS_WorldMapSpotView &inout Other)
    {
        return;
    }
    FMS_WorldMapSpotView opAssign(const FMS_WorldMapSpotView &inout Other)
    {
        FMS_WorldMapSpotView __r;
        return __r;
    }
    const FSpotView GetCurrentSpotView() const property
    {
        const FSpotView __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FSpotView GetModify_CurrentSpotView() property
    {
        FSpotView __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCurrentSpotView(const FSpotView &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
}

struct FVM_WorldMapSpotInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TEUIModelRef<FMS_WorldMapSpotView> m_SpotView;

    FVM_WorldMapSpotInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_WorldMapSpotInfo' by default constructor.");
        return;
    }
    FVM_WorldMapSpotInfo(const FVM_WorldMapSpotInfo &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_SpotView = Other.m_SpotView;
        return;
    }
    FVM_WorldMapSpotInfo(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_WorldMapSpotInfo& opAssign(const FVM_WorldMapSpotInfo &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        return Other.m_SpotView;
    }
    void PostConstruct()
    {
        this.SetSpotView(TEUIModelRef<FMS_WorldMapSpotView>(::FMS_WorldMapSpotView::Get(this.GetManager())));
        return;
    }
    FText GetSpotName() const
    {
        return ::GetSpotName(this.GetSpot().opArrow(), FSpotViewAdapter(this.GetSpotView().opArrow().GetCurrentSpotView()));
    }
    FText GetSpotDescription() const
    {
        return ::GetSpotDescription(this.GetSpot().opArrow(), FSpotViewAdapter(this.GetSpotView().opArrow().GetCurrentSpotView()));
    }
    FSoftBrush GetDisplayIcon() const
    {
        TDataObjectPtr<FPresentationConfig> local_36 = ::GetPresentationConfig(this.GetSpot().opArrow(), FSpotViewAdapter(this.GetSpotView().opArrow().GetCurrentSpotView()));
        if (local_36)
        {
            return local_36.opArrow().GetDefaultIcon();
        }
        return FSoftBrush();
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
    TEUIModelRef<FMS_WorldMapSpotView> GetSpotView() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SpotView;
    }
    void SetSpotView(const TEUIModelRef<FMS_WorldMapSpotView> &inout __Value) property
    {
        TEUIModelRef<FMS_WorldMapSpotView> local_2;
        local_2 = this.m_SpotView;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpotView = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_WorldMapSpotInfo
{
    UPROPERTY()
    FText SpotName;
    UPROPERTY()
    FText SpotDescription;
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    TEUIModelRef<FVM_WorldMapSpotInfo> Self;

    __GeneratedProperties_FVM_WorldMapSpotInfo()
    {
        return;
    }
}

namespace FMS_WorldMapSpotView
{
FMS_WorldMapSpotView& Get(const UObject ContextObject)
{
    return FMS_WorldMapSpotView::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_WorldMapSpotView GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_WorldMapSpotView __r;
    TEUIModelRef<FMS_WorldMapSpotView> local_6 = TEUIModelRef<FMS_WorldMapSpotView>(EUIInternal::MakeModelWithManager(Manager, FMS_WorldMapSpotView::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_WorldMapSpotView;
}
int __IndexOf_CurrentSpotView()
{
    return 0;
}
}
namespace FVM_WorldMapSpotInfo
{
FVM_WorldMapSpotInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_WorldMapSpotInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_WorldMapSpotInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_WorldMapSpotInfo __r;
    TEUIModelRef<FVM_WorldMapSpotInfo> local_6 = TEUIModelRef<FVM_WorldMapSpotInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_WorldMapSpotInfo::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SpotName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SpotDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_WorldMapSpotInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_WorldMapSpotInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_WorldMapSpotInfo;
}
FText __UIGetter_SpotName(const FVM_WorldMapSpotInfo &inout Model)
{
    return Model.GetSpotName();
}
FText __UIGetter_SpotDescription(const FVM_WorldMapSpotInfo &inout Model)
{
    return Model.GetSpotDescription();
}
FSoftBrush __UIGetter_DisplayIcon(const FVM_WorldMapSpotInfo &inout Model)
{
    return Model.GetDisplayIcon();
}
TEUIModelRef<FVM_WorldMapSpotInfo> __UIGetter_Self(const FVM_WorldMapSpotInfo &inout Model)
{
    return TEUIModelRef<FVM_WorldMapSpotInfo>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_SpotView()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_WorldMapSpotInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
