
namespace FVMS_CommonBottomActionList
{
    const int ModelId = 0;

}
struct FVMS_CommonBottomActionList : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_InputAction>> m_InputActions;

    FVMS_CommonBottomActionList()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_CommonBottomActionList(const FVMS_CommonBottomActionList &inout Other)
    {
        this.m_InputActions = Other.m_InputActions;
        return;
    }
    FVMS_CommonBottomActionList& opAssign(const FVMS_CommonBottomActionList &inout Other)
    {
        return Other.m_InputActions;
    }
    TEUIModelRef<FVM_InputAction> GetAction1() const
    {
        if (this.GetInputActions().Num() > 0)
        {
            return this.GetInputActions()[0];
        }
        return TEUIModelRef<FVM_InputAction>();
    }
    TEUIModelRef<FVM_InputAction> GetAction2() const
    {
        if (this.GetInputActions().Num() > 1)
        {
            return this.GetInputActions()[1];
        }
        return TEUIModelRef<FVM_InputAction>();
    }
    TEUIModelRef<FVM_InputAction> GetAction3() const
    {
        if (this.GetInputActions().Num() > 2)
        {
            return this.GetInputActions()[2];
        }
        return TEUIModelRef<FVM_InputAction>();
    }
    TEUIModelRef<FVM_InputAction> GetAction4() const
    {
        if (this.GetInputActions().Num() > 3)
        {
            return this.GetInputActions()[3];
        }
        return TEUIModelRef<FVM_InputAction>();
    }
    bool HasActions() const
    {
        return (this.GetInputActions().Num() > 0);
    }
    bool HasActions1() const
    {
        return (this.GetInputActions().Num() > 0);
    }
    bool HasActions2() const
    {
        return (this.GetInputActions().Num() > 1);
    }
    bool HasActions3() const
    {
        return (this.GetInputActions().Num() > 2);
    }
    bool HasActions4() const
    {
        return (this.GetInputActions().Num() > 3);
    }
    void InvalidateEntityCache()
    {
        this.GetModify_InputActions().Empty(0);
        return;
    }
    TArray<TEUIModelRef<FVM_InputAction>> AddActionList(const TArray<FInputActionListConstructParamItem> &inout NewActions)
    {
        TArray<TEUIModelRef<FVM_InputAction>> local_4;
        for (auto& local_20 : NewActions)
        {
            TEUIModelRef<FVM_InputAction> local_22 = TEUIModelRef<FVM_InputAction>(::FVM_InputAction::Create(this.GetContext().Manager, local_20.InputAction, local_20.OnInputActionExecute));
            if (!(local_20.ActionNameOverride.IsEmpty()))
            {
                bool local_17 = true;
                local_17.SetbOverrideActionName();
                local_20.ActionNameOverride.SetActionNameOverride();
            }
            this.GetModify_InputActions().Add(local_22);
            local_4.Add(local_22);
        }
        return local_4;
    }
    void RemoveAllAction()
    {
        this.GetModify_InputActions().Empty(0);
        return;
    }
    TEUIModelRef<FVM_InputAction> AddAction(const FInputActionListConstructParamItem &inout NewAction)
    {
        TEUIModelRef<FVM_InputAction> local_2 = TEUIModelRef<FVM_InputAction>(::FVM_InputAction::Create(this.GetContext().Manager, NewAction.InputAction, NewAction.OnInputActionExecute));
        if (!(NewAction.ActionNameOverride.IsEmpty()))
        {
            bool local_5 = true;
            local_5.SetbOverrideActionName();
            NewAction.ActionNameOverride.SetActionNameOverride();
        }
        NewAction.bOnlyShowMainKey.SetbOnlyShowMainKey();
        this.GetModify_InputActions().Add(local_2);
        return local_2;
    }
    void AddExistingAction(const TEUIModelRef<FVM_InputAction> &inout ExistingAction)
    {
        this.GetModify_InputActions().AddUnique(ExistingAction);
        return;
    }
    void RemoveAction(const FEUIInputAction &inout RemoveAction)
    {
        UInputAction local_12;
        UInputAction local_14;
        int local_4 = this.GetModify_InputActions().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            TEUIModelRef<FVM_InputAction>& local_8 = this.GetModify_InputActions()[local_4];
            const FEUIInputAction& local_10 = GetInputAction();
            local_12 = RemoveAction.EnhancedAction;
            local_14 = local_10.EnhancedAction;
            if (local_12 == local_14 && (FEUIInputActionDataRow(RemoveAction.TableRowAction) == local_10.TableRowAction))
            {
                this.GetModify_InputActions().RemoveAt(local_4);
                break;
            }
        }
        return;
    }
    void RemoveAction(const TEUIModelRef<FVM_InputAction> &inout RemoveAction)
    {
        int local_4 = this.GetModify_InputActions().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            TEUIModelRef<FVM_InputAction>& local_8 = this.GetModify_InputActions()[local_4];
            if ((RemoveAction == local_8.opImplConv()))
            {
                this.GetModify_InputActions().RemoveAt(local_4);
                break;
            }
        }
        return;
    }
    bool HasAction(const TEUIModelRef<FVM_InputAction> &inout Action)
    {
        return this.GetInputActions().Contains(Action);
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

struct __GeneratedProperties_FVMS_CommonBottomActionList
{
    UPROPERTY()
    TEUIModelRef<FVM_InputAction> Action1;
    UPROPERTY()
    TEUIModelRef<FVM_InputAction> Action2;
    UPROPERTY()
    TEUIModelRef<FVM_InputAction> Action3;
    UPROPERTY()
    TEUIModelRef<FVM_InputAction> Action4;
    UPROPERTY()
    bool HasActions;
    UPROPERTY()
    bool HasActions1;
    UPROPERTY()
    bool HasActions2;
    UPROPERTY()
    bool HasActions3;
    UPROPERTY()
    bool HasActions4;
    UPROPERTY()
    TEUIModelRef<FVMS_CommonBottomActionList> Self;


}

namespace FVMS_CommonBottomActionList
{
FVMS_CommonBottomActionList& Get(const UObject ContextObject)
{
    return FVMS_CommonBottomActionList::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_CommonBottomActionList GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_CommonBottomActionList __r;
    TEUIModelRef<FVMS_CommonBottomActionList> local_6 = TEUIModelRef<FVMS_CommonBottomActionList>(EUIInternal::MakeModelWithManager(Manager, FVMS_CommonBottomActionList::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "InputActions";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_InputAction>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Action1";
    local_14.TypeName = "TEUIModelRef<FVM_InputAction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Action2";
    local_14.TypeName = "TEUIModelRef<FVM_InputAction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Action3";
    local_14.TypeName = "TEUIModelRef<FVM_InputAction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Action4";
    local_14.TypeName = "TEUIModelRef<FVM_InputAction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasActions";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasActions1";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasActions2";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasActions3";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasActions4";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_CommonBottomActionList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_CommonBottomActionList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_CommonBottomActionList;
}
TArray<TEUIModelRef<FVM_InputAction>> __UIGetter_InputActions(const FVMS_CommonBottomActionList &inout Model)
{
    return Model.GetInputActions();
}
TEUIModelRef<FVM_InputAction> __UIGetter_Action1(const FVMS_CommonBottomActionList &inout Model)
{
    return Model.GetAction1();
}
TEUIModelRef<FVM_InputAction> __UIGetter_Action2(const FVMS_CommonBottomActionList &inout Model)
{
    return Model.GetAction2();
}
TEUIModelRef<FVM_InputAction> __UIGetter_Action3(const FVMS_CommonBottomActionList &inout Model)
{
    return Model.GetAction3();
}
TEUIModelRef<FVM_InputAction> __UIGetter_Action4(const FVMS_CommonBottomActionList &inout Model)
{
    return Model.GetAction4();
}
bool __UIGetter_HasActions(const FVMS_CommonBottomActionList &inout Model)
{
    return Model.HasActions();
}
bool __UIGetter_HasActions1(const FVMS_CommonBottomActionList &inout Model)
{
    return Model.HasActions1();
}
bool __UIGetter_HasActions2(const FVMS_CommonBottomActionList &inout Model)
{
    return Model.HasActions2();
}
bool __UIGetter_HasActions3(const FVMS_CommonBottomActionList &inout Model)
{
    return Model.HasActions3();
}
bool __UIGetter_HasActions4(const FVMS_CommonBottomActionList &inout Model)
{
    return Model.HasActions4();
}
TEUIModelRef<FVMS_CommonBottomActionList> __UIGetter_Self(const FVMS_CommonBottomActionList &inout Model)
{
    return TEUIModelRef<FVMS_CommonBottomActionList>(Model);
}
int __IndexOf_InputActions()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_CommonBottomActionList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
