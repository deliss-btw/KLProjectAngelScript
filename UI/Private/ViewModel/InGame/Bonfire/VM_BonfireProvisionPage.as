
namespace FVM_BonfireProvisionPage
{
    const int ModelId = 0;

}
struct FVM_BonfireProvisionPage : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_TitleText;
    UPROPERTY()
    int m_CoinsAmount;
    UPROPERTY()
    int m_CoinsCost;
    UPROPERTY()
    TEUIModelRef<FVM_CommonConsume> m_CoinsConsume;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItemBar> m_CoinsAmountBar;

    FVM_BonfireProvisionPage()
    {
        this.m_TitleText = NSLOCTEXT("Title", "ењ°и„‰иЎҐз»™");
        this.m_CoinsAmount = 0;
        this.m_CoinsCost = 500;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_BonfireProvisionPage(const FVM_BonfireProvisionPage &inout Other)
    {
        this.m_TitleText = NSLOCTEXT("Title", "ењ°и„‰иЎҐз»™");
        this.m_CoinsAmount = 0;
        this.m_CoinsCost = 500;
        this.m_TitleText = Other.m_TitleText;
        this.m_CoinsAmount = int(Other.m_CoinsAmount);
        this.m_CoinsCost = int(Other.m_CoinsCost);
        this.m_CoinsConsume = Other.m_CoinsConsume;
        this.m_CoinsAmountBar = Other.m_CoinsAmountBar;
        return;
    }
    FVM_BonfireProvisionPage& opAssign(const FVM_BonfireProvisionPage &inout Other)
    {
        this.m_TitleText = Other.m_TitleText;
        this.m_CoinsAmount = int(Other.m_CoinsAmount);
        this.m_CoinsCost = int(Other.m_CoinsCost);
        this.m_CoinsConsume = Other.m_CoinsConsume;
        return Other.m_CoinsAmountBar;
    }
    void PostConstruct()
    {
        this.UpdateCoinsAmount();
        this.UpdateCoinsConsume();
        return;
    }
    TDataObjectPtr<FItemConfig> GetDisplayCoinConfig()
    {
        UAS_GameModeSettingsPVX local_8 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if (local_8 != nullptr)
        {
            int local_10 = 242;
            TDataObjectPtr<FItemConfig> local_36 = ::FItemConfig::GetByDataId(242);
            if (local_36)
            {
                return local_36;
            }
        }
        return ::UGlobalItemSettings::Get().CoinConfig;
    }
    void UpdateCoinsConsume()
    {
        int local_70 = 0;
        this.GetDisplayCoinConfig();
        TArray<FRewardItemEntry> local_52;
        local_52.Add(FRewardItemEntry(local_70, this.GetCoinsCost()));
        this.SetCoinsConsume(TEUIModelRef<FVM_CommonConsume>(::FVM_CommonConsume::Create(this.GetContext().Manager, local_52)));
        return;
    }
    void UpdateCoinsAmount()
    {
        this.SetCoinsAmountBar(TEUIModelRef<FVM_CommonItemBar>(::FVM_CommonItemBar::Create(this.GetContext().Manager)));
        TDataObjectPtr<FItemConfig> local_34 = this.GetDisplayCoinConfig();
        this.SetCoinsAmount(::InventoryUtils::GetInventoryItemNumber(FECSEntity(this.GetContext().GetLocalPlayerPawn()), local_34));
        TEUIModelRef<FVM_CommonItemBar> local_2 = this.GetCoinsAmountBar();
        local_34.SetupItemConfig();
        return;
    }
    FText GetTitleText() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_TitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TitleText = __Value;
        return;
    }
    int GetCoinsAmount() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CoinsAmount;
    }
    void SetCoinsAmount(const int __Value) property
    {
        if (this.m_CoinsAmount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CoinsAmount = __Value;
        return;
    }
    int GetCoinsCost() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CoinsCost;
    }
    void SetCoinsCost(const int __Value) property
    {
        if (this.m_CoinsCost == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CoinsCost = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonConsume> GetCoinsConsume() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CoinsConsume;
    }
    void SetCoinsConsume(const TEUIModelRef<FVM_CommonConsume> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonConsume> local_2;
        local_2 = this.m_CoinsConsume;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CoinsConsume = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonItemBar> GetCoinsAmountBar() const property
    {
        this.TrackPropertyRead(4);
        return this.m_CoinsAmountBar;
    }
    void SetCoinsAmountBar(const TEUIModelRef<FVM_CommonItemBar> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonItemBar> local_2;
        local_2 = this.m_CoinsAmountBar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CoinsAmountBar = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BonfireProvisionPage
{
    UPROPERTY()
    TEUIModelRef<FVM_BonfireProvisionPage> Self;

    __GeneratedProperties_FVM_BonfireProvisionPage()
    {
        return;
    }
}

namespace FVM_BonfireProvisionPage
{
FVM_BonfireProvisionPage& Create(const UObject ContextObject)
{
    return FVM_BonfireProvisionPage::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_BonfireProvisionPage CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_BonfireProvisionPage __r;
    TEUIModelRef<FVM_BonfireProvisionPage> local_6 = TEUIModelRef<FVM_BonfireProvisionPage>(EUIInternal::MakeModelWithManager(Manager, FVM_BonfireProvisionPage::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CoinsAmount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CoinsCost";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CoinsConsume";
    local_14.TypeName = "TEUIModelRef<FVM_CommonConsume>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CoinsAmountBar";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItemBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BonfireProvisionPage>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BonfireProvisionPage;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BonfireProvisionPage;
}
FText __UIGetter_TitleText(const FVM_BonfireProvisionPage &inout Model)
{
    return Model.GetTitleText();
}
int __UIGetter_CoinsAmount(const FVM_BonfireProvisionPage &inout Model)
{
    return Model.GetCoinsAmount();
}
int __UIGetter_CoinsCost(const FVM_BonfireProvisionPage &inout Model)
{
    return Model.GetCoinsCost();
}
TEUIModelRef<FVM_CommonConsume> __UIGetter_CoinsConsume(const FVM_BonfireProvisionPage &inout Model)
{
    return Model.GetCoinsConsume();
}
TEUIModelRef<FVM_CommonItemBar> __UIGetter_CoinsAmountBar(const FVM_BonfireProvisionPage &inout Model)
{
    return Model.GetCoinsAmountBar();
}
TEUIModelRef<FVM_BonfireProvisionPage> __UIGetter_Self(const FVM_BonfireProvisionPage &inout Model)
{
    return TEUIModelRef<FVM_BonfireProvisionPage>(Model);
}
int __IndexOf_TitleText()
{
    return 0;
}
int __IndexOf_CoinsAmount()
{
    return 1;
}
int __IndexOf_CoinsCost()
{
    return 2;
}
int __IndexOf_CoinsConsume()
{
    return 3;
}
int __IndexOf_CoinsAmountBar()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_BonfireProvisionPage
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
