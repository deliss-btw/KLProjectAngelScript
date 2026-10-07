
namespace FVM_TaskPanel
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnEntrySelected = FEUIModelCallbackSignature();

}
struct FVM_TaskPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<FEUIModelRef> m_TaskList;
    UPROPERTY()
    TArray<FEUIModelRef> m_TaskTargetList;
    UPROPERTY()
    FEUIModelRef m_TaskRewardList;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_TaskGroupEntryWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_TaskEntryWidgetClass;
    UPROPERTY()
    TEUIModelRef<FM_Task> m_SelectedTask;

    FVM_TaskPanel()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_TaskPanel(const FVM_TaskPanel &inout Other)
    {
        this.m_TaskList = Other.m_TaskList;
        this.m_TaskTargetList = Other.m_TaskTargetList;
        this.m_TaskRewardList = Other.m_TaskRewardList;
        this.m_TaskGroupEntryWidgetClass = Other.m_TaskGroupEntryWidgetClass;
        this.m_TaskEntryWidgetClass = Other.m_TaskEntryWidgetClass;
        this.m_SelectedTask = Other.m_SelectedTask;
        return;
    }
    FVM_TaskPanel& opAssign(const FVM_TaskPanel &inout Other)
    {
        this.m_TaskList = Other.m_TaskList;
        this.m_TaskTargetList = Other.m_TaskTargetList;
        this.m_TaskRewardList = Other.m_TaskRewardList;
        this.m_TaskGroupEntryWidgetClass = Other.m_TaskGroupEntryWidgetClass;
        this.m_TaskEntryWidgetClass = Other.m_TaskEntryWidgetClass;
        return Other.m_SelectedTask;
    }
    void LoadConfig(const FConfigVM_TaskPanel &inout InConfig)
    {
        this.SetTaskEntryWidgetClass(InConfig.TaskEntryWidgetClass);
        this.SetTaskGroupEntryWidgetClass(InConfig.TaskGroupEntryWidgetClass);
        return;
    }
    void PostConstruct()
    {
        TEUIModelRef<FM_Commission> local_4 = ::FMS_CommissionGameplayData::Get(this.GetContext().Manager).GetCurrentCommission();
        TEUIModelRef<FM_Commission> local_2;
        if (local_2.IsValid())
        {
            TDataObjectPtr<FDropItemConfigBase> local_30 = local_2.opArrow().GetCommissionConfig().opArrow().GetCommissionReward();
            if (local_30)
            {
                ::FCommonRewardListBuilder::BuildFromDropConfig(local_30);
                this.SetTaskRewardList(FEUIModelRef());
            }
        }
        return;
    }
    void OnBindToWidget()
    {
        int local_16 = 0;
        TEUIModelRef<FM_Commission> local_4 = ::FMS_CommissionGameplayData::Get(this.GetContext().Manager).GetCurrentCommission();
        TEUIModelRef<FM_Commission> local_2;
        if (local_2.IsValid())
        {
            FM_Task& local_8 = ::FM_Task::Create(this.GetContext().Manager, ETaskDataSource(1), local_2);
            this.AddTask(TEUIModelRef<FM_Task>(local_8));
            this.SetSelectedTask(TEUIModelRef<FM_Task>(local_8));
            int local_11 = 0;
            for (; local_11 < local_8.GetTaskTargetNum(); )
            {
                TEUIModelRef<FM_Task> local_10 = TEUIModelRef<FM_Task>(local_8);
                this.GetModify_TaskTargetList().Add(FEUIModelRef(local_16));
                ++local_11;
            }
        }
        return;
    }
    bool IsEmpty() const
    {
        return this.GetTaskList().IsEmpty();
    }
    FText GetTitle() const
    {
        FM_Task& local_4;
        TEUIModelRef<FM_Task> local_2 = this.GetSelectedTask();
        if (local_4)
        {
            return local_4.GetTaskTitle();
        }
        return FText();
    }
    FText GetDesc() const
    {
        FM_Task& local_4;
        TEUIModelRef<FM_Task> local_2 = this.GetSelectedTask();
        if (local_4)
        {
            return local_4.GetTaskDetailShort();
        }
        return FText();
    }
    FText GetDetail() const
    {
        FM_Task& local_4;
        TEUIModelRef<FM_Task> local_2 = this.GetSelectedTask();
        if (local_4)
        {
            return local_4.GetTaskDetailLong();
        }
        return FText();
    }
    void OnEntrySelected(const int Index)
    {
        return;
    }
    TArray<FEUIModelRef> GetTaskChildren(const FEUIModelRef &inout Task) const
    {
        TArray<FEUIModelRef> local_4;
        int local_44 = 0;
        Get local_14;
        FVM_TaskGroup& local_16 = local_14.opCall();
        if (local_16)
        {
            for (auto& local_32 : local_16.GetTaskList())
            {
                local_32;
                TSoftClassPtr<UUserWidget> local_42 = this.GetTaskEntryWidgetClass();
                local_4.Add(FEUIModelRef(local_44));
            }
        }
        return local_4;
    }
    void AddTask(const TEUIModelRef<FM_Task> &inout Task)
    {
        int local_20 = 0;
        int local_2 = int(GetDataSource());
        if (local_2 <= 1)
        {
            if (local_2 != 1)
            {
                return;
            }
            else
            {
                FVM_TaskGroup& local_6 = ::FVM_TaskGroup::Create(this.GetContext().Manager, Task);
                TSoftClassPtr<UUserWidget> local_16 = this.GetTaskGroupEntryWidgetClass();
                FEUIModelRef local_18 = FEUIModelRef(local_6);
                this.GetModify_TaskList().Add(FEUIModelRef(local_20));
                return;
            }
        }
        return;
    }
    const TArray<FEUIModelRef> GetTaskList() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_TaskList() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTaskList(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TaskList = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetTaskTargetList() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_TaskTargetList() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTaskTargetList(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TaskTargetList = __Value;
        return;
    }
    const FEUIModelRef GetTaskRewardList() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIModelRef GetModify_TaskRewardList() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTaskRewardList(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TaskRewardList = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetTaskGroupEntryWidgetClass() const property
    {
        this.TrackPropertyRead(3);
        return this.m_TaskGroupEntryWidgetClass;
    }
    void SetTaskGroupEntryWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_TaskGroupEntryWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TaskGroupEntryWidgetClass = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetTaskEntryWidgetClass() const property
    {
        this.TrackPropertyRead(4);
        return this.m_TaskEntryWidgetClass;
    }
    void SetTaskEntryWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_TaskEntryWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TaskEntryWidgetClass = __Value;
        return;
    }
    TEUIModelRef<FM_Task> GetSelectedTask() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SelectedTask;
    }
    void SetSelectedTask(const TEUIModelRef<FM_Task> &inout __Value) property
    {
        TEUIModelRef<FM_Task> local_2;
        local_2 = this.m_SelectedTask;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SelectedTask = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TaskPanel
{
    UPROPERTY()
    bool IsEmpty;
    UPROPERTY()
    FText Title;
    UPROPERTY()
    FText Desc;
    UPROPERTY()
    FText Detail;
    UPROPERTY()
    TEUIModelRef<FVM_TaskPanel> Self;


}

namespace FVM_TaskPanel
{
FVM_TaskPanel& Create(const UObject ContextObject)
{
    return FVM_TaskPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TaskPanel CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_TaskPanel __r;
    TEUIModelRef<FVM_TaskPanel> local_6 = TEUIModelRef<FVM_TaskPanel>(EUIInternal::MakeModelWithManager(Manager, FVM_TaskPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TaskList";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TaskTargetList";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TaskRewardList";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEmpty";
    local_14.TypeName = "bool";
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
    local_14.PropertyName = "Detail";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TaskPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TaskPanel;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnBindToWidget";
    local_24.DirtyFlags.Set(FVM_TaskPanel::__IndexOf_TaskGroupEntryWidgetClass());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TaskPanel;
}
void __OnBindToWidget(FVM_TaskPanel &inout Model)
{
    Model.OnBindToWidget();
    return;
}
TArray<FEUIModelRef> __UIGetter_TaskList(const FVM_TaskPanel &inout Model)
{
    return Model.GetTaskList();
}
TArray<FEUIModelRef> __UIGetter_TaskTargetList(const FVM_TaskPanel &inout Model)
{
    return Model.GetTaskTargetList();
}
FEUIModelRef __UIGetter_TaskRewardList(const FVM_TaskPanel &inout Model)
{
    return Model.GetTaskRewardList();
}
bool __UIGetter_IsEmpty(const FVM_TaskPanel &inout Model)
{
    return Model.IsEmpty();
}
FText __UIGetter_Title(const FVM_TaskPanel &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Desc(const FVM_TaskPanel &inout Model)
{
    return Model.GetDesc();
}
FText __UIGetter_Detail(const FVM_TaskPanel &inout Model)
{
    return Model.GetDetail();
}
TEUIModelRef<FVM_TaskPanel> __UIGetter_Self(const FVM_TaskPanel &inout Model)
{
    return TEUIModelRef<FVM_TaskPanel>(Model);
}
int __IndexOf_TaskList()
{
    return 0;
}
int __IndexOf_TaskTargetList()
{
    return 1;
}
int __IndexOf_TaskRewardList()
{
    return 2;
}
int __IndexOf_TaskGroupEntryWidgetClass()
{
    return 3;
}
int __IndexOf_TaskEntryWidgetClass()
{
    return 4;
}
int __IndexOf_SelectedTask()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_TaskPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
