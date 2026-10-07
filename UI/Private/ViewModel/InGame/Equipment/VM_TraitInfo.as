
namespace FVM_TraitSourceInfo
{
    const int ModelId = 0;
}
namespace FVM_TraitInfo
{
    const int ModelId = 0;

}
struct FVM_TraitSourceInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Equipment> m_EquipmentInfo;
    UPROPERTY()
    uint m_TraitLevel;
    UPROPERTY()
    TArray<FEUIDynamicWidgetData> m_TraitLevelList;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItem;
    UPROPERTY()
    TEUIModelRef<FVM_SelectableItem> m_SelectableItem;

    FVM_TraitSourceInfo()
    {
        this.m_TraitLevel = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TraitSourceInfo' by default constructor.");
        return;
    }
    FVM_TraitSourceInfo(const FVM_TraitSourceInfo &inout Other)
    {
        this.m_TraitLevel = 0;
        this.m_EquipmentInfo = Other.m_EquipmentInfo;
        this.m_TraitLevel = int(Other.m_TraitLevel);
        this.m_TraitLevelList = Other.m_TraitLevelList;
        this.m_CommonItem = Other.m_CommonItem;
        this.m_SelectableItem = Other.m_SelectableItem;
        return;
    }
    FVM_TraitSourceInfo(const TEUIModelRef<FM_Equipment> &inout InEquipmentInfo, const uint InTraitLevel)
    {
        this.m_TraitLevel = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEquipmentInfo(InEquipmentInfo);
        this.SetTraitLevel(InTraitLevel);
        return;
    }
    FVM_TraitSourceInfo& opAssign(const FVM_TraitSourceInfo &inout Other)
    {
        this.m_EquipmentInfo = Other.m_EquipmentInfo;
        this.m_TraitLevel = int(Other.m_TraitLevel);
        this.m_TraitLevelList = Other.m_TraitLevelList;
        this.m_CommonItem = Other.m_CommonItem;
        return Other.m_SelectableItem;
    }
    FSoftBrush GetEquipmentIcon() const
    {
        TEUIModelRef<FM_Equipment> local_2 = this.GetEquipmentInfo();
        return GetEquipmentConfig().opArrow().ItemIcon;
    }
    void PostConstruct()
    {
        int local_1 = 1;
        for (; local_1 <= this.GetTraitLevel(); )
        {
            FEUIDynamicWidgetData local_30;
            local_30.ModelContainer = FEUIModelContainer();
            this.GetModify_TraitLevelList().Add(local_30);
            ++local_1;
        }
        return;
    }
    TEUIModelRef<FM_Equipment> GetEquipmentInfo() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EquipmentInfo;
    }
    void SetEquipmentInfo(const TEUIModelRef<FM_Equipment> &inout __Value) property
    {
        TEUIModelRef<FM_Equipment> local_2;
        local_2 = this.m_EquipmentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EquipmentInfo = __Value;
        return;
    }
    uint GetTraitLevel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TraitLevel;
    }
    void SetTraitLevel(const uint __Value) property
    {
        if (this.m_TraitLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TraitLevel = __Value;
        return;
    }
    TArray<FEUIDynamicWidgetData> GetTraitLevelList() const property
    {
        TArray<FEUIDynamicWidgetData> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIDynamicWidgetData> GetModify_TraitLevelList() property
    {
        TArray<FEUIDynamicWidgetData> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTraitLevelList(const TArray<FEUIDynamicWidgetData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TraitLevelList = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonItem> GetCommonItem() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CommonItem;
    }
    void SetCommonItem(const TEUIModelRef<FVM_CommonItem> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonItem> local_2;
        local_2 = this.m_CommonItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CommonItem = __Value;
        return;
    }
    TEUIModelRef<FVM_SelectableItem> GetSelectableItem() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectableItem;
    }
    void SetSelectableItem(const TEUIModelRef<FVM_SelectableItem> &inout __Value) property
    {
        TEUIModelRef<FVM_SelectableItem> local_2;
        local_2 = this.m_SelectableItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectableItem = __Value;
        return;
    }
}

struct FVM_TraitInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Trait> m_Trait;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TraitSourceInfo>> m_TraitSourceList;
    UPROPERTY()
    bool m_bHighlight;

    FVM_TraitInfo()
    {
        this.m_bHighlight = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TraitInfo' by default constructor.");
        return;
    }
    FVM_TraitInfo(const FVM_TraitInfo &inout Other)
    {
        this.m_bHighlight = false;
        this.m_Trait = Other.m_Trait;
        this.m_TraitSourceList = Other.m_TraitSourceList;
        this.m_bHighlight = Other.m_bHighlight;
        return;
    }
    FVM_TraitInfo(const TEUIModelRef<FM_Trait> &inout InTrait)
    {
        this.m_bHighlight = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTrait(InTrait);
        return;
    }
    FVM_TraitInfo opAssign(const FVM_TraitInfo &inout Other)
    {
        FVM_TraitInfo __r;
        this.m_Trait = Other.m_Trait;
        this.m_TraitSourceList = Other.m_TraitSourceList;
        this.m_bHighlight = Other.m_bHighlight;
        return __r;
    }
    bool IsMaxLevel() const
    {
        return (this.GetTraitLevel() >= this.GetTraitMaxLevel());
    }
    FText GetTraitMaxLevelText() const
    {
        if (this.GetTraitLevel() > this.GetTraitMaxLevel())
        {
            return NSLOCTEXT("TraitLevelOutOfLimit", "жєўе‡є");
        }
        if (this.GetTraitLevel() == this.GetTraitMaxLevel())
        {
            return NSLOCTEXT("TraitLevelEqualLimit", "MAX");
        }
        return FText();
    }
    FSlateColor GetTextColor() const
    {
        FLinearColor local_13;
        if (this.GetbHighlight())
        {
            local_13 = FLinearColor(1.0f, 0.945098f, 0.407843f, 1.0f);
        }
        else
        {
            local_13 = FLinearColor::White;
        }
        return FSlateColor(local_13);
    }
    TDataObjectPtr<FTraitConfig> GetTraitConfig() const
    {
        TEUIModelRef<FM_Trait> local_2 = this.GetTrait();
        return GetTraitConfig();
    }
    int GetTraitLevel() const
    {
        TEUIModelRef<FM_Trait> local_2 = this.GetTrait();
        return GetTraitLevel();
    }
    int GetTraitMaxLevel() const
    {
        return ::NumericUtils::AsInt32(this.GetTraitConfig().opArrow().LevelLimit);
    }
    FText GetTraitDescription() const
    {
        TEUIModelRef<FM_Trait> local_2 = this.GetTrait();
        FText local_6;
        local_6.GetTraitDescription();
        return local_6;
    }
    FSoftBrush GetTraitIcon() const
    {
        return this.GetTraitConfig().opArrow().TraitIcon;
    }
    bool IsTraitMaxLevel() const
    {
        return (this.GetTraitLevel() >= this.GetTraitMaxLevel());
    }
    float32 GetTraitLevelPercentage() const
    {
        return (this.GetTraitLevel() / this.GetTraitMaxLevel());
    }
    FText GetTraitLevelText() const
    {
        return FText::Format(FText::AsCultureInvariant("Lv.{0}"), this.GetTraitLevel());
    }
    FText GetTraitLevelMaxLevelText() const
    {
        int local_2 = this.GetTraitMaxLevel();
        int local_1 = this.GetTraitLevel();
        if (local_1 > local_2)
        {
            return FText::Format(FText::AsCultureInvariant("Lv <Yellow24F>{0}</>/{1}"), local_1, local_2);
        }
        else
        {
            return FText::Format(FText::AsCultureInvariant("Lv {0}/{1}"), local_1, local_2);
        }
    }
    FEUIModelContainer GetTraitDetailListModel() const
    {
        int local_4 = 0;
        TEUIModelRef<FM_Trait> local_2 = this.GetTrait();
        local_4.SetTraitSourceList(this.GetTraitSourceList());
        return FEUIModelContainer(local_4);
    }
    bool IsRandomTrait() const
    {
        return this.GetTrait().opArrow().GetbIsRandomTrait();
    }
    TEUIModelRef<FM_Trait> GetTrait() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Trait;
    }
    void SetTrait(const TEUIModelRef<FM_Trait> &inout __Value) property
    {
        TEUIModelRef<FM_Trait> local_2;
        local_2 = this.m_Trait;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Trait = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TraitSourceInfo>> GetTraitSourceList() const property
    {
        const TArray<TEUIModelRef<FVM_TraitSourceInfo>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TraitSourceInfo>> GetModify_TraitSourceList() property
    {
        TArray<TEUIModelRef<FVM_TraitSourceInfo>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTraitSourceList(const TArray<TEUIModelRef<FVM_TraitSourceInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TraitSourceList = __Value;
        return;
    }
    bool GetbHighlight() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bHighlight;
    }
    void SetbHighlight(const bool __Value) property
    {
        if (!(this.m_bHighlight) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bHighlight = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TraitSourceInfo
{
    UPROPERTY()
    FSoftBrush EquipmentIcon;
    UPROPERTY()
    TEUIModelRef<FVM_TraitSourceInfo> Self;

    __GeneratedProperties_FVM_TraitSourceInfo()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_TraitInfo
{
    UPROPERTY()
    bool IsMaxLevel;
    UPROPERTY()
    FText TraitMaxLevelText;
    UPROPERTY()
    FSlateColor TextColor;
    UPROPERTY()
    TDataObjectPtr<FTraitConfig> TraitConfig;
    UPROPERTY()
    int TraitLevel;
    UPROPERTY()
    int TraitMaxLevel;
    UPROPERTY()
    FText TraitDescription;
    UPROPERTY()
    FSoftBrush TraitIcon;
    UPROPERTY()
    bool IsTraitMaxLevel;
    UPROPERTY()
    float32 TraitLevelPercentage;
    UPROPERTY()
    FText TraitLevelText;
    UPROPERTY()
    FText TraitLevelMaxLevelText;
    UPROPERTY()
    FEUIModelContainer TraitDetailListModel;
    UPROPERTY()
    bool IsRandomTrait;
    UPROPERTY()
    TEUIModelRef<FVM_TraitInfo> Self;


}

namespace FVM_TraitSourceInfo
{
FVM_TraitSourceInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Equipment> &inout EquipmentInfo, const uint TraitLevel)
{
    return FVM_TraitSourceInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), EquipmentInfo, TraitLevel);
}
FVM_TraitSourceInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Equipment> &inout EquipmentInfo, const uint TraitLevel)
{
    FVM_TraitSourceInfo __r;
    TEUIModelRef<FVM_TraitSourceInfo> local_6 = TEUIModelRef<FVM_TraitSourceInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TraitSourceInfo::ModelId, 0, EquipmentInfo, TraitLevel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TraitLevelList";
    local_14.TypeName = "TArray<FEUIDynamicWidgetData>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommonItem";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TraitSourceInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TraitSourceInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TraitSourceInfo;
}
TArray<FEUIDynamicWidgetData> __UIGetter_TraitLevelList(const FVM_TraitSourceInfo &inout Model)
{
    return Model.GetTraitLevelList();
}
TEUIModelRef<FVM_CommonItem> __UIGetter_CommonItem(const FVM_TraitSourceInfo &inout Model)
{
    return Model.GetCommonItem();
}
FSoftBrush __UIGetter_EquipmentIcon(const FVM_TraitSourceInfo &inout Model)
{
    return Model.GetEquipmentIcon();
}
TEUIModelRef<FVM_TraitSourceInfo> __UIGetter_Self(const FVM_TraitSourceInfo &inout Model)
{
    return TEUIModelRef<FVM_TraitSourceInfo>(Model);
}
int __IndexOf_EquipmentInfo()
{
    return 0;
}
int __IndexOf_TraitLevel()
{
    return 1;
}
int __IndexOf_TraitLevelList()
{
    return 2;
}
int __IndexOf_CommonItem()
{
    return 3;
}
int __IndexOf_SelectableItem()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_TraitSourceInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_TraitInfo
{
FVM_TraitInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Trait> &inout Trait)
{
    return FVM_TraitInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), Trait);
}
FVM_TraitInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Trait> &inout Trait)
{
    FVM_TraitInfo __r;
    TEUIModelRef<FVM_TraitInfo> local_6 = TEUIModelRef<FVM_TraitInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TraitInfo::ModelId, 0, Trait));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TraitSourceList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TraitSourceInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHighlight";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsMaxLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitMaxLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TextColor";
    local_14.TypeName = "FSlateColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitConfig";
    local_14.TypeName = "TDataObjectPtr<FTraitConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitMaxLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsTraitMaxLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitLevelPercentage";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitLevelMaxLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitDetailListModel";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsRandomTrait";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TraitInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TraitInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TraitInfo;
}
TArray<TEUIModelRef<FVM_TraitSourceInfo>> __UIGetter_TraitSourceList(const FVM_TraitInfo &inout Model)
{
    return Model.GetTraitSourceList();
}
bool __UIGetter_bHighlight(const FVM_TraitInfo &inout Model)
{
    return Model.GetbHighlight();
}
bool __UIGetter_IsMaxLevel(const FVM_TraitInfo &inout Model)
{
    return Model.IsMaxLevel();
}
FText __UIGetter_TraitMaxLevelText(const FVM_TraitInfo &inout Model)
{
    return Model.GetTraitMaxLevelText();
}
FSlateColor __UIGetter_TextColor(const FVM_TraitInfo &inout Model)
{
    return Model.GetTextColor();
}
TDataObjectPtr<FTraitConfig> __UIGetter_TraitConfig(const FVM_TraitInfo &inout Model)
{
    return Model.GetTraitConfig();
}
int __UIGetter_TraitLevel(const FVM_TraitInfo &inout Model)
{
    return Model.GetTraitLevel();
}
int __UIGetter_TraitMaxLevel(const FVM_TraitInfo &inout Model)
{
    return Model.GetTraitMaxLevel();
}
FText __UIGetter_TraitDescription(const FVM_TraitInfo &inout Model)
{
    return Model.GetTraitDescription();
}
FSoftBrush __UIGetter_TraitIcon(const FVM_TraitInfo &inout Model)
{
    return Model.GetTraitIcon();
}
bool __UIGetter_IsTraitMaxLevel(const FVM_TraitInfo &inout Model)
{
    return Model.IsTraitMaxLevel();
}
float32 __UIGetter_TraitLevelPercentage(const FVM_TraitInfo &inout Model)
{
    return Model.GetTraitLevelPercentage();
}
FText __UIGetter_TraitLevelText(const FVM_TraitInfo &inout Model)
{
    return Model.GetTraitLevelText();
}
FText __UIGetter_TraitLevelMaxLevelText(const FVM_TraitInfo &inout Model)
{
    return Model.GetTraitLevelMaxLevelText();
}
FEUIModelContainer __UIGetter_TraitDetailListModel(const FVM_TraitInfo &inout Model)
{
    return Model.GetTraitDetailListModel();
}
bool __UIGetter_IsRandomTrait(const FVM_TraitInfo &inout Model)
{
    return Model.IsRandomTrait();
}
TEUIModelRef<FVM_TraitInfo> __UIGetter_Self(const FVM_TraitInfo &inout Model)
{
    return TEUIModelRef<FVM_TraitInfo>(Model);
}
int __IndexOf_Trait()
{
    return 0;
}
int __IndexOf_TraitSourceList()
{
    return 1;
}
int __IndexOf_bHighlight()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_TraitInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
