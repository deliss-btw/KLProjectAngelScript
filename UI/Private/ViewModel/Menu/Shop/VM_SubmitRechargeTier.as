
namespace FVM_SubmitRechargeTier
{
    const int ModelId = 0;

}
struct FVM_SubmitRechargeTier : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FSubmitRechargeTierConfig> m_Config;

    FVM_SubmitRechargeTier()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SubmitRechargeTier' by default constructor.");
        return;
    }
    FVM_SubmitRechargeTier(const FVM_SubmitRechargeTier &inout Other)
    {
        this.m_Config = Other.m_Config;
        return;
    }
    FVM_SubmitRechargeTier(const TDataObjectPtr<FSubmitRechargeTierConfig> &inout InConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetConfig(InConfig);
        return;
    }
    FVM_SubmitRechargeTier& opAssign(const FVM_SubmitRechargeTier &inout Other)
    {
        return Other.m_Config;
    }
    int GetTierId() const
    {
        int local_3 = 0;
        return this.GetConfig().IsSet() ? local_3 : 0;
    }
    int GetCurrencyAmount() const
    {
        int local_3 = 0;
        return this.GetConfig().IsSet() ? local_3 : 0;
    }
    FText GetCurrencyAmountText() const
    {
        return FText::AsNumber(this.GetCurrencyAmount(), FNumberFormattingOptions::DefaultNoGrouping());
    }
    int GetPriceAmount() const
    {
        int local_3 = 0;
        return this.GetConfig().IsSet() ? local_3 : 0;
    }
    FText GetPriceAmountText() const
    {
        return FText::AsNumber(this.GetPriceAmount(), FNumberFormattingOptions::DefaultNoGrouping());
    }
    FSoftBrush GetIcon() const
    {
        FSoftBrush local_92;
        if (this.GetConfig().IsSet())
        {
        }
        else
        {
            local_92 = FSoftBrush();
        }
        return local_92;
    }
    FSoftBrush GetVoucherIcon() const
    {
        TDataObjectPtr<FItemConfig> local_4 = ::UGlobalItemSettings::Get().VoucherConfig;
        FSoftBrush local_96;
        if (local_4.IsSet())
        {
        }
        else
        {
            local_96 = FSoftBrush();
        }
        return local_96;
    }
    void GrantVoucherReward()
    {
        int local_8 = 0;
        int local_10 = 0;
        TDataObjectPtr<FItemConfig> local_4 = ::UGlobalItemSettings::Get().VoucherConfig;
        if (local_4.IsSet() && this.GetConfig().IsSet())
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("ClientGmTalk Item Add ").Append(local_8).Append(" ").Append(local_10), nullptr);
        }
        return;
    }
    TDataObjectPtr<FSubmitRechargeTierConfig> GetConfig() const property
    {
        TDataObjectPtr<FSubmitRechargeTierConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FSubmitRechargeTierConfig> GetModify_Config() property
    {
        TDataObjectPtr<FSubmitRechargeTierConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FSubmitRechargeTierConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Config = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SubmitRechargeTier
{
    UPROPERTY()
    int TierId;
    UPROPERTY()
    int CurrencyAmount;
    UPROPERTY()
    FText CurrencyAmountText;
    UPROPERTY()
    int PriceAmount;
    UPROPERTY()
    FText PriceAmountText;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FSoftBrush VoucherIcon;
    UPROPERTY()
    TEUIModelRef<FVM_SubmitRechargeTier> Self;


}

namespace FVM_SubmitRechargeTier
{
FVM_SubmitRechargeTier& Create(const UObject ContextObject, const TDataObjectPtr<FSubmitRechargeTierConfig> &inout Config)
{
    return FVM_SubmitRechargeTier::CreateByManager(EUIInternal::GetContextManager(ContextObject), Config);
}
FVM_SubmitRechargeTier CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FSubmitRechargeTierConfig> &inout Config)
{
    FVM_SubmitRechargeTier __r;
    TEUIModelRef<FVM_SubmitRechargeTier> local_6 = TEUIModelRef<FVM_SubmitRechargeTier>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SubmitRechargeTier::ModelId, 0, Config));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TierId";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrencyAmount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrencyAmountText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PriceAmount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PriceAmountText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VoucherIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SubmitRechargeTier>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SubmitRechargeTier;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SubmitRechargeTier;
}
int __UIGetter_TierId(const FVM_SubmitRechargeTier &inout Model)
{
    return Model.GetTierId();
}
int __UIGetter_CurrencyAmount(const FVM_SubmitRechargeTier &inout Model)
{
    return Model.GetCurrencyAmount();
}
FText __UIGetter_CurrencyAmountText(const FVM_SubmitRechargeTier &inout Model)
{
    return Model.GetCurrencyAmountText();
}
int __UIGetter_PriceAmount(const FVM_SubmitRechargeTier &inout Model)
{
    return Model.GetPriceAmount();
}
FText __UIGetter_PriceAmountText(const FVM_SubmitRechargeTier &inout Model)
{
    return Model.GetPriceAmountText();
}
FSoftBrush __UIGetter_Icon(const FVM_SubmitRechargeTier &inout Model)
{
    return Model.GetIcon();
}
FSoftBrush __UIGetter_VoucherIcon(const FVM_SubmitRechargeTier &inout Model)
{
    return Model.GetVoucherIcon();
}
TEUIModelRef<FVM_SubmitRechargeTier> __UIGetter_Self(const FVM_SubmitRechargeTier &inout Model)
{
    return TEUIModelRef<FVM_SubmitRechargeTier>(Model);
}
int __IndexOf_Config()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_SubmitRechargeTier
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
