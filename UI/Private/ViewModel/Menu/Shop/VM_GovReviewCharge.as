
namespace FVM_GovReviewCharge
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnTabSelected = FEUIModelCallbackSignature();

}
struct FVM_GovReviewCharge : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FShopConfig> m_ShopConfig;
    UPROPERTY()
    TEUIModelRef<FVM_ShopPanel> m_ShopPanel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_MissionTabEntry>> m_TabEntries;
    UPROPERTY()
    int m_SelectedTabIndex;
    UPROPERTY()
    TEUIModelRef<FVM_MissionTabEntry> m_SelectedTab;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_SubmitRechargeTier>> m_RechargeTiers;

    FVM_GovReviewCharge()
    {
        this.m_SelectedTabIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_GovReviewCharge(const FVM_GovReviewCharge &inout Other)
    {
        this.m_SelectedTabIndex = 0;
        this.m_ShopConfig = Other.m_ShopConfig;
        this.m_ShopPanel = Other.m_ShopPanel;
        this.m_TabEntries = Other.m_TabEntries;
        this.m_SelectedTabIndex = int(Other.m_SelectedTabIndex);
        this.m_SelectedTab = Other.m_SelectedTab;
        this.m_RechargeTiers = Other.m_RechargeTiers;
        return;
    }
    FVM_GovReviewCharge& opAssign(const FVM_GovReviewCharge &inout Other)
    {
        this.m_ShopConfig = Other.m_ShopConfig;
        this.m_ShopPanel = Other.m_ShopPanel;
        this.m_TabEntries = Other.m_TabEntries;
        this.m_SelectedTabIndex = int(Other.m_SelectedTabIndex);
        this.m_SelectedTab = Other.m_SelectedTab;
        return Other.m_RechargeTiers;
    }
    void LoadConfig(const FConfigVM_GovReviewCharge &inout InConfig)
    {
        this.SetShopConfig(InConfig.ShopConfig);
        return;
    }
    void PostLoad()
    {
        if (!(this.GetShopConfig()))
        {
            GetDataObjectByGSDataId<FShopConfig> local_26;
            this.SetShopConfig(local_26.opImplConv());
        }
        if (this.GetShopConfig())
        {
            this.SetShopPanel(TEUIModelRef<FVM_ShopPanel>(::FVM_ShopPanel::Create(this.GetContext().Manager, this.GetShopConfig())));
        }
        this.InitTabEntries();
        this.InitRechargeTiers();
        return;
    }
    void OnTabSelected(const int Index)
    {
        if (Index < 0 || (Index >= this.GetTabEntries().Num()))
        {
            return;
        }
        if (Index == this.GetSelectedTabIndex())
        {
            return;
        }
        bool local_2 = false;
        int local_1 = this.GetSelectedTabIndex();
        local_2.SetbIsSelected();
        this.SetSelectedTabIndex(Index);
        bool local_2_2 = true;
        int local_1_2 = this.GetSelectedTabIndex();
        local_2_2.SetbIsSelected();
        this.SetSelectedTab(this.GetTabEntries()[this.GetSelectedTabIndex()]);
        return;
    }
    void InitTabEntries()
    {
        int local_8 = 0;
        int local_16 = 0;
        NSLOCTEXT("GovReviewCharge", "GoodsTab", "е•†е“Ѓ");
        local_8.SetbIsSelected(true);
        this.GetModify_TabEntries().Add(TEUIModelRef<FVM_MissionTabEntry>(local_8));
        NSLOCTEXT("GovReviewCharge", "RechargeTab", "е……еЂј");
        this.GetModify_TabEntries().Add(TEUIModelRef<FVM_MissionTabEntry>(local_16));
        this.SetSelectedTab(this.GetTabEntries()[this.GetSelectedTabIndex()]);
        return;
    }
    void InitRechargeTiers()
    {
        TArray<TDataObjectPtr<FSubmitRechargeTierConfig>> local_4;
        TDataObjectIterator<FSubmitRechargeTierConfig> local_20;
        for (; local_20; )
        {
            local_4.Add(local_20.GetDataPtr());
            local_20.opPreInc();
        }
        for (auto& local_62 : local_4)
        {
            this.GetModify_RechargeTiers().Add(TEUIModelRef<FVM_SubmitRechargeTier>(::FVM_SubmitRechargeTier::Create(this.GetContext().Manager, local_62)));
        }
        return;
    }
    const TDataObjectPtr<FShopConfig> GetShopConfig() const property
    {
        const TDataObjectPtr<FShopConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FShopConfig> GetModify_ShopConfig() property
    {
        TDataObjectPtr<FShopConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetShopConfig(const TDataObjectPtr<FShopConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ShopConfig = __Value;
        return;
    }
    TEUIModelRef<FVM_ShopPanel> GetShopPanel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ShopPanel;
    }
    void SetShopPanel(const TEUIModelRef<FVM_ShopPanel> &inout __Value) property
    {
        TEUIModelRef<FVM_ShopPanel> local_2;
        local_2 = this.m_ShopPanel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ShopPanel = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_MissionTabEntry>> GetTabEntries() const property
    {
        const TArray<TEUIModelRef<FVM_MissionTabEntry>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_MissionTabEntry>> GetModify_TabEntries() property
    {
        TArray<TEUIModelRef<FVM_MissionTabEntry>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTabEntries(const TArray<TEUIModelRef<FVM_MissionTabEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TabEntries = __Value;
        return;
    }
    int GetSelectedTabIndex() const property
    {
        this.TrackPropertyRead(3);
        return this.m_SelectedTabIndex;
    }
    void SetSelectedTabIndex(const int __Value) property
    {
        if (this.m_SelectedTabIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SelectedTabIndex = __Value;
        return;
    }
    TEUIModelRef<FVM_MissionTabEntry> GetSelectedTab() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectedTab;
    }
    void SetSelectedTab(const TEUIModelRef<FVM_MissionTabEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MissionTabEntry> local_2;
        local_2 = this.m_SelectedTab;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedTab = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_SubmitRechargeTier>> GetRechargeTiers() const property
    {
        const TArray<TEUIModelRef<FVM_SubmitRechargeTier>> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<TEUIModelRef<FVM_SubmitRechargeTier>> GetModify_RechargeTiers() property
    {
        TArray<TEUIModelRef<FVM_SubmitRechargeTier>> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetRechargeTiers(const TArray<TEUIModelRef<FVM_SubmitRechargeTier>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_RechargeTiers = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_Menu_Shop_VM_GovReviewCharge_78
{
    __Lambda_UI_Private_ViewModel_Menu_Shop_VM_GovReviewCharge_78()
    {
        return;
    }
    bool opCall(const TDataObjectPtr<FSubmitRechargeTierConfig> &inout A, const TDataObjectPtr<FSubmitRechargeTierConfig> &inout B)
    {
        return (A.opArrow().TierId < B.opArrow().TierId);
    }
}

struct __GeneratedProperties_FVM_GovReviewCharge
{
    UPROPERTY()
    TEUIModelRef<FVM_GovReviewCharge> Self;

    __GeneratedProperties_FVM_GovReviewCharge()
    {
        return;
    }
}

namespace FVM_GovReviewCharge
{
FVM_GovReviewCharge& Create(const UObject ContextObject)
{
    return FVM_GovReviewCharge::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_GovReviewCharge CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_GovReviewCharge __r;
    TEUIModelRef<FVM_GovReviewCharge> local_6 = TEUIModelRef<FVM_GovReviewCharge>(EUIInternal::MakeModelWithManager(Manager, FVM_GovReviewCharge::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ShopPanel";
    local_14.TypeName = "TEUIModelRef<FVM_ShopPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TabEntries";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_MissionTabEntry>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedTabIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedTab";
    local_14.TypeName = "TEUIModelRef<FVM_MissionTabEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RechargeTiers";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_SubmitRechargeTier>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_GovReviewCharge>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_GovReviewCharge;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_GovReviewCharge;
}
TEUIModelRef<FVM_ShopPanel> __UIGetter_ShopPanel(const FVM_GovReviewCharge &inout Model)
{
    return Model.GetShopPanel();
}
TArray<TEUIModelRef<FVM_MissionTabEntry>> __UIGetter_TabEntries(const FVM_GovReviewCharge &inout Model)
{
    return Model.GetTabEntries();
}
int __UIGetter_SelectedTabIndex(const FVM_GovReviewCharge &inout Model)
{
    return Model.GetSelectedTabIndex();
}
TEUIModelRef<FVM_MissionTabEntry> __UIGetter_SelectedTab(const FVM_GovReviewCharge &inout Model)
{
    return Model.GetSelectedTab();
}
TArray<TEUIModelRef<FVM_SubmitRechargeTier>> __UIGetter_RechargeTiers(const FVM_GovReviewCharge &inout Model)
{
    return Model.GetRechargeTiers();
}
TEUIModelRef<FVM_GovReviewCharge> __UIGetter_Self(const FVM_GovReviewCharge &inout Model)
{
    return TEUIModelRef<FVM_GovReviewCharge>(Model);
}
int __IndexOf_ShopConfig()
{
    return 0;
}
int __IndexOf_ShopPanel()
{
    return 1;
}
int __IndexOf_TabEntries()
{
    return 2;
}
int __IndexOf_SelectedTabIndex()
{
    return 3;
}
int __IndexOf_SelectedTab()
{
    return 4;
}
int __IndexOf_RechargeTiers()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_GovReviewCharge
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
