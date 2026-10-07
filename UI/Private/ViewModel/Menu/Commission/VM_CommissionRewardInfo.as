
namespace FVM_CommissionRewardInfo
{
    const int ModelId = 0;

}
struct FVM_CommissionRewardInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Commission> m_CommissionModel;
    UPROPERTY()
    TArray<FEUIModelContainer> m_AllRewardItems;

    FVM_CommissionRewardInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionRewardInfo' by default constructor.");
        return;
    }
    FVM_CommissionRewardInfo(const FVM_CommissionRewardInfo &inout Other)
    {
        this.m_CommissionModel = Other.m_CommissionModel;
        this.m_AllRewardItems = Other.m_AllRewardItems;
        return;
    }
    FVM_CommissionRewardInfo(const TEUIModelRef<FM_Commission> &inout InCommissionModel)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommissionModel(InCommissionModel);
        return;
    }
    FVM_CommissionRewardInfo& opAssign(const FVM_CommissionRewardInfo &inout Other)
    {
        this.m_CommissionModel = Other.m_CommissionModel;
        return Other.m_AllRewardItems;
    }
    void PostConstruct()
    {
        this.BuildAllRewardItems();
        return;
    }
    bool HasFirstTimeReward() const
    {
        return this.GetCommissionModel().opArrow().GetCommissionConfig().opArrow().GetSpecialRewardConfig() && (this.GetCommissionModel().opArrow().GetFinishCount() <= 0);
    }
    bool HasRewardUpFromWeather() const
    {
        TEUIModelRef<FM_Commission> local_2 = this.GetCommissionModel();
        if (int(local_2.opArrow().GetCommissionConfig().opArrow().CommissionType) == 5)
        {
            return false;
        }
        TEUIModelRef<FM_Commission> local_2_2 = this.GetCommissionModel();
        TDataObjectPtr<FWeatherConfig> local_30 = local_2_2.opArrow().GetWeatherConfig();
        if (local_30)
        {
            return local_30.opArrow().bCommissionRewardUp;
        }
        return false;
    }
    bool IsRaceCommission() const
    {
        TEUIModelRef<FM_Commission> local_2 = this.GetCommissionModel();
        if (!(local_2.opArrow().GetCommissionConfig()))
        {
            return false;
        }
        TEUIModelRef<FM_Commission> local_2_2 = this.GetCommissionModel();
        return (int(local_2_2.opArrow().GetCommissionConfig().opArrow().CommissionType) == 5);
    }
    void BuildAllRewardItems()
    {
        int local_168 = 0;
        this.GetModify_AllRewardItems().Empty(0);
        FCommonRewardListBuilder local_6;
        if (this.HasFirstTimeReward())
        {
            local_6.FromRewardConfig(this.GetCommissionModel().opArrow().GetCommissionConfig().opArrow().GetSpecialRewardConfig(), n"CommissionFirstTime", FText(), 1, false);
        }
        int local_16 = int(::CommissionUtils::GetCommissionSettings().MainObjectiveScore);
        TDataObjectPtr<FRewardConfig> local_42 = this.GetCommissionModel().opArrow().GetCommissionConfig().opArrow().GetMedalRewardConfig();
        if (local_42)
        {
            local_6.FromRewardConfig(local_42, n"CommissionFloat", FText(), local_16, false);
        }
        TEUIModelRef<FM_Commission> local_10_2 = this.GetCommissionModel();
        TDataObjectPtr<FDropItemConfigBase> local_90 = local_10_2.opArrow().GetCommissionConfig().opArrow().GetCommissionReward();
        if (local_90)
        {
            this.AddDropRewardItems(local_6, local_90);
        }
        TArray<TEUIModelRef<FM_CommissionTier>> local_118 = this.GetCommissionModel().opArrow().GetCommissionTiers();
        for (auto& local_136 : local_118)
        {
            int local_139 = int(local_136.opArrow().GetTier());
            FName local_141 = this.GetTierTagKey(ECommissionTier(local_139));
            FText local_150;
            if (local_136.opArrow().GetCommissionTierConfig())
            {
                local_150 = local_136.opArrow().GetCommissionTierConfig().opArrow().TierName;
            }
            else
            {
                local_150 = FText();
            }
            local_139 = int(local_136.opArrow().GetTier());
            bool local_7 = this.GetCommissionModel().opArrow().IsTierAchieved();
            for (auto& local_166 : local_136.opArrow().GetRewardItems())
            {
                if (local_166.opArrow().GetConfig().IsSet())
                {
                    local_6.AddItemWithSortOverride(local_168, local_166.opArrow().GetNum(), 0.0f, 0, local_141, local_150, local_7);
                }
            }
        }
        for (auto& local_186 : local_6.Build())
        {
            TDataObjectPtr<FItemConfig> local_234 = ::FItemConfig::GetByDataId(int(local_186.ItemId));
            if (!(local_234))
            {
                continue;
            }
            FM_ItemData& local_236 = ::FM_ItemData::Create(this.GetContext().Manager);
            local_236.SetConfig(local_234);
            local_236.SetNum(int(local_186.Count));
            this.GetModify_AllRewardItems().Add(this.MakeTaggedRewardContainer(TEUIModelRef<FM_ItemData>(local_236), local_186.TagKey, local_186.TagText, local_186.bClaimed));
        }
        return;
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
    FName GetTierTagKey(const ECommissionTier Tier) const
    {
        switch (int(Tier))
        {
        case 1:
        {
            return n"CommissionTierSPlusPlus";
        }
        case 2:
        {
            return n"CommissionTierSPlus";
        }
        case 3:
        {
            return n"CommissionTierS";
        }
        case 4:
        {
            return n"CommissionTierA";
        }
        case 5:
        {
            return n"CommissionTierB";
        }
        case 6:
        {
            return n"CommissionTierC";
        }
        case 7:
        {
            return n"CommissionTierD";
        }
        }
        return n"CommissionTier";
    }
    FEUIModelContainer MakeTaggedRewardContainer(const TEUIModelRef<FM_ItemData> &inout ItemData, const FName &inout TagKey, const FText &inout TagText, const bool bClaimed)
    {
        FEUIModelContainer local_14;
        FVM_Item& local_16 = ::FVM_Item::Create(this.GetContext().Manager, ItemData);
        if ((TagKey == n"CommissionDrop"))
        {
            local_16.SetNumStyle(EItemViewModelNumStyle(1));
        }
        local_14.AddModel(FEUIModelRef(local_16), false);
        TEUIModelRef<FVM_CommonRewardItem> local_26 = TEUIModelRef<FVM_CommonRewardItem>(::FVM_CommonRewardItem::Create(this.GetContext().Manager, local_14, false));
        bClaimed.SetIsClaimed();
        TEUIModelRef<FVM_ComposableItem> local_28;
        local_28.GetComposableItemVM();
        if (local_28.IsValid())
        {
            local_28.GetComposableItemVM();
            ::ComposableItemUtility::SetIsShowTag(!(::RewardSortUtils::ResolveTagDisplayText(TagKey, TagText).IsEmpty()));
            if ((TagKey == n"CommissionDrop"))
            {
            }
        }
        FEUIModelContainer local_52;
        local_52.AddModel(local_26.opImplConv(), false);
        return local_52;
    }
    TEUIModelRef<FM_Commission> GetCommissionModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommissionModel;
    }
    void SetCommissionModel(const TEUIModelRef<FM_Commission> &inout __Value) property
    {
        TEUIModelRef<FM_Commission> local_2;
        local_2 = this.m_CommissionModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionModel = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetAllRewardItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_AllRewardItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAllRewardItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AllRewardItems = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionRewardInfo
{
    UPROPERTY()
    bool HasFirstTimeReward;
    UPROPERTY()
    bool HasRewardUpFromWeather;
    UPROPERTY()
    bool IsRaceCommission;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionRewardInfo> Self;


}

namespace FVM_CommissionRewardInfo
{
FVM_CommissionRewardInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Commission> &inout CommissionModel)
{
    return FVM_CommissionRewardInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommissionModel);
}
FVM_CommissionRewardInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Commission> &inout CommissionModel)
{
    FVM_CommissionRewardInfo __r;
    TEUIModelRef<FVM_CommissionRewardInfo> local_6 = TEUIModelRef<FVM_CommissionRewardInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionRewardInfo::ModelId, 0, CommissionModel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AllRewardItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasFirstTimeReward";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasRewardUpFromWeather";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsRaceCommission";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionRewardInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionRewardInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionRewardInfo;
}
TArray<FEUIModelContainer> __UIGetter_AllRewardItems(const FVM_CommissionRewardInfo &inout Model)
{
    return Model.GetAllRewardItems();
}
bool __UIGetter_HasFirstTimeReward(const FVM_CommissionRewardInfo &inout Model)
{
    return Model.HasFirstTimeReward();
}
bool __UIGetter_HasRewardUpFromWeather(const FVM_CommissionRewardInfo &inout Model)
{
    return Model.HasRewardUpFromWeather();
}
bool __UIGetter_IsRaceCommission(const FVM_CommissionRewardInfo &inout Model)
{
    return Model.IsRaceCommission();
}
TEUIModelRef<FVM_CommissionRewardInfo> __UIGetter_Self(const FVM_CommissionRewardInfo &inout Model)
{
    return TEUIModelRef<FVM_CommissionRewardInfo>(Model);
}
int __IndexOf_CommissionModel()
{
    return 0;
}
int __IndexOf_AllRewardItems()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CommissionRewardInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
