
namespace FVM_TaskGroup
{
    const int ModelId = 0;

}
struct FVM_TaskGroup : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Task> m_Task;
    UPROPERTY()
    TArray<FEUIModelRef> m_TaskList;

    FVM_TaskGroup()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TaskGroup' by default constructor.");
        return;
    }
    FVM_TaskGroup(const FVM_TaskGroup &inout Other)
    {
        this.m_Task = Other.m_Task;
        this.m_TaskList = Other.m_TaskList;
        return;
    }
    FVM_TaskGroup(const TEUIModelRef<FM_Task> &inout InTask)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTask(InTask);
        return;
    }
    FVM_TaskGroup& opAssign(const FVM_TaskGroup &inout Other)
    {
        this.m_Task = Other.m_Task;
        return Other.m_TaskList;
    }
    void PostConstruct()
    {
        TEUIModelRef<FM_Task> local_2 = this.GetTask();
        FEUIModelRef local_4;
        this.GetModify_TaskList().Add(local_4);
        return;
    }
    FText GetTitle() const
    {
        TEUIModelRef<FM_Task> local_2 = this.GetTask();
        FText local_6;
        local_6.GetGroupTitle();
        return local_6;
    }
    FText GetDesc() const
    {
        TEUIModelRef<FM_Task> local_2 = this.GetTask();
        FText local_6;
        local_6.GetGroupDesc();
        return local_6;
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
    const TArray<FEUIModelRef> GetTaskList() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_TaskList() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTaskList(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TaskList = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TaskGroup
{
    UPROPERTY()
    FText Title;
    UPROPERTY()
    FText Desc;
    UPROPERTY()
    TEUIModelRef<FVM_TaskGroup> Self;

    __GeneratedProperties_FVM_TaskGroup()
    {
        return;
    }
}

namespace FVM_TaskGroup
{
FVM_TaskGroup& Create(const UObject ContextObject, const TEUIModelRef<FM_Task> &inout Task)
{
    return FVM_TaskGroup::CreateByManager(EUIInternal::GetContextManager(ContextObject), Task);
}
FVM_TaskGroup CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Task> &inout Task)
{
    FVM_TaskGroup __r;
    TEUIModelRef<FVM_TaskGroup> local_6 = TEUIModelRef<FVM_TaskGroup>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TaskGroup::ModelId, 0, Task));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TaskList";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
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
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TaskGroup>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TaskGroup;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TaskGroup;
}
TArray<FEUIModelRef> __UIGetter_TaskList(const FVM_TaskGroup &inout Model)
{
    return Model.GetTaskList();
}
FText __UIGetter_Title(const FVM_TaskGroup &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Desc(const FVM_TaskGroup &inout Model)
{
    return Model.GetDesc();
}
TEUIModelRef<FVM_TaskGroup> __UIGetter_Self(const FVM_TaskGroup &inout Model)
{
    return TEUIModelRef<FVM_TaskGroup>(Model);
}
int __IndexOf_Task()
{
    return 0;
}
int __IndexOf_TaskList()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TaskGroup
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
