
namespace FVM_CloseScope
{
    const int ModelId = 0;

// NOTE: class defaults are not authored in this module: FVM_CloseScope (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

}
struct FMsg_CloseScopeCloseRequested : FEUIMessage
{
    UPROPERTY()
    FEUIWidgetRef OwnerWidget;

    FMsg_CloseScopeCloseRequested()
    {
        return;
    }
}

struct FVM_CloseScope : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bEnabled;
    UPROPERTY()
    bool m_bCloseOnClickOutside;
    UPROPERTY()
    bool m_bBlockPointerOutside;
    UPROPERTY()
    bool m_bCloseOnBack;
    UPROPERTY()
    bool m_bCloseOnlyOnPureBlank;
    UPROPERTY()
    FEUIWidgetRef m_ParentScopeWidget;
    UPROPERTY()
    bool m_bOwnerWidgetBound;
    UPROPERTY()
    bool bUseRootWidget;
    UPROPERTY()
    FEUICloseScopeHandle CurrentHandle;
    UPROPERTY()
    bool bHandlingCloseRequest;

    FVM_CloseScope()
    {
        this.m_bEnabled = true;
        this.m_bCloseOnClickOutside = true;
        this.m_bBlockPointerOutside = false;
        this.m_bCloseOnBack = false;
        this.m_bCloseOnlyOnPureBlank = false;
        this.m_bOwnerWidgetBound = false;
        this.bUseRootWidget = true;
        this.bHandlingCloseRequest = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
        }
        else
        {
        }
        this.__InitDefaults();
        return;
    }
    FVM_CloseScope(const FVM_CloseScope &inout Other)
    {
        this.m_bEnabled = true;
        this.m_bCloseOnClickOutside = true;
        this.m_bBlockPointerOutside = false;
        this.m_bCloseOnBack = false;
        this.m_bCloseOnlyOnPureBlank = false;
        this.m_bOwnerWidgetBound = false;
        this.bUseRootWidget = true;
        this.bHandlingCloseRequest = false;
        this.m_bEnabled = Other.m_bEnabled;
        this.m_bCloseOnClickOutside = Other.m_bCloseOnClickOutside;
        this.m_bBlockPointerOutside = Other.m_bBlockPointerOutside;
        this.m_bCloseOnBack = Other.m_bCloseOnBack;
        this.m_bCloseOnlyOnPureBlank = Other.m_bCloseOnlyOnPureBlank;
        this.m_ParentScopeWidget = Other.m_ParentScopeWidget;
        this.m_bOwnerWidgetBound = Other.m_bOwnerWidgetBound;
        this.__InitDefaults();
        return;
    }
    FVM_CloseScope opAssign(const FVM_CloseScope &inout Other)
    {
        FVM_CloseScope __r;
        this.m_bEnabled = Other.m_bEnabled;
        this.m_bCloseOnClickOutside = Other.m_bCloseOnClickOutside;
        this.m_bBlockPointerOutside = Other.m_bBlockPointerOutside;
        this.m_bCloseOnBack = Other.m_bCloseOnBack;
        this.m_bCloseOnlyOnPureBlank = Other.m_bCloseOnlyOnPureBlank;
        this.m_ParentScopeWidget = Other.m_ParentScopeWidget;
        this.m_bOwnerWidgetBound = Other.m_bOwnerWidgetBound;
        return __r;
    }
    void LoadConfig(const FConfigVM_CloseScope &inout InConfig)
    {
        this.SetbCloseOnClickOutside(InConfig.bCloseOnClickOutside);
        this.SetbBlockPointerOutside(InConfig.bBlockPointerOutside);
        this.SetbCloseOnBack(InConfig.bCloseOnBack);
        this.SetbCloseOnlyOnPureBlank(InConfig.bCloseOnlyOnPureBlank);
        this.SetbEnabled(InConfig.bEnabled);
        return;
    }
    void OnOwnerWidgetBind_Implementation()
    {
        this.SetbOwnerWidgetBound(true);
        return;
    }
    void OnOwnerWidgetUnbind_Implementation()
    {
        this.SetbOwnerWidgetBound(false);
        this.UnregisterOnly();
        return;
    }
    void RefreshRegistration()
    {
        this.SyncRegistration();
        return;
    }
    void Disable()
    {
        this.SetbEnabled(false);
        this.UnregisterOnly();
        return;
    }
    void RequestCloseSelf()
    {
        FEUICloseScope::RequestCloseSelf(this.GetScopeOwnerWidget());
        return;
    }
    void CloseChildren()
    {
        FEUICloseScope::CloseChildren(this.GetScopeOwnerWidget());
        return;
    }
    void SyncRegistration()
    {
        this.UnregisterOnly();
        if (!(this.GetbOwnerWidgetBound()) || !(this.GetbEnabled()))
        {
            return;
        }
        this.RegisterWithCloseCommand(FEUIModelDelegateHelper::BindModelDelegate_FSimpleDelegate(this, n"HandleCloseRequested"));
        return;
    }
    void HandleCloseRequested()
    {
        int local_8 = 0;
        if (this.bHandlingCloseRequest)
        {
            return;
        }
        this.bHandlingCloseRequest = true;
        FEUIWidgetRef local_6 = this.GetScopeOwnerWidget();
        FEUIModelRef local_14 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        local_8.OwnerWidget = local_6;
        FEUICloseScope::CloseWidgetByDefaultRule(local_6);
        this.bHandlingCloseRequest = false;
        return;
    }
    void RegisterWithCloseCommand(const FSimpleDelegate &inout InCloseCommand)
    {
        this.CurrentHandle = FEUICloseScope::RegisterForWidgetWithCloseCommand(this.GetScopeOwnerWidget(), this.GetbCloseOnClickOutside(), this.GetbBlockPointerOutside(), this.GetbCloseOnBack(), this.GetParentScopeWidget(), InCloseCommand, this.GetbCloseOnlyOnPureBlank());
        return;
    }
    void UnregisterOnly()
    {
        if (!(this.CurrentHandle.IsValid()))
        {
            return;
        }
        FEUICloseScope::Unregister(this.GetScopeOwnerWidget(), this.CurrentHandle);
        this.CurrentHandle = FEUICloseScopeHandle();
        return;
    }
    FEUIWidgetRef GetScopeOwnerWidget() const
    {
        FEUIWidgetRef __r;
        FEUIWidgetRef local_4 = this.GetOwnerWidget();
        if (!(this.bUseRootWidget))
        {
            return local_4;
        }
        if (local_4.GetRoot().IsValid())
        {
        }
        else
        {
        }
        return __r;
    }
    bool GetbEnabled() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bEnabled;
    }
    void SetbEnabled(const bool __Value) property
    {
        if (!(this.m_bEnabled) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bEnabled = __Value;
        return;
    }
    bool GetbCloseOnClickOutside() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bCloseOnClickOutside;
    }
    void SetbCloseOnClickOutside(const bool __Value) property
    {
        if (!(this.m_bCloseOnClickOutside) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bCloseOnClickOutside = __Value;
        return;
    }
    bool GetbBlockPointerOutside() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bBlockPointerOutside;
    }
    void SetbBlockPointerOutside(const bool __Value) property
    {
        if (!(this.m_bBlockPointerOutside) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bBlockPointerOutside = __Value;
        return;
    }
    bool GetbCloseOnBack() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bCloseOnBack;
    }
    void SetbCloseOnBack(const bool __Value) property
    {
        if (!(this.m_bCloseOnBack) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bCloseOnBack = __Value;
        return;
    }
    bool GetbCloseOnlyOnPureBlank() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bCloseOnlyOnPureBlank;
    }
    void SetbCloseOnlyOnPureBlank(const bool __Value) property
    {
        if (!(this.m_bCloseOnlyOnPureBlank) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bCloseOnlyOnPureBlank = __Value;
        return;
    }
    const FEUIWidgetRef GetParentScopeWidget() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FEUIWidgetRef GetModify_ParentScopeWidget() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetParentScopeWidget(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ParentScopeWidget = __Value;
        return;
    }
    bool GetbOwnerWidgetBound() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bOwnerWidgetBound;
    }
    void SetbOwnerWidgetBound(const bool __Value) property
    {
        if (!(this.m_bOwnerWidgetBound) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bOwnerWidgetBound = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CloseScope
{
    UPROPERTY()
    TEUIModelRef<FVM_CloseScope> Self;

    __GeneratedProperties_FVM_CloseScope()
    {
        return;
    }
}

namespace FVM_CloseScope
{
FVM_CloseScope& Create(const UObject ContextObject)
{
    return FVM_CloseScope::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CloseScope CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CloseScope __r;
    TEUIModelRef<FVM_CloseScope> local_6 = TEUIModelRef<FVM_CloseScope>(EUIInternal::MakeModelWithManager(Manager, FVM_CloseScope::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CloseScope>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CloseScope;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "SyncRegistration";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CloseScope;
}
TEUIModelRef<FVM_CloseScope> __UIGetter_Self(const FVM_CloseScope &inout Model)
{
    return TEUIModelRef<FVM_CloseScope>(Model);
}
int __IndexOf_bEnabled()
{
    return 0;
}
int __IndexOf_bCloseOnClickOutside()
{
    return 1;
}
int __IndexOf_bBlockPointerOutside()
{
    return 2;
}
int __IndexOf_bCloseOnBack()
{
    return 3;
}
int __IndexOf_bCloseOnlyOnPureBlank()
{
    return 4;
}
int __IndexOf_ParentScopeWidget()
{
    return 5;
}
int __IndexOf_bOwnerWidgetBound()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_CloseScope
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
