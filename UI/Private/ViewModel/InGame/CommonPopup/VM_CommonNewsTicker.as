
namespace FVM_CommonNewsTicker
{
    const int ModelId = 0;

}
struct FVM_CommonNewsTicker : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Content;
    UPROPERTY()
    int m_RepeatCount;
    UPROPERTY()
    bool m_bTickerEnd;

    FVM_CommonNewsTicker()
    {
        this.m_RepeatCount = 1;
        this.m_bTickerEnd = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonNewsTicker' by default constructor.");
        return;
    }
    FVM_CommonNewsTicker(const FVM_CommonNewsTicker &inout Other)
    {
        this.m_RepeatCount = 1;
        this.m_bTickerEnd = false;
        this.m_Content = Other.m_Content;
        this.m_RepeatCount = int(Other.m_RepeatCount);
        this.m_bTickerEnd = Other.m_bTickerEnd;
        return;
    }
    FVM_CommonNewsTicker(const FText &inout InContent, const int InRepeatCount)
    {
        this.m_RepeatCount = 1;
        this.m_bTickerEnd = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetContent(InContent);
        this.SetRepeatCount(InRepeatCount);
        return;
    }
    FVM_CommonNewsTicker opAssign(const FVM_CommonNewsTicker &inout Other)
    {
        FVM_CommonNewsTicker __r;
        this.m_Content = Other.m_Content;
        this.m_RepeatCount = int(Other.m_RepeatCount);
        this.m_bTickerEnd = Other.m_bTickerEnd;
        return __r;
    }
    FText GetContent() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Content() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetContent(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Content = __Value;
        return;
    }
    int GetRepeatCount() const property
    {
        this.TrackPropertyRead(1);
        return this.m_RepeatCount;
    }
    void SetRepeatCount(const int __Value) property
    {
        if (this.m_RepeatCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RepeatCount = __Value;
        return;
    }
    bool GetbTickerEnd() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bTickerEnd;
    }
    void SetbTickerEnd(const bool __Value) property
    {
        if (!(this.m_bTickerEnd) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bTickerEnd = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonNewsTicker
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonNewsTicker> Self;

    __GeneratedProperties_FVM_CommonNewsTicker()
    {
        return;
    }
}

namespace FVM_CommonNewsTicker
{
FVM_CommonNewsTicker& Create(const UObject ContextObject, const FText &inout Content, const int RepeatCount)
{
    return FVM_CommonNewsTicker::CreateByManager(EUIInternal::GetContextManager(ContextObject), Content, RepeatCount);
}
FVM_CommonNewsTicker CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Content, const int RepeatCount)
{
    FVM_CommonNewsTicker __r;
    TEUIModelRef<FVM_CommonNewsTicker> local_6 = TEUIModelRef<FVM_CommonNewsTicker>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonNewsTicker::ModelId, 0, Content, RepeatCount));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Content";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonNewsTicker>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonNewsTicker;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonNewsTicker;
}
FText __UIGetter_Content(const FVM_CommonNewsTicker &inout Model)
{
    return Model.GetContent();
}
TEUIModelRef<FVM_CommonNewsTicker> __UIGetter_Self(const FVM_CommonNewsTicker &inout Model)
{
    return TEUIModelRef<FVM_CommonNewsTicker>(Model);
}
int __IndexOf_Content()
{
    return 0;
}
int __IndexOf_RepeatCount()
{
    return 1;
}
int __IndexOf_bTickerEnd()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CommonNewsTicker
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
