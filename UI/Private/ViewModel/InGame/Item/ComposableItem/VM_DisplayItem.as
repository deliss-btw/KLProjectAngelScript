
namespace FVM_DisplayItem
{
    const int ModelId = 0;

}
struct FVM_DisplayItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_DisplayItemData> m_DisplayData;
    UPROPERTY()
    EItemDisplayScenario m_Scenario;
    UPROPERTY()
    EItemDisplayType m_CurDisplayType;
    UPROPERTY()
    UItemWidgetFeatureRegistrySettings m_Registry;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItemVM;
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
    FEUIDynamicWidgetData m_Feature_Grade;
    UPROPERTY()
    FEUIDynamicWidgetData m_Feature_SpecialProps;
    UPROPERTY()
    int m_CurDisplayState;
    UPROPERTY()
    FText m_DisplayName;
    UPROPERTY()
    FText m_DisplayDesc;
    UPROPERTY()
    FSoftBrush m_ItemImage;
    UPROPERTY()
    FSoftBrush m_ItemImageHigh;
    UPROPERTY()
    FSoftBrush m_ItemImageTemp;
    UPROPERTY()
    FSoftBrush m_ItemImageBG;
    UPROPERTY()
    FLinearColor m_RarityColor;

    FVM_DisplayItem()
    {
        this.m_Registry = nullptr;
        this.m_Scenario = EItemDisplayScenario(0);
        this.m_CurDisplayType = EItemDisplayType(1);
        this.m_CurDisplayState = 0;
        this.m_RarityColor = FLinearColor::White;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_DisplayItem' by default constructor.");
        return;
    }
    FVM_DisplayItem(const FVM_DisplayItem &inout Other)
    {
        this.m_Registry = nullptr;
        this.m_Scenario = EItemDisplayScenario(0);
        this.m_CurDisplayType = EItemDisplayType(1);
        this.m_CurDisplayState = 0;
        this.m_RarityColor = FLinearColor::White;
        this.m_DisplayData = Other.m_DisplayData;
        this.m_Scenario = Other.m_Scenario;
        this.m_CurDisplayType = Other.m_CurDisplayType;
        this.m_Registry = Other.m_Registry;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_Feature_Count = Other.m_Feature_Count;
        this.m_Feature_Level = Other.m_Feature_Level;
        this.m_Feature_EquipMark = Other.m_Feature_EquipMark;
        this.m_Feature_RedDot = Other.m_Feature_RedDot;
        this.m_Feature_New = Other.m_Feature_New;
        this.m_Feature_Mask = Other.m_Feature_Mask;
        this.m_Feature_Tag = Other.m_Feature_Tag;
        this.m_Feature_Grade = Other.m_Feature_Grade;
        this.m_Feature_SpecialProps = Other.m_Feature_SpecialProps;
        this.m_CurDisplayState = int(Other.m_CurDisplayState);
        this.m_DisplayName = Other.m_DisplayName;
        this.m_DisplayDesc = Other.m_DisplayDesc;
        this.m_ItemImage = Other.m_ItemImage;
        this.m_ItemImageHigh = Other.m_ItemImageHigh;
        this.m_ItemImageTemp = Other.m_ItemImageTemp;
        this.m_ItemImageBG = Other.m_ItemImageBG;
        this.m_RarityColor = Other.m_RarityColor;
        return;
    }
    FVM_DisplayItem(const TEUIModelRef<FM_DisplayItemData> &inout InDisplayData, const EItemDisplayScenario InScenario)
    {
        this.m_Registry = nullptr;
        this.m_Scenario = EItemDisplayScenario(0);
        this.m_CurDisplayType = EItemDisplayType(1);
        this.m_CurDisplayState = 0;
        this.m_RarityColor = FLinearColor::White;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDisplayData(InDisplayData);
        this.SetScenario(EItemDisplayScenario(InScenario));
        return;
    }
    FVM_DisplayItem& opAssign(const FVM_DisplayItem &inout Other)
    {
        this.m_DisplayData = Other.m_DisplayData;
        this.m_Scenario = Other.m_Scenario;
        this.m_CurDisplayType = Other.m_CurDisplayType;
        this.m_Registry = Other.m_Registry;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_Feature_Count = Other.m_Feature_Count;
        this.m_Feature_Level = Other.m_Feature_Level;
        this.m_Feature_EquipMark = Other.m_Feature_EquipMark;
        this.m_Feature_RedDot = Other.m_Feature_RedDot;
        this.m_Feature_New = Other.m_Feature_New;
        this.m_Feature_Mask = Other.m_Feature_Mask;
        this.m_Feature_Tag = Other.m_Feature_Tag;
        this.m_Feature_Grade = Other.m_Feature_Grade;
        this.m_Feature_SpecialProps = Other.m_Feature_SpecialProps;
        this.m_CurDisplayState = int(Other.m_CurDisplayState);
        this.m_DisplayName = Other.m_DisplayName;
        this.m_DisplayDesc = Other.m_DisplayDesc;
        this.m_ItemImage = Other.m_ItemImage;
        this.m_ItemImageHigh = Other.m_ItemImageHigh;
        this.m_ItemImageTemp = Other.m_ItemImageTemp;
        this.m_ItemImageBG = Other.m_ItemImageBG;
        return Other.m_RarityColor;
    }
    void PostConstruct()
    {
        this.SetRegistry(::ItemWidgetFeatureRegistrySettings::Get());
        TEUIModelRef<FM_ItemData> local_4;
        this.SetCommonItemVM(TEUIModelRef<FVM_CommonItem>(::FVM_CommonItem::Create(this.GetContext().Manager, local_4)));
        this.RefreshDisplayData();
        this.RebuildFeatures();
        return;
    }
    void RefreshDisplayData()
    {
        if (!(this.GetDisplayData().IsValid()))
        {
            this.SetDisplayName(FText());
            this.SetDisplayDesc(FText());
            this.SetItemImage(FSoftBrush());
            this.SetItemImageHigh(FSoftBrush());
            this.SetItemImageTemp(FSoftBrush());
            this.SetItemImageBG(FSoftBrush());
            this.SetCurDisplayState(0);
            this.SetRarityColor(FLinearColor::White);
            if (this.GetCommonItemVM().IsValid())
            {
                TEUIModelRef<FVM_CommonItem> local_56 = this.GetCommonItemVM();
                this.GetDisplayData().SetupDisplayData();
            }
            return;
        }
        TEUIModelRef<FM_DisplayItemData> local_2_2 = this.GetDisplayData();
        this.SetDisplayName(GetDisplayName());
        TEUIModelRef<FM_DisplayItemData> local_2_3 = this.GetDisplayData();
        this.SetDisplayDesc(GetDisplayDesc());
        TEUIModelRef<FM_DisplayItemData> local_2_4 = this.GetDisplayData();
        this.SetItemImage(GetItemImage());
        TEUIModelRef<FM_DisplayItemData> local_2_5 = this.GetDisplayData();
        this.SetItemImageHigh(GetItemImageHigh());
        TEUIModelRef<FM_DisplayItemData> local_2_6 = this.GetDisplayData();
        this.SetItemImageTemp(GetItemImageTemp());
        TEUIModelRef<FM_DisplayItemData> local_2_7 = this.GetDisplayData();
        this.SetItemImageBG(GetItemImageBG());
        TEUIModelRef<FM_DisplayItemData> local_2_8 = this.GetDisplayData();
        this.SetCurDisplayState(GetCurDisplayState());
        TEUIModelRef<FM_DisplayItemData> local_2_9 = this.GetDisplayData();
        this.SetRarityColor(GetRarityColor());
        if (this.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FM_DisplayItemData> local_2_10 = this.GetDisplayData();
            TEUIModelRef<FVM_CommonItem> local_56_2 = this.GetCommonItemVM();
            local_2_10.SetupDisplayData();
        }
        return;
    }
    void ApplyDisplayState(const int DisplayState)
    {
        this.SetCurDisplayState(DisplayState);
        if (this.GetDisplayData().IsValid())
        {
            TEUIModelRef<FM_DisplayItemData> local_2 = this.GetDisplayData();
            DisplayState.SetCurDisplayState();
        }
        if (this.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_6 = this.GetCommonItemVM();
            DisplayState.ApplyDisplayState();
        }
        return;
    }
    void SetDisplayItemImage(const FSoftBrush &inout InItemImage)
    {
        this.SetItemImage(InItemImage);
        if (this.GetDisplayData().IsValid())
        {
            TEUIModelRef<FM_DisplayItemData> local_2 = this.GetDisplayData();
            InItemImage.SetItemImage();
        }
        if (this.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_6 = this.GetCommonItemVM();
            InItemImage.SetSpecialDisplayItemImage();
        }
        return;
    }
    void SetTempDisplayItemImage(const FSoftBrush &inout InItemImage)
    {
        this.SetItemImageTemp(InItemImage);
        if (this.GetDisplayData().IsValid())
        {
            TEUIModelRef<FM_DisplayItemData> local_2 = this.GetDisplayData();
            InItemImage.SetItemImageTemp();
        }
        if (this.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_6 = this.GetCommonItemVM();
            InItemImage.SetTempDisplayItemImage();
        }
        return;
    }
    void RebuildFeatures()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    FEUIDynamicWidgetData TryBuildFeatureData(const EItemDisplayFeature Feature, const TArray<EItemDisplayFeature> &inout ActiveFeatures)
    {
        if (!(ActiveFeatures.Contains(Feature)))
        {
            return FEUIDynamicWidgetData();
        }
        FEUIDynamicWidgetData local_50;
        local_50.ModelContainer = this.CreateFeatureModel(EItemDisplayFeature(Feature));
        if ((int(this.GetCurDisplayType())) != 0)
        {
            EItemDisplayType local_65 = this.GetCurDisplayType();
            TSoftClassPtr<UEUIUserWidget> local_90 = this.GetRegistry().GetWidgetClassForFeature();
            if (!(local_90.IsNull()))
            {
                local_50.WidgetClass = local_90;
            }
        }
        return local_50;
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
        case 8:
        {
            TEUIModelRef<FVM_CommonItem> local_4_7 = this.GetCommonItemVM();
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
        this.SetFeature_Grade(this.RefreshWidgetClass(this.GetFeature_Grade(), EItemDisplayFeature(8)));
        this.SetFeature_SpecialProps(this.RefreshWidgetClass(this.GetFeature_SpecialProps(), EItemDisplayFeature(9)));
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
    TEUIModelRef<FM_DisplayItemData> GetDisplayData() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DisplayData;
    }
    void SetDisplayData(const TEUIModelRef<FM_DisplayItemData> &inout __Value) property
    {
        TEUIModelRef<FM_DisplayItemData> local_2;
        local_2 = this.m_DisplayData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DisplayData = __Value;
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
    TEUIModelRef<FVM_CommonItem> GetCommonItemVM() const property
    {
        this.TrackPropertyRead(4);
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
        this.MarkPropertyDirty(4);
        this.m_CommonItemVM = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_Count() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_Count() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetFeature_Count(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Feature_Count = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_Level() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_Level() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetFeature_Level(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_Feature_Level = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_EquipMark() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_EquipMark() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetFeature_EquipMark(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_Feature_EquipMark = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_RedDot() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_RedDot() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetFeature_RedDot(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_Feature_RedDot = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_New() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_New() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetFeature_New(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_Feature_New = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_Mask() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_Mask() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetFeature_Mask(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_Feature_Mask = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_Tag() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_Tag() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetFeature_Tag(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_Feature_Tag = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_Grade() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_Grade() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetFeature_Grade(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_Feature_Grade = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetFeature_SpecialProps() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_Feature_SpecialProps() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetFeature_SpecialProps(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_Feature_SpecialProps = __Value;
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
    FText GetDisplayName() const property
    {
        FText __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    FText GetModify_DisplayName() property
    {
        FText __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetDisplayName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_DisplayName = __Value;
        return;
    }
    const FText GetDisplayDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    FText GetModify_DisplayDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetDisplayDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_DisplayDesc = __Value;
        return;
    }
    const FSoftBrush GetItemImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FSoftBrush GetModify_ItemImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetItemImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_ItemImage = __Value;
        return;
    }
    const FSoftBrush GetItemImageHigh() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    FSoftBrush GetModify_ItemImageHigh() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetItemImageHigh(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_ItemImageHigh = __Value;
        return;
    }
    const FSoftBrush GetItemImageTemp() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    FSoftBrush GetModify_ItemImageTemp() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetItemImageTemp(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_ItemImageTemp = __Value;
        return;
    }
    const FSoftBrush GetItemImageBG() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(20);
        return __r;
    }
    FSoftBrush GetModify_ItemImageBG() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(20);
        return __r;
    }
    void SetItemImageBG(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_ItemImageBG = __Value;
        return;
    }
    FLinearColor GetRarityColor() const property
    {
        FLinearColor __r;
        this.TrackPropertyRead(21);
        return __r;
    }
    FLinearColor GetModify_RarityColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(21);
        return __r;
    }
    void SetRarityColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_RarityColor = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_DisplayItem
{
    UPROPERTY()
    TEUIModelRef<FVM_DisplayItem> Self;

    __GeneratedProperties_FVM_DisplayItem()
    {
        return;
    }
}

namespace FVM_DisplayItem
{
FVM_DisplayItem& Create(const UObject ContextObject, const TEUIModelRef<FM_DisplayItemData> &inout DisplayData, const EItemDisplayScenario Scenario)
{
    return FVM_DisplayItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), DisplayData);
}
FVM_DisplayItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_DisplayItemData> &inout DisplayData, const EItemDisplayScenario Scenario)
{
    FVM_DisplayItem __r;
    TEUIModelRef<FVM_DisplayItem> local_6 = TEUIModelRef<FVM_DisplayItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_DisplayItem::ModelId, 0, DisplayData, Scenario));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_DisplayItem;
}
void __RefreshDisplayData(FVM_DisplayItem &inout Model)
{
    Model.RefreshDisplayData();
    return;
}
TEUIModelRef<FVM_CommonItem> __UIGetter_CommonItemVM(const FVM_DisplayItem &inout Model)
{
    return Model.GetCommonItemVM();
}
FEUIDynamicWidgetData __UIGetter_Feature_Count(const FVM_DisplayItem &inout Model)
{
    return Model.GetFeature_Count();
}
FEUIDynamicWidgetData __UIGetter_Feature_Level(const FVM_DisplayItem &inout Model)
{
    return Model.GetFeature_Level();
}
FEUIDynamicWidgetData __UIGetter_Feature_EquipMark(const FVM_DisplayItem &inout Model)
{
    return Model.GetFeature_EquipMark();
}
FEUIDynamicWidgetData __UIGetter_Feature_RedDot(const FVM_DisplayItem &inout Model)
{
    return Model.GetFeature_RedDot();
}
FEUIDynamicWidgetData __UIGetter_Feature_New(const FVM_DisplayItem &inout Model)
{
    return Model.GetFeature_New();
}
FEUIDynamicWidgetData __UIGetter_Feature_Mask(const FVM_DisplayItem &inout Model)
{
    return Model.GetFeature_Mask();
}
FEUIDynamicWidgetData __UIGetter_Feature_Tag(const FVM_DisplayItem &inout Model)
{
    return Model.GetFeature_Tag();
}
FEUIDynamicWidgetData __UIGetter_Feature_Grade(const FVM_DisplayItem &inout Model)
{
    return Model.GetFeature_Grade();
}
FEUIDynamicWidgetData __UIGetter_Feature_SpecialProps(const FVM_DisplayItem &inout Model)
{
    return Model.GetFeature_SpecialProps();
}
int __UIGetter_CurDisplayState(const FVM_DisplayItem &inout Model)
{
    return Model.GetCurDisplayState();
}
FText __UIGetter_DisplayName(const FVM_DisplayItem &inout Model)
{
    return Model.GetDisplayName();
}
FText __UIGetter_DisplayDesc(const FVM_DisplayItem &inout Model)
{
    return Model.GetDisplayDesc();
}
FSoftBrush __UIGetter_ItemImage(const FVM_DisplayItem &inout Model)
{
    return Model.GetItemImage();
}
FSoftBrush __UIGetter_ItemImageHigh(const FVM_DisplayItem &inout Model)
{
    return Model.GetItemImageHigh();
}
FSoftBrush __UIGetter_ItemImageTemp(const FVM_DisplayItem &inout Model)
{
    return Model.GetItemImageTemp();
}
FSoftBrush __UIGetter_ItemImageBG(const FVM_DisplayItem &inout Model)
{
    return Model.GetItemImageBG();
}
FLinearColor __UIGetter_RarityColor(const FVM_DisplayItem &inout Model)
{
    return Model.GetRarityColor();
}
TEUIModelRef<FVM_DisplayItem> __UIGetter_Self(const FVM_DisplayItem &inout Model)
{
    return TEUIModelRef<FVM_DisplayItem>(Model);
}
int __IndexOf_DisplayData()
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
int __IndexOf_CommonItemVM()
{
    return 4;
}
int __IndexOf_Feature_Count()
{
    return 5;
}
int __IndexOf_Feature_Level()
{
    return 6;
}
int __IndexOf_Feature_EquipMark()
{
    return 7;
}
int __IndexOf_Feature_RedDot()
{
    return 8;
}
int __IndexOf_Feature_New()
{
    return 9;
}
int __IndexOf_Feature_Mask()
{
    return 10;
}
int __IndexOf_Feature_Tag()
{
    return 11;
}
int __IndexOf_Feature_Grade()
{
    return 12;
}
int __IndexOf_Feature_SpecialProps()
{
    return 13;
}
int __IndexOf_CurDisplayState()
{
    return 14;
}
int __IndexOf_DisplayName()
{
    return 15;
}
int __IndexOf_DisplayDesc()
{
    return 16;
}
int __IndexOf_ItemImage()
{
    return 17;
}
int __IndexOf_ItemImageHigh()
{
    return 18;
}
int __IndexOf_ItemImageTemp()
{
    return 19;
}
int __IndexOf_ItemImageBG()
{
    return 20;
}
int __IndexOf_RarityColor()
{
    return 21;
}
}
namespace __GeneratedProperties_FVM_DisplayItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
