
namespace FVM_ItemOperationList
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnItemClicked = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HideList = FEUIModelCallbackSignature();

}
struct FVM_ItemOperationList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ItemDataModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ItemOperationItem>> m_OperationItems;
    UPROPERTY()
    bool m_bShowList;

    FVM_ItemOperationList()
    {
        this.m_bShowList = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemOperationList' by default constructor.");
        return;
    }
    FVM_ItemOperationList(const FVM_ItemOperationList &inout Other)
    {
        this.m_bShowList = false;
        this.m_ItemDataModel = Other.m_ItemDataModel;
        this.m_OperationItems = Other.m_OperationItems;
        this.m_bShowList = Other.m_bShowList;
        return;
    }
    FVM_ItemOperationList(const TEUIModelRef<FM_ItemData> &inout InItemDataModel)
    {
        this.m_bShowList = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemDataModel(InItemDataModel);
        return;
    }
    FVM_ItemOperationList opAssign(const FVM_ItemOperationList &inout Other)
    {
        FVM_ItemOperationList __r;
        this.m_ItemDataModel = Other.m_ItemDataModel;
        this.m_OperationItems = Other.m_OperationItems;
        this.m_bShowList = Other.m_bShowList;
        return __r;
    }
    void PostConstruct()
    {
        for (auto& local_18 : ::UGlobalItemSettings::Get().ItemOperationConfigs)
        {
            if (local_18.ShowOperationForItem(this.GetItemDataModel()))
            {
                TEUIModelRef<FVM_ItemOperationItem> local_24 = TEUIModelRef<FVM_ItemOperationItem>(::FVM_ItemOperationItem::Create(this.GetContext().Manager, local_18, this.GetItemDataModel(), (TEUIModelWeakRef<FVM_ItemOperationList>(this))));
                this.GetModify_OperationItems().Add(local_24);
            }
        }
        return;
    }
    bool HasExpandedItem() const
    {
        for (auto& local_16 : this.GetOperationItems())
        {
            local_16;
            if (IsExpanded())
            {
                return true;
            }
        }
        return false;
    }
    bool HasAnyOperation() const
    {
        return !(this.GetOperationItems().IsEmpty());
    }
    bool GetShowList() const
    {
        return this.GetbShowList() && this.HasAnyOperation();
    }
    float32 GetShowListActionOpacity() const
    {
        return this.GetbShowList() ? 0.5f : 1.0f;
    }
    TEUIModelRef<FVM_ItemOperationList> GetModelRef() const
    {
        return TEUIModelRef<FVM_ItemOperationList>(this);
    }
    void OnItemClicked(const FEUIModelContainer &inout ListItem)
    {
        FEUIModelContainer::GetModel(ListItem).opCall().ExpandOperation();
        return;
    }
    void HideList()
    {
        this.SetbShowList(false);
        return;
    }
    TEUIModelRef<FM_ItemData> GetItemDataModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ItemDataModel;
    }
    void SetItemDataModel(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_ItemDataModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemDataModel = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ItemOperationItem>> GetOperationItems() const property
    {
        const TArray<TEUIModelRef<FVM_ItemOperationItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ItemOperationItem>> GetModify_OperationItems() property
    {
        TArray<TEUIModelRef<FVM_ItemOperationItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetOperationItems(const TArray<TEUIModelRef<FVM_ItemOperationItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_OperationItems = __Value;
        return;
    }
    bool GetbShowList() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bShowList;
    }
    void SetbShowList(const bool __Value) property
    {
        if (!(this.m_bShowList) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bShowList = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ItemOperationList
{
    UPROPERTY()
    bool HasAnyOperation;
    UPROPERTY()
    bool ShowList;
    UPROPERTY()
    float32 ShowListActionOpacity;
    UPROPERTY()
    TEUIModelRef<FVM_ItemOperationList> ModelRef;
    UPROPERTY()
    TEUIModelRef<FVM_ItemOperationList> Self;


}

namespace FVM_ItemOperationList
{
FVM_ItemOperationList& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
{
    return FVM_ItemOperationList::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemDataModel);
}
FVM_ItemOperationList CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
{
    FVM_ItemOperationList __r;
    TEUIModelRef<FVM_ItemOperationList> local_6 = TEUIModelRef<FVM_ItemOperationList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemOperationList::ModelId, 0, ItemDataModel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "OperationItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ItemOperationItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAnyOperation";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowList";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowListActionOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ModelRef";
    local_14.TypeName = "TEUIModelRef<FVM_ItemOperationList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemOperationList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemOperationList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemOperationList;
}
TArray<TEUIModelRef<FVM_ItemOperationItem>> __UIGetter_OperationItems(const FVM_ItemOperationList &inout Model)
{
    return Model.GetOperationItems();
}
bool __UIGetter_HasAnyOperation(const FVM_ItemOperationList &inout Model)
{
    return Model.HasAnyOperation();
}
bool __UIGetter_ShowList(const FVM_ItemOperationList &inout Model)
{
    return Model.GetShowList();
}
float32 __UIGetter_ShowListActionOpacity(const FVM_ItemOperationList &inout Model)
{
    return Model.GetShowListActionOpacity();
}
TEUIModelRef<FVM_ItemOperationList> __UIGetter_ModelRef(const FVM_ItemOperationList &inout Model)
{
    return Model.GetModelRef();
}
TEUIModelRef<FVM_ItemOperationList> __UIGetter_Self(const FVM_ItemOperationList &inout Model)
{
    return TEUIModelRef<FVM_ItemOperationList>(Model);
}
int __IndexOf_ItemDataModel()
{
    return 0;
}
int __IndexOf_OperationItems()
{
    return 1;
}
int __IndexOf_bShowList()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_ItemOperationList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
