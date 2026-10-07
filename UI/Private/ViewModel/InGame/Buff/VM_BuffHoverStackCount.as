
namespace FVM_BuffHoverStackCount
{
    const int ModelId = 0;

}
struct FVM_BuffHoverStackCount : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_WidgetStack;
    UPROPERTY()
    int m_MaxStack;
    UPROPERTY()
    int m_BuffStack;

    FVM_BuffHoverStackCount()
    {
        this.m_WidgetStack = 0;
        this.m_MaxStack = 0;
        this.m_BuffStack = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BuffHoverStackCount' by default constructor.");
        return;
    }
    FVM_BuffHoverStackCount(const FVM_BuffHoverStackCount &inout Other)
    {
        this.m_WidgetStack = 0;
        this.m_MaxStack = 0;
        this.m_BuffStack = 0;
        this.m_WidgetStack = int(Other.m_WidgetStack);
        this.m_MaxStack = int(Other.m_MaxStack);
        this.m_BuffStack = int(Other.m_BuffStack);
        return;
    }
    FVM_BuffHoverStackCount(const int InWidgetStack, const int InMaxStack, const int InBuffStack)
    {
        this.m_WidgetStack = 0;
        this.m_MaxStack = 0;
        this.m_BuffStack = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetWidgetStack(InWidgetStack);
        this.SetMaxStack(InMaxStack);
        this.SetBuffStack(InBuffStack);
        return;
    }
    FVM_BuffHoverStackCount opAssign(const FVM_BuffHoverStackCount &inout Other)
    {
        FVM_BuffHoverStackCount __r;
        this.m_WidgetStack = int(Other.m_WidgetStack);
        this.m_MaxStack = int(Other.m_MaxStack);
        this.m_BuffStack = int(Other.m_BuffStack);
        return __r;
    }
    int GetStackShowType() const
    {
        if (this.GetBuffStack() >= this.GetWidgetStack())
        {
            return 1;
        }
        return 0;
    }
    bool GetStackShow() const
    {
        if (this.GetWidgetStack() > this.GetMaxStack())
        {
            return false;
        }
        return true;
    }
    int GetWidgetStack() const property
    {
        this.TrackPropertyRead(0);
        return this.m_WidgetStack;
    }
    void SetWidgetStack(const int __Value) property
    {
        if (this.m_WidgetStack == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_WidgetStack = __Value;
        return;
    }
    int GetMaxStack() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MaxStack;
    }
    void SetMaxStack(const int __Value) property
    {
        if (this.m_MaxStack == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MaxStack = __Value;
        return;
    }
    int GetBuffStack() const property
    {
        this.TrackPropertyRead(2);
        return this.m_BuffStack;
    }
    void SetBuffStack(const int __Value) property
    {
        if (this.m_BuffStack == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_BuffStack = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BuffHoverStackCount
{
    UPROPERTY()
    int StackShowType;
    UPROPERTY()
    bool StackShow;
    UPROPERTY()
    TEUIModelRef<FVM_BuffHoverStackCount> Self;


}

namespace FVM_BuffHoverStackCount
{
FVM_BuffHoverStackCount& Create(const UObject ContextObject, const int WidgetStack, const int MaxStack, const int BuffStack)
{
    return FVM_BuffHoverStackCount::CreateByManager(EUIInternal::GetContextManager(ContextObject), WidgetStack, MaxStack, BuffStack);
}
FVM_BuffHoverStackCount CreateByManager(const UEUIManagerSubsystem Manager, const int WidgetStack, const int MaxStack, const int BuffStack)
{
    FVM_BuffHoverStackCount __r;
    TEUIModelRef<FVM_BuffHoverStackCount> local_6 = TEUIModelRef<FVM_BuffHoverStackCount>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BuffHoverStackCount::ModelId, 0, WidgetStack, MaxStack, BuffStack));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "StackShowType";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "StackShow";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BuffHoverStackCount>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BuffHoverStackCount;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BuffHoverStackCount;
}
int __UIGetter_StackShowType(const FVM_BuffHoverStackCount &inout Model)
{
    return Model.GetStackShowType();
}
bool __UIGetter_StackShow(const FVM_BuffHoverStackCount &inout Model)
{
    return Model.GetStackShow();
}
TEUIModelRef<FVM_BuffHoverStackCount> __UIGetter_Self(const FVM_BuffHoverStackCount &inout Model)
{
    return TEUIModelRef<FVM_BuffHoverStackCount>(Model);
}
int __IndexOf_WidgetStack()
{
    return 0;
}
int __IndexOf_MaxStack()
{
    return 1;
}
int __IndexOf_BuffStack()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_BuffHoverStackCount
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
