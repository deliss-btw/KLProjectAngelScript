
namespace FMS_HUDVisibilityManager
{
    const int ModelId = 0;

// NOTE: class defaults are not authored in this module: FEUIActionBindingHandleVisibility (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

}
struct FEUIActionBindingHandleVisibility : FEUIActionBindingCustom
{
    FEUIActionBindingCustom _base_FEUIActionBindingCustom;
    UPROPERTY()
    FEUIModelWeakRef ManagerRef;
    UPROPERTY()
    bool bHidden;

    FEUIActionBindingHandleVisibility()
    {
        this.bHidden = false;
        this.__InitDefaults();
        return;
    }
    void OnBindingExecute_Implementation()
    {
        FEUIModelRef local_4 = this.ManagerRef.AsRef();
        Get local_10;
        FMS_HUDVisibilityManager& local_6 = local_10.opCall();
        if (local_6)
        {
            local_6.GetManager().HideWidgetLayer(local_6.GetUELocalPlayer(), EEUILayoutLayer(3), !(this.bHidden));
            local_6.GetManager().ForceShowWidget(local_6.GetUELocalPlayer(), GameplayTags::UI_Type_HUD_PlayerStatusV2, !(this.bHidden));
            this.bHidden = !(this.bHidden);
        }
        return;
    }
}

struct FMS_HUDVisibilityManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FEUIActionBindingHandleVisibility m_TestHandle;

    FMS_HUDVisibilityManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_HUDVisibilityManager(const FMS_HUDVisibilityManager &inout Other)
    {
        return;
    }
    FMS_HUDVisibilityManager opAssign(const FMS_HUDVisibilityManager &inout Other)
    {
        FMS_HUDVisibilityManager __r;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    void BeginDestroy()
    {
        this.GetModify_TestHandle().UnRegister();
        return;
    }
    const FEUIActionBindingHandleVisibility GetTestHandle() const property
    {
        const FEUIActionBindingHandleVisibility __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIActionBindingHandleVisibility GetModify_TestHandle() property
    {
        FEUIActionBindingHandleVisibility __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTestHandle(const FEUIActionBindingHandleVisibility &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
}

namespace FMS_HUDVisibilityManager
{
FMS_HUDVisibilityManager& Get(const UObject ContextObject)
{
    return FMS_HUDVisibilityManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_HUDVisibilityManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_HUDVisibilityManager __r;
    TEUIModelRef<FMS_HUDVisibilityManager> local_6 = TEUIModelRef<FMS_HUDVisibilityManager>(EUIInternal::MakeModelWithManager(Manager, FMS_HUDVisibilityManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_HUDVisibilityManager;
}
int __IndexOf_TestHandle()
{
    return 0;
}
}
