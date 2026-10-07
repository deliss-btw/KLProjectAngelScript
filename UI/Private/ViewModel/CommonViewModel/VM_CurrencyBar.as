
namespace FVM_CurrencyBar
{
    const int ModelId = 0;

}
struct FVM_CurrencyBar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_CurrencyItemConfig;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_CurrencyItem;

    FVM_CurrencyBar()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CurrencyBar(const FVM_CurrencyBar &inout Other)
    {
        this.m_CurrencyItemConfig = Other.m_CurrencyItemConfig;
        this.m_CurrencyItem = Other.m_CurrencyItem;
        return;
    }
    FVM_CurrencyBar& opAssign(const FVM_CurrencyBar &inout Other)
    {
        this.m_CurrencyItemConfig = Other.m_CurrencyItemConfig;
        return Other.m_CurrencyItem;
    }
    void LoadConfig(const FConfigVM_CurrencyBar &inout InConfig)
    {
        this.SetCurrencyItemConfig(InConfig.CurrencyItemConfig);
        return;
    }
    void PostLoad()
    {
        if (!(!(!(this.GetCurrencyItem()))) && this.GetCurrencyItemConfig())
        {
            this.SetCurrencyItem(::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(this.GetCurrencyItemConfig()));
        }
        return;
    }
    int GetCurrencyNum() const
    {
        int local_5;
        if (this.GetCurrencyItem().IsValid())
        {
            local_5 = this.GetCurrencyItem().opArrow().GetNum();
        }
        else
        {
            local_5 = 0;
        }
        return local_5;
    }
    const TDataObjectPtr<FItemConfig> GetCurrencyItemConfig() const property
    {
        const TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_CurrencyItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCurrencyItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrencyItemConfig = __Value;
        return;
    }
    TEUIModelRef<FM_ItemData> GetCurrencyItem() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurrencyItem;
    }
    void SetCurrencyItem(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_CurrencyItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrencyItem = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CurrencyBar
{
    UPROPERTY()
    int CurrencyNum;
    UPROPERTY()
    TEUIModelRef<FVM_CurrencyBar> Self;


}

namespace FVM_CurrencyBar
{
FVM_CurrencyBar& Create(const UObject ContextObject)
{
    return FVM_CurrencyBar::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CurrencyBar CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CurrencyBar __r;
    TEUIModelRef<FVM_CurrencyBar> local_6 = TEUIModelRef<FVM_CurrencyBar>(EUIInternal::MakeModelWithManager(Manager, FVM_CurrencyBar::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrencyNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CurrencyBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CurrencyBar;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CurrencyBar;
}
int __UIGetter_CurrencyNum(const FVM_CurrencyBar &inout Model)
{
    return Model.GetCurrencyNum();
}
TEUIModelRef<FVM_CurrencyBar> __UIGetter_Self(const FVM_CurrencyBar &inout Model)
{
    return TEUIModelRef<FVM_CurrencyBar>(Model);
}
int __IndexOf_CurrencyItemConfig()
{
    return 0;
}
int __IndexOf_CurrencyItem()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CurrencyBar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
