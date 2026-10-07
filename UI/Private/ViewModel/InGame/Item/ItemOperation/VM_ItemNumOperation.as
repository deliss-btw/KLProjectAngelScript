
namespace FVM_ItemNumOperation
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ExecuteOperation = FEUIModelCallbackSignature();

}
struct FVM_ItemNumOperation : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ItemData;
    UPROPERTY()
    const UItemOperationConfig_NumOperationBase m_OperationConfig;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_ResultPreview;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ItemSumData;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    FText m_ButtonName;
    UPROPERTY()
    TEUIModelRef<FVM_QualitySelector> m_QualitySelector;
    UPROPERTY()
    FCommonHoverHandle m_MyHoverHandle;

    FVM_ItemNumOperation()
    {
        this.m_OperationConfig = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemNumOperation' by default constructor.");
        return;
    }
    FVM_ItemNumOperation(const FVM_ItemNumOperation &inout Other)
    {
        this.m_OperationConfig = nullptr;
        this.m_ItemData = Other.m_ItemData;
        this.m_OperationConfig = Other.m_OperationConfig;
        this.m_ResultPreview = Other.m_ResultPreview;
        this.m_ItemSumData = Other.m_ItemSumData;
        this.m_Title = Other.m_Title;
        this.m_ButtonName = Other.m_ButtonName;
        this.m_QualitySelector = Other.m_QualitySelector;
        return;
    }
    FVM_ItemNumOperation(const TEUIModelRef<FM_ItemData> &inout InItemData, const UItemOperationConfig_NumOperationBase InOperationConfig, const TEUIModelRef<FVM_CommonRewardList> &inout InResultPreview)
    {
        this.m_OperationConfig = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemData(InItemData);
        this.SetOperationConfig(InOperationConfig);
        this.SetResultPreview(InResultPreview);
        return;
    }
    FVM_ItemNumOperation& opAssign(const FVM_ItemNumOperation &inout Other)
    {
        this.m_ItemData = Other.m_ItemData;
        this.m_OperationConfig = Other.m_OperationConfig;
        this.m_ResultPreview = Other.m_ResultPreview;
        this.m_ItemSumData = Other.m_ItemSumData;
        this.m_Title = Other.m_Title;
        this.m_ButtonName = Other.m_ButtonName;
        return Other.m_QualitySelector;
    }
    void PostConstruct()
    {
        int local_11;
        this.SetTitle(this.GetOperationConfig().ExpandTitle);
        this.SetButtonName(this.GetOperationConfig().ExpandButtonName);
        this.SetItemSumData(::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(this.GetItemData().opArrow().GetConfig()));
        this.SetQualitySelector(TEUIModelRef<FVM_QualitySelector>(::FVM_QualitySelector::Create(this.GetContext().Manager)));
        this.GetQualitySelector().opArrow().SetMinNum(1);
        TEUIModelRef<FM_ItemData> local_4 = this.GetItemData();
        if (::ItemConfigUtils::IsStackable(GetConfig()))
        {
            local_11 = this.GetItemSumData().opArrow().GetNum();
        }
        else
        {
            local_11 = 1;
        }
        this.GetQualitySelector().opArrow().SetMaxNum(local_11);
        this.UpdateResultPreview();
        return;
    }
    void ExecuteOperation()
    {
        this.GetOperationConfig().ExecuteOperation(this.GetItemData(), this.GetQualitySelector().opArrow().GetCurrentNum());
        ::CommonPopup::CloseHover(this.GetMyHoverHandle(), this.GetManager(), false);
        return;
    }
    void OnCurrentNumChanged()
    {
        this.UpdateResultPreview();
        return;
    }
    void OnItemSumDataNumChanged()
    {
        int local_5;
        TEUIModelRef<FM_ItemData> local_2 = this.GetItemData();
        if (::ItemConfigUtils::IsStackable(GetConfig()))
        {
            local_5 = this.GetItemSumData().opArrow().GetNum();
        }
        else
        {
            local_5 = 1;
        }
        this.GetQualitySelector().opArrow().SetMaxNum(local_5);
        return;
    }
    void UpdateResultPreview()
    {
        if (this.GetResultPreview())
        {
            this.GetResultPreview().opArrow().SetItemMultiplier(this.GetQualitySelector().opArrow().GetCurrentNum());
        }
        return;
    }
    TEUIModelRef<FM_ItemData> GetItemData() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ItemData;
    }
    void SetItemData(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_ItemData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemData = __Value;
        return;
    }
    UItemOperationConfig_NumOperationBase GetOperationConfig() const property
    {
        this.TrackPropertyRead(1);
        return this.m_OperationConfig;
    }
    void SetOperationConfig(const UItemOperationConfig_NumOperationBase __Value) property
    {
        if (this.m_OperationConfig == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    TEUIModelRef<FVM_CommonRewardList> GetResultPreview() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ResultPreview;
    }
    void SetResultPreview(const TEUIModelRef<FVM_CommonRewardList> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonRewardList> local_2;
        local_2 = this.m_ResultPreview;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ResultPreview = __Value;
        return;
    }
    TEUIModelRef<FM_ItemData> GetItemSumData() const property
    {
        this.TrackPropertyRead(3);
        return this.m_ItemSumData;
    }
    void SetItemSumData(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_ItemSumData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ItemSumData = __Value;
        return;
    }
    FText GetTitle() const property
    {
        FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_Title() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Title = __Value;
        return;
    }
    const FText GetButtonName() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_ButtonName() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetButtonName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ButtonName = __Value;
        return;
    }
    TEUIModelRef<FVM_QualitySelector> GetQualitySelector() const property
    {
        this.TrackPropertyRead(6);
        return this.m_QualitySelector;
    }
    void SetQualitySelector(const TEUIModelRef<FVM_QualitySelector> &inout __Value) property
    {
        TEUIModelRef<FVM_QualitySelector> local_2;
        local_2 = this.m_QualitySelector;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_QualitySelector = __Value;
        return;
    }
    const FCommonHoverHandle GetMyHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FCommonHoverHandle GetModify_MyHoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetMyHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        return;
    }
}

struct __GeneratedProperties_FVM_ItemNumOperation
{
    UPROPERTY()
    TEUIModelRef<FVM_ItemNumOperation> Self;

    __GeneratedProperties_FVM_ItemNumOperation()
    {
        return;
    }
}

namespace FVM_ItemNumOperation
{
FVM_ItemNumOperation& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout ItemData, const UItemOperationConfig_NumOperationBase OperationConfig, const TEUIModelRef<FVM_CommonRewardList> &inout ResultPreview)
{
    return FVM_ItemNumOperation::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemData, OperationConfig, ResultPreview);
}
FVM_ItemNumOperation CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout ItemData, const UItemOperationConfig_NumOperationBase OperationConfig, const TEUIModelRef<FVM_CommonRewardList> &inout ResultPreview)
{
    FVM_ItemNumOperation __r;
    TEUIModelRef<FVM_ItemNumOperation> local_6 = TEUIModelRef<FVM_ItemNumOperation>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemNumOperation::ModelId, 0, ItemData, OperationConfig, ResultPreview));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemNumOperation;
}
void __OnCurrentNumChanged(FVM_ItemNumOperation &inout Model)
{
    Model.OnCurrentNumChanged();
    return;
}
void __OnItemSumDataNumChanged(FVM_ItemNumOperation &inout Model)
{
    Model.OnItemSumDataNumChanged();
    return;
}
TEUIModelRef<FVM_CommonRewardList> __UIGetter_ResultPreview(const FVM_ItemNumOperation &inout Model)
{
    return Model.GetResultPreview();
}
FText __UIGetter_Title(const FVM_ItemNumOperation &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_ButtonName(const FVM_ItemNumOperation &inout Model)
{
    return Model.GetButtonName();
}
TEUIModelRef<FVM_QualitySelector> __UIGetter_QualitySelector(const FVM_ItemNumOperation &inout Model)
{
    return Model.GetQualitySelector();
}
TEUIModelRef<FVM_ItemNumOperation> __UIGetter_Self(const FVM_ItemNumOperation &inout Model)
{
    return TEUIModelRef<FVM_ItemNumOperation>(Model);
}
int __IndexOf_ItemData()
{
    return 0;
}
int __IndexOf_OperationConfig()
{
    return 1;
}
int __IndexOf_ResultPreview()
{
    return 2;
}
int __IndexOf_ItemSumData()
{
    return 3;
}
int __IndexOf_Title()
{
    return 4;
}
int __IndexOf_ButtonName()
{
    return 5;
}
int __IndexOf_QualitySelector()
{
    return 6;
}
int __IndexOf_MyHoverHandle()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_ItemNumOperation
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
