
namespace FVM_Teleporter
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature Teleport = FEUIModelCallbackSignature();
}
namespace FVM_TeleporterConfig
{
    const int ModelId = 0;

}
struct FVM_Teleporter : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    EPresentationSpotUsage m_SpotUsage;
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> m_TeleporterConfig;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_RewardList;
    UPROPERTY()
    bool m_bIsActive;

    FVM_Teleporter()
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        this.m_bIsActive = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_Teleporter' by default constructor.");
        return;
    }
    FVM_Teleporter(const FVM_Teleporter &inout Other)
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        this.m_bIsActive = false;
        this.m_Spot = Other.m_Spot;
        this.m_SpotUsage = Other.m_SpotUsage;
        this.m_TeleporterConfig = Other.m_TeleporterConfig;
        this.m_RewardList = Other.m_RewardList;
        this.m_bIsActive = Other.m_bIsActive;
        return;
    }
    FVM_Teleporter(const TEUIModelRef<FM_Spot> &inout InSpot, const EPresentationSpotUsage InSpotUsage)
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        this.m_bIsActive = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        this.SetSpotUsage(EPresentationSpotUsage(InSpotUsage));
        return;
    }
    FVM_Teleporter opAssign(const FVM_Teleporter &inout Other)
    {
        FVM_Teleporter __r;
        this.m_Spot = Other.m_Spot;
        this.m_SpotUsage = Other.m_SpotUsage;
        this.m_TeleporterConfig = Other.m_TeleporterConfig;
        this.m_RewardList = Other.m_RewardList;
        this.m_bIsActive = Other.m_bIsActive;
        return __r;
    }
    void PostConstruct()
    {
        TEUIModelRef<FM_PresentationData_Teleporter> local_12 = ::GetTeleporterData(this.GetSpot().opArrow(), this.GetSpotView());
        if (local_12)
        {
            this.SetTeleporterConfig(local_12.opArrow().GetTeleporterConfig());
        }
        if (!(!(this.GetTeleporterConfig())) && this.GetTeleporterConfig().opArrow().GetTargetDungeonInfoConfig())
        {
            TDataObjectPtr<FDropItemConfigBase> local_40 = GetTempRewardView();
            if (local_40)
            {
                this.SetRewardList(TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, ::FCommonRewardListBuilder::BuildFromDropConfig(local_40))));
            }
        }
        return;
    }
    void UpdateIsActive()
    {
        this.SetbIsActive((int(::FMS_TeleporterData::Get(this.GetManager()).GetTeleporterState(this.GetTeleporterConfig())) == 2));
        return;
    }
    bool IsActive() const
    {
        return this.GetbIsActive();
    }
    bool IsInactive() const
    {
        return !(this.IsActive());
    }
    FText GetDynamicInfo() const
    {
        if (GetTargetDungeonInfoConfig())
        {
            TDataObjectPtr<FDungeonConfig> local_26 = GetTargetDungeonInfoConfig();
            if (local_26)
            {
                return local_26.opArrow().DungeonDesc;
            }
        }
        return FText();
    }
    FSoftBrush GetDisplayIcon() const
    {
        int local_1 = int(this.GetSpotUsage());
        return ::PresentationSpotDisplayUtils::GetSpotIcon(this.GetSpot());
    }
    FSoftBrush GetPreviewHeaderImage() const
    {
        if (this.GetTeleporterConfig())
        {
            return this.GetTeleporterConfig().opArrow().PreviewHeaderImage;
        }
        return FSoftBrush();
    }
    void Teleport()
    {
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()) || !(::TeleporterUtils::IsTeleportAllowed(this.GetContext().GetLocalPlayerPawn())))
        {
            FCommonTipsParam local_14;
            ::CommonPopup::Tips(NSLOCTEXT("RegionMap", "TeleportToEntity_Failed", "еЅ“е‰ЌзЉ¶жЂЃж— жі•дј йЂЃ"), local_14);
            return;
        }
        ::FVM_TeleporterUtils::Get(this.GetManager()).RequestTeleportWithConfirm(this.GetTeleporterConfig());
        return;
    }
    FSpotViewAdapter GetSpotView() const
    {
        FSpotViewAdapter __r;
        int local_3 = int(this.GetSpotUsage());
        FSpotViewAdapter local_20 = FSpotViewAdapter(::PresentationSpotDisplayUtils::GetDesiredSpotView(this.GetSpot().opArrow().GetManager()));
        return __r;
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
    EPresentationSpotUsage GetSpotUsage() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SpotUsage;
    }
    void SetSpotUsage(const EPresentationSpotUsage __Value) property
    {
        if (int(this.m_SpotUsage) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpotUsage = __Value;
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
    TEUIModelRef<FVM_CommonRewardList> GetRewardList() const property
    {
        this.TrackPropertyRead(3);
        return this.m_RewardList;
    }
    void SetRewardList(const TEUIModelRef<FVM_CommonRewardList> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonRewardList> local_2;
        local_2 = this.m_RewardList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RewardList = __Value;
        return;
    }
    bool GetbIsActive() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bIsActive;
    }
    void SetbIsActive(const bool __Value) property
    {
        if (!(this.m_bIsActive) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bIsActive = __Value;
        return;
    }
}

struct FVM_TeleporterConfig : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> m_TeleporterConfig;

    FVM_TeleporterConfig()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TeleporterConfig' by default constructor.");
        return;
    }
    FVM_TeleporterConfig(const FVM_TeleporterConfig &inout Other)
    {
        this.m_TeleporterConfig = Other.m_TeleporterConfig;
        return;
    }
    FVM_TeleporterConfig(const TDataObjectPtr<FTeleporterConfig> &inout InTeleporterConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTeleporterConfig(InTeleporterConfig);
        return;
    }
    FVM_TeleporterConfig& opAssign(const FVM_TeleporterConfig &inout Other)
    {
        return Other.m_TeleporterConfig;
    }
    FSoftBrush GetDisplayIcon() const
    {
        if (this.GetTeleporterConfig().opArrow().GetPresentationConfig())
        {
            return this.GetTeleporterConfig().opArrow().GetPresentationConfig().opArrow().GetDefaultIcon();
        }
        return FSoftBrush();
    }
    const TDataObjectPtr<FTeleporterConfig> GetTeleporterConfig() const property
    {
        const TDataObjectPtr<FTeleporterConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FTeleporterConfig> GetModify_TeleporterConfig() property
    {
        TDataObjectPtr<FTeleporterConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTeleporterConfig(const TDataObjectPtr<FTeleporterConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeleporterConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Teleporter
{
    UPROPERTY()
    bool IsActive;
    UPROPERTY()
    bool IsInactive;
    UPROPERTY()
    FText DynamicInfo;
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    FSoftBrush PreviewHeaderImage;
    UPROPERTY()
    TEUIModelRef<FVM_Teleporter> Self;


}

struct __GeneratedProperties_FVM_TeleporterConfig
{
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    TEUIModelRef<FVM_TeleporterConfig> Self;

    __GeneratedProperties_FVM_TeleporterConfig()
    {
        return;
    }
}

namespace FVM_Teleporter
{
FVM_Teleporter& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage SpotUsage)
{
    return FVM_Teleporter::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_Teleporter CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage SpotUsage)
{
    FVM_Teleporter __r;
    TEUIModelRef<FVM_Teleporter> local_6 = TEUIModelRef<FVM_Teleporter>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Teleporter::ModelId, 0, Spot, SpotUsage));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TeleporterConfig";
    local_14.TypeName = "TDataObjectPtr<FTeleporterConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardList";
    local_14.TypeName = "TEUIModelRef<FVM_CommonRewardList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsActive";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsInactive";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DynamicInfo";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PreviewHeaderImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Teleporter>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Teleporter;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "UpdateIsActive";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Teleporter;
}
TDataObjectPtr<FTeleporterConfig> __UIGetter_TeleporterConfig(const FVM_Teleporter &inout Model)
{
    return Model.GetTeleporterConfig();
}
TEUIModelRef<FVM_CommonRewardList> __UIGetter_RewardList(const FVM_Teleporter &inout Model)
{
    return Model.GetRewardList();
}
bool __UIGetter_IsActive(const FVM_Teleporter &inout Model)
{
    return Model.IsActive();
}
bool __UIGetter_IsInactive(const FVM_Teleporter &inout Model)
{
    return Model.IsInactive();
}
FText __UIGetter_DynamicInfo(const FVM_Teleporter &inout Model)
{
    return Model.GetDynamicInfo();
}
FSoftBrush __UIGetter_DisplayIcon(const FVM_Teleporter &inout Model)
{
    return Model.GetDisplayIcon();
}
FSoftBrush __UIGetter_PreviewHeaderImage(const FVM_Teleporter &inout Model)
{
    return Model.GetPreviewHeaderImage();
}
TEUIModelRef<FVM_Teleporter> __UIGetter_Self(const FVM_Teleporter &inout Model)
{
    return TEUIModelRef<FVM_Teleporter>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_SpotUsage()
{
    return 1;
}
int __IndexOf_TeleporterConfig()
{
    return 2;
}
int __IndexOf_RewardList()
{
    return 3;
}
int __IndexOf_bIsActive()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_Teleporter
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_TeleporterConfig
{
FVM_TeleporterConfig& Create(const UObject ContextObject, const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig)
{
    return FVM_TeleporterConfig::CreateByManager(EUIInternal::GetContextManager(ContextObject), TeleporterConfig);
}
FVM_TeleporterConfig CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig)
{
    FVM_TeleporterConfig __r;
    TEUIModelRef<FVM_TeleporterConfig> local_6 = TEUIModelRef<FVM_TeleporterConfig>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TeleporterConfig::ModelId, 0, TeleporterConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TeleporterConfig";
    local_14.TypeName = "TDataObjectPtr<FTeleporterConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeleporterConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeleporterConfig;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeleporterConfig;
}
TDataObjectPtr<FTeleporterConfig> __UIGetter_TeleporterConfig(const FVM_TeleporterConfig &inout Model)
{
    return Model.GetTeleporterConfig();
}
FSoftBrush __UIGetter_DisplayIcon(const FVM_TeleporterConfig &inout Model)
{
    return Model.GetDisplayIcon();
}
TEUIModelRef<FVM_TeleporterConfig> __UIGetter_Self(const FVM_TeleporterConfig &inout Model)
{
    return TEUIModelRef<FVM_TeleporterConfig>(Model);
}
int __IndexOf_TeleporterConfig()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_TeleporterConfig
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
