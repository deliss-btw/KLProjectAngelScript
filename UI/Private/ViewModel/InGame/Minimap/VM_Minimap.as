
namespace FVM_Minimap
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetNavigationTarget = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature DebugMoveToLocation = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature MarkPosition = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature FastMarkPosition = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature MarkAndGuideToPosition = FEUIModelCallbackSignature();

}
struct FVM_Minimap : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bLocalPlayerPositionSet;
    UPROPERTY()
    FVector2D m_LocalPlayerPosition;
    UPROPERTY()
    TArray<FMinimapPath> m_DisplayPaths;
    UPROPERTY()
    TDataObjectPtr<FMinimapDisplayConfig> m_MinimapDisplayConfig;
    UPROPERTY()
    FMinimapBorderInfo m_DisplayBorder;
    UPROPERTY()
    bool m_bSetMinimapCenter;
    UPROPERTY()
    FVector2D m_MinimapCenter;
    UPROPERTY()
    bool m_bDisplayingChangeArea;

    FVM_Minimap()
    {
        this.m_bLocalPlayerPositionSet = false;
        this.m_bSetMinimapCenter = false;
        this.m_MinimapCenter = FVector2D::ZeroVector;
        this.m_bDisplayingChangeArea = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Minimap(const FVM_Minimap &inout Other)
    {
        this.m_bLocalPlayerPositionSet = false;
        this.m_bSetMinimapCenter = false;
        this.m_MinimapCenter = FVector2D::ZeroVector;
        this.m_bDisplayingChangeArea = false;
        this.m_bLocalPlayerPositionSet = Other.m_bLocalPlayerPositionSet;
        this.m_LocalPlayerPosition = Other.m_LocalPlayerPosition;
        this.m_DisplayPaths = Other.m_DisplayPaths;
        this.m_MinimapDisplayConfig = Other.m_MinimapDisplayConfig;
        this.m_DisplayBorder = Other.m_DisplayBorder;
        this.m_bSetMinimapCenter = Other.m_bSetMinimapCenter;
        this.m_MinimapCenter = Other.m_MinimapCenter;
        this.m_bDisplayingChangeArea = Other.m_bDisplayingChangeArea;
        return;
    }
    FVM_Minimap(const FVector2D &inout InMinimapCenter)
    {
        this.m_bLocalPlayerPositionSet = false;
        this.m_bSetMinimapCenter = false;
        this.m_MinimapCenter = FVector2D::ZeroVector;
        this.m_bDisplayingChangeArea = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetbSetMinimapCenter(true);
        this.SetMinimapCenter(InMinimapCenter);
        return;
    }
    FVM_Minimap opAssign(const FVM_Minimap &inout Other)
    {
        FVM_Minimap __r;
        this.m_bLocalPlayerPositionSet = Other.m_bLocalPlayerPositionSet;
        this.m_LocalPlayerPosition = Other.m_LocalPlayerPosition;
        this.m_DisplayPaths = Other.m_DisplayPaths;
        this.m_MinimapDisplayConfig = Other.m_MinimapDisplayConfig;
        this.m_DisplayBorder = Other.m_DisplayBorder;
        this.m_bSetMinimapCenter = Other.m_bSetMinimapCenter;
        this.m_MinimapCenter = Other.m_MinimapCenter;
        this.m_bDisplayingChangeArea = Other.m_bDisplayingChangeArea;
        return __r;
    }
    UMinimapConfig GetMinimapConfig() const
    {
        return Cast<UMinimapConfig>(System::LoadAsset_Blocking(this.GetMinimapDisplayConfig().opArrow().MinimapConfig));
    }
    void PostConstruct()
    {
        this.SetMinimapDisplayConfig(::MinimapUtils::GetCurrentMinimapDisplayConfig());
        this.UpdateMinimapBorder();
        this.UpdateDisplayPaths();
        return;
    }
    void OnActiveBordersChanged(const FCS_ActiveBorders &inout ActiveBorders)
    {
        this.UpdateMinimapBorder();
        return;
    }
    void Tick()
    {
        int local_2 = 0;
        FECSEntity local_6 = this.GetContext().GetLocalPlayerPawn();
        if (local_2)
        {
            this.SetbLocalPlayerPositionSet(true);
            this.SetLocalPlayerPosition(::MinimapUtils::GamePositionToMapPosition(local_2.GetPosition()));
        }
        FMS_EcosimChangeAreaDisplayManager& local_18 = ::FMS_EcosimChangeAreaDisplayManager::Get(this.GetContext().Manager);
        if (local_18)
        {
            if (this.GetbDisplayingChangeArea() || local_18.HasChangeAreaDisplay())
            {
                this.UpdateDisplayPaths();
            }
        }
        return;
    }
    void SetNavigationTarget(const FVector2D &inout WorldPosition)
    {
        ::FGuidingPathUtils::RequestGuidingPathToLocation2D(WorldPosition, this.GetContext().GetLocalPlayer());
        return;
    }
    void DebugMoveToLocation(const FVector2D &inout WorldPosition)
    {
        int local_10 = 0;
        int local_20 = 0;
        FECSEntity local_4 = this.GetContext().GetLocalPlayerPawn();
        FFPTime local_16 = FFPTime(-1);
        FECSEntity local_4_2 = this.GetContext().GetLocalPlayerPawn();
        local_20.Location = WorldPosition;
        local_20.Rotation = local_10.GetRotation().Rotator();
        return;
    }
    void MarkPosition(const FVector2D &inout HoverPosition, const FVector2D &inout WorldPosition)
    {
        ::CommonPopup::HoverCustom(HoverPosition, ::MarkUtil_Internal::GetMinimapMarkIconsSetting().MinimapTempMarkDialog, EEUILayoutLayer(4), FEUIModelContainer(::FVM_MinimapTempMarkDialog::Create(this.GetContext().Manager, WorldPosition, HoverPosition)), ECommonHoverLayout(0));
        return;
    }
    void FastMarkPosition(const FVector2D &inout WorldPosition)
    {
        ::MarkUtil::RequestMarkPositionFromMinimap(this.GetContext().GetLocalPlayer(), WorldPosition, ::MarkUtil::GetMarkConfigSetting().FastMarkConfig, false);
        return;
    }
    void MarkAndGuideToPosition(const FVector2D &inout WorldPosition)
    {
        UMarkSettings local_2 = ::MarkUtil::GetMarkConfigSetting();
        ::MarkUtil::RequestMarkPositionFromMinimap(this.GetContext().GetLocalPlayer(), WorldPosition, local_2.MinimapTempMark, true);
        return;
    }
    void OnGuidingPathChange(const FC_GuidingMinimapPath &inout GuidingPath)
    {
        this.UpdateDisplayPaths();
        return;
    }
    void UpdateMinimapBorder()
    {
        TArray<FMinimapBorderInfo> local_4 = ::FBorderUtils::GetAllActiveBorderMinimapInfos();
        if (local_4.IsEmpty())
        {
            FMinimapBorderInfo local_24;
            this.SetDisplayBorder(local_24);
            return;
        }
        this.SetDisplayBorder(local_4[0]);
        if (local_4.Num() > 1)
        {
            XError(ELog(16), FString().Append("Only support one border display on minimap, but got ").Append(local_4.Num()).Append(" borders, check for DisplayOnMiniMap setting on borders"));
        }
        return;
    }
    void UpdateDisplayPaths()
    {
        this.GetModify_DisplayPaths().Empty(0);
        FECSEntity local_6 = this.GetContext().GetLocalPlayer();
        Get local_10;
        const FC_GuidingMinimapPath& local_12 = local_10.opCall();
        if (local_12)
        {
            if (!(local_12.Path.IsEmpty()))
            {
                this.GetModify_DisplayPaths().Add(local_12.Path);
            }
        }
        TArray<FMinimapPath> local_18 = ::FMS_EcosimChangeAreaDisplayManager::Get(this.GetContext().Manager).GetDisplayPaths();
        this.GetModify_DisplayPaths().Append(local_18);
        this.SetbDisplayingChangeArea(!(local_18.IsEmpty()));
        return;
    }
    bool GetbLocalPlayerPositionSet() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bLocalPlayerPositionSet;
    }
    void SetbLocalPlayerPositionSet(const bool __Value) property
    {
        if (!(this.m_bLocalPlayerPositionSet) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bLocalPlayerPositionSet = __Value;
        return;
    }
    const FVector2D GetLocalPlayerPosition() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FVector2D GetModify_LocalPlayerPosition() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetLocalPlayerPosition(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_LocalPlayerPosition = __Value;
        return;
    }
    TArray<FMinimapPath> GetDisplayPaths() const property
    {
        TArray<FMinimapPath> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FMinimapPath> GetModify_DisplayPaths() property
    {
        TArray<FMinimapPath> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDisplayPaths(const TArray<FMinimapPath> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplayPaths = __Value;
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
    const FMinimapBorderInfo GetDisplayBorder() const property
    {
        const FMinimapBorderInfo __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FMinimapBorderInfo GetModify_DisplayBorder() property
    {
        FMinimapBorderInfo __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDisplayBorder(const FMinimapBorderInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DisplayBorder = __Value;
        return;
    }
    bool GetbSetMinimapCenter() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bSetMinimapCenter;
    }
    void SetbSetMinimapCenter(const bool __Value) property
    {
        if (!(this.m_bSetMinimapCenter) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bSetMinimapCenter = __Value;
        return;
    }
    const FVector2D GetMinimapCenter() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FVector2D GetModify_MinimapCenter() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetMinimapCenter(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_MinimapCenter = __Value;
        return;
    }
    bool GetbDisplayingChangeArea() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bDisplayingChangeArea;
    }
    void SetbDisplayingChangeArea(const bool __Value) property
    {
        if (!(this.m_bDisplayingChangeArea) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bDisplayingChangeArea = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Minimap
{
    UPROPERTY()
    UMinimapConfig MinimapConfig;
    UPROPERTY()
    TEUIModelRef<FVM_Minimap> Self;

    __GeneratedProperties_FVM_Minimap()
    {
        return;
    }
}

namespace FVM_Minimap
{
FVM_Minimap& Create(const UObject ContextObject, const FVector2D &inout MinimapCenter)
{
    return FVM_Minimap::CreateByManager(EUIInternal::GetContextManager(ContextObject), MinimapCenter);
}
FVM_Minimap CreateByManager(const UEUIManagerSubsystem Manager, const FVector2D &inout MinimapCenter)
{
    FVM_Minimap __r;
    TEUIModelRef<FVM_Minimap> local_6 = TEUIModelRef<FVM_Minimap>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Minimap::ModelId, 0, MinimapCenter));
    return __r;
}
FVM_Minimap& Create(const UObject ContextObject)
{
    return FVM_Minimap::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Minimap CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Minimap __r;
    TEUIModelRef<FVM_Minimap> local_6 = TEUIModelRef<FVM_Minimap>(EUIInternal::MakeModelWithManager(Manager, FVM_Minimap::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bLocalPlayerPositionSet";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LocalPlayerPosition";
    local_14.TypeName = "FVector2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayPaths";
    local_14.TypeName = "TArray<FMinimapPath>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MinimapDisplayConfig";
    local_14.TypeName = "TDataObjectPtr<FMinimapDisplayConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayBorder";
    local_14.TypeName = "FMinimapBorderInfo";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MinimapConfig";
    local_14.TypeName = "UMinimapConfig";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Minimap>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Minimap;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnActiveBordersChanged";
    local_26.ComponentType = FCS_ActiveBorders;
    Result.MonitorFunctions.Add(local_26);
    Result.TickFunction.FunctionName = "__Tick";
    local_26.FunctionName = "__OnGuidingPathChange";
    local_26.ComponentType = FC_GuidingMinimapPath;
    Result.MonitorFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Minimap;
}
void __OnActiveBordersChanged(FVM_Minimap &inout Model, const FECSEntity &inout Entity, const FCS_ActiveBorders &inout Component)
{
    Get local_4;
    Model.OnActiveBordersChanged(local_4.opCall());
    return;
}
void __Tick(FVM_Minimap &inout Model)
{
    Model.Tick();
    return;
}
void __OnGuidingPathChange(FVM_Minimap &inout Model, const FECSEntity &inout Entity, const FC_GuidingMinimapPath &inout Component)
{
    Model.OnGuidingPathChange(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
bool __UIGetter_bLocalPlayerPositionSet(const FVM_Minimap &inout Model)
{
    return Model.GetbLocalPlayerPositionSet();
}
FVector2D __UIGetter_LocalPlayerPosition(const FVM_Minimap &inout Model)
{
    return Model.GetLocalPlayerPosition();
}
TArray<FMinimapPath> __UIGetter_DisplayPaths(const FVM_Minimap &inout Model)
{
    return Model.GetDisplayPaths();
}
TDataObjectPtr<FMinimapDisplayConfig> __UIGetter_MinimapDisplayConfig(const FVM_Minimap &inout Model)
{
    return Model.GetMinimapDisplayConfig();
}
FMinimapBorderInfo __UIGetter_DisplayBorder(const FVM_Minimap &inout Model)
{
    return Model.GetDisplayBorder();
}
UMinimapConfig __UIGetter_MinimapConfig(const FVM_Minimap &inout Model)
{
    return Model.GetMinimapConfig();
}
TEUIModelRef<FVM_Minimap> __UIGetter_Self(const FVM_Minimap &inout Model)
{
    return TEUIModelRef<FVM_Minimap>(Model);
}
int __IndexOf_bLocalPlayerPositionSet()
{
    return 0;
}
int __IndexOf_LocalPlayerPosition()
{
    return 1;
}
int __IndexOf_DisplayPaths()
{
    return 2;
}
int __IndexOf_MinimapDisplayConfig()
{
    return 3;
}
int __IndexOf_DisplayBorder()
{
    return 4;
}
int __IndexOf_bSetMinimapCenter()
{
    return 5;
}
int __IndexOf_MinimapCenter()
{
    return 6;
}
int __IndexOf_bDisplayingChangeArea()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_Minimap
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
