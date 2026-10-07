
namespace FVM_SegmentBarItem
{
    const int ModelId = 0;

}
struct FSegmentBarItemData
{
    UPROPERTY()
    FText Nop;
    UPROPERTY()
    bool IsFinish;


}

struct FVM_SegmentBarItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Nop;
    UPROPERTY()
    bool m_IsFinish;

    FVM_SegmentBarItem()
    {
        this.m_IsFinish = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SegmentBarItem' by default constructor.");
        return;
    }
    FVM_SegmentBarItem(const FVM_SegmentBarItem &inout Other)
    {
        this.m_IsFinish = false;
        this.m_Nop = Other.m_Nop;
        this.m_IsFinish = Other.m_IsFinish;
        return;
    }
    FVM_SegmentBarItem(const FText &inout InNop, const bool InIsFinish)
    {
        this.m_IsFinish = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetNop(InNop);
        this.SetIsFinish(InIsFinish);
        return;
    }
    FVM_SegmentBarItem opAssign(const FVM_SegmentBarItem &inout Other)
    {
        FVM_SegmentBarItem __r;
        this.m_Nop = Other.m_Nop;
        this.m_IsFinish = Other.m_IsFinish;
        return __r;
    }
    const FText GetNop() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Nop() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetNop(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Nop = __Value;
        return;
    }
    bool GetIsFinish() const property
    {
        this.TrackPropertyRead(1);
        return this.m_IsFinish;
    }
    void SetIsFinish(const bool __Value) property
    {
        if (!(this.m_IsFinish) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_IsFinish = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SegmentBarItem
{
    UPROPERTY()
    TEUIModelRef<FVM_SegmentBarItem> Self;

    __GeneratedProperties_FVM_SegmentBarItem()
    {
        return;
    }
}

namespace FVM_SegmentBarItem
{
FVM_SegmentBarItem& Create(const UObject ContextObject, const FText &inout Nop, const bool IsFinish)
{
    return FVM_SegmentBarItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Nop, IsFinish);
}
FVM_SegmentBarItem CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Nop, const bool IsFinish)
{
    FVM_SegmentBarItem __r;
    TEUIModelRef<FVM_SegmentBarItem> local_6 = TEUIModelRef<FVM_SegmentBarItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SegmentBarItem::ModelId, 0, Nop, IsFinish));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "IsFinish";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SegmentBarItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SegmentBarItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SegmentBarItem;
}
bool __UIGetter_IsFinish(const FVM_SegmentBarItem &inout Model)
{
    return Model.GetIsFinish();
}
TEUIModelRef<FVM_SegmentBarItem> __UIGetter_Self(const FVM_SegmentBarItem &inout Model)
{
    return TEUIModelRef<FVM_SegmentBarItem>(Model);
}
int __IndexOf_Nop()
{
    return 0;
}
int __IndexOf_IsFinish()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_SegmentBarItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
