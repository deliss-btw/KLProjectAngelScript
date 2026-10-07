
namespace FVM_ItemAction
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature UseItem = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature DropItem = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature DestroyItem = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature EquipItem = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnMainAction = FEUIModelCallbackSignature();

}
struct FVM_ItemAction : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_ItemConfig;
    UPROPERTY()
    FItemActionSource m_ItemActionSource;
    UPROPERTY()
    TArray<FEUIModelRef> m_ItemActionButtons;
    UPROPERTY()
    TEUIModelRef<FVM_InputAction> m_MainActionButton;
    UPROPERTY()
    EItemActionType m_MainActionType;

    FVM_ItemAction()
    {
        this.m_MainActionType = EItemActionType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemAction' by default constructor.");
        return;
    }
    FVM_ItemAction(const FVM_ItemAction &inout Other)
    {
        this.m_MainActionType = EItemActionType(0);
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_ItemActionSource = Other.m_ItemActionSource;
        this.m_ItemActionButtons = Other.m_ItemActionButtons;
        this.m_MainActionButton = Other.m_MainActionButton;
        this.m_MainActionType = Other.m_MainActionType;
        return;
    }
    FVM_ItemAction(const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_ItemAction opAssign(const FVM_ItemAction &inout Other)
    {
        FVM_ItemAction __r;
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_ItemActionSource = Other.m_ItemActionSource;
        this.m_ItemActionButtons = Other.m_ItemActionButtons;
        this.m_MainActionButton = Other.m_MainActionButton;
        this.m_MainActionType = Other.m_MainActionType;
        return __r;
    }
    bool HasMainAction() const
    {
        return this.GetMainActionButton().IsValid();
    }
    void SetCustomMainAction(const FEUIInputAction &inout InInputAction, const FSimpleModelEvent &inout InOnExecute)
    {
        this.SetMainActionButton(TEUIModelRef<FVM_InputAction>(::FVM_InputAction::Create(this.GetContext().Manager, InInputAction, InOnExecute)));
        return;
    }
    void UseItem()
    {
        this.OnItemAction(EItemActionType(0));
        return;
    }
    void DropItem()
    {
        this.OnItemAction(EItemActionType(1));
        return;
    }
    void DestroyItem()
    {
        this.OnItemAction(EItemActionType(2));
        return;
    }
    void EquipItem()
    {
        this.OnItemAction(EItemActionType(3));
        return;
    }
    void OnMainAction()
    {
        this.OnItemAction(this.GetMainActionType());
        return;
    }
    void OnItemAction(const EItemActionType ItemActionType)
    {
        ::ItemActionUtils::ExecuteActionFromUI(this.GetItemConfig(), this.GetItemActionSource());
        return;
    }
    TDataObjectPtr<FItemConfig> GetItemConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_ItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemConfig = __Value;
        return;
    }
    const FItemActionSource GetItemActionSource() const property
    {
        const FItemActionSource __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FItemActionSource GetModify_ItemActionSource() property
    {
        FItemActionSource __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetItemActionSource(const FItemActionSource &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemActionSource = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetItemActionButtons() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_ItemActionButtons() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetItemActionButtons(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ItemActionButtons = __Value;
        return;
    }
    TEUIModelRef<FVM_InputAction> GetMainActionButton() const property
    {
        this.TrackPropertyRead(3);
        return this.m_MainActionButton;
    }
    void SetMainActionButton(const TEUIModelRef<FVM_InputAction> &inout __Value) property
    {
        TEUIModelRef<FVM_InputAction> local_2;
        local_2 = this.m_MainActionButton;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MainActionButton = __Value;
        return;
    }
    EItemActionType GetMainActionType() const property
    {
        this.TrackPropertyRead(4);
        return this.m_MainActionType;
    }
    void SetMainActionType(const EItemActionType __Value) property
    {
        if (int(this.m_MainActionType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_MainActionType = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ItemAction
{
    UPROPERTY()
    bool HasMainAction;
    UPROPERTY()
    TEUIModelRef<FVM_ItemAction> Self;


}

namespace FVM_ItemAction
{
FVM_ItemAction& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
{
    return FVM_ItemAction::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemDataModel);
}
FVM_ItemAction CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
{
    FVM_ItemAction __r;
    TEUIModelRef<FVM_ItemAction> local_6 = TEUIModelRef<FVM_ItemAction>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemAction::ModelId, 0, ItemDataModel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemActionButtons";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MainActionButton";
    local_14.TypeName = "TEUIModelRef<FVM_InputAction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasMainAction";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemAction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemAction;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemAction;
}
TArray<FEUIModelRef> __UIGetter_ItemActionButtons(const FVM_ItemAction &inout Model)
{
    return Model.GetItemActionButtons();
}
TEUIModelRef<FVM_InputAction> __UIGetter_MainActionButton(const FVM_ItemAction &inout Model)
{
    return Model.GetMainActionButton();
}
bool __UIGetter_HasMainAction(const FVM_ItemAction &inout Model)
{
    return Model.HasMainAction();
}
TEUIModelRef<FVM_ItemAction> __UIGetter_Self(const FVM_ItemAction &inout Model)
{
    return TEUIModelRef<FVM_ItemAction>(Model);
}
int __IndexOf_ItemConfig()
{
    return 0;
}
int __IndexOf_ItemActionSource()
{
    return 1;
}
int __IndexOf_ItemActionButtons()
{
    return 2;
}
int __IndexOf_MainActionButton()
{
    return 3;
}
int __IndexOf_MainActionType()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_ItemAction
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
