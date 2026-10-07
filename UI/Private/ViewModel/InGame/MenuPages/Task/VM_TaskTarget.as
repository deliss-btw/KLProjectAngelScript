
namespace FVM_TaskTarget
{
    const int ModelId = 0;

}
struct FVM_TaskTarget : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Task> m_Task;
    UPROPERTY()
    int m_TargetIndex;

    FVM_TaskTarget()
    {
        this.m_TargetIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TaskTarget' by default constructor.");
        return;
    }
    FVM_TaskTarget(const FVM_TaskTarget &inout Other)
    {
        this.m_TargetIndex = 0;
        this.m_Task = Other.m_Task;
        this.m_TargetIndex = int(Other.m_TargetIndex);
        return;
    }
    FVM_TaskTarget(const TEUIModelRef<FM_Task> &inout InTask, const int InTargetIndex)
    {
        this.m_TargetIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTask(InTask);
        this.SetTargetIndex(InTargetIndex);
        return;
    }
    FVM_TaskTarget opAssign(const FVM_TaskTarget &inout Other)
    {
        FVM_TaskTarget __r;
        this.m_Task = Other.m_Task;
        this.m_TargetIndex = int(Other.m_TargetIndex);
        return __r;
    }
    bool IsCompleted() const
    {
        TEUIModelRef<FM_Task> local_2 = this.GetTask();
        return this.GetTargetIndex().IsTaskTargetCompleted();
    }
    FText GetDesc() const
    {
        int local_3 = this.GetTargetIndex();
        TEUIModelRef<FM_Task> local_2 = this.GetTask();
        FText local_8;
        local_8.GetTaskTargetDesc(local_3);
        return local_8;
    }
    FText GetProgress() const
    {
        int local_3 = this.GetTargetIndex();
        TEUIModelRef<FM_Task> local_2 = this.GetTask();
        FText local_8;
        local_8.GetTaskTargetProgress(local_3);
        return local_8;
    }
    TEUIModelRef<FM_Task> GetTask() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Task;
    }
    void SetTask(const TEUIModelRef<FM_Task> &inout __Value) property
    {
        TEUIModelRef<FM_Task> local_2;
        local_2 = this.m_Task;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Task = __Value;
        return;
    }
    int GetTargetIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TargetIndex;
    }
    void SetTargetIndex(const int __Value) property
    {
        if (this.m_TargetIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TargetIndex = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TaskTarget
{
    UPROPERTY()
    bool IsCompleted;
    UPROPERTY()
    FText Desc;
    UPROPERTY()
    FText Progress;
    UPROPERTY()
    TEUIModelRef<FVM_TaskTarget> Self;


}

namespace FVM_TaskTarget
{
FVM_TaskTarget& Create(const UObject ContextObject, const TEUIModelRef<FM_Task> &inout Task, const int TargetIndex)
{
    return FVM_TaskTarget::CreateByManager(EUIInternal::GetContextManager(ContextObject), Task, TargetIndex);
}
FVM_TaskTarget CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Task> &inout Task, const int TargetIndex)
{
    FVM_TaskTarget __r;
    TEUIModelRef<FVM_TaskTarget> local_6 = TEUIModelRef<FVM_TaskTarget>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TaskTarget::ModelId, 0, Task, TargetIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "IsCompleted";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Desc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Progress";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TaskTarget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TaskTarget;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TaskTarget;
}
bool __UIGetter_IsCompleted(const FVM_TaskTarget &inout Model)
{
    return Model.IsCompleted();
}
FText __UIGetter_Desc(const FVM_TaskTarget &inout Model)
{
    return Model.GetDesc();
}
FText __UIGetter_Progress(const FVM_TaskTarget &inout Model)
{
    return Model.GetProgress();
}
TEUIModelRef<FVM_TaskTarget> __UIGetter_Self(const FVM_TaskTarget &inout Model)
{
    return TEUIModelRef<FVM_TaskTarget>(Model);
}
int __IndexOf_Task()
{
    return 0;
}
int __IndexOf_TargetIndex()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TaskTarget
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
