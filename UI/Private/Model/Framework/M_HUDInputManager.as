
namespace FM_HUDSystemEntranceInput
{
    const int ModelId = 0;
}
namespace FMS_HUDInputManager
{
    const int ModelId = 0;

}
struct FM_HUDSystemEntranceInput : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    FEUIWidgetTag m_EntranceWidget;
    UPROPERTY()
    FEUIInputAction m_InputAction;
    UPROPERTY()
    FEUIActionBinding m_InputBinding;

    FM_HUDSystemEntranceInput()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_HUDSystemEntranceInput' by default constructor.");
        return;
    }
    FM_HUDSystemEntranceInput(const FM_HUDSystemEntranceInput &inout Other)
    {
        this.m_EntranceWidget = Other.m_EntranceWidget;
        this.m_InputAction = Other.m_InputAction;
        this.m_InputBinding = Other.m_InputBinding;
        return;
    }
    FM_HUDSystemEntranceInput(const FEUIWidgetTag &inout InEntranceWidget, const FEUIInputAction &inout InInputAction)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEntranceWidget(InEntranceWidget);
        this.SetInputAction(InInputAction);
        return;
    }
    FM_HUDSystemEntranceInput& opAssign(const FM_HUDSystemEntranceInput &inout Other)
    {
        this.m_EntranceWidget = Other.m_EntranceWidget;
        this.m_InputAction = Other.m_InputAction;
        return Other.m_InputBinding;
    }
    void PostConstruct()
    {
        UWidget local_2 = this.GetManager().GetLayerRootWidget(this.GetUELocalPlayer(), EEUILayoutLayer(3));
        this.GetModify_InputBinding().SetInputAction(this.GetInputAction());
        this.GetModify_InputBinding().Register(local_2, FEUIModelDelegateHelper::BindModelDelegate_FSimpleDelegate(this, n"OpenSystemEntranceWidget"));
        return;
    }
    void BeginDestroy()
    {
        this.GetModify_InputBinding().UnRegister();
        return;
    }
    void OpenSystemEntranceWidget()
    {
        return;
    }
    FEUIWidgetTag GetEntranceWidget() const property
    {
        FEUIWidgetTag __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIWidgetTag GetModify_EntranceWidget() property
    {
        FEUIWidgetTag __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEntranceWidget(const FEUIWidgetTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EntranceWidget = __Value;
        return;
    }
    FEUIInputAction GetInputAction() const property
    {
        FEUIInputAction __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIInputAction GetModify_InputAction() property
    {
        FEUIInputAction __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetInputAction(const FEUIInputAction &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_InputAction = __Value;
        return;
    }
    const FEUIActionBinding GetInputBinding() const property
    {
        const FEUIActionBinding __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIActionBinding GetModify_InputBinding() property
    {
        FEUIActionBinding __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetInputBinding(const FEUIActionBinding &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_InputBinding = __Value;
        return;
    }
}

struct FMS_HUDInputManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FEUIFocusTransferHandle m_FocusHandle;
    UPROPERTY()
    FEUIActionBinding m_RequireFocusBinding;
    UPROPERTY()
    FEUIActionBinding m_ReleaseFocusBinding;
    UPROPERTY()
    TArray<TEUIModelRef<FM_HUDSystemEntranceInput>> m_SystemEntranceInputs;

    FMS_HUDInputManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_HUDInputManager(const FMS_HUDInputManager &inout Other)
    {
        this.m_FocusHandle = Other.m_FocusHandle;
        this.m_RequireFocusBinding = Other.m_RequireFocusBinding;
        this.m_ReleaseFocusBinding = Other.m_ReleaseFocusBinding;
        this.m_SystemEntranceInputs = Other.m_SystemEntranceInputs;
        return;
    }
    FMS_HUDInputManager& opAssign(const FMS_HUDInputManager &inout Other)
    {
        this.m_FocusHandle = Other.m_FocusHandle;
        this.m_RequireFocusBinding = Other.m_RequireFocusBinding;
        this.m_ReleaseFocusBinding = Other.m_ReleaseFocusBinding;
        return Other.m_SystemEntranceInputs;
    }
    void LoadConfigDefault(const FMS_HUDInputManagerConfigDefault &inout InConfig)
    {
        this.SetReleaseFocusBinding(InConfig.ReleaseFocusBinding);
        this.SetRequireFocusBinding(InConfig.RequireFocusBinding);
        return;
    }
    void PostConstruct()
    {
        this.RegisterSystemEntrance();
        return;
    }
    void BeginDestroy()
    {
        return;
    }
    void RegisterSystemEntrance()
    {
        TDataObjectIterator<FSystemControlConfig> local_16;
        for (; local_16; )
        {
            if (!(local_16.GetData().bHasHUDEntrance))
            {
            }
            else
            {
                if (local_16.GetData().EntranceInput.IsNull())
                {
                    XError(ELog(17), FString().Append("HUDInputManager: SystemControlConfig ").Append(local_16.GetData().GetDataName()).Append(" has no entrance input, will not be able to open from HUD"));
                }
                else
                {
                    if (!(local_16.GetData().EntranceWidget.IsValid()))
                    {
                        XError(ELog(17), FString().Append("HUDInputManager: SystemControlConfig ").Append(local_16.GetData().GetDataName()).Append(" has no entrance widget, will not be able to open from HUD"));
                    }
                    else
                    {
                        this.GetModify_SystemEntranceInputs().Add(TEUIModelRef<FM_HUDSystemEntranceInput>(::FM_HUDSystemEntranceInput::Create(this.GetManager(), local_16.GetData().EntranceWidget, local_16.GetData().EntranceInput)));
                    }
                }
            }
            local_16.Next();
        }
        return;
    }
    const FEUIFocusTransferHandle GetFocusHandle() const property
    {
        const FEUIFocusTransferHandle __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIFocusTransferHandle GetModify_FocusHandle() property
    {
        FEUIFocusTransferHandle __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetFocusHandle(const FEUIFocusTransferHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_FocusHandle = __Value;
        return;
    }
    const FEUIActionBinding GetRequireFocusBinding() const property
    {
        const FEUIActionBinding __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIActionBinding GetModify_RequireFocusBinding() property
    {
        FEUIActionBinding __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetRequireFocusBinding(const FEUIActionBinding &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RequireFocusBinding = __Value;
        return;
    }
    const FEUIActionBinding GetReleaseFocusBinding() const property
    {
        const FEUIActionBinding __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIActionBinding GetModify_ReleaseFocusBinding() property
    {
        FEUIActionBinding __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetReleaseFocusBinding(const FEUIActionBinding &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ReleaseFocusBinding = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_HUDSystemEntranceInput>> GetSystemEntranceInputs() const property
    {
        const TArray<TEUIModelRef<FM_HUDSystemEntranceInput>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FM_HUDSystemEntranceInput>> GetModify_SystemEntranceInputs() property
    {
        TArray<TEUIModelRef<FM_HUDSystemEntranceInput>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSystemEntranceInputs(const TArray<TEUIModelRef<FM_HUDSystemEntranceInput>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SystemEntranceInputs = __Value;
        return;
    }
}

namespace FM_HUDSystemEntranceInput
{
FM_HUDSystemEntranceInput& Create(const UObject ContextObject, const FEUIWidgetTag &inout EntranceWidget, const FEUIInputAction &inout InputAction)
{
    return FM_HUDSystemEntranceInput::CreateByManager(EUIInternal::GetContextManager(ContextObject), EntranceWidget, InputAction);
}
FM_HUDSystemEntranceInput CreateByManager(const UEUIManagerSubsystem Manager, const FEUIWidgetTag &inout EntranceWidget, const FEUIInputAction &inout InputAction)
{
    FM_HUDSystemEntranceInput __r;
    TEUIModelRef<FM_HUDSystemEntranceInput> local_6 = TEUIModelRef<FM_HUDSystemEntranceInput>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_HUDSystemEntranceInput::ModelId, 0, EntranceWidget, InputAction));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_HUDSystemEntranceInput;
}
int __IndexOf_EntranceWidget()
{
    return 0;
}
int __IndexOf_InputAction()
{
    return 1;
}
int __IndexOf_InputBinding()
{
    return 2;
}
}
namespace FMS_HUDInputManager
{
FMS_HUDInputManager& Get(const UObject ContextObject)
{
    return FMS_HUDInputManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_HUDInputManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_HUDInputManager __r;
    TEUIModelRef<FMS_HUDInputManager> local_6 = TEUIModelRef<FMS_HUDInputManager>(EUIInternal::MakeModelWithManager(Manager, FMS_HUDInputManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(true);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_HUDInputManager;
}
int __IndexOf_FocusHandle()
{
    return 0;
}
int __IndexOf_RequireFocusBinding()
{
    return 1;
}
int __IndexOf_ReleaseFocusBinding()
{
    return 2;
}
int __IndexOf_SystemEntranceInputs()
{
    return 3;
}
}
