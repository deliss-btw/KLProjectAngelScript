
namespace FVM_Common_Center_Spend
{
    const int ModelId = 0;

}
struct FVM_Common_Center_Spend : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    FText m_Content;
    UPROPERTY()
    FText m_CostText;
    UPROPERTY()
    bool m_bNeedCostCoinTitle;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> m_CostItems;

    FVM_Common_Center_Spend()
    {
        this.m_bNeedCostCoinTitle = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Common_Center_Spend(const FVM_Common_Center_Spend &inout Other)
    {
        this.m_bNeedCostCoinTitle = false;
        this.m_Title = Other.m_Title;
        this.m_Content = Other.m_Content;
        this.m_CostText = Other.m_CostText;
        this.m_bNeedCostCoinTitle = Other.m_bNeedCostCoinTitle;
        this.m_CostItems = Other.m_CostItems;
        return;
    }
    FVM_Common_Center_Spend& opAssign(const FVM_Common_Center_Spend &inout Other)
    {
        this.m_Title = Other.m_Title;
        this.m_Content = Other.m_Content;
        this.m_CostText = Other.m_CostText;
        this.m_bNeedCostCoinTitle = Other.m_bNeedCostCoinTitle;
        return Other.m_CostItems;
    }
    FText GetTitle() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Title() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Title = __Value;
        return;
    }
    FText GetContent() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_Content() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetContent(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Content = __Value;
        return;
    }
    FText GetCostText() const property
    {
        FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_CostText() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCostText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CostText = __Value;
        return;
    }
    bool GetbNeedCostCoinTitle() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bNeedCostCoinTitle;
    }
    void SetbNeedCostCoinTitle(const bool __Value) property
    {
        if (!(this.m_bNeedCostCoinTitle) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bNeedCostCoinTitle = __Value;
        return;
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetCostItems() const property
    {
        TArray<TEUIModelRef<FVM_CommonRewardItem>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetModify_CostItems() property
    {
        TArray<TEUIModelRef<FVM_CommonRewardItem>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCostItems(const TArray<TEUIModelRef<FVM_CommonRewardItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CostItems = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Common_Center_Spend
{
    UPROPERTY()
    TEUIModelRef<FVM_Common_Center_Spend> Self;

    __GeneratedProperties_FVM_Common_Center_Spend()
    {
        return;
    }
}

namespace FVM_Common_Center_Spend
{
FVM_Common_Center_Spend& Create(const UObject ContextObject)
{
    return FVM_Common_Center_Spend::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Common_Center_Spend CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Common_Center_Spend __r;
    TEUIModelRef<FVM_Common_Center_Spend> local_6 = TEUIModelRef<FVM_Common_Center_Spend>(EUIInternal::MakeModelWithManager(Manager, FVM_Common_Center_Spend::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Content";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CostText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bNeedCostCoinTitle";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CostItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonRewardItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Common_Center_Spend>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Common_Center_Spend;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Common_Center_Spend;
}
FText __UIGetter_Title(const FVM_Common_Center_Spend &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Content(const FVM_Common_Center_Spend &inout Model)
{
    return Model.GetContent();
}
FText __UIGetter_CostText(const FVM_Common_Center_Spend &inout Model)
{
    return Model.GetCostText();
}
bool __UIGetter_bNeedCostCoinTitle(const FVM_Common_Center_Spend &inout Model)
{
    return Model.GetbNeedCostCoinTitle();
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_CostItems(const FVM_Common_Center_Spend &inout Model)
{
    return Model.GetCostItems();
}
TEUIModelRef<FVM_Common_Center_Spend> __UIGetter_Self(const FVM_Common_Center_Spend &inout Model)
{
    return TEUIModelRef<FVM_Common_Center_Spend>(Model);
}
int __IndexOf_Title()
{
    return 0;
}
int __IndexOf_Content()
{
    return 1;
}
int __IndexOf_CostText()
{
    return 2;
}
int __IndexOf_bNeedCostCoinTitle()
{
    return 3;
}
int __IndexOf_CostItems()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_Common_Center_Spend
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
