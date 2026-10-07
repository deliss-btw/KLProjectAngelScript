
namespace FVM_ComposableItem
{
    const int ModelId = 0;

}
struct FVM_ComposableItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ItemDataModel;
    UPROPERTY()
    EItemDisplayScenario m_Scenario;
    UPROPERTY()
    EItemDisplayType m_CurDisplayType;
    UPROPERTY()
    UItemWidgetFeatureRegistrySettings m_Registry;
    UPROPERTY()
    FEUIDynamicWidgetData m_Feature_Count;
    UPROPERTY()
    FEUIDynamicWidgetData m_Feature_Level;
    UPROPERTY()
    FEUIDynamicWidgetData m_Feature_EquipMark;
    UPROPERTY()
    FEUIDynamicWidgetData m_Feature_RedDot;
    UPROPERTY()
    FEUIDynamicWidgetData m_Feature_New;
    UPROPERTY()
    FEUIDynamicWidgetData m_Feature_Mask;
    UPROPERTY()
    FEUIDynamicWidgetData m_Feature_Tag;
    UPROPERTY()
    FEUIDynamicWidgetData m_Feature_SpecialProps;
    UPROPERTY()
    FEUIDynamicWidgetData m_Feature_SpecialBg;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItemVM;
    UPROPERTY()
    int m_CurDisplayState;

    FVM_ComposableItem()
    {
        this.m_Registry = nullptr;
        this.m_Scenario = EItemDisplayScenario(0);
        this.m_CurDisplayType = EItemDisplayType(0);
        this.m_CurDisplayState = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ComposableItem' by default constructor.");
        return;
    }
    FVM_ComposableItem(const FVM_ComposableItem &inout Other)
    {
        this.m_Registry = nullptr;
        this.m_Scenario = EItemDisplayScenario(0);
        this.m_CurDisplayType = EItemDisplayType(0);
        this.m_CurDisplayState = 0;
        this.m_ItemDataModel = Other.m_ItemDataModel;
        this.m_Scenario = Other.m_Scenario;
        this.m_CurDisplayType = Other.m_CurDisplayType;
        this.m_Registry = Other.m_Registry;
        this.m_Feature_Count = Other.m_Feature_Count;
        this.m_Feature_Level = Other.m_Feature_Level;
        this.m_Feature_EquipMark = Other.m_Feature_EquipMark;
        this.m_Feature_RedDot = Other.m_Feature_RedDot;
        this.m_Feature_New = Other.m_Feature_New;
        this.m_Feature_Mask = Other.m_Feature_Mask;
        this.m_Feature_Tag = Other.m_Feature_Tag;
        this.m_Feature_SpecialProps = Other.m_Feature_SpecialProps;
        this.m_Feature_SpecialBg = Other.m_Feature_SpecialBg;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_CurDisplayState = int(Other.m_CurDisplayState);
        return;
    }
    FVM_ComposableItem(const TEUIModelRef<FM_ItemData> &inout InItemDataModel, const EItemDisplayScenario InScenario)
    {
        this.m_Registry = nullptr;
        this.m_Scenario = EItemDisplayScenario(0);
        this.m_CurDisplayType = EItemDisplayType(0);
        this.m_CurDisplayState = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemDataModel(InItemDataModel);
        this.SetScenario(EItemDisplayScenario(InScenario));
        return;
    }
    FVM_ComposableItem opAssign(const FVM_ComposableItem &inout Other)
    {
        FVM_ComposableItem __r;
        this.m_ItemDataModel = Other.m_ItemDataModel;
        this.m_Scenario = Other.m_Scenario;
        this.m_CurDisplayType = Other.m_CurDisplayType;
        this.m_Registry = Other.m_Registry;
        this.m_Feature_Count = Other.m_Feature_Count;
        this.m_Feature_Level = Other.m_Feature_Level;
        this.m_Feature_EquipMark = Other.m_Feature_EquipMark;
        this.m_Feature_RedDot = Other.m_Feature_RedDot;
        this.m_Feature_New = Other.m_Feature_New;
        this.m_Feature_Mask = Other.m_Feature_Mask;
        this.m_Feature_Tag = Other.m_Feature_Tag;
        this.m_Feature_SpecialProps = Other.m_Feature_SpecialProps;
        this.m_Feature_SpecialBg = Other.m_Feature_SpecialBg;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_CurDisplayState = int(Other.m_CurDisplayState);
        return __r;
    }
    void PostConstruct()
    {
        TEUIModelRef<FM_ItemData> local_2 = this.GetItemDataModel();
        if (!(local_2.IsValid()))
        {
            return;
        }
        this.SetRegistry(::ItemWidgetFeatureRegistrySettings::Get());
        if ((int(this.GetScenario())) == 1)
        {
            TEUIModelRef<FVM_CommonItem> local_12 = TEUIModelRef<FVM_CommonItem>(::FVM_CommonItem::Create(this.GetContext().Manager, local_2));
            this.SetCommonItemVM(local_12);
            TEUIModelRef<FM_DisplayItemData> local_14 = ::DisplayItemAdapter_Item::MakeDisplayData(this.GetContext().Manager, this.GetItemDataModel());
            TEUIModelRef<FVM_CommonItem> local_12_2 = this.GetCommonItemVM();
            local_14.SetupDisplayData();
        }
        else
        {
            TEUIModelRef<FVM_CommonItem> local_12_3 = TEUIModelRef<FVM_CommonItem>(::FVM_CommonItem::Create(this.GetContext().Manager, this.GetItemDataModel()));
            this.SetCommonItemVM(local_12_3);
        }
        this.RebuildFeatures();
        return;
    }
    void RebuildFeatures()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    FEUIDynamicWidgetData TryBuildFeatureData(const EItemDisplayFeature Feature, const TArray<EItemDisplayFeature> &inout ActiveFeatures)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        FEUIDynamicWidgetData __r; return __r;
    }
    FEUIModelContainer CreateFeatureModel(const EItemDisplayFeature Feature)
    {
        FEUIModelContainer local_18;
        switch (int(Feature))
        {
        case 1:
        {
            TEUIModelRef<FVM_CommonItem> local_4 = this.GetCommonItemVM();
            return local_18;
        }
        case 2:
        {
            TEUIModelRef<FVM_CommonItem> local_4_2 = this.GetCommonItemVM();
            return local_18;
        }
        case 3:
        {
            TEUIModelRef<FVM_CommonItem> local_4_3 = this.GetCommonItemVM();
            return local_18;
        }
        case 4:
        {
            TEUIModelRef<FVM_CommonItem> local_4_4 = this.GetCommonItemVM();
            return local_18;
        }
        case 6:
        {
            TEUIModelRef<FVM_CommonItem> local_4_5 = this.GetCommonItemVM();
            return local_18;
        }
        case 7:
        {
            TEUIModelRef<FVM_CommonItem> local_4_6 = this.GetCommonItemVM();
            return local_18;
        }
        case 9:
        {
            TEUIModelRef<FVM_CommonItem> local_4_7 = this.GetCommonItemVM();
            return local_18;
        }
        case 10:
        {
            TEUIModelRef<FVM_CommonItem> local_4_8 = this.GetCommonItemVM();
            return local_18;
        }
        }
        return local_18;
    }
    void RebuildFeaturesWithDisplayType(const EItemDisplayType DisplayType)
    {
        this.SetCurDisplayType(EItemDisplayType(DisplayType));
        this.SetFeature_Count(this.RefreshWidgetClass(this.GetFeature_Count(), EItemDisplayFeature(1)));
        this.SetFeature_Level(this.RefreshWidgetClass(this.GetFeature_Level(), EItemDisplayFeature(2)));
        this.SetFeature_EquipMark(this.RefreshWidgetClass(this.GetFeature_EquipMark(), EItemDisplayFeature(3)));
        this.SetFeature_RedDot(this.RefreshWidgetClass(this.GetFeature_RedDot(), EItemDisplayFeature(4)));
        this.SetFeature_New(this.RefreshWidgetClass(this.GetFeature_New(), EItemDisplayFeature(5)));
        this.SetFeature_Mask(this.RefreshWidgetClass(this.GetFeature_Mask(), EItemDisplayFeature(6)));
        this.SetFeature_Tag(this.RefreshWidgetClass(this.GetFeature_Tag(), EItemDisplayFeature(7)));
        this.SetFeature_SpecialProps(this.RefreshWidgetClass(this.GetFeature_SpecialProps(), EItemDisplayFeature(9)));
        this.SetFeature_SpecialBg(this.RefreshWidgetClass(this.GetFeature_SpecialBg(), EItemDisplayFeature(10)));
        return;
    }
    FEUIDynamicWidgetData RefreshWidgetClass(const FEUIDynamicWidgetData &inout FeatureData, const EItemDisplayFeature Feature)
    {
        if (FeatureData.IsEmpty())
        {
            return FeatureData;
        }
        int local_15 = int(this.GetCurDisplayType());
        TSoftClassPtr<UEUIUserWidget> local_26 = this.GetRegistry().GetWidgetClassForFeature();
        if ((local_26 == FeatureData.WidgetClass))
        {
            return FeatureData;
        }
        FEUIDynamicWidgetData local_50 = FeatureData;
        local_50.WidgetClass = local_26;
        return local_50;
    }
    TEUIModelRef<FM_ItemData> GetItemDataModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ItemDataModel;
    }
    void SetItemDataModel(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_ItemDataModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemDataModel = __Value;
        return;
    }
    EItemDisplayScenario GetScenario() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Scenario;
    }
    void SetScenario(const EItemDisplayScenario __Value) property
    {
        if (int(this.m_Scenario) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Scenario = __Value;
        return;
    }
    EItemDisplayType GetCurDisplayType() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CurDisplayType;
    }
    void SetCurDisplayType(const EItemDisplayType __Value) property
    {
        if (int(this.m_CurDisplayType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurDisplayType = __Value;
        return;
    }
    UItemWidgetFeatureRegistrySettings GetRegistry() const property
    {
        this.TrackPropertyRead(3);
        return this.m_Registry;
    }
    void SetRegistry(const UItemWidgetFeatureRegistrySettings __Value) property
    {
        if (this.m_Registry == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        return;
    }
    const FEUIDynamicWidgetData GetFeature_Count() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_Count() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetFeature_Count(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Feature_Count = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_Level() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_Level() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetFeature_Level(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Feature_Level = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_EquipMark() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_EquipMark() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetFeature_EquipMark(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_Feature_EquipMark = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_RedDot() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_RedDot() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetFeature_RedDot(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_Feature_RedDot = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_New() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_New() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetFeature_New(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_Feature_New = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_Mask() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_Mask() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetFeature_Mask(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_Feature_Mask = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_Tag() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_Tag() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetFeature_Tag(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_Feature_Tag = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_SpecialProps() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_SpecialProps() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetFeature_SpecialProps(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_Feature_SpecialProps = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_SpecialBg() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_SpecialBg() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetFeature_SpecialBg(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_Feature_SpecialBg = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonItem> GetCommonItemVM() const property
    {
        this.TrackPropertyRead(13);
        return this.m_CommonItemVM;
    }
    void SetCommonItemVM(const TEUIModelRef<FVM_CommonItem> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonItem> local_2;
        local_2 = this.m_CommonItemVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_CommonItemVM = __Value;
        return;
    }
    int GetCurDisplayState() const property
    {
        this.TrackPropertyRead(14);
        return this.m_CurDisplayState;
    }
    void SetCurDisplayState(const int __Value) property
    {
        if (this.m_CurDisplayState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_CurDisplayState = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ComposableItem
{
    UPROPERTY()
    TEUIModelRef<FVM_ComposableItem> Self;

    __GeneratedProperties_FVM_ComposableItem()
    {
        return;
    }
}

namespace FVM_ComposableItem
{
FVM_ComposableItem& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout ItemDataModel, const EItemDisplayScenario Scenario)
{
    return FVM_ComposableItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemDataModel);
}
FVM_ComposableItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout ItemDataModel, const EItemDisplayScenario Scenario)
{
    FVM_ComposableItem __r;
    TEUIModelRef<FVM_ComposableItem> local_6 = TEUIModelRef<FVM_ComposableItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ComposableItem::ModelId, 0, ItemDataModel, Scenario));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Feature_Count";
    local_14.TypeName = "FEUIDynamicWidgetData";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Feature_Level";
    local_14.TypeName = "FEUIDynamicWidgetData";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Feature_EquipMark";
    local_14.TypeName = "FEUIDynamicWidgetData";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Feature_RedDot";
    local_14.TypeName = "FEUIDynamicWidgetData";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Feature_New";
    local_14.TypeName = "FEUIDynamicWidgetData";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Feature_Mask";
    local_14.TypeName = "FEUIDynamicWidgetData";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Feature_Tag";
    local_14.TypeName = "FEUIDynamicWidgetData";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Feature_SpecialProps";
    local_14.TypeName = "FEUIDynamicWidgetData";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Feature_SpecialBg";
    local_14.TypeName = "FEUIDynamicWidgetData";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommonItemVM";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurDisplayState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ComposableItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ComposableItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ComposableItem;
}
FEUIDynamicWidgetData __UIGetter_Feature_Count(const FVM_ComposableItem &inout Model)
{
    return Model.GetFeature_Count();
}
FEUIDynamicWidgetData __UIGetter_Feature_Level(const FVM_ComposableItem &inout Model)
{
    return Model.GetFeature_Level();
}
FEUIDynamicWidgetData __UIGetter_Feature_EquipMark(const FVM_ComposableItem &inout Model)
{
    return Model.GetFeature_EquipMark();
}
FEUIDynamicWidgetData __UIGetter_Feature_RedDot(const FVM_ComposableItem &inout Model)
{
    return Model.GetFeature_RedDot();
}
FEUIDynamicWidgetData __UIGetter_Feature_New(const FVM_ComposableItem &inout Model)
{
    return Model.GetFeature_New();
}
FEUIDynamicWidgetData __UIGetter_Feature_Mask(const FVM_ComposableItem &inout Model)
{
    return Model.GetFeature_Mask();
}
FEUIDynamicWidgetData __UIGetter_Feature_Tag(const FVM_ComposableItem &inout Model)
{
    return Model.GetFeature_Tag();
}
FEUIDynamicWidgetData __UIGetter_Feature_SpecialProps(const FVM_ComposableItem &inout Model)
{
    return Model.GetFeature_SpecialProps();
}
FEUIDynamicWidgetData __UIGetter_Feature_SpecialBg(const FVM_ComposableItem &inout Model)
{
    return Model.GetFeature_SpecialBg();
}
TEUIModelRef<FVM_CommonItem> __UIGetter_CommonItemVM(const FVM_ComposableItem &inout Model)
{
    return Model.GetCommonItemVM();
}
int __UIGetter_CurDisplayState(const FVM_ComposableItem &inout Model)
{
    return Model.GetCurDisplayState();
}
TEUIModelRef<FVM_ComposableItem> __UIGetter_Self(const FVM_ComposableItem &inout Model)
{
    return TEUIModelRef<FVM_ComposableItem>(Model);
}
int __IndexOf_ItemDataModel()
{
    return 0;
}
int __IndexOf_Scenario()
{
    return 1;
}
int __IndexOf_CurDisplayType()
{
    return 2;
}
int __IndexOf_Registry()
{
    return 3;
}
int __IndexOf_Feature_Count()
{
    return 4;
}
int __IndexOf_Feature_Level()
{
    return 5;
}
int __IndexOf_Feature_EquipMark()
{
    return 6;
}
int __IndexOf_Feature_RedDot()
{
    return 7;
}
int __IndexOf_Feature_New()
{
    return 8;
}
int __IndexOf_Feature_Mask()
{
    return 9;
}
int __IndexOf_Feature_Tag()
{
    return 10;
}
int __IndexOf_Feature_SpecialProps()
{
    return 11;
}
int __IndexOf_Feature_SpecialBg()
{
    return 12;
}
int __IndexOf_CommonItemVM()
{
    return 13;
}
int __IndexOf_CurDisplayState()
{
    return 14;
}
}
namespace __GeneratedProperties_FVM_ComposableItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
