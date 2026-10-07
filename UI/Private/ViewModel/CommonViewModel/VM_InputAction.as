
namespace FVM_InputAction
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ExecuteAction = FEUIModelCallbackSignature();
}
namespace FVM_InputActionList
{
    const int ModelId = 0;

}
struct FVM_InputAction : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIInputAction m_InputAction;
    UPROPERTY()
    FSimpleModelEvent m_OnInputActionExecute;
    UPROPERTY()
    bool m_bOverrideActionName;
    UPROPERTY()
    bool m_bOnlyShowMainKey;
    UPROPERTY()
    FText m_ActionNameOverride;
    UPROPERTY()
    int m_InputActionListIndex;
    UPROPERTY()
    FInputActionListCallback m_InputActionListCallback;
    UPROPERTY()
    bool m_bExecuted;

    FVM_InputAction()
    {
        this.m_bOverrideActionName = false;
        this.m_InputActionListIndex = 0;
        this.m_bOnlyShowMainKey = false;
        this.m_bExecuted = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_InputAction' by default constructor.");
        return;
    }
    FVM_InputAction(const FVM_InputAction &inout Other)
    {
        this.m_bOverrideActionName = false;
        this.m_InputActionListIndex = 0;
        this.m_bOnlyShowMainKey = false;
        this.m_bExecuted = false;
        this.m_InputAction = Other.m_InputAction;
        this.m_bOverrideActionName = Other.m_bOverrideActionName;
        this.m_bOnlyShowMainKey = Other.m_bOnlyShowMainKey;
        this.m_ActionNameOverride = Other.m_ActionNameOverride;
        this.m_InputActionListIndex = int(Other.m_InputActionListIndex);
        this.m_bExecuted = Other.m_bExecuted;
        return;
    }
    FVM_InputAction(const FEUIInputAction &inout InInputAction, const FSimpleModelEvent &inout InOnInputActionExecute)
    {
        this.m_bOverrideActionName = false;
        this.m_InputActionListIndex = 0;
        this.m_bOnlyShowMainKey = false;
        this.m_bExecuted = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetInputAction(InInputAction);
        this.SetOnInputActionExecute(InOnInputActionExecute);
        return;
    }
    FVM_InputAction opAssign(const FVM_InputAction &inout Other)
    {
        FVM_InputAction __r;
        this.m_InputAction = Other.m_InputAction;
        this.m_bOverrideActionName = Other.m_bOverrideActionName;
        this.m_bOnlyShowMainKey = Other.m_bOnlyShowMainKey;
        this.m_ActionNameOverride = Other.m_ActionNameOverride;
        this.m_InputActionListIndex = int(Other.m_InputActionListIndex);
        this.m_bExecuted = Other.m_bExecuted;
        return __r;
    }
    void OverrideActionName(const FText &inout InActionNameOverride)
    {
        this.SetbOverrideActionName(true);
        this.SetActionNameOverride(InActionNameOverride);
        return;
    }
    bool ShouldBypassExecuteEvent() const
    {
        return !(this.GetOnInputActionExecute().IsBound()) && !(this.GetInputActionListCallback().IsBound());
    }
    bool HasExecuted() const
    {
        return this.GetbExecuted();
    }
    void ExecuteAction()
    {
        this.SetbExecuted(true);
        this.GetOnInputActionExecute().Broadcast();
        this.GetInputActionListCallback().Broadcast(this.GetInputActionListIndex());
        return;
    }
    FEUIInputAction GetInputAction() const property
    {
        FEUIInputAction __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIInputAction GetModify_InputAction() property
    {
        FEUIInputAction __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetInputAction(const FEUIInputAction &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_InputAction = __Value;
        return;
    }
    const FSimpleModelEvent GetOnInputActionExecute() const property
    {
        const FSimpleModelEvent __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSimpleModelEvent GetModify_OnInputActionExecute() property
    {
        FSimpleModelEvent __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetOnInputActionExecute(const FSimpleModelEvent &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    bool GetbOverrideActionName() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bOverrideActionName;
    }
    void SetbOverrideActionName(const bool __Value) property
    {
        if (!(this.m_bOverrideActionName) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bOverrideActionName = __Value;
        return;
    }
    bool GetbOnlyShowMainKey() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bOnlyShowMainKey;
    }
    void SetbOnlyShowMainKey(const bool __Value) property
    {
        if (!(this.m_bOnlyShowMainKey) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bOnlyShowMainKey = __Value;
        return;
    }
    const FText GetActionNameOverride() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_ActionNameOverride() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetActionNameOverride(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ActionNameOverride = __Value;
        return;
    }
    int GetInputActionListIndex() const property
    {
        this.TrackPropertyRead(5);
        return this.m_InputActionListIndex;
    }
    void SetInputActionListIndex(const int __Value) property
    {
        if (this.m_InputActionListIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_InputActionListIndex = __Value;
        return;
    }
    const FInputActionListCallback GetInputActionListCallback() const property
    {
        const FInputActionListCallback __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FInputActionListCallback GetModify_InputActionListCallback() property
    {
        FInputActionListCallback __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetInputActionListCallback(const FInputActionListCallback &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        return;
    }
    bool GetbExecuted() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bExecuted;
    }
    void SetbExecuted(const bool __Value) property
    {
        if (!(this.m_bExecuted) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bExecuted = __Value;
        return;
    }
}

struct FVM_InputActionList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_InputAction>> m_InputActions;

    FVM_InputActionList()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_InputActionList' by default constructor.");
        return;
    }
    FVM_InputActionList(const FVM_InputActionList &inout Other)
    {
        this.m_InputActions = Other.m_InputActions;
        return;
    }
    FVM_InputActionList(const FInputActionListConstructParam &inout InputActionList)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        FInputActionListCallback local_26;
        this.InitInputActionList(InputActionList, local_26);
        return;
    }
    FVM_InputActionList(const FInputActionListConstructParam &inout InputActionList, const FInputActionListCallback &inout InputActionListCallback)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.InitInputActionList(InputActionList, InputActionListCallback);
        return;
    }
    FVM_InputActionList& opAssign(const FVM_InputActionList &inout Other)
    {
        return Other.m_InputActions;
    }
    bool HasAnyActionExecuted() const
    {
        for (auto& local_16 : this.GetInputActions())
        {
            if (local_16.IsValid() && HasExecuted())
            {
                return true;
            }
        }
        return false;
    }
    void InitInputActionList(const FInputActionListConstructParam &inout InputActionList, const FInputActionListCallback &inout InputActionListCallback)
    {
        for (auto& local_16 : InputActionList.InputActionListConstructParamItems)
        {
            FVM_InputAction& local_18 = ::FVM_InputAction::Create(this.GetContext().Manager, local_16.InputAction, local_16.OnInputActionExecute);
            local_18.SetbOverrideActionName(local_16.bOverrideActionName);
            local_18.SetActionNameOverride(local_16.ActionNameOverride);
            local_18.SetInputActionListIndex(this.GetInputActions().Num());
            local_18.SetInputActionListCallback(InputActionListCallback);
            this.GetModify_InputActions().Add(TEUIModelRef<FVM_InputAction>(local_18));
        }
        return;
    }
    TArray<TEUIModelRef<FVM_InputAction>> GetInputActions() const property
    {
        TArray<TEUIModelRef<FVM_InputAction>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_InputAction>> GetModify_InputActions() property
    {
        TArray<TEUIModelRef<FVM_InputAction>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetInputActions(const TArray<TEUIModelRef<FVM_InputAction>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_InputActions = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_InputAction
{
    UPROPERTY()
    bool ShouldBypassExecuteEvent;
    UPROPERTY()
    TEUIModelRef<FVM_InputAction> Self;


}

struct __GeneratedProperties_FVM_InputActionList
{
    UPROPERTY()
    TEUIModelRef<FVM_InputActionList> Self;

    __GeneratedProperties_FVM_InputActionList()
    {
        return;
    }
}

namespace FVM_InputAction
{
FVM_InputAction& Create(const UObject ContextObject, const FEUIInputAction &inout InputAction, const FSimpleModelEvent &inout OnInputActionExecute)
{
    return FVM_InputAction::CreateByManager(EUIInternal::GetContextManager(ContextObject), InputAction, OnInputActionExecute);
}
FVM_InputAction CreateByManager(const UEUIManagerSubsystem Manager, const FEUIInputAction &inout InputAction, const FSimpleModelEvent &inout OnInputActionExecute)
{
    FVM_InputAction __r;
    TEUIModelRef<FVM_InputAction> local_6 = TEUIModelRef<FVM_InputAction>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InputAction::ModelId, 0, InputAction, OnInputActionExecute));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "InputAction";
    local_14.TypeName = "FEUIInputAction";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bOverrideActionName";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bOnlyShowMainKey";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActionNameOverride";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldBypassExecuteEvent";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_InputAction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InputAction;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InputAction;
}
FEUIInputAction __UIGetter_InputAction(const FVM_InputAction &inout Model)
{
    return Model.GetInputAction();
}
bool __UIGetter_bOverrideActionName(const FVM_InputAction &inout Model)
{
    return Model.GetbOverrideActionName();
}
bool __UIGetter_bOnlyShowMainKey(const FVM_InputAction &inout Model)
{
    return Model.GetbOnlyShowMainKey();
}
FText __UIGetter_ActionNameOverride(const FVM_InputAction &inout Model)
{
    return Model.GetActionNameOverride();
}
bool __UIGetter_ShouldBypassExecuteEvent(const FVM_InputAction &inout Model)
{
    return Model.ShouldBypassExecuteEvent();
}
TEUIModelRef<FVM_InputAction> __UIGetter_Self(const FVM_InputAction &inout Model)
{
    return TEUIModelRef<FVM_InputAction>(Model);
}
int __IndexOf_InputAction()
{
    return 0;
}
int __IndexOf_OnInputActionExecute()
{
    return 1;
}
int __IndexOf_bOverrideActionName()
{
    return 2;
}
int __IndexOf_bOnlyShowMainKey()
{
    return 3;
}
int __IndexOf_ActionNameOverride()
{
    return 4;
}
int __IndexOf_InputActionListIndex()
{
    return 5;
}
int __IndexOf_InputActionListCallback()
{
    return 6;
}
int __IndexOf_bExecuted()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_InputAction
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_InputActionList
{
FVM_InputActionList& Create(const UObject ContextObject, const FInputActionListConstructParam &inout InputActionList)
{
    return FVM_InputActionList::CreateByManager(EUIInternal::GetContextManager(ContextObject), InputActionList);
}
FVM_InputActionList CreateByManager(const UEUIManagerSubsystem Manager, const FInputActionListConstructParam &inout InputActionList)
{
    FVM_InputActionList __r;
    TEUIModelRef<FVM_InputActionList> local_6 = TEUIModelRef<FVM_InputActionList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InputActionList::ModelId, 0, InputActionList));
    return __r;
}
FVM_InputActionList& Create(const UObject ContextObject, const FInputActionListConstructParam &inout InputActionList, const FInputActionListCallback &inout InputActionListCallback)
{
    return FVM_InputActionList::CreateByManager(EUIInternal::GetContextManager(ContextObject), InputActionList, InputActionListCallback);
}
FVM_InputActionList CreateByManager(const UEUIManagerSubsystem Manager, const FInputActionListConstructParam &inout InputActionList, const FInputActionListCallback &inout InputActionListCallback)
{
    FVM_InputActionList __r;
    TEUIModelRef<FVM_InputActionList> local_6 = TEUIModelRef<FVM_InputActionList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InputActionList::ModelId, 1, InputActionList, InputActionListCallback));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "InputActions";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_InputAction>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_InputActionList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InputActionList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InputActionList;
}
TArray<TEUIModelRef<FVM_InputAction>> __UIGetter_InputActions(const FVM_InputActionList &inout Model)
{
    return Model.GetInputActions();
}
TEUIModelRef<FVM_InputActionList> __UIGetter_Self(const FVM_InputActionList &inout Model)
{
    return TEUIModelRef<FVM_InputActionList>(Model);
}
int __IndexOf_InputActions()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_InputActionList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
