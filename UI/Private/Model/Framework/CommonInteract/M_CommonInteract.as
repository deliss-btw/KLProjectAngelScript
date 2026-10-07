
namespace FMS_CommonInteractManager
{
    const int ModelId = 0;

}
struct FMS_CommonInteractManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FEUIWidgetRef m_WaitInteractOthersPageHandle;

    FMS_CommonInteractManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CommonInteractManager(const FMS_CommonInteractManager &inout Other)
    {
        this.m_WaitInteractOthersPageHandle = Other.m_WaitInteractOthersPageHandle;
        return;
    }
    FMS_CommonInteractManager& opAssign(const FMS_CommonInteractManager &inout Other)
    {
        return Other.m_WaitInteractOthersPageHandle;
    }
    void Monitor_OnPlayerWaitReborn(const FC_LevelEntryInteractPresentationTag &inout Tag)
    {
        const UDungeonSettings local_14;
        if (Tag)
        {
            if (!(this.GetWaitInteractOthersPageHandle()))
            {
                int local_3;
                int local_2;
                FECSEntity local_12 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
                ::FInteractUtils::GetCurrentInteractPlayerNumInfoForUI(local_12, local_2, local_3);
                GetGameplaySettings<UDungeonSettings> local_16;
                local_14 = local_16;
                FEUIModelRef local_20;
                this.SetWaitInteractOthersPageHandle(FEUIWidget::AddWidgetByClass(this.GetContext().UELocalPlayer, local_14.DungeonInteractWaitWidgetClass, local_20));
            }
            return;
        }
        if (this.GetWaitInteractOthersPageHandle())
        {
            FEUIWidget::RemoveWidget(this.GetWaitInteractOthersPageHandle());
        }
        return;
    }
    const FEUIWidgetRef GetWaitInteractOthersPageHandle() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIWidgetRef GetModify_WaitInteractOthersPageHandle() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetWaitInteractOthersPageHandle(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_WaitInteractOthersPageHandle = __Value;
        return;
    }
}

namespace FMS_CommonInteractManager
{
FMS_CommonInteractManager& Get(const UObject ContextObject)
{
    return FMS_CommonInteractManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CommonInteractManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_CommonInteractManager __r;
    TEUIModelRef<FMS_CommonInteractManager> local_6 = TEUIModelRef<FMS_CommonInteractManager>(EUIInternal::MakeModelWithManager(Manager, FMS_CommonInteractManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__Monitor_OnPlayerWaitReborn";
    local_14.ComponentType = FC_LevelEntryInteractPresentationTag;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CommonInteractManager;
}
void __Monitor_OnPlayerWaitReborn(FMS_CommonInteractManager &inout Model, const FECSEntity &inout Entity, const FC_LevelEntryInteractPresentationTag &inout Component)
{
    Model.Monitor_OnPlayerWaitReborn(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_WaitInteractOthersPageHandle()
{
    return 0;
}
}
