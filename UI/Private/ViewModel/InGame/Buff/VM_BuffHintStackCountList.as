
namespace FVM_BuffHintStackCountList
{
    const int ModelId = 0;

}
struct FVM_BuffHintStackCountList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_MaxStack;
    UPROPERTY()
    int m_CurStack;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_BuffHoverStackCount>> m_StackCounts;

    FVM_BuffHintStackCountList()
    {
        this.m_MaxStack = 0;
        this.m_CurStack = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BuffHintStackCountList' by default constructor.");
        return;
    }
    FVM_BuffHintStackCountList(const FVM_BuffHintStackCountList &inout Other)
    {
        this.m_MaxStack = 0;
        this.m_CurStack = 0;
        this.m_MaxStack = int(Other.m_MaxStack);
        this.m_CurStack = int(Other.m_CurStack);
        this.m_StackCounts = Other.m_StackCounts;
        return;
    }
    FVM_BuffHintStackCountList(const int InMaxStack, const int InCurStack)
    {
        this.m_MaxStack = 0;
        this.m_CurStack = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMaxStack(InMaxStack);
        this.SetCurStack(InCurStack);
        return;
    }
    FVM_BuffHintStackCountList& opAssign(const FVM_BuffHintStackCountList &inout Other)
    {
        this.m_MaxStack = int(Other.m_MaxStack);
        this.m_CurStack = int(Other.m_CurStack);
        return Other.m_StackCounts;
    }
    void PostConstruct()
    {
        int local_1 = 0;
        for (; local_1 < this.GetMaxStack(); )
        {
            this.GetModify_StackCounts().Add(TEUIModelRef<FVM_BuffHoverStackCount>(::FVM_BuffHoverStackCount::Create(this.GetContext().Manager, local_1 + 1, this.GetMaxStack(), this.GetCurStack())));
            ++local_1;
        }
        return;
    }
    int GetMaxStack() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MaxStack;
    }
    void SetMaxStack(const int __Value) property
    {
        if (this.m_MaxStack == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MaxStack = __Value;
        return;
    }
    int GetCurStack() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurStack;
    }
    void SetCurStack(const int __Value) property
    {
        if (this.m_CurStack == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurStack = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_BuffHoverStackCount>> GetStackCounts() const property
    {
        const TArray<TEUIModelRef<FVM_BuffHoverStackCount>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_BuffHoverStackCount>> GetModify_StackCounts() property
    {
        TArray<TEUIModelRef<FVM_BuffHoverStackCount>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetStackCounts(const TArray<TEUIModelRef<FVM_BuffHoverStackCount>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_StackCounts = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BuffHintStackCountList
{
    UPROPERTY()
    TEUIModelRef<FVM_BuffHintStackCountList> Self;

    __GeneratedProperties_FVM_BuffHintStackCountList()
    {
        return;
    }
}

namespace FVM_BuffHintStackCountList
{
FVM_BuffHintStackCountList& Create(const UObject ContextObject, const int MaxStack, const int CurStack)
{
    return FVM_BuffHintStackCountList::CreateByManager(EUIInternal::GetContextManager(ContextObject), MaxStack, CurStack);
}
FVM_BuffHintStackCountList CreateByManager(const UEUIManagerSubsystem Manager, const int MaxStack, const int CurStack)
{
    FVM_BuffHintStackCountList __r;
    TEUIModelRef<FVM_BuffHintStackCountList> local_6 = TEUIModelRef<FVM_BuffHintStackCountList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BuffHintStackCountList::ModelId, 0, MaxStack, CurStack));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "StackCounts";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_BuffHoverStackCount>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BuffHintStackCountList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BuffHintStackCountList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BuffHintStackCountList;
}
TArray<TEUIModelRef<FVM_BuffHoverStackCount>> __UIGetter_StackCounts(const FVM_BuffHintStackCountList &inout Model)
{
    return Model.GetStackCounts();
}
TEUIModelRef<FVM_BuffHintStackCountList> __UIGetter_Self(const FVM_BuffHintStackCountList &inout Model)
{
    return TEUIModelRef<FVM_BuffHintStackCountList>(Model);
}
int __IndexOf_MaxStack()
{
    return 0;
}
int __IndexOf_CurStack()
{
    return 1;
}
int __IndexOf_StackCounts()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_BuffHintStackCountList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
