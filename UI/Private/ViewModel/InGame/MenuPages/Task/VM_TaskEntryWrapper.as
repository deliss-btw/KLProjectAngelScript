
namespace FVM_TaskEntryWrapper
{
    const int ModelId = 0;

}
struct FVM_TaskEntryWrapper : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIModelRef m_TaskEntry;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> m_TaskEntryWidgetClass;

    FVM_TaskEntryWrapper()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TaskEntryWrapper' by default constructor.");
        return;
    }
    FVM_TaskEntryWrapper(const FVM_TaskEntryWrapper &inout Other)
    {
        this.m_TaskEntry = Other.m_TaskEntry;
        this.m_TaskEntryWidgetClass = Other.m_TaskEntryWidgetClass;
        return;
    }
    FVM_TaskEntryWrapper(const FEUIModelRef &inout InTaskEntry, const TSoftClassPtr<UUserWidget> &inout InTaskEntryWidgetClass)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTaskEntry(InTaskEntry);
        this.SetTaskEntryWidgetClass(InTaskEntryWidgetClass);
        return;
    }
    FVM_TaskEntryWrapper& opAssign(const FVM_TaskEntryWrapper &inout Other)
    {
        this.m_TaskEntry = Other.m_TaskEntry;
        return Other.m_TaskEntryWidgetClass;
    }
    const FEUIModelRef GetTaskEntry() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_TaskEntry() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTaskEntry(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TaskEntry = __Value;
        return;
    }
    TSoftClassPtr<UUserWidget> GetTaskEntryWidgetClass() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TaskEntryWidgetClass;
    }
    void SetTaskEntryWidgetClass(const TSoftClassPtr<UUserWidget> &inout __Value) property
    {
        if ((this.m_TaskEntryWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TaskEntryWidgetClass = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TaskEntryWrapper
{
    UPROPERTY()
    TEUIModelRef<FVM_TaskEntryWrapper> Self;

    __GeneratedProperties_FVM_TaskEntryWrapper()
    {
        return;
    }
}

namespace FVM_TaskEntryWrapper
{
FVM_TaskEntryWrapper& Create(const UObject ContextObject, const FEUIModelRef &inout TaskEntry, const TSoftClassPtr<UUserWidget> &inout TaskEntryWidgetClass)
{
    return FVM_TaskEntryWrapper::CreateByManager(EUIInternal::GetContextManager(ContextObject), TaskEntry, TaskEntryWidgetClass);
}
FVM_TaskEntryWrapper CreateByManager(const UEUIManagerSubsystem Manager, const FEUIModelRef &inout TaskEntry, const TSoftClassPtr<UUserWidget> &inout TaskEntryWidgetClass)
{
    FVM_TaskEntryWrapper __r;
    TEUIModelRef<FVM_TaskEntryWrapper> local_6 = TEUIModelRef<FVM_TaskEntryWrapper>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TaskEntryWrapper::ModelId, 0, TaskEntry, TaskEntryWidgetClass));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TaskEntry";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TaskEntryWidgetClass";
    local_14.TypeName = "TSoftClassPtr<UUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TaskEntryWrapper>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TaskEntryWrapper;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TaskEntryWrapper;
}
FEUIModelRef __UIGetter_TaskEntry(const FVM_TaskEntryWrapper &inout Model)
{
    return Model.GetTaskEntry();
}
TSoftClassPtr<UUserWidget> __UIGetter_TaskEntryWidgetClass(const FVM_TaskEntryWrapper &inout Model)
{
    return Model.GetTaskEntryWidgetClass();
}
TEUIModelRef<FVM_TaskEntryWrapper> __UIGetter_Self(const FVM_TaskEntryWrapper &inout Model)
{
    return TEUIModelRef<FVM_TaskEntryWrapper>(Model);
}
int __IndexOf_TaskEntry()
{
    return 0;
}
int __IndexOf_TaskEntryWidgetClass()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TaskEntryWrapper
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
