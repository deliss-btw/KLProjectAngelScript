
namespace FVM_Task
{
    const int ModelId = 0;

}
struct FVM_Task : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Task> m_Task;

    FVM_Task()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_Task' by default constructor.");
        return;
    }
    FVM_Task(const FVM_Task &inout Other)
    {
        this.m_Task = Other.m_Task;
        return;
    }
    FVM_Task(const TEUIModelRef<FM_Task> &inout InTask)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTask(InTask);
        return;
    }
    FVM_Task& opAssign(const FVM_Task &inout Other)
    {
        return Other.m_Task;
    }
    FText GetTitle() const
    {
        TEUIModelRef<FM_Task> local_2 = this.GetTask();
        FText local_6;
        local_6.GetTaskTitle();
        return local_6;
    }
    FText GetDesc() const
    {
        TEUIModelRef<FM_Task> local_2 = this.GetTask();
        FText local_6;
        local_6.GetTaskDesc();
        return local_6;
    }
    bool IsCompleted() const
    {
        TEUIModelRef<FM_Task> local_2 = this.GetTask();
        return IsCompleted();
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
}

struct __GeneratedProperties_FVM_Task
{
    UPROPERTY()
    FText Title;
    UPROPERTY()
    FText Desc;
    UPROPERTY()
    bool IsCompleted;
    UPROPERTY()
    TEUIModelRef<FVM_Task> Self;


}

namespace FVM_Task
{
FVM_Task& Create(const UObject ContextObject, const TEUIModelRef<FM_Task> &inout Task)
{
    return FVM_Task::CreateByManager(EUIInternal::GetContextManager(ContextObject), Task);
}
FVM_Task CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Task> &inout Task)
{
    FVM_Task __r;
    TEUIModelRef<FVM_Task> local_6 = TEUIModelRef<FVM_Task>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Task::ModelId, 0, Task));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Desc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsCompleted";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Task>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Task;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Task;
}
FText __UIGetter_Title(const FVM_Task &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Desc(const FVM_Task &inout Model)
{
    return Model.GetDesc();
}
bool __UIGetter_IsCompleted(const FVM_Task &inout Model)
{
    return Model.IsCompleted();
}
TEUIModelRef<FVM_Task> __UIGetter_Self(const FVM_Task &inout Model)
{
    return TEUIModelRef<FVM_Task>(Model);
}
int __IndexOf_Task()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_Task
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
