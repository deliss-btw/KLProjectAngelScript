
namespace FVM_MonsterInfo
{
    const int ModelId = 0;

}
struct FVM_MonsterInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> m_MonsterConfig;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> m_DropItemList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_DamageType>> m_AttributeDamageTypes;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_DamageType>> m_WeaknessDamageTypes;

    FVM_MonsterInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MonsterInfo' by default constructor.");
        return;
    }
    FVM_MonsterInfo(const FVM_MonsterInfo &inout Other)
    {
        this.m_MonsterConfig = Other.m_MonsterConfig;
        this.m_DropItemList = Other.m_DropItemList;
        this.m_AttributeDamageTypes = Other.m_AttributeDamageTypes;
        this.m_WeaknessDamageTypes = Other.m_WeaknessDamageTypes;
        return;
    }
    FVM_MonsterInfo(const TDataObjectPtr<FMonsterMainConfig> &inout InMonsterConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMonsterConfig(InMonsterConfig);
        return;
    }
    FVM_MonsterInfo& opAssign(const FVM_MonsterInfo &inout Other)
    {
        this.m_MonsterConfig = Other.m_MonsterConfig;
        this.m_DropItemList = Other.m_DropItemList;
        this.m_AttributeDamageTypes = Other.m_AttributeDamageTypes;
        return Other.m_WeaknessDamageTypes;
    }
    void PostConstruct()
    {
        FCommonRewardListBuilder local_4;
        if (!(this.GetMonsterConfig().opArrow().GetDropItems().IsEmpty()))
        {
            this.AddDropRewardItems(local_4, this.GetMonsterConfig().opArrow().GetDropItems()[0]);
        }
        TArray<FRewardItemEntry> local_14 = local_4.Build();
        if (!(local_14.IsEmpty()))
        {
            for (auto& local_28 : local_14)
            {
                TDataObjectPtr<FItemConfig> local_78 = ::FItemConfig::GetByDataId(int(local_28.ItemId));
                if (!(local_78))
                {
                    continue;
                }
                FM_ItemData& local_80 = ::FM_ItemData::Create(this.GetContext().Manager);
                local_80.SetConfig(local_78);
                local_80.SetNum(int(local_28.Count));
                TEUIModelRef<FVM_CommonRewardItem> local_84 = TEUIModelRef<FVM_CommonRewardItem>(this.MakeRewardItem((TEUIModelRef<FM_ItemData>(local_80)), local_28.TagKey, local_28.TagText));
                this.GetModify_DropItemList().Add(local_84);
            }
        }
        for (auto local_97 : this.GetMonsterConfig().opArrow().GetPresentationConfig().opArrow().AttributeTypes)
        {
            local_97;
            this.GetModify_AttributeDamageTypes().Add(TEUIModelRef<FVM_DamageType>(::FVM_DamageType::Create(this.GetContext().Manager)));
        }
        for (auto local_97 : this.GetMonsterConfig().opArrow().GetPresentationConfig().opArrow().WeaknessDamageTypes)
        {
            local_97;
            this.GetModify_WeaknessDamageTypes().Add(TEUIModelRef<FVM_DamageType>(::FVM_DamageType::Create(this.GetContext().Manager)));
        }
        return;
    }
    bool HasDropItem() const
    {
        return !(this.GetDropItemList().IsEmpty());
    }
    void AddDropRewardItems(FCommonRewardListBuilder &inout Builder, const TDataObjectPtr<FDropItemConfigBase> &inout DropReward)
    {
        FDropItemConfigParser local_20;
        bool local_37 = false;
        int local_41;
        int local_42 = 0;
        int local_44 = 0;
        local_20.ParseDropItemConfig(DropReward);
        for (auto& local_40 : local_20.ParsedDropItemDataMap)
        {
            local_40;
            local_41 = local_42;
            if (0 > 0)
            {
                local_37 = false;
                Builder.AddItem(local_41, local_44, FName(), FText(), local_37);
            }
            if (local_37)
            {
                Builder.AddItem(local_41, 0, n"CommissionDrop", FText(), false);
            }
        }
        return;
    }
    FVM_CommonRewardItem& MakeRewardItem(const TEUIModelRef<FM_ItemData> &inout ItemData, const FName &inout TagKey, const FText &inout TagText)
    {
        FVM_ComposableItem& local_2 = ::FVM_ComposableItem::Create(this.GetContext().Manager, ItemData, EItemDisplayScenario(3));
        FText local_12 = ::RewardSortUtils::ResolveTagDisplayText(TagKey, TagText);
        ::ComposableItemUtility::SetIsShowTag(local_2, !(local_12.IsEmpty()));
        ::ComposableItemUtility::SetDisplayTagText(local_2, local_12);
        if ((TagKey == n"CommissionDrop"))
        {
            FText local_8;
            ::ComposableItemUtility::SetItemCountText(local_2, local_8);
        }
        else
        {
            ::ComposableItemUtility::SetItemCountText(local_2, FText::AsNumber(ItemData.opArrow().GetNum(), FNumberFormattingOptions::DefaultNoGrouping()));
        }
        FEUIModelContainer local_28;
        local_28.AddModel(FEUIModelRef(), false);
        FVM_CommonRewardItem& local_32 = ::FVM_CommonRewardItem::Create(this.GetContext().Manager, local_28, false);
        local_32.SetComposableItemVM(TEUIModelRef<FVM_ComposableItem>(local_2));
        return local_32;
    }
    TDataObjectPtr<FMonsterPresentationConfig> GetMonsterPresentationConfig() const
    {
        return this.GetMonsterConfig().opArrow().GetPresentationConfig();
    }
    bool HasAttributeIcon() const
    {
        return !(this.GetAttributeDamageTypes().IsEmpty());
    }
    bool HasWeaknessIcon() const
    {
        return !(this.GetWeaknessDamageTypes().IsEmpty());
    }
    bool HasAttributeDamageType() const
    {
        return !(this.GetAttributeDamageTypes().IsEmpty());
    }
    bool HasWeaknessDamageType() const
    {
        return !(this.GetWeaknessDamageTypes().IsEmpty());
    }
    TDataObjectPtr<FMonsterMainConfig> GetMonsterConfig() const property
    {
        TDataObjectPtr<FMonsterMainConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FMonsterMainConfig> GetModify_MonsterConfig() property
    {
        TDataObjectPtr<FMonsterMainConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMonsterConfig(const TDataObjectPtr<FMonsterMainConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MonsterConfig = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CommonRewardItem>> GetDropItemList() const property
    {
        const TArray<TEUIModelRef<FVM_CommonRewardItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetModify_DropItemList() property
    {
        TArray<TEUIModelRef<FVM_CommonRewardItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDropItemList(const TArray<TEUIModelRef<FVM_CommonRewardItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DropItemList = __Value;
        return;
    }
    TArray<TEUIModelRef<FVM_DamageType>> GetAttributeDamageTypes() const property
    {
        TArray<TEUIModelRef<FVM_DamageType>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_DamageType>> GetModify_AttributeDamageTypes() property
    {
        TArray<TEUIModelRef<FVM_DamageType>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAttributeDamageTypes(const TArray<TEUIModelRef<FVM_DamageType>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AttributeDamageTypes = __Value;
        return;
    }
    TArray<TEUIModelRef<FVM_DamageType>> GetWeaknessDamageTypes() const property
    {
        TArray<TEUIModelRef<FVM_DamageType>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_DamageType>> GetModify_WeaknessDamageTypes() property
    {
        TArray<TEUIModelRef<FVM_DamageType>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetWeaknessDamageTypes(const TArray<TEUIModelRef<FVM_DamageType>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_WeaknessDamageTypes = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MonsterInfo
{
    UPROPERTY()
    bool HasDropItem;
    UPROPERTY()
    TDataObjectPtr<FMonsterPresentationConfig> MonsterPresentationConfig;
    UPROPERTY()
    bool HasAttributeIcon;
    UPROPERTY()
    bool HasWeaknessIcon;
    UPROPERTY()
    bool HasAttributeDamageType;
    UPROPERTY()
    bool HasWeaknessDamageType;
    UPROPERTY()
    TEUIModelRef<FVM_MonsterInfo> Self;


}

namespace FVM_MonsterInfo
{
FVM_MonsterInfo& Create(const UObject ContextObject, const TDataObjectPtr<FMonsterMainConfig> &inout MonsterConfig)
{
    return FVM_MonsterInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), MonsterConfig);
}
FVM_MonsterInfo CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FMonsterMainConfig> &inout MonsterConfig)
{
    FVM_MonsterInfo __r;
    TEUIModelRef<FVM_MonsterInfo> local_6 = TEUIModelRef<FVM_MonsterInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MonsterInfo::ModelId, 0, MonsterConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MonsterConfig";
    local_14.TypeName = "TDataObjectPtr<FMonsterMainConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DropItemList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonRewardItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AttributeDamageTypes";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_DamageType>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WeaknessDamageTypes";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_DamageType>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasDropItem";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MonsterPresentationConfig";
    local_14.TypeName = "TDataObjectPtr<FMonsterPresentationConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAttributeIcon";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasWeaknessIcon";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAttributeDamageType";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasWeaknessDamageType";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MonsterInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MonsterInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MonsterInfo;
}
TDataObjectPtr<FMonsterMainConfig> __UIGetter_MonsterConfig(const FVM_MonsterInfo &inout Model)
{
    return Model.GetMonsterConfig();
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_DropItemList(const FVM_MonsterInfo &inout Model)
{
    return Model.GetDropItemList();
}
TArray<TEUIModelRef<FVM_DamageType>> __UIGetter_AttributeDamageTypes(const FVM_MonsterInfo &inout Model)
{
    return Model.GetAttributeDamageTypes();
}
TArray<TEUIModelRef<FVM_DamageType>> __UIGetter_WeaknessDamageTypes(const FVM_MonsterInfo &inout Model)
{
    return Model.GetWeaknessDamageTypes();
}
bool __UIGetter_HasDropItem(const FVM_MonsterInfo &inout Model)
{
    return Model.HasDropItem();
}
TDataObjectPtr<FMonsterPresentationConfig> __UIGetter_MonsterPresentationConfig(const FVM_MonsterInfo &inout Model)
{
    return Model.GetMonsterPresentationConfig();
}
bool __UIGetter_HasAttributeIcon(const FVM_MonsterInfo &inout Model)
{
    return Model.HasAttributeIcon();
}
bool __UIGetter_HasWeaknessIcon(const FVM_MonsterInfo &inout Model)
{
    return Model.HasWeaknessIcon();
}
bool __UIGetter_HasAttributeDamageType(const FVM_MonsterInfo &inout Model)
{
    return Model.HasAttributeDamageType();
}
bool __UIGetter_HasWeaknessDamageType(const FVM_MonsterInfo &inout Model)
{
    return Model.HasWeaknessDamageType();
}
TEUIModelRef<FVM_MonsterInfo> __UIGetter_Self(const FVM_MonsterInfo &inout Model)
{
    return TEUIModelRef<FVM_MonsterInfo>(Model);
}
int __IndexOf_MonsterConfig()
{
    return 0;
}
int __IndexOf_DropItemList()
{
    return 1;
}
int __IndexOf_AttributeDamageTypes()
{
    return 2;
}
int __IndexOf_WeaknessDamageTypes()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_MonsterInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
