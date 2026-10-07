
namespace FMS_UILayerBlocker
{
    const int ModelId = 0;

}
struct FMS_UILayerBlocker : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;

    FMS_UILayerBlocker()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_UILayerBlocker(const FMS_UILayerBlocker &inout Other)
    {
        return;
    }
    FMS_UILayerBlocker opAssign(const FMS_UILayerBlocker &inout Other)
    {
        FMS_UILayerBlocker __r;
        return __r;
    }
    void MonitorCutScene(const FC_CutSceneLogicData &inout CutScene)
    {
        if (CutScene)
        {
            FEUIWidget::BlockLayoutWidgets(this.GetManager(), EEUILayoutLayer(4));
            return;
        }
        FEUIWidget::UnblockLayoutWidgets(this.GetManager(), EEUILayoutLayer(4));
        return;
    }
}

namespace FMS_UILayerBlocker
{
FMS_UILayerBlocker& Get(const UObject ContextObject)
{
    return FMS_UILayerBlocker::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_UILayerBlocker GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_UILayerBlocker __r;
    TEUIModelRef<FMS_UILayerBlocker> local_6 = TEUIModelRef<FMS_UILayerBlocker>(EUIInternal::MakeModelWithManager(Manager, FMS_UILayerBlocker::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__MonitorCutScene";
    local_14.ComponentType = FC_CutSceneLogicData;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_UILayerBlocker;
}
void __MonitorCutScene(FMS_UILayerBlocker &inout Model, const FECSEntity &inout Entity, const FC_CutSceneLogicData &inout Component)
{
    Model.MonitorCutScene(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
}
