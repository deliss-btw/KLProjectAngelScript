
namespace FVM_ItemGainWayItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClick = FEUIModelCallbackSignature();

}
struct FVM_ItemGainWayItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_ItemConfig;

    FVM_ItemGainWayItem()
    {
        this.m_Index = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemGainWayItem' by default constructor.");
        return;
    }
    FVM_ItemGainWayItem(const FVM_ItemGainWayItem &inout Other)
    {
        this.m_Index = 0;
        this.m_Index = int(Other.m_Index);
        this.m_ItemConfig = Other.m_ItemConfig;
        return;
    }
    FVM_ItemGainWayItem(const int InIndex, const TDataObjectPtr<FItemConfig> &inout InItemConfig)
    {
        this.m_Index = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndex(InIndex);
        this.SetItemConfig(InItemConfig);
        return;
    }
    FVM_ItemGainWayItem& opAssign(const FVM_ItemGainWayItem &inout Other)
    {
        this.m_Index = int(Other.m_Index);
        return Other.m_ItemConfig;
    }
    FText GetDisplayName() const
    {
        return this.GetItemConfig().opArrow().GainWays[this.GetIndex()].DisplayName;
    }
    bool IsExecutable() const
    {
        return !(this.GetItemConfig().opArrow().GainWays[this.GetIndex()].OpenPage.IsNull());
    }
    FEUIInputAction GetInputAction() const
    {
        TArray<FEUIInputAction> local_4 = ::UGlobalItemSettings::Get().ItemOperationSequencedInputActions;
        if (local_4.IsValidIndex(this.GetIndex()))
        {
            return local_4[this.GetIndex()];
        }
        return FEUIInputAction();
    }
    void OnClick()
    {
        TSoftClassPtr<UEUIUserWidget> local_4;
        int local_1 = this.GetIndex();
        if (!(local_4.IsNull()))
        {
            ::CommonPopup::CloseAllHover();
            FEUIWidget::AddWidgetByClass(this.GetContext().UELocalPlayer, local_4);
        }
        return;
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
    TDataObjectPtr<FItemConfig> GetItemConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_ItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ItemGainWayItem
{
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    bool IsExecutable;
    UPROPERTY()
    FEUIInputAction InputAction;
    UPROPERTY()
    TEUIModelRef<FVM_ItemGainWayItem> Self;


}

namespace FVM_ItemGainWayItem
{
FVM_ItemGainWayItem& Create(const UObject ContextObject, const int Index, const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    return FVM_ItemGainWayItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Index, ItemConfig);
}
FVM_ItemGainWayItem CreateByManager(const UEUIManagerSubsystem Manager, const int Index, const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    FVM_ItemGainWayItem __r;
    TEUIModelRef<FVM_ItemGainWayItem> local_6 = TEUIModelRef<FVM_ItemGainWayItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemGainWayItem::ModelId, 0, Index, ItemConfig));
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
    local_14.PropertyName = "IsExecutable";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "InputAction";
    local_14.TypeName = "FEUIInputAction";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemGainWayItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemGainWayItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemGainWayItem;
}
FText __UIGetter_DisplayName(const FVM_ItemGainWayItem &inout Model)
{
    return Model.GetDisplayName();
}
bool __UIGetter_IsExecutable(const FVM_ItemGainWayItem &inout Model)
{
    return Model.IsExecutable();
}
FEUIInputAction __UIGetter_InputAction(const FVM_ItemGainWayItem &inout Model)
{
    return Model.GetInputAction();
}
TEUIModelRef<FVM_ItemGainWayItem> __UIGetter_Self(const FVM_ItemGainWayItem &inout Model)
{
    return TEUIModelRef<FVM_ItemGainWayItem>(Model);
}
int __IndexOf_Index()
{
    return 0;
}
int __IndexOf_ItemConfig()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_ItemGainWayItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
