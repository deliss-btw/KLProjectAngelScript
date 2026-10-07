
namespace FVM_ItemOperationItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ExpandOperation = FEUIModelCallbackSignature();

}
struct FVM_ItemOperationItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    UItemOperationConfigBase m_ItemOperationConfig;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ItemData;
    UPROPERTY()
    TEUIModelWeakRef<FVM_ItemOperationList> m_OwningList;
    UPROPERTY()
    TWeakObjectPtr<UWidget> m_MyWidget;
    UPROPERTY()
    FCommonHoverHandle m_ExpandHoverHandle;

    FVM_ItemOperationItem()
    {
        this.m_ItemOperationConfig = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemOperationItem' by default constructor.");
        return;
    }
    FVM_ItemOperationItem(const FVM_ItemOperationItem &inout Other)
    {
        this.m_ItemOperationConfig = nullptr;
        this.m_ItemOperationConfig = Other.m_ItemOperationConfig;
        this.m_ItemData = Other.m_ItemData;
        this.m_OwningList = Other.m_OwningList;
        this.m_MyWidget = Other.m_MyWidget;
        return;
    }
    FVM_ItemOperationItem(const UItemOperationConfigBase InItemOperationConfig, const TEUIModelRef<FM_ItemData> &inout InItemData, const TEUIModelWeakRef<FVM_ItemOperationList> &inout InOwningList)
    {
        this.m_ItemOperationConfig = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemOperationConfig(InItemOperationConfig);
        this.SetItemData(InItemData);
        this.SetOwningList(InOwningList);
        return;
    }
    FVM_ItemOperationItem& opAssign(const FVM_ItemOperationItem &inout Other)
    {
        this.m_ItemOperationConfig = Other.m_ItemOperationConfig;
        this.m_ItemData = Other.m_ItemData;
        this.m_OwningList = Other.m_OwningList;
        return Other.m_MyWidget;
    }
    FEUIInputAction GetInputAction() const
    {
        UItemOperationConfigBase local_2 = this.GetItemOperationConfig();
        return local_2.InputAction;
    }
    FText GetOperationName() const
    {
        UItemOperationConfigBase local_2 = this.GetItemOperationConfig();
        return local_2.OperationName;
    }
    bool IsExpandable() const
    {
        return this.GetItemOperationConfig().IsExpandable();
    }
    bool IsExpanded() const
    {
        if (!(this.IsExpandable()))
        {
            return false;
        }
        return this.GetExpandHoverHandle().IsValid();
    }
    float32 GetDesiredRenderOpacity() const
    {
        FVM_ItemOperationList& local_6;
        if (this.IsExpanded())
        {
            return 1.0f;
        }
        TEUIModelWeakRef<FVM_ItemOperationList> local_4 = this.GetOwningList();
        if (local_6)
        {
            if (local_6.HasExpandedItem())
            {
                return 0.5f;
            }
        }
        return 1.0f;
    }
    int GetBorderIndex() const
    {
        if (this.HasAnyExpandedItem())
        {
            return 0;
        }
        return 1;
    }
    void ExpandOperation()
    {
        if (this.IsExpandable())
        {
            FItemOperationExpandInfo local_30 = this.GetItemOperationConfig().ExpandOperation(this.GetItemData());
            TWeakObjectPtr<UWidget> local_56 = this.GetMyWidget();
            UWidget local_58;
            this.SetExpandHoverHandle(::CommonPopup::HoverCustom(local_58, local_30.ContentWidget, local_30.ContentModels, true, true, ECommonHoverLayout(0), EEUILayoutLayer(0), false));
            FVM_ItemNumOperation& local_70 = FEUIModelContainer::GetModel(local_30.ContentModels).opCall();
            if (local_70)
            {
                local_70.SetMyHoverHandle(this.GetExpandHoverHandle());
            }
        }
        return;
    }
    void BeginDestroy()
    {
        if (this.GetExpandHoverHandle().IsValid())
        {
            ::CommonPopup::CloseHover(this.GetExpandHoverHandle(), this.GetManager(), true);
        }
        return;
    }
    bool HasAnyExpandedItem() const
    {
        FVM_ItemOperationList& local_4;
        TEUIModelWeakRef<FVM_ItemOperationList> local_2 = this.GetOwningList();
        if (local_4)
        {
            if (local_4.HasExpandedItem())
            {
                return true;
            }
        }
        return false;
    }
    UItemOperationConfigBase GetItemOperationConfig() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ItemOperationConfig;
    }
    void SetItemOperationConfig(const UItemOperationConfigBase __Value) property
    {
        if (this.m_ItemOperationConfig == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    TEUIModelRef<FM_ItemData> GetItemData() const property
    {
        this.TrackPropertyRead(1);
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
        this.MarkPropertyDirty(1);
        this.m_ItemData = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_ItemOperationList> GetOwningList() const property
    {
        this.TrackPropertyRead(2);
        return this.m_OwningList;
    }
    void SetOwningList(const TEUIModelWeakRef<FVM_ItemOperationList> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_ItemOperationList> local_2;
        local_2 = this.m_OwningList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_OwningList = __Value;
        return;
    }
    TWeakObjectPtr<UWidget> GetMyWidget() const property
    {
        this.TrackPropertyRead(3);
        return this.m_MyWidget;
    }
    void SetMyWidget(const TWeakObjectPtr<UWidget> &inout __Value) property
    {
        if ((this.m_MyWidget == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MyWidget = __Value;
        return;
    }
    const FCommonHoverHandle GetExpandHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FCommonHoverHandle GetModify_ExpandHoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetExpandHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        return;
    }
}

struct __GeneratedProperties_FVM_ItemOperationItem
{
    UPROPERTY()
    FEUIInputAction InputAction;
    UPROPERTY()
    FText OperationName;
    UPROPERTY()
    bool IsExpandable;
    UPROPERTY()
    bool IsExpanded;
    UPROPERTY()
    float32 DesiredRenderOpacity;
    UPROPERTY()
    int BorderIndex;
    UPROPERTY()
    TEUIModelRef<FVM_ItemOperationItem> Self;


}

namespace FVM_ItemOperationItem
{
FVM_ItemOperationItem& Create(const UObject ContextObject, const UItemOperationConfigBase ItemOperationConfig, const TEUIModelRef<FM_ItemData> &inout ItemData, const TEUIModelWeakRef<FVM_ItemOperationList> &inout OwningList)
{
    return FVM_ItemOperationItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemOperationConfig, ItemData, OwningList);
}
FVM_ItemOperationItem CreateByManager(const UEUIManagerSubsystem Manager, const UItemOperationConfigBase ItemOperationConfig, const TEUIModelRef<FM_ItemData> &inout ItemData, const TEUIModelWeakRef<FVM_ItemOperationList> &inout OwningList)
{
    FVM_ItemOperationItem __r;
    TEUIModelRef<FVM_ItemOperationItem> local_6 = TEUIModelRef<FVM_ItemOperationItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemOperationItem::ModelId, 0, ItemOperationConfig, ItemData, OwningList));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "InputAction";
    local_14.TypeName = "FEUIInputAction";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OperationName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsExpandable";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsExpanded";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DesiredRenderOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BorderIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemOperationItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemOperationItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemOperationItem;
}
FEUIInputAction __UIGetter_InputAction(const FVM_ItemOperationItem &inout Model)
{
    return Model.GetInputAction();
}
FText __UIGetter_OperationName(const FVM_ItemOperationItem &inout Model)
{
    return Model.GetOperationName();
}
bool __UIGetter_IsExpandable(const FVM_ItemOperationItem &inout Model)
{
    return Model.IsExpandable();
}
bool __UIGetter_IsExpanded(const FVM_ItemOperationItem &inout Model)
{
    return Model.IsExpanded();
}
float32 __UIGetter_DesiredRenderOpacity(const FVM_ItemOperationItem &inout Model)
{
    return Model.GetDesiredRenderOpacity();
}
int __UIGetter_BorderIndex(const FVM_ItemOperationItem &inout Model)
{
    return Model.GetBorderIndex();
}
TEUIModelRef<FVM_ItemOperationItem> __UIGetter_Self(const FVM_ItemOperationItem &inout Model)
{
    return TEUIModelRef<FVM_ItemOperationItem>(Model);
}
int __IndexOf_ItemOperationConfig()
{
    return 0;
}
int __IndexOf_ItemData()
{
    return 1;
}
int __IndexOf_OwningList()
{
    return 2;
}
int __IndexOf_MyWidget()
{
    return 3;
}
int __IndexOf_ExpandHoverHandle()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_ItemOperationItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
