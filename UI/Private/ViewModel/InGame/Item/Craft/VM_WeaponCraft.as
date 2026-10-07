
namespace FVM_WeaponCraftCategory
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelected = FEUIModelCallbackSignature();
}
namespace FVM_WeaponCraft
{
    const int ModelId = 0;

}
struct FVM_WeaponCraftCategory : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    EWeaponType m_WeaponType;
    UPROPERTY()
    FText m_DisplayName;
    UPROPERTY()
    FEUIModelWeakRef m_EquipCraft;

    FVM_WeaponCraftCategory()
    {
        this.m_Index = 0;
        this.m_WeaponType = EWeaponType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_WeaponCraftCategory' by default constructor.");
        return;
    }
    FVM_WeaponCraftCategory(const FVM_WeaponCraftCategory &inout Other)
    {
        this.m_Index = 0;
        this.m_WeaponType = EWeaponType(0);
        this.m_Index = int(Other.m_Index);
        this.m_WeaponType = Other.m_WeaponType;
        this.m_DisplayName = Other.m_DisplayName;
        this.m_EquipCraft = Other.m_EquipCraft;
        return;
    }
    FVM_WeaponCraftCategory(const int InIndex, const EWeaponType InWeaponType, const FText &inout InDisplayName)
    {
        this.m_Index = 0;
        this.m_WeaponType = EWeaponType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndex(InIndex);
        this.SetWeaponType(EWeaponType(InWeaponType));
        this.SetDisplayName(InDisplayName);
        return;
    }
    FVM_WeaponCraftCategory& opAssign(const FVM_WeaponCraftCategory &inout Other)
    {
        this.m_Index = int(Other.m_Index);
        this.m_WeaponType = Other.m_WeaponType;
        this.m_DisplayName = Other.m_DisplayName;
        return Other.m_EquipCraft;
    }
    void OnSelected()
    {
        FEUIModelRef local_4 = this.GetEquipCraft().AsRef();
        Get local_8;
        FVM_WeaponCraft& local_2 = local_8.opCall();
        if (local_2)
        {
            local_2.SetCurrentTab(this.GetIndex());
        }
        return;
    }
    bool IsSelected() const
    {
        FEUIModelRef local_4 = this.GetEquipCraft().AsRef();
        Get local_8;
        FVM_WeaponCraft& local_2 = local_8.opCall();
        if (local_2)
        {
            return (local_2.GetCurrentTab() == this.GetIndex());
        }
        return false;
    }
    int GetIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Index;
    }
    void SetIndex(const int __Value) property
    {
        if (this.m_Index == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Index = __Value;
        return;
    }
    EWeaponType GetWeaponType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_WeaponType;
    }
    void SetWeaponType(const EWeaponType __Value) property
    {
        if (int(this.m_WeaponType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_WeaponType = __Value;
        return;
    }
    FText GetDisplayName() const property
    {
        FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_DisplayName() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDisplayName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplayName = __Value;
        return;
    }
    const FEUIModelWeakRef GetEquipCraft() const property
    {
        const FEUIModelWeakRef __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIModelWeakRef GetModify_EquipCraft() property
    {
        FEUIModelWeakRef __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEquipCraft(const FEUIModelWeakRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EquipCraft = __Value;
        return;
    }
}

struct FVM_WeaponCraft : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_PopupClass;
    UPROPERTY()
    TEUIModelRef<FVM_ItemCraft> m_ItemCraft;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CraftableItem>> m_CraftableEquipments;
    UPROPERTY()
    int m_CurrentTab;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_WeaponCraftCategory>> m_Categories;
    UPROPERTY()
    TEUIModelRef<FMS_Craft> m_CraftDataModel;

    FVM_WeaponCraft()
    {
        this.m_CurrentTab = -1;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_WeaponCraft(const FVM_WeaponCraft &inout Other)
    {
        this.m_CurrentTab = -1;
        this.m_PopupClass = Other.m_PopupClass;
        this.m_ItemCraft = Other.m_ItemCraft;
        this.m_CraftableEquipments = Other.m_CraftableEquipments;
        this.m_CurrentTab = int(Other.m_CurrentTab);
        this.m_Categories = Other.m_Categories;
        this.m_CraftDataModel = Other.m_CraftDataModel;
        return;
    }
    FVM_WeaponCraft& opAssign(const FVM_WeaponCraft &inout Other)
    {
        this.m_PopupClass = Other.m_PopupClass;
        this.m_ItemCraft = Other.m_ItemCraft;
        this.m_CraftableEquipments = Other.m_CraftableEquipments;
        this.m_CurrentTab = int(Other.m_CurrentTab);
        this.m_Categories = Other.m_Categories;
        return Other.m_CraftDataModel;
    }
    void LoadConfig(const FConfigVM_WeaponCraft &inout InConfig)
    {
        this.SetPopupClass(InConfig.PopupClass);
        return;
    }
    TEUIModelRef<FVM_EquipmentInfo> GetCurrentCraftEquipmentInfo() const
    {
        if (!(!(this.GetItemCraft())) && this.GetItemCraft().opArrow().GetCurrentCraft())
        {
            return this.GetItemCraft().opArrow().GetCurrentCraft().opArrow().GetEquipment();
        }
        return TEUIModelRef<FVM_EquipmentInfo>(nullptr);
    }
    FSlateBrush GetCurrentCraftEquipmentPreview() const
    {
        if (!(!(this.GetItemCraft())) && this.GetItemCraft().opArrow().GetCurrentCraft())
        {
            return this.GetItemCraft().opArrow().GetCurrentCraft().opArrow().GetItem().opArrow().GetItemConfig().opArrow().ItemIcon.LoadBrush();
        }
        FSlateBrush local_100;
        local_100.TintColor = FSlateColor(FLinearColor::Transparent);
        return local_100;
    }
    void Setup(const TEUIModelRef<FVM_ItemCraft> &inout InItemCraft)
    {
        FVM_ItemCraft& local_10;
        EWeaponType local_90;
        this.SetItemCraft(InItemCraft);
        this.SetCurrentTab(0);
        this.SetCraftDataModel(TEUIModelRef<FMS_Craft>(::FMS_Craft::Get(this.GetContext().Manager)));
        TArray<EWeaponType> local_8;
        if (local_10)
        {
            for (auto& local_26 : local_10.GetAllCraftableItems())
            {
                TEUIModelRef<FVM_Item> local_52 = local_26.opArrow().GetItem();
                CastTo local_56;
                TDataObjectPtr<FWeaponConfig> local_80 = local_56.opCall();
                if (local_80)
                {
                    local_8.AddUnique(local_80.opArrow().WeaponType);
                }
            }
        }
        this.GetModify_Categories().SetNum(local_8.Num());
        int local_83 = 0;
        for (; local_83 < local_8.Num(); )
        {
            EWeaponType local_85;
            local_85 = local_8[local_83];
            ::FASCommonUtils::GetWeaponTypeDisplayName(local_90);
            this.GetModify_Categories()[local_83] = TEUIModelRef<FVM_WeaponCraftCategory>(::FVM_WeaponCraftCategory::Create(this.GetContext().Manager, local_83, local_90));
            FEUIModelWeakRef local_94 = FEUIModelWeakRef(FEUIModelRef(this));
            this.GetModify_Categories()[local_83].opArrow().SetEquipCraft(local_94);
            ++local_83;
        }
        return;
    }
    void RefreshCraftableEquipments()
    {
        if (this.GetCategories().IsValidIndex(this.GetCurrentTab()))
        {
            FVM_ItemCraft& local_8;
            EWeaponType local_3;
            int local_1 = this.GetCurrentTab();
            local_3 = GetWeaponType();
            this.GetModify_CraftableEquipments().Reset(0);
            TEUIModelRef<FVM_ItemCraft> local_6 = this.GetItemCraft();
            if (local_8)
            {
                for (auto& local_22 : local_8.GetAllCraftableItems())
                {
                    TEUIModelRef<FVM_Item> local_48 = local_22.opArrow().GetItem();
                    CastTo local_52;
                    TDataObjectPtr<FWeaponConfig> local_76 = local_52.opCall();
                    if (local_76)
                    {
                        EWeaponType local_4 = local_76.opArrow().WeaponType;
                        if (int(local_4) == (int(local_3)))
                        {
                            this.GetModify_CraftableEquipments().Add(local_22);
                        }
                    }
                }
                if (this.GetModify_CraftableEquipments().Num() > 0)
                {
                    local_8.OnCraftableItemSelected(this.GetModify_CraftableEquipments()[0]);
                }
            }
        }
        return;
    }
    void ShowCraftResult(const FMsg_CraftResult &inout Result)
    {
        if (Result.Items.Num() > 0)
        {
            TEUIModelRef<FM_Equipment> local_8 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(Result.Items[0].ItemGuid);
            if (local_8.opArrow().GetEquipmentConfig())
            {
                FVM_EquipmentInfo& local_12 = ::FVM_EquipmentInfo::Create(this.GetContext().Manager, local_8);
                for (auto& local_26 : local_12.GetEquipmentTraits())
                {
                    local_26;
                    TEUIModelRef<FM_Trait> local_28;
                    local_28.GetTrait();
                    GetbIsRandomTrait().SetbHighlight();
                }
                FEUIWidget::AddWidgetByClass(this.GetContext().UELocalPlayer, this.GetPopupClass(), FEUIModelRef(local_12));
            }
        }
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetPopupClass() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PopupClass;
    }
    void SetPopupClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_PopupClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PopupClass = __Value;
        return;
    }
    TEUIModelRef<FVM_ItemCraft> GetItemCraft() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ItemCraft;
    }
    void SetItemCraft(const TEUIModelRef<FVM_ItemCraft> &inout __Value) property
    {
        TEUIModelRef<FVM_ItemCraft> local_2;
        local_2 = this.m_ItemCraft;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemCraft = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CraftableItem>> GetCraftableEquipments() const property
    {
        const TArray<TEUIModelRef<FVM_CraftableItem>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CraftableItem>> GetModify_CraftableEquipments() property
    {
        TArray<TEUIModelRef<FVM_CraftableItem>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCraftableEquipments(const TArray<TEUIModelRef<FVM_CraftableItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CraftableEquipments = __Value;
        return;
    }
    int GetCurrentTab() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CurrentTab;
    }
    void SetCurrentTab(const int __Value) property
    {
        if (this.m_CurrentTab == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentTab = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_WeaponCraftCategory>> GetCategories() const property
    {
        const TArray<TEUIModelRef<FVM_WeaponCraftCategory>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_WeaponCraftCategory>> GetModify_Categories() property
    {
        TArray<TEUIModelRef<FVM_WeaponCraftCategory>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCategories(const TArray<TEUIModelRef<FVM_WeaponCraftCategory>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Categories = __Value;
        return;
    }
    TEUIModelRef<FMS_Craft> GetCraftDataModel() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CraftDataModel;
    }
    void SetCraftDataModel(const TEUIModelRef<FMS_Craft> &inout __Value) property
    {
        TEUIModelRef<FMS_Craft> local_2;
        local_2 = this.m_CraftDataModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CraftDataModel = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_InGame_Item_Craft_VM_WeaponCraft_98
{
    __Lambda_UI_Private_ViewModel_InGame_Item_Craft_VM_WeaponCraft_98()
    {
        return;
    }
    bool opCall(const EWeaponType &inout A, const EWeaponType &inout B)
    {
        int local_3 = int(A);
        int local_4 = int(B);
        return (local_3 < local_4);
    }
}

struct __GeneratedProperties_FVM_WeaponCraftCategory
{
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_WeaponCraftCategory> Self;


}

struct __GeneratedProperties_FVM_WeaponCraft
{
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> CurrentCraftEquipmentInfo;
    UPROPERTY()
    FSlateBrush CurrentCraftEquipmentPreview;
    UPROPERTY()
    TEUIModelRef<FVM_WeaponCraft> Self;

    __GeneratedProperties_FVM_WeaponCraft()
    {
        return;
    }
}

namespace FVM_WeaponCraftCategory
{
FVM_WeaponCraftCategory Create(const UObject ContextObject, const int Index, const EWeaponType WeaponType, const FText &inout DisplayName)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FVM_WeaponCraftCategory __r; return __r;
}
FVM_WeaponCraftCategory CreateByManager(const UEUIManagerSubsystem Manager, const int Index, const EWeaponType WeaponType, const FText &inout DisplayName)
{
    FVM_WeaponCraftCategory __r;
    TEUIModelRef<FVM_WeaponCraftCategory> local_6 = TEUIModelRef<FVM_WeaponCraftCategory>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_WeaponCraftCategory::ModelId, 0, Index, WeaponType, DisplayName));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_WeaponCraftCategory>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_WeaponCraftCategory;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_WeaponCraftCategory;
}
FText __UIGetter_DisplayName(const FVM_WeaponCraftCategory &inout Model)
{
    return Model.GetDisplayName();
}
bool __UIGetter_IsSelected(const FVM_WeaponCraftCategory &inout Model)
{
    return Model.IsSelected();
}
TEUIModelRef<FVM_WeaponCraftCategory> __UIGetter_Self(const FVM_WeaponCraftCategory &inout Model)
{
    return TEUIModelRef<FVM_WeaponCraftCategory>(Model);
}
int __IndexOf_Index()
{
    return 0;
}
int __IndexOf_WeaponType()
{
    return 1;
}
int __IndexOf_DisplayName()
{
    return 2;
}
int __IndexOf_EquipCraft()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_WeaponCraftCategory
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_WeaponCraft
{
FVM_WeaponCraft& Create(const UObject ContextObject)
{
    return FVM_WeaponCraft::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_WeaponCraft CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_WeaponCraft __r;
    TEUIModelRef<FVM_WeaponCraft> local_6 = TEUIModelRef<FVM_WeaponCraft>(EUIInternal::MakeModelWithManager(Manager, FVM_WeaponCraft::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_WeaponCraft;
}
void __RefreshCraftableEquipments(FVM_WeaponCraft &inout Model)
{
    Model.RefreshCraftableEquipments();
    return;
}
void __ShowCraftResult(FVM_WeaponCraft &inout Model, const FMsg_CraftResult &inout Message)
{
    Model.ShowCraftResult(Message);
    return;
}
TArray<TEUIModelRef<FVM_CraftableItem>> __UIGetter_CraftableEquipments(const FVM_WeaponCraft &inout Model)
{
    return Model.GetCraftableEquipments();
}
TArray<TEUIModelRef<FVM_WeaponCraftCategory>> __UIGetter_Categories(const FVM_WeaponCraft &inout Model)
{
    return Model.GetCategories();
}
TEUIModelRef<FVM_EquipmentInfo> __UIGetter_CurrentCraftEquipmentInfo(const FVM_WeaponCraft &inout Model)
{
    return Model.GetCurrentCraftEquipmentInfo();
}
FSlateBrush __UIGetter_CurrentCraftEquipmentPreview(const FVM_WeaponCraft &inout Model)
{
    return Model.GetCurrentCraftEquipmentPreview();
}
TEUIModelRef<FVM_WeaponCraft> __UIGetter_Self(const FVM_WeaponCraft &inout Model)
{
    return TEUIModelRef<FVM_WeaponCraft>(Model);
}
int __IndexOf_PopupClass()
{
    return 0;
}
int __IndexOf_ItemCraft()
{
    return 1;
}
int __IndexOf_CraftableEquipments()
{
    return 2;
}
int __IndexOf_CurrentTab()
{
    return 3;
}
int __IndexOf_Categories()
{
    return 4;
}
int __IndexOf_CraftDataModel()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_WeaponCraft
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
