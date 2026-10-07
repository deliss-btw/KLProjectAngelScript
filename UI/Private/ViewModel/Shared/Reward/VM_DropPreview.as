
namespace FVM_DropPreviewItemMeta
{
    const int ModelId = 0;
}
namespace FVM_DropPreview
{
    const int ModelId = 0;

}
struct FVM_DropPreviewItemMeta : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_ItemConfig;
    UPROPERTY()
    bool m_bDropIncrease;
    UPROPERTY()
    FEUIModelContainer m_TipHoverModels;

    FVM_DropPreviewItemMeta()
    {
        this.m_bDropIncrease = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_DropPreviewItemMeta' by default constructor.");
        return;
    }
    FVM_DropPreviewItemMeta(const FVM_DropPreviewItemMeta &inout Other)
    {
        this.m_bDropIncrease = false;
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_bDropIncrease = Other.m_bDropIncrease;
        this.m_TipHoverModels = Other.m_TipHoverModels;
        return;
    }
    FVM_DropPreviewItemMeta(const TDataObjectPtr<FItemConfig> &inout InItemConfig, const bool InbDropIncrease)
    {
        this.m_bDropIncrease = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemConfig(InItemConfig);
        this.SetbDropIncrease(InbDropIncrease);
        return;
    }
    FVM_DropPreviewItemMeta& opAssign(const FVM_DropPreviewItemMeta &inout Other)
    {
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_bDropIncrease = Other.m_bDropIncrease;
        return Other.m_TipHoverModels;
    }
    TDataObjectPtr<FItemConfig> GetItemConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_ItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemConfig = __Value;
        return;
    }
    bool GetbDropIncrease() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bDropIncrease;
    }
    void SetbDropIncrease(const bool __Value) property
    {
        if (!(this.m_bDropIncrease) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bDropIncrease = __Value;
        return;
    }
    const FEUIModelContainer GetTipHoverModels() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIModelContainer GetModify_TipHoverModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTipHoverModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TipHoverModels = __Value;
        return;
    }
}

struct FParsedDropItemData
{
    UPROPERTY()
    int MinNum;
    UPROPERTY()
    bool bProbability;
    UPROPERTY()
    bool bDropIncrease;


}

struct FParsedDropItemWeightData
{
    UPROPERTY()
    int MinNum;
    UPROPERTY()
    int TotalWeight;
    UPROPERTY()
    bool bQuantityVaries;


}

struct FDropItemConfigParser
{
    UPROPERTY()
    TMap<TDataObjectPtr<FItemConfig>, FParsedDropItemData> ParsedDropItemDataMap;

    FDropItemConfigParser()
    {
        return;
    }
    void ParseDropItemConfig(const TDataObjectPtr<FDropItemConfigBase> &inout DropItemConfig)
    {
        CastTo local_4;
        TDataObjectPtr<FDropItemConfig> local_28 = local_4.opCall();
        if (local_28)
        {
            this.ParseSingleDrop(local_28, false, false);
            return;
        }
        CastTo local_58;
        TDataObjectPtr<FDropItemGroupConfig> local_82 = local_58.opCall();
        if (local_82)
        {
            this.ParseGroupDrop(local_82);
        }
        return;
    }
    void ParseSingleDrop(const TDataObjectPtr<FDropItemConfig> &inout SingleDrop, const bool bProbability = false, const bool bDropIncrease = false)
    {
        int local_2 = 0;
        int local_73 = 0;
        bool local_113;
        bool local_116 = false;
        int local_1 = 0;
        for (auto& local_18 : SingleDrop.opArrow().Drops)
        {
            local_2 = int(local_18.Weight);
            local_1 = local_1 + local_2;
        }
        if (local_1 <= 0)
        {
            return;
        }
        TMap<TDataObjectPtr<FItemConfig>, FParsedDropItemWeightData> local_38;
        for (auto& local_18 : SingleDrop.opArrow().Drops)
        {
            TMap<TDataObjectPtr<FItemConfig>, int> local_58;
            for (auto& local_72 : local_18.DropItemPackages)
            {
                if (local_72.Item)
                {
                    local_73 = int(local_72.Num);
                    local_2 = local_58.FindOrAdd(local_72.Item);
                    local_2 = local_2 + local_73;
                }
            }
            for (auto& local_92 : local_58)
            {
                local_73 = int(local_18.Weight);
                this.AddItemToParsedDropItemWeightData(local_38.FindOrAdd(local_92.GetKey()), local_2, local_73);
            }
        }
        for (auto& local_110 : local_38)
        {
            FParsedDropItemData& local_112 = this.FindOrAdd(local_110.GetKey());
            bool local_15 = (local_73 >= local_1);
            bool local_115 = bProbability || !(local_15);
            local_113 = local_115 || local_116;
            if ((local_15 && !(bProbability)))
            {
                local_73 = int(local_112.MinNum);
                local_73 = local_73 + local_2;
                local_112.MinNum = local_73;
            }
            local_115 = local_112.bProbability || local_113;
            local_112.bProbability = local_115;
            local_115 = local_112.bDropIncrease || bDropIncrease;
            local_112.bDropIncrease = local_115;
        }
        return;
    }
    void ParseGroupDrop(const TDataObjectPtr<FDropItemGroupConfig> &inout GroupDrop)
    {
        for (auto& local_16 : GroupDrop.opArrow().Drops)
        {
            if (local_16.Item)
            {
                this.ParseSingleDrop(local_16.Item, (local_16.DropRate < 100.0f), local_16.bUseBadWeatherDropRateUpRule);
            }
        }
        return;
    }
    void AddItemToParsedDropItemData(FParsedDropItemData &inout ParsedDropItemData, const int ItemNum, const bool bProbability = false)
    {
        bool local_1;
        if (!(bProbability))
        {
            ParsedDropItemData.MinNum += ItemNum;
        }
        local_1 = ParsedDropItemData.bProbability || bProbability;
        ParsedDropItemData.bProbability = local_1;
        return;
    }
    void AddItemToParsedDropItemWeightData(FParsedDropItemWeightData &inout Data, const int ItemNum, const int Weight)
    {
        if (int(Data.TotalWeight) == 0)
        {
            Data.MinNum = ItemNum;
        }
        else
        {
            if (ItemNum != int(Data.MinNum))
            {
                Data.bQuantityVaries = true;
            }
            Data.MinNum = FMath::Min(int(Data.MinNum), ItemNum);
        }
        Data.TotalWeight = (Data.TotalWeight + Weight);
        return;
    }
}

struct FVM_DropPreview : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FDropItemConfigBase> m_DropItemConfig;
    UPROPERTY()
    bool m_bShowDropIncrease;
    UPROPERTY()
    TArray<FEUIModelContainer> m_BasicDrops;
    UPROPERTY()
    TArray<FEUIModelContainer> m_ExtraDrops;

    FVM_DropPreview()
    {
        this.m_bShowDropIncrease = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_DropPreview' by default constructor.");
        return;
    }
    FVM_DropPreview(const FVM_DropPreview &inout Other)
    {
        this.m_bShowDropIncrease = false;
        this.m_DropItemConfig = Other.m_DropItemConfig;
        this.m_bShowDropIncrease = Other.m_bShowDropIncrease;
        this.m_BasicDrops = Other.m_BasicDrops;
        this.m_ExtraDrops = Other.m_ExtraDrops;
        return;
    }
    FVM_DropPreview(const TDataObjectPtr<FDropItemConfigBase> &inout InDropItemConfig, const bool InbShowDropIncrease)
    {
        this.m_bShowDropIncrease = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDropItemConfig(InDropItemConfig);
        this.SetbShowDropIncrease(InbShowDropIncrease);
        return;
    }
    FVM_DropPreview& opAssign(const FVM_DropPreview &inout Other)
    {
        this.m_DropItemConfig = Other.m_DropItemConfig;
        this.m_bShowDropIncrease = Other.m_bShowDropIncrease;
        this.m_BasicDrops = Other.m_BasicDrops;
        return Other.m_ExtraDrops;
    }
    bool HasBasicDrops() const
    {
        return !(this.GetBasicDrops().IsEmpty());
    }
    bool HasExtraDrops() const
    {
        return !(this.GetExtraDrops().IsEmpty());
    }
    void PostConstruct()
    {
        FDropItemConfigParser local_20;
        bool local_37 = false;
        int local_42 = 0;
        bool local_43 = false;
        local_20.ParseDropItemConfig(this.GetDropItemConfig());
        for (auto& local_40 : local_20.ParsedDropItemDataMap)
        {
            if (0 > 0)
            {
                local_43 = false;
                this.GetModify_BasicDrops().Add(this.CreateDropItemModelContainer(local_40.GetKey(), local_42, local_43, local_37));
                continue;
            }
            if (local_37)
            {
                this.GetModify_ExtraDrops().Add(this.CreateDropItemModelContainer(local_40.GetKey(), local_42, true, local_43));
                continue;
            }
        }
        return;
    }
    FEUIModelContainer CreateDropItemModelContainer(const TDataObjectPtr<FItemConfig> &inout ItemConfig, const int MinNum, const bool bProbability, const bool bDropIncrease)
    {
        int local_6 = 0;
        FM_ItemData& local_4 = ::FM_ItemData::Create(this.GetManager());
        local_4.SetConfig(ItemConfig);
        local_4.SetNum(MinNum);
        TEUIModelRef<FM_ItemData> local_10 = TEUIModelRef<FM_ItemData>(local_4);
        UEUIManagerSubsystem local_2 = this.GetManager();
        if (bProbability)
        {
            FText local_24 = ::RewardSortUtils::ResolveTagDisplayText(n"CommissionDrop", FText());
            ::ComposableItemUtility::SetIsShowTag(local_6, !(local_24.IsEmpty()));
            ::ComposableItemUtility::SetDisplayTagText(local_6, local_24);
            ::ComposableItemUtility::SetItemCountText(local_6, FText());
        }
        else
        {
            ::ComposableItemUtility::SetItemCountText(local_6, FText::AsNumber(MinNum, FNumberFormattingOptions::DefaultNoGrouping()));
        }
        FEUIModelContainer local_40;
        local_40.AddModel(FEUIModelRef(local_6), false);
        FEUIModelContainer local_138 = ::CommonItemTip::MakeModels(this.GetContext().Manager, ::CommonItemTip::MakeSimpleFromItemData(TEUIModelRef<FM_ItemData>(local_4)));
        FVM_DropPreviewItemMeta& local_140 = ::FVM_DropPreviewItemMeta::Create(this.GetManager(), ItemConfig, (this.GetbShowDropIncrease() && bDropIncrease));
        local_140.SetTipHoverModels(local_138);
        local_40.AddModel(FEUIModelRef(local_140), false);
        return local_40;
    }
    const TDataObjectPtr<FDropItemConfigBase> GetDropItemConfig() const property
    {
        const TDataObjectPtr<FDropItemConfigBase> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FDropItemConfigBase> GetModify_DropItemConfig() property
    {
        TDataObjectPtr<FDropItemConfigBase> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDropItemConfig(const TDataObjectPtr<FDropItemConfigBase> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DropItemConfig = __Value;
        return;
    }
    bool GetbShowDropIncrease() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bShowDropIncrease;
    }
    void SetbShowDropIncrease(const bool __Value) property
    {
        if (!(this.m_bShowDropIncrease) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bShowDropIncrease = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetBasicDrops() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_BasicDrops() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetBasicDrops(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_BasicDrops = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetExtraDrops() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_ExtraDrops() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetExtraDrops(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ExtraDrops = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_Shared_Reward_VM_DropPreview_196
{
    __Lambda_UI_Private_ViewModel_Shared_Reward_VM_DropPreview_196()
    {
        return;
    }
    bool opCall(const FEUIModelContainer &inout A, const FEUIModelContainer &inout B)
    {
        TEUIModelRef<FM_ItemData> local_6 = FEUIModelContainer::RequireModel(A).opCall().GetItemDataModel();
        int local_11 = int(local_6.opArrow().GetConfig().opArrow().Rarity);
        TEUIModelRef<FM_ItemData> local_8 = FEUIModelContainer::RequireModel(B).opCall().GetItemDataModel();
        int local_12 = int(local_8.opArrow().GetConfig().opArrow().Rarity);
        return (local_11 > local_12);
    }
}

struct __Lambda_UI_Private_ViewModel_Shared_Reward_VM_DropPreview_197
{
    __Lambda_UI_Private_ViewModel_Shared_Reward_VM_DropPreview_197()
    {
        return;
    }
    bool opCall(const FEUIModelContainer &inout A, const FEUIModelContainer &inout B)
    {
        TEUIModelRef<FM_ItemData> local_6 = FEUIModelContainer::RequireModel(A).opCall().GetItemDataModel();
        int local_11 = int(local_6.opArrow().GetConfig().opArrow().Rarity);
        TEUIModelRef<FM_ItemData> local_8 = FEUIModelContainer::RequireModel(B).opCall().GetItemDataModel();
        int local_12 = int(local_8.opArrow().GetConfig().opArrow().Rarity);
        return (local_11 > local_12);
    }
}

struct __GeneratedProperties_FVM_DropPreviewItemMeta
{
    UPROPERTY()
    TEUIModelRef<FVM_DropPreviewItemMeta> Self;

    __GeneratedProperties_FVM_DropPreviewItemMeta()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_DropPreview
{
    UPROPERTY()
    bool HasBasicDrops;
    UPROPERTY()
    bool HasExtraDrops;
    UPROPERTY()
    TEUIModelRef<FVM_DropPreview> Self;


}

namespace FVM_DropPreviewItemMeta
{
FVM_DropPreviewItemMeta& Create(const UObject ContextObject, const TDataObjectPtr<FItemConfig> &inout ItemConfig, const bool bDropIncrease)
{
    return FVM_DropPreviewItemMeta::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemConfig, bDropIncrease);
}
FVM_DropPreviewItemMeta CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FItemConfig> &inout ItemConfig, const bool bDropIncrease)
{
    FVM_DropPreviewItemMeta __r;
    TEUIModelRef<FVM_DropPreviewItemMeta> local_6 = TEUIModelRef<FVM_DropPreviewItemMeta>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_DropPreviewItemMeta::ModelId, 0, ItemConfig, bDropIncrease));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bDropIncrease";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipHoverModels";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_DropPreviewItemMeta>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_DropPreviewItemMeta;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_DropPreviewItemMeta;
}
bool __UIGetter_bDropIncrease(const FVM_DropPreviewItemMeta &inout Model)
{
    return Model.GetbDropIncrease();
}
FEUIModelContainer __UIGetter_TipHoverModels(const FVM_DropPreviewItemMeta &inout Model)
{
    return Model.GetTipHoverModels();
}
TEUIModelRef<FVM_DropPreviewItemMeta> __UIGetter_Self(const FVM_DropPreviewItemMeta &inout Model)
{
    return TEUIModelRef<FVM_DropPreviewItemMeta>(Model);
}
int __IndexOf_ItemConfig()
{
    return 0;
}
int __IndexOf_bDropIncrease()
{
    return 1;
}
int __IndexOf_TipHoverModels()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_DropPreviewItemMeta
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_DropPreview
{
FVM_DropPreview& Create(const UObject ContextObject, const TDataObjectPtr<FDropItemConfigBase> &inout DropItemConfig, const bool bShowDropIncrease)
{
    return FVM_DropPreview::CreateByManager(EUIInternal::GetContextManager(ContextObject), DropItemConfig, bShowDropIncrease);
}
FVM_DropPreview CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FDropItemConfigBase> &inout DropItemConfig, const bool bShowDropIncrease)
{
    FVM_DropPreview __r;
    TEUIModelRef<FVM_DropPreview> local_6 = TEUIModelRef<FVM_DropPreview>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_DropPreview::ModelId, 0, DropItemConfig, bShowDropIncrease));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bShowDropIncrease";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BasicDrops";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExtraDrops";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasBasicDrops";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasExtraDrops";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_DropPreview>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_DropPreview;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_DropPreview;
}
bool __UIGetter_bShowDropIncrease(const FVM_DropPreview &inout Model)
{
    return Model.GetbShowDropIncrease();
}
TArray<FEUIModelContainer> __UIGetter_BasicDrops(const FVM_DropPreview &inout Model)
{
    return Model.GetBasicDrops();
}
TArray<FEUIModelContainer> __UIGetter_ExtraDrops(const FVM_DropPreview &inout Model)
{
    return Model.GetExtraDrops();
}
bool __UIGetter_HasBasicDrops(const FVM_DropPreview &inout Model)
{
    return Model.HasBasicDrops();
}
bool __UIGetter_HasExtraDrops(const FVM_DropPreview &inout Model)
{
    return Model.HasExtraDrops();
}
TEUIModelRef<FVM_DropPreview> __UIGetter_Self(const FVM_DropPreview &inout Model)
{
    return TEUIModelRef<FVM_DropPreview>(Model);
}
int __IndexOf_DropItemConfig()
{
    return 0;
}
int __IndexOf_bShowDropIncrease()
{
    return 1;
}
int __IndexOf_BasicDrops()
{
    return 2;
}
int __IndexOf_ExtraDrops()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_DropPreview
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
